

Tiny Pascal NorthStar


Introduction
------------

Tiny Pascal is the inspiration for TinyPascal for TRS80
It runs on a nothrStar Horizon with DOS 5.2.
This is a port from to CP/M.

 Turbo Pascal Genealogy 	Year	System

 Tiny Pascal Basic		1978	NorthStar Horizon
 Tiny Pascal 1.0		1980	TRS80 Model 1
 BLS Pascal Version 1.0	  	1981	NasCom
 BLS Pascal Version 1.2         1981	NasCom (Same as Nascom Pascal 2.0)
 BLS Pascal Version 1.3	  	1982	NasCom
 COMPAS V1.0 			1982	CP/M
 COMPAS V2.10 			1983	CP/M
 COMPAS V2.20 			1983	CP/M
 COMPAS V3.02 			1983	CP/M
 Turbo pascal 1.0               1983	CP/M, MSDOS, CPM86
 Turbo pascal 2.00              1984	CP/M, MSDOS, CPM86
 Turbo pascal 3.00              1985	CP/M, MSDOS, CPM86
 Turbo pascal 3.01A             1985	CP/M, MSDOS, CPM86
 PolyPascal-80 V3.10 		1985	CP/M, MSDOS, CPM86
 Turbo Pascal 4.0		1987	MSDOS
 Turbo Pascal 5.0		1988	MSDOS
 Turbo Pascal 5.5		1989	MSDOS
 Turbo Pascal 6.0		1990	MSDOS
 Turbo Pascal for Windows 1.0   1991	Win16
 Turbo Pascal for Windows 1.5   1991	Win16
 Borland Pascal 7.0		1992	MSDOS, Win16
 Delphi 1.0                     1995    Win16
 Delphi 2.0                     1996    Win32
 Delphi 3.0                     1997    Win32
 Delphi 4.0                     1998    Win32
 Delphi 5.0                     1999    Win32
 
 

Terminal definition
-------------------

Tiny Pascal does not uses any terminal escape control sequences


Tiny Pascal Basic ported to CP/M
--------------------------------

Tiny Pascal Basic is a NorthStart Basic 6 program published in
Sep/Oct/Nov 1978 issues of Byte Magazine. Original

Folder NorthStar DOS tiny_pascal contains original files for NorthStar.

Example sesion

	A>NS5BAS      <-- Load NothStar Basic for CP/M
	welcome mesage
	MEMSET 45056  <-- Set hight mem usage for basic at $B000 (see mem amap)
        LOAD PASCOMP  <-- Load PASCOMP.NBP compiler basic program file
        RUN
         'TINY' PASCAL COMPILER FOR P-MACHINE
            CLEAR P-CODE AREA?    <-- Y to set C000-E000 to 0
            WANT CODE PRINTED? Y  <-- print on screen PCodes generated
   	?$HOLA.PAS                <-- compile HOLA.PAS (instead you can 
                                      type source code)
	   0 BEGIN
	   0  JMP     0     0
	   1    WRITE('Hola');
	 ADD AT 0 CHANGED TO 1
	   1  INT     0     3
	   2  LIT     0    72
	   3  LIT     0   111
	   4  LIT     0   108
	   5  LIT     0    97
	   6  LIT     0     4
	   7  CSP     0     8
	   8 END. 
	   8  OPR     0     0

	   PSIZE OF P-CODES: 1 BLOCKS

	 EXIT (E), INTERPRET (I) OR TRANSLATE (T)? <-- Type E to return
           to CP/M, I to generate PCODE file PROG.P, or T to generate
           PROG.BIN program in 8080 machine languaje. 

If I choosed (Interpret)

	 GENERATE PROG.P FILE	<-- writes to disk PROG.P with compiled
 				    pascal program (to PCodes)
	 LOADING INTERPRETER ...
	NOW EXECUTE: A>PASRUN1A.COM PROG.P  <-- and then quits to CP/M
	
	A>PASRUN1A PROG.P	<-- executes PCODE with intepreter
				    PINT.PAS compiled, that is a 
				    PCode debuger	
	  0  JMP   0,1
	>G			<-- G=Execute program. See PINT.TXT for
	Hola   			    PINT commands
	A>

