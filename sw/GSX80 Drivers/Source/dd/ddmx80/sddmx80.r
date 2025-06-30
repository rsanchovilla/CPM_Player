h33604
s 00000/00070/00806
d D 1.2 83/03/21 17:27:41 mrk 2 1
c removed fortran setbitter, put it into setbit.mx80
e
s 00876/00000/00000
d D 1.1 83/03/15 21:26:38 tes 1 0
c date and time created 83/03/15 21:26:38 by tes
e
u
4
U
t
T
I 1
subroutine ddmx80 (contrl, intin, ptsin, intout, ptsout)
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
#     Function: Device Driver for the Epson MX-80 Printer              #
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
#             muldiv - multiply 2 16-bit numbers and divide by the     #
#                      third 16-bit number                             #
#             divid  - divide 2 unsigned 16-bit numbers                #
#             mult   - multiply 2 16-bit numbers                       #
#             gimnmx - Function to place integer value in a range      #
#             prtout - Put a byte to the printer device                #
#             prstot - Put a byte array to the printer device          #
#             outint - Put two byte integers into the object list      #
#             outxy  - Put an x-y pair into the object list            #
#             closfl - Close the open object list file                 #
#             writrc - Write a record out to the object list file      #
########################################################################
divert(-1)
# local defines
define(`XxLIMITSxPRINTER',479)              #printer surface width
define(`YxLIMITSxPRINTER',479)              #printer surface height
define(`NUMBERxOFxCOLORS',1)                # colors available + index 0
define(`NUMBERxOFxROWS',4)
define(`PRINTxSIZE',7)
define(`RASTERxBUFFER',480)
define(`RASTERxLENGTH',eval(4*480))
define(`SCANxWIDTH',eval(4*7))
define(`DISPLAYxLISTxLENGTH',512)
define(`MOVE',1)
define(`DRAW',2)
define(`ENDCASE',100)                 # Label to end case statement
define(`MAXxFILLS',6)                 # Maximum number of fill patterns allowed
define(`HOLLOW',0)                    # Different fill styles
define(`SOLID',1)
define(`PATTERN',2)
divert
 
integer contrl(1),intin(1),intout(1),ptsin(1),ptsout(1), itemp1, itemp2
integer i, j, k, gimnmx, divid, mult, iout1(45), iout2(12)
SHORTINT setup(3), endgrf(3)

integer clrred(2), clrgrn(2), clrblu(2) 
integer opcode
 
integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

common /clrprt/ clrred, clrgrn, clrblu

data setup /ESC, BIGA, BELL/  #Initialize, Set LF to 7 pixels

data endgrf /ESC, BIGA, FF/  # Return printer to default print width

data iout1/XxLIMITSxPRINTER,    # Maximum addressable width of printer
	   YxLIMITSxPRINTER,    # Maximum addressable length of printer (square)
	   OTHER,               # Device not capable of precisely scaled image
	   353,                 # Width of one pixel in micrometers
	   296,                 # Height of one pixel in micrometers
	   12,                  # Number of character sizes
	   5,                   # Number of line types
	   1,                   # Number of line widths
	   5,                   # Number of marker types
	   1,                   # Number of marker sizes
	   1,                   # Number of fonts
	   MAXxFILLS,           # Number of patterns
	   0,                   # Number of hatch styles
	   2,                   # Number of predefined colors
	   1,                   # Number of GDP's available
	   1,                   # The device has bars
	   9*-1,                # And a bunch it does not have
           3,                   # Bars use the attributes of filled areas
	   9*-1,                # No attributes for GDP's that do not exist
	   NO,                  # Color capability flag
	   YES,                 # Text rotation capability flag
	   YES,                 # Filled area capability flag
	   NO,                  # Pixel operation capability flag
	   2,                   # Number of available colors, monochrome
	   0,                   # Number of locator devices available
	   0,                   # Number of valuator devices available
	   0,                   # Number of choice devices available
	   0,                   # Number of string devices available
	   0/                   # Workstation is output only

data iout2 / 0, 8,              # Minimum character height in device units
	     0, 96,             # Maximum character height in device units
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
       SETxCOLORxREPRESENTATION, SETxPOLYLINExLINETYPE, SETxPOLYLINExLINExWIDTH,
       SETxPOLYLINExCOLORxINDEX, SETxPOLYMARKERxTYPE, SETxPOLYMARKERxSCALE,
       SETxPOLYMARKERxCOLORxINDEX, SETxTEXTxFONT, SETxTEXTxCOLORxINDEX,
       SETxFILLxINTERIORxSTYLE, SETxFILLxSTYLExINDEX,
       SETxFILLxCOLORxINDEX, INQUIRExCOLORxREPRESENTATION), opcode

go to ENDCASE

#
# opcode open workstation
#
OPENxWORKSTATION  continue
 
   dispnt = 1  # Initialize display list pointer
   pagcnt = 0  # No pages have been spooled to disk
   primfg = NO   # No primitives have been output yet

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
   ndflpt = 1                         # Set default fill pattern
   ndfstl = HOLLOW                    # Set default fill type
   ndtxsz = 1                         # Set default character height to 8 units
   ndtxrt = 0                         # Set default rotation to 0 degrees

   # Put the default attributes into the display list
   call outint (SETxCHARACTERxHEIGHT, ndtxsz)
   call outint (SETxCHARACTERxUPxVECTOR, ndtxrt)
   call outint (SETxPOLYLINExLINETYPE, ndlntp)
   call outint (SETxPOLYLINExCOLORxINDEX, ndclrl)
   call outint (SETxPOLYMARKERxTYPE, ndmktp)
   call outint (SETxPOLYMARKERxCOLORxINDEX, ndclrm)
   call outint (SETxTEXTxCOLORxINDEX, ndclrt)
   call outint (SETxFILLxINTERIORxSTYLE, ndfstl)
   call outint (SETxFILLxSTYLExINDEX, ndflpt)
   call outint (SETxFILLxCOLORxINDEX, ndclrf)

   do i = 1, 2  {
      itemp1 = mult(i-1, 1000)
      clrred(i) = itemp1  # Define color index 0 to black, index 1 to white
      clrgrn(i) = itemp1
      clrblu(i) = itemp1
      }

   # initialize printer
   call prstot (3, setup)
   go to ENDCASE

#
#  opcode close workstation
#
CLOSExWORKSTATION  continue
   if (pagcnt > 0)   {  # Disk spooling was used
      call writrc (DISPLAYxLISTxLENGTH, objlst)  # Put out entire buffer
      call closfl   # And close the file
      }
   call makras
   call prstot (3, endgrf)
   go to ENDCASE

#
#  opcode clear workstation
#
CLEARxWORKSTATION  continue
   if (primfg == YES)  {
      if (pagcnt > 0)   {  # Disk spooling was used
	 call writrc (DISPLAYxLISTxLENGTH, objlst)  # Put out entire buffer
	 call closfl   # And close the file
	 }
      call makras
      }
   primfg = NO   # No more primitives in object list
   dispnt = 1  # Point to the next available position
   pagcnt = 0  # Set so can reuse the file
   call prtout (FF)

   # Put the current attributes into the object list
   call outint (SETxCHARACTERxHEIGHT, ndtxsz)
   call outint (SETxCHARACTERxUPxVECTOR, ndtxrt)
   call outint (SETxPOLYLINExLINETYPE, ndlntp)
   call outint (SETxPOLYLINExCOLORxINDEX, ndclrl)
   call outint (SETxPOLYMARKERxTYPE, ndmktp)
   call outint (SETxPOLYMARKERxCOLORxINDEX, ndclrm)
   call outint (SETxTEXTxCOLORxINDEX, ndclrt)
   call outint (SETxFILLxINTERIORxSTYLE, ndfstl)
   call outint (SETxFILLxSTYLExINDEX, ndflpt)
   call outint (SETxFILLxCOLORxINDEX, ndclrf)

   go to ENDCASE
 
#
#  opcode update workstation
#
UPDATExWORKSTATION  continue
   if (primfg == YES)  {
      if (pagcnt > 0)   {  # Disk spooling was used
	 call writrc (DISPLAYxLISTxLENGTH, objlst)  # Put out entire buffer
	 call closfl   # And close the file
	 }
      call makras
      }
   call prtout (FF)
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
 
   k = contrl(2)
   call outint (POLYLINE, k)   # Output the opcode and the count

   j = 1
   for (i=1; i<=k; i=i+1) {
      call outxy (ptsin(j))
      j = j + 2
      }
   primfg = YES
   go to ENDCASE
 
#
#  opcode polymarker
#
POLYMARKER  continue
 
   k = contrl(2)
   call outint (POLYMARKER, k)   # Output opcode and marker count

   j = 1
   for (i=1; i<=k; i=i+1) {
      call outxy (ptsin(j))  # Output the marker
      j = j + 2                               # Increment ptr to coords
      }
   primfg = YES
   go to ENDCASE
 
#
#  opcode text
#
TEXT  continue

   k = contrl(INTEGERxINxLENGTH)   # Get the string length
   call outint (TEXT, k)
   call outxy (ptsin(1))    # Move to start point
   
   for (i=1; i<=k; i=i+2)   {   # Put out the characters
      itemp1 = intin(i)
      if (i+1 > k)  itemp2 = SPACE   # Just in case of an odd number of chars
      else  itemp2 = intin(i+1)
      call outint (itemp1, itemp2)
      }
   primfg = YES
   go to ENDCASE
 
#
#  opcode fill area
#
FILLxAREA  continue

   k = min0( contrl(2), 75)   # 75 point maximum for filled areas
   call outint (FILLxAREA, k)   # Output opcode and count

   j = 1
   for (i=1; i<=k; i=i+1) {  #  Vertices of the polygon
      call outxy (ptsin(j))
      j = j + 2
      }
   primfg = YES
   go to ENDCASE

#
#  opcode cell array
#
CELLxARRAY  continue
   call outint (CELLxARRAY, 0)
   call outxy (ptsin(1))  # Put the corner points into the object list
   call outxy (ptsin(3))
   primfg = YES
   go to ENDCASE

#
#   generalized drawing primitive
#
GENERALIZEDxDRAWINGxPRIMITIVE   continue
   opcode = contrl(6)
   if (opcode == BAR)  {
      call outint (GENERALIZEDxDRAWINGxPRIMITIVE, BAR)
      call outxy (ptsin(1))
      call outxy (ptsin(3))
      primfg = YES
      }
   go to ENDCASE

#
#  opcode set character height
#
SETxCHARACTERxHEIGHT  continue
   #   Set character height 12 sizes
   i = 8
   j = 1
   repeat {
      if (i > ptsin(2))  break
      i = mult (i, 2)
      j = j + 1
      }
   i = gimnmx (j, 2, 13) - 1
   call outint (SETxCHARACTERxHEIGHT, i)  # Put size into display list

   # Return text size selected
   ndtxsz = i

   contrl(3) = 2   # Output two points
   ptsout(1) = mult(5,i)   # Character width
   ptsout(2) = mult(7,i)  # Character height
   ptsout(3) = mult(6,i)  # Cell width
   ptsout(4) = mult(8,i)  # Cell height
   go to ENDCASE
 
#
#  opcode set character up vector
#
SETxCHARACTERxUPxVECTOR  continue
      # Set rotation 0, 90, 180, 270    0-3 range
      ndtxrt = divid (intin(1)+450, 900, i)
      call outint (SETxCHARACTERxUPxVECTOR, ndtxrt)  # Put rotation into list
      intout(1) = mult (ndtxrt, 900)     # Inform upper level of angle
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
   call outint (SETxPOLYLINExLINETYPE, ndlntp)
   go to ENDCASE
 
#
#  opcode polyline color index
#
SETxPOLYLINExCOLORxINDEX  continue
   ndclrl = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrl                       # Return color index selected
   call outint (SETxPOLYLINExCOLORxINDEX, ndclrl)
   go to ENDCASE
 
#
#  opcode set marker type
#
SETxPOLYMARKERxTYPE   continue
   ndmktp = intin(1)
   if (ndmktp < 1 | ndmktp > 5) ndmktp = 3  # Marker type 3 is default
   intout(1) = ndmktp                       # Return type selected
   call outint (SETxPOLYMARKERxTYPE, ndmktp)
   go to ENDCASE

#
#  opcode polymarker color index
#
SETxPOLYMARKERxCOLORxINDEX   continue
   ndclrm = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrm                       # Return color index selected
   call outint (SETxPOLYMARKERxCOLORxINDEX, ndclrm)
   go to ENDCASE
 
#
#  opcode text color index
#
SETxTEXTxCOLORxINDEX   continue
   ndclrt = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrt               # Return color index selected
   call outint (SETxTEXTxCOLORxINDEX, ndclrt)
   go to ENDCASE

#
#  opcode set fill interior style
#
SETxFILLxINTERIORxSTYLE         continue
   ndfstl = gimnmx (intin(1), HOLLOW, PATTERN)
   intout(1) = ndfstl
   call outint (SETxFILLxINTERIORxSTYLE, ndfstl)
   go to ENDCASE 

#
#  opcode set fill style index
#
SETxFILLxSTYLExINDEX            continue
   ndflpt = gimnmx (intin(1), 1, MAXxFILLS)
   intout(1) = ndflpt
   call outint (SETxFILLxSTYLExINDEX, ndflpt)
   go to ENDCASE 

#
#  opcode set fill color index
#
SETxFILLxCOLORxINDEX   continue
   ndclrf = gimnmx (intin(1), 0, NUMBERxOFxCOLORS)
   intout(1) = ndclrf               # Return color index selected
   call outint (SETxFILLxCOLORxINDEX, ndclrf)
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

SETxPOLYLINExLINExWIDTH         continue
SETxPOLYMARKERxSCALE            continue
SETxTEXTxFONT                   continue

ENDCASE   continue

return
end
subroutine makras
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
#     Function: Interpret display list into raster points              #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            getxy  - get 2 16 integers from object list               #
#            getint - get 2 byte integers from the object list         #
#            dlprnt - line primitive for printers                      #
#            dtprnt - text primitive for printers                      #
#            dmprnt - marker primitive for printers                    #
#            dpprnt - polygon primitive for printers                   #
#            openfl - open the object list output file                 #
#            readrc - read a block from the object list file           #
#            rasout - output the current raster strip to the printer   #
########################################################################
integer i, endlst, xy1(2), xy2(2), ksave, ibuf(150)
integer pagend, index, mult
integer opcode, iatt, itemp1, itemp2

integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

endlst = dispnt    # Save end of display list to tell when done
pagend = pagcnt

ytop = YxLIMITSxPRINTER
ybot = ytop - SCANxWIDTH + 1

for (; ytop >= 0;) {  # Keep going until top is off the page

   do i = 1, RASTERxLENGTH  { rasbuf(i) = 0 }# Initialize buffer for each scan

   dispnt = 1   # Reset pointer to start of display list
   pagcnt = 0
   if (pagend > 0) {  # Read first buffer in if disk used
      call openfl 
      call readrc (DISPLAYxLISTxLENGTH, objlst)
      }

   for (;pagcnt < pagend | dispnt < endlst;)  {
      # Go through the display list for each scan

   call getint (opcode, iatt)  # Get the function and related attribute

   go to (OPENxWORKSTATION, CLOSExWORKSTATION, CLEARxWORKSTATION,
          UPDATExWORKSTATION, ESCAPE, POLYLINE, POLYMARKER, TEXT,
          FILLxAREA, CELLxARRAY, GENERALIZEDxDRAWINGxPRIMITIVE,
          SETxCHARACTERxHEIGHT, SETxCHARACTERxUPxVECTOR,
          SETxCOLORxREPRESENTATION, SETxPOLYLINExLINETYPE, 
	  SETxPOLYLINExLINExWIDTH, SETxPOLYLINExCOLORxINDEX, 
	  SETxPOLYMARKERxTYPE, SETxPOLYMARKERxSCALE,SETxPOLYMARKERxCOLORxINDEX,
	  SETxTEXTxFONT, SETxTEXTxCOLORxINDEX, SETxFILLxINTERIORxSTYLE,
	  SETxFILLxSTYLExINDEX, SETxFILLxCOLORxINDEX), opcode

      go to ENDCASE
      #
      #  opcode polyline
      #
      POLYLINE   continue
         call getxy (xy1)
         for (i=2; i<=iatt; i=i+1) {
            call getxy (xy2)
            call dlprnt( xy1(1), xy1(2), xy2(1), xy2(2))
	    xy1(1) = xy2(1)
	    xy1(2) = xy2(2)
            }
         go to ENDCASE
      #
      #  opcode polymarker
      #
      POLYMARKER   continue
	 ksave = ndlntp
	 ndlntp = 1  # Solid line type
         for (i=1; i<=iatt; i=i+1) {
            call getxy (xy1)  # Output the marker
            call dmprnt (xy1)
            }
	 ndlntp = ksave
         go to ENDCASE
      #
      #  opcode text
      #
      TEXT   continue
         call getxy (xy1)    # Move to start point
         for (i=1; i<=iatt; i=i+2)   {   # Put out the characters
            call getint (itemp1, itemp2)
            ibuf(i) = itemp1
            ibuf(i+1) = itemp2
            }
         call dtprnt (xy1(1), xy1(2), iatt, ibuf, ndtxsz, ndtxrt)
         go to ENDCASE
      #
      #  opcode fill area
      #
      FILLxAREA   continue
         for (i=1; i<=iatt; i=i+1) {  # collect the points into a work buffer
	    index = mult(2,i) - 1
            call getxy (xy1)
	    ibuf(index) = xy1(1)
	    ibuf(index+1) = xy1(2)
            }
	 call dpprnt (iatt, ibuf)
         go to ENDCASE
      #
      #  opcode cell array
      #
      CELLxARRAY   continue
	 ksave = ndlntp
	 ndlntp = 1  # Set solid line type

         call getxy (xy1)
         call getxy (xy2)
	 call dlprnt (xy1(1), xy1(2), xy2(1), xy1(2))
	 call dlprnt (xy2(1), xy1(2), xy2(1), xy2(2))
	 call dlprnt (xy2(1), xy2(2), xy1(1), xy2(2))
	 call dlprnt (xy1(1), xy2(2), xy1(1), xy1(2))

	 ndlntp = ksave  # Restore real line type
      go to ENDCASE
      #
      # Opcode Generalized Drawing Primitive
      #
      GENERALIZEDxDRAWINGxPRIMITIVE  continue
	 if (iatt == BAR)   {
	    call getxy (xy1)  # Get the corner points
	    call getxy (xy2)

	    ibuf(1) = xy1(1)  # put corner points into polygon form
	    ibuf(2) = xy1(2)
	    ibuf(3) = xy2(1)
	    ibuf(4) = xy1(2)
	    ibuf(5) = xy2(1)
	    ibuf(6) = xy2(2)
	    ibuf(7) = xy1(1)
	    ibuf(8) = xy2(2)

	    call dpprnt (4, ibuf)  # Now draw a bar using the polygon fill
	    }
	 go to ENDCASE
      #
      #  opcode set character height
      #
      SETxCHARACTERxHEIGHT   continue
         ndtxsz = iatt
         go to ENDCASE
      #
      #  opcode set character up vector
      #
      SETxCHARACTERxUPxVECTOR   continue
         # Set rotation 0, 90, 180, 270    0-3 range
         ndtxrt = iatt
         go to ENDCASE
      #
      #  opcode set line type
      #
      SETxPOLYLINExLINETYPE   continue
         ndlntp = iatt
         go to ENDCASE
      #
      #  opcode polyline color index
      #
      SETxPOLYLINExCOLORxINDEX   continue
         ndclrl = iatt
         go to ENDCASE
      #
      #  opcode set marker type
      #
      SETxPOLYMARKERxTYPE   continue
         ndmktp = iatt
         go to ENDCASE
      #
      #  opcode polymarker color index
      #
      SETxPOLYMARKERxCOLORxINDEX   continue
         ndclrm = iatt
         go to ENDCASE
      #
      #  opcode text color index
      #
      SETxTEXTxCOLORxINDEX   continue
         ndclrt = iatt
         go to ENDCASE
      #
      #  Set Fill Interior Style
      #
      SETxFILLxINTERIORxSTYLE        continue
	 ndfstl = iatt
	 go to ENDCASE
      #
      #  Set Fill Style Index for Patterns
      #
      SETxFILLxSTYLExINDEX           continue
	 ndflpt = iatt
	 go to ENDCASE
      #
      #  opcode set fill color index
      #
      SETxFILLxCOLORxINDEX   continue
         ndclrf = iatt 

      #  The following opcodes are not implemented but must appear
      #  to allow the computed go to to function correctly
      OPENxWORKSTATION               continue
      CLOSExWORKSTATION              continue
      UPDATExWORKSTATION             continue
      ESCAPE                         continue
      CLEARxWORKSTATION              continue
      SETxCOLORxREPRESENTATION       continue
      SETxPOLYLINExLINExWIDTH        continue
      SETxPOLYMARKERxSCALE           continue
      SETxTEXTxFONT                  continue

      ENDCASE   continue

      } #  End of an opcode

   call rasout   # Now dump the current buffer

   ytop = ytop - SCANxWIDTH   # Update the current raster buffer swath
   ybot = ybot - SCANxWIDTH
   } # End of a printer scan
return
end
include(`ddprim.r')
D 2
subroutine setbit (x, y, qvis)
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
#     Function: Encode an x y point into the raster buffer             #
#                                                                      #
#     Input Parameters:                                                #
#            x, y - raster point to be turned on                       #
#                                                                      #
#     Output Parameters:                                               #
#            qvis - flag indicating if the point was visible           #
#                                                                      #
#     Routines Called:                                                 #
#            divid - divid 2 16 bit unsigned integers                  #
#            mult  - multiply two 16 bit unsigned integers             #
########################################################################
integer x, y
logical qvis

integer xpos, ypos, iout, ival, j, k, i, index, yrow
integer divid , mult

integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

   qvis = .false.   # start out saying point not in strip

   if (y < ybot | y > ytop) return  # Point is not in current printer scan

   if (x < 0 | x > XxLIMITSxPRINTER)  return   # Can not put out this X point

   qvis = .true.   # Now the point is visible

   xpos = x + 1                  # Bias into (1-max) range

   # Since more than one scan line is displayed, determine correct line
   ypos = ytop - y          # Bias into current rows (0 - (n-1))
   yrow = divid (ypos, PRINTxSIZE, i)  # Mod for the row, save bit too in i

   index = mult( yrow, RASTERxBUFFER) + xpos  # Byte to access

   j = 1      # Determine bit to set
   i = 6 - i  # Flip the i around
   for (; i>0; i=i-1) {
      j = mult (2, j)
      }

   # Need to see if the bit is already set before adding it in
   k = mult(j, 2)
   ival = divid (rasbuf(index), k, iout) # And off bottem bits into iout

   if  (iout < j)  {  # The bit is not set, need to set it
      rasbuf(index) = rasbuf(index)+j  # Set the correct bit for the MX-80
      }

   return
end
E 2
subroutine rasout
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
#     Function: Put a scan line out to the printer                     #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            prtout - output a byte to the printer                     #
#            prstot - output a byte array to the printer               #
#            mult   - multiply two 16 bit integers                     #
########################################################################
integer i, m, base, end, count, length, index
SHORTINT outgrf(4), crlf(2)
integer mult

integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

data outgrf / ESC, BIGK, 0, 0/
data crlf /13, 10/

   base = 0
   do m = 1, NUMBERxOFxROWS  {
      end = mult (m, RASTERxBUFFER)
      for (count=end; count>base; count=count-1) { # Count down buffer
         if (rasbuf(count) != 0)  break
         }

      count = count - base
      for (; count > 0; )  {
         length = min0 (count, 127)
         outgrf(3) = length
         call prstot (4, outgrf)

         do i = 1, length {  # Put out each graphic pixel column
	    index = base + i
            call prtout (rasbuf(index))
            }
         count = count - 127
         base = base+127  # Increment pointer into raster buffer for next part
         }

      call prstot (2, crlf)

      base = end   # And the end becomes the new start
      }

   return
end
include(`data.r')
E 1
