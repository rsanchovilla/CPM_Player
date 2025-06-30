
http://cpm8680.com/mix/index.htm



MIX C compiler for CP/M 80 - "A Class Act"

Parts of the following are condensed from the Les Bell and Associates  Languages and Software
Development Article originally written in 1984.

 Details about using the MIX C compiler for CP/M 80 are listed in the Mix C CP/M 80 Compiler version
2.1 Tools Manual. This is only a portion of the now out-of-print roughly 450 page manual which is
unfortunately not available in its entirety in an electronic format from this website.

 This compiler predates ANSII C and is a full implementation of the C language as described in K & R
(The C Programming Language, by Brian Kernighan and Dennis Ritchie).

 The compiler comprises a single program, apparently single pass, with a matching linker. It produces a
source code listing on the screen as it works. This is especially useful for the beginning programmer
as any errors are displayed in context with error numbers and even an arrow to the offending character
in the erroneous statement. Explanations of the error numbers are not printed until the end of the
listing, but many will be obvious in any case.

 The output of the compiler is a .MIX file which contains relocatable object code. This is passed to
the linker, which links it with the standard library to generate a .COM file

 An optional optimisation program (SPEEDUP.COM) can be passed over the object .MIX file to produce
worthwhile improvements in performance at minimal cost in file size.

 A similar optimiser called SHRINK.COM will provide space improvements. Alternatively, the run-time
code can be omitted from the generated .COM file to make it even smaller (it must then be loaded at
run-time from the RUNTIME.OVY file).

 The package provides an unusual way of managing the standard function library; rather than providing a
librarian, a program (CONVERT.COM) is used to convert the library into an ASCII file which can then be
edited and appended to. It can then be re-converted back into its binary form. The contents of the
library can be reviewed in the converted library file and by redirecting the output of CONVERT.COM from
screen to file. (In this case, doing so will partially compensate for the lack of a list of functions
in an electronic manual.)

 When it was offered for sale the MIX C compiler for CP/M 80 was comparable to other compilers at five
to ten times the price; a marketing approach that holds true in principle even today.

Mix C CP/M 80 Compiler version 2.1

 Dan Wallace has provided us with a manual for the tools that came with the Mix C CP/M 80 Compiler
version 2.1. Dan provided me with the disks that I created the images from in the first place then
painstakingly transcribed the entire tools section of his copy of the manual into a Word document which
I converted to the pdf below. Dan also has a header file on the Apple disk images and some extra
goodies are there as well as mentioned below. Thanks Dan for everything and getting me started on this,

Mix C CP/M 80 Compiler version 2.1 Tools Manual

Mix C 2.1 CP/M 80 is available for download at the following link:

http://www.cpm8680.com/mix/mix-c21.zip

 Unzip with directories intact.

 1. This zip file contains 4- Apple II CP/M Disk Images created using DSK2FILE on an Apple //e with a
Softcard Clone. You can use DSK2FILE or DISKMAKER.8 to recreate these on a real Apple //e.

 Disks 1-3 contain the MIX Compiler Version 2.1
 Disk 4 Contains the MIX Editor Version 1.1

 The MIX Editor is also available separately elsewhere on the internet and also available from here:.

http://www.cpm8680.com/mix/MIXED110.ZIP

 Some extra utilities and a ramdisk and other goodies are also included on the Apple disk images. Apple
II CP/M 80 users who program in C will find this quite well done.

 2. This zip file also contains a myz80 disk image of the compiler. A hello program is all that has
been added besides the original compiler files.

 Before running myz80 from the command line set the myz80 environment C.DSK=MIX21.DSK

 The point of the myz80 disk image is to use the compiler on a Windows machine or in an MS-DOS emulator
to quickly compile and test programs before transferring them to a real CP/M machine.

 3. The compiler is also included as individual files just as it is in the zip file for the older
version found elsewhere on the Internet and also available from here.

http://www.cpm8680.com/mix/mix-c20.zip

 You can use these to build your own disks for whatever CP/M 80 target you use.

 If you have a c128 or use WinVice you can build disk images using ctools.

 4. A manual for the compiler and tools is also included in pdf format. This is the manual from Dan
Wallace noted above.

<< Back to Top

>> Back to Main Page

Alternate Mix C 2.1 CP/M 80 Disk Images Including ASM Utility

 Freek Heite has provided us with five ADT diskette images from the original Mix diskettes and these
include the Mix ASM utility. None of these is bootable.

Available for download at the following link:

http://www.cpm8680.com/mix/mix-c21-max.zip

 Unzip with directories intact.

 1. The diskette images are:

 #1: Mix C - version 2.1.0 - CP/M - Apple II with Z80 - serial 2036070849783 - disk 1 of 3 - (C) 1985
Mix Software, Inc.

 #2: Mix C - version 2.1.0 - CP/M - Apple II with Z80 - disk 2 of 3 - (C) 1985 Mix Software, Inc.

 #3: Mix C - version 2.1.0 - CP/M - Apple II with Z80 - disk 3 of 3 - (C) 1985 Mix Software, Inc.

 #4: Mix Editor - version 1.1.0 - CP/M - Apple II with Z80 - serial 1036070852192 - (C) 1985 Mix
Software, Inc.

 #5: Mix Asm Utility - version 1.1.0 - CP/M 2.x or 3.0 - Apple II with Z80 - serial 5036030356074 - (C)
1985 Mix Software, Inc.

 2. Each diskette is also included as individual files in their respective subdirectories.

 3. A myz80 disk image is included called MAXMIX21.DSK.

 The point of the myz80 disk image is to use the compiler on a Windows machine or in an MS-DOS emulator
to quickly compile and test programs before transferring them to a real CP/M machine.

 Everything from these 5 diskette images has been placed together on the same disk so no disk swapping
is needed to use the compiler, the editor, or the ASM utility.

 The Mix Editor (from disk 4) has been set-up as an ASCII compatible editor using SETEDIT and the
SUBMIT files for the ASM utility (from disk 5) have been edited and the drive letters removed. The
READ.ME for the ASM utility has been renamed to ASM.ME and the READ.ME for the editor has been renamed
to EDIT.ME to avoid naming conflicts with the compiler READ.ME.

 To use this disk image, assuming you have downloaded Lee Bradley's myz80 tutorial (maxz80) from the
following link:

http://primepuzzle.com/mouse/maxz80.zip

 You can just place MAXMIX21.DSK and maxmix.bat in the maxz80 directory and run maxmix.bat from the
command prompt in the maxz80 directory. This will set-up MAXMIX21.DSK as your C: drive in myz80.