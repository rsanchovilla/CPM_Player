h46712
s 00402/00564/00704
d D 1.2 83/03/30 11:27:28 mrk 2 1
c put in character cell text, added LOCATOR input
e
s 01268/00000/00000
d D 1.1 83/03/15 21:30:26 tes 1 0
c date and time created 83/03/15 21:30:26 by tes
e
u
4
U
t
T
I 1
subroutine ddotrn (contrl, intin, ptsin, intout, ptsout)
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
D 2
#     Function: GSS-KERNEL device driver for Otrona Attache            #
E 2
I 2
#     Function: GSS device driver for Otrona Attache                   #
E 2
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
D 2
#            dcotrn - change color on Retrographics terminal           #
E 2
#            xyotrn - output x,y coordinate on the Otrona terminal     #
#            dmotrn - Otrona marker emulation routine                  #
D 2
#            dtotrn - Otrona text output routine                       #
#            gdevot - put a character to device                        #
E 2
#            dootrn - output character string to Otrona                #
#            ttyout - output character to Otrona                       #
#            ttyin  - input unechoed character from Otrona             #
#            gimnmx - bound an integer variable                        #
#                                                                      #
########################################################################
I 2
divert(-1)
E 2
define(`MOVE',`1')
define(`DRAW',`2')
define(`XxLIMITSxOTRONA',`319')
define(`YxLIMITSxOTRONA',`239')
define(`DEFAULT',`1')                         # Default input device
define(`HOLLOW',0)
define(`SOLID',1)
define(`PATTERN',2)
D 2
define(`HATCH',3)
E 2
define(`BAR',1)
I 2
define(`HACHxFILL',`3')
define(`REPLACExMODE',1)                    # Replace writing mode
define(`OVERSTRIKExMODE',`2')
define(`XORxMODE',3)                        # Xor writing mode
define(`ERASExMODE',4)                      # Erase writing mode
define(`DEFAULT',1)
define(`CROSSHAIRS',2)
define(`ENDxOFxMOVEMENT',24) # A dummy line number
divert
E 2

integer contrl(1), intin(1), ptsin(1), intout(1), ptsout(1)
 
D 2
integer opcode, i, j, itemp, xlo, ylo, xhi, yhi, index, k,
	txtpos(4), xy(2), setup(4), icode, erase(3),
	iniino(45), inipto(12), rect(2), filmsk(2), solid(2),
	filpat(10), block(2), chrwid(5), chrhgt(5), celwid(5),
	celhgt(5)
integer	curup(2), curdwn(2), currgt(2), curlft(2),
	curhom(2), erscrn(2), erslin(2), revon(3), revoff(3), entgrf(3),
	extgrf(9)
E 2
I 2
integer opcode, i, j, itemp, xlo, ylo, xhi, yhi, index, k, xy(2),
	x1, x2, y1, y2, iniino(45), inipto(12)
E 2

D 2
integer gimnmx, divid, mult
E 2
I 2
SHORTINT curup(2), curdwn(2), currgt(2), curlft(2), curhom(2), erscrn(2), 
	 erslin(2), revon(3), revoff(3), entgrf(5), extgrf(11), txtpos(4),
	 setup(6), erase(3), rect(2), filmsk(2), block(2), 
	 chrwid, chrhgt, celwid, celhgt
integer solid(2), filpat(10)
E 2

I 2
integer gimnmx, mult

E 2
SHORTINT chr

D 2
integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), irow, icol
E 2
I 2
integer writmd, ccltb(2), sclrd(2), sclgr(2), sclbl(2), irow, icol
E 2

include(`ddcom')

D 2
common /cmotrn/ ccltb, sclrd, sclgr, sclbl, irow, icol
E 2
I 2
common /cmotrn/ writmd, ccltb, sclrd, sclgr, sclbl, irow, icol
E 2

D 2
# Table of character widths
data chrwid /5, 10, 15, 20, 25/
E 2
I 2
# Sizes of the only character size
data chrwid /3/ , chrhgt /9/ , celwid /4/ , celhgt /10/
E 2

D 2
# Table of character heights
data chrhgt /7, 14, 21, 28, 35/

# Table of cell widths
data celwid /6, 12, 18, 24, 30/

# Table of cell heights
data celhgt /8, 16, 24, 32, 40/

E 2
# Set up the device initially
data setup / ESC, BACKSLASH,
I 2
             ESC, LETC,
E 2
	     ESC, DIG7 /   # Reset; erase graphics & alpha ; enable graphics

# Erase screen (both, alpha & graphics)
data erase / SUB, ESC, DIG3/

#  Position for text output
data txtpos / ESC, EQUALS, DIG0, DIG0/
 
#  Rectangle(plot block) command
data rect /ESC, DIG2/

#  Fill mask command
data filmsk /ESC, DIG5/

#  Fill block command (fill with pattern)
data block /ESC, DIG4/

#  Solid fill pattern
data solid /255, 255/

#  Array of various fill patterns
#    1 - dithered
#    2 - vertical lines
#    3 - horizontal lines
#    4 - +45 degree lines
#    5 - -45 degree lines
data filpat/165, 165, 204, 204, 0, 255, 147, 108, 156, 99/

#    move cursor up 1 row  
data curup /ESC, BIGA/

#    move cursor down 1 row
data curdwn /ESC, BIGB/

#    move cursor right 1 row
data currgt /ESC, BIGC/

#    move cursor left 1 row
data curlft /ESC, BIGD/
 
#    move cursor home (upper left hand corner of screen)
data curhom / ESC, BIGH/

#    erase to end of screen
data erscrn /ESC, BIGJ/

#    erase to end of line
data erslin /ESC, BIGK/
 
#    reverse video on
data revon /ESC, BIGU, BANG/

#    reverse video off
data revoff /ESC, BIGU, BLANK/

#   enter graphics mode from alpha cursor mode
D 2
data entgrf /SUB, ESC, DIG7/
E 2
I 2
data entgrf /SUB, ESC, DIG7,
	     ESC, LETC/
E 2

#   exit graphics mode into alpha cursor mode
#        Clear graphics         <ESC>3
#        Exit graphics          <ESC>6
#        Reset parameters       <ESC>Z
#        Clear alpha            <SUB>
I 2
#        Enable Cursor          <ESC>d
E 2
#        Screen wrap off        <ESC>^
D 2
data extgrf /ESC, DIG3, ESC, DIG6, ESC, BIGZ, SUB, ESC, CARET/
E 2
I 2
data extgrf /ESC, DIG3, ESC, DIG6, ESC, BIGZ, SUB, ESC, LETD, ESC, CARET/
E 2

#  Initial intout array from open workstation
data iniino /_
      319,   # Addressable width in rasters of screen
      239,   # Addressable height in rasters of screen
      OTHER, # Device coordinates in raster units
      278,   # Width of a pixel in micrometers
      278,   # Height of a pixel in micrometers
D 2
      5,     # Number of character heights
E 2
I 2
      1,     # Number of character heights
E 2
      5,     # Number of line types
      1,     # Number of line widths
      5,     # Number of marker types
      1,     # Number of marker height
      1,     # Number of fonts
      5,     # Number of patterns
      5,     # Number of hatch styles
      2,     # Number of predefined colors
      1,     # Number of GDPs      
      1,     # Bar GDP available
      9*-1,  # No other GDPs
      3,     # Bar GDP uses fill area attributes
      9*-1,  # No other GDPs
      MONOCHROME, # Color capability flag
D 2
      YES,        # Text rotation capability flag
       NO,        # Fill area capability flag
E 2
I 2
      NO,        # Text rotation capability flag
      NO,        # Fill area capability flag
E 2
      NO,         # Pixel operation capability flag
      2 ,         # Number of available colors
D 2
      0,          # Number of locator devices
E 2
I 2
      1,          # Number of locator devices
E 2
      0,          # Number of valuator devices
      0,          # Number of choice devices
      1,          # Number of string devices
      2/          # Workstation type 

# Initial ptsout array from open workstation
data inipto /_
      0,
D 2
      7,  # Minimum character height
E 2
I 2
      9,  # Minimum character height
E 2
      0,
D 2
      35, # Maximum character height 
E 2
I 2
      9, # Maximum character height 
E 2
      1,  # Minimum line width in raster space
      0,
      1,  # Maximum line width in raster space
      0,
      0,
      4,  # Minimum marker height
      0,
      4/  # Maximum marker height

opcode=contrl(OPCODE)
contrl(3) = 0  # Initialize to no points output from this device

# 
#  opcode open workstation
# 
if (opcode == OPENxWORKSTATION) {
 
      contrl(3) = 6                          # Set to length of ptsout
      contrl(5) = 45                         # Set to length of intout

      do i=1,45 {                            # Return intout parameters
	 intout(i) = iniino(i)
	 }
      do i=1,12 {                            # Return ptsout parameters
	 ptsout(i) = inipto(i)
	 }

      ndlntp = intin(2)                       # Set current device line style
      if (ndlntp < 1 | ndlntp > 5) ndlntp = 1
      ndclrl = gimnmx (intin(3), 0, 1)        # current polyline color
      ndmktp = intin(4)                       # Set current polymarker type
      if (ndmktp < 1 | ndmktp > 5) ndmktp = 3 # use default
      ndclrm = gimnmx (intin(5), 0, 1)        # current polymarker color
      ndclrt = gimnmx (intin(7), 0, 1)        # current text color              
      ndfstl = intin(8)                       # Set fill interior style
D 2
      if (ndfstl < HOLLOW | ndfstl > HATCH) ndfstl = HOLLOW
      if (ndfstl == HATCH) ndfstl = PATTERN
E 2
I 2
      if (ndfstl < HOLLOW | ndfstl > HACHxFILL) ndfstl = HOLLOW
      if (ndfstl == HACHxFILL) ndfstl = PATTERN
E 2
      ndflpt = intin(9)                       # current fill style index
      if (ndflpt < 1 | ndflpt > 5) ndflpt = 1
      ndclrf = gimnmx (intin(10), 0, 1)       # current fill area color
      ndclrp = -1                             # no current color   
D 2
      ndtxrt = 0			      # default is no rotation
      ndtxsz = 1                              # default text size is smallest
E 2
I 2
      writmd = REPLACExMODE                   # Default writing mode is replace
E 2

D 2

E 2
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

D 2
      call gioini (1)           # initialize i/o system for crt device
      call dootrn (4, setup)
E 2
I 2
      call dootrn (6, setup)
E 2
      }

#
#  opcode CLOSExWORKSTATION
#
else if (opcode == CLOSExWORKSTATION) {
D 2
      call giostp               # close i/o system
E 2
      }

#
#  opcode CLEARxWORKSTATION
#
else if (opcode == CLEARxWORKSTATION) {
      call dootrn (3, erase)    # Erase both planes
      }

# 
#  opcode UPDATExWORKSTATION
#
else if (opcode == UPDATExWORKSTATION) {
      }

#
#  opcode ESCAPE
#
else if (opcode == ESCAPE) {
     opcode = contrl(6)
     if (opcode == INQUIRExADDRESSABLExCELLS) {
	intout(1) = 24                  # Not capable of cursor addressing
	intout(2) = 80
	}
     else if (opcode == ENTERxGRAPHICSxMODE)  {
D 2
	call dootrn (3, entgrf)
E 2
I 2
	call dootrn (5, entgrf)
E 2
	}
     else if (opcode == EXITxGRAPHICSxMODE)  {
D 2
	call dootrn (9, extgrf)
E 2
I 2
	call dootrn (11, extgrf)
E 2
	irow = 1
	icol = 1
	}
     else if (opcode == CURSORxUP)  {
	call dootrn (2, curup)
	irow = gimnmx (irow-1, 1, 24)
	}
     else if (opcode == CURSORxDOWN)  {
	call dootrn (2, curdwn)
	irow = gimnmx (irow+1, 1, 24)
	}
     else if (opcode == CURSORxRIGHT)  {
	call dootrn (2, currgt)
	icol = gimnmx (icol+1, 1, 80)
	}
     else if (opcode == CURSORxLEFT)  {
	call dootrn (2, curlft)
	icol = gimnmx (icol-1, 1, 80)
	}
     else if (opcode == HOMExCURSOR)  {
	call dootrn (2, curhom)
	irow = 1
	icol = 1
	}
     else if (opcode == ERASExTOxENDxOFxSCREEN)  {
	call dootrn (2, erscrn)
	}
     else if (opcode == ERASExTOxENDxOFxLINE)  {
	call dootrn (2, erslin)
	}
     else if (opcode == DIRECTxCURSORxADDRESS)  {
	irow = gimnmx (intin(1), 1, 24) # Set the row
	txtpos(3) = irow + 31
	icol = gimnmx (intin(2), 1, 80) # Set the column
	txtpos(4) = icol + 31
	call dootrn (4, txtpos)
	}
     else if (opcode == OUTPUTxCURSORxADDRESSABLExTEXT) {
	i = min0 (contrl(4), 81-icol)
D 2
	call dootrn (i, intin)
E 2
I 2
	do j = 1, i {
	   call otrnot (intin(j))
	   }
E 2
	icol = icol + i 
	}
     else if (opcode == REVERSExVIDEOxON)  {
	call dootrn (3, revon)
	}
     else if (opcode == REVERSExVIDEOxOFF)  {
	call dootrn (3, revoff)
	}
     else if (opcode == INQUIRExCURRENTxCURSORxADDRESS)  {
	intout(1) = irow
	intout(2) = icol
	}
     }

#
#  opcode POLYLINE
# 
else if (opcode == POLYLINE) {
D 2
   call dcotrn (ndclrl)      # change color to current line color

   if (ndlntp != 1)  {  # Use a dash pattern
      call daotrn (contrl(2), ptsin)
      }
   else {   # Just a regular solid line
      j = 1
      icode = MOVE
      for (i=1; i<=contrl(2); i=i+1) {
         call drotrn (icode, ptsin(j), ptsin(j+1))
         j = j + 2
	 icode = DRAW
E 2
I 2
   call dcotrn (ndclrl)   # change color to current line color
   x1 = ptsin(1)
   y1 = ptsin(2)
   j = 3
   for (i=2; i<=contrl(2); i=i+1)  {
      x2 = ptsin(j)
      y2 = ptsin(j+1)
      if (ndlntp == 1)   { # Solid line type
         call drotrn (x1, y1, x2, y2) 
E 2
         }
I 2
      else  {
         call dlotrn (x1, y1, x2, y2)  # Emulate the dash pattern
	 }
      x1 = x2
      y1 = y2
      j = j + 2
E 2
      }
   }

# 
#  opcode polymarker 
#
else if (opcode == POLYMARKER) {
D 2
   call dcotrn (ndclrm)       # change color to current marker color
E 2
I 2
   call dcotrn (ndclrm)   # change color to current marker color
E 2
      
   j = 1
   for (i=1; i<=contrl(2); i=i+1) {
      xy(1) = ptsin(j)    # x coordinate of marker
      xy(2) = ptsin(j+1)  # y coordinate of marker 
      call dmotrn (xy)
      j = j + 2
      }
   }

#
#  opcode text
#
else if (opcode == TEXT) {
   i = contrl(4)          # get number of characters in string
D 2
   if (i > 0) {
      call dtotrn (ptsin(1), ptsin(2), i, intin, ndtxsz, ndtxrt)
E 2
I 2
   # x1 and y1 are the character coordinates on the display surface. The
   #   screen is 80 characters wide and 24 characters tall with character
   #   location (0,0) being the upper left hand corner. Each character cell
   #   is 4 rasters wide and 10 rasters in height.

   x1 = gimnmx ((ptsin(1)+2)/4, 1, 80)
   y1 = gimnmx (24 - (ptsin(2)+5)/10, 1, 30)

   txtpos(3) = y1 + 31
   txtpos(4) = x1 + 31
   call dootrn (4, txtpos)      # position the cursor

   if (writmd == ERASExMODE | ndclrt == 0) { # if either writing mode is ERASE
      for (k=1; k<=i; k=k+1) {     # or color is 0, then output blanks
         call otrnot (SPACE)
         }
E 2
      }
I 2
   else {
      for (k=1; k<=i; k=k+1) {     # Put out the characters
         call otrnot (intin(k))
         }
      }
E 2
   }

#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
D 2
   call dcotrn (ndclrf)               # change color to current fill area color
E 2
I 2
   call dcotrn (ndclrf)   # change color to current fill color
E 2

   # Since the device does not do polygons, then just outline the area
D 2
   j = 1
   icode = MOVE
   for (i=1; i<=contrl(2); i=i+1) {
      call drotrn (icode, ptsin(j), ptsin(j+1))
E 2
I 2
   x1 = ptsin(1)
   y1 = ptsin(2)
   j = 3
   for (i=2; i<=contrl(2); i=i+1) {
      x2 = ptsin(j)
      y2 = ptsin(j+1)
      call drotrn (x1, y1, x2, y2)
      x1 = x2
      y1 = y2
E 2
      j = j + 2
D 2
      icode = DRAW
E 2
      }
I 2
   call drotrn (x2, y2, ptsin(1), ptsin(2))  # Close the outline
E 2
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {

   # This device can't do pixel arrays very easily, so outline the area
   # in the current line color

D 2
   call dcotrn (ndclrl)              # Change color to line color
E 2
I 2
   call dcotrn (ndclrl)   # change color to current line color
E 2

   xlo = ptsin(1)
   ylo = ptsin(2)
   xhi = ptsin(3)
   yhi = ptsin(4)
D 2
   call drotrn (MOVE, xlo, ylo)
   call drotrn (DRAW, xhi, ylo)
   call drotrn (DRAW, xhi, yhi)
   call drotrn (DRAW, xlo, yhi)
   call drotrn (DRAW, xlo, ylo)
E 2
I 2
   call drotrn (xlo, ylo, xhi, ylo)
   call drotrn (xhi, ylo, xhi, yhi)
   call drotrn (xhi, yhi, xlo, yhi)
   call drotrn (xlo, yhi, xlo, ylo)
E 2
   }

#
#  opcode generalized drawing primitive
#
else if (opcode == GENERALIZEDxDRAWINGxPRIMITIVE) {
   opcode = contrl(6)
   if (opcode == BAR) {
D 2
      call dcotrn (ndclrf)       # Change color to current fill color
E 2
I 2

      call dcotrn (ndclrf)    # Change color to current fill color

E 2
      xlo = ptsin(1)
      ylo = ptsin(2)
      xhi = ptsin(3)
      yhi = ptsin(4)
      call dootrn (2, rect)      # Ouptut rectangle command
      call xyotrn (xlo, ylo)     # Output coordinates of lower left corner
      call xyotrn (xhi, yhi)     # Output coordinates of upper right corner

      if (ndfstl != HOLLOW) {
	 call dootrn (2, filmsk)    # Set fill mask command
	 if (ndfstl == SOLID) {
D 2
	    call dootrn (2, solid)  # Set solid fill
E 2
I 2
	    call ttyout (solid(1))  # Set solid fill
	    call ttyout (solid(2))
E 2
	    }
         else {
	    i = mult (ndflpt, 2) - 1 
D 2
            call dootrn (2, filpat(i)) # Set pattern 
E 2
I 2
            call ttyout (filpat(i)) # Set pattern 
            call ttyout (filpat(i+1))
E 2
	    }
         call dootrn (2, block)     # Output fill block command
         call xyotrn (xlo, yhi)     # Output coordinates of upper left corner
         call xyotrn (xhi, ylo)     # Output coordinates of lower right corner
	 }
      }
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
D 2
   i = ptsin(2)                # Get requested height
   ndtxsz = 1
   repeat {                    # Choose size with closest height that
			       # is not greater than the size requested
      if (chrhgt(ndtxsz) > i) break
      ndtxsz = ndtxsz + 1
      } until (ndtxsz > 5)
   ndtxsz = ndtxsz -1
   ndtxsz = gimnmx (ndtxsz, 1, 5)
E 2
   contrl(3) = 2                    # Set the number vertices
D 2
   ptsout(1) = chrwid (ndtxsz)      # Return values selected
   ptsout(2) = chrhgt (ndtxsz)
   ptsout(3) = celwid (ndtxsz)
   ptsout(4) = celhgt (ndtxsz)
E 2
I 2
   ptsout(1) = chrwid               # Return values selected
   ptsout(2) = chrhgt
   ptsout(3) = celwid
   ptsout(4) = celhgt
E 2
   }

#
#  opcode set character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
D 2
   j = divid ((intin(1) + 450), 900, i)  # Round angle up to nearest 90
   i = divid (j, 4, ndtxrt)              # Make sure between 0-3
   intout(1) = mult (ndtxrt, 900)	 # Return angle selected in tenths
					 # of degrees
E 2
I 2
   intout(1) = 0    # No text rotation
E 2
   }

#
#  opcode color
#
else if (opcode == SETxCOLORxREPRESENTATION) {
      i = gimnmx (intin(1), 0, 1) + 1  # Map index 0-1 to 1-2

      # Never change realized colors.  Index 0 is always black
      # and index 1 is always white.
      # Save the color requested.
      sclrd(i) = intin(2)  # This is what was set
      sclgr(i) = intin(3)
      sclbl(i) = intin(4)
      }

#
#  opcode set polyline linetype
#
else if (opcode == SETxPOLYLINExLINETYPE) {
      ndlntp = intin(1)
      if (ndlntp < 1 | ndlntp > 5) ndlntp = 1
      intout(1) = ndlntp             # Return linestyle selected
      }

#
#  opcode set polyline color index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX) {
      ndclrl = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrl            # Return color index selected
      }

#
#  opcode set polymarker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
      ndmktp = intin(1)
      if (ndmktp<1 | ndmktp>5) ndmktp = 3   # Out of range goes to default = 3
      intout(1) = ndmktp
      }

#
#  opcode set polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX) {
      ndclrm = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrm             # Return color index selected
      }

#
#  opcode set text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX) {
      ndclrt = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrt            # Return color index selected
      }

#
#  opocde set fill interior style
#
else if (opcode == SETxFILLxINTERIORxSTYLE) {
     ndfstl = intin(1)
D 2
     if (ndfstl < HOLLOW | ndfstl > HATCH) ndfstl = HOLLOW
     if (ndfstl == HATCH) ndfstl = PATTERN
E 2
I 2
     if (ndfstl < HOLLOW | ndfstl > HACHxFILL) ndfstl = HOLLOW
     if (ndfstl == HACHxFILL) ndfstl = PATTERN
E 2
     intout(1) = ndfstl             # Return interior style selected
     }

#
#  opcode set fill style index
#
else if (opcode == SETxFILLxSTYLExINDEX) {
     ndflpt = intin(1)
     if (ndflpt < 1 | ndflpt > 5) ndflpt = 1
     intout(1) = ndflpt                # Return pattern selected
     }

#
#  opcode set fill area color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
      ndclrf = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrf            # Return color index selected
      }
#
#  opcode inquire color representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 1) + 1  # Map index 0-1 to 1-2
   intout(1) = i - 1  #  This is what we inquired on
   index = intin(2)   # Type of inquiry, 0=set, 1=realized
   if (index == 0)  {                # Set
      intout(2) = sclrd(i)
      intout(3) = sclgr(i)
      intout(4) = sclbl(i)
      }
   else {                            # Realized
      j = 0                          # assume color 0, black
      if (i != 0) j = 1000           # Not color 0, so must be white

      intout(2) = j
      intout(3) = j
      intout(4) = j
      }
   }
 

#
#  opcode request string
#
else if (opcode == INPUTxSTRING) {
   if (intin(1) != DEFAULT) {       # Check for valid string device
      contrl(5) = NONE
      return
      }
   i = 0                             # Initialize output status to not ok
   itemp = intin(2)                  # Save maximum size
   k = intin(3)                      # Get echo status
   repeat {
      call ttyin (chr)               # Get a character unechoed
      if (k == YES) call ttyout (chr)# Echo character if necessary
      if (chr == NEWLINE) break
      if (chr == CR) break
      if (i+1 > itemp) break         # No room in output array
      i = i + 1
      intout(i) = chr
      }
   contrl(5) = i                     # Length of string returned, 0 if error
   }
 
#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = 1                     # Request mode input only
   }
D 2

return
end
subroutine dmotrn (intin)
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
#     Function: Place a marker at the current location on the Otrona   #
#                                                                      #
#     Input Parameters:                                                #
#            intin   - x/y location for marker                         #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            drotrn - Otrona move/draw routine                         #
#                                                                      #
########################################################################
define(`MOVE',`1')
define(`DRAW',`2')
define(`MARKxPERIOD',`1')
define(`MARKxPLUS',`2')
define(`MARKxSTAR',`3')
define(`MARKxO',`4')
define(`MARKxX',`5')
define(`FULLSZ',`4')
define(`HALFSZ',`2')
define(`FPERSZ',`2')
define(`HPERSZ',`1')
E 2
 
D 2
integer intin(2)
E 2
I 2
#
#  opcode set writing mode
#
else if (opcode == SETxWRITINGxMODE) {
   writmd = gimnmx( intin(1), 1, 4)
   intout(1) = writmd        # Return writing mode selected
   }
E 2
 
D 2
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
   if ((min0(x1,y1) < 0) | (x2 > 319) | (y2 > 239)) return
 
   # output appropriate marker centered on location
E 2
I 2
#
#  opcode input locator 
#
else if (opcode == INPUTxLOCATOR) {
   contrl(5) = NONE             # Initialize status to not successful
   i = intin(1)                 # Check locator device for validity
   if (i != DEFAULT & i !=CROSSHAIRS) return
E 2

D 2
   if (ndmktp == MARKxPERIOD | ndmktp == MARKxO) {
      call drotrn (MOVE, x1, y1)
      call drotrn (DRAW, x2, y1)
      call drotrn (DRAW, x2, y2)
      call drotrn (DRAW, x1, y2)
      call drotrn (DRAW, x1, y1)
E 2
I 2
   itemp = ndlntp    # Set to a solid line type
   ndlntp = 1

   k = writmd
   writmd = XORxMODE   # Be able to remove the cursor

   x1 = ptsin(1)   # Move the cursor to the starting postion
   y1 = ptsin(2)

   index = 10
   j = NO
   while (j == NO) {
      call dlotrn(x1-9, y1, x1+9, y1)
      call dlotrn(x1, y1-9, x1, y1+9)
      call ttyin (chr)   # Get arrow character or gin terminate

      # Now erase the old cursor
      call dlotrn(x1-9, y1, x1+9, y1)
      call dlotrn(x1, y1-9, x1, y1+9)

      if (chr >= BS & chr <= FF)  {   # A valid cursor movement
	 i = chr-7
	 go to (BS, HT, LF, VT, FF), i
            BS   x1 = x1 - index
		 go to ENDxOFxMOVEMENT
            HT   # nop
		 go to ENDxOFxMOVEMENT
            LF   y1 = y1 - index
		 go to ENDxOFxMOVEMENT
            VT   y1 = y1 + index
		 go to ENDxOFxMOVEMENT
            FF   x1 = x1 + index
            ENDxOFxMOVEMENT continue
	 }
      else if (chr == ESC)  {  # Toggle speeds
	 if (index == 10)  index = 1
	 else              index = 10
	 }
      else if (chr >= SPACE)       j = YES 

      x1 = gimnmx(x1, 0, 319)  # Make sure the cursor ends up on the screen
      y1 = gimnmx(y1, 0, 239)
E 2
      }
D 2
   else {
      if (ndmktp == MARKxX | ndmktp == MARKxSTAR) {
         call drotrn (MOVE, x1, y1)
         call drotrn (DRAW, x2, y2)
	 call drotrn (MOVE, x1, y2)
         call drotrn (DRAW, x2, y1)
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
         rxy2 = y1 + hsize
	 call drotrn (MOVE, x1, rxy2)
         call drotrn (DRAW, x2, rxy2)
         rxy1 = x1 + hsize
	 call drotrn (MOVE, rxy1, y1)
         call drotrn (DRAW, rxy1, y2)
         }
      }
E 2
I 2
   intout(1) = chr  # Return the character hit
   ptsout(1) = x1
   ptsout(2) = y1
   contrl (3) = 1  # number of vertices
   contrl (5) = 1  # successful gin
   writmd = k   # Restore the user's writing mode
   ndlntp = itemp # Restore the line type
   }
E 2

D 2
   return
E 2
I 2
return
E 2
end
D 2
subroutine daotrn (count, pline)
E 2
I 2
subroutine drotrn (x1, y1, x2, y2)
E 2
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
D 2
#     Function: GSS-CORE device driver dash emulation for the Otronai  #
E 2
I 2
#     Function:Draw a line between the specified points                # 
E 2
#                                                                      #
#     Input Parameters:                                                #
D 2
#            pline   -   start/end points of dash polylines            #
E 2
I 2
#           x1, y1   - start point of line                             #
#           x2, y2   - end point of the line                           #
E 2
#                                                                      #
D 2
#     Output Parameters: none                                          #
E 2
I 2
#     Output Parameters:                                               #
#            none                                                      #
E 2
#                                                                      #
#     Routines Called:                                                 #
D 2
#             drotrn - do a move/draw on the otrona                    #
#             mult   - multiply 2 unsigned 16-bit numbers              #
E 2
I 2
#            dootrn - Output a character string to the device          #
#            xyotrn - Output an xy-coordinate pair on the Otrona       #
E 2
#                                                                      #
########################################################################
D 2
#local defines
define(`DASH_INCREMENT',`6')
define(`MOVE',`1')
define(`DRAW',`2')
E 2
I 2
integer x1, y1, x2, y2
SHORTINT mov(2), drw(2)
E 2
 
D 2
integer count, pline(1)
E 2
I 2
integer writmd, ccltb(2), sclrd(2), sclgr(2), sclbl(2), irow, icol

common /cmotrn/ writmd, ccltb, sclrd, sclgr, sclbl, irow, icol
E 2
 
D 2
integer actary(16), action, j, k, kk, l, n
integer dx, dy, adx, ady, newx, newy, oldx, oldy, numpnt, endx, endy,
        temp, xincr, adx2, ady2, d, xend
integer mult
logical qchang
 
include(`ddcom')
 
#action definitions for line styles 2-5: 0=move, 1=draw, 2=point
data actary / 2, 2, 2, 2,  2, 0, 1, 2,  0, 1, 0, 1,  0, 1, 1, 0 /
 
   # Index into the action array, same for all vectors
   k = mult (ndlntp-2, 4) + 1
   l = 3    # Pointer into input array
   oldx = pline(1)
   oldy = pline(2)
   for (n=2; n<=count; n=n+1) { # For each vector in the polyline
      j = 0    # Always reset the pattern when starting a new vector
      numpnt = 0  # Initialize number of pixels in a pattern segment
      endx = pline(l)
      endy = pline(l+1)
      dx = endx - oldx     # Determine the dx and dy for the vector
      dy = endy - oldy
      adx = iabs (dx)
      ady = iabs (dy)
      qchang = .false.
      if (ady > adx)  {  # Need to switch the points
	 temp = oldx
	 oldx = oldy
	 oldy = temp
	 temp = endx
	 endx = endy
	 endy = temp
	 temp = adx
	 adx = ady
	 ady = temp
	 qchang = .true.
	 }
E 2
I 2
data mov /ESC, DIG0/
data drw /ESC, DIG1/
E 2

D 2
      adx2 = mult (2, adx)
      ady2 = mult (2, ady)
      temp = ady2 - adx2
E 2
I 2
   # If writing mode is clear, set the current line color to background
   if (writmd == ERASExMODE)   call dcotrn (0)
E 2

D 2
      xincr = 1
      if (isign(1,dx) != isign(1,dy))  xincr = -1  # line has negative slope
E 2
I 2
   call dootrn (2, mov)    # Set cursor to start point
   call xyotrn (x1, y1)    # convert coordinates and output them
E 2

D 2
      if (oldy <= endy)  {  # Determine starting position
	 newx = oldx
	 newy = oldy
	 xend = endx
	 }
      else {
	 newx = endx
	 newy = endy
	 xend = oldx
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
E 2
I 2
   call dootrn (2, drw)    # Set cursor to end point
   call xyotrn (x2, y2)    # convert coordinates and output them
E 2

D 2
	    kk = k + j  # Determine exact action to be done
	    action = actary(kk)  # Get the action
	    if (action == 0)  {  # Reset the end points for the move
	       }
	    else if (action == 1) { # Draw a dash
	       if (qchang) {
	          call drotrn (MOVE, oldy, oldx)
	          call drotrn (DRAW, newy, newx)
		  }
	       else {
	          call drotrn (MOVE, oldx, oldy)
	          call drotrn (DRAW, newx, newy)
		  }
	       }
	    else {  # Draw a dot
	       if (qchang) {
	          call drotrn (MOVE, newy, newx)  # A move will put out a dot
	          }     			  # on the otrona
	       else {
	          call drotrn (MOVE, newx, newy) 
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
	    }
	 if (j > 3) j = 0
	 kk = k + j
	 if (actary(kk) == 1 ) { call drotrn (DRAW, endx, endy) }
	 else                  { call drotrn (MOVE, endx, endy) }
	 l = l + 2
	 oldx = endx 
	 oldy = endy
      } # End of all polylines

E 2
   return
end
D 2
subroutine dtotrn (x, y, length, txtstr, size, rotat)
E 2
I 2
subroutine xyotrn (kx, ky)
E 2
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
D 2
#     Function: Output text on Otrona                                  #
E 2
I 2
#     Function: Convert x,y coordinate and output it to the Otrona     # 
E 2
#                                                                      #
#     Input Parameters:                                                #
D 2
#            x,y - starting point for text string                      #
#            length - length of text string                            #
#            txtstr - text string (in ADE)                             #
#            size - scale factor for character size (1-6)              #
#            rotat - text rotation                                     #
#                    0 = no rotation  1 = 90 degrees                   #
#                    2 = 180 degrees  3 = 270 degrees                  #
E 2
I 2
#           kx       - x-coordinate in 0 to device dependent space     #
#           ky       - y-coorindate in 0 to device dependent space     #
#                                                                      #
E 2
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
D 2
#            dcotrn - change color on Otrona                           #
#            drotrn - move/draw routine on Otrona                      #
#            mult - multiply 2 unsigned 16 bit numbers                 #
#            divid - divide 2 unsigned 16 bit numbers                  #
E 2
I 2
#            dootrn - Output a character string to the device          #
#            divid - divide 2 16-bit unsigned integers                 #
E 2
#                                                                      #
########################################################################
D 2
define(`ROWS',8)     # rows in a character cell
define(`COLUMNS',6)  # columns in a character cell
E 2
I 2
define(`MOVE',`1')
define(`DRAW',`2')
integer kx, ky
integer divid, x1, x2, y1, y2, i
integer buffer(4)
E 2
 
D 2
integer coltbl(4), rowtbl(4), rowinc, colinc, colrpt, rowrpt
logical qchang
integer txtstr(1), rotat, x, y, length, size, i, j, k, m, itemp
integer xcoord, ycoord, xtemp, ytemp, gimnmx, width, tmpwid
integer mult, divid, istart, iptr, descnd(4), xparm, yparm
SHORTINT fntary (768), part1(256), part2(256), part3(256)
E 2
I 2
# The following equivalences were made to reduce code size:
#     buffer(1) = x1
#     buffer(2) = x2
#     buffer(3) = y1
#     buffer(4) = y2
equivalence (buffer(1),x1), (buffer(2),x2), (buffer(3),y1), (buffer(4),y2)
E 2
 
D 2
equivalence (part1(1), fntary(1))
equivalence (part2(1), fntary(257))
equivalence (part3(1), fntary(513))
E 2
I 2
   x1 = divid (kx, ATSIGN, x2) 
E 2
 
D 2
data coltbl /1, 1, -1, -1/    # column (x) increment for 90 degree rotations
data rowtbl /1, -1, -1, 1/    # row (y) increment for 90 degree rotations
data descnd /-1, 1, 1, -1/    # row (y) offsets for 1 pixel descenders
data width /COLUMNS/          # character cell width
E 2
I 2
   y1 = divid (ky, ATSIGN, y2)
E 2
 
D 2
data part1 /_
      0,  0,  0,  0,  0,  0,  0,  0,    #sp
      0,  4,  0,  0,  4,  4,  4,  4,    # !
      0,  0,  0,  0,  0,  5, 10, 10,    # "
      0, 10, 10, 31, 10, 31, 10, 10,    # #
      0,  4, 14, 20, 14,  5, 14,  4,    # $
      0, 25, 25,  2,  4,  8, 19, 19,    # %
      0, 22,  9, 21, 18,  5,  5,  2,    # &
      0,  0,  0,  0,  0,  2,  4,  6,    # '
      0,  8,  4,  2,  2,  2,  4,  8,    # (
      0,  2,  4,  8,  8,  8,  4,  2,    # )
      0,  0, 18, 12, 30, 12, 18,  0,    # *
      0,  0,  4,  4, 31,  4,  4,  0,    # +
      2,  4,  6,  6,  0,  0,  0,  0,    # ,
      0,  0,  0,  0, 31,  0,  0,  0,    # -
      0,  6,  6,  0,  0,  0,  0,  0,    # .
      0,  0,  1,  2,  4,  8, 16,  0,    # /
      0, 14, 17, 19, 21, 25, 17, 14,    # 0
      0, 14,  4,  4,  4,  4,  6,  4,    # 1
      0, 31,  2,  4,  8, 16, 17, 14,    # 2
      0, 14, 17, 16,  8,  4,  8, 31,    # 3
      0,  8,  8, 31,  9, 10, 12,  8,    # 4
      0, 14, 17, 16, 16, 15,  1, 31,    # 5
      0, 14, 17, 17, 14,  2,  4,  8,    # 6
      0,  2,  2,  4,  8, 16, 16, 31,    # 7
      0, 14, 17, 17, 14, 17, 17, 14,    # 8
      0,  2,  4,  8, 14, 17, 17, 14,    # 9
      0,  6,  6,  0,  0,  6,  6,  0,    # :
      2,  4,  6,  6,  0,  6,  6,  0,    # ;
      0,  8,  4,  2,  1,  2,  4,  8,    # <
      0,  0,  0, 31,  0, 31,  0,  0,    # =
      0,  2,  4,  8, 16,  8,  4,  2,    # >
      0,  4,  0,  4,  8, 16, 17, 14/   # ?

data part2 /_
      0, 30, 1,  29, 21, 29, 17, 14,    # @
      0, 17, 17, 31, 17, 17, 10,  4,    # A
      0, 15, 18, 18, 14, 18, 18, 15,    # B
      0, 14, 17,  1,  1,  1, 17, 14,    # C
      0, 15, 18, 18, 18, 18, 18, 15,    # D
      0, 31,  1,  1, 15,  1,  1, 31,    # E
      0,  1,  1,  1, 15,  1,  1, 31,    # F
      0, 14, 17, 17, 29,  1, 17, 14,    # G
      0, 17, 17, 17, 31, 17, 17, 17,    # H
      0, 14,  4,  4,  4,  4,  4, 14,    # I
      0,  6,  9,  9,  8,  8,  8, 28,    # J
      0, 17,  9,  5,  3,  5,  9, 17,    # K
      0, 31,  1,  1,  1,  1,  1,  1,    # L
      0, 17, 17, 17, 21, 21, 27, 17,    # M
      0, 17, 17, 25, 21, 19, 17, 17,    # N
      0, 14, 17, 17, 17, 17, 17, 14,    # O
      0,  1,  1,  1, 15, 17, 17, 15,    # P
      0, 22,  9, 21, 17, 17, 17, 14,    # Q
      0, 17, 17,  9, 15, 17, 17, 15,    # R
      0, 14, 17, 16, 14,  1, 17, 14,    # S
      0,  4,  4,  4,  4,  4,  4, 31,    # T
      0, 14, 17, 17, 17, 17, 17, 17,    # U
      0,  4, 10, 10, 17, 17, 17, 17,    # V
      0, 17, 27, 21, 21, 17, 17, 17,    # W
      0, 17, 17, 10,  4, 10, 17, 17,    # X
      0,  4,  4,  4,  4, 10, 17, 17,    # Y
      0, 31,  1,  2,  4,  8, 16, 31,    # Z
      0, 14,  2,  2,  2,  2,  2, 14,    # [
      0,  0, 16,  8,  4,  2,  1,  0,    # \
      0, 14,  8,  8,  8,  8,  8, 14,    # ]
      0,  0,  0,  0,  0, 17, 10,  4,    # ^
     31,  0,  0,  0,  0,  0,  0,  0/    # _

data part3/_
      0,  0,  0,  0,  0,  8,  4, 12,    # `
      0, 22,  9, 14,  8,  7,  0,  0,    # a
      0,  7,  9,  9,  9,  7,  1,  1,    # b
      0, 14,  1,  1,  1, 14,  0,  0,    # c
      0, 28, 18, 18, 18, 28, 16, 16,    # d
      0, 14,  1, 31, 17, 14,  0,  0,    # e
      0,  4,  4,  4, 31,  4, 20, 12,    # f
      7,  8, 14,  9,  9, 14,  0,  0,    # g
      0,  9,  9,  9,  9,  7,  1,  1,    # h
      0, 14,  4,  4,  4,  6,  0,  4,    # i
      4,  10, 8,  8,  8, 12,  0,  8,    # j
      0,  9,  5,  3,  5,  9,  1,  1,    # k
      0, 14,  4,  4,  4,  4,  4,  6,    # l
      0, 21, 21, 21, 21, 15,  0,  0,    # m
      0, 17, 17, 17, 17, 15,  0,  0,    # n
      0, 14, 17, 17, 17, 14,  0,  0,    # o
      1,  1,  7,  9,  9,  7,  0,  0,    # p
     24,  8, 14,  9,  9, 14,  0,  0,    # q
      0,  1,  1,  1, 11,  5,  0,  0,    # r
      0, 15, 16, 14,  1, 14,  0,  0,    # s
      0, 12,  2,  2,  2, 15,  2,  2,    # t
      0, 22,  9,  9,  9,  9,  0,  0,    # u
      0,  4, 10, 10, 17, 17,  0,  0,    # v
      0, 10, 21, 21, 17, 17,  0,  0,    # w
      0, 17, 10,  4, 10, 17,  0,  0,    # x
     14, 16, 30, 17, 17, 17,  0,  0,    # y
      0, 15,  1,  2,  4, 15,  0,  0,    # z
      0, 24,  4,  4,  2,  4,  4, 24,    # {
      0,  4,  4,  4,  0,  4,  4,  4,    # |
      0,  3,  4,  4,  8,  4,  4,  3,    # }
      0,  0,  0,  0,  0,  8, 21,  2,    # ~
      0, 31, 31, 31, 31, 31, 31, 31/   # rubout

xtemp = x                                  # save start point
ytemp = y

# exchange x and y on 90 and 270 degree rotation
itemp = divid (rotat, 2, m)
qchang = .false.
if (m != 0) {
   qchang = .true.
   xtemp = y
   ytemp = x
   }

i = rotat + 1
colinc = coltbl (i)                        # determine row & column
rowinc = rowtbl (i)                        #   increments
tmpwid = mult (width , size)               # set intercharacter spacing
if (rotat >= 2) tmpwid = -tmpwid           # negate spacing for 180 & 270 
					   #   degree rotations
 
# modify starting position to account for 1 pixel descender
if (descnd(i) > 0) ytemp = ytemp + size
else               ytemp = ytemp - size

do k=1,length {
   i = gimnmx (txtstr(k), 32, 127)         # make sure character in range
   istart = mult ((i-32), 8) + 1           # get pointer to start of pixels
   xcoord = xtemp                          # set initial position
   ycoord = ytemp
   do i=0,eval(ROWS-1) {                   # loop over rows of pixels
      iptr = istart + i
      do rowrpt=1,size {
 
         itemp = fntary(iptr)              # get current row
 
	 do j=0,eval(COLUMNS-1) {          # loop over columns in current row
 
	    itemp = divid (itemp, 2, m)    # m = current bit of char definition
					   #     0 - off, 1 - on
 
	    do colrpt=1,size {
	       if (qchang) {               # switch x & y back for bit setting
		  xparm = ycoord
		  yparm = xcoord
		  }
               else {
		  xparm = xcoord
		  yparm = ycoord
		  }

	       if (xparm >= 0 & yparm >= 0 & xparm <= XxLIMITSxOTRONA & _
		   yparm <= YxLIMITSxOTRONA) {

		  call dcotrn (m)                     # set color
		  call drotrn (MOVE, xparm, yparm)    # Turn pixel on
		  }
 
               # update x,y for next pixel in row
               xcoord = xcoord + colinc
               }
            }
 
         # update x,y for next row
         xcoord = xtemp
         ycoord = ycoord + rowinc
         }
E 2
I 2
   do i= 1, 4 {
      call otrnot (buffer(i))
E 2
      }
 
D 2
   # update position for next character
   xtemp = xtemp + tmpwid
   }
 
return
E 2
I 2
   return
E 2
end
D 2
subroutine dcotrn(color)
E 2
I 2
subroutine dcotrn (color)
E 2
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
D 2
#     Function: Change the color on the retro-graphics terminal      #
E 2
I 2
#     Function: Change the color on the Otrona                       #
E 2
#                                                                    #
#     Input Parameters:                                              #
#            color - color to change to                              #
#                                                                    #
#     Output Parameters:                                             #
#            none                                                    #
#                                                                    #
#     Routines called:                                               #
#            dootrn - output a string to the Otrona                  #
#                                                                    #
######################################################################
integer color

D 2
integer fcolor(2)
E 2
I 2
SHORTINT fcolor(2)
E 2

D 2
integer ccltb(2), sclrd(2), sclgr(2), sclbl(2), irow, icol
E 2
I 2
integer writmd, ccltb(2), sclrd(2), sclgr(2), sclbl(2), irow, icol
E 2

include(`ddcom')

D 2
common /cmotrn/ ccltb, sclrd, sclgr, sclbl, irow, icol
E 2
I 2
common /cmotrn/ writmd, ccltb, sclrd, sclgr, sclbl, irow, icol
E 2
 
#       Set the foreground color
data fcolor/ ESC, SPACE/

if (ndclrp != color) {       # Does color need to be changed
   ndclrp = color            # Set the current color

   # color 0 is black (background)
   # color 1 is white (foreground)
   if (color == 0) fcolor(2) = DIG9   # Use the background color
   else            fcolor(2) = DIG8   # Use the foreground color

   call dootrn (2, fcolor)
   }

return
end
D 2
subroutine drotrn (opcode, kx, ky)
E 2
I 2
subroutine dootrn (n, str)
E 2
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
D 2
#     Function: Move or draw to the specified x,y coordinate           # 
E 2
I 2
#     Function: Output an ADE character string to the Otrona           #
E 2
#                                                                      #
#     Input Parameters:                                                #
D 2
#           opcode   - Opcode indicating move or draw function         #
#           kx       - x-coordinate in 0 to device dependent space     #
#           ky       - y-coorindate in 0 to device dependent space     #
E 2
I 2
#           n        - number of characters to be output               #
#           str      - integer array of ADE characters                 #
E 2
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
D 2
#            dootrn - Output a character string to the device          #
#            xyotrn - Output an xy-coordinate pair on the Otrona       #
E 2
I 2
#            ttyout - Output a character to the Otrona                 #
#            otrnot - Output control character to the Otrona           #
E 2
#                                                                      #
########################################################################
D 2
define(`MOVE',`1')
define(`DRAW',`2')
integer opcode, kx, ky
integer movdrw(2), md2
 
include(`ddcom')
 
equivalence (movdrw(2), md2)
data movdrw /ESC, DIG0/
E 2

D 2
   # Set move or draw opcode
   md2 = DIG0
   if (opcode == DRAW) md2 = DIG1
E 2
I 2
integer n
SHORTINT str(1)
E 2

D 2
   call dootrn (2, movdrw)
   call xyotrn (kx, ky)    # convert coordinates and output them
   return
E 2
I 2
integer i, j

if (n > 0) {
   do i=1,n {
      j = str(i)
      call otrnot (j)  # special to send control chars
      }
   }

return
E 2
end
D 2
subroutine xyotrn (kx, ky)
E 2
I 2
subroutine dmotrn (intin)
E 2
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
D 2
#     Function: Convert x,y coordinate and output it to the Otrona     # 
E 2
I 2
#     Function: Place a marker at the desired location on a otrona     #
E 2
#                                                                      #
#     Input Parameters:                                                #
D 2
#           kx       - x-coordinate in 0 to device dependent space     #
#           ky       - y-coorindate in 0 to device dependent space     #
#                                                                      #
E 2
I 2
#            intin   - x/y location for marker                         #
E 2
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
D 2
#            dootrn - Output a character string to the device          #
#            divid - divide 2 16-bit unsigned integers                 #
E 2
I 2
#            drotrn - otrona  move/draw routine                        #
E 2
#                                                                      #
########################################################################
D 2
define(`MOVE',`1')
define(`DRAW',`2')
integer kx, ky
integer divid, buffer(4), x1, x2, y1, y2
E 2
I 2
define(`MOVE',1)
define(`DRAW',2)
define(`MARKxPERIOD',`1')
define(`MARKxPLUS',`2')
define(`MARKxSTAR',`3')
define(`MARKxO',`4')
define(`MARKxX',`5')
define(`FULLSZ',`4')
define(`HALFSZ',`2')
define(`FPERSZ',`0')
define(`HPERSZ',`0')
E 2
 
I 2
integer intin(2)
 
integer fsize, hsize, x1, x2, y1, y2
integer rxy1, rxy2
 
E 2
include(`ddcom')
D 2
# The following equivalences were made to reduce code size:
#     buffer(1) = x1
#     buffer(2) = x2
#     buffer(3) = y1
#     buffer(4) = y2
equivalence (buffer(1),x1), (buffer(2),x2), (buffer(3),y1), (buffer(4),y2)
E 2
 
D 2
   x1 = divid (kx, ATSIGN, x2) 
E 2
I 2
   if (ndmktp == MARKxPERIOD) {
      fsize = FPERSZ
      hsize = HPERSZ
      }
   else {
      fsize = FULLSZ
      hsize = HALFSZ
      }
E 2
 
D 2
   y1 = divid (ky, ATSIGN, y2)
E 2
I 2
   x1 = intin(1) - hsize        #clip marker to device limits
   x2 = x1 + fsize
   y1 = intin(2) - hsize
   y2 = y1 + fsize
   if (x1 < 0 | y1 < 0 | x2 > XxLIMITSxOTRONA | y2 > YxLIMITSxOTRONA) return
E 2
 
D 2
   call dootrn (4, buffer)
E 2
I 2
   # output appropriate marker centered on location
E 2
 
I 2
   if (ndmktp == MARKxPERIOD)  call setbit (intin(1), intin(2))

   else if  (ndmktp == MARKxO) {
      call drotrn (x1, y1, x2, y1)
      call drotrn (x2, y1, x2, y2)
      call drotrn (x2, y2, x1, y2)
      call drotrn (x1, y2, x1,y1)
      }
   else {
      if (ndmktp == MARKxX | ndmktp == MARKxSTAR) {
         call drotrn (x1, y1, x2, y2)
         call drotrn (x1, y2, x2, y1)
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
         rxy2 = y1 + hsize
         call drotrn (x1, rxy2, x2, rxy2)
         rxy1 = x1 + hsize
         call drotrn (rxy1, y1, rxy1, y2)
         }
      }

E 2
   return
end
D 2
subroutine dootrn (n, str)
E 2
I 2
subroutine dlotrn (x1, y1, x2, y2)
E 2
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
D 2
#     Function: Output an ADE character string to the Otrona           #
E 2
I 2
#     Function: Draw a line into the raster buffer of the otrona       #
E 2
#                                                                      #
#     Input Parameters:                                                #
D 2
#           n        - number of characters to be output               #
#           str      - integer array of ADE characters                 #
#                                                                      #
E 2
I 2
#            x1,y1 - first point of line                               #
#            x2,y2 - second point of line                              #
E 2
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
D 2
#            ttyout - Output a character to the Otrona                 #
#            otrnot - Output control character to the Otrona           #
#                                                                      #
E 2
I 2
#            setbit - turn on a pixel in the otrona  raster buffer     #
#            mult   - multiply 2 16 bit integers                       #
E 2
########################################################################
I 2
define(`DASHxINCREMENT',4) 
integer x1, y1, x2, y2, x, y, dx, dy, d, adx, ady, adx2, ady2
integer xtemp1, xtemp2, ytemp1, ytemp2, xend, temp, xincr, curclr
integer patrn, numpnt, k, kk, action, actary(20)
logical qchang
integer mult, gimnmx
E 2

D 2
integer n, str(1)
E 2
I 2
include(`ddcom')
E 2

D 2
integer i, j
E 2
I 2
# action definitions for line styles 1-5:  0=move, 1=draw, 2=point
data actary /1,1,1,1, 2,2,2,2, 2,0,1,0, 0,1,0,1, 0,1,1,0/
E 2

D 2
if (n > 0) {
   do i=1,n {
      j = str(i)
      if (j >= SPACE) call ttyout (j)  # send printable ASCII chars
      else            call otrnot (j)  # special to send control chars
      }
E 2
I 2
# Set up to do dash patterns
patrn = 0
numpnt = 0
k = mult((ndlntp-1),4) + 1
curclr = ndclrp  # Get a local copy of the line color

xtemp1 = gimnmx( x1, 0, 319)
xtemp2 = gimnmx( x2, 0, 319)
ytemp1 = gimnmx( y1, 0, 239)
ytemp2 = gimnmx( y2, 0, 239)
 
dx = xtemp2 - xtemp1
dy = ytemp2 - ytemp1
adx = iabs (dx)
ady = iabs (dy)
qchang = .false.
 
if (ady > adx) {    # switch x and y if slope > 1
   temp = xtemp1
   xtemp1 = ytemp1
   ytemp1 = temp
   temp = xtemp2
   xtemp2 = ytemp2
   ytemp2 = temp
   temp = adx
   adx = ady
   ady = temp
   qchang = .true.
E 2
   }
I 2
 
adx2 = mult(2, adx)
ady2 = mult(2, ady)
temp = ady2 - adx2
 
xincr = 1
if (isign (1,dx) != isign(1,dy)) xincr = -1
 
if (ytemp1 <= ytemp2) {   # Determine start point
   x = xtemp1
   y = ytemp1
   xend = xtemp2
   }
else {
   x = xtemp2
   y = ytemp2
   xend = xtemp1
   }
 
if (ndlntp == 1)  {  # Only turn the first pixel on if doing solid linetype
   if (qchang) call setbit (y,x)
   else        call setbit (x,y)
   }
 
d = -adx + ady2        # Compute initial error
 
for (; x != xend;) {
E 2

I 2
   if (d < 0) {
      d = d + ady2
      }
   else {
      d = d + temp     # temp = ady2 - adx2
      y = y + 1
      }
   numpnt = numpnt + 1   
   x = x + xincr
   kk = patrn + k
   action = actary(kk)

   # Do not do anything for a move
   ndclrp = 0
   
  if (action == 1)  {  # Working on a real dash now
      ndclrp = curclr
      }
   else if (action == 2)  {  # Working on a dot now
      if (numpnt == DASHxINCREMENT)  {  # Time to light the dot
         ndclrp = curclr
	 }
      }

   if (qchang) call setbit (y,x)
   else        call setbit (x,y)

   if (numpnt == DASHxINCREMENT)  { # Time to reset to new pattern
      numpnt = 0   # Reset pixel count for the pattern
      patrn = patrn + 1    # Increment index into action array
      if (patrn == 4)  patrn = 0   # There are only 4 actions per linetype
      }
   }
ndclrp = curclr   # Restore the current color
E 2
return
end
D 2

E 2
E 1
