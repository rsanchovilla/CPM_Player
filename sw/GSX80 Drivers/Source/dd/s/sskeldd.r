h59483
s 00668/00000/00000
d D 1.1 83/03/24 15:18:14 lib 1 0
c date and time created 83/03/24 15:18:14 by lib
e
u
4
U
t
T
I 1
subroutine skeldd (contrl, intin, ptsin, intout, ptsout)
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
#     Function: GSS-KERNAL skeletom device driver for testing          #
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
#            none                                                      #
#                                                                      #
########################################################################
 
define(`DEFAULT',`1')         # Default input device
define(`WORKSTATIONxDEPENDENT',`8')   # Workstation input device max
define(`XxLIMITSx4010',`1023')        # X-extent on 4010-style box
define(`YxLIMITSx4010',`779')         # Y-extent on 4010-style box
define(`PATTERN',`2')         # Defines for fill area interior style
define(`HATCH',`3')

integer contrl(1),intin(1),ptsin(1),intout(1),ptsout(1)
 
integer opcode, celwid(4), celhgt(4), chrwid(4), chrhgt(4), fout, i,
	gimnmx, j, index, k

integer jlngth, klngth

integer ccltb(6), sclrd(6), sclgr(6), sclbl(6)

include(`ddcom')

data celwid /13, 26, 39, 51/    # Char cell width in raster space
data celhgt /23, 46, 71, 98/    # Char cell height in raster space
data chrwid / 9, 17, 26, 34/    # Actual char width 2/3 * celwid
data chrhgt /14, 28, 43, 59/    # Actual char height .6 * celhgt

data fout /7/

200 format(' Contrl: ',/,5i9,/,5i9)
300 format(' Intin: ',/,5i9,/,5i9)
400 format(' Ptsin: ',/,15(5i9,/),5i9)
500 format(/)
 
contrl(3) = 0    # Initialize ptsout count to zero (0)

opcode = contrl(OPCODE)    # Obtain a local copy of the current opcode

# 
#  opcode open workstation
# 
if (opcode == OPENxWORKSTATION) {
 
      write(fout,100)                     # Output opcode to data file
      100 format(' Open Workstation',/)
      write(fout,200)(contrl(i),i=2,4)    # Output the contrl array
      klngth = contrl(4)
      write(fout,300)(intin(i),i=1,klngth)    # Output the intin array
      write(fout,500)

      contrl(3) = 6                       # Set to number of vertices in ptsout
      contrl(5) = 45                      # Set to number of output parameters  
      
      i = intin(2) - 1
      if (i > 5) i = 5
      ndlntp = gimnmx(i, 0, 5)                # Set current device line style
      ndclrl = gimnmx (intin(3), 0, 5)        # current polyline color
      ndmktp = intin(4)                       # Set current polymarker type
      if (ndmktp < 1 | ndmktp > 5) ndmktp = 3 # use default
      ndclrm = gimnmx (intin(5), 0, 5)        # current polymarker color
      ndclrt = gimnmx (intin(7), 0, 3)        # current text color              
      ndfstl = gimnmx (intin(8), 0, 1)        # set fill interior style
      ndclrf = gimnmx (intin(10), 0, 5)       # current fill area color

      ndclrp = ndclrl                         # set current device color

      intout(1) = XxLIMITSx4010   # Addressable width in rasters of screen
      intout(2) = YxLIMITSx4010   # Addressable height in rasters of screen
      intout(3) = OTHER  # Device coordinates in raster units
      intout(4) = 329    # width of one pixel in micrometers
      intout(5) = 329    # height of one pixel in micrometers
      intout(6) = 4      # Number of character heights
      intout(7) = 5      # Number of line types
      intout(8) = 1      # Number of line widths
      intout(9) = 5      # Number of marker types
      intout(10) = 1     # Number of marker heights
      intout(11) = 1     # Number of fonts
      intout(12) = 3     # Number of patterns
      intout(13) = 3     # Number of hatch styles
      intout(14) = 5     # Number of predefined colors
      intout(15) = 5     # Number of GDPs      
      intout(16) = 1     # Bar GDP
      intout(17) = 2     # Arc GDP
      intout(18) = 3     # Pie Slice GDP
      intout(19) = 4     # Circle GDP
      intout(20) = 5     # Print Graphic Character GDP
      do i = 21,25 {
	 intout(i) = -1       # List of GDPs
	 intout(i+10) = -1    # List of associated bundle tables
	 }
      intout(26) = 3           # Bar GDP uses fill area attributes
      intout(27) = 3           # Arc GDP uses fill area attributes
      intout(28) = 3           # Pie Slice GDP uses fill area attributes
      intout(29) = 3           # Circle GDP uses fill area attributes
      intout(36) = 1           # Color capability flag (device is capable)
      intout(37) = YES         # Text rotation capability flag
      intout(38) = YES         # Fill area capability flag
      intout(39) = YES         # Pixel operation capability flag
      intout(40) = 5           # Number of available colors
      intout(41) = 1           # Number of locator devices
      intout(42) = 1           # Number of valuator devices
      intout(43) = 1           # Number of choice devices
      intout(44) = 1           # Number of string devices
      intout(45) = 2           # Workstation type 

      ptsout(1) = 0
      ptsout(2) = chrhgt(1)  # Minimum character height in device coordinates
      ptsout(3) = 0
      ptsout(4) = chrhgt(4)  # Maximum character height in device coordinates
      ptsout(5) = 1     # Minimum line width in NDC space
      ptsout(6) = 0
      ptsout(7) = 1     # Maximum line width in NDC space
      ptsout(8) = 0
      ptsout(9) = 0
      ptsout(10) = 12   # Minimum marker height in NDC space
      ptsout(11) = 0
      ptsout(12) = 12   # Maximum marker height in NDC space

      # initialize predefined color table
      ccltb(1) = 0   # Current color table
      do i=2,6 {
	 ccltb(i) = 1000
	 }
      # the user set color table, in case of inquiry
      sclrd(1) = 0
      sclgr(1) = 0
      sclbl(1) = 0
      do i=2,6 {
	 sclrd(i) = 1000
         sclgr(i) = 1000
         sclbl(i) = 1000
	 }
   }

#
#  opcode CLOSExWORKSTATION
#
else if (opcode == CLOSExWORKSTATION) {
      write(fout,101)                     # Output opcode to data file
      101 format (' Close Workstation',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,500)
      }

#
#  opcode CLEARxWORKSTATION
#
else if (opcode == CLEARxWORKSTATION) {
      write(fout,102)                     # Output opcode to data file
      102 format(' Clear Workstation',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,500)
      }

# 
#  opcode UPDATExWORKSTATION
#
else if (opcode == UPDATExWORKSTATION) {
      write(fout,103)                     # Output opcode to data file
      103 format (' Update Workstation',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,500)
      }

#
#  opcode escape
#
else if (opcode == ESCAPE) {
      write(fout,104)                     # Output opcode to data file
      104 format (' Escape',/)
      write(fout,200)(contrl(i),i=2,6)    # Output the contrl array
      klngth = contrl(4)*2
      write(fout,400)(ptsin(i),i=1,klngth)  # Output the ptsin array

     if (contrl(6) == INQUIRExADDRESSABLExCELLS) {
	contrl(5) = 2               # Number of integer output elements
	intout(1) = 24              # Number of addressable rows
	intout(2) = 80              # Number of addressable columns
	}
     else if (contrl(6) == DIRECTxCURSORxADDRESS) {
        write(fout,300)(intin(i),i=1,2)    # Output the intin array
	}
     else if (contrl(6) == OUTPUTxCURSORxADDRESSABLExTEXT) {
        klngth = contrl(4)
        write(fout,300)(intin(i),i=1,klngth)    # Output the intin array
	}
     else if (contrl(6) == INQUIRExCURRENTxCURSORxADDRESS) {
	contrl(5) = 2                # Number of integer output elements
	intout(1) = 12               # Hardcoded row number
	intout(2) = 40               # Hardcoded column number
	}
     else if (contrl(6) == INQUIRExTABLETxSTATUS) {
	intout(1) = 1                # Hardcoded tablet available indication
	}
     else {
	write(fout, 500)
	}
     }

#
#  opcode POLYLINE
# 
else if (opcode == POLYLINE) {
   write(fout,105)                     # Output opcode to data file
   105 format (' Polyline',/)
   write(fout,200)contrl(2)            # Output the contrl array
   klngth = contrl(2)*2
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the ptsin array
   write(fout,500)

   }

# 
#  opcode polymarker 
#
else if (opcode == POLYMARKER) {
   write(fout,106)                     # Output opcode to data file
   106 format (' Polymarker',/)
   write(fout,200)contrl(2)            # Output the contrl array
   klngth = contrl(2)*2
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the ptsin array
   write(fout,500)

   ndclrp = ndclrm          # change color to current marker color
   }

#
#  opcode text
#
else if (opcode == TEXT) {
   write(fout,107)                     # Output opcode to data file
   107 format (' Text',/)
   write(fout,200)(contrl(i),i=2,4)    # Output the contrl array
   klngth = contrl(4)
   write(fout,300)(intin(i),i=1,klngth)      # Output the intin array
   klngth = contrl(2)*2
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the ptsin array
   write(fout,500)

   ndclrp = ndclrt                   # change color to current text color
   }

#
#  opcode fill area
#
else if (opcode == FILLxAREA) {
   write(fout,108)                     # Output opcode to data file
   108 format (' Fill Area',/)
   write(fout,200)contrl(2)            # Output the contrl array
   klngth = 2*contrl(2)
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the ptsin array
   write(fout,500)

   ndclrp = ndclrf                    # change color to current fill area color
   }

#
#  opcode cell array
#
else if (opcode == CELLxARRAY) {
   write(fout,109)                     # Output opcode to data file
   109 format (' Cell Array',/)
   write(fout,200)(contrl(i),i=2,9)    # Output the contrl array
   klngth = contrl(4)
   write(fout,300)(intin(i),i=1,klngth)    # Output the intin array
   write(fout,400)(ptsin(i),i=1,4)     # Output the ptsin array
   write(fout,500)

   contrl(10) = 0        # Hardcoded indicator of no errors
   }

#
#  opcode generalized drawing primitive
#
else if (opcode == GENERALIZEDxDRAWINGxPRIMITIVE) {
   write(fout,110)                     # Output opcode to data file
   110 format (' Generalized Drawing Primitive',/)
   write(fout,200)(contrl(i),i=2,6)    # Output the contrl array
   klngth = contrl(4)
   write(fout,300)(intin(i),i=1,klngth)    # Output the intin array
   klngth = contrl(2)*2
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the intin array
   write(fout,500)
   }
#
#  opcode set character height
#
else if (opcode == SETxCHARACTERxHEIGHT) {
      write(fout,111)                     # Output opcode to data file
      111 format (' Set Character Height',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,400)(ptsin(i),i=1,2)     # Output the ptsin array
      write(fout,500)

      ndtxsz = 1                       # Hardcoded index into char size arrays
      contrl(3) = 2                    # Set the number vertices
      ptsout(1) = chrwid (ndtxsz)      # Return values selected
      ptsout(2) = chrhgt (ndtxsz)
      ptsout(3) = celwid (ndtxsz)
      ptsout(4) = celhgt (ndtxsz)
   }
#
#  opcode set character up vector
#
else if (opcode == SETxCHARACTERxUPxVECTOR) {
   write(fout,112)                     # Output opcode to data file
   112 format (' Set Character Up Vector',/)
   write(fout,200)contrl(2)            # Output the contrl array
   write(fout,300)(intin(i),i=1,3)     # Output the intin array
   write(fout,500)

   intout(1) = 1800         # Hardcoded angle of rotation selected
   }
#
#  opcode color
#
else if (opcode == SETxCOLORxREPRESENTATION) {
      write(fout,113)                     # Output opcode to data file
      113 format (' Set Color Representation',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)(intin(i),i=1,4)     # Output the intin array
      write(fout,500)

      i = gimnmx (intin(1), 0, 5) + 1  # Map index 0-5 to 1-6

      #  If all are set to 0, then he wants the background color
      j = intin(2) + intin(3) + intin(4)
      if (j == 0)  ccltb(i) = 0
      else  ccltb(i) = 1000  # One of the foreground colors

      sclrd(i) = intin(2)  # This is what was set
      sclgr(i) = intin(3)
      sclbl(i) = intin(4)
      }
#
#  opcode set polyline linetype
#
else if (opcode == SETxPOLYLINExLINETYPE) {
      write(fout,114)                     # Output opcode to data file
      114 format (' Set Polyline Linetype',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndlntp = intin(1)
      if (ndlntp > 5) ndlntp = 1
      ndlntp = gimnmx (ndlntp, 1, 5) # 4012 has 5 line styles, 1-5
      intout(1) = ndlntp             # Return linestyle seleced
      }
#
#  opcode set polyline line width
#
else if (opcode == SETxPOLYLINExLINExWIDTH) {
   write(fout,115)                     # Output opcode to data file
   115 format (' Set Polyline Line Width',/)
   write(fout,200)contrl(2)            # Output the contrl array
   klngth = contrl(2)*2
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the ptsin array
   write(fout,500)

   contrl(3) = 1         # Hardcoded number of output vertices
   ptsout(1) = ptsin(1)  # Hardcoded selected line width
   ptsout(2) = 0
   }
#
#  opcode set polyline colour index
#
else if (opcode == SETxPOLYLINExCOLORxINDEX) {
      write(fout,116)                     # Output opcode to data file
      116 format (' Set Polyline Color Index',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndclrl = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrl
      }
#
#  opcode set polymarker type
#
else if (opcode == SETxPOLYMARKERxTYPE) {
      write(fout,117)                     # Output opcode to data file
      117 format (' Set Polymarker Type',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndmktp = intin(1)
      if (ndmktp < 1 | ndmktp > 5) ndmktp = 3   # Out of range defaults to 3
      intout(1) = ndmktp
      }

#
#  opcode set polymarker scale
#
else if (opcode == SETxPOLYMARKERxSCALE) {
   write(fout,118)                     # Output opcode to data file
   118 format (' Set Polymarker Scale',/)
   write(fout,200)contrl(2)            # Output the contrl array
   klngth = contrl(2)*2
   write(fout,400)(ptsin(i),i=1,klngth)    # Output the ptsin array
   write(fout,500)

   contrl(3) = 1         # Hardcoded number of output vertices
   ptsout(1) = 0
   ptsout(2) = ptsin(2)  # Hardcoded height selected in device units
   }
#
#  opcode set polymarker colour index
#
else if (opcode == SETxPOLYMARKERxCOLORxINDEX) {
      write(fout,119)                     # Output opcode to data file
      119 format (' Set Polymarker Color Index',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndclrm = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrm
      }
#
#  opcode set text font
#
else if (opcode == SETxTEXTxFONT) {
   write(fout,120)                     # Output opcode to data file
   120 format (' Set Text Font',/)
   write(fout,200)contrl(2)            # Output the contrl array
   write(fout,300)intin(1)             # Output the intin array
   write(fout,500)
    
   intout(1) = intin(1)    # Hardcoded hardware text font selected
   }
#
#  opcode set text color index
#
else if (opcode == SETxTEXTxCOLORxINDEX) {
      write(fout,121)                     # Output opcode to data file
      121 format (' Set Text Color Index',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndclrt = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrt
      }
#
#  opcode set fill interior style
#
else if (opcode == SETxFILLxINTERIORxSTYLE) {
      write(fout,122)                     # Output opcode to data file
      122 format (' Set Fill Interior Style',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndfstl = intin(1)    # Hardcoded fill style selected
      intout(1) = ndfstl
      }
#
#  opcode set fill style index
#
else if (opcode == SETxFILLxSTYLExINDEX) {
      write(fout,123)                     # Output opcode to data file
      123 format (' Set Fill Style Index',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      if (ndfstl == PATTERN | ndfstl == HATCH) {
         ndfstl = intin(1)    # Hardcoded fill style selected
	 }
      intout(1) = ndfstl
      }
#
#  opcode set fill area color index
#
else if (opcode == SETxFILLxCOLORxINDEX) {
      write(fout,124)                     # Output opcode to data file
      124 format (' Set Fill Color Index',/)
      write(fout,200)contrl(2)            # Output the contrl array
      write(fout,300)intin(1)             # Output the intin array
      write(fout,500)

      ndclrf = gimnmx (intin(1), 0 ,1)
      intout(1) = ndclrf
      }
#
#  opcode inquire colour representation
#
else if (opcode == INQUIRExCOLORxREPRESENTATION) {
   write(fout,125)                     # Output opcode to data file
   125 format (' Inquire Color Representation',/)
   write(fout,200)contrl(2)            # Output the contrl array
   write(fout,300)(intin(i),i=1,2)     # Output the intin array
   write(fout,500)

   i = gimnmx (intin(1), 0, 5) + 1  # Map index 0-5 to 1-6
   intout(1) = i - 1  #  This is what we inquired on
   index = intin(2)   # Type of inquiry, 0=set, 1=realized
   if (index == 0)  {
      intout(2) = sclrd(i)
      intout(3) = sclgr(i)
      intout(4) = sclbl(i)
      }
   else {
      if (index == 1)  j = ccltb(i)  # inquire realized color
      intout(2) = j
      intout(3) = j
      intout(4) = j
      }
   }
 
# 
#  opcode inquire cell array
#
else if (opcode == INQUIRExCELLxARRAY) {
   write(fout,126)                     # Output opcode to data file
   126 format (' Inquire Cell Array',/)
   write(fout,200)(contrl(i),i=2,7)    # Output the contrl array
   write(fout,400)(ptsin(i),i=1,4)     # Output the ptsin array
   write(fout,500)

   contrl(8) = contrl(6)  # Hardcoded number of elements used in each row
   contrl(9) = contrl(7)  # Hardcoded number of rows used
   contrl(10) = 0         # Hardcoded indication of no errors

   jlngth = contrl(7)
   do i = 1, jlngth {
      klngth = contrl(6)
      do j = 1, klngth {
	 k = (i-1)*contrl(6) + j
	 intout(k) = 1   # Hardcode color index array
	 }
      }
   }

#
#  opcode input locator 
#
else if (opcode == INPUTxLOCATOR) {
        write(fout,127)                     # Output opcode to data file
	127 format (' Input Locator',/)
        write(fout,200)contrl(2)            # Output the contrl array
        write(fout,300)intin(1)             # Output the intin array
        write(fout,400)(ptsin(i),i=1,2)     # Output the ptsin array
        write(fout,500)
	
	contrl(5) = NONE             # Initialize status to not successful
	i = intin(1)                 # Check locator device for validity
	if (i < DEFAULT | i > WORKSTATIONxDEPENDENT) return

        contrl(5) = 1   # Set successful flag 
        contrl(3) = 1   # Set the number of output vertices 

        # Hardcoded locator position in device units
        ptsout(1) = 320
        ptsout(2) = 140
 
        # Return the locator input character (hardcoded to A (65))
        intout(1) = 65
        }

#
#  opcode input valuator
#
else if (opcode == INPUTxVALUATOR) {
   write(fout,128)                     # Output opcode to data file
   128 format (' Input Valuator',/)
   write(fout,200)contrl(2)            # Output the contrl array
   write(fout,300)(intin(i),i=1,2)     # Output the intin array
   write(fout,500)

   if (intin(1) > DEFAULT) {           # Check for valid string device
      contrl(5) = NONE
      return
      }

   intout(1) = intin(2)             # Return initial value

   contrl(5) = 1                    # Return input successful
   }
 
#
#  opcode input choice
#
else if (opcode == INPUTxCHOICE) {
   write(fout,129)                     # Output opcode to data file
   129 format (' Input Choice',/)
   write(fout,200)contrl(2)            # Output the contrl array
   write(fout,300)(intin(i),i=1,2)     # Output the intin array
   write(fout,500)

   if (intin(1) > WORKSTATIONxDEPENDENT) {   # Check for valid string device
      contrl(5) = NONE
      return
      }

   intout(1) = intin(2)             # Return initial choice

   contrl(5) = 1                    # Return input status
   }
 
#
#  opcode input string
#
else if (opcode == INPUTxSTRING) {
   write(fout,130)                     # Output opcode to data file
   130 format (' Input String',/)
   write(fout,200)contrl(2)            # Output the contrl array
   write(fout,300)(intin(i),i=1,2)     # Output the intin array
   write(fout,500)

   if (intin(1) != DEFAULT) {       # Check for valid string device
      contrl(5) = NONE
      return
      }

   jlngth = intin(2)
   do i=1, jlngth {
      intout(i) = 66                # Return all B's (66's)
      }

   contrl(5) = intin(2)             # Return input status
   }
 
return
end
E 1
