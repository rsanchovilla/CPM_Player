h36065
s 00681/00000/00000
d D 1.1 83/03/15 21:20:27 tes 1 0
c date and time created 83/03/15 21:20:27 by tes
e
u
4
U
t
T
I 1
subroutine ddhi3m (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device Driver for Houston Instruments HI PLOT DMP-3    #
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
#             Dbufhi - buffered output for HI PLOT                     #
#             Gznfpl - prompt the user for a new sheet of paper        #
#             Drhi3m - move/draw for HI PLOT plotter                   #
#             Dphi3m - Change pens on the HI PLOT                      #
#             Gchtoi  - convert character string to integer            #
#             Divid  - divide 2 unsigned 16-bit numbers                #
#             Mult   - multiply 2 16-bit numbers                       #
#             Gimnmx - Function to place integer value in a range      #
#             Gdevin - Put a character to the graphic device           #
#             Gdstot - Put a character string to the graphic device    #
#             Gdstin - Get a character string from the graphic device  #
#                                                                      #
########################################################################

divert(-1)
# local defines
define(`XxLIMITSxHI3M',1880)               #plotter surface width
define(`YxLIMITSxHI3M',1400)               #plotter surface height
define(`MAXxHIxBUFFER',255)
define(`MOVE',1)
define(`DRAW',2)
divert
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
SHORTINT opcode
integer i, j, k, gimnmx, ibuf(3), space(1), index, stopgr(11), 
	setup(14),endtxt(1), txthgt(5), txtwid(5), rotang(4),
	solid(3), lstyle(3), newfrm(5), xy(2), xcoord, ycoord,
	savexy(2), savex, savey, x1, x2, y1, y2

integer divid, mult
 
integer fulsiz, hlfsiz
 
integer clrred(6), clrgrn(6), clrblu(6)
 
include(`ddcom')
 
common /cmhi3m/ clrred, clrgrn, clrblu

equivalence (xcoord , xy(1)) , (ycoord , xy(2))
equivalence (savex , savexy(1)) , (savey , savexy(2))

#   Start Graphics: Enable mode two handshaking,
#                   Move to home
#                   Set the Origin
#                   Select Absolute Pen moving
data setup /SPACE,SEMICOL,COLON,BIGI,DIG0,BIGD,SPACE,DIG0,SPACE,
	    BIGH,BIGO,BIGA,SPACE,NEWLINE/

#   Stop Graphics: Return pen, 
#                  Move to home, and 
#                  Deselect the plotter
data stopgr /BIGP,DIG0,SPACE,BIGU,DIG2,DIG0,DIG0,COMMA,DIG0,SPACE,ATSIGN/

#  Prepare for a paper change: put back pen and go home
data newfrm /BIGP, DIG0, BLANK, BIGH, BLANK/

#  Set line type to be solid
data solid /BIGL, DIG0, SPACE/

# Set the line type
data lstyle /BIGL, DIG0, SPACE/

#  Table to look up text rotation
data rotang /1, 4, 3, 2/

#  table to look up text size heights
data txthgt /14, 28, 56, 112, 224/

# table of text widths
data txtwid /12, 24, 48, 96, 192/

#  A space is used to separate some commands
data space /SPACE/

#  End text string with an underscore
data endtxt /UNDERLINE/


opcode=contrl(OPCODE)
contrl(3) = 0                  # Assume no vertices are being passed back

#
# opcode open workstation
#
if (opcode == OPENxWORKSTATION) {
 
   contrl(3) = 6               # Set to number of output vertices
   contrl(5) = 45              # Length of array intout

   # set up output capability array
 
   intout(1) = XxLIMITSxHI3M # Maximum addressable screen width
   intout(2) = YxLIMITSxHI3M # Maximum addressable screen height
   intout(3) = METERS          # Device coordinates are meters
   intout(4) = 125             # X step size in micrometers
   intout(5) = 125             # Y step size in micrometers
   intout(6) = 5               # Number of character heights
   intout(7) = 9               # Number of line types
   intout(8) = 1               # Number of line widths
   intout(9) = 6               # Number of marker types
   intout(10) = 5              # Number of marker sizes 
   intout(11)= 1               # Number of text fonts
   intout(12)= 0               # Number of patterns
   intout(13)= 0               # Number of hatch styles
   intout(14)= 6               # Number of predefined colors
   intout(15)= 0               # Number of GDPs
   do i=16,25 {
      intout(i) = -1
      intout(i+10) = -1
      }
   intout(36)= 1               # Device is capable of color
   intout(37)= 1               # Device is capable of text rotation
   intout(38)= 0               # Device is not capable of filled area
   intout(39)= 0               # Device is not capable of pixel operations
   intout(40)= 0               # Number of colors available, plotters have all
   intout(41)= 0               # Number of locator devices available
   intout(42)= 0               # Number of valuator devices available
   intout(43)= 0               # Number of choice devices available
   intout(44)= 0               # Number of string devices available
   intout(45)= 2               # Workstation type (input/output)

   ptsout(1) = 0
   ptsout(2) = 14              # Minimum character height in DC space
			       # .07 inches in 7 inches
   ptsout(3) = 0
   ptsout(4) = 224             # Maximum character height in DC space
			       # 1.12 inches in 7 inches
   ptsout(5) = 1               # Minimum line width in DC space
   ptsout(6) = 0
   ptsout(7) = 1               # Maximum line width in DC space
   ptsout(8) = 0
   ptsout(9) = 0
   ptsout(10)= 14              # Minimum marker height in DC space
			       # .07 inches in 7 inches
   ptsout(11)= 0
   ptsout(12)= 224             # Maximum marker height in DC space
			       # 1.12 inches in 7 inches

   i = intin(2) - 1   # Determine line pattern
   if (i > 8) i = 8
   ndlntp = gimnmx (i, 0, 8) + DIG0      # Set current device line style
   ndclrl = gimnmx (intin(3), 0, 5)      # Set current polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 6) ndmktp=3
   ndmktp = ndmktp + SLASH               # Map into device interface
   ndclrm = gimnmx (intin(5), 0, 5)      # Set current polymarker color index
   ndclrt = gimnmx (intin(7), 0, 5)      # Set current text color index
   ndclrf = gimnmx (intin(10), 0, 5)     # Set current fill area color index
   ndmkht = DIG1                         # Set default marker height .07 inch
   ndtysz = DIG1                         # Set default character height .07 inch
   ndtxrt = DIG0                         # Set default rotation to 0 degrees

   ndclrp = -1                           # Set current device color
 
   do i = 1, 6 {  # Start out by making all colors black
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

   # initialize plotter

   call gioini (11)          # Iniitalize i/o system for logical plotter device
   ndotkt = 0                # Initialize the plotter ouput counter. This
                             #    counter is used by the routine 'dbufhi'
   call dbufhi (14, setup)

   # Set the line pattern
   lstyle(2) = ndlntp
   call dbufhi (3, lstyle)
   }

#
#  opcode close workstation
#
else if (opcode == CLOSExWORKSTATION) {
   call dbufhi (-1, stopgr)      # Dump the final buffer
   call gdstot (11, stopgr)      # Terminate Graphics
   call giostp                   # Close i/o system
   }

#
#  opcode clear workstation
#
else if (opcode == CLEARxWORKSTATION) {
   call dbufhi (5, newfrm)  # Home the plotter
   call dbufhi (-1, newfrm)  # Dump buffer
   call gznfpl               # prompt user for new paper (new frame on plotter)
   ndclrp = -1               # Force plotter to pick up pen again
   }
 
#
#  opcode update workstation
#
else if (opcode == UPDATExWORKSTATION) {
   call dbufhi (-1, space)
   }

#
#  opcode escape
#
else if (opcode == ESCAPE) {
   if (contrl(6) == INQUIRExADDRESSABLExCELLS) {
      intout(1) = -1
      intout(2) = -1
      }
   }

#
#  opcode polyline
#
else if (opcode == POLYLINE) {
 
   call drhi3m (MOVE, ptsin(1))                  # Move to first point

   if (ndclrp != ndclrl)  {
      call dphi3m (ndclrl)   # Change color to line color
      }

   j = 3
   for (i=2; i<=contrl(2); i=i+1) {              # Draw between subsequent pts
      call drhi3m (DRAW, ptsin(j))
      j = j + 2
      }
   }
 
#
#  opcode polymarker
#
else if (opcode == POLYMARKER) {
 
   call drhi3m (MOVE, ptsin(1))            # Move to the first point

   if (ndclrp != ndclrm)  {
      call dphi3m (ndclrm)                 # Change color if necessary
      }
 
   index = ndmkht-DIG0 # Determine marker size in device coords for clipping
   fulsiz = txthgt(index)
   hlfsiz = divid(fulsiz, 2, k)

   ibuf(1) = BIGM                       # Enter marker mode
   ibuf(2) = ndmkht                     # This is the marker size
   ibuf(3) = ndmktp                     # And this is the marker

   j = 1
   for (i=1; i<=contrl(2); i=i+1) {       # Output marker at each point

      xcoord = ptsin(j)
      ycoord = ptsin(j+1)

      # Clip marker to device limits
      x1 = xcoord - hlfsiz
      x2 = x1 + fulsiz
      y1 = ycoord - hlfsiz
      y2 = y1 + fulsiz
      if ((min0(x1,y1) >= 0) & (x2 <= XxLIMITSxHI3M) & _
	 (y2 <= YxLIMITSxHI3M)) {           # Marker fits on device
         call drhi3m (MOVE, ptsin(j))         # Move to center point
	 call dbufhi (3, ibuf)
	 call dbufhi (1, space)
	 }
      j = j + 2                               # Increment ptr to coords
      }
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
 
   call drhi3m (MOVE, ptsin(1))    # Move to start point

   if (ndclrp != ndclrt)  {
      call dphi3m (ndclrt)            # Change color to text color
      }
 
   # Now due to the plotter hanging if a text string is split by the
   # buffering mechanism, the buffer is flushed
   call dbufhi (-1, space)

   # Now enter text mode
   ibuf(1) = BIGS
   ibuf(2) = ndtxrt   # Text rotation
   ibuf(3) = ndtysz
   call dbufhi (3, ibuf)
   call dbufhi (1, space)

   j = contrl(INTEGERxINxLENGTH)   # Get the string length
 
   for (i = 1; i <= j; i = i + 1) {  # Loop to keep buffer from overflowing
       if (intin(i) == UNDERLINE)  {  # An underline would end the string
	  call dbufhi (1, space)
	  }
       else  {
          call dbufhi (1, intin(i))
	  }
       }
   call dbufhi (1, endtxt)         # terminate string
   }
 
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   call drhi3m (MOVE, ptsin(1))               # Move to first point

   call dphi3m (ndclrf)                       # Change color to fill color
   call dbufhi (3, solid)                     # Set linetype to solid

   j = 3
   for (i=2; i<=contrl(2); i=i+1) {  # draw between subsequent points
      call drhi3m (DRAW, ptsin(j))
      j = j + 2
      }
   call drhi3m (DRAW, ptsin(1))      # draw to first point to make sure
				     # polygon closed
   call drhi3m (MOVE, ptsin(1))      # Move to the point to pick up the pen

   # restore line type
   lstyle(2) = ndlntp
   call dbufhi (3, lstyle)
   
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {
   savex = ptsin(1)                           # Save boundary points
   savey = ptsin(2)
   x2 = ptsin(3)
   y2 = ptsin(4)

   call drhi3m (MOVE, savexy)
   call dphi3m (ndclrl)                       # Change color to line color
   call dbufhi (3, solid)                     # Set linetype to solid

   xcoord = x2                                # Draw boundary around area
   ycoord = savey
   call drhi3m (DRAW, xy)
   ycoord = y2
   call drhi3m (DRAW, xy)
   xcoord = savex
   call drhi3m (DRAW, xy)
   call drhi3m (DRAW, savexy)
   call drhi3m (MOVE, savexy)   #  Move to the point to pick up the pen

   # restore line type
   lstyle(2) = ndlntp
   call dbufhi (3, lstyle)
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
   index = ptsin(2)
   for (i=5; i>=1; i=i-1)   {
      if (txthgt(i) <= index )  break
      }

   if (i == 0) i = 1
   ndtysz = i + DIG0

   contrl(3) = 2
   ptsout(1) = txtwid(i)
   ptsout(2) = txthgt(i)
   ptsout(3) = txtwid(i)
   ptsout(4) = txthgt(i)
   }
 
#
#  opcode set character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
      i = divid (intin(1)+450, 900, k)  # Device rotates in 90 degree incs
      intout(1) = mult(i, 900) # Return the chosen angle
      ndtxrt = rotang(i+1) + DIG0 # Determine which angle from table
      }

#
#  opcode set color
#
else if (opcode == SETxCOLORxREPRESENTATION) {
   # Save 6 color indices, 1 for each pen station.  The requested
   # value is the same as the realized value
   i = gimnmx (intin, 0, 5) + 1        # Get color index in range
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
   call dbufhi (3, lstyle)
   }
 
#
#  opcode polyline color index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX)  {
   ndclrl = gimnmx (intin(1), 0, 5)
   intout(1) = ndclrl                       # Return color index selected
   }
 
#
#  opcode set marker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3  # Marker type 3 is default
   intout(1) = ndmktp                       # Return type selected
   ndmktp = ndmktp + SLASH
   }

#
#  opcode polymarker scale
#
else if (opcode == SETxPOLYMARKERxSCALE) {
   index = ptsin(2)
   for (i=5; i>=1; i=i-1)   {
      if (txthgt(i) <= index )  break
      }

   if (i == 0) i = 1
   ndmkht = i + DIG0

   contrl(3) = 1              # Return 1 coordinate pair
   ptsout(1) = 0
   ptsout(2) = txthgt(i)      # Return size selected
   }

#
#  opcode polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX)  {
   ndclrm = gimnmx (intin(1), 0, 5)
   intout(1) = ndclrm                       # Return color index selected
   }
 
#
#  opcode text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX)  {
   ndclrt = gimnmx (intin(1), 0, 5)
   intout(1) = ndclrt               # Return color index selected
   }
 