If T choosed (Translate)

	 LOADING TRANSLATOR	<-- needs awhile. CHAIN to PASTRANS.NBP
				    basic program

	INITIALIZING 8080 TRANSLATOR
	*** P-CODE TO 8080 TRANSLATION ***
	 HEX ADDRESS OF 8080 RUNTIME CODE (<CR>=1A00): <-- type <CR> to use
	 HEX ADDRESS OF TINY PASCAL PCODE (<CR>=C000):     default values
	 HEX ADDRESS OF 8080 PROGRAM CODE (<CR>=B000): 
	 STACK START ADDR.(<CR>=A000):
	 DEFAULT END STACK ADDRESSES USED (AFFF)
	 1 REFERENCES
	 1 ACTUAL LABELS

	   0  B009 09 0F 15 1B 21 27 2D 18 1B 
	   0 FORWARD REFERENCES
	 P-CODE.. 9 INSTRUCTIONS
	 8080.. 27 BYTES
	P-CODE:8080 = .75
	* END TRANSLATION *
	GENERATE PROG.BIN FILE (8080 CODE)	<-- writes on disk compiled
						    PCode program (to 8080 code)
	LOADING PASLOADER		<-- CHAIN to PASLOAD.NBP	
	LOAD PASRUN1A.COM
	LOAD PROG.BIN FILE (8080 CODE)
	GENERATE PROG.COM FILE    	<-- Build PROG.COM=PASRUN1A.COM+PROG.BIN
					    (one byte flag changed when loading PASRUN1A)
	NOW EXECUTE: A>PROG.COM 	<-- and then quits to CP/M
	
	A>PROG		<-- executes PCODE translated
	Hola   			    
	A>

No editor. PROG.P contains the compiled pascal program using PCode, PROG.BIN is 
the PCode ranslated to 8080 (needs pasrun1a.com to run)

PASRUN1A.COM contains
	- the bootstrap code to load the file given as parameter
	- the PINT interpreter compiled to 8080 code (PINT.BIN)
	- the runtime for PCode translated to 8080 at $1A00
	- pathches to run in CP/M

TINYPAS memory map:

        0100 - 4200: NS5BAS.COM basic interpreter
        4201 - AFFF: basic program+variables
        B000 - E000: PCode translated to 8080
        C000 - E000: PCode 

TINYPAS PCode program in execution memory map:

        0100 - 20FF: pasrun1.com 
        2100 - AFFF: PCODE program loaded from given parameter filename
        B000 - E000: Interpreter compiled to 8080 (PINT.BIN)

TINYPAS 8080 program in execution memory map:

        0100 - 20FF: pasrun1.com 
        B000 - E000: program compiled to 8080 in execution

PCode stack stack grows form end of PCode upwards to end of TPA (no check). Max 
size for runtime pcode stack: $1000



Example programs
----------------

Some example programs are provided:

	HOLA.PAS 	simple test program Hello World
	PINT.PAS	Source for PCode interpreter-debuger
	HANOI.PAS	Original sample program

source code
-----------

	tiny_pascal_run_1A00.bin		Original TINY PASCAL runtime
	tiny_pascal_Z80_runtime_1A00.asm	Original TINY PASCAL runtime disassembled
						(using Z80 mnemonics)
	PINT.BIN	PINT.PAS compiled to 8080 (PROG.BIN remamed to PINT.BIN)
	pasrun1a.asm	Source code for Tiny Pascal CP/M port runtime loader
	PASCOMP.bas	Plain ascii text basic program: Pascal compiler to PCode
	PASTRANS.bas	Plain ascii text basic program: Pascal tranlator PCode to 8080
	PASLOAD.bas	Plain ascii text basic program: build PROG.COM
	
	
Other files
-----------

NS5BAS.COM		NorthStar Basic interpreter
PASCOMP.NBP		Tokenized basic program: Pascal compiler to PCode
PASTRANS.NBP		Tokenized basic program: Pascal tranlator PCode to 8080
PASLOAD.NBP		Tokenized basic program: build PROG.COM
PINT.TXT		Pascal Interpreter commands (from pcode.pdf)
pcode.pdf		Original BYTE issues Sep/Oct/Nov 1978 article by Dr Chung with first 
                        TinyPascal implementation in Basic



