h08711
s 00921/00000/00000
d D 1.1 83/03/17 16:03:31 tes 1 0
c date and time created 83/03/17 16:03:31 by tes
e
u
4
U
t
T
I 1
subroutine dmprnt (intin)
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
#            dlprnt - Printer move/draw routine                        #
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
      call dlprnt (x1, y1, x2, y1)
      call dlprnt (x2, y1, x2, y2)
      call dlprnt (x2, y2, x1, y2)
      call dlprnt (x1, y2, x1,y1)
      }
   else {
      if (ndmktp == MARKxX | ndmktp == MARKxSTAR) {
         call dlprnt (x1, y1, x2, y2)
         call dlprnt (x1, y2, x2, y1)
         }
      if (ndmktp == MARKxPLUS | ndmktp == MARKxSTAR) {
         rxy2 = y1 + hsize
         call dlprnt (x1, rxy2, x2, rxy2)
         rxy1 = x1 + hsize
         call dlprnt (rxy1, y1, rxy1, y2)
         }
      }

   return
end
subroutine dlprnt (x1, y1, x2, y2)
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
#            x1,y1 - first point of line                               #
#            x2,y2 - second point of line                              #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            setbit - turn on a pixel in the printer raster buffer     #
#            mult   - multiply 2 16 bit integers                       #
#            reject - test vector to see if out of current strip       #
########################################################################
define(`DASHxINCREMENT',4) 
integer x1, y1, x2, y2, x, y, dx, dy, d, adx, ady, adx2, ady2
integer xtemp1, xtemp2, ytemp1, ytemp2, xend, temp, xincr
integer patrn, numpnt, k, kk, action, actary(20)
logical qchang, qgone, qvis, qstate
integer mult

include(`ddcom')

# action definitions for line styles 1-5:  0=move, 1=draw, 2=point
data actary /1,1,1,1, 2,2,2,2, 2,0,1,0, 0,1,0,1, 0,1,1,0/

#  Check to see if line is visible
call reject (x1, y1, x2, y2, qgone)
if (qgone)  return

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
   if (qchang) call setbit (y,x,qvis)
   else        call setbit (x,y,qvis)
   }
 
d = -adx + ady2        # Compute initial error
 
qstate = .false.
qvis = .false.

for (; x != xend;) {
   if (qstate) qvis = .true.

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
      if (qchang) call setbit (y,x,qvis)
      else        call setbit (x,y,qvis)
      }
   else if (action == 2)  {  # Working on a dot now
      if (numpnt == DASHxINCREMENT)  {  # Time to light the dot
         if (qchang) call setbit (y,x,qvis)
         else        call setbit (x,y,qvis)
	 }
      }
   if (numpnt == DASHxINCREMENT)  { # Time to reset to new pattern
      numpnt = 0   # Reset pixel count for the pattern
      patrn = patrn + 1    # Increment index into action array
      if (patrn == 4)  patrn = 0   # There are only 4 actions per linetype
      }
   if (qvis) qstate = .true.
   if (qstate & ! qvis) return
   }