#
#  opcode set fill color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
   ndclrf = gimnmx (intin(1), 0, 5)
   intout(1) = ndclrf               # Return color index selected
   }
 
#
#  opcode inquire color representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 5) +1   # Map index 0-5 to 1-6
   intout(1) = i - 1                # Color index selected
   intout(2) = clrred(i)            # Set values are same as realized
   intout(3) = clrgrn(i)
   intout(4) = clrblu(i)
   }
 
#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = 1     # Default mode is request
   }

return
end
subroutine dphi3m (color)
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
#     Function: Device driver pen changer for the Houston              #
#               Instruments 6 pen plotter                              #
#                                                                      #
#     Input Parameters:                                                #
#            color - pen station to change to                          #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            dbufhi - buffered output routine for Houston Inst. plotter#
#                                                                      #
########################################################################
integer color
 
integer pencmd(5), penc, ltype
 
include(`ddcom')
 
# The following equivalence statements are used to decrease the amount of code
#    necessary to access specific array elements. The arrays and the
#    variables equivalenced are listed below:
#
#       pencmd(2) :: penc
#       pencmd(4) :: ltype
 
equivalence (pencmd(2), penc), (pencmd(4), ltype)
 
 
#            Get new pen color /P<0>L<0> /
data pencmd /BIGP,0,BIGL,0,BLANK/
 
   ndclrp = color         # set the current pen color
   # pencmd(2)
   penc = ndclrp + DIG1   # set the requested pen
   # pencmd(4)
   ltype = ndlntp         # restore the current line type, this is done
                          #   because the device forgets the current line
                          #   style
   call dbufhi (5, pencmd)
 
   return
end
subroutine drhi3m (opcode, xy)
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
#     Function: Device driver move/draw for Houston                    #
#               Instruments plotter                                    #
#                                                                      #
#     Input Parameters:                                                #
#           opcode - driver function, either move/draw                 #
#                                                                      #
#            xy      -     Array of input parameters                   #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            dbufhi - output a string to the Houston Inst. plotter     #
#            gitoch  - convert a binary integer to a character string  #
#                                                                      #
########################################################################
integer opcode, xy(1)
 
integer string(4), length, ierror, positn(1), comma(1), blank(1)
integer gitoch
 
include(`ddcom')

data blank /BLANK/
data comma /COMMA/
 
   if (opcode == DRAW) { positn(1) = BIGD }      # pen down
   else                { positn(1) = BIGU }      # pen up
   call dbufhi (1, positn)
   length = gitoch (xy(1), string, 4, ierror)
   call dbufhi (length, string)
   call dbufhi (1, comma)
   length = gitoch (xy(2), string, 4, ierror)
   call dbufhi (length, string)
   call dbufhi (1, blank)
 
   return
end
subroutine dbufhi (icount, iarray)
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
#     Function: Houston Instruments buffered output handler            #
#                                                                      #
#     Input Parameters:                                                #
#           icount - number of characters in iarray to be output       #
#                                                                      #
#           iarray - Array of characters to be output                  #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            gdevin  - get a character form the graphics device        #
#            gdevot  - output a character to the device                #
#            gdstot - output a string to the device                    #
#                                                                      #
########################################################################
#local define
define(`MAXxHIxBUFFER',`255')
 
integer icount, iarray(1)
 
integer c, k
 
include(`ddcom')
 
   k = icount
   if (k < 0) k = 0
   if ((ndotkt+k) > MAXxHIxBUFFER | icount < 0) {
      call gdevot (CR)          # Output buffer terminating character
      call gdevot (NEWLINE)     # Output the current buffer
      ndotkt = 0                # Reset the plotter buffer counter
 
      # Wait for prompt response from device. The prompt in most cases is
      #    the carriage return (15) character which is returned by gdevin
      #    as a new line (10). But when the device is turned off 
      #    (ie. graphic)) the device responds to the last buffer
      #    with RUBOUT (8%177 or 8%255 dependent upon 7 or 8 bit interface).
 
      repeat { call gdevin (c) } until (c == NEWLINE | c >= RUBOUT)
      }
   call gdstot (k, iarray)
   ndotkt = ndotkt + k          # Update the plotter buffer counter
   return
end
 
E 1
