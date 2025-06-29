h40983
s 00853/00000/00000
d D 1.1 83/03/17 15:47:27 tes 1 0
c date and time created 83/03/17 15:47:27 by tes
e
u
4
U
t
T
I 1
subroutine ddvret (contrl, intin, ptsin, intout, ptsout)
########################################################################
#                                                                      #
#          THIS MATERIAL IS CONFIDENTIAL AND IS FURNISHED UNDER        #
#          A WRITTEN LICENSE AGREEMENT.  IT MAY NOT BE USED,           #
#          COPIED OR DISCLOSED TO OTHERS EXCEPT IN ACCORDANCE          #
#          WITH THE TERMS OF THAT AGREEMENT.                           #
#                                                                      #
#          COPYRIGHT (C) 1982 GRAPHIC SOFTWARE SYSTEMS INC.            #
#          ALL RIGHTS RESERVED.                                        #
#                                                                      #
#     Function: Device driver for VT100 with Retrographics             #
#                                                                      #
#     Input Parameters:                                                #
#            contrl      - An integer array with following information #
#                          contrl(1) - opcode for driver function      #
#                          contrl(2) - number of vertices in array     #
#                                      ptsin. Each vertex consists of  #
#                                      an x and a y coordinate so the  #
#                                      length of this array is twice as#
#                                      long as the number of vertices  #
#                                      specified.                      #
#                          contrl(4) - length of integer array intin   #
#            contrl(6-n) - Opcode dependent information                #
#                                                                      #
#            intin   -     Array of integer input parameters           #
#            ptsin   -     Array of input coordinate data              #
#                                                                      #
#     Output Parameters:                                               #
#            contrl(3)   - number of vertices in array ptsout          #
#                          Each vertex consists of an x and a y        #
#                          coordinate so the length of this array is   #
#                          twice as long as the number of vertices     # 
#                          specified.                                  #
#            contrl(5)   - length of integer array intout              #
#            contrl(6-n) - Opcode dependent information                #
#                                                                      #
#            intout  -     Array of integer output parameters          #
#            ptsout  -     Array of output coordinate data             #
#                                                                      #
#     Routines Called:                                                 #
#            dcvret - change color on Retrographics terminal           #
#            xy40xx - output x,y coordinate on 40xx terminal           #
#            mult   - multiply 2 16-bit numbers                        #
#            dm40xx - 40xx marker emulation routine                    #
#            gdevot - put a character to device                        #
#            gdstin - get a string from the current device             #
#            gdstot - output a string to the current device            #
#            gimnmx - bound an integer variable                        #
#            gitoch - convert integer to character string              #
#            gchtoi - convert character string to integer              #
#                                                                      #
########################################################################
 
