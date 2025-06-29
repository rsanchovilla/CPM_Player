
Special Reminder:  ARK runs ONLY  on Z80 systems.  No support is
                   planned for 8080 or 8085 systems.

            NOTE:  Filesnames ending with "P" are changed from "+"
                   which is an illegal character for filenames for
                   MS-DOS users.  The whole idea of .ARK files is
                   to make CP/M files compatible with MS-DOS, but
                   with adequate identification between them.


Usage:

     ARK [-bksw] <archive> <file1> . . . <filen>

     -b        retain backup of .ARK
     -k        force crunching
     -s        force no compression
     -w        supress warning messages

     <archive> = name of archive file (default type = .ARK)
     <filex>   = file to be added to archive (wildcards ok)

     ARK  presently  supports  three  types  of  members:  type 2
(uncompressed), type 3 (NCR encoding - 'packed'), and also type 8
(Lempel-Ziv-Welch  encoding - 'crunched').  ARK will  choose  the
most efficent method of compression and save the file using  that
format.

     NOTE:  ARK does not support Phil Katz type 9 (squashed).

     In  general, the command  you will use  to do  most  of your
archiving will be:

               A>ARK d:archive e:*.*

     Note  that  ARK will either add  or replace  members  of the
archive, so  you do not  need  to specify  that it  is an update.
(This example makes (or adds to) D:ARCHIVE all the files on E:.)

     On  systems  supporting the BDOS T_GET  (105)  call,  (which
includes  Z80DOS, Turbo-DOS, MP/M, and I think CP/M+),  the  time
and date of each member in the archive is set to the current time
and  date.  On other systems, the date is defined by the bytes at
103h-107h as YYMMDDHHMMM.  A future version of ARK will allow for
systems that support actual date-stamps (Z80DOS and DateStamper).

     Please  send  your  problems  or  comments  (please  include
version number information!) to:


          Brian Moore              or GEMAIL to B.E.MOORE
          1550 High Street, #2
          Eugene, OR 97401
          (503) 687-8531 [voice]
