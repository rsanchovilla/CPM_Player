h62095
s 01091/00000/00000
d D 1.1 83/03/17 15:42:53 tes 1 0
c date and time created 83/03/17 15:42:53 by tes
e
u
4
U
t
T
I 1
subroutine ddv125 (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device driver for VT125 terminal                       #
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
#             Drv125 - move/draw for VT125 terminal                    #
#             gdevot - put out a character to the device               #
#             gdstot - put out a character string to the device        #
#             dcv125 - color changing on VT125  terminal               #
#             dlv125 - change line type on VT125 terminal              #
#             dmv125 - emulate markers for VT125 terminal              #
#             gitoch  - convert integer to character string            #
#             gimnmx - bounds checking function for integers           #
#             gdevin - get a character from the graphics device        #
#             mult   - multiply 2 unsigned 16-bit numbers              #
#             divid  - divide 2 unsigned 16-bit numbers                #
#                                                                      #
########################################################################
 
# local defines
define(`XxLIMITSxVT125',767)              # Terminal width
define(`YxLIMITSxVT125',479)              # Terminal heigth
define(`SLOW',1)                          # Increment for slow movement
define(`FAST',10)                         # Increment for fast movement
define(`UP',BIGA)                       # Up arrow key
define(`DOWN',BIGB)                     # Down arrow key
define(`RIGHT',BIGC)                    # Right arrow key
define(`LEFT',BIGD)                     # Left arrow key
define(`CHANGExRATE',BIGP)              # Function key 1
define(`NOTxOK',0)
define(`OK',1)
define(`DEFAULT',1)                       # Default GIN device
define(`CROSSHAIRS',2)                    # Crosshairs
define(`MOVE',1)
define(`DRAW',2)
define(`REPLACExMODE',1)                    # Replace writing mode
define(`OVERSTRIKExMODE',2)                 # Overstrike writing mode
define(`XORxMODE',3)                        # Xor writing mode
define(`ERASExMODE',4)                      # Erase writing mode
define(`STRINGxINPUT',4)                    # String input class
define(`HOLLOW',0)                      # Hollow fill interior style
define(`SOLID',1)                       # Solid fill interior style

integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
SHORTINT opcode
integer i, j, length, icnvt(3), gimnmx, ksolid, 
        clr1(7), ringbl(2), gitoch, temp, mult, divid,
	k, colind, light(4), arc(3), wrtmod(4), wrttbl(4),
        setup1(53), setup2(33), stopgr(2), newfrm(4), big,
        bcolor(5), shade(5), txt1(3), txt2(2), txt3(3), rate, circle(2) 
integer chrwid(16), chrhgt(16), celwid(16), celhgt(16), yoffst(16),
	curup(3), curdwn(3), currgt(3), curlft(3),
	curhom(3), erscrn(3), erslin(3), revon(4), revoff(4), entgrf(4),
	extgrf(3), inqcur(5), line(7)
 
integer xcoord, ycoord, xtemp, ytemp, xrot(4), yrot(4)
 
logical qdone
 
integer reqred(4), reqgrn(4), reqblu(4), actred(4), actgrn(4), actblu(4)
 
include(ddcom)
 
common /cmv125/ reqred, reqgrn, reqblu, actred, actgrn, actblu
 
 
# Solid line type is 1 (ADE 49)
data ksolid /DIG1/

# Lightness color values for Black, Red, Green, Blue
data light /0, 60, 90, 30/

# Table of x and y rotation factors at 90 degree intervals
data xrot /0, 1, 0, 1/
data yrot /1, 0, 1, 0/

# Table of additional interline offsets used for correct character
# placement
data yoffst /2, 3, 5, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 22, 23/

# Character width and height in rasters
data chrwid /8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, _
	     112, 120, 128/
data chrhgt /14, 21, 35, 42, 56, 63, 77, 84, 98, 105, 119, 126, _
	     140, 147, 154, 161/

# Character cell width and height in rasters
data celwid /9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, _
	     126, 135, 144/
data celhgt /20, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, _
	     195, 210, 225, 240/

# Table of writing modes: replace, overstrike, xor, erase
data wrttbl /BIGR, BIGV, BIGC, BIGE/

#             Set writing mode
data wrtmod / BIGW, LPAREN, BIGR, RPAREN/

#             Ring bell
data ringbl / BELL, NEWLINE/

#             Arc command
data arc    / BIGC, LPAREN, BIGA/

#             Circle command
data circle / BIGC, LBRACK/
 
#             Define color command - S(M<index>(<color>)) 
data clr1   / BIGS,LPAREN,BIGM,DIG0,BLANK,LPAREN,BIGL/ 
 
#
#            Set up -
#               Erase alpha plane         <ESC>[2J
#               Enter graphics mode       <ESC>Pp
#               Set replace mode          W(R,
#               Use 2 planes for graphics F,
#               Negative writing off      N0,
#               Shading off               S0,
#               Pattern mulitplier of 2   P(M2))
#               Set window                S(A[0,0] [767,479],
#               Set scale of 1            S1,
#               Set background index of 0 I0,
#               Set time delay of 0       T0)
#               Define color index 0      S(M0(L0),
#               Define color index 1      M1(L60),
#               Define color index 2      M2(L90),
#               Define color index 3      M3(L30))
#
data setup1 /ESC, LBRACK, DIG2, BIGJ,
             ESC, BIGP, LETP, BIGW, LPAREN, BIGR, COMMA, BIGF, COMMA,
             BIGN, DIG0, COMMA, BIGS, DIG0, COMMA, BIGP, LPAREN, BIGM,
             DIG2, RPAREN, RPAREN,
             BIGS, RPAREN, BIGA, LBRACK, DIG0, COMMA, DIG0, RBRACK, BLANK,
             LBRACK, DIG7, DIG6, DIG7, COMMA, DIG4, DIG7, DIG9,  RBRACK,
             COMMA, BIGS, DIG1, COMMA, BIGI, DIG0, COMMA, BIGT, DIG0, RPAREN/
 
data setup2/ BIGS, LPAREN, BIGM, DIG0, LPAREN, BIGL, DIG0, RPAREN, COMMA,
             BIGM, DIG1, LPAREN, BIGL, DIG6, DIG0, RPAREN, COMMA,
             BIGM, DIG2, LPAREN, BIGL, DIG9, DIG0, RPAREN, COMMA,
             BIGM, DIG3, LPAREN, BIGL, DIG3, DIG0, RPAREN, RPAREN /
 
#            Stop graphics -  <ESC>\
data stopgr /ESC, BACKSLASH/
 
#            Erase the screen  - S(E)
data newfrm /BIGS, LPAREN, BIGE, RPAREN/
 
#            Change the background color - S(I<index>)
data bcolor /BIGS, LPAREN, BIGI, DIG0, RPAREN/
 
#           Turn shading on or off - W(S<status>)
data shade  / BIGW, LPAREN, BIGS, DIG0, RPAREN/
 
#           First part of text command - T(D
data txt1   / BIGT, LPAREN, BIGD/
 
#           Second part of text command - ,S
data txt2   / COMMA, BIGS/
 
#           Third part of text command - ) "
data txt3   / RPAREN, BLANK, DQUOTE/
 
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
data entgrf /ESC, BIGP, LETP, NEWLINE/

#   exit graphics mode into alpha cursor mode
data extgrf /ESC, BACKSLASH, NEWLINE/

#    inquire current cursor address
data inqcur /ESC, LBRACK, DIG6, LETN, NEWLINE/

opcode=contrl(OPCODE)
contrl(3) = 0                  # Initialize number of output points to 0
 
#
#  opcode open workstation
#
if (opcode == OPENxWORKSTATION) {
 
   # set up output capability array
 
   contrl(3) = 6               # Number of output vertices 
   contrl(5) = 45              # length of intout

   intout(1) = XxLIMITSxVT125  # Maximum addressable screen width
   intout(2) = YxLIMITSxVT125  # Maximum addressable screen height
   intout(3) = OTHER           # Device coordinates are other than meters
   intout(4) = 263             # Width of a pixel in micrometers
			       #   202000 um  / 768 rasters
   intout(5) = 239             # Height of a pixel in micrometers
			       #   115000 um / 480 rasters
   intout(6) = 16              # Number of character heights
   intout(7) = 6               # Number of line types
   intout(8) = 1               # Number of line widths
   intout(9) = 5               # Number of marker types
   intout(10)= 1               # Number of marker sizes
   intout(11)= 1               # Number of text fonts
   intout(12)= 0               # Number of patterns
   intout(13)= 0               # Number of hatch styles
   intout(14)= 4               # Number of predefined colors
   intout(15)= 3               # Number of GDPs
   intout(16)= 1               # Bar GDP available
   intout(17)= 2               # Arc GDP available
   intout(18)= 4               # Circle GDP available
   do i=19,25 {
      intout(i) = -1
      intout(i+10) = -1
      }
   intout(26)= 3               # Bar GDP uses fill area attributes
   intout(27)= 1               # Arc GDP uses line attributes
   intout(28)= 3               # Circle GDP uses fill area atributes
   intout(36)= 0               # Device is not capable of color
   intout(37)= 0               # Device is not capable of text rotation
   intout(38)= 0               # Device is not capable of filled areas
   intout(39)= 0               # Device is not capable of pixel operations
   intout(40)= 4               # Number of colors available
   intout(41)= 1               # Number of locator devices available
   intout(42)= 0               # Number of valuator devices available
   intout(43)= 0               # Number of choice devices available
   intout(44)= 1               # Number of string devices available
   intout(45)= 2               # Workstation type (input/output)

   ptsout(1) = 0 
   ptsout(2) = 15              # Minimum character height in DC space
   ptsout(3) = 0
   ptsout(4) = 160             # Maximum character height in DC space
   ptsout(5) = 1               # Minimum line width in DC space
   ptsout(6) = 0
   ptsout(7) = 1               # Maximum line width in DC space
   ptsout(8) = 0
   ptsout(9) = 0
   ptsout(14)= 10              # Minimum marker height in DC space
   ptsout(11)= 0
   ptsout(12)= 10              # Maximum marker height in DC space

   i = intin(2)
   if (i > 6) i = 6
   ndlntp = gimnmx(i, 1, 6) + DIG0       # Set current device line style
   ndclrl = gimnmx(intin(3), 0, 3)       # Set current polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 5) ndmktp=3
   ndclrm = gimnmx(intin(5), 0, 3)       # Set current polymarker color index
   ndclrt = gimnmx(intin(7), 0, 3)       # Set current text color index
   ndfstl = gimnmx(intin(8), 0, 1)       # Set fill interior style
   ndclrf = gimnmx(intin(10),0, 3)       # Set current fill area color index
   ndtxrt = 0                            # Initialize text rotation
   ndtxsz = 1                            # Initialize to smallest char size
   ndclrp = -1                           # Set current device color
   ndstmd = REQUESTxMODE                 # Set string input mode to request 
 
   # initialize color table
   # The first 4 entries are set to :
   #   black, red, green, blue
 
   do i=1,4 {
      actred(i) = 0
      actgrn(i) = 0
      actblu(i) = 0
      reqred(i) = 0
      reqgrn(i) = 0
      reqblu(i) = 0
      }
   actred(2) = 1000
   actgrn(3) = 1000
   actblu(4) = 1000
   reqred(2) = 1000
   reqgrn(3) = 1000
   reqblu(4) = 1000
 

   # initialize device
 
   call gioini(1)           # Init I/O system for a CRT device
   call gdstot (53, setup1)
   call gdstot (33, setup2) # Initialize the color map
   call dlv125 (ndlntp)     # Set initial line type
   }
 
#
#  opcode close workstation
#
else if (opcode == CLOSExWORKSTATION) {
   call gdstot (4, newfrm)       # Erase screen
   call gdstot (2, stopgr)       # Terminate graphics
   call giostp                   # Close I/O system
   }
 
#
#  opcode clear workstation 
#
else if (opcode == CLEARxWORKSTATION) {
   call gdstot (4, newfrm)       # Clear the screen
   }
 
# 
#  opcode update workstation
#
else if (opcode == UPDATExWORKSTATION) {
   call gdevot (NEWLINE)         # Force out any graphics pending
   }

#
#  opcode escape
#
else if (opcode == ESCAPE) {
     opcode = contrl(6)  # Get the escape sub opcode
     if (opcode == INQUIRExADDRESSABLExCELLS) {
	intout(1) = 24
	intout(2) = 30
	}
     else if (opcode == ENTERxGRAPHICSxMODE)  {
	call gdstot (4, entgrf)
	}
     else if (opcode == EXITxGRAPHICSxMODE)  {
	call gdstot (3, extgrf)
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
#  opcode polyline
#
else if (opcode == POLYLINE) {
   call dcv125 (ndclrl)                        # Change color if necessary
   call drv125 (MOVE, ptsin(1), ptsin(2))      # Move to first point
   j = 3
   for (i=2; i<=contrl(2); i=i+1) {            # Draw between subsequent pts
      call drv125 (DRAW, ptsin(j), ptsin(j+1))
      j = j + 2
      }
   }
 
#
#  opcode polymarker
#
else if (opcode == POLYMARKER) {
 
   call dcv125 (ndclrm)                       # Change color if necessary

   call dlv125 (ksolid)                       # Set the line style to be solid

   j = 1
   for (i=1; i<=contrl(2); i=i+1) {           # Ouptut marker at each point
      call dmv125 (ndmktp, ptsin(j), ptsin(j+1))
      j = j + 2
      }
 
   call dlv125 (ndlntp)                       # Restore the users line style
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
   call dcv125 (ndclrt)                       # Change color if necessary
 
   # The VT125 assumes that the current cursor position is the
   # upper left hand corner of the character cell.  Therefore,
   # we must move cursor up the height of a character cell + an offset.
 
   i = divid (ndtxrt, 90, j) + 1                  # Index into x,y rot table
   i = gimnmx (i, 1, 4)

   # Compute position based on rotation
   j = chrhgt(ndtxsz) + yoffst(ndtxsz)            # Adjust position for size
   xtemp = mult (j, xrot(i))                      # Now adjust for rotation
   if (i .eq. 2) xtemp = -xtemp
   ytemp = mult (j, yrot(i))
   if (i .eq. 3) ytemp = -ytemp
   xcoord = xtemp + ptsin(1) 
   ycoord = ytemp + ptsin(2)
   call drv125 (MOVE, xcoord, ycoord)             # Move to proper start pt

 
   # The format of a text command is :
   #    T(D<rotation>,S<size>) "<text string>"
 
   call gdstot (3, txt1)
   length = gitoch (ndtxrt, icnvt, 3, i)           # Output rotation
   call gdstot (length, icnvt)
   call gdstot (2, txt2)
 
   length = gitoch (ndtxsz, icnvt, 2, i)           # Output size
   call gdstot (length, icnvt)
   call gdstot (3, txt3)
   k = contrl(INTEGERxINxLENGTH)
   do i = 1, k {  # screen text string for 
      j = intin(i)                        # double quote
      if (j == DQUOTE) call gdevot (DQUOTE)
      call gdevot (j)
      }
   call gdevot (DQUOTE)
   }
 
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {

   call dcv125 (ndclrf)                        # Change color if necessary
   call dlv125 (ksolid)                        # Set line type to solid
   call drv125 (MOVE, ptsin(1), ptsin(2))      # Move to first point
   j = 3
   for (i=2; i<=contrl(2); i=i+1) {            # Draw between subsequent pts
      call drv125 (DRAW, ptsin(j), ptsin(j+1))
      j = j + 2
      }
   call drv125 (DRAW, ptsin(1), ptsin(2))      # Make sure polygon closed
   call dlv125 (ndlntp)                        # Reset line type
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {
  xcoord = ptsin(1)
  ycoord = ptsin(2)
  xtemp =  ptsin(3)
  ytemp =  ptsin(4)

  call dlv125 (ksolid)                        # Set line type to soild
  call dcv125 (ndclrl)                         # Change color to line color
  call drv125 (MOVE, xcoord, ycoord)
  call drv125 (DRAW, xtemp, ycoord)
  call drv125 (DRAW, xtemp, ytemp)
  call drv125 (DRAW, xcoord, ytemp)
  call drv125 (DRAW, xcoord, ycoord)

  call dlv125 (ndlntp)
  }

#
#  opcode generalized drawing primitive
#
else if (opcode == GENERALIZEDxDRAWINGxPRIMITIVE) {
   i = contrl(6)                   # get function id
   if (i == BAR) {   
      xcoord = ptsin(1)
      ycoord = ptsin(2)
      xtemp = ptsin(3)
      ytemp = ptsin(4)
      call dlv125 (ksolid)         # Set solid lines

      if (ndfstl == SOLID) {
         call dcv125 (ndclrf)
 
         call drv125 (MOVE, xtemp, ytemp)
         shade(4) = DIG1           # Turn on shading and use y-coordinate of
         call gdstot (5, shade)    # upper left corner as shading reference 
                                   # line
         call drv125 (MOVE, xcoord, ycoord)  # Move to first point
	 call drv125 (DRAW, xtemp, ycoord)   # Draw base line & fill to 
					     # Shading reference line
         shade(4) = DIG0
         call gdstot (5, shade)    # Turn off shading
	 }
      else {    # fill interior style must be hollow
	 call dcv125 (ndclrl)                # Change color & draw outline
	 call drv125 (MOVE, xcoord, ycoord)
	 call drv125 (DRAW, xtemp, ycoord)
	 call drv125 (DRAW, xtemp, ytemp)
	 call drv125 (DRAW, xcoord, ytemp)
	 call drv125 (DRAW, xcoord, ycoord)
	 }
      call dlv125 (ndlntp)        # Restore line style
      }

   else if (i == ARC) {
      call drv125 (MOVE, ptsin(1), ptsin(2))
      call dcv125 (ndclrl)      # Use line color

      # Output circle command using point on circumference

      call gdstot (3, arc)
      j = divid (intin(2)-intin(1), 10, i)        #compute change in angle
      length = gitoch (j, icnvt, 3, i)
      call gdstot (length, icnvt)                 # output change in angle
      call gdevot (RPAREN)
      call gdevot (LBRACK)
      length = gitoch (ptsin(3), icnvt, 3, i)     # output start pt of arc
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      length = gitoch (YxLIMITSxVT125-ptsin(4), icnvt, 3, i)
      call gdstot (length, icnvt)
      call gdevot (RBRACK)                        # terminate command

      }

   else if (i == CIRCLE) {
      call dlv125 (ksolid)

      call drv125 (MOVE, ptsin(1), ptsin(2))
      if (ndfstl == SOLID) {
         call dcv125 (ndclrf)      # Use fill color
         shade(4) = DIG1           # Turn on shading and use y-coordinate of
         call gdstot (5, shade)    # centerpoint as shading reference 
                                   # line
	 }
      else {
	 call dcv125 (ndclrl)      # Use line color
	 }

      # Output circle command using point on circumference

      call gdstot (2, circle)
      length = gitoch (ptsin(3), icnvt, 3, i)
      call gdstot (length, icnvt)
      call gdevot (COMMA)
      length = gitoch (YxLIMITSxVT125-ptsin(4), icnvt, 3, i)
      call gdstot (length, icnvt)
      call gdevot (RBRACK)          # terminate command

      if (ndfstl == SOLID) {
         shade(4) = DIG0
         call gdstot (5, shade)    # Turn off shading
	 }

      call dlv125 (ndlntp)         # Restore line style
      }
   } 

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
   temp = ptsin(2)                             # get input height

   ndtxsz = 1
   for (i=1; i<=16; i=i+1) {                   # find closest height
      if (chrhgt(i) > temp) {
	 ndtxsz = i - 1
	 break
	 }
      }
   ndtxsz = gimnmx (ndtxsz, 1, 16)

   contrl(3) = 2              # 2 points returned
   ptsout(1) = chrwid(ndtxsz) # return char width selected
   ptsout(2) = chrhgt(ndtxsz) # return char height selected
   ptsout(3) = celwid(ndtxsz) # return cell width selected
   ptsout(4) = celhgt(ndtxsz) # return cell height selected
   }
 
 
#
#  opcode character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
   # Device can rotate in 90 degree multiples
   # The VT125 can actually rotate in 45 degree multiples but the
   # characters look terrible.

   ndtxrt = mult (divid ((intin(1)+450), 900, i), 900)  # Round up angle
   intout(1) = ndtxrt                                   # Angle selected
   ndtxrt = divid (ndtxrt, 10, i)                       # Map 0-3600 to 0-360
   }
 
#
#  opcode set color representation
#
else if (opcode == SETxCOLORxREPRESENTATION)  {
   i = gimnmx (intin(1), 0, 3)                # determine color index
   j = i + 1
   reqred(j) = intin(1)                       # save requested (set) color
   reqgrn(j) = intin(2)
   reqblu(j) = intin(3)
 
   actred(j) = 0
   actgrn(j) = 0
   actblu(j) = 0

   # Map RGB to a lightness by choosing the most prominent color
   big = -1
   colind = -1
   do k = 2, 4 {
      temp = intin(k)
      if (temp > big) {        # Find most prominent primary color
	 big = temp
	 colind = k
	 }
      }
   colind = gimnmx (colind, 1, 4)         # Map into one of 4 grey scales
   if (colind .eq. 2) actred(j) = 1000    # Red was most dominant
   if (colind .eq. 3) actgrn(j) = 1000    # Green was most dominant
   if (colind .eq. 4) actblu(j) = 1000    # Blue was most dominant

   clr1(4) = i + DIG0                     # set color index
   call gdstot (7, clr1)
   length = gitoch (light(colind), icnvt, 3, j) # set lightness
   call gdstot (length, icnvt)
   call gdevot (RPAREN)
   call gdevot (RPAREN)
   }
 
#
#  opcode set polyline linetype
#
else if (opcode == SETxPOLYLINExLINETYPE) {
   ndlntp = intin(1)
   if (ndlntp < 1 | ndlntp > 6) ndlntp = 1  # set to default if out of range
   intout(1) = ndlntp           # return line type selected
   ndlntp = ndlntp + DIG0       # save line type as ASCII character
   call dlv125 (ndlntp)
   }
 
#
#  Set polyline color index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX) {
   ndclrl = gimnmx (intin(1), 0, 3)
   intout(1) = ndclrl           # return color index selected
   }

#
#  Set polymarker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
   ndmktp = intin (1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3   # Set to default if out of range
   intout(1) = ndmktp                        # Return marker type selected
   }
 
#
#  Set polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX)  {
   ndclrm = gimnmx (intin(1), 0, 3)
   intout(1) = ndclrm                        # Return color index selected
   }
 
#
#  Set text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX)  {
   ndclrt = gimnmx (intin(1), 0, 3)
   intout(1) = ndclrt                        # Return color index selected
   }
 
#
#  opcode set fill interior style
#
else if (opcode == SETxFILLxINTERIORxSTYLE) {
   ndfstl = intin(1)
   if (ndfstl < HOLLOW | ndfstl > SOLID) ndfstl = HOLLOW  # Default is hollow
   intout(1)  = ndfstl                                  # Return style selected
   }

#
#  opcode set fill color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
   ndclrf = gimnmx (intin(1), 0, 3)
   intout(1) = ndclrf                        # Return color index selected
   }
 
#
#   opcode inquire color representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION)  {
   i = gimnmx (intin(1), 0, 3) + 1           # Map color index in range
   if (intin(2) == SET) {                    # Return color values requested
      intout(2) = reqred(i)                  #    for index
      intout(3) = reqgrn(i)
      intout(4) = reqblu(i)
      }
   else {                                    # Return color values actually
      intout(2) = actred(i)                  #    selected for index
      intout(3) = actgrn(i)
      intout(4) = actblu(i)
      }
   intout(1) = i-1
   }
 
#
#   opcode inquire cell array
#
else if (opcode == INQUIRExCELLxARRAY) {
   }
 
#
#  opcode request locator
#
else if (opcode == INPUTxLOCATOR) {
   contrl(5) = NOTxOK
   i = intin(1)              # check for valid locator device
   if (i != DEFAULT & i != CROSSHAIRS) return

   xcoord = ptsin(1)         # Move to initial position
   ycoord = ptsin(2)
   call drv125 (MOVE, xcoord, ycoord)

   rate = FAST                # initialize rate to fast
   qdone = .false.
   call gdstot (2, ringbl)    # ring bell to tell user about gin
 
   repeat {
      xtemp = 0
      ytemp = 0
      repeat {
         call gdevin (i)      # read character
	 } until (i != DC1 & i != DC3)   # ignore DC1 & DC3 from device
      if (i == ESC) {         # determine if arrow key hit
         call gdevin (j)
         call gdevin (k)
         if      (k == UP)          ytemp = rate 
         else if (k == DOWN)        ytemp = -rate 
         else if (k == LEFT)        xtemp = -rate 
         else if (k == RIGHT)       xtemp = rate
         else if (k == CHANGExRATE) {
	    if (rate == FAST) rate = SLOW
	    else              rate = FAST
	    }
         else                       qdone = .true.
 
         xcoord = xcoord + xtemp   # update position
         ycoord = ycoord + ytemp

	 # keep cursor on screen
	 xcoord = gimnmx (xcoord, 0, XxLIMITSxVT125)
	 ycoord = gimnmx (ycoord, 0, YxLIMITSxVT125)
         call drv125 (MOVE, xcoord, ycoord)
         }
      else {                       # non-cursor key hit
         qdone = .true.
         }
      } until (qdone)
 
 
   # return x,y coordinate and key that was struck
   contrl(3) = 1                   # 1 point returned
   ptsout(1) = xcoord
   ptsout(2) = ycoord
   intout(1) = k
   contrl(5) = OK 
   }
 
#
#  opcode request string
#
else if (opcode == INPUTxSTRING) {
   contrl(5) = NOTxOK
   if (intin(1) != DEFAULT) return   # Check for valid string device
      
   i = 0
   temp = intin(2)                   # Save maximum size
   k = intin(3)                      # Echo or non-echoed input
   repeat {
      if (k == NO) call gdevin (j)   # Get a character without echo
      else         call gchrin (j)   # Get a character with echo
      if (j == NEWLINE) break
      if (i+1 > temp) break          # No room in output array
      i = i + 1
      intout(i) = j
      }
   if (i > 0) contrl(5) = i          # Request successful
   } 
 
#
#  opcode set writing mode
#
else if (opcode == SETxWRITINGxMODE) {
   i= intin(1)
   if (i < REPLACExMODE | i > ERASExMODE) i = REPLACExMODE
   wrtmod(3) = wrttbl (i)  # Select writing mode via table lookup
   call gdstot (4, wrtmod) # Set writing mode
   intout(1) = i           # Return writing mode selected
   }

#
#  opcode set input mode
#
else if (opcode == SETxINPUTxMODE) {
   intout(1) = REQUESTxMODE     # Default mode is request
   }

return
end
subroutine dmv125 (marker, xcoord, ycoord)
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
#     Function: Place a marker at the specified location on VT125      #
#                                                                      #
#     Input Parameters:                                                #
#            marker - marker symbol index (1-5)                        #
#            xcoord, ycoord   - x/y location for marker                #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            drv125 - VT125 move/draw routine                          #
#                                                                      #
########################################################################
 
define(`MARKxPERIOD',1)
define(`MARKxPLUS',2)
define(`MARKxSTAR',3)
define(`MARKxO',4)
define(`MARKxX',5)
define(`FULLSZ',10)
define(`HALFSZ',5)
define(`FPERSZ',4)
define(`HPERSZ',2)
 
integer marker, xcoord, ycoord
 
integer fsize, hsize, x1, x2, y1, y2, itemp
 
   if (marker == MARKxPERIOD) {
      fsize = FPERSZ
      hsize = HPERSZ
      }
   else {
      fsize = FULLSZ
      hsize = HALFSZ
      }
 
   x1 = xcoord - hsize        #clip marker to device limits
   x2 = x1 + fsize
   y1 = ycoord - hsize
   y2 = y1 + fsize
   if ((min0 (x1,y1) < 0) | (x2 > XxLIMITSxVT125) | _
       (y2 > YxLIMITSxVT125)) return
 
   # output appropriate marker centered on location
 
   call drv125 (MOVE, x1, y1)   # move to lower left corner of character cell
 
   if (marker == MARKxPERIOD | marker == MARKxO) {
      call drv125 (DRAW, x2, y1)
      call drv125 (DRAW, x2, y2)
      call drv125 (DRAW, x1, y2)
      call drv125 (DRAW, x1, y1)
      }
   else {
      if (marker == MARKxX | marker == MARKxSTAR) {
         call drv125 (DRAW, x2, y2)
         call drv125 (MOVE, x2, y1)
         call drv125 (DRAW, x1, y2)
         }
      if (marker == MARKxPLUS | marker == MARKxSTAR) {
         itemp = y1 + hsize
         call drv125 (MOVE, x1, itemp)
         call drv125 (DRAW, x2, itemp)
         itemp = x1 + hsize
         call drv125 (MOVE, itemp, y1)
         call drv125 (DRAW, itemp, y2)
         }
      }
   call drv125 (MOVE, xcoord, ycoord) # Return the cursor position to the 
                                      #    original value
   return
end
subroutine drv125 (opcode, xcoord, ycoord)
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
#     Function: Device driver move/draw for VT125                      #
#                                                                      #
#     Input Parameters:                                                #
#           opcode - driver function, either move/draw                 #
#                    1 = move, 2 = draw                                #
#                                                                      #
#           xcoord, ycoord - coordinates of point to move/draw to      # 
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - put a character string to a device               #
#            gdevot - put a character to a device                      #
#            gitoch  - convert an integer into a string of characters  #
#                                                                      #
########################################################################
 
integer opcode, xcoord, ycoord
 
integer length, drawcd(3), iconvt(3), ierr, gitoch
 
data drawcd /BIGV, LBRACK, RBRACK/
 
if (opcode == DRAW) call gdstot (3, drawcd)
else                call gdevot (BIGP)
 
call gdevot (LBRACK)
length = gitoch (xcoord,iconvt,3,ierr)
call gdstot (length,iconvt)
call gdevot (COMMA)
length = gitoch (YxLIMITSxVT125-ycoord,iconvt,3,ierr)
call gdstot (length,iconvt)
call gdevot (RBRACK)
 
return
end
subroutine dcv125 (color)
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
#     Function: Change the color on the VT125 terminal                 #
#                                                                      #
#     Input Parameters:                                                #
#            color - color to change to                                #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - output a string to the current device            #
#                                                                      #
########################################################################
 
integer color
integer fcolor(5)
 
include(ddcom) 
 
#    Set the foreground color - W(I<index>)
data fcolor / BIGW, LPAREN, BIGI, DIG1, RPAREN/
 
if (ndclrp != color) {             # change color if necesary
   ndclrp = color                  # Set the current color
 
   fcolor(4) = color + DIG0
   call gdstot (5, fcolor)
   }
 
return
end
subroutine dlv125 (kltype)
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
#     Function: Change the line type on the VT125 terminal             #
#                                                                      #
#     Input Parameters:                                                #
#            kltype - line type to change to                           #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gdstot - output a string to the current device            #
#                                                                      #
########################################################################
 
integer kltype
integer lstyle(5)
 
include(ddcom) 
 
#            Line style    W(P<style>)
data lstyle /BIGW, LPAREN, BIGP, DIG1, RPAREN/
 
lstyle(4) = kltype
call gdstot (5, lstyle)
 
return
end
E 1