define(`XxLIMITSx4010',1023)
define(`YxLIMITSx4010',779)
define(`DEFAULT',1)                         # Default input device
define(`CROSSHAIRS',2)                      # Crosshairs input device
define(`REPLACExMODE',1)                    # Replace writing mode
define(`XORxMODE',3)                        # Xor writing mode
define(`ERASExMODE',4)                      # Erase writing mode
define(`STRINGxINPUT',4)                    # String input class

integer contrl(1),intin(1),ptsin(1),intout(1),ptsout(1)
 
SHORTINT opcode
integer alfamd(2), clrwrk(5), i, j, index, gimnmx, xy(4), tries,
	ginok, chrhgt(4), hgtin, line(8), xhi, xlo, yhi, ylo, booboo(2), 
	lodcur(4), enable(4), setup(5), itemp, chrwid(4), xcoord, ycoord,
	celwid(4), celhgt(4), curup(3), curdwn(3), currgt(3), curlft(3),
	curhom(3), erscrn(3), erslin(3), revon(4), revoff(4), entgrf(3),
	extgrf(2), inqcur(5), k, gitoch

integer mult

integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), clrflg

include(`ddcom')

common /cmvret/ ccltb, sclrd, sclgr, sclbl, clrflg
 
# The following equivalence statements are used to decrease the amount of code
#    necessary to access specific array elements. The arrays and the
#    variables equivalenced are listed below:
#
#       line(2) :: xhi
#       line(3) :: xlo
#       line(4) :: yhi
#       line(5) :: ylo
equivalence (line(2), xhi), (line(3), xlo), (line(4), yhi), (line(5), ylo)
equivalence (xcoord, xy(1)) , (ycoord, xy(2))
 
data celwid /13, 26, 39, 51/    # Char cell width in raster space
data celhgt /23, 46, 71, 98/    # Char cell height in raster space
data chrwid / 9, 17, 26, 34/    # Actual char width 2/3 * celwid
data chrhgt /14, 28, 43, 59/    # Actual char height .6 * celhgt

#    move cursor up 1 row  
data curup /ESC, LBRACK, BIGA/

#    move cursor down 1 row
data curdwn /ESC, LBRACK, BIGB/

#    move cursor right 1 row
data currgt /ESC, LBRACK, BIGC/

#    move cursor left 1 row
data curlft /ESC, LBRACK, BIGD/
 
#    move cursor home (upper left hand corner of screen)
data curhom / ESC, LBRACK, BIGH/

#    erase to end of screen
data erscrn /ESC, LBRACK, BIGJ/

#    erase to end of line
data erslin /ESC, LBRACK, BIGK/
 
#    reverse video on
data revon /ESC, LBRACK, DIG7, LETM/

#    reverse video off
data revoff /ESC, LBRACK, DIG0, LETM/

#   enter graphics mode from alpha cursor mode
data entgrf /GS, US, NEWLINE/

#   exit graphics mode into alpha cursor mode
data extgrf /CAN, NEWLINE/

#    inquire current cursor address
data inqcur /ESC, LBRACK, DIG6, LETN, NEWLINE/

#    put back in alpha mode
data alfamd /US,NEWLINE/
 
#    booboo
data booboo /BELL, NEWLINE/

#    load cursor 
data lodcur /ESC, SLASH, LETF, NEWLINE/
 
#    clear workstation and enquire status to keep from overflowing
data clrwrk /ESC, FF, ESC, ENQ, NEWLINE/

#    enable GIN
data enable /BELL, ESC, SUB, NEWLINE/
 
#    setup - initialize device
data setup /GS, US, ESC, 0, NEWLINE/
 
 
contrl(3) = 0    # Initialize ptsout count to zero (0)

opcode = contrl(OPCODE)    # Obtain a local copy of the current opcode

# 
#  opcode open workstation
# 
if (opcode == OPENxWORKSTATION) {
 
      contrl(3) = 6                       # Set to number of vertices in ptsout
      contrl(5) = 45                      # Set to number of output parameters  
      
      ndlntp = intin(2)                       # Set current device line style
      if (ndlntp < 1 | ndlntp > 5) ndlntp = 1
      ndlntp = ndlntp + UNDERLINE             # Save actual ascii character
      ndclrl = gimnmx (intin(3), 0, 1)        # current polyline color
      ndmktp = intin(4)                       # Set current polymarker type
      if (ndmktp < 1 | ndmktp > 5) ndmktp = 3 # use default
      ndclrm = gimnmx (intin(5), 0, 1)        # current polymarker color
      ndclrt = gimnmx (intin(7), 0, 1)        # current text color              
      ndclrf = gimnmx (intin(10), 0, 1)       # current fill area color
      ndclrp = -1                             # no current color   
      ndlcmd = REQUESTxMODE                   # locator input mode is request
      ndvlmd = REQUESTxMODE                   # valuator input mode is request
      ndchmd = REQUESTxMODE                   # choice input mode is request
      ndstmd = REQUESTxMODE                   # string input mode is request

      intout(1) = XxLIMITSx4010   # Addressable width in rasters of screen
      intout(2) = YxLIMITSx4010   # Addressable height in rasters of screen
      intout(3) = OTHER  # Device coordinates in raster units

      # micrometers per raster along the x axis
      #   the screen area is 15.24 cm high and 20.32 cm wide therefore
      #   the raster size is 203000/1024 in x and 152000/780 in y
      intout(4) = 198
      intout(5) = 195
      intout(6) = 4      # Number of character heights
      intout(7) = 5      # Number of line types
      intout(8) = 1      # Number of line widths
      intout(9) = 5      # Number of marker types
      intout(10) = 1      # Number of marker height
      intout(11) = 1     # Number of fonts
      intout(12) = 0     # Number of patterns
      intout(13) = 0     # Number of hatch styles
      intout(14) = 2     # Number of predefined colors
      intout(15) = 0     # Number of GDPs      
      do i = 16,25 {
	 intout(i) = -1    # List of GDPs
	 intout(i+10) = -1 # List of associated bundle tables
	 }
      intout(36) = MONOCHROME  # Color capability flag
      intout(37) = NO          # Text rotation capability flag
      intout(38) = NO          # Fill area capability flag
      intout(39) = NO          # Pixel operation capability flag
      intout(40) = 2           # Number of available colors
      intout(41) = 1           # Number of locator devices
      intout(42) = 0           # Number of valuator devices
      intout(43) = 0           # Number of choice devices
      intout(44) = 1           # Number of string devices
      intout(45) = 2           # Workstation type 

      ptsout(1) = 0
      ptsout(2) = chrhgt(1)  # Minimum character height in device coordinates
      ptsout(3) = 0
      ptsout(4) = chrhgt(4)  # Maximum character height in device coordinates
      ptsout(5) = 1     # Minimum line width in NDC space
      ptsout(6) = 0
      ptsout(7) = 1     # Maximum line width in NDC space
      ptsout(8) = 0
      ptsout(9) = 0
      ptsout(10) = 12   # Minimum marker height in NDC space
      ptsout(11) = 0
      ptsout(12) = 12   # Maximum marker height in NDC space

      # initialize predefined color table
      ccltb(1) = 0   # Current color table
      ccltb(2) = 1000
      # the user set color table, in case of inquiry
      sclrd(1) = 0
      sclrd(2) = 1000
      sclgr(1) = 0
      sclgr(2) = 1000
      sclbl(1) = 0
      sclbl(2) = 1000
      # initialize color representation flag
      clrflg = NO   

      # put device in retrographics mode, and
      # set the line style to the current style
 
      call gioini (1)           # initialize i/o system for crt device
      setup(4) = ndlntp         # set line style
      call gdstot (5, setup)
   }

#
#  opcode CLOSExWORKSTATION
#
else if (opcode == CLOSExWORKSTATION) {
      call gdevot (CAN)
      call gdevot (NEWLINE)
      call giostp               # close i/o system
      }

#
#  opcode CLEARxWORKSTATION
#
else if (opcode == CLEARxWORKSTATION) {
      call gdstot (5, clrwrk)
      call gdstin (6, line, i)
      }

# 
#  opcode UPDATExWORKSTATION
#
else if (opcode == UPDATExWORKSTATION) {
      call gdevot (NEWLINE)
      }

#
#  opcode ESCAPE
#
else if (opcode == ESCAPE) {
     opcode = contrl(6)  # Get the escape sub opcode
     if (opcode == INQUIRExADDRESSABLExCELLS) {
	intout(1) = 24
	intout(2) = 80
	}
     else if (opcode == ENTERxGRAPHICSxMODE)  {
	call gdstot (3, entgrf)
	}
     else if (opcode == EXITxGRAPHICSxMODE)  {
	call gdstot (2, extgrf)
	}
     else if (opcode == CURSORxUP)  {
	call gdstot (3, curup)
	}
     else if (opcode == CURSORxDOWN)  {
	call gdstot (3, curdwn)
	}
     else if (opcode == CURSORxRIGHT)  {
	call gdstot (3, currgt)
	}
     else if (opcode == CURSORxLEFT)  {
	call gdstot (3, curlft)
	}
     else if (opcode == HOMExCURSOR)  {
	call gdstot (3, curhom)
	}
     else if (opcode == ERASExTOxENDxOFxSCREEN)  {
	call gdstot (3, erscrn)
	}
     else if (opcode == ERASExTOxENDxOFxLINE)  {
	call gdstot (3, erslin)
	}
     else if (opcode == DIRECTxCURSORxADDRESS)  {
	call gdstot (2, curhom)   #  Position cursor command
	i = gimnmx (intin(1), 1, 24)  # Set the row
	j = gitoch (i, line, 2, k)
	call gdstot (j, line)
	call gdevot (SEMICOL)
	i = gimnmx (intin(2), 1, 80)  # Set the column
	j = gitoch (i, line, 2, k)
	call gdstot (j, line)
	call gdevot (BIGH)
	}
     else if (opcode == OUTPUTxCURSORxADDRESSABLExTEXT) {
	call gdstot (contrl(4), intin)
	}
     else if (opcode == REVERSExVIDEOxON)  {
	call gdstot (4, revon)
	}
     else if (opcode == REVERSExVIDEOxOFF)  {
	call gdstot (4, revoff)
	}
     else if (opcode == INQUIRExCURRENTxCURSORxADDRESS)  {
	call gdstot (5, inqcur)
        call gdevin (i)                     # Skip first 2 chars ESC [
	call gdevin (i)
	i = 0
	repeat {                            # Read until terminator, R is found
           call gdevin (j)
	   i = i + 1
	   line(i) = j
	   } until (j == BIGR)
	call gchtoi (line, 1, intout(1), j)  # Convert row number
	j = j + 1                            # Bypass terminator in string
	call gchtoi (line, j, intout(2), i)  # Convert column number
	}
     }

#
#  opcode POLYLINE
# 
else if (opcode == POLYLINE) {
   call dcvret (ndclrl)      # change color to current line color

   j = 1
   call gdevot (GS)              # Move to first point
   for (i=1; i<=contrl(2); i=i+1) {
      call xy40xx (ptsin(j), ptsin(j+1))
      j = j + 2
      }
   call gdstot (2, alfamd)   # Put back in alpha mode
   }

# 
#  opcode polymarker 
#
else if (opcode == POLYMARKER) {
   call dcvret (ndclrm)       # change color to current marker color
      
   call gdevot (ESC)
   call gdevot (ACCENT)      # Set solid line style

   j = 1
   for (i=1; i<=contrl(2); i=i+1) {
      xy(1) = ptsin(j)    # x coordinate of marker
      xy(2) = ptsin(j+1)  # y coordinate of marker 
      call dm40xx (xy)
      call gdstot (2, alfamd)   # Put back in alpha mode
      j = j + 2
      }

   call gdevot (ESC)
   call gdevot (ndlntp)                        # Restore current line style
   }

#
#  opcode text
#
else if (opcode == TEXT) {
   call dcvret (ndclrt)              # change color to current text color

   call gdevot (GS)                  # Do a move to point to output text
   call xy40xx (ptsin(1), ptsin(2))
   call gdstot (2, alfamd)           # Put back in alpha mode
   call gdstot (contrl(4), intin)
   }

#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   call dcvret (ndclrf)               # change color to current fill area color

   j = 1
   call gdevot (GS)                   # Move to first point
   for (i=1; i<=contrl(2); i=i+1) {
      call xy40xx (ptsin(j), ptsin(j+1))
      j = j + 2
      }
   call gdstot (2, alfamd)            # Put back in alpha mode
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {

   # This device can't do pixel arrays very easily, so outline the area
   # in the current line color

   call dcvret (ndclrl)              # Change color to line color
   call gdevot (ESC)                 # Set line type to solid
   call gdevot (ACCENT)

   xlo = ptsin(1)
   ylo = ptsin(2)
   xhi = ptsin(3)
   yhi = ptsin(4)
   call gdevot (GS)
   call xy40xx (xlo, ylo)
   call xy40xx (xhi, ylo)
   call xy40xx (xhi, yhi)
   call xy40xx (xlo, yhi)
   call xy40xx (xlo, ylo)
   call gdstot (2, alfamd)           # Put back in alpha mode

   call gdevot (ESC)                 # Restore line type
   call gdevot (ndlntp)
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
      hgtin = ptsin(2)                # Get requested height
      ndtxsz = 1
      repeat {
         if (chrhgt(ndtxsz) > hgtin) break
	 ndtxsz = ndtxsz + 1
         } until (ndtxsz > 4)
      ndtxsz = ndtxsz -1
      ndtxsz = gimnmx (ndtxsz, 1, 4)
      call gdevot (ESC)
      call gdevot (ndtxsz+SLASH)# character size is 1='0', 2='1', 3='2', 4='3'
      contrl(3) = 2                    # Set the number vertices
      ptsout(1) = chrwid (ndtxsz)      # Return values selected
      ptsout(2) = chrhgt (ndtxsz)
      ptsout(3) = celwid (ndtxsz)
      ptsout(4) = celhgt (ndtxsz)
   }

#
#  opcode color
#
else if (opcode == SETxCOLORxREPRESENTATION) {
      i = gimnmx (intin(1), 0, 1) + 1  # Map index 0-1 to 1-2

      clrflg = YES # Inform color routine that a representation
		   # has changed

      #  If all are set to 0, then he wants the background color
      j = intin(2) + intin(3) + intin(4)
      if (j == 0)  ccltb(i) = 0
      else  ccltb(i) = 1000  # The foreground color

      sclrd(i) = intin(2)  # This is what was set
      sclgr(i) = intin(3)
      sclbl(i) = intin(4)
      }

#
#  opcode set polyline linetype
#
else if (opcode == SETxPOLYLINExLINETYPE) {
      #  i = 1  ACCENT
      #      2  A
      #      3  B
      #      4  C
      #      5  D
      ndlntp = intin(1)
      if (ndlntp > 5) ndlntp = 1
      ndlntp = gimnmx (ndlntp, 1, 5) # 4012 has 5 line styles, 1-5
      intout(1) = ndlntp             # Return linestyle seleced
      ndlntp = ndlntp + UNDERLINE
      call gdevot (ESC)
      call gdevot (ndlntp)  
      }

#
#  opcode set polyline colour index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX) {
      ndclrl = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrl
      }

#
#  opcode set polymarker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
      ndmktp = intin(1)
      if (ndmktp < 1 | ndmktp > 5) ndmktp = 3   # Out of range defaults to 3
      intout(1) = ndmktp
      }

#
#  opcode set polymarker colour index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX) {
      ndclrm = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrm
      }

#
#  opcode set text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX) {
      ndclrt = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrt
      }

#
#  opcode set fill area color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
      ndclrf = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrf
      }
#
#  opcode inquire colour representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 1) + 1  # Map index 0-1 to 1-2
   intout(1) = i - 1  #  This is what we inquired on
   index = intin(2)   # Type of inquiry, 0=set, 1=realized
   if (index == 0)  {
      intout(2) = sclrd(i)
      intout(3) = sclgr(i)
      intout(4) = sclbl(i)
      }
   else {
      if (index == 1)  j = ccltb(i)  # inquire realized color
      intout(2) = j
      intout(3) = j
      intout(4) = j
      }
   }
 
#
#  opcode input locator 
#
else if (opcode == INPUTxLOCATOR) {
	contrl(5) = NONE             # Initialize status to not successful
	i = intin(1)                 # Check locator device for validity
	if (i != DEFAULT & i !=CROSSHAIRS) return

 	call gdevot (GS)             # Move to initial position
        call xy40xx (ptsin(1), ptsin(2))
        call gdstot (4, lodcur)
        ginok = OK
        tries = 0
        repeat {
                # enable thumbwheel gin
                call gdstot (4, enable)
                call gdstin (7, line, i)
                if (i <= 5) {  # make sure there are right number of chars
                        for (j=2; j<=i; j=j+1) {
                                # verify chars valid
                                if (line(j) < SPACE | line(j) > QMARK) {
                                        ginok = NONE
                                        call gdstot (2, booboo)
                                        }
                                }
                        }
                else {  # too many chars -- ooooops
                        ginok = NONE
                        call gdstot (2, booboo)
                        }
                tries = tries + 1
 
                } until (ginok == OK | tries > 3)
 
        # decode the data returned
 
	intout(1) = NONE

        if (ginok == OK) {

                contrl(5) = 1   # Set successful flag 
                contrl(3) = 1   # Set the number of output vertices 

                # Return the locator point
		ptsout(1) = mult ((xhi-SPACE), SPACE)+xlo-SPACE
                ptsout(2) = mult ((yhi-SPACE), SPACE)+ylo-SPACE
 
		# Return the locator input character
		intout(1) = line(1)
                }
        }

#
#  opcode input string
#
else if (opcode == INPUTxSTRING) {
   if (intin(1) != DEFAULT) {       # Check for valid string device
      contrl(5) = NONE
      return
      }
   ginok = NONE
   i = 0
   itemp = intin(2)                     # Save maximum size
   k = intin(3)                         # Save echo/noecho flag
      repeat {
	 if (k == NO) call gdevin (j)   # Get character without echo
	 else         call gchrin (j)   # Get character with echo
         if (j == NEWLINE) break
         if (i+1 > itemp) break         # No room in output array
         i = i + 1
         intout(i) = j
         }
   contrl(5) = i                        # Return request status
   }
 
#
#  opcode set writing mode
#
else if (opcode == SETxWRITINGxMODE) {
   opcode = intin(1)
   if (opcode == XORxMODE) {         # Device has xor
      j = XORxMODE
      k = 2                
      }
   else if (opcode == ERASExMODE) {  # Device has erase
      j = ERASExMODE
      k = 0
      }
   else {                            # Replace mode is default writing mode
      j = REPLACExMODE
      k = 1
      }
   intout(1) = j                # Return writing mode selected
   ndclrl = k                   # Set appropriate globals to reflect writing
   ndclrm = k                   #    mode
   ndclrf = k
   ndclrt = k
   }

#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = REQUESTxMODE     # Default mode is request
   }

return
end
subroutine dm40xx (intin)
########################################################################
#                                                                      #
#          THIS MATERIAL IS CONFIDENTIAL AND IS FURNISHED UNDER        #
#          A WRITTEN LICENSE AGREEMENT.  IT MAY NOT BE USED,           #
#          COPIED OR DISCLOSED TO OTHERS EXCEPT IN ACCORDANCE          #
#          WITH THE TERMS OF THAT AGREEMENT.                           #
#                                                                      #
#          COPYRIGHT (C) 1982 GRAPHIC SOFTWARE SYSTEMS INC.            #
#          ALL RIGHTS RESERVED.                                        #
#                                                                      #
#     Function: Place a marker at the current location on 40xx type    #
#               devices                                                #
#                                                                      #
#     Input Parameters:                                                #
#            intin   - x/y location for marker                         #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            xy40xx - TEK 40xx move/draw routine                       #
#                                                                      #
########################################################################
define(`MARKxPERIOD',`1')
define(`MARKxPLUS',`2')
define(`MARKxSTAR',`3')
define(`MARKxO',`4')
define(`MARKxX',`5')
define(`FULLSZ',`12')
define(`HALFSZ',`6')
define(`FPERSZ',`4')
define(`HPERSZ',`2')
 
integer intin(2)
 
integer fsize, hsize, x1, x2, y1, y2
integer rxy1, rxy2
 
include(`ddcom')
 
   if (ndmktp == MARKxPERIOD) {
      fsize = FPERSZ
      hsize = HPERSZ
      }
   else {
      fsize = FULLSZ
      hsize = HALFSZ
      }
 
   x1 = intin(1) - hsize        #clip marker to device limits
   x2 = x1 + fsize
   y1 = intin(2) - hsize
   y2 = y1 + fsize
   if ((min0(x1,y1) < 0) | (x2 > 1023) | (y2 > 779)) return
 
   # output appropriate marker centered on location
 
   call gdevot (GS) # Move to first point
   call xy40xx (x1,y1)

   if (ndmktp == MARKxPERIOD | ndmktp == MARKxO) {
      call xy40xx (x2,y1)
      call xy40xx (x2,y2)
      call xy40xx (x1,y2)
      call xy40xx (x1,y1)
      }
   else {
      if (ndmktp == MARKxX | ndmktp == MARKxSTAR) {
         call xy40xx (x2,y2)
	 call gdevot (GS)
	 call xy40xx (x1,y2)
         call xy40xx (x2,y1)
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
	 call gdevot (GS)
         rxy2 = y1 + hsize
	 call xy40xx (x1,rxy2)
         call xy40xx (x2,rxy2)
	 call gdevot (GS)
         rxy1 = x1 + hsize
	 call xy40xx (rxy1,y1)
         call xy40xx (rxy1,y2)
         }
      }

   return
end
subroutine dcvret(color)
######################################################################
#                                                                    #
#          THIS MATERIAL IS CONFIDENTIAL AND IS FURNISED UNDER       #
#          A WRITTEN LICENSE AGREEMENT. IT MAY NOT BE USED,          #
#          COPIED OR DISCLOSED TO OTHERS EXCEPT IN ACCORDANCE        #
#          WITH THE TERMS OF THAT AGREEMENT.                         #
#                                                                    #
#          COPYRIGHT (C) 1982 GRAPHIC SOFTWARE SYSTEMS INC.          #
#          ALL RIGHTS RESERVED                                       #
#                                                                    #
#     Function: Change the color on the retro-graphics terminal      #
#                                                                    #
#     Input Parameters:                                              #
#            color - color to change to                              #
#                                                                    #
#     Output Parameters:                                             #
#            none                                                    #
#                                                                    #
#     Routines called:                                               #
#            gdstot - output a string to the current device          #
#            gimnmx - minmax function                                #
#                                                                    #
######################################################################
integer color

SHORTINT i,j
integer fcolor(4), gimnmx

integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), clrflg

include(`ddcom')

common /cmvret/ ccltb, sclrd, sclgr, sclbl, clrflg
 
#       Set the foreground color
data fcolor/ ESC, SLASH, DIG0, LETD/

if (ndclrp != color | clrflg == YES) { # Does color need to be 
				       # changed
   ndclrp = color            # Set the current color
   clrflg = NO               # reset color flag

   # Actual color is logical inverse of specified color
   j = gimnmx (color, 0, 1) + 1 #Make sure color index in range
   i = ccltb(j)
   if      (i == 0) j = DIG1   # Use the background color
   else             j = DIG0   # Use the foreground color

   # XOR writing mode takes precedence over color
   # color index 2 is xor
   if (color == 2) j = DIG2  

   fcolor(3) = j
   call gdstot (4, fcolor)
   }
return
end
subroutine xy40xx (kx, ky)
########################################################################
#                                                                      #
#          THIS MATERIAL IS CONFIDENTIAL AND IS FURNISHED UNDER        #
#          A WRITTEN LICENSE AGREEMENT.  IT MAY NOT BE USED,           #
#          COPIED OR DISCLOSED TO OTHERS EXCEPT IN ACCORDANCE          #
#          WITH THE TERMS OF THAT AGREEMENT.                           #
#                                                                      #
#          COPYRIGHT (C) 1982 GRAPHIC SOFTWARE SYSTEMS INC.            #
#          ALL RIGHTS RESERVED.                                        #
#                                                                      #
#     Function: Convert 40xx x,y coordinate to hiy,loy,hix,lox bytes   #
#               and output them                                        #
#                                                                      #
#     Input Parameters:                                                #
#           kx       - x-coordinate in 0 to device dependent space     #
#           ky       - y-coorindate in 0 to device dependent space     #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - Output a character string to the device          #
#            divid  - divide 2 unsigned 16-bit numbers                 #
#                                                                      #
########################################################################
# local defines
define(`HIxY',`32')                    #Tek hi y tag
define(`LOxY',`96')                    #Tek lo y tag
define(`HIxX',`32')                    #Tek hi x tag
define(`LOxX',`64')                    #Tek lo x tag
define(`EXTRAxBYTE',`96')              #Tek extra byte tag
 
integer i, bytes(4), kx,ky, divid
 
include(`ddcom')
 
   bytes(1) = divid (ky, 32, i) + HIxY     #shift right 5 bits and set tag
   bytes(2) = i + LOxY                     #set lo bits and add lo tag
 
   bytes(3) = divid (kx, 32, i) + HIxX     #shift right 5 bits and set tag
   bytes(4) = i + LOxX                     #set lo bits and add lo tag
 
   call gdstot (4, bytes)
 
   return
end
E 1
