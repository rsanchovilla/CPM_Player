h43130
s 00479/00000/00000
d D 1.1 83/03/17 16:03:23 tes 1 0
c date and time created 83/03/17 16:03:23 by tes
e
u
4
U
t
T
I 1
subroutine outxy (xy)
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
#     Function: Encode an x y point into the display list              #
#                                                                      #
#     Input Parameters:                                                #
#           kx       - x-coordinate in 0 to device dependent space     #
#           ky       - y-coorindate in 0 to device dependent space     #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            outwrd - output a 16 integer to the object list           #
########################################################################
# local defines
integer xy(2)

   call outwrd (xy(1))
   call outwrd (xy(2))

   return
end
subroutine outint (ival1, ival2)
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
#     Function: Encode two byte integers into one word in the list     #
#                                                                      #
#     Input Parameters:                                                #
#           ival1    - integer value one                               #
#           ival2    - integer value two                               #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            mult   - multiply two 16 bit integers                     #
#            outwrd - output a 16 bit integer to the object list       # 
########################################################################
# local defines
integer ival1, ival2
integer i, mult


   # Put the two bytes into the display list such that they
   # can be accessed by assembler by putting the second byte as
   # most significant and putting them at word boundaries

   i = mult(ival2, 256) + ival1
   call outwrd (i)

   return
end
subroutine outwrd (ival)
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
#     Function: Place an integer word into the display list            #
#                                                                      #
#     Input Parameters:                                                #
#           ival     - integer value                                   #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#            cretfl - create the object list file                      #
#            writrc - write a block of the object list to a file       #
########################################################################
# local defines
integer ival

integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

   if (dispnt > DISPLAYxLISTxLENGTH)  {
      # The current object list is full, dump it
      if (pagcnt == 0)  {  # This is the first page, open a file
	 call cretfl
	 }
      call writrc (DISPLAYxLISTxLENGTH, objlst)

      pagcnt = pagcnt + 1  # Increment output page count
      dispnt = 1           # Reset pointer back to first item
      }

   objlst(dispnt) = ival     # Place integer in object list and update pointer
   dispnt = dispnt + 1

   return
end
subroutine getxy (xy)
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
#     Function: Decode an x y point into the display list              #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#           xy       - xy-coordinates in 0 to device dependent space   #
#                                                                      #
#     Routines Called:                                                 #
#          getwrd - get integer from the display list                  #
########################################################################
# local defines
integer xy(2)
integer getwrd, idum
 
   xy(1) = getwrd (idum)
   xy(2) = getwrd (idum)

   return
end
subroutine getint (ival1, ival2)
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
#     Function: Encode two byte integers into one word in the list     #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#           ival1    - integer value one                               #
#           ival2    - integer value two                               #
#                                                                      #
#     Routines Called:                                                 #
#          getwrd - get integer from the display list                  #
#          divid  - divid 2 16 bit integers                            #
########################################################################
# local defines
integer ival1, ival2
integer divid, getwrd, idum

   ival2 = divid (getwrd(idum), 256, ival1)

   return
end
integer function getwrd (idum)
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
#     Function: Return an integer from the object list                 #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#           getwrd   - integer value                                   #
#                                                                      #
#     Routines Called:                                                 #
#           readrc - read a block from the object list file            #
########################################################################
# local defines
integer idum

integer dispnt, pagcnt, primfg, objlst(DISPLAYxLISTxLENGTH)
integer ytop,ybot
SHORTINT rasbuf(RASTERxLENGTH)

include(`ddcom')

common /printr/ dispnt, pagcnt, primfg, objlst
common /raster/ ytop, ybot, rasbuf

   getwrd = objlst(dispnt)
   dispnt = dispnt + 1

   if (dispnt > DISPLAYxLISTxLENGTH)  {  # At end of buffer, read more
      call readrc (DISPLAYxLISTxLENGTH, objlst)
      pagcnt = pagcnt + 1
      dispnt = 1
      }

   return
end
define(`CREATExFILE',22)
define(`OPENxFILE',15)
define(`DELETExFILE',19)
define(`CLOSExFILE',16)
define(`READxSEQUENTIAL',20)
define(`WRITExSEQUENTIAL',21)
define(`SETxDMA',26)
subroutine cretfl
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
#     Function: Create a disk file                                     #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
integer gzbdos, ival

SHORTINT filcb(36)
common /spoolr/ filcb

   call setfcb
   call delfl
   ival = gzbdos (CREATExFILE, filcb)
   return
end
subroutine openfl
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
#     Function: Open a disk file                                       #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
integer gzbdos, ival
SHORTINT filcb(36)
common /spoolr/ filcb

   call setfcb
   ival = gzbdos (OPENxFILE, filcb)
   return
end
subroutine closfl
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
#     Function: Close the currently open file                          #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
integer gzbdos, ival
SHORTINT filcb(36)
common /spoolr/ filcb

   ival = gzbdos (CLOSExFILE, filcb)
   return
end
subroutine delfl
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
#     Function: Delete the currently open file                         #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
integer gzbdos, ival
SHORTINT filcb(36)
common /spoolr/ filcb

   ival = gzbdos (DELETExFILE, filcb)
   return
end
subroutine readrc (icnt, iarray)
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
#     Function: Read an object list buffer from the disk               #
#                                                                      #
#     Input Parameters:                                                #
#            icnt - number of integers to read                         #
#                                                                      #
#     Output Parameters:                                               #
#            iarray - array of integers read                           #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
integer icnt, iarray(1)
integer ibuf(64), count, i, ival, k, index, gzbdos

SHORTINT filcb(36)
common /spoolr/ filcb
   call setdma (SETxDMA, ibuf)
   count = icnt
   k = 0
   for (;count > 0;) {
      ival = gzbdos (READxSEQUENTIAL, filcb)
      do i=1,64 {  
	 index = k + i
	 iarray(index) = ibuf(i)
	 }
      k = k + 64
      count = count - 64
      }

   return
end
subroutine writrc (icnt, iarray)
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
#     Function: Write an object list buffer to the disk                #
#                                                                      #
#     Input Parameters:                                                #
#            icnt - number of integers to write                        #
#            iarray - array of integers write                          #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
integer icnt, iarray(1)
integer ibuf(64), count, i, ival, k, index, gzbdos

SHORTINT filcb(36)
common /spoolr/ filcb

   call setdma (SETxDMA, ibuf)
   count = icnt
   k = 0
   for (;count > 0;) {
      do i=1,64 {  
	 index = k + i
	 ibuf(i) = iarray(index)
	 }
      ival = gzbdos (WRITExSEQUENTIAL, filcb)
      k = k + 64
      count = count - 64
      }

   return
end
subroutine setfcb
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
#     Function: Initialize the file control block                      #
#                                                                      #
#     Input Parameters:                                                #
#            none                                                      #
#                                                                      #
#     Output Parameters:                                               #
#            none                                                      #
#                                                                      #
#     Routines Called:                                                 #
#                                                                      #
########################################################################
SHORTINT filnam(36)
integer i

SHORTINT filcb(36)
common /spoolr/ filcb

# File name contrl block
data filnam /NUL,BIGR,BIGO,BIGL,BIGL,BIGO,BIGU,BIGT,SPACE,BIGT,BIGM,BIGP,
	     NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,
             NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL/

   do i = 1, 36  {
      filcb(i) = filnam(i)
      }
   return
end
E 1
