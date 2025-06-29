
FS1-T80 is subLOGIC Flight Simulator I for TRS-80, cassette version
(C) Bruce Artwick 1979

It has been ported to run on vanilla CP/M with a WaveMate 
Terminal-125 TV Video card.

This card offers 64 columns x 32 lines of text, with same character
set as TRS-80 level 1, memory mapped at address $C000. This allows
a graphic resolution of 128x96 pixels

To run, FS1 must be patched:
- To use video ram at $C000
- to use CP/M for reading keyboard and simple character I/O
- to allow it to be loaded as a regular .COM file
- To use vertical resolution of 96 pixels (32 lines) instead of
  TRS-80 vertical resolution (48 pixels, 16 lines)
- remap keys to a regular CP/M keyboard

Also a simple welcome screen has been added that allows to chose

	1) the default takeoff position
	2) a landing approach 
	3) a high altitude flight to see the whole 3D world. 

The welcome screen will wait for 25 sec, and will start takeoff 
regular scenario if no option is selected.

The keyboard setting are

	^C 	quit to CP/M .

	6	rudder right
	5	center rudder 
	4	rudder left
	8	yoke up to dive
	2	yoke down to climb

	9	increment throttle power
	3	decrement throttle power
	k	wheel breaks (when landed)

	w	Declare War
	Space	Fire guns (war must be declared)
	b	Bomb drop (war must be declared)

	m	map/radar view
	f	forward view
	
	u	up view (delail level = scenary)
	d	down view (delail level = airfield runway)

	0	reset flight

These keys are stated in top left corner of screen, and in the bottom line

This port is based on the two available ports to sorcerer 
(see https://www.classic-computers.org.nz/blog/2017-01-23-software-for-real-sorcerers.htm
and https://forum.vcfed.org/index.php?threads/fs1-for-exidy-sorcerer.1237688/)

files in original folder

fs1.cas		is the original TRS-80 program (cassette version). Loads in TRS80gr emulator
fs1trs80.bin	binary dump of above program (starts at $4000)
fs1trs80.asm	disassembly of above program (program entry point at $435d)
FS1d.zip	Port to Exidy Sorcerer (from vcfed). Runs in exidy sorcerer emulator
FS1SOR.BIN	binary dump of above program (starts at $4000)
FS1SOR.ASM	disassembly of above program (program entry point at $7500)

The file FS1SOR.BIN is read and patched again to be run as .COM for Terminal-125
To generate FS1.COM, execute 00_PATCH_FS1.SUB in patch\ folder
on CPM Player emulator

If FS1 program is started with an X as command line:

	A>FS1 X

the program is set up for a ficcional vector generator for 3D scenary
not realistic but very cool, showing the simulator at its best.

The vector generator draws 3D scenary a resolution of 200x212 pixels, 
instead of original TRS-80 resolution (98x40) or the regular Term-125 
resolution (98x80)


