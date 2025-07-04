;----------------------------------------------------------------
;
;	HP7475A TO DASOFT PLOTTER INTERFACE SUBROUTINES

;	rev 2.6			cwm	6-1-85
;
;	2.6	NOTES
;	This routine was written by Carl Edlund of South West Research Inst.
;	It is based on the driver 'hpdvr' and uses 8080 code

;	2.6 requires 2 new flags, twoex and cirk. These are ORGed at 1bf0h,at
;	the end of the driver. 


;
;	A:HPDVR.ASM
;
;	C.E.E.		DEC.19,1984
;
;----------------------------------------------------------------


;	JUMP TABLE

	ORG	1800H

	JMP	INIT		; INITIALIZE THE PLOTTER
	JMP	HOME		; MOVE PEN TO HOME POSITION
	JMP	MOVE		; MOVE THE PEN
	JMP	CHGPR		; CHANGE PAPER
	JMP	CHGPN		; CHANGE PEN

TBLAD:	DS	4

	DB	0,0,0,0		; NO X,Y ADJUST REQUIRED
SLOW:	DB	0		; FLAG FOR DRAWING SLOWLY
X:	DB	0,0		; CURRENT X LOCATION (ABSLUTE) IN .005 IN. 
Y:	DB	0,0		; CURRENT Y LOCATION (ABSLUTE) IN .005 IN. 


;	INIT SUBROUTINE

;	THIS ROUTINE INITIALIZES THE HP7475A DRAFTING PLOTTER TO OPERATE
;	IN THE DASOFT CPM ENVIRONMENT

;	THE 7475A IS CONFIGURED AS :
;		 	USE MAXIMUM BUFFER AVAILABLE
;			ENABLE HARD WIRE HANDSHAKE
;			DEFAULT
;

SETUP:	DB	27,'.@:IN;IP0,0,16260,10158;'
	DB	'SC-10,3177,0,1991;PS1;VS10;SP1;PU;',13,10,0

INIT:	CALL	SAVE		; SAVE REGISTERS
	XRA	A		; ZERO A
	STA	PUD		; NOTE THAT PEN IS UP
	LXI	H,SETUP		; GET STRING ADDRESS
	CALL	OUTS		; SEND STRING TO PLOTTER
	JMP	RESTORE		; RESTORE REGISTERS FROM STACK


;	PUT THE PEN IN THE HOME POSITION

HOME:	CALL	SAVE
	XRA	A		; ZERO A REGISTER
	STA	X		; STORE AT X
	STA	X+1		; ZERO HIGH BYTE OF X
	STA	Y		; ZERO AT Y
	STA	Y+1		; ZERO HIGH BYTE OF Y

	LXI	H,HOMEIT	; GET ADDRESS OF HOME STRING
	CALL	OUTS		; SEND TO PLOTTER
	JMP	RESTORE

HOMEIT:	DB	'PUPA0,0',13,10,0
PUP:	DB	'PU',13,10,0
PDOWN:	DB	'PD',13,10,0
COMMA:	DB	',',0
PR:	DB	'PR',0
TERMIT:	DB	13,10,0


;	MOVE

;	THIS ROUTINE MAKES RELATIVE PEN MOVEMENTS

MOVE:   LDA	cirk		; test for circle
	ana	a		;
	jnz	move1		; in this set-up, circles are at one step always
	lda 	twoex		; test for 2x
	ana	a
 	cnz	move1		; if flag set call, then rets and falls thru
				; to move1 a second time. if not then one move.


MOVE1:	CALL	SAVE		; SAVE REGISTERS ON STACK
	LDA	TBLAD+1		; GET MSBY X
	ANI	20H		; ISOLATE PEN BIT

;	MOV	B,A		; SAVE NEW PEN UP/DOWN VALUE
;	LDA	PUD		; GET CURRENT PEN U/D STATE
;	XRA	B		; COMPARE VALUES
;	JZ	MOVEA		; NO CHANGE
;	MOV	A,B		; RESTORE NEW PEN U/D STATE
;	STA	PUD		; SAVE IT AS CURRENT U/D STATE
;	ORA	A		; TEST IF UP OR DOWN DESIRED

	JZ	PENUP		; GO TO PENUP IF ZERO

	LXI	H,PDOWN		; GET ADDRESS OF PEN DOWN STRING
	CALL	OUTS		; SEND TO PLOTTER
	JMP	MOVEA		; SKIP PAST PENUP

PENUP:	LXI	H,PUP		; GET ADDRESS OF PEN UP STRING
	CALL	OUTS		; SEND TO PLOTTER

MOVEA:
;	LXI	H,TBLAD		; CHECK IF NO RELATIVE MOTION
;	MOV	A,M
;	ORA	A
;	JNZ	MOVEB
;	INX	H
;	MOV	A,M
;	ANI	0FH
;	JNZ	MOVEB
;	INX	H
;	MOV	A,M
;	ORA	A
;	JNZ	MOVEB
;	INX	H
;	MOV	A,M
;	ANI	0FH
;	JZ	RESTORE

