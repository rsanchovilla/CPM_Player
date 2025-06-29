;	NULUTERM.ASM	01/25/85
;
;	For NULU.COM Version 1.1
;
;	The NULU.DOC contains the information to patch NULU.COM
;	using DDT and the save command.  An easier way is to use
;	this routine and MLOADxx.COM.  Set the various items as
;	desired and assemble with ASM or MAC to obtain a hex file.
;	Then use MLOAD as follows:
;
;		MLOAD NEWFILE.COM=OLDFILE.COM,NULUTERM
;
;	NOTE: NULUTERM is the hex file NULUTERM.HEX.  The file
;	type extension is not necessary.
;
;		Keith W. Antcliff
;		P.O. Box 906
;		Mead, WA 99021
;		Northwest GodBout/CompuPro RCP/M (509) 624-6799
;		S.M.U.G. (509) 624-7321
;
; **************************************************************
; * 01/25/85	Revised for Version 1.1 (kwa)                  *
; * 12/02/84	Added EQU's for Patch ORG's (kwa)              *
; **************************************************************
;
;	See NULU.DOC for further information on the following values.
;
;
true	equ	01h
false	equ	00h
;
patch1	equ	00149h	;Z80 instructions, Number of Characters etc.
patch2	equ	0014eh	;Number of Open Files etc.
patch3	equ	00151h	;Number of Contiguous Drives and Users
patch4	equ	00187h	;Some Toggles and Storage Area
patch5	equ	01944h	;BDOS Vector
patch6	equ	01a60h	;Terminal Control Area
patch7	equ	01a83h	;Number of Lines for LST
patch8	equ	01a86h	;Printer Initialization Area
;

nl	equ	03	;Nesting Level for NCF files

	 org	patch1

	db	false	;Use Z80 instructions for Data Movement
	db	80	;Number of Characters each line can contain 
	db	80	;Number of Visible Characters/Line

	 org	patch2

	db	04h+nl	;Number of Open Files Allowed
	dw	0ch+nl	;Number of Relocatable Tasks

	 org	patch3

	db	4	;Number of Contiguously numbered drives
	db	16	;Number of Contiguous User Areas

	 org	patch4

	db	false	;NULU Read/Only
	db	false	;Exit like LU on command tail
	db	true	;BRIEF mode OFF
	db	true	;Allow ESC,RET from PROMPT etc.
	db	nl	;Nesting Level for NCF files
;
;	The following 39 bytes can be used to store any
;	valid NULU operators.  See NULU.DOC for details
;
	db	0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0
	db	0			;Terminator...Do Not Change

	 org	patch5

	dw	5	;BDOS vector (See Doc)
;
;	The following routines are for a Kaypro with highlighting.
;	Change to suit your terminal.  Use This Format:
;
;	ID byte,Number of Bytes,byte,byte,byte,byte,byte  ;7 bytes total
;	Do Not Change The ID Byte
;
	 org	patch6

	db	1,3,27,66,48,0,0		;Background Mode (Inverse ON)
	db	2,3,27,67,48,0,0		;Background Mode (Inverse OFF)
	db	3,3,27,66,48,0,0		;Underline ON (Inverse again)
	db	4,3,27,67,48,0,0		;Underline OFF
	db	6,1,26,0,0,0,0			;Clear Screen (1ah)

	 org	patch7

	db	57	;Number of lines/page for LST

;	Number of Bytes,byte,byte,byte,byte,byte,byte	;6 bytes total
;
	 org	patch8

	db	0,0,0,0,0,0		;Initialize Printer
ST

;	Number of Bytes,by