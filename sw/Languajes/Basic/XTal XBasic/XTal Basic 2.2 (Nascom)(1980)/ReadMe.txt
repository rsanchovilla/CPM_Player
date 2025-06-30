NASCOM XTAL XBASIC 2.2 Ported to CP/M 

By Roberto Sancho - Jan 2020

Changes
- replaces NASSYS calls with CP/M calls
- NAS command exit to cp/m
- CLOAD FILENAME - load a basic program
- CSAVE FILENAME - save a file

No extension is added to FILENAME. You can add one freely
Basic program is saved as binary file, not as ascii

Files 

XTAL.NAS -> original xbasic file for nascom
XTAL.ASM -> disassembled (somewhat anotated)
XBAS.ASM -> CP/M port 

XTal basic 3.1C for CP/M deprecates the following commands_

	CLOAD	CSAVE	EDIT	NAS

New in XBasic 3.1 commands 

	APPEND	AUTO	CHAIN	CLOSE	CLS	CMD$	CREATE
	DEEK	DEL	DIR	DOKE	DRIVE	ELSE	EOF
	ERA	ERL	EVAL	FMT	HEX$	HOLD	IOM
	LN	LOAD	LOCK	MGE	MOD	MON	MUL$
	NULL	OFF	OPEN	POINT	PTR	REN	RENUM
	RESET	SAVE	SCRN$	SEP	SET	SWAP	UNLOCK
	VERIFY	WIDTH	ZONE

New in XBasic 4.2 (Tatung Einstein TC-01)

	Does not run on CP/M because accessed directly to Video HW
	and recalls on MOS operating system

	MUSIC 	DRAW	TCOL	GCOL	BCOL	SPRITE	MAG
	SHAPE	ORIG	ELIPSE	DOS	RAD(	DEG(	POLY
	FILL	VPOKE	VPEEK(	VDOKE	VDEEK(	BEEP	BIN$(
	RST		

New in XBasic 5.02 (Tatung Einstein TC-01)

	REPEAT	UNTL	WHILE	WEND


