;TITLE	'BUILTIN.ASM --- PALANTIR PRINTDEF BUILT-IN        01/23/82'

PRINTDEF equ	1000h

	org	PRINTDEF

VERSION	DB	1

; Printer Name for display -- must be exactly 16 characters
;		'DIABLO 630/620  ',0
prname	db	'DIABLO 630/620  ',0

initflag db	0	;Has printer been initialized? (must be 0)


;	The following 2 parameters specify the number of increments per inch
;	that the printer can recognize, horizontally and vertically.  If the
;	printer has only fixed pitch, these should be the actual number of
;	characters and lines per inch that it prints.  If it supports full
;	incremental positioning, these would be actual increments -- typically
;	60 or 120 points horizontally and 24 or 48 vertically.	If the printer
;	can handle discrete pitches but not individual points, say 10 or 12
;	characters per inch but nothing else, the setting for 'incrh' should
;	be a common multiple of the various pitches -- 120, for example.  The
;	controls for HMI and VMI will adapt to the size closest to the pitch
;	required for formatting.  (Some printers may use one method for
;	horizontal pitch and another for vertical).

incrh	dw	120	; 120 STEPS PER INCH
incrv	dw	48	; 48 VERTICAL STEPS PER INCH


;	The next 2 parameters indicate the maximum width allowable for a
;	single character or line feed.	If more movement is required, the
;	WP generates additional spacing.  If the printer is fully incremental,
;	the values are its specified maximum settings.	If it supports only
;	a single pitch, the value is 1.  If multiple fixed settings are
;	available, use the largest number of increments supported.

maxh	db	125	;Maximum character size supported
maxv	db	125	;Maximum line size supported


;	The following data is established and maintained by the WP.
;	Only the space need be reserved, as shown.


seth	db	1	;Currently set character size
setv	db	1	;Currently set line size

posh	dw	0	;Horizontal position, in increments
posv	dw	0	;Vertical position, in increments

pdir	dw	1	;Current print direction


;	Hardware Implementation Data


;	Initialization Logic

dfinit	db	080H	;Type of Initialization
	dw	INITR	;Address of routine or initialization sequence
hdware	db	0	;Initial Hardware Attribute Status


;	Printer Output Logic

dfout	db	080H	;Data Output Method
	dw	SQOUT	;Address of custom routine or status port or address
	db	0,0	;Status Mask AND and OR
	db	0	;Data Ready Pattern
	dw	0	;Output port or address


;	Printer Status Input Logic

dfinp	db	0	;Printer Input Method, if Applicable
	dw	0	;Address of custom routine or status port or address
	db	0,0	;Status Mask AND and OR
	db	0	;Data Ready Pattern
	dw	0	;Input Port or Address


;	Handshaking Protocol

dfhand	db	0	;Handshaking Method (none if by timing or hardware)
	dw	0	;Address of custom routine or actual codes to send/rcv
	db	0	;Buffer half-size (0 to send at logical eol)

;	Timing Delay Controls

dfnull	db	0	;Method for timing delays (if needed)
	dw	0	;Address of custom rtn or timing constant

;	Horizontal Motion Index

dfhort	db	02	;Method for controlling horizontal pitch
	dw	HMIP	;Address for custom rtn or low and high pitches
	dw	0	;Address of discrete table or leadin sequence
	db	01	;Offset to apply to HMI incremental setting
	db	0FFH	;Format of HMI (FF-binary, 0-5 ascii size)
	dw	0	;Address of suffix, if any

;	Vertical Motion Index

dfvert	db	02	;Method for controlling vertical pitch
	dw	VMIP	;Address for custom rtn or low and high pitches
	dw	0	;Address of discrete table or leadin sequence
	db	01	;Offset to apply to VMI incremental setting
	db	0FFH	;Format of VMI (FF-binary, 0-5 ascii size)
	dw	0	;Address of suffix, if any

;	Page Feed Logic

