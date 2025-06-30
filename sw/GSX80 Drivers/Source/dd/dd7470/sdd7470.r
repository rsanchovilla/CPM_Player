h04166
s 00846/00000/00000
d D 1.1 83/03/15 21:11:54 tes 1 0
c date and time created 83/03/15 21:11:54 by tes
e
u
4
U
t
T
I 1
subroutine dd7470 (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device Driver for Hewlett Packard 7470 pen plotter     #
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
#             Dbufhp - buffered output for HP plotter                  #
#             Gznfpl - prompt the user for a new sheet of paper        #
#             Dr7470 - move/draw for HP plotter                        #
#             Dp7470 - Change pens on the HP 7470 plotter              #
#             Dt7470 - Set text size on HP 7470 plotter                #
#             Gitoch  - convert integer to characters                  #
#             Gchtoi  - convert character string to integer            #
#             Muldiv - multiply 2 16-bit numbers and divide by the     #
#                      third 16-bit number                             #
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
define(`XxLIMITSxHP7470',10300)            #plotter surface width
define(`YxLIMITSxHP7470',7650)             #plotter surface height
define(`MAXxHPxBUFFER',80)
define(`NUMBERxOFxPENS',2)                 # 2 pens
define(`MOVE',1)
define(`DRAW',2)
define(`YES',1)
define(`NO',0)
define(`UNSUCCESSFUL',0)                   # Unsuccessful GIN operation
define(`SUCCESSFUL',1)                     # Unsuccessful GIN operation
define(`DEFAULT',1)                        # Default GIN device number
define(`PLOTTER',6)                        # Plotter device number for GIN
divert
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
SHORTINT opcode
integer i, j, gimnmx, ierror, ival, istop, setup(18), stopgr(3),
	rotate(2), txtout(2), setfnt(7), mrkout(4), lstyle(6), 
	mrktbl(5), solid(3), gogin(4), inqsta(4), getgin(4), tries,
	ginok, icnvt(6), endtxt(1), semcol(1), comma(1), ibuf(18)

integer xcoord, ycoord, xy(2), savex, savey, savexy(2)
integer gitoch, length, muldiv, divid, mult
integer x1, y1, x2, y2
 
integer temp, home(2), hlfsiz, fulsiz
 
integer pens(2), clrred(2), clrgrn(2), clrblu(2)
 
integer iniino(45),inipto(12)

include(ddcom)
 
common /cm7470/ pens, clrred, clrgrn, clrblu
 
equivalence (xcoord , xy(1)) , (ycoord , xy(2))
equivalence (savex , savexy(1)) , (savey , savexy(2))

#            Set label(text) font  /CS<font>SS;;/
data setfnt /BIGC, BIGS, DIG0, SEMICOL, BIGS, BIGS, SEMICOL/
 
#            Set rotation /DI/
data rotate /BIGD, BIGI/
 
#            Text output set up /LB/
data txtout /BIGL, BIGB/
 
#            Marker size, output /SM<0>;/
data mrkout / BIGS, BIGM, DIG0, SEMICOL/
 
#            Set line style to solid /LT;/
data solid  /BIGL, BIGT, SEMICOL/

#            Line style /LT<0>,2;/
data lstyle /BIGL, BIGT, DIG0, COMMA, DIG2, SEMICOL/
#
#            Set up -
#		Turn plotter on  <ESC>.(
#		Set handshake mode 2        <ESC>.I80;5;6:
#               Initialize the plotter:      IN;
data setup  /ESC, PERIOD, LPAREN,
             ESC,PERIOD,BIGI,DIG8,DIG0,SEMICOL,DIG5,SEMICOL,DIG6,COLON,
             BIGI, BIGN, SEMICOL, ENQ, NEWLINE/
 
#            Stop graphics - /<ESC>.)/
data stopgr /ESC, PERIOD, RPAREN/
 
data mrktbl/ PERIOD, PLUS, STAR, BIGO, BIGX/
 
data gogin / BIGD, BIGP, SEMICOL, NEWLINE/
 
data inqsta / BIGO, BIGS, SEMICOL, NEWLINE/
 
data getgin / BIGO, BIGD, SEMICOL, NEWLINE/
 
data comma /COMMA/
 
data endtxt /ETX/
 
data semcol /SEMICOL/

data home /0, 0/
 
data iniino/_			# initial intout array for open workstation
   XxLIMITSxHP7470,# Maximum addressable screen width
   YxLIMITSxHP7470,# Maximum addressable screen height
   METERS,         # Device coordinates are meters
   25,             # Step size in micrometers on x axis
   25,             # Step size in micrometers on y axis
   0,              # Number of character heights (continuous)
   7,              # Number of line types
   1,              # Number of line widths
   5,              # Number of marker types
   0,              # Number of marker sizes (continuous)
   5,              # Number of text fonts
   0,              # Number of patterns
   0,              # Number of hatch styles
   2,              # Number of predefined colors
   0,              # Number of GDPs
   20*-1,	   # GDPs do not exist
   1,              # Device is capable of color
   1,              # Device is capable of text rotation
   0,              # Device is not capable of filled area
   0,              # Device is not capable of pixel operations
   0,              # Number of colors available (continuous
			       # pen colors)
   1,              # Number of locator devices available
   0,              # Number of valuator devices available
   0,              # Number of choice devices available
   0,              # Number of string devices available
   2/              # Workstation type (input/output)

data inipto/_	   # initial ptsout array for open workstation
   0,
   60,             # Minimum character height in DC space
			       # .15cm = 60 steps 
   0,
   eval(YxLIMITSxHP7470/2),    # Maximum character height in DC space
			       # 18 cm = 7200 steps 
   1,              # Minimum line width in DC space
   0,
   1,              # Maximum line width in DC space
   0,
   0,
   80,             # Minimum marker height in DC space
			       # .20cm = 80 steps 
   0,
   eval(YxLIMITSxHP7470/2)/    # Maximum marker height in DC space
			       # 18 cm = 7200 steps 

opcode=contrl(OPCODE)
contrl(3) = 0                  # Assume no vertices are being passed back

#
# opcode open workstation
#
if (opcode == OPENxWORKSTATION) {
 
   contrl(3) = 6               # Set to number of output vertices
   contrl(5) = 45              # Length of array intout

   # set up output capability array
   do i=1,45 {
      intout(i) = iniino(i)
      }
   do i=1,12 {
      ptsout(i) = inipto(i)
      }
   ndlntp = gimnmx (intin(2)-1, 0, 6) + DIG0 # Set current device line style
   ndclrl = max0 (intin(3), 0)           # Set current polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 5) ndmktp=3
   ndclrm = max0 (intin(5), 0)           # Set current polymarker color index
   temp = gimnmx (intin(6)-1, 0, 4)+DIG0 # Set current text font
   ndclrt = max0 (intin(7), 0)           # Set current text color index
   ndclrf = max0 (intin(10),0)           # Set current fill area color index
   ndmkht = 20                           # Set default marker height .2cm
   ndtxsz = 15                           # Set default character width .15 cm
   ndtysz = 15                           # Set default character height .15cm
   ndtxrt = 0                            # Set default rotation to 0 degrees

   ndclrp = -1                           # Set current device color
 
   pens(1) = 1                           # Station 1 holds index 1
   pens(2) = 2                           # Station 2 holds index 2
 
   clrred(1) = 0                         # Define color index 0 to black
   clrgrn(1) = 0
   clrblu(1) = 0
   clrred(2) = 1                         # Define color index 1 to white
   clrgrn(2) = 1
   clrblu(2) = 1

   # initialize plotter

   call gioini (11)          # Iniitalize i/o system for logical plotter device
   ndotkt = 0                # Initialize the plotter ouput counter. This
                             #    counter is used by the routine 'dbufhp'
   call gdstot (18, setup)   # Must use gdstot because block mode is set
                             # in initialization sequence.
   call gdevin (i)           # Get the ack back from the plotter

   if (ndlntp == DIG0) {     # Set line type to initial value 
      call dbufhp (3, solid) # Solid
      }
   else {                    # Dashed
      lstyle(3) = ndlntp
      call dbufhp (6, lstyle)
      }

   setfnt(3) = temp          # Set initial text font
   call dbufhp (7, setfnt) 
   call dt7470 (ndtxsz, ndtysz)  # Set initial text size

   }

#
#  opcode close workstation
#
else if (opcode == CLOSExWORKSTATION) {
   call dr7470 (MOVE, home)      #, your mother misses you
   call dbufhp (-1, stopgr)      # Dump buffer
   call dbufhp (3, stopgr)       # Terminate graphics
   call giostp                   # Close i/o system
   }

#
#  opcode clear workstation
#
else if (opcode == CLEARxWORKSTATION) {
   call dr7470 (MOVE, home)  # Home the plotter
   call dbufhp (-1, semcol)  # Dump buffer
   call gznfpl               # prompt user for new paper (new frame on plotter)
   ndclrp = -1               # Force plotter to pick up pen again
   }
 
#
#  opcode update workstation
#
else if (opcode == UPDATExWORKSTATION) {
   call dbufhp (-1, semcol)
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
 
   call dp7470 (ndclrl)                          # Change color to line color
   call dr7470 (MOVE, ptsin(1))                  # Move to first point
   j = 3
   for (i=2; i<=contrl(2); i=i+1) {              # Draw between subsequent pts
      call dr7470 (DRAW, ptsin(j))
      j = j + 2
      }
   j = j -2
   call dr7470 (MOVE, ptsin(j))    # Move to pick up the pen
   }
 
#
#  opcode polymarker
#
else if (opcode == POLYMARKER) {
 
   call dp7470 (ndclrm)                 # Change color if necessary
   call dr7470 (MOVE, ptsin(1))         # Move to center point
 
   call dt7470 (ndmkht, ndmkht)         # set marker size
   mrkout(3) = mrktbl(ndmktp)           # Get proper marker from table
   call dbufhp (4, mrkout)              # Enter marker mode

   #  Set sizes used for marker clipping
   fulsiz = mult (ndmkht, 4)           # 4 steps per .01 cm
   hlfsiz = mult (ndmkht, 2)

   j = 1
   for (i=1; i<=contrl(2); i=i+1) {       # Output marker at each point

      xcoord = ptsin(j)
      ycoord = ptsin(j+1)

      # Clip marker to device limits
      # Marker height is stored in .01 cm units. SInce there are 4 plotter
      # steps per .01 cm, multiply by 4 to get plotter coords

      fulsiz = mult (ndmkht, 4)           # 4 steps per .01 cm
      hlfsiz = mult (ndmkht, 2)
      x1 = xcoord - hlfsiz
      x2 = x1 + fulsiz
      y1 = ycoord - hlfsiz
      y2 = y1 + fulsiz
      if ((min0(x1,y1) >= 0) & (x2 <= XxLIMITSxHP7470) & _
	 (y2 <= YxLIMITSxHP7470)) {           # Marker fits on device
 
         call dr7470 (MOVE, ptsin(j))  # Move to center point and display
	 }
      j = j + 2                               # Increment ptr to coords
      }
 
   mrkout(3) = SEMICOL
   call dbufhp (3,mrkout)               # Exit marker mode

   # restore the user's text size
   call dt7470 (ndtxsz, ndtysz)
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
 
   call dp7470 (ndclrt)            # Change color to text color
   call dr7470 (MOVE, ptsin(1))    # Move to start point

   j = contrl(INTEGERxINxLENGTH)   # Get the string length
 
   call dbufhp (-1, endtxt)        # Force the buffer to be cleared
   call dbufhp (2, txtout)         # Text command
   for (i = 1; i <= j; i = i + 1) {  # Loop to keep buffer from overflowing
       call dbufhp (1, intin(i))
       }
   call dbufhp (1, endtxt)         # terminate string
   }
 
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   call dp7470 (ndclrf)                       # Change color to fill color
   call dr7470 (MOVE, ptsin(1))               # Move to first point

   call dbufhp (3, solid)                     # Set linetype to solid
   call dr7470 (MOVE, ptsin(1))               # Move to repostion pen

   j = 3
   for (i=2; i<=contrl(2); i=i+1) {  # draw between subsequent points
      call dr7470 (DRAW, ptsin(j))
      j = j + 2
      }
   call dr7470 (DRAW, ptsin(1))      # draw to first point to make sure
				     # polygon closed
   call dr7470 (MOVE, ptsin(1))      # Move to the point to pick the pen up

   if (ndlntp != DIG0) {             # restore line type if not solid
      lstyle(3) = ndlntp
      call dbufhp (6, lstyle)
      }
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {
   savex = ptsin(1)                           # Save boundary points
   savey = ptsin(2)
   x2 = ptsin(3)
   y2 = ptsin(4)

   call dp7470 (ndclrl)                       # Change color to line color
   call dr7470 (MOVE, savexy)                 # Move to first point

   call dbufhp (3, solid)                     # Set solid line type

   xcoord = x2                                # Draw boundary around area
   ycoord = savey
   call dr7470 (DRAW, xy)
   ycoord = y2
   call dr7470 (DRAW, xy)
   xcoord = savex
   call dr7470 (DRAW, xy)
   call dr7470 (DRAW, savexy)

   if (ndlntp != DIG0) {             # restore line type if not solid
      lstyle(3) = ndlntp
      call dbufhp (6, lstyle)
      }
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
 
   # The input parameters represent the text height of a character
   # cell excluding gap.  The 7470 plotter command for text size only requires
   # the character width and height itself and does its own inter-line
   # inter-character spacing.  The plotter sets the character cell width
   # to 1.5 * character width and the character cell height to 2 * character
   # height.

   # To avoid using real numbers we store the height and width in
   # .01 cm units with an implied decimal point two places to
   # the left (100 = 1 cm).  4 plotter steps = .01 cm

   # Make sure not too small >=.15cm and not too large
   ndtysz = gimnmx (ptsin(2), 60, inipto(4))
   ndtxsz = muldiv (ndtysz, 6, 10)           # Pick appropriate width w = .6 * h
   ndtxsz = max0 (ndtxsz, 60)                # Make sure not too small >=.15cm

   # Convert text width in dcs to .01 centimeters
   #   width = dc / (steps per .01 cm = 4) 

   ndtxsz = divid (ndtxsz, 4, i) 
 
   # Convert text height dcs to .01 centimeters
   #   height = dc / (steps per .01 cm = 4) 

   ndtysz = divid (ndtysz, 4, i)
   
   call dt7470 (ndtxsz, ndtysz)              # Set the text size

   contrl(3) = 2                             # One output coordinate pair
   savex = mult (ndtxsz, 4)
   savey = mult (ndtysz, 4)
   ptsout(1) = savex                        # Return width & height
   ptsout(2) = savey

   # cell width = 1.5 * char width
   # cell height = 2 * char heght
   ptsout(3) = muldiv (savex, 300, 200)
   ptsout(4) = mult (savey, 2)

   }
 
#
#  opcode set character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
      ndtxrt = intin(1)                # Device can rotate continuously

      call dbufhp (2,rotate)
      length = gitoch (intin(2), icnvt, 6, ierror)
      call dbufhp (length, icnvt)      # Output run
      call dbufhp (1, comma)
      length = gitoch (intin(3), icnvt, 6, ierror)
      call dbufhp (length,icnvt)       # Output rise
      call dbufhp (1,semcol)           # End that command
 
      intout(1) = ndtxrt               # Inform upper level of angle
      }

#
#  opcode set color
#
else if (opcode == SETxCOLORxREPRESENTATION) {
   # Save 2 color indices, 1 for each pen station.  The requested
   # value is the same as the realized value
   i = gimnmx (intin, 0, 1) + 1        # Get color index in range
   clrred(i) = intin(2)
   clrgrn(i) = intin(3)
   clrblu(i) = intin(4)
   }

#
#  opcode set line type
#
else if (opcode == SETxPOLYLINExLINETYPE) {
   ndlntp =  intin(1) 
   if (ndlntp < 1 | ndlntp > 7) ndlntp = 1
   intout(1) = ndlntp                      # Return linetype selected
   ndlntp = ndlntp - 1 + DIG0              # Map to device parameter
   if (ndlntp == DIG0) {                   # Line type solid
      call dbufhp(3, solid)
      }
   else {                                  # Line type not solid
      lstyle(3) = ndlntp
      call dbufhp(6, lstyle)
      }
   }
 
#
#  opcode polyline color index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX)  {
   ndclrl = max0 ( 0, intin(1))
   intout(1) = ndclrl                       # Return color index selected
   }
 
#
#  opcode set marker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3  # Marker type 3 is default
   intout(1) = ndmktp                       # Return type selected
   }

#
#  opcode polymarker scale
#
else if (opcode == SETxPOLYMARKERxSCALE) {
   ndmkht = gimnmx (ptsin(2), 60, inipto(12)) # Make sure size not too
						   # small or too large
   contrl(3) = 1                                   # Return 1 coordinate pair
   ptsout(1) = 0
   ptsout(2) = ndmkht                              # Return size selected

   # convert height in dcs to .01 centimeters
   #  height = dc / (steps per .01 cm = 4)

   ndmkht = divid (ndmkht, 4, i)

   }

#
#  opcode polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX)  {
   ndclrm = max0 ( 0, intin(1))
   intout(1) = ndclrm                       # Return color index selected
   }
 
#
#  opcode set text font
#
else if (opcode == SETxTEXTxFONT) {
      i = gimnmx (intin(1), 1, 5)
      setfnt(3) = i - 1 + DIG0      # Font in range 0 to 4
      call dbufhp (7, setfnt)       # Output command
 
      intout(1) = i                 # Return actual font selected
      }
 
#
#  opcode text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX)  {
   ndclrt = max0 ( 0, intin(1))
   intout(1) = ndclrt               # Return color index selected
   }
 
#
#  opcode set fill color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
   ndclrf = max0 (0, intin(1))
   intout(1) = ndclrf               # Return color index selected
   }
 
#
#  opcode inquire color representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   i = gimnmx (intin(1), 0, 1) +1   # Map index 0-1 to 1-2
   intout(1) = i - 1                # Color index selected
   intout(2) = clrred(i)            # Set values are same as realized
   intout(3) = clrgrn(i)
   intout(4) = clrblu(i)
   }

