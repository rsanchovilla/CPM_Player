h36014
s 00761/00000/00000
d D 1.1 83/03/17 15:49:26 tes 1 0
c date and time created 83/03/17 15:49:26 by tes
e
u
4
U
t
T
I 1
subroutine dd4636 (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device Driver for Watanabe 4636 Plotter                #
#                                                                      #
#     Input Parameters:                                                #
#            contrl(1) - opcode for driver function                    #
#            contrl(2) - number of vertices in array ptsin             #
#            contrl(4) - length of integer array                       #
#            contrl(6-n) - opcode dependent information                #
#                                                                      #
#            intin   -     Array of integer input parameters           #
#            ptsin   -     Array of input coordinate data              #
#                                                                      #
#     Output Parameters:                                               #
#            contrl(3) -   number of vertices in array ptsout          #
#            contrl(5) -   length of integer array intout              #
#            contrl(6-n) - opcode dependent information                #
#                                                                      #
#            intout    -   array of integer output parameters          #
#            ptsout    -   array of output coordinate data             #
#                                                                      #
#     Routines Called:                                                 #
#             Gznfpl - prompt the user for a new sheet of paper        #
#             Dr4636 - move/draw for Watanabe plotter                  #
#             Dp4636 - Change pens on the Watanabe plotter             #
#             Gchtoi  - convert character string to integer            #
#             Divid  - divide 2 unsigned 16-bit numbers                #
#             Mult   - multiply 2 16-bit numbers                       #
#             Gimnmx - Function to place integer value in a range      #
#             Gdevin - Put a character to the graphic device           #
#             Gdstot - Put a character string to the graphic device    #
#             Gdstin - Get a character string from the graphic device  #
#                                                                      #
########################################################################

# local defines
divert(-1)
define(`XxLIMITSxWAT4636',3809)    #plotter surface width
define(`YxLIMITSxWAT4636',2539)    #plotter surface height
define(`MOVE',1)
define(`DRAW',2)
define(`HOLLOW',0)                 # hollow fill interior style
define(`SOLID',1)                  # solid fill interior style
define(`PATTERN',2)                # pattern fill interior style
define(`HATCH',3)                  # hatch fill inteior style
define(`DEFAULT',1)                # default gin device
define(`CROSSHAIRS',2)             # crosshair gin device (the pen holder)
define(`UNSUCCESSFUL',0)           # unsuccessful request status
define(`SUCCESSFUL',1)             # successful request status
divert
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
SHORTINT opcode
integer i, j, k, gimnmx, length, icnvt(25), ierr, setup(9), 
	lstyle(3), solid(3), txsize(2), fill, xcnvt(4), ycnvt(4), 
	lenx, leny, barang(7), barspc(7), makbox(3), endbox(5),
	makfil(3), tries, ginok, istop, xy(2), xcoord, ycoord,
	savexy(2), savex, savey, x1, x2, y1, y2
integer divid, muldiv, gitoch
 
integer fulsiz, hlfsiz
 
integer clrred(10), clrgrn(10), clrblu(10)
 
include(`ddcom')
 
common /cm4636/ clrred, clrgrn, clrblu

equivalence (xcoord , xy(1)) , (ycoord , xy(2))
equivalence (savex , savexy(1)) , (savey , savexy(2))

#  Initialize the plotter:
#      Set the command terminator:       = <cr> <cr>
#      Do an alpha reset:                A
#      Set the line type scale factor:   B 5 0 ,
#      Move to home:                     H
data setup /EQUALS, CR, CR, BIGA, BIGB, DIG5, DIG0, COMMA, BIGH/

# Set a line type:
data lstyle /BIGL, DIG0, COMMA/

# Set a solid line type:
data solid /BIGL, DIG0, COMMA/

# Set text spacing:
data txsize /COMMA, BIGQ/

#  Create a box:  / % 1 , /
data makbox /PERCENT, DIG1, COMMA/

# Create a filled area:  / % 2 , /
data makfil / PERCENT, DIG2, COMMA/

# End a box / , 0 , 0 , /
data endbox /COMMA, DIG0, COMMA, DIG0, COMMA /

# Table to specify the angle of the fills inside a bar in .1 degree incs
data barang /0, 900, 0, 450, 1350, 300, 1200/

# Table to specify the distance between lines of a bar
data barspc /1, 30, 30, 30, 30, 15, 15/


opcode=contrl(OPCODE)
contrl(3) = 0                  # Assume no vertices are being passed back

#
# opcode open workstation
#
if (opcode == OPENxWORKSTATION) {
 
   contrl(3) = 6               # Set to number of output vertices
   contrl(5) = 45              # Length of array intout

   # set up output capability array
 
   intout(1) = XxLIMITSxWAT4636 # Maximum addressable screen width
   intout(2) = YxLIMITSxWAT4636 # Maximum addressable screen height
   intout(3) = METERS          # Device coordinates are meters
   intout(4) = 10              # X step size in micrometers
   intout(5) = 10              # Y step size in micrometers
   intout(6) = 0               # Number of character heights
   intout(7) = 9               # Number of line types
   intout(8) = 1               # Number of line widths
   intout(9) = 15              # Number of marker types
   intout(10) = 0              # Number of marker sizes 
   intout(11)= 10              # Number of text fonts
   intout(12)= 0               # Number of patterns
   intout(13)= 6               # Number of hatch styles
   intout(14)= 10              # Number of predefined colors
   intout(15)= 2               # Number of GDPs
   intout(16)= BAR             # We got bars
   intout(17)= ARC             # We got arcs
   intout(26)= 3               # Bars use fill area attributes
   intout(27)= 0               # Arcs use polyline attributes
   do i=18,25 {  # Finish filling out the gdp array
      intout(i) = -1
      intout(i+10) = -1
      }
   intout(36)= 1               # Device is capable of color
   intout(37)= 1               # Device is capable of text rotation
   intout(38)= 0               # Device is not capable of filled area
   intout(39)= 0               # Device is not capable of pixel operations
   intout(40)= 0               # Number of colors available, plotters have all
   intout(41)= 1               # Number of locator devices available
   intout(42)= 0               # Number of valuator devices available
   intout(43)= 0               # Number of choice devices available
   intout(44)= 0               # Number of string devices available
   intout(45)= 2               # Workstation type (input/output)

   ptsout(1) = 0
   ptsout(2) = 1               # Minimum character height in DC space
   ptsout(3) = 0
   ptsout(4) = 8000            # Maximum character height in DC space
   ptsout(5) = 1               # Minimum line width in DC space
   ptsout(6) = 0
   ptsout(7) = 1               # Maximum line width in DC space
   ptsout(8) = 0
   ptsout(9) = 0
   ptsout(10)= 20              # Minimum marker height in DC space
   ptsout(11)= 0
   ptsout(12)= 8000            # Maximum marker height in DC space

   i = intin(2) - 1   # Determine line pattern
   if (i > 9) i = 9
   ndlntp = gimnmx (i, 0, 9) + DIG0      # Set current device line style
   ndclrl = gimnmx (intin(3), 0, 9)      # Set current polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 15) ndmktp=3
   ndclrm = gimnmx (intin(5), 0, 9)      # Set current polymarker color index
   ndclrt = gimnmx (intin(7), 0, 9)      # Set current text color index
   ndclrf = gimnmx (intin(10), 0, 9)     # Set current fill area color index
   ndmkht = 28                           # Set default marker height 
   ndtysz = 20                           # Set default character height
   ndtxrt = 0                            # Set default rotation to 0 degrees
   ndfstl = HOLLOW                       # Default fill is hollow
   ndflpt = 0                            # Default fill pattern is 0

   ndclrp = -1                           # Set current device color
 
   do i = 1, 10 {  # Start out by making all colors black
      clrred(i) = 0
      clrgrn(i) = 0
      clrblu(i) = 0
      }
   clrred(2) = 1   # index 1 is red
   clrgrn(3) = 1   # index 2 is green
   clrblu(4) = 1   # index 3 is blue
   clrblu(5) = 1   # index 4 is cyan
   clrgrn(5) = 1
   clrblu(6) = 1   # index 5 is magenta
   clrred(6) = 1
   clrred(7) = 1   # index 6 is yellow
   clrgrn(7) = 1
   clrred(8) = 1   # index 7 is white
   clrgrn(8) = 1
   clrblu(8) = 1
   #  And all the rest are black

   # initialize plotter

   call gioini (11)          # Iniitalize i/o system for logical plotter device
   call gdstot (9, setup)

   # Set the line pattern
   lstyle(2) = ndlntp
   call gdstot (3, lstyle)
   }

#
#  opcode close workstation
#
else if (opcode == CLOSExWORKSTATION) {
   call gdevot (BIGH)         # Home the plotter
   call gdevot (NEWLINE)      # Dump the final buffer
   call giostp                # Close i/o system
   }

#
#  opcode clear workstation
#
else if (opcode == CLEARxWORKSTATION) {
   call gdevot (BIGH)        # Home the plotter
   call gdevot (NEWLINE)
   call gznfpl               # prompt user for new paper (new frame on plotter)
   }
 
#
#  opcode update workstation
#
else if (opcode == UPDATExWORKSTATION) {
   call gdevot (NEWLINE)
   }

#
#  opcode escape
#
else if (opcode == ESCAPE) {
   if (contrl(4) == INQUIRExADDRESSABLExCELLS) {
      intout(1) = -1
      intout(2) = -1
      }
   else { 
      call gdstot (contrl(INTEGERxINxLENGTH), intin)
      }
   }

#
#  opcode polyline
#
else if (opcode == POLYLINE) {
 
   call dr4636 (MOVE, ptsin(1))                  # Move to first point

   if (ndclrp != ndclrl)  {
      call dp4636 (ndclrl)   # Change color to line color
      }

   j = 3
   for (i=2; i<=contrl(2); i=i+1) {              # Draw between subsequent pts
      call dr4636 (DRAW, ptsin(j))
      j = j + 2
      }
   }
 
#
#  opcode polymarker
#
else if (opcode == POLYMARKER) {
 
   call dr4636 (MOVE, ptsin(1))                  # Move to first point

   if (ndclrp != ndclrm)  {
      call dp4636 (ndclrm)                 # Change color if necessary
      }
 
   # Set the marker size
   length = gitoch (ndmkht, icnvt, 4, ierr)
   call gdevot (BIGS)
   call gdstot (length, icnvt)
   call gdevot (COMMA)

   # Set for marker clipping
   fulsiz = ndmkht
   hlfsiz = divid(fulsiz, 2, k)

   # Convert the marker into the marker buffer
   length = gitoch (ndmktp, icnvt, 2, ierr)

   j = 1
   for (i=1; i<=contrl(2); i=i+1) {       # Output marker at each point

      xcoord = ptsin(j)
      ycoord = ptsin(j+1)

      # Clip marker to device limits
      x1 = xcoord - hlfsiz
      x2 = x1 + fulsiz
      y1 = ycoord - hlfsiz
      y2 = y1 + fulsiz
      if ((min0(x1,y1) >= 0) & (x2 <= XxLIMITSxWAT4636) & _
	 (y2 <= YxLIMITSxWAT4636)) {           # Marker fits on device
         call dr4636 (MOVE, ptsin(j))         # Move to center point
	 call gdevot (BIGN)
	 call gdstot (length, icnvt)             # Put out a particular marker
	 call gdevot (COMMA)
	 }
      j = j + 2                               # Increment ptr to coords
      }
   # Restore user's text size
   length = gitoch (ndtysz, icnvt, 4, ierr)
   call gdevot (BIGS)
   call gdstot (length, icnvt)
   call gdevot (COMMA)
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
 
   call dr4636 (MOVE, ptsin(1))                  # Move to first point

   if (ndclrp != ndclrt)  {
      call dp4636 (ndclrt)            # Change color to text color
      }
 
   i = contrl(4)
   call gdevot (BIGP)    #  Text command
   call gdstot (i, intin)
   call gdevot (CR)      #  End the string with a CR
   call gdevot (NEWLINE)
   }
 
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   call dr4636 (MOVE, ptsin(1))                  # Move to first point

   call dp4636 (ndclrf)                       # Change color to fill color
   call gdstot (3, solid)                     # Set linetype to solid

   j = 3
   for (i=2; i<=contrl(2); i=i+1) {  # draw between subsequent points
      call dr4636 (DRAW, ptsin(j))
      j = j + 2
      }
   call dr4636 (DRAW, ptsin(1))      # draw to first point to make sure
				     # polygon closed
   call dr4636 (MOVE, ptsin(1))      # now move there again to pick up the pen

   # restore line type
   lstyle(2) = ndlntp
   call gdstot (3, lstyle)
   
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {
   call gdstot (3, solid)                     # Set linetype to solid

   savex = ptsin(1)                           # Save boundary points
   savey = ptsin(2)
   x2 = ptsin(3)
   y2 = ptsin(4)

   call dr4636 (MOVE, savexy)                 # Move to first point
   call dp4636 (ndclrl)                       # Change color to line color

   xcoord = x2                                # Draw boundary around area
   ycoord = savey
   call dr4636 (DRAW, xy)
   ycoord = y2
   call dr4636 (DRAW, xy)
   xcoord = savex
   call dr4636 (DRAW, xy)
   call dr4636 (DRAW, savexy)
   call dr4636 (MOVE, ptsin(1))     # Now pick the pen back up


   # restore line type
   lstyle(3) = ndlntp
   call gdstot (6, lstyle)
   }

#
#  opcode generalized drawing primative
#
else if (opcode == GENERALIZEDxDRAWINGxPRIMITIVE)  {
   opcode = contrl(6)     # Get primative ID

   #
   #  filled bar
   # 
   if (opcode == BAR)  {

      if (ndclrp != ndclrf)  {
         call dp4636 (ndclrf)
         }
      call dr4636 (MOVE, ptsin)   # Move to a corner
 
      #  Convert x point to a string
      i = ptsin(3) - ptsin(1) 
      lenx = gitoch (i, xcnvt, 4, ierr)
 
      #  Convert y point to a string
      j = ptsin(4) - ptsin(2) 
      leny = gitoch (j, ycnvt, 4, ierr)
 
      if (ndfstl > 0 )   {  # The bar is to be filled
         # Put out the cross hatching
         call gdstot (3, makfil)
         call gdstot (lenx, xcnvt)
         call gdevot (COMMA)
         call gdstot (leny, ycnvt)
         call gdevot (COMMA)
	 if (ndfstl == SOLID)   {
	    fill = 1
	    }
	 else  {  # Use the correct pattern
	    fill = ndflpt + 2
	    }
         length = gitoch (barspc(fill), icnvt, 2, ierr)
         call gdstot (length, icnvt)
         call gdevot (COMMA)
         if (ndfstl == SOLID)  {  # Use a solid fill
            #  Detemine which is the long axis and fill along that one
            if (j > i)   {  barang(1) = 900  }
            else         {  barang(1) = 0    }
            }
         length = gitoch (barang(fill), icnvt, 4, ierr)
         call gdstot (length, icnvt)
         call gdevot (COMMA)
         call dr4636 (MOVE, ptsin) # Need to move back to the lower left corner
         }
      # Now do the outline ( This will help any bleeding that may result)
      call gdstot (3, makbox)
      call gdstot (lenx, xcnvt)
      call gdevot (COMMA)
      call gdstot (leny, ycnvt)
      call gdstot (5, endbox)
      }
   #
   #   Arc
   #
   else if (opcode == ARC) {
      if (ndclrp != ndclrl)  {   # Arcs use the line color
	 call dp4636 (ndclrl)
	 }
      call gdevot (BIGW)                # Start the circle command
      length = gitoch (ptsin(1), icnvt, 4, ierr)
      call gdstot (length, icnvt)       # X point of the center
      call gdevot (COMMA)
      length = gitoch (ptsin(2), icnvt, 4, ierr)
      call gdstot (length, icnvt)       # Y point of the center
      call gdevot (COMMA)
      # Command uses starting and stopping radius, for us, both are the same
      length = gitoch (ptsin(7), icnvt, 4, ierr)
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      length = gitoch (intin(1), icnvt, 4, ierr)  # This is the start angle
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      length = gitoch (intin(2), icnvt, 4, ierr)   # This is the ending angle
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      }
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
   i = ptsin(2)   # The input character size
   if (i == 0) i = 1
   length = gitoch (i, icnvt, 4, ierr)

   call gdevot (BIGS)         # The text size command
   call gdstot (length, icnvt)   # Make it this size
   call gdstot (2, txsize)    # A comma and the text space command 
   call gdstot (length, icnvt)   # Make the Space the same as the height
   call gdevot (COMMA)

   ndtysz = i  # Save size for later use
   contrl(3) = 2
   ptsout(1) = muldiv (i, 4, 7)   # This is the real character width
   ptsout(2) = i                  # Character height
   ptsout(3) = i                  # Character cell width is set to height
   ptsout(4) = i                  # Character cell height is the char height
   }
 
#
#  opcode set character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
      i = intin(1)
      call gdevot (BIGR)
      length = gitoch (i, icnvt, 4, ierr)
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      intout(1) = i # Return the angle as given
      }

#
#  opcode set color
#
else if (opcode == SETxCOLORxREPRESENTATION) {
   # Save 9 color indices, 1 for each pen station.  The requested
   # value is the same as the realized value
   i = gimnmx (intin, 0, 9) + 1        # Get color index in range
   clrred(i) = intin(2)
   clrgrn(i) = intin(3)
   clrblu(i) = intin(4)
   }

#
#  opcode set line type
#
else if (opcode == SETxPOLYLINExLINETYPE) {
   ndlntp =  intin(1) 
   if (ndlntp < 1 | ndlntp > 9) ndlntp = 1
   intout(1) = ndlntp                      # Return linetype selected
   ndlntp = ndlntp + SLASH                 # Map to device parameter
   lstyle(2) = ndlntp
   call gdstot (3, lstyle)
   }
 
#
#  opcode polyline color index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX)  {
   ndclrl = gimnmx (intin(1), 0, 6)
   intout(1) = ndclrl                       # Return color index selected
   }
 
#
#  opcode set marker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 15) ndmktp = 3  # Marker type 3 is default
   intout(1) = ndmktp                       # Return type selected
   }

#
#  opcode polymarker scale
#
else if (opcode == SETxPOLYMARKERxSCALE) {
   i = ptsin(2)
   if (i < 20) i = 20
   ndmkht = muldiv (i, 7, 4)  # A marker is only 4/7 tall as same size character

   contrl(3) = 1              # Return 1 coordinate pair
   ptsout(1) = 0
   ptsout(2) = i              # Return size selected
   }

#
#  opcode polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX)  {
   ndclrm = gimnmx (intin(1), 0, 9)
   intout(1) = ndclrm                       # Return color index selected
   }
 
#
#  opcode set text font
#
else if (opcode == SETxTEXTxFONT)  {
   i = gimnmx (intin(1), 1, 10)
   call gdevot (DOLLAR)
   call gdevot (i+SLASH)
   call gdevot (COMMA)
   intout(1) = i
   }

#
#  opcode text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX)  {
   ndclrt = gimnmx (intin(1), 0, 9)
   intout(1) = ndclrt               # Return color index selected
   }

#
#  opcode set fill interior style 
#
else if (opcode == SETxFILLxINTERIORxSTYLE)  {
   i = intin(1)
   if (i < HOLLOW | i == PATTERN | i > HATCH) i = HOLLOW
   ndfstl = i
   intout(1) = i 
   }

#
#  opcode set fill style index
#
else if (opcode == SETxFILLxSTYLExINDEX)  {
   i = gimnmx (intin(1), 1, 6)
   ndflpt = i
   intout(1) = i
   }
 
#
#  opcode set fill color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
   ndclrf = gimnmx (intin(1), 0, 9)
   intout(1) = ndclrf               # Return color index selected
   }
 
#
#  opcode inquire color representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 9) +1   # Map index 0-9 to 1-10
   intout(1) = i - 1                # Color index selected
   intout(2) = clrred(i)            # Set values are same as realized
   intout(3) = clrgrn(i)
   intout(4) = clrblu(i)
   }
 
#
# opcode input locator
#
else if (opcode == INPUTxLOCATOR)  {
   contrl(5) = UNSUCCESSFUL   # Initialize status
   i = intin(1)               # Check input device
   if (i != DEFAULT & i != CROSSHAIRS)  return  # Invalid device

   call dr4636 (MOVE, ptsin)   # MNove cursor to initial position

   tries = 0
   ginok = NO
   repeat  {
      call gdevot (BIGC)  # Invoke gin
      call gdevot (NEWLINE)  # Flush the buffer
      call gdstin (24, icnvt, i)
      if (i <= 22) {
         ginok = YES
         }
      tries = tries + 1
      }  until (tries >= 3 | ginok == YES)
 
   if (ginok == YES)   {
      call gchtoi (icnvt, 1, ptsout(1), istop)
      call gchtoi (icnvt, 8, ptsout(2), istop)

      contrl(5) = SUCCESSFUL
      contrl(3) = 1  # one point returned
      intout(3) = SPACE
      }
   }

#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = 1     # Default mode is request
   }

   return
end
subroutine dp4636 (color)
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
#     Function: Device driver pen changer for the Watanabe plotter     #
#                                                                      #
#     Input Parameters:                                                #
#            color - pen station to change to                          #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - output a string to the current routine           #
#            gdevot - output a character to the current device         #
#                                                                      #
########################################################################
integer color
 
integer icnvt(2), length, ierr
integer gitoch
 
include(`ddcom')
 
   ndclrp = color         # set the current pen color
 
   call gdevot (BIGJ)     # Change the pen
   length = gitoch (color+1, icnvt, 2, ierr)
   call gdstot (length, icnvt)
   call gdevot (COMMA)
 
   return
end
subroutine dr4636 (opcode, xy)
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
#     Function: Device driver move / draw for Watanabe plotter         #
#                                                                      #
#     Input Parameters:                                                #
#            opcode - driver function, either move/draw                #
#            xy     - Array of input parameters                        #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - output a string to the current routine           #
#            gdevot - output a character to the current device         #
#            gitoch - convert an integer into a string of characters   #
#                                                                      #
########################################################################
integer opcode, xy(1)
 
integer length, positn, string(4), ierr
integer gitoch
 
include(`ddcom')
equivalence (length, positn)
 
   positn = BIGM
   if (opcode == DRAW)  { positn = BIGD }
   call gdevot (positn)
   length = gitoch (xy(1), string, 4, ierr)
   call gdstot (length, string)
   call gdevot (COMMA)
   length = gitoch (xy(2),string,4,ierr)
   call gdstot (length, string)
   call gdevot (CR)
   return
end
E 1