dfpage	db	2	;Method for advancing new page
	dw	sqpage	;Address of code sequence or timing count

;	Line Feed Logic

dfnewl	db	2	;Method of performing line feed
	dw	sqnewl	;Address of code sequence or timing count
	db	0	;Flag 0 if independent, non-zero if forces C/R

;	End-of-Line Logic

dfeol	db	2	;Method for completing logical line
	dw	sqeol	;Address of code sequence or timing count
	db	0	;Flag 0 if returns pw to home, else non-zero

;	Backspace Logic

dfbksp	db	02	;Method for implementing backspace
	dw	BKSP	;Address of code sequence or timing count

;	Bidirectional Print Logic

dfbidi	db	0	;Method for implementing reverse print
	dw	0	;Address of code sequence to reverse print
	dw	0	;Address of code sequence to restore print forward
	db	0	;Reserved

;	Attribute: Boldface

dfbold	db	0	;Method for implementing boldface
	dw	0	;Address of Boldface-On sequence
	dw	0	;Address of Boldface-Off sequence
	db	07FH	;Flag - nonzero if shadow print supported

;	Attribute: Underscore

dfunder db	2	;Method for implementing underscore
	dw	UND1	;Address for Underscore-On sequence
	dw	UND2	;Address for Underscore-Off sequence
	db	0	;Reserved

;	Attribute: Doublescore

dfdbls	db	0	;Method for implementing doublescore
	dw	0	;Address for Doublescore On sequence
	dw	0	;Address for Doublescore Off sequence
	db	0	;Flag 1, 2, or 4 for size multiplier if special print
			;     '=' or '_' to indicate method of true doublescore

;	Attribute: Strikethrough
dfthru	db	0	;Method for implementing strikethru
	dw	0	;Address for Sequence-On
	dw	0	;Address for Sequence Off
	db	0	;Reserved


;	Attribute: Ribbon Shift

dfribn	db	0	;Method for implementing ribbon shift
	dw	RS1	;Address for Sequence-On
	dw	RS2	;Address for Sequence-Off
	db	0	;Reserved

;	Attribute: Extended Character Set

dfext	db	0	;Method for implementing extended character set
	dw	0	;Address for Sequence-On
	dw	0	;Address of Sequence-Off
	db	0	;Reserved

;	Attribute: Alternate Font

dffont	db	0	;Method for implementing special fonts
	dw	0	;Address for sequence-on
	dw	0	;Address for sequence-off
	db	0	;Font-switching control byte

;	CONTROL BLOCK: CARRIAGE SHIFT SEQUENCE

DFSHFT	DB	0			; METHOD FOR IMPLEMENTATION
	DW	0			; ADDRESS FOR SEQUENCE ON
	DW	0			; ADDRESS FOR SEQWUENCE OFF
	DB	0			; FLAG BYTE FOR SHIFT STATUS

;	CONTROL BLOCK: PROPORTIONAL PRINT CONTROL

DFPROP	DB	0			; METHOD FOR IMPLEMENTATION
	DW	0			; ADDRESS FOR SEQUENCE ON
	DW	0			; ADDRESS FOR SEQUENCE OFF
	DB	0			; FLAG BYTE
	DB	0,0,0,0			; OPEN

DFEDOC	DB	080H	;END OF PRINT, CLOSE PRINTER
	DW	FINIP	;END OF FILE SEQUENCE
	DW	0
	DB	01	;SEND EOF AFTER PAPERFEED

;	CONTROL BLOCK: RESERVED FOR EXPANSION

DFXTRA	DS	12


