h06419
s 00744/00000/00000
d D 1.1 83/03/17 15:31:15 tes 1 0
c date and time created 83/03/17 15:31:15 by tes
e
u
4
U
t
T
I 1
subroutine ddstrb (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device Driver for Strobe pen plotter                   #
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
#             Gznppl - prompt for pen change                           #
#             Dbufst - buffered output for Strobe plotter              #
#             Dastrb - Emulate dashed lines for the Strobe             #
#             Drstrb - move/draw for Strobe plotter                    #
#             Gitoch  - convert integer to characters                  #
#             Divid  - divide 2 unsigned 16-bit numbers                #
#             Mult   - multiply 2 16-bit numbers                       #
#             Gimnmx - Function to place integer value in a range      #
#             Gioini - initialize the input/output system              #
#             Giostp - terminate input/output                          #
#             Gdevin - Put a character to the graphic device           #
#             Gdstot - Put a character string to the graphic device    #
#                                                                      #
########################################################################
# local defines
define(`XxLIMITSxSTROBE',5079)             # plotter surface width
define(`YxLIMITSxSTROBE',3899)             # plotter surface height
define(`MAXxSTROBExBUFFER',80)             # plotter buffer size
define(`NUMBERxOFxPENS',`1')               # one pen plotter
define(`MOVE',1)
define(`DRAW',2)
define(`METERS',1)                         # Device capable of precise scaling
					   #  in meters
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1)
 
integer opcode, i, j, k, gimnmx, ierror, factor, newpen, pens(1),
        setup(34), stopgr(3), rotate(4), rotang(5), length, txtout(2), 
	txtsiz(2), mrkout(4), endtxt(1), semcol(1), ibuf(4),
	iniary(45), ptsary(12), temp
integer gitoch, divid, mult
integer x1, y1, x2, y2
integer hlfsiz, fulsiz
 
integer clrred(2), clrgrn(2), clrblu(2)
 
include(`ddcom')
 
common /cmstrb/ clrred, clrgrn, clrblu
 
#            Set rotation /DI0;/
data rotate /BIGD, BIGI, DIG0, SEMICOL/

#  Due to how the strobe rotates text, a table is used to look up the parameter
data rotang / 0, 1, 3, 2, 0/
 
#            Text output set up /LB/
data txtout /BIGL, BIGB/

#            Text/Marker size  /SI/
data txtsiz /BIGS, BIGI/
 
#            Marker output /SM<0>;/
data mrkout / BIGS, BIGM, DIG0, SEMICOL/
 
#            Set up -
#		Turn plotter on             <esc>.(
#		Set handshake mode 0        <esc>.H0
#               Set Output mode delay       <esc>.M0
#               Set default text attributes  DF;
#               Set the current position to be the origin  DO;
#               Set handshake mode 2        <esc> . H 2 <enq> <ack>
#               Move the pen to 0, 0        PU;PA0,0;
#               And force the first handshake   <enq> <newline>
data setup  /ESC, PERIOD, LPAREN,
             ESC, PERIOD, BIGH, DIG0,
	     ESC, PERIOD, BIGM, DIG0,
	     BIGD, BIGF, SEMICOL,
	     BIGD, BIGO, SEMICOL,
	     ESC, PERIOD, BIGH, DIG2, ENQ, ACK,
	     BIGP, BIGU, SEMICOL, BIGP, BIGA, DIG0, COMMA, DIG0, SEMICOL,
	     ENQ, NEWLINE/
 
#            Stop graphics - /<ESC>.)/
data stopgr /ESC, PERIOD, RPAREN/
 
data endtxt /ETX/
 
data semcol /SEMICOL/

data iniary /XxLIMITSxSTROBE,# Maximum addressable screen width
             YxLIMITSxSTROBE,# Maximum addressable screen height
             METERS,         # Device coordinates are meters
             50,             # X step size in micrometers
             50,             # Y step size is micrometers
             0,              # Number of character heights (continuous)
             5,              # Number of line types
             1,              # Number of line widths
             9,              # Number of marker types
             0,              # Number of marker sizes (continuous)
             1,              # Number of text fonts
             0,              # Number of patterns
             0,              # Number of hatch styles
             1,              # Number of predefined colors
             0,              # Number of GDPs
             20*-1,          # GDP attribute lists
             1,              # Device is capable of color
             1,              # Device is capable of text rotation
             0,              # Device is not capable of filled area
             0,              # Device is not capable of pixel operations
             0,              # Number of colors available (continuous
                             # pen colors)
             0,              # Number of locator devices available
             0,              # Number of valuator devices available
             0,              # Number of choice devices available
             0,              # Number of string devices available
             2/              # Workstation type (input/output)

data ptsary /0,
             7,              # Minimum character height in DC space
             0,
             YxLIMITSxSTROBE,# Maximum character height in DC space
             1,              # Minimum line width in DC space
             0,
             1,              # Maximum line width in DC space
             0,
             0,
             40,             # Minimum marker height in DC space
                             # .20cm = 40 steps 
             0,
             2228/           # Maximum marker height in DC space
	                     # 4/7*YxLIMITSxSTROBE
 
opcode = contrl(OPCODE)
contrl(3) = 0                  # Assume no vertices are being passed back

#
# opcode open workstation
#
if (opcode == OPENxWORKSTATION) {
   contrl(3) = 6               # Set to number of output vertices
   contrl(5) = 45              # Length of array intout

   # set up output capability arrays
 
   do i=1,45 { intout(i) = iniary(i) }

   do i=1,12 { ptsout(i) = ptsary(i) }

   i = intin(2) 
   if (i > 5) i = 5
   ndlntp = gimnmx (i, 0, 5)             # Set current device line style
   ndclrl = max0 (intin(3), 0)           # Set current polyline color index
   ndmktp = intin(4)                     # Set current marker type
   if (ndmktp < 1 | ndmktp > 5) ndmktp=3
   ndclrm = max0 (intin(5), 0)           # Set current polymarker color index
   ndclrt = max0 (intin(7), 0)           # Set current text color index
   ndclrf = max0 (intin(10),0)           # Set current fill area color index
   ndmkht = 40                           # Set default marker height .2cm
   ndtxsz = 4                            # Set default character width .15 cm
   ndtysz = 7                            # Set default character height .15cm
   ndtxrt = 0                            # Set default rotation to 0 degrees

   ndclrp = -1                           # Set current device color
 
   clrred(1) = 0                         # Define color index 0 to black
   clrgrn(1) = 0
   clrblu(1) = 0
   clrred(2) = 1                         # Define color index 1 to white
   clrgrn(2) = 1
   clrblu(2) = 1

   # initialize plotter

   call gioini (11)          # Iniitalize i/o system for logical plotter device
   ndotkt = 0                # Initialize the plotter output counter. This
                             #    counter is used by the routine 'dbufst'
   call gdstot (34, setup)   # Must use gdstot because block mode is set
                             # in initialization sequence.
   call gdevin (i)           # Get the ack back from the plotter
   }

#
#  opcode close workstation
#
else if (opcode == CLOSExWORKSTATION) {
   call drstrb (MOVE, 0, 0)      # Home the plotter
   call dbufst (-1, stopgr)      # Dump buffer
   call dbufst (3, stopgr)       # Terminate graphics
   call giostp                   # Close i/o system
   }

#
#  opcode clear workstation
#
else if (opcode == CLEARxWORKSTATION) {
   call drstrb (MOVE, 0, 0)  # Home the plotter
   call dbufst (-1, semcol)  # Dump buffer
   call gznfpl               # prompt user for new paper (new frame on plotter)
   }
 
#
#  opcode update workstation
#
else if (opcode == UPDATExWORKSTATION) {
   call dbufst (-1, semcol)
   }

#
#  opcode escape
#
else if (opcode == ESCAPE) {
   if (contrl(6) == INQUIRExADDRESSABLExCELLS) {
      intout(1) = -1        # No cursor addressable cells available
      intout(2) = -1
      }
   }

#
#  opcode polyline
#
else if (opcode == POLYLINE) {
   call drstrb (MOVE, ptsin(1), ptsin(2))       # Move to first point

   if (ndclrl != ndclrp)  {
      call gznppl (ndclrl, NUMBERxOFxPENS, pens, newpen)# Change to line color
      ndclrp = pens(1)
      }

   if (ndlntp != 1)  {   # Use a dash pattern
      call dastrb (contrl(2), ptsin)
      }
   else  {  # Just a solid polyline
      j = 3
      for (i=2; i<=contrl(2); i=i+1) {    # Draw between subsequent points
         call drstrb (DRAW, ptsin(j), ptsin(j+1))
         j = j + 2
         }
      }
   }
 
#
#  opcode polymarker
#
else if (opcode == POLYMARKER) {
   call drstrb (MOVE, ptsin(1), ptsin(2))  # Move to the first point
   if (ndclrm != ndclrp)  {
      call gznppl (ndclrm, NUMBERxOFxPENS, pens, newpen)# Change color 
      ndclrp = pens(1)
      }

   call dbufst (2, txtsiz)   # Set the marker character size
   length = gitoch (divid (ndmkht, 4, temp), ibuf, 4, ierror)
   call dbufst (length, ibuf)
   call dbufst (1, semcol)

   j = 1
   for (i=1; i<=contrl(2); i=i+1) {       # Output marker at each point
      fulsiz = ndmkht
      hlfsiz = divid (ndmkht, 2, temp)

      # Clip marker to device limits
      x1 = ptsin(j) - hlfsiz
      x2 = x1 + fulsiz
      y1 = ptsin(j+1) - hlfsiz
      y2 = y1 + fulsiz
      if ((min0(x1,y1) >= 0) & (x2 <= XxLIMITSxSTROBE) & _
	 (y2 <= YxLIMITSxSTROBE)) {           # Marker fits on device
 
            call drstrb (MOVE, ptsin(j), ptsin(j+1)) # Move to center point
	    mrkout(3) = ndmktp
            call dbufst (4, mrkout)     # Display the marker
	    }
      j = j + 2                               # Increment ptr to coords
      }
   }
 
#
#  opcode text
#
else if (opcode == TEXT) {
   call drstrb (MOVE, ptsin(1), ptsin(2))    # Move to start point
 
   if (ndclrt != ndclrp ) {
      call gznppl (ndclrt, NUMBERxOFxPENS, pens, newpen)# Change to text color
      ndclrp = pens(1)
      }

   call dbufst (2, txtsiz)   # Set the character size
   length = gitoch (divid(ndtysz,7,k), ibuf, 4, ierror)
   call dbufst (length, ibuf)
   call dbufst (1, semcol)

   j = contrl(INTEGERxINxLENGTH)   # Get the string length
 
   call dbufst (2, txtout)         # Text command
   for (i = 1; i <= j; i = i + 1) {  # Loop to keep buffer from overflowing
       temp = intin(i)
       if (temp > ACCENT & temp < LBRACE) {
	  temp = temp - SPACE      # Lower case to upper case letters
	  }
       call dbufst (1, temp)
       }
   call dbufst (1, endtxt)         # terminate string
   }
 
#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   call drstrb (MOVE, ptsin(1), ptsin(2))   # Move to first point

   if (ndclrf != ndclrp)  {
      call gznppl (ndclrf, NUMBERxOFxPENS, pens, newpen)# Change to fill color
      ndclrp = pens(1)
      }

   j = 3
   for (i=2; i<=contrl(2); i=i+1) {  # draw between subsequent points
      call drstrb (DRAW, ptsin(j), ptsin(j+1))
      j = j + 2
      }
   call drstrb (DRAW, ptsin(1), ptsin(2)) # draw to first point to make sure
					  # polygon closed
   call drstrb (MOVE, ptsin(1), ptsin(2)) # Move to the point to pick up the pen
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {
   x1 = ptsin(1)                           # Save boundary points
   y1 = ptsin(2)
   x2 = ptsin(3)
   y2 = ptsin(4)
   call drstrb (MOVE, x1, y1)                 # Move to first point

   if (ndclrl != ndclrp) {
      call gznppl (ndclrl, NUMBERxOFxPENS, pens, newpen)# Change to line color
      ndclrp = pens(1)
      }

   call drstrb (DRAW, x2, y1)                # Draw boundary around area
   call drstrb (DRAW, x2, y2)
   call drstrb (DRAW, x1, y2)
   call drstrb (DRAW, x1, y1)
   call drstrb (MOVE, x1, y1)  #  Move to the first point to pick up the pen
   }

#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
   ndtysz = gimnmx (ptsin(2), 7, YxLIMITSxSTROBE)
   factor = divid (ndtysz, 7, i)   # All sizes are based on this scale factor
   contrl(3) = 2                   # Two vertices returned
   ndtxsz = mult (factor, 4)
   ptsout(1) = ndtxsz              # Character width
   ptsout(2) = mult (factor, 7)    # Character height
   ptsout(3) = mult (factor, 6)    # Character cell width
   ptsout(4) = mult (factor, 9)    # Character cell height
   }
 
#
#  opcode set character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
      ndtxrt = divid (intin(1)+450, 900, i)  # Device rotates in 90 degree incs
      rotate(3) = rotang(ndtxrt+1) + DIG0 # Determine which angle from table
      call dbufst (4, rotate)

      intout(1) = mult(ndtxrt, 900) # Return the chosen angle
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
   if (ndlntp < 1 | ndlntp > 5) ndlntp = 1
   intout(1) = ndlntp                      # Return linetype selected
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
   if (ndmktp < 1 | ndmktp > 9) ndmktp = 3  # Marker type 3 is default
   intout(1) = ndmktp                       # Return type selected
   ndmktp = ndmktp + 47  # Use slash to put into (0-8) range
   }

#
#  opcode polymarker scale
#
else if (opcode == SETxPOLYMARKERxSCALE) {
   ndmkht = gimnmx (ptsin(2), 40, YxLIMITSxSTROBE) # Make sure size not too
						   # small or too large
   contrl(3) = 1                                   # Return 1 coordinate pair
   ptsout(1) = 0
   ptsout(2) = ndmkht                              # Return size selected
   }

#
#  opcode polymarker color index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX)  {
   ndclrm = max0 (0, intin(1))
   intout(1) = ndclrm               # Return color index selected
   }
 
#
#  opcode text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX)  {
   ndclrt = max0 (0, intin(1))
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

   return
end
subroutine dastrb (count, pline)
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
#     Function: Device driver dash emulation for the strobe 100        #
#                                                                      #
#     Input Parameters:                                                #
#            count   -   number of vertices in array pline             #
#            pline   -   start/end points of dash polylines            #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#             drstrb - do a move/draw on the strobe                    #
#                                                                      #
########################################################################
#local defines
define(`DASH_INCREMENT',`30')
define(`MOVE',`1')
define(`DRAW',`2')
 
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
	          call drstrb (MOVE, oldy, oldx)
	          call drstrb (DRAW, newy, newx)
		  }
	       else {
	          call drstrb (MOVE, oldx, oldy)
	          call drstrb (DRAW, newx, newy)
		  }
	       }
	    else {  # Draw a dot
	       if (qchang) {
	          call drstrb (MOVE, newy, newx)  
	          call drstrb (DRAW, newy, newx)  
	          }     			 
	       else {
	          call drstrb (MOVE, newx, newy) 
	          call drstrb (DRAW, newx, newy) 
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
	    call drstrb (MOVE, oldx, oldy)
	    if (xincr == -1)   { call drstrb (DRAW, startx, starty) }
	    else               { call drstrb (DRAW, endx, endy) }
	    }
	 call drstrb (MOVE, endx, endy)
	 l = l + 2          # Increment index for next vector
	 oldx = endx        # Next vector starts where previous one left off
	 oldy = endy
	 startx = oldx
	 starty = oldy
      } # End of all polylines

   return
end
subroutine drstrb (opcode, x, y)
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
#     Function: Device Driver move/draw for STROBE                     #
#                                                                      #
#     Input Parameters:                                                #
#           opcode - driver function, either move/draw                 #
#           x, y   - coordinates to move or draw to                    #
#                                                                      #
#     Output Parameters: none                                          #
#                                                                      #
#     Routines Called:                                                 #
#            dbufst - output a string to the STROBE plotter            #
#            gitoch - convert integer to character string              #
#                                                                      #
########################################################################
integer opcode, x, y
 
integer length, movdrw(5), semcol(1), comma(1), iconvt(4), ierror, gitoch
 
data movdrw /BIGP, BIGU, SEMICOL, BIGP, BIGA/
data semcol /SEMICOL/
data comma /COMMA/
 
   movdrw(2) = BIGU                        # Always prepare to do a move
   if (opcode == DRAW) movdrw(2) = BIGD    # Change it for a draw
   call dbufst (5, movdrw)
   length = gitoch (x,iconvt,4,ierror)
   call dbufst (length,iconvt)
   call dbufst (1,comma)
   length = gitoch (y,iconvt,4,ierror)
   call dbufst (length,iconvt)
   call dbufst (1,semcol)
   return
end
subroutine dbufst (icount, iarray)
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
#     Function: STROBE buffered output handler                         #
#                                                                      #
#     Input Parameters:                                                #
#           icount - number of characters in iarray to be output       #
#                    -1 flushes the buffer                             #
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
 
include(`ddcom') 
 
   k = icount
   if (k < 0) k = 0
   if ((ndotkt+k) > MAXxSTROBExBUFFER | icount < 0) {
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
