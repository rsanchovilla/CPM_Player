;	TITLE	'CONSTRL - Console Control Assembly Module.'

true	equ	1
false	equ	0

;****************************************************************************

; CONSTRL - Console Control Assembly Module.
;		80-08-06, SORCIM.

; Patching of this deck should only be done if CONFIG.pas
;  is unable to patch for your terminal.


; CONSTRL This deck contains all the console device
; dependent code.  All addresses up thru and including
; the cursor motion table must be maintained in this
; deck as each user configures it for his/her own
; device.  The CONSTRL region begins at 180h and can
; extend up thru 2BFh.
; Refer to section 20.4 in your PASCAL/M (tm) manual
; for directions on using CONSTRL if necessary.
;
; As released, this deck is set up to be acceptable
; to the CP/M (tm) ASM assembler.  The user should use
; this source code as a guide to adapt to whatever
; assembler is available.
;
; The configuration herein is for a "Dummy"
; terminal to aid the user in constructing a CONSTRL
; configured for his actual device.
; Installer is urged to consult the manual for the
; specific terminal to be employed before beginning
; the process.
;
; (81-04-07)	***** Re-simplified for use with CONFIG.pas program.
;		Removed conditional assembly. Shortened. 
;		Should only be used as a last resort if CONFIG is
;		insufficient for use.

ESC	EQU	27		;ASCII ESCape (for convienience)

;	External addresses for this release package.
;	(Not changeable by user).
CONORG	EQU	180h		;FIXED orgin
INPSC	EQU	CONORG-6	;Get(KEYBOARD); A:=(KEYBOARD^)
;				;Transparent read, no echo.
;				;Exit A= Char, uses all.
OUTSC	EQU	INPSC+3		;OUTPUT^:=A; Put(OUTPUT)
;				;Transparent write to crt.
;				;Entry A= Char, uses all.

	ORG	CONORG	;Fixed address

;	Jump vector for all PASCAL callable functions
RDXY:	JMP	RDCXY
WTXY:	JMP	SETXY
GETTD:	JMP	GDATM	;Get date and time

;	Define dimensions of character output devices.
;	These are the values returned by the SCREEN intrinsic
;	function.
;	Console dimensions
NOLNES:	DB	24	;Maximum lines on terminal
NOCOLS:	DB	80	;Maximum columns on terminal

;	Printer dimensions
NOPLN:	DB	62	;Maximum lines per page
NOPCOL:	DB	80	;Maximum columns per line

;CCCHR: char to echo to console for unknown control-char (0..20h)
CCCHR:	DB	'?'

;CEOFC:	Character to be used for End-of-FILE from terminal.
;       NOTE: it most cases this should be a ^Z to be compatible
;       with CPM, an obvious exception is an ADDs terminal.
CEOFC:	DB	'Z'-40h

;	Machine clock period factor.
;	Used by PRUN to determine delay times.
;	(1 MHz = 1000 KHz)
;	Value= (Clock Frequency/1000) div 25
;Examp	Freq	Period	Value
;	5000	200ns	200
;	4000	250ns	160	Z80A
;	2765	360ns	111	8085A
;	2174	460ns	87	8080A
;	2000	500ns	80	Z80
;	1230	820ns	49	8080
FREQ	EQU	4000	;Frequency in KiloHertz			***new***
SCLFRE:	DB	FREQ/25	;Scaled frequency value

;	Data port definition for AMD9511;
;	Status port must be = Data port + 1.
AMDP:	DB	18h	;Altos AMD data port

LL:	DB	0	;always 0
LLN:	DB	'PASLIB  PCO',0


;	Tables for character movement processor.
;
;	Any configuration will have two tables:
;
;  *** This is a normally a fixed table. ***
;	(1) -- String address table:
;	       First byte is (number of entries).
;	       Succeeding bytes are word entries, the number of
;	       which is defined by the first byte of the table.
;	       Each word entry is the address of a control string
;	       corresponding to the particular CONACT function
;	       whose value equates to the ordinal value of the
;	       entry's position in the table.
;	       ie. conact(0) uses first entry, conact(4) uses 5th, etc.
;
; *** This is normally padded to 4 bytes. ***
;	(2) -- String table:
;	       Strings of bytes pointed to by the above table,
;	       each of which consists of a length byte,
;	       followed by a series of data bytes, the number
;	       of which is determined by the length byte.
;	    -> If the most-significant bit of any data byte is set,
;	       then the lower 7 bits are interpreted as a delay
;	       factor, which when multiplied by 10 gives the delay
;	       period in milliseconds.
;	    -> If the most-significant bit is zero, then the data
;	       value is output directly to the user's terminal.

;	Following is a common address table.

CONATB:				;string address table
	DB	19		;<-- number of entries supported
				;
	DW	HOMEC		;addr of Home-Clear string
	DW	CLNE1		;addr of Clear Line string
	DW	MUP		;addr of Move Up string
	DW	MDWN		;addr of Move Down string
	DW	MLEF		;addr of Move Left string
	DW	MRIG		;addr of Move Right string
	DW	MDEL		;addr of Character Delete string
	DW	MINS		;addr of Character Insert string