MOVEB:	LXI	H,PR		; GET ADDRESS OF PLOT RELATIVE STRING
	CALL	OUTS
	LHLD	TBLAD		; GET X VALUE
	CALL	BTOA		; CONVERT TO ASCII AND SEND
	LXI	H,COMMA		; SEND COMMA
	CALL	OUTS
	LHLD	TBLAD+2		; GET Y VALUE
	CALL	BTOA		; CONVERT TO ASCII AND SEND
	LXI	H,TERMIT	; GET CR ADDRESS
	CALL	OUTS
	JMP	RESTORE

PUD:	DB	0		; PEN UP/DOWN CURRENT STATE



;	CHGPR

;	THIS ROUTINE RINGS THE BELL AND AWAITS OPERATOR
;	"GO" RESPONSE

CHGPR:	CALL	SAVE
	LXI	H,BELLS		; GET ADDRESS OF BELLS STRING

CHGPRA:	MVI     C,2            ; SET UP FOR CONSOLE
	MOV     A,M		; GET NEXT CHAR
	ORA	A		; TEST FOR NULL
	JZ	CHGPRB

	PUSH	H
	MOV	E,A		; SEND CHAR TO SYSTEM CONSOLE
	CALL	5
	POP	H
	INX	H		; POINT TO NEXT CHARACTER
	JMP	CHGPRA

CHGPRB:	MVI	C,1		; READ CHAR. FROM CONSOLE
	CALL	5
	JMP	RESTORE

BELLS:	DB	13,10,10,7,'PLEASE CHANGE PLOTTER PAPER'
	DB	13,10,10,'THEN HIT ANY KEY TO CONTINUE',0


;	CHGPN

;	THIS ROUTINE CHANGES THE PEN USED DRING THE PLOT

CHGPN:	CALL	SAVE
	ORI	30H		; CONVERT PEN # TO ASCII
	STA	PEN+2		; PUT PEN NUMBER IN MESSAGE
	LXI	H,PEN		; GET ADDRESS OF PEN STRING
	CALL	OUTS
	JMP	RESTORE

PEN:	DB	'SP0',13,10,0


;	SAVE

;	THIS ROUTINE PUSHES REGISTERS ON THE STACK

SAVE:	XTHL
	PUSH	PSW
	PUSH	D
	PUSH	B
	PCHL


;	RESTORE

;	RESTORES REGISTERS FROM THE STACK

RESTORE:POP	B
	POP	D
	POP	PSW
	POP	H
	RET


;	OUTS


;	THIS ROUTINE SENDS A STRING (POINTED TO BY THE HL) TO THE PRINTER
;	PORT UNTIL A NULL (0) IS ENCOUNTERED


OUTS:	MVI	C,4		; PRINT COMMAND IN C REG
	MOV	A,M		; GET CHARACTER
	ORA	A		; SET FLAGS
	RZ			; RETURN IF END OF STRING

	MOV	E,A		; CHARACTER IN E REG
	PUSH	H
	CALL	5		; CALL BDOS
	POP	H
	INX	H		; POINT TO NEXT CHAR
	JMP	OUTS		; LOOP
	RET


;	BTOA

;	CONVERT 16 BIT NUMBER IN HL TO ASCII AND
;	OUTPUT IT TO PRINTER PORT WITH NO CR OR LF

BTOA:	MOV	A,H		; GET SIGN BIT
	STA	SIGN
	ANI	0FH		; ISOLATE MS NIBBLE
	MOV	H,A
	LXI	D,-1000
	CALL	DIV		; DIV HL BY DE
	ORI	30H		; MAKE ASCII
	STA	BUF		; STORE AWAY
	LXI	D,-100		; 
	CALL	DIV		; DIV HL BY DE
	ORI	30H		; MAKE ASCII
	STA	BUF+1
	LXI	D,-10
	CALL	DIV		; DIV HL BY DE
	ORI	30H		; MAKE ASCII
	STA	BUF+2
	MOV	A,L		; GET WHAT IS LEFT
	ORI	30H		; MAKE ASCII
	STA	BUF+3		; 
	LDA	SIGN		;  GET SIGN 
	ANI	10H
	JZ	BTOAA
	MVI	A,'-'
	JMP	BTOAB

BTOAA:	MVI	A,'+'

BTOAB:	STA	SIGN
	LXI	H,SIGN		; GET ADDRESS OF BUFFER
	CALL	OUTS
	RET

SIGN:	DB	0
BUF:	DB	0,0,0,0,0


;	DIV

;	ADD VALUE IN DE TO HL UNTIL HL GOES NEGATIVE
;	ADD DE BACK IN AND RETURN THE COUNT IN A

DIV:	MVI	C,0		; ZERO RESULT REGISTER

DIVA:	DAD	D		; SUBTRACT DIVISOR
	MOV	A,H		; PUT MSBY IN A
	ORA	A		; SET FLAGS
	JM	DIVD		; JMP IF DONE

	INR	C		; 
	JMP	DIVA		; LOOP

DIVD:	MOV	A,D		; COMPLIMENT DE
	CMA
	MOV	D,A
	MOV	A,E
	CMA
	MOV	E,A
	INX	D
	DAD	D
	MOV	A,C		; # OF TIMES TO A
	RET

	ORG 1BF0H
twoex	db	00
cirk	db	00	

	END.
