h60298
s 01667/00000/00000
d D 1.1 83/03/15 21:16:06 tes 1 0
c date and time created 83/03/15 21:16:06 by tes
e
u
4
U
t
T
I 1
subroutine ddgn2a (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device driver for LSI ADM5 GEN.II Retro-Graphics       #
#               terminal                                               #
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
#             gchtoi - convert a character string to a binary integer  #
#             gitoch - convert integer to character string             #
#             dcgen2 - change color on GEN II                          #
#             dmpgn2 - set color on GEN II                             #
#             dmgen2 - marker output emulation for GEN II              #
#             xygen2 - move/draw for GEN II                            #
#             ttyin  - get a character from the device  (CP/M i/o)     # 
#             gn2out - put a character to device (CP/M i/o)            #
#             strout - put a character string to the device (CP/M i/o) #
#             strinp - get a character string from the device (CP/M)   #
#             gioini - initialize non-CP/M i/o system                  #
#             gdevin - get a character from the device (non-CP/M)      #
#             gdevot - put a character to device (non-CP/M)            #
#             gdstot - put a character string to the device (non-CP/M) #
#             gdstin - get a character string from device (non-CP/M)   #
#             gimnmx - perform min-max check for integer               #
#             mult   - perform integer multiplication                  #
#             divid  - perform integer division                        #
#                                                                      #
########################################################################
 
# local defines
#define(`COLORxBOX')                     # code switch for cell array
define(`XxLIMITSxGEN2',639)             # screen surface width
define(`YxLIMITSxGEN2',419)             # screen surface height
define(`COM_CHAR',BANG)                 # command character
define(`NOxECHO',0)                     # no-echo flag
define(`ECHO',1)                        # echo flag
define(`NOTxOK',0)
define(`DEFAULT',1)                     # Default GIN device
define(`CROSSHAIRS',2)                  # Crosshairs gin device
define(`REPLACExMODE',1)                # Replace writing mode
define(`XORxMODE',3)                    # Xor writing mode
define(`HOLLOW',0)                      # Hollow fill interior style
define(`SOLID',1)                       # Solid fill interior style
define(`PATTERN',2)                     # Pattern fill interior style
define(`HATCH',3)                       # Hatch fill interior style
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
#  GEN2 dd common declarations
integer ccltb(2), rdgen2(2), grgen2(2), blgen2(2), row, column
 
SHORTINT opcode
integer i, j, k, l, line(30), nx, ny, circle(5), pie(9),
        enagin(12), newfrm(7), setup(5), iniwrk(25), ptsini(12),
	lstyle(7), kstyle, nchar, vector(4), iniary(45), chrhgt,
        temp, kstop, gitoch, cscale(10), crot(9), celwdt
integer xbar(4), ybar(4), poly(4), gimnmx, xtemp, ytemp,
        txtatt(8), ilen, ierror, mult, divid,
	angbeg, angend, mdtran(4), txtstr(6), wrtmod(7), xrot(4),
	yrot(4), xoffst(4), yoffst(4), erascr(2), eralin(2), craddr(4)
ifdef(`COLORxBOX',`
integer xrpt, yrpt, m, n, pixel, xincr, yincr, savex, savey, colptr, xcoord,
	ycoord, xcount, ycount, rdback(7), raster(12)
')
 
include(`ddcom')
 
common /cmgen2/ ccltb,rdgen2,grgen2,blgen2,row,column   # gen2 dd common
 
# The following equivalence statement is used to decrease the amount of code
#    necessary to access specific array elements. The array and the
#    variable equivalenced are listed below:
#
#       lstyle(6) :: kstyle
 
equivalence (lstyle(6), kstyle)
 
#            Table of x and y rotation factors at 90 degree intervals
data xrot  / 0, -1, 0, 1/
data yrot  / 1, 0, -1, 0/

#            Table of inter-character gaps in x and y directions with
#            rotation taken into account
data xoffst/ -1, 0, 1, 0/
data yoffst/ 0, -1, 0, 1/
 
#            Enable gin - <COM_CHAR>BEL<COM_CHAR>ENA 1
data enagin/ COM_CHAR,BIGB,BIGE,BIGL,CR,_
	     COM_CHAR,BIGE,BIGN,BIGA,BLANK,DIG1,CR/
 
#            Line style - <COM_CHAR>LIN <style>
data lstyle/ COM_CHAR,BIGL,BIGI,BIGN,BLANK,0,CR/
 
#            New frame - <COM_CHAR>ERA G
data newfrm/ COM_CHAR,BIGE,BIGR,BIGA,BLANK,BIGG,CR/
 
#            Set up for grahics - build work space, graphics space and
#            position cursor - (GS)(ESC)"6g
data setup / GS,ESC,DQUOTE,DIG6,LETG/

#            <COM_CHAR>WOR 30;<COM_CHAR>GRA 1,30;<COM_CHAR>BIT 6
data iniwrk/ COM_CHAR,BIGW,BIGO,BIGR,BLANK,DIG3,DIG0,CR,_
             COM_CHAR,BIGG,BIGR,BIGA,BLANK,DIG1,COMMA,DIG3,DIG0,CR,_
             COM_CHAR,BIGB,BIGI,BIGT,BLANK,DIG6,CR/

#            Output a vector - <COM_CHAR>VEC
data vector/ COM_CHAR,BIGV,BIGE,BIGC/
 
#            Transparent mode - ESC"0g
data mdtran/ ESC,DQUOTE,DIG0,LETG/
 
#            Set text attributes - <COM_CHAR>ATT
data txtatt/ COM_CHAR,BIGA,BIGT,BIGT,BLANK,BLANK,BLANK,CR/

#            Send string of text - <COM_CHAR>STR ~
data txtstr/ COM_CHAR,BIGS,BIGT,BIGR,BLANK,TILDE/

#            Polygon - <COM_CHAR>POL
data poly  / COM_CHAR,BIGP,BIGO,BIGL/
 
#            Circle - <COM_CHAR>CIR
data circle/ COM_CHAR,BIGC,BIGI,BIGR,BLANK/

#            Pie slice - <COM_CHAR>PIE
data pie   / COM_CHAR,BIGP,BIGI,BIGE,BLANK,0,0,0,0/

#            Character Scaling - <COM_CHAR>CSC
data cscale/ COM_CHAR,BIGC,BIGS,BIGC,BLANK,0,0,0,0,0/

#            Character rotation - <COM_CHAR>CRO
data crot  / COM_CHAR,BIGC,BIGR,BIGO,BLANK,0,0,0,0/

ifdef(`COLORxBOX',`
#            Raster input from host - <COM_CHAR>RAS
data raster/ COM_CHAR,BIGR,BIGA,BIGS,BLANK,0,0,0,0,0,0,0/

#            Read pixel value from terminal - <COM_CHAR>REA 1CR
data rdback/ COM_CHAR,BIGR,BIGE,BIGA,BLANK,DIG1,CR/
')

#            Set writing mode
data wrtmod/ COM_CHAR,BIGC,BIGM,BIGO,BLANK,BLANK,CR/

#            Erase to end of screen
data erascr/ ESC, BIGY/

#            Erase to end of line
data eralin/ ESC, BIGT/

#            Load cursor address
data craddr/ ESC, EQUALS, 0, 0/

#            Device dependent information array
data iniary/XxLIMITSxGEN2,   # Addressable width of screen in rasters 
            YxLIMITSxGEN2,   # Addressable height of screen in rasters 
            OTHER,           # Device coordinates in raster units
            381,        # Micrometers per raster along x-axis
            381,        # Micrometers per raster along y-axis
            0,          # Continuous character scaling
            8,          # Number of line types
            1,          # Number of line widths
            5,          # Number of marker types
            1,          # Number of marker sizes
            1,          # Number of fonts
            6,          # Number of patterns
            6,          # Number of hatch styles
            2,          # Number of predefined colors
            4,          # Number of GDPs
            1,          # Bar GDP
            2,          # Arc GDP
            3,          # Pie Slice GDP
            4,          # Circle GDP
            6*-1,       # Items 20 - 25 to fill out the GDP list
            3,          # Bars use fill area attributes
            0,          # Arcs use line attributes
            3,          # Pie slices use fill area attributes
            3,          # Circles use fill area attributes
	    6*-1,       # Items 30 - 35 to fill GDP attribute list
            MONOCHROME, # Color capability flag
            YES,        # Device can rotate text
            YES,        # Device can fill polygons
ifdef(`COLORxBOX',`
            YES,        # Pixel operation capability flag
	    ',`
	    NO,         # No pixel operations if code switched out
	    ')
            2,          # Total number of "colors" available
            1,          # Number of locator devices available
            0,          # Number of valuator devices available
            0,          # Number of choice devices available
            1,          # Number of string devices available
            2/          # Workstation type (Input/Output)

#           More device dependent information
data ptsini/ 0,
             8,           # Minimum character height
             0, 
             325,         # Maximum character height
             1,           # Minimum line width in device units
             0,   
             1,           # Maximum line width in device units
             0,
             0,
             8,           # Minimum marker height in device units
             0,
             8/           # Maximum marker height in device units
 
opcode=contrl(OPCODE)
contrl(3) = 0
 
#
#  opcode OPEN WORKSTATION
#
if (opcode == OPENxWORKSTATION) {
   contrl(3) = 6         # Number of vertices in ptsout
   contrl(5) = 45        # Number of elements in intout

   ndlntp = intin(2) + DIG0                  # Current device line style
   if (ndlntp < DIG1 | ndlntp > DIG8) ndlntp = DIG1

   ndclrl = gimnmx (intin(3), 0, 1) + DIG0   # Current polyline color

   ndmktp = intin(4)      # Current polymarker type
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3  # use default

   ndclrm = gimnmx (intin(5), 0, 1) + DIG0  # Current polymarker color
   ndclrt = gimnmx (intin(7), 0, 1) + DIG0  # Current text color

   ndfstl = intin(8)                        # Fill interior style
   if (ndfstl < HOLLOW | ndfstl > HATCH) ndfstl = HOLLOW  # Default hollow

   ndflpt = gimnmx (intin(9), 1, 6) + SLASH # Fill style index
   ndclrf = gimnmx (intin(10), 0, 1) + DIG0 # Current fill area color

   ndclrp = -1                       # No current color
   ndlcmd = REQUESTxMODE             # Locator input mode is request
   ndstmd = REQUESTxMODE             # String input mode is request

   do i = 1,45 { intout(i) = iniary(i) }  # Set integer output array

   do i = 1,12 { ptsout(i) = ptsini(i) }  # Set output points array

   # initialize device
   ifdef(`UNIX',`
   call gioini (1)            # Initialize unix I/O
   ')
   ifdef(`F80',`
   call strout (5, setup)     # Put terminal in 4027 mode
   call strout (25, iniwrk)   # Initialize the workstation and graphics area
   ',`
   call gdstot (5, setup)
   call gdstot (25, iniwrk)
   call gdevot (NEWLINE)      # Dump I/O buffer
   ')

   # Initialize color tables
   do i=1,2 {
      j = mult ((i-1), 100)
      ccltb(i) = j
      rdgen2(i) = j
      grgen2(i) = j
      blgen2(i) = j
      }

   # Map color index 0 to be black and index 1 to be white
   call dmpgn2 (0, 0)
   call dmpgn2 (1, 100)

   call dcgen2 (DIG1)         # Specify use of C1 (white) for line color

   txtatt(6) = DIG3           # Use font 32 as default
   txtatt(7) = DIG2
   ifdef(`F80',`
   call strout (8, txtatt)     # Output text attribute command
   ',`
   call gdstot (8, txtatt)
   ')

   kstyle = DIG1               # Use solid line as default
   ifdef(`F80',`
   call strout (7, lstyle)     # Output line style command
   ',`
   call gdstot (7, lstyle)
   ')

   txtatt(6) = BIGC            # Use text color C1 (white)
   txtatt(7) = DIG1
   ifdef(`F80',`
   call strout (8, txtatt)     # Output text attribute command
   ',`
   call gdstot (8, txtatt)
   ')

   # Initialize rotation to zero 
   crot(6) = DIG0
   crot(7) = CR
   ifdef(`F80',`
   call strout (7, crot)
   ',`
   call gdstot (7, crot)
   ')
   }
 
#
#  opcode CLOSE WORKSTATION
#
else if (opcode == CLOSExWORKSTATION) {
   call dmpgn2 (0, 100)             # Map foreground text color to white
   ifdef(`F80',`
   call strout (4, mdtran)          # Put back in transparent mode
   ',`
   call gdstot (4, mdtran)
   ')
   }

#
#    opcode CLEAR WORKSTATION
#
else if (opcode == CLEARxWORKSTATION) {
   ifdef(`F80',`
   call strout (7, newfrm)     # Clear the display area
   ',`
   call gdstot (7, newfrm)
   ')
   }
 
#
#  opcode UPDATE WORKSTATION
#
else if (opcode == UPDATExWORKSTATION) {
   ifdef(`F80',`
   ',`
   call gdevot (NEWLINE)      # Dump the I/O buffer
   ')
   }

#
#  opcode ESCAPE
#
else if (opcode == ESCAPE) {
   opcode = contrl(6)
   if (opcode == INQUIRExADDRESSABLExCELLS) {
      intout(1) = 24             # Rows
      intout(2) = 80             # Columns
      }
   else if (opcode == ENTERxGRAPHICSxMODE) {
      ifdef(`F80',`
      call strout (5, setup)     # Enter 4027 mode
      call strout (25, iniwrk)   # Initialize workspace and graphics area
      ',`
      call gdstot (5, setup)
      call gdstot (25, iniwrk)
      ')

      txtatt(6) = DIG3           # Use font 32
      txtatt(7) = DIG2
      ifdef(`F80',`
      call strout (8, txtatt)    # Output text attribute command
      ',`
      call gdstot (8, txtatt)
      ')
      }
   else if (opcode == EXITxGRAPHICSxMODE) {
      ifdef(`F80',`
      call strout (7, newfrm)    # Erase screen
      call strout (4, mdtran)    # Exit graphics mode
      ',`
      call gdstot (7, newfrm)
      call gdstot (4, mdtran)
      ')

      # Starting cursor position must be known
      row = 24
      column = 1
      }
   else if (opcode == CURSORxUP) {
      if (row > 1) {   # Take action only if not at top of display
         ifdef(`F80',`
         call gn2out (VT)
         ',`
         call gdevot (VT)
         ')
         row = row - 1
	 }
      }
   else if (opcode == CURSORxDOWN) {
      if (row < 24) {   # Take action only if not at bottom of display
         ifdef(`F80',`
         call gn2out (NEWLINE)
         ',`
         call gdevot (NEWLINE)
         ')
         row = row + 1
	 }
      }
   else if (opcode == CURSORxRIGHT) {
      if (column < 80) {   # Take action only if not at right edge of display
         ifdef(`F80',`
         call gn2out (FF)
         ',`
         call gdevot (FF)
         ')
         column = column + 1
	 }
      }
   else if (opcode == CURSORxLEFT) {
      if (column > 1) {   # Take action only if not at left edge of display
         ifdef(`F80',`
         call gn2out (BS)
         ',`
         call gdevot (BS)
         ')
         column = column -1
	 }
      }
   else if (opcode == HOMExCURSOR) {
      ifdef(`F80',`
      call gn2out (RS)
      ',`
      call gdevot (RS)
      ')
      row = 1                # Home position is upper left of screen
      column = 1
      }
   else if (opcode == ERASExTOxENDxOFxSCREEN) {
      ifdef(`F80',`
      call strout (2, erascr)
      ',`
      call gdstot (2, erascr)
      ')
      }
   else if (opcode == ERASExTOxENDxOFxLINE) {
      ifdef(`F80',`
      call strout (2, eralin)
      ',`
      call gdstot (2, eralin)
      ')
      }
   else if (opcode == DIRECTxCURSORxADDRESS) {
      row = gimnmx (intin(1), 1, 24)      # Bound row and column sent in
      column = gimnmx (intin(2), 1, 80)
      craddr(3) = row + US    # Use US to make row and column understandable
      craddr(4) = column + US #  to the device
      ifdef(`F80',`
      call strout (4, craddr)
      ',`
      call gdstot (4, craddr)
      ')
      }
   else if (opcode == OUTPUTxCURSORxADDRESSABLExTEXT) {
      ifdef(`F80',`
      call strout (contrl(4), intin)
      ',`
      call gdstot (contrl(4), intin)
      ')
      }
   else if (opcode == INQUIRExCURRENTxCURSORxADDRESS) {
      intout(1) = row         # Pass back current cursor address
      intout(2) = column
      }
   }

#
#  opcode POLYLINE
#
else if (opcode == POLYLINE) {
   call dcgen2 (ndclrl)      # Change color if necessary
   ifdef(`F80',`
   call strout (4, vector)   # Output vector command
   ',`
   call gdstot (4, vector)
   ')
   j = 1
   k = contrl(2)           # Number of points in polyline
   do i=1,k {              # Loop through all points
      call xygen2 (ptsin(j), ptsin(j+1))  # Output point coordinates
      j = j + 2            # Increment index for next set of points
      }
   ifdef(`F80',`
   call gn2out (CR)
   ',`
   call gdevot (CR)
   ')
   }
 
#
#  opcode POLYMARKER
#
else if (opcode == POLYMARKER) {
   kstyle = DIG1        # Set solid line style
   ifdef(`F80',`
   call strout (7, lstyle)     # Output linestyle command
   ',`
   call gdstot (7, lstyle)
   ')
   call dcgen2 (ndclrm)        # Change color to marker color
   j = 1
   k = contrl(2)               # Number of points at which to place markers
   do i=1,k {
      call dmgen2 (ptsin(j))   # Output a marker
      j = j + 2                # Increment index for next marker location
      }

   kstyle = ndlntp             # Restore line style
   ifdef(`F80',`
   call strout (7, lstyle)
   ',`
   call gdstot (7, lstyle)
   ')
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
   txtatt(6) = BIGC        # Set text color
   txtatt(7) = ndclrt
   ifdef(`F80',`
   call strout (8,txtatt)  # Output text color command
   ',`
   call gdstot (8, txtatt)
   ')

   # The GEN.II device assumes that the current cursor position is near the
   # middle of the left edge of the character cell.  Therefore, we must
   # adjust the cursor position vertically and horizontally (inter-character
   # gap).  The directions of these adjustments are based on the current
   # text rotation.

   i = divid (ndtxrt, 900, j) + 1   # Index into x,y rot tables
   i = gimnmx (i, 1, 4)

   # Compute position based on rotation
   j = divid (mult (ndtxsz, 9)+50, 100, temp)   # Compute y-offset
   l = divid (mult (ndtxsz, 2)+50, 100, temp)   # Compute inter-char gap

   xtemp = mult (j, xrot(i)) + mult (l, xoffst(i))  # Compute sign of x-offset
   ytemp = mult (j, yrot(i)) + mult (l, yoffst(i))  # Compute sign of y-offset

   nx = xtemp + ptsin(1)   # Compute new x position
   ny = ytemp + ptsin(2)   # Compute new y position

   ifdef(`F80',`
   call strout (4, vector)   # Move to string start position
   ',`
   call gdstot (4, vector)
   ')
   call xygen2 (nx, ny)
   ifdef(`F80',`
   call gn2out (CR)          # Terminate vector command
   ',`
   call gdevot (CR)
   ')

   temp = contrl(4)          # Save string length
   do i=1,temp {   # If string delimiter appears as part of string,
      if (intin(i) == TILDE) intin(i) = BLANK  # replace it with a blank
      }

   ifdef(`F80',`
   call strout (6, txtstr)     # Send text to workspace
   call strout (temp, intin)
   call gn2out (TILDE)         # End string command with delimiter
   call gn2out (CR)
   ',`
   call gdstot (6, txtstr)
   call gdstot (temp, intin)
   call gdevot (TILDE)
   call gdevot (CR)
   ')
   }
 
#
#  opcode FILL AREA
#
else if (opcode == FILLxAREA) {
   call dfgen2                          # Set fill color

   ifdef(`F80',`
   call strout (4, poly)                # Output polygon
   ',`
   call gdstot (4, poly)
   ')
   j = 1
   k = contrl(2)                         # Number of points in fill area
   do i=1,k {                            # Loop through all points
      call xygen2 (ptsin(j),ptsin(j+1))  # Output coordinates
      j = j + 2            # Increment index for next vertex
      }
   ifdef(`F80',`
   call gn2out (CR)        # Terminate polygon command
   ',`
   call gdevot (CR)
   ')
   }
 
#
#  opcode CELL ARRAY
#
else if (opcode == CELLxARRAY) {
ifdef(`COLORxBOX',`
   savex = ptsin(1)         # Upper left corner
   savey = ptsin(2)
   xtemp = ptsin(3)         # Lower right corner
   ytemp = ptsin(4)
   temp = contrl(6)         # save length of each row in color index array
   nx = contrl(7)           # save number of elements used in each row
   ny = contrl(8)           # number of rows in color array

   # Determine repeat count for each color across a row
   i = xtemp - savex + 1 + divid (nx, 2, k)
   xrpt = divid (i, nx, k)

   # Determine repeat count for each row
   i = ytemp - savey + 1 + divid (ny, 2, k)
   yrpt = divid (i, ny, k)

   ycoord = ytemp                       # Set initial y to top of area
   do m=1,ny {                          # Traverse this many rows
      do j=1,yrpt {                     # Repeat each row as necessary
	 xcoord = savex
         ifdef(`F80',`
         call strout (4, vector)
         ',`
         call gdstot (4, vector)
         ')
         call xygen2 (xcoord, ycoord)   # Move to correct location
         ifdef(`F80',`
         call gn2out (CR)
         ',`
         call gdevot (CR)
         ')
      
	 do n=1,nx {                    # Use this many elements per row
            colptr = mult (temp, (m-1)) + n       # Use this element
            pixel = gimnmx (intin(colptr), 0, 1)  # Bound the element

            if (pixel == 0) pixel = ATSIGN  # Pixel is off
            else pixel = pixel + ATSIGN     # Pixel is on

            ilen = gitoch (xrpt, raster(6), 3, ierror) # Output these elements
            raster(ilen+6) = LPAREN
            raster(ilen+7) = pixel
            raster(ilen+8) = RPAREN
	    ilen = ilen + 9
	    raster(ilen) = CR
	    ifdef(`F80',`
            call strout (ilen, raster)
	    ',`
	    call gdstot (ilen, raster)
	    ')
            }
         ycoord = ycoord - 1      # Move down one raster line
         }
      }
',`
   # If this is a monochrome box, must at least outline the cell
   #   described by the coordinates sent in

   call dcgen2 (ndclrl)           # Outline with current line color

   xbar(1) = ptsin(1)             # X-coordinate of left edge
   ybar(1) = ptsin(2)             # Y-coordinate of bottom edge
   xbar(2) = ptsin(3)             # X-coordinate of right edge
   ybar(2) = ybar(1)
   xbar(3) = xbar(2)
   ybar(3) = ptsin(4)             # Y-coordinate of upper edge
   xbar(4) = xbar(1)
   ybar(4) = ybar(3)
   ifdef(`F80',`
   call strout (4, vector)        # Use vector command to outline cell
   ',`
   call gdstot (4, vector)
   ')
   do i=1,4 {
      call xygen2 (xbar(i), ybar(i))
      }
   call xygen2 (xbar(1), ybar(1))
   ifdef(`F80',`
   call gn2out (CR)
   ',`
   call gdevot (CR)
   ')
')
   }

#
#  opcode GENERALIZED DRAWING PRIMITIVE
#
else if (opcode == GENERALIZEDxDRAWINGxPRIMITIVE) {
   opcode = contrl(6)
   if (opcode == BAR) {
      call dfgen2                # Set up fill colors

      xbar(1) = ptsin(1)         # Compute vertices of the bar
      ybar(1) = ptsin(2)
      xbar(2) = ptsin(3)
      ybar(2) = ybar(1)
      xbar(3) = xbar(2)
      ybar(3) = ptsin(4)
      xbar(4) = xbar(1)
      ybar(4) = ybar(3)

      ifdef(`F80',`
      call strout (4, poly)               # Output polygon (bar) command
      ',`
      call gdstot (4, poly)
      ')
      do i=1,4 {                          # Loop through the points
	 call xygen2 (xbar(i), ybar(i))   # Output the coordinates
         }
      ifdef(`F80',`
      call gn2out (CR)                    # Terminate the command
      ',`
      call gdevot (CR)
      ')
      }
   
   else if (opcode == ARC | opcode == PIExSLICE) { # Arc, pie-slice
      if (opcode == 3) { call dfgen2 }   # Change color for pie slice
      else { call dcgen2 (ndclrl) }   # Arcs use current line color

      ifdef(`F80',`
      call strout (4, vector)         # Output vector command
      ',`
      call gdstot (4, vector)
      ')
      call xygen2 (ptsin(1), ptsin(2)) # Output start coordinates (does a move)
      ifdef(`F80',`
      call gn2out (CR)                # Terminate the command
      ',`
      call gdevot (CR)
      ')

      angbeg = divid (intin(1), 10, i)   # Start angle of ARC or PIE SLICE
      angend = divid (intin(2), 10, i)   # End angle of ARC or PIE SLICE

      # Output the proper command depending upon the GDP desired
      ifdef(`F80',`
      if (opcode == ARC) call strout (5, circle)
      else call strout (5, pie)
      ',`
      if (opcode == ARC) call gdstot (5, circle)
      else call gdstot (5, pie)
      ')

      ilen = gitoch (ptsin(7), line, 3, ierror)       # Radius
      temp = ilen + 1
      line(temp) = COMMA
      temp = temp + 1
      ilen = gitoch (angbeg, line(temp), 3, ierror)   # Beginning angle
      temp = temp + ilen
      line(temp) = COMMA
      temp = temp + 1
      ilen = gitoch (angend, line(temp), 3, ierror)   # End angle
      ilen = ilen + temp
      line(ilen) = CR   # Command terminator
      ifdef(`F80',`
      call strout (ilen, line)   # Output radius and angle information
      ',`
      call gdstot (ilen, line)
      ')
      }
   else if (opcode == CIRCLE) {  # Circle
      call dfgen2                # Set up fill colors
     
      ifdef(`F80',`
      call strout (4, vector)    # Command to move to center of circle
      ',`
      call gdstot (4, vector)
      ')
      call xygen2 (ptsin(1), ptsin(2))   # Output center point coordinates
      ifdef(`F80',`
      call gn2out (CR)           # Terminate command
      ',`
      call gdevot (CR)
      ')

      # Convert the radius to character representation and output circle
      ilen = gitoch (ptsin(5), pie(6), 3, ierror)
      ilen = ilen + 6
      pie(ilen) = CR
      ifdef(`F80',`
      call strout (ilen, pie)
      ',`
      call gdstot (ilen, pie)
      ')
      }
   }

#
#  opcode SET CHARACTER HEIGHT
#
else if (opcode == SETxCHARACTERxHEIGHT) {
   # Some of the calculations below require the addition of round-off
   # factors to minimize errors that result from integer calculations.
   # Therefore, divid-mult pairs are used in those calculations.

   chrhgt = gimnmx (ptsin(2), 8, 325)      # Bound the char height requested

   ndtxsz = divid (mult (chrhgt, 100)+10, 21, j) # Scale factor
   temp = divid (mult (ndtxsz, 13)+50, 100, j)   # 1/2 cell width
   celwdt = mult (temp, 2)    # Full cell width. Will be a multiple of 2
      
   # Due to character size discrepancies between horizontal text and
   # vertical text of the same size, only those scale factors which
   # produce cell widths that are multiples of 4 are used.  This 
   # restriction allows the use of the same scale factor for rotated
   # text as well as horizontal text, since scale factors that produce
   # cell widths that are multiples of four produce the same cell width
   # for both rotated and non-rotated text. The following calculations are
   # needed to determine the correct character scale factor if the cell 
   # width is not a multiple of 4.

   if (mod (celwdt, 4) != 0) {
      temp = divid (celwdt, 2, j)                  # 1/2 cell width
      ndtxsz = divid (mult (temp, 100)-50, 13, j)  # Intermediate scale factor
      chrhgt = divid (mult (ndtxsz, 21)-10, 100, j)  # New character height
      ndtxsz = divid (mult (chrhgt, 100)+10, 21, j)  # New scale factor
      celwdt = celwdt - 2     # New cell width.  This will be a multiple of 4
      }

   ilen = gitoch (ndtxsz, cscale(6), 4, ierror)  # Convert scale to chars

   ilen = ilen + 6   # Position CR in correct location in cscale
   cscale(ilen) = CR
   ifdef(`F80',`
   call strout (ilen, cscale)   # Output character scale command
   ',`
   call gdstot (ilen, cscale)
   ')

   contrl(3) = 2
   temp = divid (mult (11, ndtxsz)+50, 100, j)   # Calculate 1/2 char width
   ptsout(1) = mult (temp, 2)                    # Return character width
   ptsout(2) = chrhgt                            # Return height selected
   ptsout(3) = celwdt                            # Return cell width
   temp = divid (mult (14, ndtxsz)+50, 100, j)   # Calculate 1/2 cell height
   ptsout(4) = mult (temp, 2)                    # Return character cell height
   }

#
#  opcode SET CHARACTER UP VECTOR
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
   # Allow character rotation in 90 degree increments
   # Device can actually do 1 degree increments, but
   # mathematics to do so is infeasible in an integer
   # environment.

   ndtxrt = mult (divid ((intin(1)+450), 900, i), 900)  # Round up angle
   i = divid (ndtxrt, 3600, ndtxrt)    # Perform mod 3600 to determine angle
   ilen = gitoch (divid (ndtxrt, 10, i), crot(6), 3, ierror)  # Tenths to unit
   ilen = ilen + 6      # Determine command termination location
   crot(ilen) = CR
   ifdef(`F80',`
   call strout (ilen, crot)   # Output rotation command
   ',`
   call gdstot (ilen, crot)
   ')
   intout(1) = ndtxrt         # Return the rotation angle selected
   }

#
#  opcode SET COLOR REPRESENTATION
#
else if (opcode == SETxCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 1) + 1     # Two possible color indices

   # If all intensities are 0, background color is used, else white is used
   j = intin(1) + intin(2) + intin(3)
   if (j <= 0) ccltb(i) = 0            # Background color
   else ccltb(i) = 1000                # White

   rdgen2(i) = gimnmx (intin(2), 0, 1000)   # Save RGB values
   grgen2(i) = gimnmx (intin(3), 0, 1000)
   blgen2(i) = gimnmx (intin(4), 0, 1000)

   temp = divid (ccltb(i), 10, j)
   call dmpgn2 (i-1, temp)            # Change representation on the device
   }
 
#
#  opcode SET POLYLINE LINETYPE
#
else if (opcode == SETxPOLYLINExLINETYPE) {
   ndlntp = gimnmx (intin(1), 1, 8) # 8 line styles (1-8)
   intout(1) = ndlntp               # Return the actual linestyle selected
   ndlntp = ndlntp + DIG0           # Make linestyle an ASCII number
   kstyle = ndlntp
   ifdef(`F80',`
   call strout (7, lstyle)          # Output command to change linestyle
   ',`
   call gdstot (7, lstyle)
   ')
   }
 
#
#  opcode SET POLYLINE COLOR INDEX
#
else if (opcode == SETxPOLYLINExCOLORxINDEX) {
   ndclrl = gimnmx (intin(1), 0, 1)        # Two line color indices
   intout(1) = ndclrl
   ndclrl = ndclrl + DIG0                  # Make line color an ASCII number
   }
 
#
#  opcode SET POLYMARKER TYPE
#
else if (opcode == SETxPOLYMARKERxTYPE) {
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3    # Set to default if out of range
   intout(1) = ndmktp
   }

#
#  opcode SET POLYMARKER COLOR INDEX
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX) {
   ndclrm = gimnmx (intin(1), 0, 1)        # Two marker color indices
   intout(1) = ndclrm
   ndclrm = ndclrm + DIG0                  # Make marker color an ASCII number
   }

#
#  opcode SET TEXT COLOR INDEX
#
else if (opcode == SETxTEXTxCOLORxINDEX) {
   ndclrt = gimnmx (intin(1), 0, 1)        # Two text color indices
   intout(1) = ndclrt
   ndclrt = ndclrt + DIG0                  # Make text color an ASCII color
   }
 
#
#  opcode SET FILL INTERIOR STYLE
#
else if (opcode == SETxFILLxINTERIORxSTYLE) {
   ndfstl = intin(1)
   if (ndfstl < HOLLOW | ndfstl > HATCH) ndfstl = HOLLOW  # Hollow is default
   intout(1) = ndfstl
   }

#
#  opcode SET FILL STYLE INDEX
#
else if (opcode == SETxFILLxSTYLExINDEX) {
   ndflpt = intin(1)             # Fill style index 
   if (ndflpt < 1 | ndflpt > 6) ndflpt = 1   # Six fill style indices
   intout(1) = ndflpt            # Return pattern fill index
   ndflpt = ndflpt + SLASH       # Convert pattern fill index ASCII number
   }

#
#  opcode SET FILL COLOR INDEX
#
else if (opcode == SETxFILLxCOLORxINDEX) {
   ndclrf = gimnmx (intin(1), 0, 1)    # Two fill color indices
   intout(1) = ndclrf
   ndclrf = ndclrf + DIG0              # Make fill color and ASCII color
   }
 
#
#  opcode INQUIRE COLOR REPRESENTATION
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 1) + 1   # Two possible color indices
   intout(1) = i - 1                 # Return index selected
   j = intin(2)                      # Type of inquiry 0-set, 1-realized
   if (j == 0) {
      intout(2) = rdgen2(i)          # Return set values
      intout(3) = grgen2(i)
      intout(4) = blgen2(i)
      }
   else if (j == 1) {
      k = ccltb(i)                   # Return realized values
      intout(2) = k
      intout(3) = k
      intout(4) = k
      }
   }

#
#  opcode INQUIRE CELL ARRAY
#
ifdef(`COLORxBOX',`
else if (opcode == INQUIRExCELLxARRAY) {
   savex = ptsin(1)          # Upper left corner
   savey = ptsin(2)
   xtemp = ptsin(3)          # Lower right corner
   ytemp = ptsin(4)
   nx = contrl(6)            # Save length of each row
   ny = contrl(7)            # Save number of rows in color index array

   contrl(10) = 0            # Initialize to valid cell array

   temp = xtemp - savex +1   # Determine number of elements to use
   xincr = max0 (1, divid (temp, nx, k))  # in each row
   j = divid (temp, xincr, k)
   contrl(8) = j
   temp = ytemp - savey +1   # Determine number of rows to use
   yincr = max0 (1, divid (temp, ny, k))
   i = divid (temp, yincr, k)
   contrl(9) = i

   ycoord = ytemp

   # loop over rows starting at top of rectangular area
   do ycount=1,i {
      xcoord = savex

      # loop over cells in row
      do xcount=1,j {

	 # if x,y coordinate is within range, read the pixel
	 # value back; otherwise, indicate an error and continue
	 if (xcoord <= XxLIMITSxGEN2 & ycoord <= YxLIMITSxGEN2) {
            ifdef(`F80',`
            call strout (4, vector)    # Move to pixel location
            ',`
            call gdstot (4, vector)
            ')
	    call xygen2 (xcoord, ycoord)
            ifdef(`F80',`
            call gn2out (CR)
	    call strout (7, rdback)    # Read the pixels value
            call strinp (NOxECHO, 2, line, temp)
            ',`
            call gdevot (CR)
	    call gdstot (7, rdback)
	    call gdstin (2, line, temp)
            ')
	    if (line(1) == BIGA) k = 1    # Pixel is on
	    else k = 0                    # Pixel is off
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
')
 
#
#  opcode INPUT LOCATOR 
#
else if (opcode == INPUTxLOCATOR) {
   if (intin(1) != DEFAULT & intin(1) != CROSSHAIRS) return
   ifdef(`F80',`
   call strout (4, vector)            # Output vector command
   ',`
   call gdstot (4, vector)
   ')
   call xygen2 (ptsin(1), ptsin(2))   # Move to initial position
   ifdef(`F80',`
   call gn2out (CR)                   # Terminate move command
   ',`
   call gdevot (CR)
   ')
   for (i=1; i<=3; i=i+1) {         # try 3 times for a good input point
      ifdef(`F80',`
      call strout (12, enagin)      # Enable gin
      call strinp (NOxECHO, 26, line, j)   # Get device coordinates
      ',`
      call gdstot (12, enagin)
      call gdstin (26, line, j)
      ')
      for (k=1; k<=j; k=k+1) {      # Find the response - <COM_CHAR>DAT
         if (line(k) == COM_CHAR & line(k+1) == BIGD & line(k+2) == BIGA &
             line(k+3) == BIGT) break
         }
      if (line(k) == COM_CHAR) {
         for (k=k; k<=j; k=k+1) {   # Now find the first COMMA delimiter
            if (line(k) == COMMA) break
            }
         if (line(k) == COMMA) {
            call gchtoi (line, k, nchar, kstop)      # Get the character struck
            k = kstop
            if (k <= j) {
               call gchtoi (line, k, nx, kstop)      # Convert the x coordinate
               k = kstop
               if (k <= j) {
                  call gchtoi (line, k, ny, kstop)   # Convert the y coordinate
                  k = kstop
                  break
                  }
               }
            }
         }
      }
   if (i <= 3) {  # check to see if we got our data
      contrl(3) = 1       # inform high level that we got a point
      contrl(5) = 1
      intout(1) = nchar   # Return locator terminator
      ptsout(1) = nx      # Return coordinates of point
      ptsout(2) = ny
      }
   }
 
#
#  opcode input string
#
else if (opcode == INPUTxSTRING) {
   contrl(5) = NOTxOK                # Assume a string will not be input
   if (intin(1) != DEFAULT) return   # Check for valid string device
   i = 0                             # Character counter initially zero
   temp = intin(2)                   # Save maximum string size
   k = intin(3)                      # Echo or non-echoed input flag
   repeat {                          # Loop to read string from device
      j = 0
      ifdef(`F80',`
      if (k == NO) call ttyin (j)    # Get a character without echo
      else {
	 call ttyin (j)              # Get a character with echo
	 call gn2out (j)
	 }
      if (j == CR) break
      ',`
      if (k == NO) call gdevin (j)
      else         call gchrin (j)
      if (j == NEWLINE) break
      ')
      if (i+1 > temp) break          # No room in output array
      i = i + 1
      intout(i) = j                  # Store character in output array
      }
   if (i > 0) contrl(5) = i          # Request successful
   } 

#
#  opcode set writing mode
#
else if (opcode == SETxWRITINGxMODE) {
   i = intin(1)
   if (i == XORxMODE) j = BIGY   # Complement mode
   else {
      j = BIGN                   # All other modes use replace mode
      i = REPLACExMODE
      }
   wrtmod(6) = j                 # Select write mode
   ifdef(`F80',`
   call strout (7, wrtmod)       # Set writing mode
   ',`
   call gdstot (7, wrtmod)
   ')
   intout(1) = i                 # Return writing mode set
   }
 
#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = REQUESTxMODE     # Default mode is request
   }

return
end
subroutine dmpgn2 (index, color)
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
#     Function : Define a color on the Digital Engineering GEN II      #
#                                                                      #
#     Input Parameters:                                                #
#            index   -     color index to be set (0-1)                 #
#            color   -     color indicator (0-black, 100-white)        #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#             gitoch   - convert integer to character string           #
#             strout - put a character string to the device (CP/M i/o) #
#             gdstot - put a character string to the device (non-CP/M) #
#                                                                      #
########################################################################
integer index, color, gitoch, setclr(20)
integer ierror, i, j, ilen
 
#     Mix color in RGB - <COM_CHAR>MIX Cn <red>,<green>,<blue>
data setclr/ COM_CHAR,BIGM,BIGI,BIGX,BLANK,BIGC,0,BLANK,0,0,0,0,_
	     0,0,0,0,0,0,0,0/
 
setclr(7) = DIG0 + index        # Build color command
ilen = 8
do i=1,3 {                      # Store the mix intensities
   ilen = ilen + 1              # Index into mix command
   j = gitoch (color, setclr(ilen), 3, ierror)   # Convert and store values
   ilen = ilen + j              # Index into mix command for comma
   setclr(ilen) = COMMA         # Store comma
   }
setclr (ilen) = CR              # Terminate command
ifdef(`F80',`
call strout (ilen, setclr)      # Output command
',`
call gdstot (ilen, setclr)
')
return
end
subroutine dmgen2 (intin)
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
#     Function: Place a marker at the current location on GEN II type  #
#               devices                                                #
#                                                                      #
#     Input Parameters:                                                #
#            intin   - x/y location for marker                         #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            xygen2 - GEN II move/draw routine                         #
#                                                                      #
########################################################################
define(`MARKxPERIOD',`1')                # Marker opcodes
define(`MARKxPLUS',`2')
define(`MARKxSTAR',`3')
define(`MARKxO',`4')
define(`MARKxX',`5')
define(`FULLSZ',`8')                     # Full size of marker is 8 units
define(`HALFSZ',`4')
define(`FPERSZ',`2')                     # Full size of period is one unit
define(`HPERSZ',`1')
define(`COM_CHAR',BANG)                  # command character
 
integer intin(2)
 
integer fsize, hsize, x1, x2, y1, y2
integer rxy1, rxy2, vector(4)
 
include(`ddcom')

#            Output a vector - <COM_CHAR>VEC
data vector/ COM_CHAR,BIGV,BIGE,BIGC/

   if (ndmktp == MARKxPERIOD) {
      fsize = FPERSZ
      hsize = HPERSZ
      }
   else {
      fsize = FULLSZ
      hsize = HALFSZ
      }
 
   x1 = intin(1) - hsize        # clip marker to device limits
   x2 = x1 + fsize
   y1 = intin(2) - hsize
   y2 = y1 + fsize
   if ((min0(x1,y1) < 0) | (x2 > XxLIMITSxGEN2) | (y2 > YxLIMITSxGEN2)) return
 
   # output appropriate marker centered on location
   ifdef(`F80',`
   call strout (4, vector)      # Output move/draw command
   ',`
   call gdstot (4, vector)
   ')
   call xygen2 (x1,y1)
   if (ndmktp == MARKxPERIOD | ndmktp == MARKxO) {
      call xygen2 (x2,y1)       # Output marker coordinates
      call xygen2 (x2,y2)
      call xygen2 (x1,y2)
      call xygen2 (x1,y1)
      ifdef(`F80',`
      call gn2out (CR)          # Output command terminator
      ',`
      call gdevot (CR)
      ')
      }
   else {
      if (ndmktp == MARKxX | ndmktp == MARKxSTAR) {
         call xygen2 (x2,y2)
         ifdef(`F80',`
         call gn2out (CR)
         ',`
         call gdevot (CR)
         ')
      
         ifdef(`F80',`
         call strout (4, vector)
         ',`
         call gdstot (4, vector)
         ')
	 call xygen2 (x1,y2)
         call xygen2 (x2,y1)
         ifdef(`F80',`
         call gn2out (CR)
         ',`
         call gdevot (CR)
         ')
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
         ifdef(`F80',`
         call strout (4, vector)
         ',`
         call gdstot (4, vector)
         ')
         rxy2 = y1 + hsize
	 call xygen2 (x1,rxy2)
         call xygen2 (x2,rxy2)
         ifdef(`F80',`
         call gn2out (CR)
	 call strout (4, vector)
         ',`
         call gdevot (CR)
	 call gdstot (4, vector)
         ')
         rxy1 = x1 + hsize
	 call xygen2 (rxy1,y1)
         call xygen2 (rxy1,y2)
         ifdef(`F80',`
         call gn2out (CR)
         ',`
         call gdevot (CR)
         ')
         }
      }

   return
end
subroutine dfgen2
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
#     Function: Change the fill color on the GEN II terminal         #
#                                                                    #
#     Input Parameters:                                              #
#            color - color index to change to                        #
#                                                                    #
#     Output Parameters:                                             #
#            none                                                    #
#                                                                    #
#     Routines called:                                               #
#            strout - output a string to the current device          #
#            dcgen2 - change color on GEN.II terminal                #
#                                                                    #
######################################################################
integer filclr(11), mult
integer inipat(13),patdat(84),i,ilen,l,k,j,line(4),gitoch,ierror

include(`ddcom')

#            Set fill color attributes - <COM_CHAR>COL XX,XX
data filclr/ COM_CHAR,BIGC,BIGO,BIGL,BLANK,BLANK,BLANK,COMMA,BLANK,_
	     BLANK,CR/

#            <COM_CHAR>PAT Px,C0,C1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data inipat/ COM_CHAR,BIGP,BIGA,BIGT,BLANK,BIGP,0,COMMA,BIGC,DIG0,COMMA,_
	     BIGC,DIG1/
	     
#            Pattern data for 6 patterns
data patdat/ 14*129,_                                       # Vertical (P1)
	     6*0,255,255,6*0,_                              # Horizontal (P2)
	     3,6,12,24,48,96,193,3,6,12,24,48,96,193,_      # 45 degree (P3)
	     193,96,48,24,12,6,3,193,96,48,24,12,6,3,_      # -45 degree (P4)
	     6*129,255,255,6*129,_                          # P1 & P2
	     195,102,60,24,60,102,195,195,102,60,24,60,102,195/  # P3 & P4

   if (ndfstl == SOLID | ndfstl == HOLLOW) {   # Handle hollow and solid
      filclr(6) = BIGC
      filclr(7) = DIG0                         # Hollow fill
      if (ndfstl == SOLID) filclr(7) = ndclrf  # Solid fill
      filclr(9) = BIGC             # Outline in current fill color
      filclr(10) = ndclrf
      ifdef(`F80',`
      call strout (11, filclr)
      ',`
      call gdstot (11, filclr)
      ')
      }   
   if (ndfstl == PATTERN | ndfstl == HATCH) { # Pattern and hatch are same

      # Define pattern
      inipat(7) = ndflpt        # Store pattern number
      inipat(13) = ndclrf       # Set pattern color
      ifdef(`F80',`
      call strout (13, inipat)  # Output the pattern definition command
      ',`
      call gdstot (13, inipat)
      ')
      line(1) = COMMA
      i = ndflpt - DIG0         # Digitize pattern number
      do j=1,14 {
	 k = mult (i, 14) + j   # Index into pattern data array
	 ilen = gitoch (patdat(k), line(2), 3, ierror)
	 l = ilen + 1

         ifdef(`F80',`
         call strout (l, line)  # Output the pattern definitions
         ',`
         call gdstot (l, line)
         ')
	 }
      ifdef(`F80',`
      call gn2out (CR)          # Output command terminator
      ',`
      call gdevot (CR)
      ')

      filclr(6) = BIGP          # Set up and output fill command
      filclr(7) = ndflpt
      filclr(9) = BIGC
      filclr(10) = ndclrf
      ifdef(`F80',`
      call strout (11, filclr)
      ',`
      call gdstot (11, filclr)
      ')
      }
   ndclrp = -1                  # Make sure line color will be set correctly
   return
end
subroutine dcgen2(color)
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
#     Function: Change the color on the GEN II terminal              #
#                                                                    #
#     Input Parameters:                                              #
#            color - color index to change to                        #
#                                                                    #
#     Output Parameters:                                             #
#            none                                                    #
#                                                                    #
#     Routines called:                                               #
#            strout - output a string to the current device          #
#                                                                    #
######################################################################
integer color
integer fcolor(8)

include(`ddcom')

#            Set color attributes - <COM_CHAR>COL XX,XX
data fcolor/ COM_CHAR,BIGC,BIGO,BIGL,BLANK,BIGC,0,CR/

if (ndclrp != color) {       # Should line color be changed
   ndclrp = color            # Set the current color
   fcolor(7) = color         # Store color in color command
   ifdef(`F80',`
   call strout (8, fcolor)   # Output color command
   ',`
   call gdstot (8, fcolor)
   ')
   }
return
end
subroutine xygen2 (kx, ky)
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
#     Function: Convert GEN II x,y coordinate characters and output    #
#                                                                      #
#     Input Parameters:                                                #
#           kx       - x-coordinate in 0 to device dependent space     #
#           ky       - y-coorindate in 0 to device dependent space     #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            strout - Output a character string to the device          #
#                                                                      #
########################################################################
integer ilen, kx, ky, line(8), gitoch, ierror, i
 
include(`ddcom')
 
   # Output string will look as follows: xxx,yyy

   line(1) = BLANK
   ilen = gitoch (kx, line(2), 3, ierror)   # Convert x-coord to ASCII number
   i = ilen + 2
   line(i) = COMMA
   ilen = gitoch (ky, line(i+1), 3, ierror) # Convert y-coord to ASCII number
   ifdef(`F80',`
   call strout (ilen+i, line)               # Output coordinates to device
   ',`
   call gdstot (ilen+i, line)
   ')
   return
end
ifdef(`F80',`
subroutine strout (n, strin)
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
#     Function: Output string to current device                        #
#                                                                      #
#     Input Parameters:                                                #
#           n       - number of characters to output                   #
#           strin   - array of characters to output                    #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gn2out - output character to current device               #
#                                                                      #
########################################################################
integer n, strin(n)
integer i
   if (n > 0) {
      do i=1,n {
         call gn2out (strin(i))    # Output the character
         }
      }
   return
end
')
ifdef(`F80',`
subroutine strinp (echo, n, intstr, actnum)
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
#     Function: Read character string from current device              #
#                                                                      #
#     Input Parameters:                                                #
#           echo     - echo flag (0-off, 1-on)                         #
#           n        - number of characters to read                    #
#                                                                      #
#     Output Parameters:                                               #
#           intstr   - array into which characters are read            #
#           actnum   - actual number of characters read up to end of   #
#                      line character                                  #
#                                                                      #
#     Routines Called:                                                 #
#           ttyin   - read character from current device               #
#                                                                      #
########################################################################
integer echo, n, intstr(n), actnum, i
integer * 1 char

   actnum = 0
   if (n > 0) {
      do i=1,n {
         call ttyin (char)                         # Read a character
         if (char == CR | char == NEWLINE) {       # Return on end of line
            return
            }
         else {
            if (echo == ECHO) call gn2out (char)   # Echo if necessary
	    intstr(i) = char                       # Store character
            actnum = actnum + 1                    # Increment char counter
	    }
         }
      }
   return
end
')
ifdef(`F80',`
subroutine gn2out (char)
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
#     Function: Output character to current device with CTL-S, CTL-Q   #
#               flagging                                               # 
#                                                                      #
#     Input Parameters:                                                #
#           char    - character to output                              #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            ttyinw - device input no wait                             #
#                                                                      #
########################################################################
integer*1 char, ich

call ttyinw (ich)               # Get terminal input
if (ich == DC3) {               # Test for <CNTL> S
   repeat { 
      call ttyinw (ich)
      } until (ich == DC1)      # Wait for <CNTL> Q; other chars lost
   }

call ttyout (char)              # Ok to output character

return
end
')
E 1