return
end
subroutine dtprnt (x, y, length, txtstr, size, rotat)
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
#     Function: Output text into the printer raster buffer             #
#                                                                      #
#     Input Parameters:                                                #
#            x,y - starting point for text string                      #
#            length - length of text string                            #
#            txtstr - text string (in ADE)                             #
#            size - scale factor for character size (1-6)              #
#            rotat - text rotation                                     #
#                    0 = no rotation  1 = 90 degrees                   #
#                    2 = 180 degrees  3 = 270 degrees                  #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            setbit - set bit in the raster buffer                     #
#            reject - determine if line passes though the raster buffer#
#            mult - multiply 2 unsigned 16 bit numbers                 #
#            divid - divide 2 unsigned 16 bit numbers                  #
#                                                                      #
########################################################################
define(`ROWS',8)     # rows in a character cell
define(`COLUMNS',6)  # columns in a character cell
 
integer x, y, length, txtstr(1), size, rotat

integer coltbl(4), rowtbl(4), rowinc, colinc, colrpt, rowrpt
logical qchang, qgone, qvis, qstate
integer x2, y2, i, j, k, m, itemp
integer xcoord, ycoord, xtemp, ytemp, gimnmx, width, tmpwid
integer mult, divid, istart, iptr, descnd(4), xparm, yparm
SHORTINT fntary (768), part1(128), part2(128), part3(128), part4(128),
	 part5(128), part6(128)
 
equivalence (part1(1), fntary(1))
equivalence (part2(1), fntary(129))
equivalence (part3(1), fntary(257))
equivalence (part4(1), fntary(385))
equivalence (part5(1), fntary(513))
equivalence (part6(1), fntary(641))
 
data coltbl /1, 1, -1, -1/    # column (x) increment for 90 degree rotations
data rowtbl /1, -1, -1, 1/    # row (y) increment for 90 degree rotations
data descnd /-1, 1, 1, -1/    # row (y) offsets for 1 pixel descenders
data width /COLUMNS/          # character cell width
 
data part1 /_
      0,  0,  0,  0,  0,  0,  0,  0,    #sp
      0,  4,  0,  0,  4,  4,  4,  4,    # !
      0,  0,  0,  0,  0,  5, 10, 10,    # "
      0, 10, 10, 31, 10, 31, 10, 10,    # #
      0,  4, 14, 20, 14,  5, 14,  4,    # $
      0, 25, 25,  2,  4,  8, 19, 19,    # %
      0, 22,  9, 21, 18,  5,  5,  2,    # &
      0,  0,  0,  0,  0,  2,  4,  6,    # '
      0,  8,  4,  2,  2,  2,  4,  8,    # (
      0,  2,  4,  8,  8,  8,  4,  2,    # )
      0,  0, 18, 12, 30, 12, 18,  0,    # *
      0,  0,  4,  4, 31,  4,  4,  0,    # +
      2,  4,  6,  6,  0,  0,  0,  0,    # ,
      0,  0,  0,  0, 31,  0,  0,  0,    # -
      0,  6,  6,  0,  0,  0,  0,  0,    # .
      0,  0,  1,  2,  4,  8, 16,  0/    # /

data part2/_
      0, 14, 17, 19, 21, 25, 17, 14,    # 0
      0, 14,  4,  4,  4,  4,  6,  4,    # 1
      0, 31,  2,  4,  8, 16, 17, 14,    # 2
      0, 14, 17, 16,  8,  4,  8, 31,    # 3
      0,  8,  8, 31,  9, 10, 12,  8,    # 4
      0, 14, 17, 16, 16, 15,  1, 31,    # 5
      0, 14, 17, 17, 14,  2,  4,  8,    # 6
      0,  2,  2,  4,  8, 16, 16, 31,    # 7
      0, 14, 17, 17, 14, 17, 17, 14,    # 8
      0,  2,  4,  8, 14, 17, 17, 14,    # 9
      0,  6,  6,  0,  0,  6,  6,  0,    # :
      2,  4,  6,  6,  0,  6,  6,  0,    # ;
      0,  8,  4,  2,  1,  2,  4,  8,    # <
      0,  0,  0, 31,  0, 31,  0,  0,    # =
      0,  2,  4,  8, 16,  8,  4,  2,    # >
      0,  4,  0,  4,  8, 16, 17, 14/   # ?

data part3 /_
      0, 30, 1,  29, 21, 29, 17, 14,    # @
      0, 17, 17, 31, 17, 17, 10,  4,    # A
      0, 15, 18, 18, 14, 18, 18, 15,    # B
      0, 14, 17,  1,  1,  1, 17, 14,    # C
      0, 15, 18, 18, 18, 18, 18, 15,    # D
      0, 31,  1,  1, 15,  1,  1, 31,    # E
      0,  1,  1,  1, 15,  1,  1, 31,    # F
      0, 14, 17, 17, 29,  1, 17, 14,    # G
      0, 17, 17, 17, 31, 17, 17, 17,    # H
      0, 14,  4,  4,  4,  4,  4, 14,    # I
      0,  6,  9,  9,  8,  8,  8, 28,    # J
      0, 17,  9,  5,  3,  5,  9, 17,    # K
      0, 31,  1,  1,  1,  1,  1,  1,    # L
      0, 17, 17, 17, 21, 21, 27, 17,    # M
      0, 17, 17, 25, 21, 19, 17, 17,    # N
      0, 14, 17, 17, 17, 17, 17, 14/    # O

data part4/_
      0,  1,  1,  1, 15, 17, 17, 15,    # P
      0, 22,  9, 21, 17, 17, 17, 14,    # Q
      0, 17, 17,  9, 15, 17, 17, 15,    # R
      0, 14, 17, 16, 14,  1, 17, 14,    # S
      0,  4,  4,  4,  4,  4,  4, 31,    # T
      0, 14, 17, 17, 17, 17, 17, 17,    # U
      0,  4, 10, 10, 17, 17, 17, 17,    # V
      0, 17, 27, 21, 21, 17, 17, 17,    # W
      0, 17, 17, 10,  4, 10, 17, 17,    # X
      0,  4,  4,  4,  4, 10, 17, 17,    # Y
      0, 31,  1,  2,  4,  8, 16, 31,    # Z
      0, 14,  2,  2,  2,  2,  2, 14,    # [
      0,  0, 16,  8,  4,  2,  1,  0,    # \
      0, 14,  8,  8,  8,  8,  8, 14,    # ]
      0,  0,  0,  0,  0, 17, 10,  4,    # ^
     31,  0,  0,  0,  0,  0,  0,  0/    # _

data part5/_
      0,  0,  0,  0,  0,  8,  4, 12,    # `
      0, 22,  9, 14,  8,  7,  0,  0,    # a
      0,  7,  9,  9,  9,  7,  1,  1,    # b
      0, 14,  1,  1,  1, 14,  0,  0,    # c
      0, 28, 18, 18, 18, 28, 16, 16,    # d
      0, 14,  1, 31, 17, 14,  0,  0,    # e
      0,  4,  4,  4, 31,  4, 20, 12,    # f
      7,  8, 14,  9,  9, 14,  0,  0,    # g
      0,  9,  9,  9,  9,  7,  1,  1,    # h
      0, 14,  4,  4,  4,  6,  0,  4,    # i
      4,  10, 8,  8,  8, 12,  0,  8,    # j
      0,  9,  5,  3,  5,  9,  1,  1,    # k
      0, 14,  4,  4,  4,  4,  4,  6,    # l
      0, 21, 21, 21, 21, 15,  0,  0,    # m
      0, 17, 17, 17, 17, 15,  0,  0,    # n
      0, 14, 17, 17, 17, 14,  0,  0/    # o
data part6/_
      1,  1,  7,  9,  9,  7,  0,  0,    # p
     24,  8, 14,  9,  9, 14,  0,  0,    # q
      0,  1,  1,  1, 11,  5,  0,  0,    # r
      0, 15, 16, 14,  1, 14,  0,  0,    # s
      0, 12,  2,  2,  2, 15,  2,  2,    # t
      0, 22,  9,  9,  9,  9,  0,  0,    # u
      0,  4, 10, 10, 17, 17,  0,  0,    # v
      0, 10, 21, 21, 17, 17,  0,  0,    # w
      0, 17, 10,  4, 10, 17,  0,  0,    # x
     14, 16, 30, 17, 17, 17,  0,  0,    # y
      0, 15,  1,  2,  4, 15,  0,  0,    # z
      0, 24,  4,  4,  2,  4,  4, 24,    # {
      0,  4,  4,  4,  0,  4,  4,  4,    # |
      0,  3,  4,  4,  8,  4,  4,  3,    # }
      0,  0,  0,  0,  0,  8, 21,  2,    # ~
      0, 31, 31, 31, 31, 31, 31, 31/   # rubout

xtemp = x                                  # save start point
ytemp = y

# exchange x and y on 90 and 270 degree rotation
itemp = divid (rotat, 2, m)
qchang = .false.
if (m != 0) {
   qchang = .true.
   xtemp = y
   ytemp = x
   }

i = rotat + 1
colinc = coltbl (i)                        # determine row & column
rowinc = rowtbl (i)                        #   increments
tmpwid = mult (width , size)               # set intercharacter spacing
if (rotat >= 2) tmpwid = -tmpwid           # negate spacing for 180 & 270 
					   #   degree rotations
# modify starting position to account for 1 pixel descender
if (descnd(i) > 0) ytemp = ytemp + size
else               ytemp = ytemp - size

# Determine if string can be rejected by clipping
# Mult only supports unsigned integer
x2 = xtemp + tmpwid * length
y2 = ytemp + rowinc * mult(8, size)

if (qchang) call reject (ytemp, xtemp, y2, x2, qgone) # Need to swap x's and y's
else        call reject (xtemp, ytemp, x2, y2, qgone)

if (qgone)  return   # Not there
 
do k=1,length {
   i = gimnmx (txtstr(k), 32, 127)         # make sure character in range
   istart = mult ((i-32), 8) + 1           # get pointer to start of pixels
   xcoord = xtemp                          # set initial position
   ycoord = ytemp
   do i=0,eval(ROWS-1) {                   # loop over rows of pixels
      iptr = istart + i
      do rowrpt=1,size {
 
         itemp = fntary(iptr)              # get current row
 
	 do j=0,eval(COLUMNS-1) {          # loop over columns in current row
 
	    itemp = divid (itemp, 2, m)    # m = current bit of char definition
					   #     0 - off, 1 - on
 
	    do colrpt=1,size {
	       qstate = .false.
	       if (m == 1)  {
	          if (qchang) {          # switch x & y back for bit setting
		     xparm = ycoord
		     yparm = xcoord
		     }
                  else {
		     xparm = xcoord
		     yparm = ycoord
		     }

	          call setbit (xparm, yparm, qvis)  # Turn pixel on
                  qstate =  ! qvis  # Determine if row is visible
	          }
 
	       if (qstate & ! qchang)  break  # Row is not visible, exit loop
               # update x,y for next pixel in row
               xcoord = xcoord + colinc
               }
            }
 
         # update x,y for next row
         xcoord = xtemp
         ycoord = ycoord + rowinc
         }
      }
 
   # update position for next character
   xtemp = xtemp + tmpwid
   }
 
return
end
subroutine dpprnt (icnt, pts)
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
#     Function: Fill polygon                                           #
#                                                                      #
#     Input Parameters:                                                #
#            icnt - number of points in polygon                        #
#            pts  - array of filled area vertices                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            ddint - compute intersection of lines                     #
#            ddsort - sort values in ascending order                   #
#            ddpat - fill horizontal line in specified pattern         #
#            reject - determine if a vector is in the current strip    #
#            dlprnt - draw a line on the printer                       #
########################################################################
define(`ROWSxFILL',4)
define(`COLSxFILL',8)
define(`SOLID',1)

integer icnt, pts(1)
integer xvert(50), xcount, i, j, k, currow, x1, y1, x2, y2
integer xint, yprev, temp, delta, first, qint, rowptr, rowbeg, rowcnt
integer ymin, ymax, xmin, xmax, index, idum, icntp1, start, end
integer pattrn(28)
integer mult, divid
logical qgone

integer ytop, ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /raster/ ytop, ybot, rasbuf

data pattrn /255, 255, 255, 255,   # solid pattern
              51,  51,  51,  51,   # vertical line
	       0,   0, 255, 255,   # horizontal line
	      51, 102, 204, 153,   # + 45 degrees
	     204, 102,  51, 153,   # - 45 degrees
	     170,  85, 170,  85,   # dithered
             255, 102, 255, 153/   # another dithered

# determine min and max x,y of polygon 
ymin = 32767
ymax = -32767
xmin = ymin
xmax = ymax

index = mult (2, icnt) - 1
for (i=1; i<=index; i=i+2 ) {
   temp = pts (i)              # get x-coordinate
   xmin = min0 (xmin, temp)    # check for min/max
   xmax = max0 (xmax, temp)
   temp = pts (i+1)            # get y-coordinate
   ymin = min0 (ymin, temp)    # check for min/max
   ymax = max0 (ymax, temp)
   }

call reject (xmin, ymin, xmax, ymax, qgone)  # Check trivial rejection
if (qgone) return

icntp1 = icnt + 1    # This value will be used often

temp = ndlntp   # Save the current line type and set to solid
ndlntp = 1

# Outline the polygon
x1 = pts(1)
y1 = pts(2)
for (i=3; i<=index; i=i+2)  {
   x2 = pts(i)
   y2 = pts(i+1)
   call dlprnt (x1, y1, x2, y2)
   x1 = x2
   y1 = y2
   }
call dlprnt (x1, y1, pts(1), pts(2))

ndlntp = temp  # Restore line type

if (ndfstl == HOLLOW ) return    # Do not fill if hollow

# set up pointer to fill pattern 
if (ndfstl == SOLID) {
   rowbeg = 1
   }
else {
   rowbeg = mult (ndflpt, 4) + 1
   }

# loop over rows from ybot to ytop 
end = min0(ytop, ymax)
start = max0(ybot, ymin)

index = divid (start,4,i) # Determine correct row of fill pattern to start with
rowcnt = i + 1
rowptr = rowbeg + i

for (currow=start; currow <= end; currow=currow+1) {

   xcount = 0      # initialize intersection count 
   first = -1      # initialize pointer to first edge with intersection 

   # loop over edges of polygon computing intersections with scan line 
   for (j=1; j <=icntp1; j=j+1) {
      temp = j                          # doing normal point 
      if (temp == icntp1) temp = first    # special - doing first intersec 
					 #   point for the second time    
      k = mult(temp, 2) - 1              # compute index in ptsin array   
      x1 = pts (k)                 # get first pt                   
      y1 = pts (k+1)
      if (temp == icnt) {            # doing last edge                
	 x2 = pts (1)                
	 y2 = pts (2)
	 }
      else {                             # not doing last edge            
	 x2 = pts (k+2)              
	 y2 = pts (k+3)
	 }
      
      call reject (x1, y1, x2, y2, qgone)  # Test if edge in strip

      if (! qgone )  {   # If in the strip
         call ddint (currow, x1, y1, x2, y2, qint, xint)  # intersection ? 

         if (qint == YES) {
	    delta = y2 - y1
	    if (delta > 0) {                # positive slope 
	       if (first < 0) {             # this is first intersection-used 
					    #   to initialize algorithm. It   
					    #   must be saved and run through 
					    #   a second time to get correct  
					    #   intersecton point.            
                  first = j
	          yprev = currow           # seed pt for algorithm           
	          qint = NO
	          }
               else {                       # not first intersection          
	          if (currow == yprev+1) yprev = currow # dir change - keep pt
	          else                   qint = NO      # don't keep pt       
	          }
               }
            else {                          # negative slope 
	       if (first < 0) {             # this is first intersection-used 
					    #   to initialize algorithm. It   
					    #   must be saved and run through 
					    #   a second time to get correct  
					    #   intersecton point.            
                  first = j
	          yprev = currow - 1       # seed pt for algorithm           
	          qint = NO
	          }
               else {                       # not first intersection          
	          if (currow == yprev) yprev = currow-1# dir change - keep pt
	          else                 qint = NO       # don't keep pt       
	          }
               }

            if (qint == YES) {              # intersection valid 
	       xcount = xcount + 1
	       xvert(xcount) = xint
	       }
            }  # intersection test
	 }  # Clipping test
      }   # end of loop over edges         

   call ddsort (xcount, xvert)               # sort x-vertices                

   # fill between pairs of vertices 

   for (j=1; j <= xcount; j =j+2) {
      i = xvert(j)
      idum = divid (i, 8, index)
      call ddpat (i, xvert(j+1), currow, pattrn(rowptr), index)
      }
   if (rowcnt < ROWSxFILL){ 
      rowcnt = rowcnt + 1
      rowptr = rowptr + 1       # move to next row of fill mask 
      }
   else {
      rowcnt = 1
      rowptr = rowbeg           # start row over again 
      }
   }   # End of a scan line 
return
end
subroutine ddsort (count, narray)
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
#     Function: Bubble sort integer array in ascending order           #
#                                                                      #
#     Input Parameters:                                                #
#            count - number of elements in array                       #
#            array - integer array to be sorted                        #
#                                                                      #
#     Output Parameters:                                               #
#            array - integer array in sorted order                     #
#                                                                      #
#     Routines Called:                                                 #
#            none                                                      #
#                                                                      #
########################################################################
integer count, narray(1)
integer i, j, k

   for (i = count; i > 1; i=i-1) {
      for (j = 1; j < i; j=j+1) {
         if (narray(j) > narray(j+1)) {   # switch pair of values 
	    k = narray(j)
	    narray(j) = narray(j+1)
	    narray(j+1) = k
	    }
         }
      }
   return
end
subroutine ddpat (x1, x2, y, pattrn, offset)
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
#     Function: Fill horizontal line in given pattern and current fill #
#               color                                                  #
#                                                                      #
#     Input Parameters:                                                #
#            x1,x2 - starting and ending x-coordinate of line to draw  #
#            y     - y-coordinate of horizontal line to draw           #
#            pattrn - pattern in which to draw line                    #
#            offset - offset of starting position in pattern           #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            setbit - turn on a bit in raster buffer                   #
########################################################################
integer x1, x2, y, pattrn, offset
integer itemp, x, i, index, colcnt
integer divid
logical qvis

colcnt = offset + 1
itemp = pattrn
for (i=1;i<=offset;i=i+1)  {
   itemp = divid(itemp, 2, index)
   }

for (x=x1; x<=x2; x=x+1) {
   itemp = divid (itemp, 2, index)  # See if pattern bit is set
   if (index != 0) call setbit (x, y, qvis)

   if (colcnt >= COLSxFILL)  {  # Need to reset the pattern
      colcnt = 0
      itemp = pattrn
      }
   colcnt = colcnt + 1
      
   }

return 
end
subroutine ddint (yscan, x1, y1, x2, y2, qint, xint)
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
#     Function: Determine intersection of scan line with polygon edge  #
#                                                                      #
#     Input Parameters:                                                #
#            yscan - horizontal scan line                              #
#            x1,y1 - first point of line                               #
#            x2,y2 - second point of line                              #
#     Output Parameters:                                               #
#            qint - 1 if lines intersect, else 0                       #
#            xint - x-coordinate of intersection                       #
#                                                                      #
#     Routines Called:                                                 #
#            none                                                      #
#                                                                      #
########################################################################
integer yscan, x1, y1, x2, y2, qint, xint

integer x, y, dx, dy, d, adx, ady, adx2, ady2, ytest
integer xtemp1, xtemp2, ytemp1, ytemp2, xend, temp, temp2, xincr
integer qchang
integer mult

qint = NO
xtemp1 = x1
xtemp2 = x2
ytemp1 = y1
ytemp2 = y2
 
dx = xtemp2 - xtemp1
dy = ytemp2 - ytemp1
if (dy == 0) return               # throw away horizontal lines 
temp  = yscan - ytemp1           # test if line crosses scan line 
temp2 = yscan - ytemp2
if (temp >= 0 & temp2 >= 0) {
   if (ytemp1 == yscan) {    # test for intersection at endpoints 
      xint = xtemp1
      qint = YES
      return
      }
   else if (ytemp2 == yscan) {
      xint = xtemp2
      qint = YES
      return
      }
   }
if (temp == temp2) return  # no intersection with scan line 

adx = iabs (dx)
ady = iabs (dy)
qchang = NO
 
if (ady > adx) {     # switch x and y if slope > 1 
   temp = xtemp1
   xtemp1 = ytemp1
   ytemp1 = temp
   temp = xtemp2
   xtemp2 = ytemp2
   ytemp2 = temp
   temp = adx
   adx = ady
   ady = temp
   qchang = YES
   }
 
adx2 = mult (adx, 2)
ady2 = mult (ady, 2)
temp = ady2 - adx2
 
# reverse step direction if delta x and delta y not in same direction 
xincr = 1
if ((isign(1, dx)) != (isign(1, dy))) xincr = -1
 
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
 
d = ady2 - adx              # Compute initial error 

while (x != xend) {      # loop until done with line 
   if (d < 0) {
      d = d + ady2
      }
   else {
      d = d + temp      # temp = ady2 - adx2 
      y = y + 1         # move up to next raster line 
      }

   x = x + xincr         # move over one pixel 

   # test for intersection 
   if (qchang == YES) {     # x & y switched 
      ytest = x
      xint = y
      }
   else {                   # x & y not switched 
      xint = x
      ytest = y
      }
   if (ytest == yscan) {    # report intersection pt 
      qint = YES
      return
      }
   } 
return
end
subroutine reject (x1, y1, x2, y2, qgone)
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
#     Function: Determine if a vector can be trivially clipped         #
#                                                                      #
#     Input Parameters:                                                #
#            x1, y1 - Starting postion of vector                       #
#            x2, y2 - Ending position of vector                        #
#                                                                      #
#     Output Parameters:                                               #
#            qgone - logical indicating that the point is outside      #
#                     printer swath                                    #
#                                                                      #
#     Routines Called:                                                 #
#            none                                                      #
########################################################################
integer x1, y1, x2, y2
logical qgone
integer itemp, itemp1, itemp2

integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

   qgone = .true.    # Start out by rejecting it
   itemp1 = y1
   itemp2 = y2

   if (itemp1 > itemp2)   {  # Need to sort the points
      itemp = itemp1
      itemp1 = itemp2
      itemp2 = itemp
      }

   # First see if either endpoint is in the scan area
   if (itemp1 >= ybot & itemp1 <= ytop)   qgone = .false.
   if (itemp2 >= ybot & itemp2 <= ytop)   qgone = .false.

   # Now see if line passes through the scan area
   if (itemp1 <= ybot & itemp2 >= ytop)   qgone = .false.
   return
end
E 1