#
#  opcode input locator  
#
else if (opcode == INPUTxLOCATOR) {

   ptsout(1) = 0
   ptsout(2) = 0
   contrl(5) = UNSUCCESSFUL
   i = intin(1)                        # check input device number
   if (i != DEFAULT & i != PLOTTER) return
   call dr7470 (MOVE, ptsin(1))        # move to initial point

   tries = 0
   call dbufhp (-1, gogin)   # First flush the buffer
   repeat {    # Try three times for good point
      ginok = YES
      call gdstot (4, gogin)            # Arm to do a point input
      repeat {                          # Go until the key was pressed
         call gdstot (4, inqsta)        # Ask for a status byte
         call gdstin (5, ibuf,  temp)   # Get the answer
         call gchtoi (ibuf, 1, ival, istop)
	 i = divid (ival, 8, j)         # j=mod(ival,8)
	 if (j >= 4) break              # the third bit was on
         }
         call gdstot (4, getgin)        # Ask for the gin report
         call gdstin (18, ibuf,  temp)  # Get the gin report
         tries = tries + 1
         } until (ginok == YES | tries >= 3)
 
   if (ginok == YES)  {                            # Parse the gin report
      contrl(5) = SUCCESSFUL                       # Request was successful
      contrl(3) = 1                                # Output 1 coordinate pair
      call gchtoi (ibuf, 1, ptsout(1), istop)
      call gchtoi (ibuf, istop+1, ptsout(2), istop)
      intout(1) = ibuf(istop+1) + DIG0             # Return 0 or 1 (pen up/down)
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
subroutine dr7470 (opcode, xy)
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
#     Function: Device Driver move/draw for HP7470                     #
#                                                                      #
#     Input Parameters:                                                #
#           opcode - driver function, either move/draw                 #
#           xy     - coordinates to move or draw to                    #
#                    xy (1) = x-coordinate                             #
#                    xy (2) = y-coordinate                             #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            dbufhp - output a string to the HP7470 plotter            #
#            gitoch - convert integer to character string              #
#                                                                      #
########################################################################
 
integer opcode, xy(1)
 
integer length, movdrw(5), semcol(1), comma(1), iconvt(5), ierror, gitoch
 
data movdrw /BIGP, BIGU, SEMICOL, BIGP, BIGA/
data semcol /SEMICOL/
data comma /COMMA/
 
   movdrw(2) = BIGU                        # Always prepare to do a move
   if (opcode == DRAW) movdrw(2) = BIGD    # Change it for a draw
   call dbufhp (5, movdrw)
   length = gitoch (xy(1),iconvt,5,ierror)
   call dbufhp (length,iconvt)
   call dbufhp (1,comma)
   length = gitoch (xy(2),iconvt,5,ierror)
   call dbufhp (length,iconvt)
   call dbufhp (1,semcol)
   return
end
subroutine dt7470 (wid, hgt)
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
#     Function: Set text size on HP 7470 plotter                       #
#                                                                      #
#     Input Parameters:                                                #
#            wid   - width of character in .01 cm units (1cm =100units)#
#            hgt   - height of character in .01 cm units (1cm=100units)#
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gitoch  - convert integer to character string             #
#            divid  - divide 2 unsigned 16-bit numbers                 #
#            dbufhp - output a command to a hp plotter                 #
########################################################################
 
integer wid, hgt
integer comma(1), period(1), semcol(1), icnvt(6), i, j, ierror, length
integer txtsiz(2), zero(1), divid, gitoch
 
#            Set label(text) size  /SI/
data txtsiz /BIGS, BIGI/
 
data comma /COMMA/
data period /PERIOD/
data semcol /SEMICOL/
data zero /DIG0/
   

   call dbufhp (2, txtsiz)    # Put out text size command
 
   # To avoid using real numbers we store the height and width in
   # .01 cm units with an implied decimal point two places to
   # the left (100 = 1 cm).  4 plotter steps = .01 cm

   i = divid (wid , 100, j)                  # Get whole number of centimeters
                                             # and remainder  j=mod(wid,100)
   length = gitoch (i, icnvt, 6, ierror)     # Output whole # of centimeters
   call dbufhp (length, icnvt)
   call dbufhp (1, period)
   if (j < 10) call dbufhp (1, zero)         # Output tenths digit if 0
   length = gitoch (j, icnvt, 6, ierror)     # Output fractional centimeters
   call dbufhp (length, icnvt)
   call dbufhp (1,comma)
 
   i = divid (hgt, 100, j)                   # Get whole # of centimeters
					     # and remainder j=mod(hgt,100)
   length = gitoch (i, icnvt, 6, ierror)     # Output whole # of centimeters
   call dbufhp (length, icnvt)
   call dbufhp (1, period)
   if (j < 10) call dbufhp (1, zero)         # Output tenths digit if 0
   length = gitoch (j, icnvt, 6, ierror)     # Output fractional centimeters
   call dbufhp (length, icnvt)
   call dbufhp (1,semcol)

   return
end
subroutine dp7470 (color)
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
#     Function: Change the color on the H P 7470 plotter               #
#                                                                      #
#     Input Parameters:                                                #
#            color - color to change to                                #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            gznppl - prompt for new pen on plotter                    #
#            dbufhp - output a command to a hp plotter                 #
########################################################################
 
integer color
integer penclr(4), newsta
integer pens(2), clrred(2), clrgrn(2), clrblu(2)
 
include(ddcom)

common /cm7470/ pens, clrred, clrgrn, clrblu
 
#    Change pens
data penclr / BIGS, BIGP, DIG0, SEMICOL/  #  SP0;
 
if (ndclrp != color) {
   # prompt for new pen on plotter if necessary
   call gznppl (color, NUMBERxOFxPENS, pens, newsta)
 
   ndclrp = color    # Set the current color
 
   penclr(3) = newsta + DIG0  # Load this pen station
   call dbufhp (4, penclr)
   }
return
end
subroutine dbufhp (icount, iarray)
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
#     Function: HP7470 buffered output handler                         #
#                                                                      #
#     Input Parameters:                                                #
#           icount - number of characters in iarray to be output       #
#                    -1 flushes the buffer                             #
#                                                                      #
#           iarray - Array of characters to be output                  #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            gdevin - get a character from the graphics device         #
#            gdevot - output a character to the device                 #
#            gdstot - output a string to the device                    #
#                                                                      #
########################################################################
 
integer icount, iarray(1)
 
integer c, k
 
include(ddcom) 
 
   k = icount
   if (k < 0) k = 0
   if ((ndotkt+k) > MAXxHPxBUFFER | icount < 0) {
      call gdevot (ENQ)         # Output buffer terminating character
      call gdevot (NEWLINE)     # Output the current buffer
      ndotkt = 0                # Reset the plotter buffer counter
 
      # Wait for prompt response from device. The prompt in most cases is
      #    the ack (6) character.
 
      repeat { call gdevin (c) } until (c == NEWLINE | c == ACK)
      }
   call gdstot (k, iarray)
   ndotkt = ndotkt + k          # Update the plotter buffer counter
   return
end
E 1
