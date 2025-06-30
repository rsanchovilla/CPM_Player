		How to Load Tarbell BASIC

If you have Tarbell BASIC on a CP/M disk, simply put the disk
into the drive, and type TBASIC.

If you have Tarbell BASIC on cassette (Tarbell, of course),
first examine the listing of the I/O section in Appendix E
of the Tarbell BASIC manual.  

Compare the console and cassette I/O routines to the ones you 
normally use in your system, to determine if there are any 
differences.  If there are, mark the necessary changes on
the listing.

Using either the bootstrap program or input program in the
Tarbell cassette interface manual, or the Read-Only-Memory
Program, or other monitor, read the Tarbell BASIC interpreter
from the cassette into your main memory, using the starting
address and length which is specified on the cassette.

If you need to make changes in the I/O section, now is the
time to do it, using either your front panel DEPOSIT button
or suitable monitor in ROM.  Note that the top of memory
address which is put into location SSSS is done automatically
in CP/M systems, but may need changing for other systems.

Start your computer running at the starting address specified
on the cassette, by doing an examine and run at that location,
or by using your ROM monitor to jump to it.

You should now get the opening message.


















				J













