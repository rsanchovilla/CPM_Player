h06734
s 00001/00001/00953
d D 1.3 83/03/23 14:59:32 mmm 3 2
c Decreased size of period marker by one-half.
e
s 00089/00048/00865
d D 1.2 83/03/21 14:23:24 mmm 2 1
c Added new text, changed gin cursor to crosshairs.
e
s 00913/00000/00000
d D 1.1 83/03/15 21:14:41 tes 1 0
c date and time created 83/03/15 21:14:41 by tes
e
u
4
U
t
T
I 1
subroutine ddfcg (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device driver for Florida Computer Graphics terminal   # 
#                                                                      #
#     Input Parameters:                                                #
#            contrl(1) - opcode for driver function                    #
#            contrl(2) - number of vertices in array ptsin             #
#            contrl(4) - length of integer array intin                 #
#            contrl(6-n) - Opcode dependent information                #
#                                                                      #
#            intin   -     Array of integer input parameters           #
#            ptsin   -     Array of input coordinate data              #
#                                                                      #
#     Output Parameters:                                               #
#            contrl(3)   - number of vertices in array ptsout          #
#            contrl(5)   - length of integer array intout              #
#            contrl(6-n) - Opcode dependent information                #
#                                                                      #
#            intout      - array of integer output parameters          #
#            ptsout      - array of output coordinate data             #
#                                                                      #
#     Routines Called:                                                 #
#             dmfcg - marker output emulation for Florida Computer     #
#                     Graphics terminal                                #
#             drfcg - move/draw for Florida Computer Graphics terminal #
#             dcfcg - change color on Florida Computer Graphics        #
#             gimnmx - perform min-max check for integers              #
#             mult   - multiply 2 16-bit unsigned numbers              #
#             divid  - divid 2 16-bit unsigned numbers                 #
#             gioini - initialize i/o system for crt device            #
#             giostp - terminate i/o system                            #
#                                                                      #
########################################################################
 
divert(-1)
# local defines
define(`XxLIMITSxFCG',639)              # screen surface width
define(`YxLIMITSxFCG',479)              # screen surface height
define(`MOVE',1)                      
define(`DRAW',2)
define(`ACTUAL',1)                      # realized color flag
define(`DEFAULT',1)                     # default gin device
define(`CROSSHAIRS',2)                  # crosshairs gin device
define(`UNSUCCESSFUL',0)                # unsuccessful input status
define(`SUCCESSFUL',1)                  # successful input status
define(`F1',128)                        # function key 1
define(`F18',145)                       # function key 18
define(`UP',199)                        # up arrow key
define(`DOWN',205)                      # down arrow key
define(`LEFT',201)                      # left arrow key
define(`RIGHT',203)                     # right arrow key
define(`CHANGExRATE',202)               # home key on keypad
define(`FAST',10)                       # increment for fast movement
define(`SLOW',1)                        # increment for slow movement
define(`HOLLOW',0)                      # hollow fill interior style
define(`SOLID',1)                       # solid fill interior style
divert
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
# Declarations for FCG color common
integer actclr(48), reqclr(48), actred(16), actgrn(16), actblu(16)
integer reqred(16), reqgrn(16), reqblu(16)
 
integer opcode, i, j, k, i1, xcoord, ycoord, nx, ny, temp
integer colind, xrpt, yrpt, colptr, xcount, ycount 
integer rate, gimnmx, mult, divid, xincr, yincr
D 2
integer chrwid, chrhgt, xtemp, ytemp
integer savex, savey, plygon(223), iniino(45), inipto(12)
E 2
I 2
integer chrwid(5), chrhgt(5), celwid(5), celhgt(5), xtemp, ytemp
integer xchrot(4), ychrot(4)
integer savex, savey, plygon(127), iniino(45), inipto(12)
E 2
logical qdone
 
SHORTINT temp1, temp2, rgb(3), red, green, blue, txtstr(80)
 
include(ddcom)
 
common /cmfcg/ reqclr, actclr
 
equivalence (reqclr(1) , reqred(1)),
	    (reqclr(17), reqgrn(1)),
	    (reqclr(33), reqblu(1)),
	    (actclr(1) , actred(1)),
	    (actclr(17), actgrn(1)),
	    (actclr(33), actblu(1))
equivalence (red , rgb(1)), (green , rgb(2)) , (blue , rgb(3))
 
# alpha text string buffer and polygon buffer share the same memory space
equivalence (txtstr(1), plygon(1))
 
D 2
data chrwid /8/
E 2
I 2
data chrwid /6, 12, 18, 24, 30/
E 2
 
D 2
data chrhgt /15/
E 2
I 2
data chrhgt /9, 18, 27, 36, 45/

data celwid /8, 16, 24, 30, 36/

data celhgt /16, 32, 48, 64, 80/

data xchrot /0, 1, 0, -1/

data ychrot /-1, 0, 1, 0/
E 2
 
data iniino /_     # Initial intout array for open workstation
   XxLIMITSxFCG,   # Maximum addressable screen width
   YxLIMITSxFCG,   # Maximum addressable screen height
   OTHER,          # Device coordinates are other than meters
   390,            # Step size width in micrometers
   390,            # Step size height in micrometers
                   # 25400 um / inch * 10 inch / 640 rasters
D 2
   1,              # Number of character heights
E 2
I 2
   5,              # Number of character heights
E 2
   16,             # Number of line types
   1,              # Number of line widths
   5,              # Number of marker types
   1,              # Number of marker sizes
   1,              # Number of text fonts
   0,              # Number of patterns
   0,              # Number of hatch styles
   16,             # Number of predefined colors
   2,              # Number of GDPs
   BAR,            # Bar GDP available
   CIRCLE,         # Circle GDP available
   8*-1,           # No more GDPs
   3,              # Bar GDP uses fill area attributes
   3,              # Circle GDP uses fill area attributes
   8*-1,           # No more attributes for GDPs
   1,              # Device is capable of color
D 2
   0,              # Device is not capable of text rotation
E 2
I 2
   1,              # Device is capable of text rotation
E 2
   1,              # Device is capable of filled areas
   1,              # Device is capable of pixel operations
   64,             # Number of colors available
   1,              # Number of locator devices available
   0,              # Number of valuator devices available
   1,              # Number of choice devices available
   1,              # Number of string devices available
   2/              # Workstation type (input/output)

data inipto /_     # Initial ptsout array for open workstation
   0,
D 2
   15,             # Minimum character height in DC space
E 2
I 2
   9,              # Minimum character height in DC space
E 2
   0,
D 2
   15,             # Maximum character height in DC space
E 2
I 2
   45,             # Maximum character height in DC space
E 2
   1,              # Minimum line width in DC space
   0,
   1,              # Maximum line width in DC space
   0,
   0,
   8,              # Minimum marker height in DC space
   0,
   8/              # Maximum marker height in DC space

opcode=contrl(OPCODE)
contrl(3) = 0                   # Initialize number of output vertices to 0
 
#
# opcode open workstation
#
if (opcode == OPENxWORKSTATION) {
 
   contrl(3) = 6               # Set number of output vertices
   contrl(5) = 44              # Set length of integer output array

   # set up output capability array
   do i=1,45 {
      intout(i) = iniino(i)
      }
   do i=1,12 {
      ptsout(i) = inipto(i)
      }

   i = intin(2) - 1
   if (i > 15) i = 15
   ndlntp = gimnmx(i, 0, 15)             # Set current device line style
   ndclrl = gimnmx(intin(3), 0, 15)      # Set current polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 5) ndmktp=3
   ndclrm = gimnmx(intin(5), 0, 15)      # Set current polymarker color index
   ndclrt = gimnmx(intin(7), 0, 7)       # Set current text color index
   ndfstl = gimnmx(intin(8), 0, 1)       # Set fill interior style
   ndclrf = gimnmx(intin(10),0, 15)      # Set current fill area color index
I 2
   ndtxrt = 0                            # Set rotation to 0
   ndtxsz = 1                            # Set size to smallest
E 2

   ndclrp = ndclrl                       # Set current device color
 
   # initialize color table
   # The first 8 entries are set to :
   #   black, red, green, blue, cyan, yellow, magenta, white
 
   do i=1,48 {
      actclr(i) = 0
      }
   actred(2) = 3
   actgrn(3) = 3
   actblu(4) = 3
   actgrn(5) = 3
   actblu(5) = 3
   actred(6) = 3
D 2
   actblu(6) = 3
E 2
I 2
   actgrn(6) = 3
E 2
   actred(7) = 3
D 2
   actgrn(7) = 3
E 2
I 2
   actblu(7) = 3
E 2
   actred(8) = 3
   actgrn(8) = 3
   actblu(8) = 3
 
   # initialize device
 
   call msyint                 # Initialize FCG Beacon
   do i=1,16 {
      red = actred(i)
      green = actgrn(i)
      blue = actblu(i)
      temp1 = i - 1
      call jcolrg (temp1, rgb)        # Set graphics color map
      if (temp1 <= 7) temp1=temp1+8   # Foreground text colors are indices 8-15
      else            temp1=temp1-8   # Background text colors are indices 0-7
      call mcoldf (temp1, rgb)        # Set text color map
      }
 
   # set color maps for inquiries. Initially requested color = actual color

   do i=1,48 {
      j = actclr(i)
      if  (j == 3) {
	 j = 1000
         actclr(i) = j
	 }
      reqclr(i) = j
      }

   call mwinsl (0)          # Select text window 0
   call mhomew              # Home window in the buffer
   call mcurin (1)          # Increment cursor only one cell for each char
   call mbufln (32)         # Select text buffer of 32 lines
   call mdisln (32)         # Display 32 lines of text
   call mxprsl (1)          # Select transparent background for text
   call jrcolr (ndclrl)     # Set line color
   call mcolsl (ndclrt)     # Set text color
   call jfcolr (ndclrf)     # Set fill color
   call jlntyp (ndlntp)     # Set line type
   call mcurhm              # Home alpha cursor
I 2
   call mcuren (0)          # Disable alpha cursor
E 2

   call gioini(1)           # Init I/O system
   }
 
#
#     opcode close workstation
#
else if (opcode == CLOSExWORKSTATION) {
   call giostp                 # Shut down I/O system
   call msyint                 # Re-initialize terminal.  Not good but
                               # the only thing that works now
   }
 
#
#  opcode clear workstation
#
else if (opcode == CLEARxWORKSTATION) {
   call dcfcg (0)            # Change color to background
   call jerase               # Erase graphics
   call mersal               # Erase text
I 2
   call mcuren (0)           # Disable alpha cursor
E 2
   }
 
#
#  opcode escape
#
else if (opcode == ESCAPE) {
   opcode = contrl(6)  # Get the escape sub opcode
   if (opcode == INQUIRExADDRESSABLExCELLS) {
      intout(1) = 32
      intout(2) = 80
      }
   else if (opcode == ENTERxGRAPHICSxMODE)  {
      call mcuren (0) # Turn off alpha cursor
      call mxprsl (1) # Select transparent background for text
      }
   else if (opcode == EXITxGRAPHICSxMODE)  {
      call mcuren (1) # Turn on alpha cursor
      call mxprsl (0) # Select non-transparent background for text
      }
   else if (opcode == CURSORxUP)  {
      call mcurmv (0, -1)
      }
   else if (opcode == CURSORxDOWN)  {
      call mcurmv (0, 1)
      }
   else if (opcode == CURSORxRIGHT)  {
      call mcurmv (1, 0)
      }
   else if (opcode == CURSORxLEFT)  {
      call mcurmv (-1, 0)
      }
   else if (opcode == HOMExCURSOR)  {
      call mcurhm
      }
   else if (opcode == ERASExTOxENDxOFxSCREEN)  {
      call mereow
      }
   else if (opcode == ERASExTOxENDxOFxLINE)  {
      call mereol
      }
   else if (opcode == DIRECTxCURSORxADDRESS)  {
      temp1 = gimnmx (intin(2)-1, 0, 79)  # Set the column
      temp2 = gimnmx (intin(1)-1, 0, 31)  # Set the row
      call mmovrw (temp1, temp2)
      }
   else if (opcode == OUTPUTxCURSORxADDRESSABLExTEXT) {
      j = gimnmx (contrl(4), 0, 80) # 80 characters max
      if (j > 0) {
	 do i=1,j {
	    txtstr(i) = intin(i)
	    }
         call mwstrg (j, txtstr)
	 }
      }
   else if (opcode == REVERSExVIDEOxON)  {
      call mrvdsl (1)
      }
   else if (opcode == REVERSExVIDEOxOFF)  {
      call mrvdsl (0)
      }
   else if (opcode == INQUIRExCURRENTxCURSORxADDRESS)  {
      call mracur (temp1, temp2)
      intout(1) = temp2 + 1  # Row number
      intout(2) = temp1 + 1  # Column number
      }
   }
#
#  opcode polyline
#
else if  (opcode == POLYLINE) {
   call dcfcg (ndclrl)                     # Change color to current line color
   call drfcg (MOVE, ptsin(1), ptsin(2))   # Move to the first point in polyline
   j = 3
   for (i=2; i<=contrl(2); i=i+1) {        # Draw between subsequent points
      call drfcg (DRAW, ptsin(j), ptsin(j+1))
      j = j + 2
      }
   }
 
#
#  opcode polymarker
#
else if (opcode == POLYMARKER) {
   call dcfcg (ndclrm)               # Change color to current marker color
   call jlntyp (0)                   # Set line type to solid
   j = 1
   for (i=1; i<=contrl(2); i=i+1) {  # Output marker at each point
      call dmfcg (ndmktp, ptsin(j), ptsin(j+1))
      j = j + 2
      }
   call jlntyp (ndlntp)              # Restore line type
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
D 2
   # The screen is 80 characters wide by 32 lines high.  Character
   # cell (0,0) is in the upper left hand corner.  Characters are
   # 8 pixel wide by 15 pixels high.  Map the current x,y position
   # to the closest character cell.
 
   i = divid (ptsin(1), 8, temp)          # xcoord / 8
   nx = gimnmx (i, 0, 79)
   i = 31 - divid (ptsin(2)+8, 15, temp)  # 31 - ycoord / 15 (round up)
   ny = gimnmx (i, 0, 31)
 
   call mcuren (1)         # enable alpha cursor
   call mmovrw (nx, ny)    # move cursor to start point
   i = gimnmx (contrl(4), 0, 80) # 80 characters max
   if (i > 0) {
   do j=1,i {
	 txtstr(j) = intin(j)  # Copy string into integer*1 array
	 }
      call mwstrg (i, txtstr)  # Output text string
E 2
I 2
   i = contrl(4)
   if (i > 0)   {
      temp = muldiv(celhgt(ndtxsz), 3, 8)  # Compute adjustment for cell height
      xcoord = ptsin(1) + mult (xchrot(ndtxrt+1), temp)  # Adjust x-coordinate
      ycoord = ptsin(2) + mult (ychrot(ndtxrt+1), temp)  # Adjust y-coordinate

      # The following 4 lines of code make screen boundary adjustments
      # They are to correct what appears to be a bug in the FCG firmware
      # that shows itself such that when a string is output with a negative
      # coordinate, the first character of the string is output correctly
      # and then the firmware resets that coordinate of the following 
      # characters to zero.  The result
      # is that a string which should appear as follows:
      #
      #                     string
      #                 -----------------
      # actually appears as follows:
      #
      #                      tring
      #                     s
      #                 -----------------
      if (ndtxrt == 0 & ycoord < 0) ycoord = 0
      if (ndtxrt == 1 & xcoord > XxLIMITSxFCG) xcoord = XxLIMITSxFCG
      if (ndtxrt == 2 & ycoord > YxLIMITSxFCG) ycoord = YxLIMITSxFCG
      if (ndtxrt == 3 & xcoord < 0) xcoord = 0

      call drfcg (MOVE, xcoord, ycoord)   # Move to point
      call dcfcg (ndclrt)           # Change text color
      txtstr(1) = 4                 # Set graphics matrix attributes
      txtstr(2) = ndtxrt            # Set character rotation
      txtstr(3) = ndtxsz - 1        # Set horizontal replication (scale)
      txtstr(4) = ndtxsz - 1        # Set vertical replication (scale)
      call jcomnd (4, txtstr)
      do j=1,i {
         txtstr(j) = intin(j)       # Copy string into integer*1 array
         call jgchar (txtstr(j))    # Output char as graphic matrix char
         }
E 2
      }
D 2
   call mcurhm                 # home alpha cursor
   call mcuren (0)             # turn off alpha cursor
E 2
   }
 
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
D 2
   call dcfcg (ndclrf)                     # Change color to current fill color
   call jfcolr (ndclrf)   # Set the fill color
   call jfmode (1)  # Yes, we want to fill
E 2
I 2
   call dcfcg (ndclrf)       # Change color to current fill color
   call jfcolr (ndclrf)      # Set the fill color
E 2
   i = min0 (contrl(2), 74)
I 2
   if (ndfstl == SOLID) call jfmode (1)  # Turn on fill for solid
   else                 call jfmode (0)  # Make sure fill is off for hollow
E 2
   plygon(1) = i
   for (j=1; j<=i; j=j+1)   {
       k = mult ((j-1),3) +2 # Calculate subscript
       i1 = mult(j,2) - 1
D 2
       plygon(k) = 1   # indicates a vector edge
E 2
I 2
       plygon(k) = 1         # indicates a vector edge
E 2
       plygon(k+1) = ptsin(i1)
       plygon(k+2) = ptsin(i1+1)
       }
   k = mult (6,i) + 2 # Number of bytes in the array
   call jplygn (k, plygon)
D 2
   call jfmode (0)  # Now turn filling off
E 2
I 2
   if (ndfstl == SOLID) call jfmode (0)  # Turn off fill
E 2
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY)  {
   savex = ptsin(1)
   savey = ptsin(2)
   xtemp = ptsin(3)
   ytemp = ptsin(4) 
   temp = contrl(6)        # save length of each row in color index array
   nx = contrl(7)          # save number of elements used in each row 
   ny = contrl(8)          # number of rows in color array

   # determine repeat count for each color across a row
   i = xtemp - savex + (nx - 1)
   xrpt = divid (i, nx, k)
   
   # determine repeat count for each row
   i = ytemp - savey + (ny - 1)
   yrpt = divid (i, ny, k)

   ycoord = ytemp                             # set initial y to top of area
   do i=1,ny {                                # loop over rows
      do ycount=1,yrpt {                      # repeat each row as necessary
         xcoord = savex
         if (ycoord >= 0) {                      # make sure coord in range
	    do j=1,nx { # loop over elements of row in color index array

               colptr = mult ((i-1), temp) + j   # compute ptr into color array
               colind = gimnmx (intin(colptr), 0, 15)
               call dcfcg (colind)               # set color

               # output each pixel the appropriate number of times
	       do k=1,xrpt {                   
	          if (xcoord <= XxLIMITSxFCG) {  # make sure coord in range
                     call jwrabs (xcoord, ycoord)# turn pixel on
                     }
	          xcoord = xcoord + 1
	          }
               }
            }
	 ycoord = ycoord - 1                     # move down one raster line
         }
      }
   }

#
#  opcode generalized drawing primitive
#
else if (opcode == GENERALIZEDxDRAWINGxPRIMITIVE) {
   opcode = contrl(6)                               # get primitive id

   #
   #  filled bar
   #
   if (opcode == BAR) {
      xcoord = ptsin(1)
      ycoord = ptsin(2)
      savex  = ptsin(3)
      savey  = ptsin(4)
      call dcfcg (ndclrf)                        # change to fill color
      if (ndfstl == SOLID) {
         call jerect (xcoord, ycoord, savex, savey) # draw and fill bar
	 }
      else {                                        # draw hollow bar
         call drfcg (MOVE, xcoord, ycoord)
	 call jrecta (savex, savey)
	 }
      }
   #
   #  Circle 
   #
   else if (opcode == CIRCLE) {
      call jstrad (ptsin(5))
      call dcfcg (ndclrf)                           # set fill color
      call drfcg (MOVE, ptsin(1), ptsin(2))         # move to center point
      call jcircl                                   # output circle
      if (ndfstl == SOLID) call jpfill              # turn fill on
      }
   }
 
#
D 2
#    opcode character height
E 2
I 2
#    opcode set character height
E 2
#
else if (opcode == SETxCHARACTERxHEIGHT) {
D 2
   # the device has only one text size
E 2
I 2
   i = ptsin(2)          # Get requested height
   ndtxsz = 1
   repeat {               # Choose size with the closest height that
			  # is not greater than the size requested
      if (chrhgt(ndtxsz) > i)   break
      ndtxsz = ndtxsz + 1
      } until (ndtxsz > 5)
   ndtxsz = ndtxsz - 1
   ndtxsz = gimnmx (ndtxsz, 1, 5)

E 2
   contrl(3) = 2         # Two vertices output
D 2
   ptsout(1) = chrwid
   ptsout(2) = chrhgt
   ptsout(3) = chrwid    # cell width & height same as char width & height
   ptsout(4) = chrhgt
E 2
I 2
   ptsout(1) = chrwid(ndtxsz)
   ptsout(2) = chrhgt(ndtxsz)
   ptsout(3) = celwid(ndtxsz)
   ptsout(4) = celhgt(ndtxsz)
E 2
   }
 
#
#    opcode character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
D 2
   # the device can not rotate text
   intout(1) = 0           # Inform upper level of actual angle selected
E 2
I 2
   j = divid ((intin(1)+450), 900, i)  # Round angle up to nearest 90
   i = divid (j, 4, ndtxrt)            # Make sure between 0-3
   intout(1) = mult(ndtxrt, 900)  # Inform upper level of actual angle selected
E 2
   }
 
#
#  opcode color representation
#
else if (opcode == SETxCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 15)           # determine color index
   temp1 = i                              # save color index
   i = i + 1
   for (j=2; j<=4; j=j+1) {
      k = divid (intin(j), 250, temp)     # determine level of red, green
      rgb(j-1) = gimnmx (k, 0, 3)         #   and blue
      }
   call jcolrg (temp1, rgb)               # define graphics color
   if (temp1 <= 7) {                      # define text color
      temp1 = temp1 + 8                   # foreground colors are 8-15
      call mcoldf (temp1, rgb)
      }

   do j=1,3 {                             # save requested & actual colors
      k = mult ((j-1), 16) + i
      reqclr(k) = intin(j+1)
      temp = rgb(j)
      actclr(k) = mult (temp, 250)
      }

   }
 
#
#  opcode linetype
#
else if (opcode == SETxPOLYLINExLINETYPE) {
   ndlntp = intin(1)                          # Device has 16 line types
   if (ndlntp < 1 | ndlntp > 16) ndlntp = 1   # Default is 1 if out of range
   intout(1) = ndlntp
   ndlntp = ndlntp - 1
   call jlntyp (ndlntp)
   }
 
#
#  opcode polyline color index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX) {
   ndclrl = gimnmx (intin(1), 0, 15)       # Device has 16 line colors
   intout(1) = ndclrl
   }

#
#  opcode polymarker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3 # Marker type three is default
   intout(1) = ndmktp
   }

#
#  opcode polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX) {
   ndclrm = gimnmx (intin(1), 0, 15)       # Device has 16 marker colors
   intout(1) = ndclrm
   }
 
#
#  opcode text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX) {
D 2
   ndclrt = gimnmx (intin(1), 0, 7)        # Device has 8 text colors(8-15)
E 2
I 2
   ndclrt = gimnmx (intin(1), 0, 15)
E 2
   intout(1) = ndclrt
   call mcolsl (ndclrt)                    # select text color
   }

#
#  opcode fill interior style
#
else if (opcode == SETxFILLxINTERIORxSTYLE) {
   ndfstl = intin(1)

D 2
   # Default interior style in hollow
E 2
I 2
   # Default interior style is hollow
E 2
   if (ndfstl < HOLLOW | ndfstl > SOLID) ndfstl = HOLLOW 
   intout(1) = ndfstl
   }

#
#  opcode fill color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
   ndclrf = gimnmx (intin(1), 0, 15)      # Device has 16 color fills
   intout(1) = ndclrf
   call jfcolr (ndclrf)                   # set fill color
   }
 
#
#  opcode inquire color representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 15)
   intout(1) = i                               # Determine color index
   i = i + 1
   do j=0,2 {
      k = mult (j, 16) + i                     # Compute index into color array
      if (intin(2) == ACTUAL) temp = actclr(k) # Return realized values
      else                    temp = reqclr(k) # Return requested (set) values
      intout(j+2) = temp
      }
   }
 
#
#  opcode inquire cell array
#
else if (opcode == INQUIRExCELLxARRAY) {
   savex = ptsin(1)
   savey = ptsin(2)
   xtemp = ptsin(3)
   ytemp = ptsin(4)
   nx = contrl(6)                       # save length of each row
   ny = contrl(7)                       # save number of rows in color array
   contrl(10) = 0                       # intialize to valid cell array

   temp = xtemp - savex + 1             # determine number of elements to use
   xincr = max0 (1, divid (temp, nx, k))#   in each row
   j = divid (temp, xincr, k)
   contrl(8) = j
   temp = ytemp - savey + 1             # determine number of rows to use
   yincr = max0 (1, divid (temp, ny, k))
   i = divid (temp, yincr, k)
   contrl(9) = i

   ycoord = ytemp

   # loop over rows starting at top of rectangular area
   for (ycount=1; ycount<=i; ycount=ycount+1) {
      xcoord = savex

      # loop over cells in row
      for (xcount=1; xcount<=j; xcount=xcount+1) {

         # if x,y coordinate is within range, read the pixel color
         # value back, otherwise indicate an error and continue

	 if (xcoord <= XxLIMITSxFCG & ycoord <= YxLIMITSxFCG) {
	    call jrdabs (xcoord, ycoord, temp1)
	    k = temp1
	    }
         else {
	    k = -1
	    contrl(10) = 1
	    }
         colptr = mult ((ycount - 1), nx) + xcount
         intout(colptr) = k
	 xcoord = xcoord + xincr
         }
      ycoord = ycoord - yincr
      }
   }

#
#    opcode input locator
#
else if (opcode == INPUTxLOCATOR) {
   contrl(5) = UNSUCCESSFUL   # initialize status
   i = intin(1)               # check input device number
   if (i != DEFAULT & i != CROSSHAIRS) return  # device not valid
   call msound                # indicate gin
 
   rate = FAST                            # initialize rate to fast
   qdone = .false.
D 2
   call jcurmd (1)                        # turn on graphics cursor
E 2
I 2
   call jcurmd (CROSSHAIRS)               # turn on graphics cursor
E 2
   xcoord = ptsin(1)
   ycoord = ptsin(2)
   call drfcg (MOVE, xcoord, ycoord)      # move to initial position
 
   repeat {
      repeat {
         call mrdkey (j, temp2)  # read a keystroke
         } until (temp2 > 0)     # loop until char count > 0
      xtemp = 0
      ytemp = 0
      if      (j == UP)          ytemp = rate
      else if (j == DOWN)        ytemp = -rate
      else if (j == LEFT)        xtemp = -rate
      else if (j == RIGHT)       xtemp = rate
      else if (j == CHANGExRATE) {
	                         if (rate == FAST) rate = SLOW
	                         else              rate = FAST
	                         }
      else                       qdone = .true.
 
      xcoord = xcoord + xtemp   # update position
      ycoord = ycoord + ytemp
      if (xcoord < 0) xcoord = 0     # keep cursor on screen
      if (ycoord < 0) ycoord = 0
      if (xcoord > XxLIMITSxFCG) xcoord = XxLIMITSxFCG
      if (ycoord > YxLIMITSxFCG) ycoord = YxLIMITSxFCG
      call drfcg (MOVE, xcoord, ycoord)
      } until (qdone)
 
   call jcurmd (0)                  # turn off graphic cursor
 
   # return x,y coordinate and key that was struck
   contrl(5) = SUCCESSFUL     # input was successful
   contrl(3) = 1              # one output vertex
D 2
   ptsout(1) = xcoord + 1     # return x-coordinate add 1 for roundoff
   ptsout(2) = ycoord + 1     # return y-coordinate
E 2
I 2
   ptsout(1) = xcoord         # return x-coordinate
   ptsout(2) = ycoord         # return y-coordinate
E 2
   intout(1) = j              # return key that was struck to end input
   }
 
#
#  opcode input choice
#
else if (opcode == INPUTxCHOICE) {

   repeat {
      call mrdkey (i, temp1)         # read a key
      } until (temp1 > 0)
   if (i >= F1 & i <= F18) {         # was key struck a function key
      contrl(5) = SUCCESSFUL         # yes
      intout(1) = i - F1 + 1         # return function key number
      }
   else {
      contrl(5) = UNSUCCESSFUL       # no
      }
   }

#
#  opcode input string
#
else if (opcode == INPUTxSTRING) {
   contrl(5) = UNSUCCESSFUL
   if (intin(1) != DEFAULT) return   # Check for valid string device
      
   if (intin(3) == YES)   call mkbctl (8)  # Echo characters back
   call mcuren (1)  # Display the alpha cursor
   i = 0
   temp = intin(2)                   # Save maximum size
   repeat {
      repeat {
	 call mrdkey (j, temp1)      # Get a character
	 } until (temp1 > 0)
      if (j == NEWLINE) break
      if (j == CR) break
      if (j >= 127) break
      if (i+1 > temp) break          # No room in output array
      i = i + 1
      intout(i) = j
      }
   call mcuren (0)  # Disable the alpha cursor
   call mkbctl (7)
   if (i > 0) contrl(5) = i          # Request successful
   } 

#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = REQUESTxMODE     # Default mode is request
   }

return
end
subroutine dmfcg (marker, x, y)
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
#     Function: Place a marker at the current location on Florida      #
#               Computer Graphics terminal                             #
#                                                                      #
#     Input Parameters:                                                #
#            marker - marker symbol index (1-5)                        #
#            x,y      - x/y location for marker                        #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            drfcg - Florida Computer Graphics draw routine            #
#                                                                      #
########################################################################
 
define(`MARKxPERIOD',1)
define(`MARKxPLUS',2)
define(`MARKxSTAR',3)
define(`MARKxO',4)
define(`MARKxX',5)
define(`FULLSZ',8)
define(`HALFSZ',4)
D 3
define(`FPERSZ',2)
E 3
I 3
define(`FPERSZ',1)
E 3
define(`HPERSZ',1)
 
integer marker, x, y
 
integer fsize, hsize, x1, x2, y1, y2, temp
 
 
   if (marker == MARKxPERIOD) {
      fsize = FPERSZ
      hsize = HPERSZ
      }
   else {
      fsize = FULLSZ
      hsize = HALFSZ
      }
 
   x1 = x - hsize        #clip marker to device limits
   x2 = x1 + fsize
   y1 = y - hsize
   y2 = y1 + fsize
   if ((min0(x1,y1) < 0) | (x2 > XxLIMITSxFCG) | (y2 > YxLIMITSxFCG))_ 
      return
 
   # output appropriate marker centered on location
 
   call drfcg (MOVE, x1, y1)   # move to lower left corner of character cell
 
   if (marker == MARKxPERIOD | marker == MARKxO) {
      call drfcg (DRAW, x2, y1)
      call drfcg (DRAW, x2, y2)
      call drfcg (DRAW, x1, y2)
      call drfcg (DRAW, x1, y1)
      }
   else {
      if (marker == MARKxX | marker == MARKxSTAR) {
         call drfcg (DRAW, x2, y2)
         call drfcg (MOVE, x2, y1)
         call drfcg (DRAW, x1, y2)
         }
      if (marker == MARKxPLUS | marker == MARKxSTAR) {
	 temp = y1 + hsize
         call drfcg (MOVE, x1, temp)
         call drfcg (DRAW, x2, temp)
	 temp = x1 + hsize
         call drfcg (MOVE, temp, y1)
         call drfcg (DRAW, temp, y2)
         }
      }
   call drfcg (MOVE, x, y)      # Return the cursor position to the original
                                #    value
   return
end
subroutine drfcg (opcode, x, y)
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
#     Function: GSS-CORE device driver move/draw for Florida Computer  #
#               Graphics Terminal                                      #
#                                                                      #
#     Input Parameters:                                                #
#           opcode - driver function, either move/draw                 #
#           x,y   -  x,y coordinate of point to move or draw to        #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            None                                                      #
#                                                                      #
########################################################################
 
integer opcode, x,y
 
if (opcode == DRAW) {
   call jdrawa (x, y)
   }
else {
   call jmovea (x, y)
   }
 
return
end
subroutine dcfcg (color)
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
#     Function: Device Driver color changer for Florida Computer       #
#               Graphics Terminal                                      #
#                                                                      #
#     Input Parameters:                                                #
#           color - color index of current color                       #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            None                                                      #
#                                                                      #
########################################################################
 
integer color

include(ddcom)
 
if (ndclrp != color) {
   ndclrp = color
   call jrcolr (color)
   }

return
end
E 1