*******************************************************************************
*									      *
*	USER COMMUNICATIONS AREA FOR CUSTOM ROUTINE IMPLEMENTATION	      *
*									      *
*******************************************************************************
*									      *
DOCUPTR	DS	2			; POINT TO DOCUMENT HEADER AREA	      *
FORMPTR	DS	2			; POINT TO FORMAT HEADER AREA	      *
TEXTPTR	DS	2			; POINT TO EXPANDED TEXT ARRAY	      *
ATTRPTR	DS	2			; POINT TO ATTRIBUTE ARRAY	      *
SIZEPTR	DS	2			; POINT TO CHARACTER WIDTH ARRAY      *
FONTPTR	DS	2			; POINT TO FONT DEFINITION TABLE      *
	DS	2			; REESERVED POINTER		      *
	DS	2			; REESERVED POINTER		      *
	DS	2			; REESERVED POINTER		      *
	DS	2			; REESERVED POINTER		      *
INDX	DS	2			; CURRENT VALUE OF ARRAY OFFSET	      *
*									      *
CHAR	DS	1			; CURRENT PRINTABLE CHARACTER (INPUT) *
ATTR	DS	1			; ATTRIBUTES FOR THIS CHARACTER	      *
WDTH	DS	1			; CHARACTER WIDTH (HMI & HAMMER INTS) *
OPCHAR	DS	1			; CURRENT PRINTABLE CHARACTER (OUTPT) *
OPWDTH	DS	1			; HMI SETTING FOR OUTPUT CHARACTER    *
BKMASK	DS	1			; REPRINT REQ'D MASK BITS	      *
BKCHAR	DS	1			; CHARACTER TO OVERPRINT AFTER BKSP   *
UNDR	DS	1  			; UNDERSCORE CHAR FOR THIS POSITION   *
OVER	DS	1			; OVERSTRIKE CHAR FOR THIS POSITION   *
TYPE	DS	1			; LINE TYPE (SUPER,BASE,SUB)	      *
*									      *
*									      *
*		END OF COMMUNICATIONS AREA				      *
*									      *
*******************************************************************************


;	CODE SEQUENCES AND CUSTOM ROUTINES SHOULD FOLLOW HERE



sqpage	db	0,1,12	;Standard formfeed code

sqnewl	db	0,1,10	;Standard linefeed code

sqeol	db	0,1,13	;Standard carriage return

HMIP	DB	0,2,01BH,01FH	;HORIZ MOTION INDEX ESC SEQ
VMIP	DB	0,2,01BH,01EH	;VERT MOTION INDEX SET ESC SEQ
BKSP	DB	0,1,8	;BACKSPACE CODE
UND1	DB	0,2,01BH,045H	;UNDERLINE CODE
UND2	DB	0,2,01BH,052H	; "
RS1	DB	0,2,01BH,041H	;RIBBON SHIFT
RS2	DB	0,2,01BH,042H
EOFS	DB	0,1,26	;SEND CTRL-Z TO END FILE
INITP	DB	0,1,01DH	;INITIALIZE PRINTER SEQUENCE
; CUSTOM PRINTER OUTPUT ROUTINE
; CHARACTERS WITH SIGN BIT SET ARE SPECIAL
; USE TABLE OF 2 BYTES PER CHARACTER TO SEND IN PROGRAM MODE
; TABLE IS IN START OF FONT TABLE, NOT OTHERWISE USED
; SEND SPOKE POSITION AND HAMMER ENERGY/RIBBON ADVANCE CODE
;
SQOUT:	MOV	A,E	;CHAR TO OUT
	STA	SQOUTS	;SAVE IT
	RLC		;TEST HIGH BIT
	JNC	DOOUT	;SEND IF NO SIGN BIT
; HERE FIND SPOKE AND ENERGY
	LHLD	FONTPTR	;TABLE PTR
	LDA	SQOUTS	;CHARACTER
	ANI	07FH	;MASK HIGH BIT
	MOV	E,A	;PUT IN DE
	XRA	A	;ZERO
	MOV	D,A	;ZERO D
	DAD	D	;ADD D TO HL
	PUSH	H	;SAVE POINTER TO 2 BYTES
;SEND CODE TO ENTER PROGRAM MODE
	MVI	A,27
	CALL	XOUT
	MVI	A,0EH	;SO
	CALL	XOUT
	MVI	A,'M'
	CALL	XOUT
