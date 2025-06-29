h43124
s 00634/00000/00000
d D 1.1 83/03/15 21:26:18 tes 1 0
c date and time created 83/03/15 21:26:18 by tes
e
u
4
U
t
T
I 1
subroutine dddibo (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device Driver for the Diablo 630 Daisy Wheel printer   #
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
#             mult   - multiply 2 16-bit numbers                       #
#             gimnmx - Function to place integer value in a range      #
#             prtout - Put a byte to the printer device                #
#             prstot - Put a byte array to the printer device          #
########################################################################
divert(-1)
# local defines
define(`XxLIMITSxPRINTER',479)              #printer surface width
define(`YxLIMITSxPRINTER',479)              #printer surface height
define(`NUMBERxOFxCOLORS',1)                # colors available + index 0
define(`MOVE',1)
define(`DRAW',2)
define(`HOLLOW',0)
define(`ENDCASE',972)                 # Label to end case statement
divert
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)

integer i, j, k, gimnmx, mult, iout1(45), iout2(12)
SHORTINT setup(2), endgrf(2)

integer clrred(2), clrgrn(2), clrblu(2) 
integer opcode
 
include(`ddcom')

common /clrprt/ clrred, clrgrn, clrblu

data setup/ ESC, DIG3/
data endgrf/ESC, DIG4/

data iout1/XxLIMITSxPRINTER,   # Maximum addressable width of printer
	   YxLIMITSxPRINTER,   # Maximum addressable length of printer (square)
	   OTHER,               # Device not capable of precisely scaled image
	   414,                 # Width of one pixel in micrometers
	   515,                 # Height of one pixel in micrometers
	   1,                   # Number of character sizes
	   5,                   # Number of line types
	   1,                   # Number of line widths
	   5,                   # Number of marker types
	   1,                   # Number of marker sizes
	   1,                   # Number of fonts
	   0,                   # Number of patterns
	   0,                   # Number of hatch styles
	   2,                   # Number of predefined colors
	   0,                   # Number of GDP's available
	   20*-1,               # All GDP's and attributes are undefined
	   NO,                  # Color capability flag
	   NO,                  # Text rotation capability flag
	   NO,                  # Filled area capability flag
	   NO,                  # Pixel operation capability flag
	   2,                   # Number of available colors, monochrome
	   0,                   # Number of locator devices available
	   0,                   # Number of valuator devices available
	   0,                   # Number of choice devices available
	   0,                   # Number of string devices available
	   0/                   # Workstation is output only

data iout2 / 0, 8,              # Minimum character height in device units
	     0, 8,              # Maximum character height in device units
	     1, 0,              # Minimum line width in device units
	     1, 0,              # Maximum line width in device units
	     0, 6,              # Minimum marker height in device units
	     0, 6/              # Maximum marker height in device units
 

opcode=contrl(OPCODE)
contrl(3) = 0                  # Assume no vertices are being passed back

go to (OPENxWORKSTATION, CLOSExWORKSTATION, CLEARxWORKSTATION,
       UPDATExWORKSTATION, ESCAPE, POLYLINE, POLYMARKER, TEXT,
       FILLxAREA, CELLxARRAY, GENERALIZEDxDRAWINGxPRIMITIVE,
       SETxCHARACTERxHEIGHT, SETxCHARACTERxUPxVECTOR,
       SETxCOLORxREPRESENTATION,SETxPOLYLINExLINETYPE, SETxPOLYLINExLINExWIDTH,
       SETxPOLYLINExCOLORxINDEX, SETxPOLYMARKERxTYPE, SETxPOLYMARKERxSCALE,
       SETxPOLYMARKERxCOLORxINDEX, SETxTEXTxFONT, SETxTEXTxCOLORxINDEX,
       SETxFILLxINTERIORxSTYLE, SETxFILLxSTYLExINDEX,
       SETxFILLxCOLORxINDEX, INQUIRExCOLORxREPRESENTATION), opcode

go to ENDCASE

#
# opcode open workstation
#
OPENxWORKSTATION  continue
 
   contrl(3) = 6               # Set to number of output vertices
   contrl(5) = 45              # Length of array intout

   # set up output capability array
   do i = 1, 45  {
      intout(i) = iout1(i)
      }
   do i = 1, 12 {
      ptsout(i) = iout2(i)
      }

   i = intin(2) 
   if (i > 5) i = 5
   ndlntp = gimnmx (i, 1, 5)             # Set current device line style
   ndclrl = gimnmx (intin(3), 0, NUMBERxOFxCOLORS)  # Set polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 5) ndmktp=3
   ndclrm = gimnmx (intin(5), 0, NUMBERxOFxCOLORS) # Set polymarker color index
   ndclrt = gimnmx (intin(7), 0, NUMBERxOFxCOLORS) # Set text color index
   ndclrf = gimnmx (intin(10),0, NUMBERxOFxCOLORS) # Set fill area color index
   ndxpos = 0
   ndypos = 0

   do i = 1, 2  {
      k = mult(i-1, 1000)
      clrred(i) = k  # Define color index 0 to black, index 1 to white
      clrgrn(i) = k
      clrblu(i) = k
      }

   # initialize printer
   call prstot (2, setup)
   go to ENDCASE

#
#  opcode close workstation
#
CLOSExWORKSTATION  continue
   call prstot (2, endgrf)
   go to ENDCASE

#
#  opcode clear workstation
#
CLEARxWORKSTATION  continue
   call prtout (FF)
   ndxpos = 0    # This is where a new frame puts you
   ndypos = 479

   go to ENDCASE
 
#
#  opcode update workstation
#
UPDATExWORKSTATION  continue
   go to ENDCASE

#
#  opcode escape
#
ESCAPE  continue
   if (contrl(6) == INQUIRExADDRESSABLExCELLS) {
      intout(1) = -1
      intout(2) = -1
      }
   go to ENDCASE

#
#  opcode polyline
#
POLYLINE  continue
 
   k = mult(contrl(2)-1, 2)
   for (i=1; i<=k; i=i+2) {
      call dldibo(ptsin(i), ptsin(i+1), ptsin(i+2), ptsin(i+3))# Draw the line
      }
   go to ENDCASE
 
#
#  opcode polymarker
#
POLYMARKER  continue
 
   j = ndlntp 
   ndlntp = 1   # Set line type to solid

   k = mult(contrl(2), 2)

   for (i=1; i<=k; i=i+2) {
      call dmdibo (ptsin(i))  # Output the marker
      }
   ndlntp = j
   go to ENDCASE
 
#
#  opcode text
#
TEXT  continue

   k = contrl(INTEGERxINxLENGTH)   # Get the string length
   call ddpos (MOVE, ptsin(1), ptsin(2))    # Move to start point

   call prstot (2, endgrf)
   for (i=1; i<=k; i=i+1)  {
      call prtout (intin(i))
      }
   for (i=1; i<=k; i=i+1)  {  # For now, just backspace over old text string
      call prtout (BS)
      }
   call prstot (2, setup)
   
   go to ENDCASE
 
#
#  opcode fill area
#
FILLxAREA  continue

   k = mult(contrl(2)-1, 2)
   for (i=1; i<=k; i=i+2) {
      call dldibo(ptsin(i),ptsin(i+1), ptsin(i+2), ptsin(i+3))  # Draw the line
      }
   call dldibo (ptsin(i), ptsin(i+1), ptsin(1), ptsin(2)) # Close the polygon
   go to ENDCASE

#
#  opcode cell array
#
CELLxARRAY  continue

   call dldibo (ptsin(1), ptsin(2), ptsin(3), ptsin(2))
   call dldibo (ptsin(3), ptsin(2), ptsin(3), ptsin(4))
   call dldibo (ptsin(1), ptsin(4), ptsin(3), ptsin(4))
   call dldibo (ptsin(1), ptsin(2), ptsin(1), ptsin(4))
   go to ENDCASE

#
#  opcode set character height
#
SETxCHARACTERxHEIGHT  continue

   # Return text size selected
   contrl(3) = 2  # Output two points
   ptsout(1) = 5  # Character width
   ptsout(2) = 7  # Character height
   ptsout(3) = 6  # Cell width
   ptsout(4) = 8  # Cell height
   go to ENDCASE
 
#
#  opcode set character up vector
#
SETxCHARACTERxUPxVECTOR  continue
      intout(1) = 0  # Inform upper level of angle
      go to ENDCASE

#
#  opcode set color
#
SETxCOLORxREPRESENTATION  continue
   # Save 2 color indices, the requested
   # value is the same as the realized value
   i = gimnmx (intin(1),0,NUMBERxOFxCOLORS) + 1   # Get color index in range
   clrred(i) = intin(2)
   clrgrn(i) = intin(3)
   clrblu(i) = intin(4)
   go to ENDCASE

#
#  opcode set line type
#
SETxPOLYLINExLINETYPE  continue
   ndlntp =  intin(1) 
   if (ndlntp < 1 | ndlntp > 5) ndlntp = 1
   intout(1) = ndlntp                      # Return linetype selected
   go to ENDCASE
 
#
#  opcode polyline color index
#
SETxPOLYLINExCOLORxINDEX  continue
   ndclrl = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrl                       # Return color index selected
   go to ENDCASE
 
#
#  opcode set marker type
#
SETxPOLYMARKERxTYPE   continue
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3  # Marker type 3 is default
   intout(1) = ndmktp                       # Return type selected
   go to ENDCASE

#
#  opcode polymarker color index
#
SETxPOLYMARKERxCOLORxINDEX   continue
   ndclrm = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrm                       # Return color index selected
   go to ENDCASE
 
#
#  opcode text color index
#
SETxTEXTxCOLORxINDEX   continue
   ndclrt = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrt               # Return color index selected
   go to ENDCASE

#
#  opcode set fill interior style
#
SETxFILLxINTERIORxSTYLE         continue
   intout(1) = HOLLOW
   go to ENDCASE 

#
#  opcode set fill color index
#
SETxFILLxCOLORxINDEX   continue
   ndclrf = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrf               # Return color index selected
   go to ENDCASE
 
#
#  opcode inquire color representation
#
INQUIRExCOLORxREPRESENTATION   continue
   i = gimnmx (intin(1), 0, NUMBERxOFxCOLORS) +1   # Map index 0-m to 1-n
   intout(1) = i - 1                # Color index selected
   intout(2) = clrred(i)            # Set values are same as realized
   intout(3) = clrgrn(i)
   intout(4) = clrblu(i)

#  The remainder of the opcodes are not implemeted but included to
#  allow the computed goto to operate correctly

SETxFILLxSTYLExINDEX            continue
GENERALIZEDxDRAWINGxPRIMITIVE   continue
SETxPOLYLINExLINExWIDTH         continue
SETxPOLYMARKERxSCALE            continue
SETxTEXTxFONT                   continue

ENDCASE   continue

return
end
subroutine dmdibo (intin)
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
#     Function: Place a marker at the desired location on a printer    #
#                                                                      #
#     Input Parameters:                                                #
#            intin   - x/y location for marker                         #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            dldibo - Printer move/draw routine                        #
#                                                                      #
########################################################################
define(`MOVE',1)
define(`DRAW',2)
define(`MARKxPERIOD',`1')
define(`MARKxPLUS',`2')
define(`MARKxSTAR',`3')
define(`MARKxO',`4')
define(`MARKxX',`5')
define(`FULLSZ',`4')
define(`HALFSZ',`2')
define(`FPERSZ',`2')
define(`HPERSZ',`1')
 
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
   if (x1 < 0 | y1 < 0 | x2 > XxLIMITSxPRINTER | y2 > YxLIMITSxPRINTER) return
 
   # output appropriate marker centered on location
 
   if (ndmktp == MARKxPERIOD | ndmktp == MARKxO) {
      call dldibo (x1, y1, x2, y1)
      call dldibo (x2, y1, x2, y2)
      call dldibo (x2, y2, x1, y2)
      call dldibo (x1, y2, x1,y1)
      }
   else {
      if (ndmktp == MARKxX | ndmktp == MARKxSTAR) {
         call dldibo (x1, y1, x2, y2)
         call dldibo (x1, y2, x2, y1)
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
         rxy2 = y1 + hsize
         call dldibo (x1, rxy2, x2, rxy2)
         rxy1 = x1 + hsize
         call dldibo (rxy1, y1, rxy1, y2)
         }
      }

   # Need to reset the current position back to the center of the marker
   call ddpos (MOVE, intin(1), intin(2))

   return
end
subroutine dldibo (x1, y1, x2, y2)
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
#     Function: Draw a line into the raster buffer of the printer      #
#                                                                      #
#     Input Parameters:                                                #
#            xy1 - first point of line segment                         #
#            xy2 - second point of line segment                        #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            ddpos - turn on a pixel in the printer raster buffer     #
########################################################################
define(`DASHxINCREMENT',4) 
integer x1, y1, x2, y2
integer x, y, dx, dy, d, adx, ady, adx2, ady2
integer xtemp1, xtemp2, ytemp1, ytemp2, xend, temp, xincr
integer patrn, numpnt, k, kk, action, actary(20)
logical qchang
integer mult

include(`ddcom')

# action definitions for line styles 1-5:  0=move, 1=draw, 2=point
data actary /1,1,1,1, 2,2,2,2, 2,0,1,0, 0,1,0,1, 0,1,1,0/

# Set up to do dash patterns
patrn = 0
numpnt = 0
k = mult((ndlntp-1),4) + 1

xtemp1 = x1
xtemp2 = x2
ytemp1 = y1
ytemp2 = y2
 
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
   }
 
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
   if (qchang) call ddpos (DRAW, y, x)
   else        call ddpos (DRAW, x, y)
   }
 
d = -adx + ady2        # Compute initial error
 
for (; x != xend;) {

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
   
  if (action == 1)  {  # Working on a real dash now
      if (qchang) call ddpos (DRAW, y, x)
      else        call ddpos (DRAW, x, y)
      }
   else if (action == 2)  {  # Working on a dot now
      if (numpnt == DASHxINCREMENT)  {  # Time to light the dot
         if (qchang) call ddpos (DRAW, y, x)
         else        call ddpos (DRAW, x, y)
	 }
      }
   if (numpnt == DASHxINCREMENT)  { # Time to reset to new pattern
      numpnt = 0   # Reset pixel count for the pattern
      patrn = patrn + 1    # Increment index into action array
      if (patrn == 4)  patrn = 0   # There are only 4 actions per linetype
      }
   }
return
end
subroutine ddpos (action, x, y)
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
#     Function: Position the print head and may be put out a dot       #
#                                                                      #
#     Input Parameters:                                                #
#            action - opcode for move or draw                          #
#            x - New x end point                                       #
#            y - New y end point                                       #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
########################################################################
integer action, x, y

integer diff, count, char, i, start
SHORTINT updn(2)

include(`ddcom')

data updn /ESC, LF/

   diff = x - ndxpos   # Find difference for x
   count = iabs (diff)
   if (diff != 0)  {
      
      if (diff < 0)  char = BS   # go backwards
      else           char = SPACE   # Point is in the forward direction

      for (i=1;i<=count;i=i+1)   call prtout (char)
      }

   diff = y - ndypos   # Find difference for y
   count = iabs (diff)
   if (diff != 0)  {
      
      if (diff < 0) {
	 char = 2  # go up
	 start = 1
	 }
      else  {
	 char = 1   # Point is in the down direction
	 start = 2
	 }

      for (i=1;i<=count;i=i+1)   call prstot (start, updn(char))
      }

   if (action == DRAW)  call prtout (PERIOD)

   ndxpos = x
   ndypos = y

   return
end
E 1
