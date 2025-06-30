h50359
s 00997/00000/00000
d D 1.1 83/03/15 22:27:27 rrs 1 0
c date and time created 83/03/15 22:27:27 by rrs
e
u
U
t
T
I 1
subroutine ddaret (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device driver for ADM 3A with Retro-Graphics           #
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
#            dcaret - change color on Retrographics terminal           #
#            xy40xx - output x,y coordinate on 40xx terminal           #
#            mult   - multiply 2 16-bit numbers                        #
#            dm40xx - 40xx marker emulation routine                    #
#            ttyout - put a character to device                        #
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
define(`UP',VT)                             # Up arrow key
define(`DOWN',LF)                           # Down arrow key
define(`LEFT',BS)                           # Left arrow key
define(`RIGHT',FF)                          # Right arrow key
define(`CHANGExRATE',RS)                    # Home key toggles cursor movement
#ifdef(`UNIX',`define(`ttyin',`gdevin')')
#ifdef(`UNIX',`define(`ttyout',`gdevot')')
integer contrl(1),intin(1),ptsin(1),intout(1),ptsout(1)
 
SHORTINT opcode
integer alfamd(6), i, j, index, gimnmx, xy(4), 
	ginok, chrhgt, line(8), xhi, xlo, yhi, ylo, booboo(2), 
	lodcur(4), setup(4), itemp, chrwid, ichar, 
	celwid, celhgt, muldiv, ermode(3),
	erscrn(2), erslin(2), entgrf(3),
	extgrf(2), k, row, column,
        poscur(8), rate, xcoord, ycoord, yincr(2), xincr(2),
        xtemp, ytemp, admrow

integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), clrflg, ginrow, gincol
integer writmd

logical qdone, qfirst, qtext

include(`ddcom')

common/aret/writmd, ccltb
 
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
equivalence (ginrow, poscur(5)), (gincol, poscur(6))
 
data celwid /14/    # Char cell width in raster space
data celhgt /20/    # Char cell height in raster space
data chrwid /12/    # Actual char width 
data chrhgt /18/    # Actual char height 
data yincr/ 3, 15/  # y increments for gin
data xincr/ 2, 10/  # x increments for gin

#    erase to end of screen
data erscrn /ESC, BIGY/

#    erase to end of line
data erslin /ESC, BIGT/
 
#   enter graphics mode from alpha cursor mode
data entgrf /GS, US, NEWLINE/

#   exit graphics mode into alpha cursor mode
data extgrf /CAN, NEWLINE/

#    put back in alpha mode
data alfamd /4*SYN,US,NEWLINE/
 
#    booboo
data booboo /BELL, NEWLINE/

#    load cursor 
data lodcur /ESC, EQUALS, 0, 0/

#    position cursor for gin
data poscur/CAN, NEWLINE, ESC, EQUALS, 0, 0, BELL, NEWLINE/

#    setup - initialize device
data setup /CAN, GS, US, NEWLINE/
 
#    erase mode
data ermode/ESC, 0, NEWLINE/
 
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

      row = 1            # default row and column position are 1,1
      column = 1
      qtext = .false.    # text position is current
      writmd = REPLACExMODE   # default writing mode is REPLACE

      intout(1) = XxLIMITSx4010   # Addressable width in rasters of screen
      intout(2) = YxLIMITSx4010   # Addressable height in rasters of screen
      intout(3) = OTHER  # Device coordinates in raster units

      # micrometers per raster along the x axis
      #   the screen area is 15.24 cm high and 20.32 cm wide therefore
      #   the raster size is 203000/1024 in x and 152000/780 in y
      intout(4) = 198
      intout(5) = 195
      intout(6) = 1      # Number of character heights
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
      ptsout(2) = chrhgt  # Minimum character height in device coordinates
      ptsout(3) = 0
      ptsout(4) = chrhgt  # Maximum character height in device coordinates
      ptsout(5) = 1     # Minimum line width in NDC space
      ptsout(6) = 0
      ptsout(7) = 1     # Maximum line width in NDC space
      ptsout(8) = 0
      ptsout(9) = 0
      ptsout(10) = 9   # Minimum marker height in NDC space
      ptsout(11) = 0
      ptsout(12) = 9   # Maximum marker height in NDC space

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

      # put device in retrographics mode
 
      call gioini (1)           # initialize i/o system for crt device
      call gdstot (4, setup)
   }

#
#  opcode CLOSExWORKSTATION
#
else if (opcode == CLOSExWORKSTATION) {
      call ttyout (CAN)
      call ttyout (NEWLINE)
      call giostp               # close i/o system
      }

#
#  opcode CLEARxWORKSTATION
#
else if (opcode == CLEARxWORKSTATION) {
      call ttyout (ESC)
      call ttyout (FF)
      # send SYNCs to the device to give it time to clear the screen
      for (i=1; i<=100; i=i+1) call ttyout (SYN)
      }

# 
#  opcode UPDATExWORKSTATION
#
else if (opcode == UPDATExWORKSTATION) {
      call ttyout (NEWLINE)
      }

#
#  opcode ESCAPE
#
else if (opcode == ESCAPE) {
     if (qtext) {  # graphic text moved the alpha cursor
        lodcur(3) = row + 31    # offset row by 31 for ADM addressing
        lodcur(4) = column + 31
        call gdstot (4, lodcur)
        qtext = .false.     # clear flag
        }
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
	if (row > 1) {  # prevent addressing above the screen
           call ttyout (VT)
           row = row - 1
           }
	}
     else if (opcode == CURSORxDOWN)  {
	if (row < 24) { # prevent addressing below the screen
           call ttyout (LF)
           row = row + 1
           }
	}
     else if (opcode == CURSORxRIGHT)  {
	if (column < 80) { # prevent addressing off the screen
           call ttyout (FF)
           column = column + 1
           }
	}
     else if (opcode == CURSORxLEFT)  {
        if (column > 1) { # prevent addressing off the screen
           call ttyout (BS)
           column = column - 1
           }
	}
     else if (opcode == HOMExCURSOR)  {
	call ttyout (RS)
        row = 1
        column = 1
	}
     else if (opcode == ERASExTOxENDxOFxSCREEN)  {
	call gdstot (2, erscrn)
	}
     else if (opcode == ERASExTOxENDxOFxLINE)  {
	call gdstot (2, erslin)
	}
     else if (opcode == DIRECTxCURSORxADDRESS)  {
        row = gimnmx (intin(1), 1, 24)
        column = gimnmx (intin(2), 1, 80)
        lodcur(3) = row + 31  # offset the row number by 31 for ADM addressing
        lodcur(4) = column + 31
        call gdstot (4, lodcur)
	}
     else if (opcode == OUTPUTxCURSORxADDRESSABLExTEXT) {
        call gdstot (contrl(4), intin)
        column = gimnmx (column+contrl(4), 1, 80)   # update cursor position
	}
     else if (opcode == INQUIRExCURRENTxCURSORxADDRESS)  {
        intout(1) = row
        intout(2) = column
	}
     }

#
#  opcode POLYLINE
# 
else if (opcode == POLYLINE) {
   call dcaret(ndclrl)    # set device to current line color

   if (ndlntp > 1) {  # emulate the dash patterns
      call dmdash (contrl(2), ptsin)
      }

   else {
      j = 1
      call ttyout (GS)              # Move to first point
      for (i=1; i<=contrl(2); i=i+1) {
         call xy40xx (ptsin(j), ptsin(j+1))
         j = j + 2
         }
      call gdstot (6, alfamd)   # Put back in alpha mode
      }
   }
# 
#  opcode polymarker 
#
else if (opcode == POLYMARKER) {
   call dcaret(ndclrm)    # set device to current marker color
      
   j = 1
   for (i=1; i<=contrl(2); i=i+1) {
      xy(1) = ptsin(j)    # x coordinate of marker
      xy(2) = ptsin(j+1)  # y coordinate of marker 
      call dm40xx (xy)
      call gdstot (6, alfamd)   # Put back in alpha mode
      j = j + 2
      }
   }

#
#  opcode text
#
else if (opcode == TEXT) {
   call dcaret(ndclrt)   # set device for current text color

   call ttyout (GS)                  # Do a move to point to output text
   call xy40xx (ptsin(1), ptsin(2))
   call gdstot (6, alfamd)           # Put back in alpha mode
   call gdstot (contrl(4), intin)
   qtext = .true.   # graphic text may have moved the alpha cursor
   }
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   call dcaret(ndclrf)      # set device for current fill color

   j = 1
   call ttyout (GS)                   # Move to first point
   for (i=1; i<=contrl(2); i=i+1) {
      call xy40xx (ptsin(j), ptsin(j+1))
      j = j + 2
      }
   call gdstot (6, alfamd)            # Put back in alpha mode
   }
#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {

   # This device can't do pixel arrays very easily, so outline the area
   # in the current line color

   call dcaret (ndclrl)              # Change color to line color
   call ttyout (ESC)                 # Set line type to solid
   call ttyout (ACCENT)

   xlo = ptsin(1)
   ylo = ptsin(2)
   xhi = ptsin(3)
   yhi = ptsin(4)
   call ttyout (GS)
   call xy40xx (xlo, ylo)
   call xy40xx (xhi, ylo)
   call xy40xx (xhi, yhi)
   call xy40xx (xlo, yhi)
   call xy40xx (xlo, ylo)
   call gdstot (6, alfamd)           # Put back in alpha mode

   call ttyout (ESC)                 # Restore line type
   call ttyout (ndlntp)
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
      contrl(3) = 2                    # Set the number vertices
      ptsout(1) = chrwid       # Return values selected
      ptsout(2) = chrhgt 
      ptsout(3) = celwid
      ptsout(4) = celhgt
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
      ndlntp = gimnmx (intin(1), 0, 5)
      intout(1) = ndlntp
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
   contrl(5) = NONE       # initialize status to not succussful
   i = intin(1)           # check locator device for validity
   if (i != DEFAULT & i != CROSSHAIRS) return

   xcoord = ptsin (1)
   ycoord = ptsin (2)

   #  We will move the alpha cursor to the beginning GIN position
   #    as a visual mechanism.
   #  gincol = x position in 512 space divided by 6.4. 
   #  ptsin values are in 1024 space, so we must convert them to 512 space
   #  add 31 for the offset for cursor addressing
   gincol = muldiv ((xcoord+1), 10, 128) + 31

   #  ginrow  equals y position * (82/256)/10.4
   admrow = muldiv(ycoord, 82, 256)

   #  offset the ginrow value by 24 since the Y data started at the bottom
   #  of the CRT and the ADM addresses from the top. Also offset by 31 for
   #  the ASCII value for ADM cursor addressing. (55 = 24 + 31) 
   ginrow = 55 - muldiv(admrow, 10, 104)
   call gdstot (8, poscur)      # output the ADM alpha cursor position

   # now update cursor as user hits arrow keys
   # stop when a non-cursor movement key is hit

   rate = 2      # initial movement is in large increments
   qdone = .false.     # we're not done yet
   qfirst = .true.     # treat the first point differently
   ichar = 0       # initialize ichar to zero to clear the bits. Routines
                   # ttyin and ttyout only use one byte on some systems, even
                   # though ichar is 2 bytes.

   repeat {
      if (!qfirst) {   # update the graphics cursor
         call ttyout (GS)   # prepare for graphic move
         call xy40xx (xcoord, ycoord)
         call gdstot (6, alfamd) #put ADM back in 4010 Alpha mode to show cursor
         }
      call ttyin (ichar)
      if (qfirst) {  # After the first cursor movement, 
                     # move the alpha cursor to the home position
         call ttyout(CAN)    # first go to ADM alpha mode
         call ttyout(RS)     # move the cursor to the home position
         qfirst = .false.
         }

      xtemp = 0
      ytemp = 0
      if       (ichar == UP)     ytemp =  yincr(rate)
      else if   (ichar == DOWN)  ytemp = -yincr(rate)
      else if   (ichar == LEFT)  xtemp = -xincr(rate)
      else if   (ichar == RIGHT) xtemp =  xincr(rate)
      else if   (ichar == CHANGExRATE)  rate = 3 - rate
      else  { qdone = .true.  }

      # keep graphics within range of device capability
      xcoord = gimnmx (xcoord+xtemp, 0, XxLIMITSx4010)
      ycoord = gimnmx (ycoord+ytemp, 0, YxLIMITSx4010)

      } until (qdone)

   contrl(3) = 1   # 1 point was input
   contrl(5) = 1   # 1 value is being output in array intout
   intout(1) = ichar
   ptsout(1) = xcoord
   ptsout(2) = ycoord
   qtext = .true.   # alpha cursor position has been changed
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
	 if (k == NO) call ttyin (j)   # Get character without echo
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
   if (opcode == ERASExMODE)  {
      ermode(2) = DEL
      writmd = ERASExMODE
      }
   else {
      ermode(2) = LETA
      writmd = REPLACExMODE
      }
   call gdstot (3, ermode)      # Set the proper writing mode
   intout(1) = writmd           # Return writing mode selected
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
 
   call ttyout (GS) # Move to first point
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
	 call ttyout (GS)
	 call xy40xx (x1,y2)
         call xy40xx (x2,y1)
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
	 call ttyout (GS)
         rxy2 = y1 + hsize
	 call xy40xx (x1,rxy2)
         call xy40xx (x2,rxy2)
	 call ttyout (GS)
         rxy1 = x1 + hsize
	 call xy40xx (rxy1,y1)
         call xy40xx (rxy1,y2)
         }
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
subroutine dcaret (color)
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
#     Function: Set color mode for subsequent output for ADM           #
#                                                                      #
#     Input Parameters:                                                #
#           color - color table index                                  #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - Output a character string to the device          #
#                                                                      #
########################################################################
 