;NOW IN PROGRAM MODE
	POP	H
	PUSH	H
	MOV	A,M	;SPOKE POSITION
; IF SPOKE POSITION HAS HIGH BIT, SEND ESC FIRST (ESC Y, ESC Z)
	RLC
	JNC	SQOUT1	;NO ESC NEEDED
	MVI	A,27	;ESC
	CALL	XOUT
SQOUT1:	POP	H
	PUSH	H
	MOV	A,M	;SPOKE POSITION CODE
	ANI	07FH	;MASK ANY HI BIT
	CALL	XOUT
;NOW SEND HAMMER ENERGY CODE, RIBBON ADVANCE CODE
	POP	H
	INX	H	;NEXT CHAR
	MOV	A,M	;CODE
	CALL	XOUT	;SEND IT
;NOW DISABLE PROGRAM MODE
	MVI	A,0FH	;SI
	CALL	XOUT
;EXIT
	MVI	A,080H
	RET
;UTILITY TO SEND A CHARACTER
XOUT:	MOV	E,A	;FOR BDOS
	MVI	C,05H	;CODE FOR BDOS
	JMP	5	;CALL AND RETURN
;NORMAL SEND OF CHAR
DOOUT:	LDA	SQOUTS
	CALL	XOUT
	MVI	A,080H
	RET
;SAVE LOC
SQOUTS:	DB	0	;SAVE BYTE
;
; CUSTOM ROUTINES TO INITIALZE PRINTER AT START AND FINISH OF PRINT
; SEND ESC CR P FOLLOWED BY 1000 CARRIAGE RETURNS FOR TIME DELAY
;
;ROUTINE TO SEND ESC CR P
SESCCR:	MVI	A,01BH	;ESC
	CALL	XOUT
	MVI	A,00DH	;CR
	CALL	XOUT
	MVI	A,'P'	; P
	CALL	XOUT
	RET
;ROUTINE TO SEND 510 nulls FOLLOWED BY TIME DELAY
S1000:	MVI	H,2	;OUTER LOOP COUNT
	MVI	L,255	;INNER LOOP COUNT
	PUSH	H	;SAVE COUNTS
S1001:	MVI	A,0	; null
	CALL	XOUT
	POP	H
	DCR	L
	JNZ	S1002	;NOT DONE LOOP
	DCR	H	;CHECK OUTER LOOP
	JZ	T13	;IF LOOP DONE, DO TIME DELAY
	MVI	L,255	;RELOAD INNER LOOP
S1002:	PUSH	H
	JMP	S1001
;ROUTINES TO DO 1.3 SECOND TIME DELAY
T13:	MVI	D,13	;OUTER COUNT
T13A:	CALL	LOOPA
	DCR	D
	JNZ	T13A
	RET
LOOPA:	MVI	B,200
LOOPA1:	CALL	LOOPB
	DCR	B
	JNZ	LOOPA1
	RET
; .5 MS DELAY
LOOPB:	MVI	C,213
LOOPB1:	DCR	C
ÅÅ;
LOOPB2: JNZ     LOOPB1  ; LOOP
;
	RET
;INITIALIZE PRINTER
INITR:	CALL SESCCR	;SEND INIT CODE
	CALL	S1000	;SEND 510 NULLS AND DELAY
	MVI	A,01BH	;ESC
	CALL	XOUT
	MVI	A,'S'	;DISABLE PROP SPACE
	CALL	XOUT
	MVI	A,080H	;FOR PALANTIR
	RET
;INITIALIZE PRINTE AT END
FINIP:	CALL	SESCCR	;SEND INIT CODE
	CALL	S1000	;SEND NULLS AND TIME DELAY
	MVI	A,26	;CONTROL Z
	CALL	XOUT
	MVI	A,080H
	RET

	CALL	XOUT
	MVI	A,080H
	RET

  