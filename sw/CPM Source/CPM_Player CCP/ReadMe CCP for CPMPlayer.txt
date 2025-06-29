
CCP used in CP/M Player

Based on CCP from CP/M 2.2

Changes

- Works as regular .COM loading at $0100
- On executing
	- Prints wellcome message
	- relocates at $e700 - $ef1e
	- registers on CP/M player 
	- jumps to $e700 to start CP/M on current drive
- Comand line has an additional internal command, EXIT that
	-Deregister CCP from CP/M Player
	-exist CCP with JP $0000

A CP/M program can be ended in the following ways:

	1 - JP 0000 -> BIOS BOOT
	2 - LD C,0  
	    JP 0005 -> BDOS BOOT
	3 - LD C,1
	    JP 0005 -> BDOS WBOOT
	4 - LD C,6
	    CALL 0005 -> READ LINE and pressing ^C
	5 - RET without changing SP -> return to CCP

On CCP registration, CP/M Player intercept end forms 1-4 and
then reload CCP on memory and jp $e700 to return to A> prompt

The memory map of CPM Player is

The CCP resides in E700 - EF1E, that is compatible with the layouts of mem.
CCP must not use F000-FFFF. If it does, Osborne mode will overwrite program
memory with video ram

	End of TPA: 
		Normal mode: FD00
		Kaypro mode: E400
		Osborne mode: CB00, video ram at F000-FFFF
		IMSAI VIO: E000, video ram at F000-FFFF
		Cromenco Dazzler: E000, video ram at F000-FFFF (but can be chaged by prog)


	