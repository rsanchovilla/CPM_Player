DDTZ is an improved replacement for DDT.  DDTZ is more friendly,
handles Z80 and 64180 coding,  and has an  extended command set.
See DDTZ.DOC.

	DDTZ now uses MSDOS Debug compatible commands

	OPCODES.TRY has a complete set of Z80/64180 instructions.
	To examine, do "DDTZ opcodes.try" and disassemble with U.

	.CPM files should be rename to .COM for CPM execution.

Files in this library are all datestamped and checksummed.  To
verify do "ccitcrc *.*" and expect a "00 00" FIRST checksum.  LDIR
(my version) can display the datestamps, and LSETDATE can set them.

All .COM files herein will execute under CPM80, DOS+, or under MS/PCDOS
using either V20-80 or Z80EMU.  V20-80 requires extensions be renamed
to .CPM. I recommend patching Z80EMU to do the same (The string ".COM"
is isolated, and near a similar string ".HEX" in Z80EMU).

I have discovered that sysops have deleted the source when posting
this library.  I would prefer this NOT be done.  The source is the
ultimate documentation, and I am proud of it.  

DDTZ and its associated files and documentation are
          copyright (c) 1980-1988 by:
          C.B.  Falconer, 680 Hartford Tpk, Hamden, Conn. 06517
          (203) 281-1438       All rights reserved.
They may be freely copied and used for non-commercial purposes only.
Contributions are welcomed.
՟