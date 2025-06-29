h42105
s 00929/00000/00000
d D 1.1 83/03/15 22:31:01 rrs 1 0
c date and time created 83/03/15 22:31:01 by rrs
e
u
U
t
T
I 1
subroutine dd4025 (contrl, intin, ptsin, intout, ptsout)
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
#            dc4025 - change color on Retrographics terminal           #
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
 
define(`XxLIMITSx4025',639)
define(`YxLIMITSx4025',419)
define(`DEFAULT',1)                         # Default input device
define(`CROSSHAIRS',2)                      # Crosshairs input device
define(`REPLACExMODE',1)                    # Replace writing mode
define(`XORxMODE',3)                        # Xor writing mode
define(`ERASExMODE',4)                      # Erase writing mode
define(`STRINGxINPUT',4)                    # String input class
define(`COMMANDxCHAR',94)                   # Command character

integer contrl(1),intin(1),ptsin(1),intout(1),ptsout(1)
 
SHORTINT opcode
integer alfamd(2), clrwrk(8), i, j, index, gimnmx, xy(4), 
	ginok, chrhgt, line(40), xhi, xlo, yhi, ylo, booboo(2), 
	enable(8), setup(26), itemp, chrwid, xcoord, ycoord,
	celwid, celhgt, curup(5), curdwn(6), currgt(6), curlft(6),
	curhom(8), erscrn(9), erslin(9), revon(8), revoff(8), 
	inqcur(9), k, txtjmp(11), lstyle(8)
integer monspc(10), worspc(8), kstyle, kstop, rvon
integer entgra(11), exgra(8)

integer writmd, cxhi, cxlo, cyhi, cylo, nx, ny, qtext, row, col
integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), clrflg

include(`ddcom')

common /cm4025/ ccltb, sclrd, sclgr, sclbl, clrflg, writmd, qtext, row, col
 
# The following equivalence statements are used to decrease the amount of code
#    necessary to access specific array elements. The arrays and the
#    variables equivalenced are listed below:
#
#       line(2) :: xhi
#       line(3) :: xlo
#       line(4) :: yhi
#       line(5) :: ylo
#       lstyle(6) :: kstyle
#       txtjmp(6) :: cyhi
#       txtjmp(7) :: cylo
#       txtjmp(9) :: cxhi
#       txtjmp(10) :: cxlo
equivalence (line(2), xhi), (line(3), xlo), (line(4), yhi), (line(5), ylo)
equivalence (xcoord, xy(1)) , (ycoord, xy(2)), (kstyle, lstyle(6))
equivalence (txtjmp(6), cyhi), (txtjmp(7), cylo), (txtjmp(9), cxhi),
            (txtjmp(10), cxlo)
 
data celwid /8/    # Char cell width in raster space
data celhgt /14/    # Char cell height in raster space
data chrwid / 7/    # Actual char width 
data chrhgt / 9/    # Actual char height

#    move cursor up 1 row  
data curup /COMMANDxCHAR,BIGU,BIGP,CR,NEWLINE/

#    move cursor down 1 row
data curdwn /COMMANDxCHAR,BIGD,BIGO,BIGW,CR,NEWLINE/

#    move cursor right 1 row
data currgt /COMMANDxCHAR,BIGR,BIGI,BIGG,CR,NEWLINE/

#    move cursor left 1 row
data curlft /COMMANDxCHAR,BIGL,BIGE,BIGF,CR,NEWLINE/
 
#    move cursor home (upper left hand corner of screen)
data curhom /COMMANDxCHAR,BIGJ,BIGU,BIGM,SPACE,DIG0,CR,NEWLINE/ 

#    erase to end of screen
data erscrn /COMMANDxCHAR,BIGD,BIGL,BIGI,SPACE,DIG3,DIG0,CR,NEWLINE/

#    erase to end of line
data erslin /COMMANDxCHAR,BIGD,BIGC,BIGH,SPACE,DIG8,DIG0,CR,NEWLINE/
 
#    reverse video on
data revon /COMMANDxCHAR,BIGA,BIGT,BIGT,SPACE,BIGI,CR,NEWLINE/

#    reverse video off
data revoff /COMMANDxCHAR,BIGA,BIGT,BIGT,SPACE,BIGS,CR,NEWLINE/

#    inquire current cursor address
data inqcur /COMMANDxCHAR,BIGR,BIGE,BIGP,SPACE,DIG0,DIG1,CR,NEWLINE/

#    put back in alpha mode
data alfamd /US,NEWLINE/
 
#    booboo
data booboo /BELL, NEWLINE/

#    clear workstation
data clrwrk /COMMANDxCHAR,BIGE,BIGR,BIGA,SPACE,BIGG,CR,NEWLINE/

#    enable GIN
data enable /COMMANDxCHAR,BIGE,BIGN,BIGA,SPACE,DIG1,CR,NEWLINE/
 
#    setup - initialize device
data setup /COMMANDxCHAR,BIGW,BIGO,BIGR,SPACE,DIG3,DIG0,SEMICOL,
            COMMANDxCHAR,BIGG,BIGR,BIGA,SPACE,DIG1,COMMA,DIG3,DIG0,SEMICOL,
            COMMANDxCHAR,BIGJ,BIGU,BIGM,SPACE,DIG1,CR,NEWLINE/

#    setup for text output <com char>,JUM <x>,<y>;
data txtjmp/COMMANDxCHAR,BIGJ,BIGU,BIGM,SPACE,0,0,COMMA,0,0,SEMICOL/

#    line style - <com char>,LIN <style>
data lstyle/COMMANDxCHAR,BIGL,BIGI,BIGN,SPACE,0,CR,NEWLINE/
 
#    return host and keyboard control to the monitor space
data monspc/COMMANDxCHAR,BIGM,BIGO,BIGN,SPACE,BIGH,SPACE,BIGK,CR,NEWLINE/

#    set host output to the workspace
data worspc/COMMANDxCHAR,BIGW,BIGO,BIGR,SPACE,BIGH,CR,NEWLINE/

#    enter graphics mode <com char>gra 1,30<CR><NEWLINE>
data entgra/COMMANDxCHAR,BIGG,BIGR,BIGA,SPACE,DIG1,COMMA,DIG3,DIG0,CR,NEWLINE/

#    exit graphics mode <com char>era w<CR><NEWLINE>
data exgra/COMMANDxCHAR,BIGE,BIGR,BIGA,SPACE,BIGW,CR,NEWLINE/

contrl(3) = 0    # Initialize ptsout count to zero (0)

opcode = contrl(OPCODE)    # Obtain a local copy of the current opcode

# 
#  opcode open workstation
# 
if (opcode == OPENxWORKSTATION) {
 
      contrl(3) = 6                       # Set to number of vertices in ptsout
      contrl(5) = 45                      # Set to number of output parameters  
      
      ndlntp = intin(2)                       # Set current device line style
      if (ndlntp < 1 | ndlntp > 8) ndlntp = 1
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
      writmd = REPLACExMODE                   # writing mode is replace
      rvon = 0                                # reverse video is off
      row = 1                                 # current alpha cursor row
      col = 1                                 # current alpha cursor column
      qtext = 0                               # alpha cursor is not different
                                              #   from graphics cursor

      intout(1) = XxLIMITSx4025   # Addressable width in rasters of screen
      intout(2) = YxLIMITSx4025   # Addressable height in rasters of screen
      intout(3) = OTHER           # Device coordinates in raster units

      # micrometers per raster along the x axis
      #   the screen area is 13.34 cm high and 20.32 cm wide therefore
      #   the raster size is 203200/640 in x and 133400/420 in y
      intout(4) = 317
      intout(5) = 317
      intout(6) = 1      # Number of character heights
      intout(7) = 8      # Number of line types
      intout(8) = 1      # Number of line widths
      intout(9) = 5      # Number of marker types
      intout(10) = 1     # Number of marker height
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
      intout(43) = 12          # Number of choice devices
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
      ptsout(10) = chrhgt   # Minimum marker height in NDC space
      ptsout(11) = 0
      ptsout(12) = chrhgt   # Maximum marker height in NDC space

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

      # build 30 line work and graphics area
      call gioini (1)           # initialize i/o system for crt device
      call gdstot (26, setup)   # set up graphics and workspace
      call gdstot (7, worspc)   # send host output to workspace
   }

#
#  opcode CLOSExWORKSTATION
#
else if (opcode == CLOSExWORKSTATION) {
      call gdstot (10,monspc)
      call giostp               # close i/o system
      }

#
#  opcode CLEARxWORKSTATION
#
else if (opcode == CLEARxWORKSTATION) {
      call gdstot (8, clrwrk)      # clear graphics space
      call gdstot (8, setup(19))   # reset the alpha cursor position
      row = 1
      col = 1
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
	intout(1) = 30
	intout(2) = 80
	}
     else if (opcode == ENTERxGRAPHICSxMODE)  {
        call gdstot (11, entgra)
	}
     else if (opcode == EXITxGRAPHICSxMODE)  {
        call gdstot (8, exgra)
	}
     else if (opcode == CURSORxUP)  {
        call curchk        # update the cursor position
        if (row > 1) {
	   call gdstot (5, curup)
           row = row -1
           }
	}
     else if (opcode == CURSORxDOWN)  {
        call curchk        # update the cursor position
        if (row < 30) {    # only move the cursor if we have room on the crt
	   call gdstot (6, curdwn)
           row = row + 1
           }
	}
     else if (opcode == CURSORxRIGHT)  {
        call curchk        # update the cursor position
        if (col < 80) {    # only move the cursor if we have room on the crt
	   call gdstot (6, currgt)
           col = col + 1
           }
	}
     else if (opcode == CURSORxLEFT)  {
        call curchk        # update the cursor position
        if (col > 1) {     # only move the cursor if we have room on the crt
	   call gdstot (6, curlft)
           col = col - 1
           }
	}
     else if (opcode == HOMExCURSOR)  {
	call gdstot (5, curhom)
        row = 1
        col = 1
	}
     else if (opcode == ERASExTOxENDxOFxSCREEN)  {
	call gdstot (9, erscrn)
	}
     else if (opcode == ERASExTOxENDxOFxLINE)  {
	call gdstot (9, erslin)
	}
     else if (opcode == DIRECTxCURSORxADDRESS)  {
	row = gimnmx (intin(1), 1, 30)  # Set the row
        col = gimnmx (intin(2), 1, 80)  # Set the column
        qtext = 1
        call curchk      # use the alpha cursor update routine
	}
     else if (opcode == OUTPUTxCURSORxADDRESSABLExTEXT) {
        if (rvon == 1) {
           call gdstot (8, revon)
	   call gdstot (contrl(4), intin)
           call gdstot (8, revoff)
           }
        if (rvon == 0) { # when reverse video is off, make sure the field 
                         # is defined properly, just in case the field had
                         # previously been defined with reverse video on
           call gdstot (8, revoff)
           call gdstot (contrl(4), intin)
           }
        col = gimnmx (col+contrl(4), 1, 80)
	}
     else if (opcode == REVERSExVIDEOxON)  {
	rvon = 1
	}
     else if (opcode == REVERSExVIDEOxOFF)  {
	rvon = 0
	}
     else if (opcode == INQUIRExCURRENTxCURSORxADDRESS)  {
        intout(1) = row
        intout(2) = col
	# call gdstot (9, inqcur)   # output <com_char>REP 01<cr>
        # call gdstin (20,line,j)   # input <com_char>ANS 01,rrr,ccc,<char>;
	# call gchtoi (line, 9, intout(1), j)  # Convert row number
	# call gchtoi (line, 13, intout(2), i)  # Convert column number
	}
     }

#
#  opcode POLYLINE
# 
else if (opcode == POLYLINE) {

   #  if the writing mode is 'erase' or the color is background, then set
   #  the line type to 'E'
   if (writmd == 0 | ccltb(ndclrl+1) == 0) { 
      kstyle = BIGE
      }
   else {
      kstyle = ndlntp + DIG0 # if the line is 'visible', then set the line type
      }
   if (kstyle != ndclrp) {  # if the desired line type is different than the
                            # device is set to, then update the device
      call gdstot (8, lstyle)
      ndclrp = kstyle
      }
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
   call dc4025 (ndclrm)  # set line style/color for markers
      
   j = 1
   for (i=1; i<=contrl(2); i=i+1) {
      xy(1) = ptsin(j)    # x coordinate of marker
      xy(2) = ptsin(j+1)  # y coordinate of marker 
      call dm40xx (xy)
      call gdstot (2, alfamd)   # Put back in alpha mode
      j = j + 2
      }

   }

#
#  opcode text
#
else if (opcode == TEXT) {

   # nx and ny are the character coordinates on the display surface. The
   #   screen is 80 characters wide and 30 characters tall with character
   #   location (1,1) being the upper left hand corner. Each character cell
   #   is 8 rasters wide and 14 rasters in height.

   nx = gimnmx (ptsin(1)/8 + 1, 1, 80)
   ny = gimnmx (30 - ptsin(2)/14, 1, 30)

   cyhi = ny/10 + DIG0         # txtjmp(6)
   cylo = mod(ny,10) + DIG0    # txtjmp(7)
   cxhi = nx/10 + DIG0         # txtjmp(9)
   cxlo = mod(nx,10) + DIG0    # txtjmp(10)

   call gdstot (11, txtjmp)   # position the cursor

   if (writmd == 0 | ccltb(ndclrt+1) == 0) { # if either writing mode is ERASE
      for (k=1; k<=contrl(4); k=k+1) { #  or color is 0, then output blanks
         call gdevot (SPACE)
         }
      }
   else {
      call gdstot (contrl(4), intin)
      }
   qtext = 1   # indicate that the alpha cursor has been moved to output
               # graphic text and must be moved back to the alpha position
               # before outputting alpha text
   }

#
#  opcode fill area
#
else if (opcode == FILLxAREA) {

   call dc4025 (ndclrf)   # set style/color for filled areas
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

   call dc4025 (ndclrl)   # change color to line color

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
      ndlntp = intin(1)
      if (ndlntp > 8) ndlntp = 1
      ndlntp = gimnmx (ndlntp, 1, 8) # 4025 has 8 line styles, 1-8
      intout(1) = ndlntp             # Return linestyle seleced
      }

#
#  opcode set polyline color index
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
#  opcode set polymarker color index
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
#  opcode inquire color representation
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
   call gdstot (2, alfamd)      # put 4025 in alpha mode for gin command

   for (i=1; i<=3; i=i+1) {  # try 3 times for a good input point
       call gdstot (8, enable)   # enable gin
       call gdstin (30, line, j) # read the device's response
       for (k=1; k<=j; k=k+1) {  #find the response - <com_char>DAT,
          if (line(k) == COMMANDxCHAR & line(k+1) == BIGD & line(k+2) ==BIGA
             & line(k+3) == BIGT) break
          }

       if (line(k) == COMMANDxCHAR) {
          for (k=k; k<=j; k=k+1) {   # now find the first comma delimiter
             if (line(k) == COMMA) break
             }
          if (line(k) == COMMA) {
             call gchtoi (line, k, intout(1), kstop)  # get the char pressed
             k = kstop
             if (k <= j) {
                call gchtoi (line, k, ptsout(1), kstop)  # convert x coord
                k = kstop
                if (k <= j) {
                   call gchtoi (line, k, ptsout(2), kstop) # convert y coord
                   k = kstop
                   break
                   }
                }
             }
          }
       }
    contrl (3) = 1  # number of vertices
    contrl (5) = 1  # successful gin
    }

#
#  opcode input string
#
else if (opcode == INPUTxSTRING) {
   if (intin(1) != DEFAULT) {       # Check for valid string device
      contrl(5) = NONE
      return
      }
   call gdstot (10, monspc)   # echo host output to monitor 
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
   call gdstot (7, worspc)              # send subsequent host output to monitor
   }
 
#
#  opcode set writing mode
#
else if (opcode == SETxWRITINGxMODE) {
   opcode = intin(1)
   if (opcode == ERASExMODE) {  # Device has erase
      j = ERASExMODE
      writmd = 0
      }
   else {                            # Replace mode is default writing mode
      j = REPLACExMODE
      writmd = 1
      }
   intout(1) = j                # Return writing mode selected
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
subroutine curchk
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
#     Function: REPOSITION THE ALPHA CURSOR IF IT HAS BEEN MOVED BY  #
#               A GRAPHIC TEXT OPERATION                             #
#                                                                    #
#     Input Parameters:                                              #
#            none                                                    #
#                                                                    #
#     Output Parameters:                                             #
#            none                                                    #
#                                                                    #
#     Routines called:                                               #
#            none                                                    #
#                                                                    #
######################################################################

integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), clrflg, writmd,
        qtext, row, col, txtjmp(5), line(2), i, k, gitoch

include(`ddcom')

common /cm4025/ ccltb, sclrd, sclgr, sclbl, clrflg, writmd, qtext,
                row, col

data txtjmp/COMMANDxCHAR,BIGJ,BIGU,BIGM,SPACE/
 
if (qtext == 1) {  # graphic text output moved the alpha cursor
   call gdstot (5, txtjmp)        # start the text 'jump' command
   i = gitoch (row, line, 2, k)   # convert number to characters
   call gdstot (i, line)          # output row position
   call gdevot (COMMA)            # output row/column separator
   i = gitoch (col, line, 2, k)   # convert number to characters
   call gdstot (i, line)          # output column position
   call gdevot (CR)               # terminate the command
   call gdevot (NEWLINE)
   qtext = 0                      # the alpha cursor is now up to date
   }
return
end
subroutine dc4025(color)
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
#     Function: Change the color on the 4025 terminal                #
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

integer lstyle(8), kstyle

integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), clrflg, writmd
integer qtext, row, col

include(`ddcom')

common /cm4025/ ccltb, sclrd, sclgr, sclbl, clrflg, writmd, qtext,
                row, col
 
equivalence (kstyle, lstyle(6))

#       Set the foreground color for lines
data lstyle/COMMANDxCHAR,BIGL,BIGI,BIGN,SPACE,0,CR,NEWLINE/

   if (writmd == 0 | ccltb(color+1) == 0) {  # if either writing mode is 'erase'
      kstyle = BIGE                          #   or the selected color is 0, 
                                             #   then line type is erase
      }
   else {
      kstyle = DIG1       # if visible, use solid line style
      }
   if (kstyle != ndclrp) { # only update the device if we're changing
      call gdstot (8, lstyle)
      ndclrp = kstyle
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