; CONACT function entries below are user-defined.
; Standardization will be defined via user requests.
;
	DW	HOME		;Home Cursor to (0,0)
	DW	SINV		;Set Inverse Video
	DW	CINV		;Clear Inverse Video
	DW	LKEYB		;Lock Keyboard
	DW	ULKYB		;Unlock Keyboard
	DW	INSLN		;Insert Line
	DW	DELLN		;Delete Line
	DW	MSUSC		;Set underscore
	DW	MCUSC		;Clear underscore
	DW	MSHIC		;Set half intensity
	DW	MCHIC		;Clear half intensity

;
; --> (more entries could be added here)

; Following is the terminal-specific string table

; The Following is a "Dummy" configuration for
;  modification by the user as a last resort.
HOMEC:	DB	2, '^'-40h, 'Z'-40h, 0, 0
CLNE1:	DB	2, ESC    , 'T',     0, 0
MUP:	DB	1, 'K'-40h, 0,       0, 0
MDWN:	DB	1, 'J'-40h, 0,       0, 0
MLEF:	DB	1, 'H'-40h, 0,       0, 0
MRIG:	DB	1, 'L'-40h, 0,       0, 0
MDEL:	DB	2, ESC    , 'W',     0, 0
MINS:	DB	2, ESC    , 'Q',     0, 0
HOME:	DB	1, '^'-40h, 0,       0, 0
SINV:	DB	2, ESC    , 'j',     0, 0
CINV:	DB	2, ESC    , 'k',     0, 0
LKEYB:	DB	2, ESC    , '#',     0, 0
ULKYB:	DB	2, ESC    , '"',     0, 0
INSLN:	DB	2, ESC    , 'E',     0, 0
DELLN:	DB	2, ESC    , 'R',     0, 0
MSUSC:	DB	2, ESC    , 'l',     0, 0
MCUSC:	DB	2, ESC    , 'm',     0, 0
MSHIC:	DB	2, ESC    , ')',     0, 0
MCHIC:	DB	2, ESC    , '(',     0, 0

;	END OF FIXED ADDRESS CODE AND DATA (224h)
;	All code following is local to your implementation
;	and is always referenced locally (ie PASCAL does not
;	make any direct references to the code).


	org	228h
RDCXY:	;Read X,Y postion
;	Entry	None.
;	Exit	D= Y+32
;		E= X+32
;	Uses	all.
;	Following code is supplied as a sample for terminals
;	supporting the reading of the cursor.
;	Upper left corner is = (0,0), or DE=2020h.
;	Note: If terminal returns absolute coordinates, they
;	must be biased by adding ' ' before exit.
;	X is Column, Y is Row.  Some terminals use (X,Y) order.
;		Code for TVI 912/920 and ADM 42.
;		Note the read & discard of CR following Y X.
;			the RET above can be patched out if
;			this code is appropriate to your crt.
	MVI	A,ESC
	CALL	OUTSC
	MVI	A,'?'
	CALL	OUTSC	;Inform terminal I want Y,X
	CALL	INPSC	;read Y+32
	PUSH	PSW
	CALL	INPSC	;read X+32
	POP	D
	MOV	E,A
	PUSH	D
	CALL	INPSC	;read CR and discard
	POP	D
	RET		;D=Y+32, E=X+32

	org	258h
SETXY:	;set X,Y position of cursor
;	Entry	D= Y+32
;		E= X+32
;	Exit	None.
;	Uses	all.
	PUSH	D
	MVI	A,ESC
	CALL	OUTSC
	MVI	A,'='	;for ADM, TVI & SOROC
	CALL	OUTSC
	POP	D
	MOV	A,D	;Y+32
	PUSH	D
	CALL	OUTSC
	POP	D
	MOV	A,E	;X+32
	JMP	OUTSC


;	Code here to process time and date requests
;	from PASCAL user.
;	Entry	None
;	Exit	first word address of data
;		in the following format
;		time = Reg DE ->
;			DB hh,mm,ss
;		date = Reg HL ->
;			DB mm,dd,yy
;		All DB data is in BCD.

	org	288h
GDATM:
;	this code works with SORCIM provided DATTIM routine
	LXI	H,10h		;Date
	LXI	D,10h+3	;Time
	RET

;	Endx	CONSTRL
;	The entire CONSTRL patch area cannot extend past 27Fh.
;	Following awkward expression is ASM way of saying this.
XEND	EQU	$
;	IF	XEND > (CONORG+256+64)
	IF	(XEND-(CONORG+256d)) and 08000h
error:	DW	(XEND-CONORG)	;console interface is too long
	ENDIF

	ORG	CONORG+256+64

	END		;end of assembly
PSC	;read CR and discard
	POP	D
	RET		;D=Y+32, E=X+32

	org	258h
SETXY:	;set X,Y position of cursor
;	Entry