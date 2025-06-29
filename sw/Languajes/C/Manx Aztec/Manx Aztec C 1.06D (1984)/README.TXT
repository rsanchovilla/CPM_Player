This  disk  contains files which correct several problems in  the 
Aztec  CII v1.05 software for CP/M.  Replacing files on a  v1.05A 
through  1.05F release of AZTEC C II with the files on this  disk 
will bring the system up to release 1.05G.  The problems, and the 
files affected are listed below:

1. There were several problems with the submit files.
   Files  affected:   makelibc.sub,  makemath.sub,  makezlib.sub, 
   softmath.sub, softlibc.sub.

2. The  module  'fopen' didn't position the file correctly  when 
   opening for 'append'.
   Files affected: fopen.c

3. libutil header message was incorrect.
   Files affected: libutil.c, libutil.com.
   Due  to  space limitations,  only libutil.c is on  the  update 
   disk. You'll have to compile, assemble, and link it yourself.

4. division of a float or double by itself didn't equal one.
   Files affected: fsubs.asm.

5. I/O   routines   in  softlibc.rel  didn't  work   when   using 
   Microsoft's M80 and L80 programs.
   Files affected: open.c, softlibc.rel, libc.lib .

6. overlays didn't work for some cases.
   Files   affected:    ovloader.c,    ovbgn.asm,   supp8080.asm, 
   suppz80.asm, libc.lib, ln.com.

7. port.ual had assembly errors.
   Files affected: port.ual.

8. Subtracting a constant from a pointer didn't work.
   Files affected: cii.com, czii.com.

9. #asm/#endasm did not work.

The linker,  ln.com,  and the overlay linker, ovln.com, have been 
merged  into  one program,  ln.com.  The ln.com which is  on  the 
update disk is the merged linker.  Use it to link a normal '.com' 
file as you would the old linker,  ln.com.  Use it to link a root 
segment  or  an  overlay segment as you  would  the  old  overlay 
linker, ovln.com.

There are several caveats if you are using overlays.  First,  the 
'settop'  function  must be called with an argument  whose  value 
is  set equal to the size of the largest overlay segment,  or the 
length  of the longest thread if overlays are nested.  This  call 
must  be  initiated at the beginning of the main  routine  before 
calling  any other routines.  The size of an overlay is displayed 
on the console,  in hex,  when it's linked.  For example, if your 
program  uses  3 overlays,  and the linker says their  sizes  are 
125ah,  236h,  and 837h,  then it should make the following call: 
settop(0x125a).  The  parameter  to settop could  be  larger,  if 
desired.

Second,  If  buffered I/O is used in an overlay segment at  least 
one  buffered  I/O  call  must exist in the  root.  This  can  be 
accomplished  by calling the 'printf' routine in the  root.  Note 
that  it is not necessary that the call to 'printf' be  executed, 
only  that it be present.  This will insure that the link  editor 
will include the buffered I/O tables in the root segment. 

The  section on overlays in the manual incorrectly states that an 
overlay function can have any name. The overlay file can have any 
name (but it's extent must be 'ovr'). Also, the main module in an 
overlay  must be named 'ovmain'.  The example on pages  XI.4  and 
XI.5 should describe the two overlays as follows:

   Here is ovly1:

   ovmain(a)
   char *a;
   {
          printf("in ovly1. %s\n",a);
          return 1;
   }

   Here is ovly2:

   ovmain(a)
   char *a;
   {
          printf("in ovly2. %s\n",a);
          return 2;
   }

Overlays can be nested,  contrary to what the overlay section  of 
the manual states. If one overlay is to call another, the command 
line to the linkage editor for the first overlay must specify the 
dash r option, "-r". This will cause LN to generate a '.rsm' file 
for the first overlay.  This '.rsm' file must then be included in 
the command line to the nested overlay.  Also,  each overlay must 
include the module 'ovbgn.o'. Overlays can be nested to any level 
as long as the "-r" option is included on each link edit and  the 
".rsm"  file of the calling overlay segment is included in the LN 
parameter  list for the link edit of the called overlay  segment. 
The "-r" option need not be specified for the last segment of any 
one  overlay  path.  Extreme caution should be used in  using  an 
overlay segment in more than one path.  Although this is possible 
to do, there is an enormous potential for error.

For  example,  here are three nested segments:  a  root  segment, 
root,  and  two  overlay segments,  ovly1 and ovly2.  root  calls 
ovly1; ovly1 calls ovly2; ovly2 just returns.

Here is the root:

   main()

   { 
    settop(0x13aa);

    ovloader("ovly1"); 

    return; 
   
   }

Here is ovly1:

   ovly1() { ovloader("ovly2"); return;}

Here is ovly2:

   ovly2() { return;}

The following commands will link these three segments:

   ln -r root.o ovloader.o libc.lib
   ln -r ovly1.o ovbgn.o root.rsm libc.lib
   ln    ovly2.o ovbgn.o ovly1.rsm libc.lib

This  example  illustrates  only  one  overlay  path.  In  actual 
practice, there would usually be more than one path. 


This  example  illustrates  onl