integer cmode(3), writmd, color, ccltb(2)

include(`ddcom')

common/aret/ writmd, ccltb

data cmode/ ESC, 0, NEWLINE/
 
if (color != ndclrp & writmd == 1) {  # we need to update the device's color

   if (ccltb(color+1) == 0) cmode(2) = DEL
   else cmode(2) = LETA
 
   call gdstot (3, cmode)
   ndclrp = color
   }
 
   return
end
subroutine dmdash (count, pline)
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
#     Function: Device driver dash emulation for the ADM 3A            #
#                                                                      #
#     Input Parameters:                                                #
#            count   -   number of vertices in array pline             #
#            pline   -   start/end points of dash polylines            #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#             xy40xx - output x,y coordinate on a 40xx like terminal   #
#                                                                      #
########################################################################
#local defines
define(`DASH_INCREMENT',`30')
 
integer count, pline(1)
 
integer actary(16), action, j, k, kk, l, n
integer dx, dy, adx, ady, newx, newy, oldx, oldy, numpnt, endx, endy,
        temp, xincr, adx2, ady2, d, xend, startx, starty
integer mult
logical qchang
 
include(`ddcom')
 
#action definitions for line styles 2-5: 0=move, 1=draw, 2=point
data actary / 2, 2, 2, 2,  2, 0, 1, 2,  1, 0, 1, 0,  0, 1, 1, 0 /
   # Index into the action array, same for all vectors
   k = mult (ndlntp-2, 4) + 1
   l = 3    
   # Pointer into input array 
   oldx = pline(1)
   oldy = pline(2)
   startx = oldx
   starty = oldy
   for (n=2; n<=count; n=n+1) { # For each vector in the polyline
      j = 0    # Always reset the pattern when starting a new vector
      numpnt = 0  # Initialize number of pixels in a pattern segment
      endx = pline(l)      # End point of vector
      endy = pline(l+1)
      dx = endx - oldx     # Determine the dx (run) and dy (rise) for the vector
      dy = endy - oldy
      adx = iabs (dx)      # Absolute run
      ady = iabs (dy)      # Absolute rise
      qchang = .false.
      if (ady > adx)  {    # Switch the points if rise is greater than run
	 temp = oldx       # Switch start x and y
	 oldx = oldy
	 oldy = temp
	 temp = startx 
	 startx = starty
	 starty = temp
	 temp = endx       # Switch end x and y
	 endx = endy
	 endy = temp
	 temp = adx        # Switch absolute rise and run
	 adx = ady
	 ady = temp
	 qchang = .true.   # Indicate that switches have occurred
	 }

      adx2 = mult (2, adx) # Double absolute run and rise of vector
      ady2 = mult (2, ady)
      temp = ady2 - adx2

      xincr = 1            # Set stepping direction (positive slope)
      if (isign(1,dx) != isign(1,dy))  xincr = -1  # line has negative slope

      # Always step from bottom of vector to top
      if (oldy <= endy)  { # Determine starting position (positive slope)
	 newx = oldx
	 newy = oldy
	 xend = endx
	 }
      else {
	 newx = endx       # Negative slope
	 newy = endy
	 xend = oldx
	 oldx = endx       # Insure that initial move is correct
	 oldy = endy
	 }
      d = -adx + ady  # Compute initial error
      for (; newx != xend;)  {
	 if (d < 0)  {
	    d = d + ady2
	    }
	 else {
	    d = d + temp   # temp = ady2 - adx2
	    newy = newy + 1
	    }
         newx = newx + xincr
	 numpnt = numpnt + 1
	 if (numpnt == DASH_INCREMENT) {  # Put out a piece of the vector
	    # May need to reset pattern segment count
	    if (j > 3) j = 0

	    kk = k + j  # Determine exact action to be done
	    action = actary(kk)  # Get the action
	    if (action == 0)  {  # Reset the end points for the move
	       }
	    else if (action == 1) { # Draw a dash
	       if (qchang) {
                  call ttyout (GS)
	          call xy40xx (oldy, oldx)
	          call xy40xx (newy, newx)
		  }
	       else {
                  call ttyout (GS)
	          call xy40xx (oldx, oldy)
	          call xy40xx (newx, newy)
		  }
	       }
	    else {  # Draw a dot
	       if (qchang) {
                  call ttyout (GS)
	          call xy40xx (newy, newx)  
	          call xy40xx (newy, newx)  
	          }     			 
	       else {
                  call ttyout (GS)
	          call xy40xx (newx, newy) 
	          call xy40xx (newx, newy) 
		  }
               }

	    oldx = newx  # Get ready for next pattern segment
            oldy = newy
	    numpnt = 0
	    j = j + 1  # Increment pattern segment count
	    }  # End of a pattern segment
         } # End of a vector

	 #  Need to make sure we ended the vector properly
	 #  But may need to flip the end points back around
	 if (qchang) {
	    temp = endx
	    endx = endy
	    endy = temp
	    temp = oldx
	    oldx = oldy
	    oldy = temp
	    temp = startx
	    startx = starty
	    starty = temp
	    }
	 if (j > 3) j = 0   # Reset pattern segment if necessary
	 kk = k + j
	 if (actary(kk) == 1 ) {
            call ttyout (GS)
	    call xy40xx (oldx, oldy)
	    if (xincr == -1)   { call xy40xx (startx, starty) }
	    else               { call xy40xx (endx, endy) }
	    }
         call ttyout (GS)
	 call xy40xx (endx, endy)
	 l = l + 2          # Increment index for next vector
	 oldx = endx        # Next vector starts where previous one left off
	 oldy = endy
	 startx = oldx
	 starty = oldy
      } # End of all polylines

   return
end
E 1
