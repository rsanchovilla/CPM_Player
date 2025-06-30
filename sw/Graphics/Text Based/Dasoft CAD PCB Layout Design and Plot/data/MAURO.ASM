;	*****************************************************************

;	PLOTTER.CTL FILE .. 

;	rev 2.6		cwm 	8/85
;	plotting now require the twoex and cirk flags which are orged at 
;	1bf0 at the end of the driver.

;	NOTE*~*~*~*~... this driver is full of machine specific stuff like
;	port adresses, out instructions, etc.. extensive rewriting may be 
;	necessary to get it to run on any machine. Mabey it's time you got a
;	real plotter.... 


;	Plotter control subroutines for DASOFT DA system
;   	DASOFT Design Systems, Inc. Copyright (c) 1981

;	These programs are protected by licensing agreements
;	and connot be used or duplicated without written
;	permission from DASOFT Design Systems, Inc.  phone# (415) 486-0822
;	Call for further information.

; 	83-07-19 TRF....Added DASOFT load kernal equates to make
;	PROAC-250 driver compatible with version 2.4 software 

OUTFUNC	EQU	5		; SEND TO CP/M LIST DEVICE

;	SOME MAGIC DEFINED LOCATIONS USED:

VERS	EQU	0032H		; 
REV	EQU	0034H		; 
EDIT	EQU	0064H		; 


WBOOT	EQU	0000H		; WARM BOOT ADDRESS
TYPEF	EQU	0002H		; BDOS PRINT COMMAND ADDRESS
BDOS	EQU	0005H		; ADDRESS OF BDOS JUMP POINT
BUFF	EQU	0080H		; ADDRESS OF DISK INPUT BUFFER
DMA	EQU	001AH		; SET DMA ADDRESS FUCT NUMB
READF	EQU	0014H		; DISK READ FUNCTION
WRITEF	EQU	0015H		; WRITE FILE TO DISK NUM
OPENS	EQU	000FH		; OPEN FILE FUNCT NUMBER
CLOSES	EQU	0010H		; CLOSE FILE FUNCT NUMBER

FCB	EQU	005CH		; FILE CONTROL BLOCK ADRS
FCBDN	EQU	005CH		; FCB DISK NAME
FCBFN	EQU	005DH		; FILE NAME
FCBFT	EQU	0065H		; FILE TYPE
FCBEX	EQU	0068H		; CURRENT EXTENT NUMBER
FCBRC	EQU	006BH		; EXTENT RECORD COUNT (0-128)
FCBCR	EQU	007CH		; CURRENT (NEXT) RECORD NUMBER
FCBR0	EQU	007DH		; LSB OF 16 BIT RANDOM NUMBER ADDRESS
FCBR1	EQU	007EH		; MSB OF 16 BIT RANDOM NUMBER ADDRESS
FCBR2	EQU	007FH		; RECORD OVERFLOW FLAG

TOPPTR	EQU	0006H		; WAS (AD00H) STACK START 48K

CLEAD	EQU	0001H		; CURSOR POSITIONING STRING CODE
P3LINES	EQU	0003H		; PRINT THREE LINES
CONTMSG	EQU	000BH		; CONTINUE MESSAGE CODE
CLS	EQU	000CH		; CLEAR SCREEN CODE
IVON	EQU	000EH		; INVERSE ON CODE
IVOFF	EQU	000FH		; INVERSE OFF CODE

CR	EQU	000DH		; RETURN CHARACTER
LF	EQU	000AH		; LINE FEED CHARACTER
BEEP	EQU	0007H		; BELL CHARACTER
TAB	EQU	0009H		; TAB CHARACTER
BS	EQU	0008H		; BACK SPACE
ESC	EQU	001BH		; ESCAPE
EOM	EQU	00EEH		; END OF MESSAGE MARKER (OVERLAY FILE)
EOF	EQU	00FFH		; END OF FILE MARKER  (OVERLAY FILE)
MSCNT	EQU	00F9H		; 1 MSEC SOFTWARE DELAY CONSTANT

RDRL	EQU	0103H		; LAODER KERNAL OR TEST PROG
CLEARS	EQU	0108H		; CLEAR SCREEN ROUTINE
PSTRNG	EQU	010EH		; PRINT AN ASCII STRING 
INCHNE	EQU	011DH		; ROUTINE TO READ CONSOLE NO ECHO
DUMP	EQU	014DH		; BLOCK MOVE ROUTINE

;	THESE EQUATES ARE FOR THE OUTPUT PORT, CHANGE AS NEEDED

data	EQU	0D0H		; DATA OUT FOR 8255
stat	EQU	0D3H		; CONTROL PORT FOR DATA
rings	EQU	10		; NUMBER OF ANNOUNCING BELLS
KBRD	EQU	02		; KEYBOARD PORT FOR IMSAI IKB

	ORG	1800H

;	JUMP TABLE ENTRY POINTS FOR EXTERNAL ENTRY

;	PINIT AND CHGPPR, CHGPEN, MAY NEED TO BE CHAGED BY USER

PINIT	JMP	INIT		; INITIALIZE OUTPUT PORT
PHOME	JMP	HOME		; HOME THE PLOTTER TO 0,0
VECTOR	JMP	MOVE		; MOVE THE PEN
CHGPPR	JMP	CHGPR		; CHANGE PAPER COMMAND
CHGPEN	JMP	CHGPN		; CHANGE PEN COMMAND

TBLAD	DB	00000000b	; 
	DB	00000000b	; 
	DB	00000000b	; 
	DB	00000000b	; PLOTTER COORDINATE TABLE

;	NOT USED ????????

YASIGN	DB	1		; SIGN OF Y CORRECTION 0=+
YADJUST	DB	153		; MAGNITUDE OF Y CORRECTION

XASIGN	DB	0		; SIGN OF CORRECTION 0=+
XADJUST	DB	83		; NUMBER OF GRIDS BEFRE CORRECTION X

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	****** HOME PLOTTER COMMAND **********************

;	FOR THE MAURO ENGINEERING PROAC, HOME IS ACCOMPLISHED
;	BY RUNNING THE PLOTTER INTO THE NEGATIVE STOPS.
;	THATS RIGHT. 
;	THE PLOTTER USES 4 BYTES:
;		X MAGNITUDE,
;		XSIGN,
;		Y MAGNITUDE, 
;		Y SIGN, 
;	SET TO NEGATIVE MAX X,Y
;	DESTROYS (A), NO ENTRY OR EXIT PARAMETERS

HOME:	XRA	A		; zero (A)
	STA	TBLAD		; ZERO X LSD MAG
	STA	TBLAD+2		; ZERO Y LSD MAG
	MVI	A,1FH		; MAX NEGATIVE MAG
	STA	TBLAD+1		; NEGATIVE X
	STA	TBLAD+3		; NEGATIVE Y
	CALL	VECTOR		; MOVE PLOTTER
	RET			; return to caller

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	********* CHANGE PAPER ROUTINE ********************

;	SOME PLOTTERS CAN CHANGE THEIR OWN PAPER, WHICH IS WHY
;	THERE IS A USER ROUTINE FOR THIS. FOR THE MAURO PROAC,
;	IT IS UNDER 'MANUAL' CONTROL.
;	THIS UTILITY SENDS 25 'CONTROL-G' OR BELLS TO THE CONSOLE 
;	WITH A MESSAGE.

CHGPR:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; save machine

	LXI	D,@paper	; point (DE) to "change paper" message
	CALL	PSTRNG		; send the message to the console

;	beep the console and wait for input

ok?:	lxi	d,@beep		; LOAD "A" WITH THE BEEP COUNT
	call	pstrng		; send the string to the console
	call	inchne		; wait for a character

restore:
	pop	h		; 
	pop	d		; 
	pop	b		; 
	pop	psw		; restore machine
	ret			; return to caller

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	********* CHANGE PEN ROUTINE *****************

;	AGAIN, SOME PLOTTEERS CAN CHANGE THEIR OWN PEN
;	**CONTACT DASOFT FOR MORE INFORMATION.

;	THE PEN SIZE IS SENT IN THE ACCUMULATOR ON CALL, NO
;	OTHER INPUTS, NO OUPUTS.

CHGPN:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; save machine

	adi	'0'		; make ascii
	mov	b,a		; move new pen number into (B)
	lda	@nupen		; get current pen number
	cmp	b		; see if we have that pen already
	jz	restore		; exit if so
				; else...
	mov	a,b		; get new pen number back
	sta	@nupen		; put new pen number in change message

	LXI	D,@pen		; point (DE) to "change pen" message
	CALL	PSTRNG		; send the message to the console
	JMP	ok?		; 

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	********** PLOTTER CONTROL ROUTINES *****************

;	MAURO ENGINEERING ROUTINES FOR THEIR PLOTTER
;	SEE YOUR PROAC BOOK FOR MORE INFORMATION

;	THIS ROUTINE MUST BE CHANGED IF YOU COMPUTE AT 2MHZ!!!

MOVE:   LDA	cirk		; test for circle
	ana	a		;
	jnz	move1		; in this set-up, circles are at one step always
	lda 	twoex		; test for 2x
	ana	a
 	cnz	move1		; if flag set call, then rets and falls thru
				; to move1 a second time. if not then one move.


MOVE1:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; save machine

	LXI	H,0000		; LOAD "HL" ZERO
	SHLD	HIGH		; ZERO HIGH
	SHLD	LOW		; ZERO LOW
	SHLD	HMINL		; ZERO HMINL

;	*INITIALIZE RAMP

	MVI	A,010H		; GET DELAY FACTOR
	STA	DELY		; PUT IN "DELY" BOX

	MVI	A,03H		; GET A 3 IN "A"
	STA	DELY+1		; PUT THAT IN THE NEXT PLACE

	MVI	A,20H		; GET ASCII SPACE CHARACTER ??
	STA	SECON		; PUT IN "SECON" BOX

	MVI	A,07H		; GET A "7"
	STA	SIX		; PUT IN THE "SIX" BOX

	LXI	H,TBLAD+1	; POINT "HL" TO THE ADDRESS TABLE

TESTP:	MVI	B,0		; LOAD "B" WITH ZERO
	MOV	A,M		; GET BYTE AT "TBLAD+1"
	ANI	20H		; MASK UN-NEEDED INFO OUT
	JZ	TESTS		; IF MATCH THEN WE HAVE THE RIGHT PEN status

PENDN:	MVI	B,10H		; LOAD "B" WITH - 00010000 B - FOR PEN down

TESTS:	LXI	H,PSTAT		; POINT TO PEN NUMBER 
	MOV	A,M		; GET PEN CURRENT NUMBER
	CMP	B		; TEST FOR MATCH
	JZ	TESTT		; SKIP CHANGE PEN IF MATCH

	MOV	M,B		; PUT (B) IN "PSTAT" BOX
	CALL	PENCG		; GO CHANGE PENS

TESTT	LXI	H,CDE+2		; 
	MOV	M,B		; 
	LXI	H,CDE+3		; 
	MOV	M,B		; 

	LXI	H,TBLAD+1	; 
	MOV	A,M		; 
	ANI	10H		; 
	JNZ	YP		; 

YN	MOV	A,B		; 
	ORI	01H		; 
	MOV	B,A		; 
	JMP	TESYS		; 

YP	MOV	A,B		; 
	ORI	02H		; 
	MOV	B,A		; 

TESYS	INX	H		; 
	INX	H		; 
	MOV	A,M		; 
	ANI	10H		; 
	JNZ	XP		; 

XN	MOV	A,B		; 
	ORI	08H		; 
	MOV	B,A
	JMP	PLOT

XP	MOV	A,B
	ORI	04H
	MOV	B,A

;START COMPARISON BETWEEN X AND Y

PLOT	MOV	A,B
	STA	SAVEB

	LXI	H,TBLAD
	MOV	C,M
	INX	H
	MOV	A,M

	ANI	0FH
	MOV	B,A
	INX	H
	MOV	E,M
	INX	H
	MOV	A,M

	ANI 	0FH
	MOV	D,A
	MOV	A,C
	SUB	E
	MOV	A,B
	SBB	D
	JNC	XBIG

YBIG	LXI	H,BIGCD
	MVI	A,0CH
	MOV	M,A

	LXI	H,SMCD
	MVI	A,03H
	MOV	M,A

	PUSH	D
	PUSH	B

	POP	D
	POP	B
	JMP	MULT2

XBIG	LXI	H,BIGCD
	MVI	A,03H
	MOV	M,A

	LXI	H,SMCD
	MVI	A,0CH
	MOV	M,A

MULT2	MVI	H,02H		; LOAD (HL) WITH MULTIPLY COUNT

;	ROTATE (BC) AND (DE) LEFT , (HL) TIMES
;	IN: DE,BC = NUMBERS TO ROTATE
;	    HL = NUMBER OF TIMES TO ROTATE

MULTX	ORA	A		; CLEAR THE CARRY FLAG

	MOV	A,C		; ROTATE (C) LEFT
	RAL
	MOV	C,A

	MOV	A,B		; ROTATE (B) LEFT
	RAL
	MOV	B,A

	ORA	A		; CLEAR THE CARRY FLAG

	MOV	A,E		; ROTATE (E) LEFT
	RAL
	MOV	E,A

	MOV	A,D		; ROTATE (D) LEFT
	RAL
	MOV	D,A

	MOV	A,H
	SUI	01H
	JZ	SVHIG

	MOV	H,A
	JMP	MULTX

SVHIG	LXI	H,HIGH
	MOV	M,B
	INX	H
	MOV	M,C
	INX	D

;	SET UP RAMP

	LXI	H,HIGH
	MOV	A,M
	CPI	0
	JNZ	HD1

	INX	H
	MOV	A,M
	CPI	3CH
	JNC	HD1

;	HIGH RAMP

	ORA	A
	RAR

	LXI	H,HALFD
	MOV	M,A

	LXI	H,ENDRP
	MOV	M,A
	INX	H
	MVI	M,0
	JMP	ITER

HD1	LXI	H,HALFD
	MVI	M,1EH

	LXI	H,HIGH+1
	MOV	A,M

	LXI	H,HALFD
	SUB	M
	STA	ENDRP

	LXI	H,HIGH
	MOV	A,M
	SBI	0
	STA	ENDRP+1

;	SET CODE TO OUTPUT BIGGEST

ITER	LXI	H,CDE
	MVI	M,0
	MOV	A,M

	LXI	H,BIGCD
	ORA	M

	LXI	H,CDE
	MOV	M,A

;	ADD AND COMPARE

	LXI	H,LOW+1
	MOV	A,M
	ADD	E
	MOV	M,A
	DCX	H
	MOV	A,M
	ADC	D
	MOV	M,A

	LXI	H,HIGH+1
	MOV	A,M

	LXI	H,LOW+1
	SUB	M

	LXI	H,HMINL+1
	MOV	M,A

	LXI	H,HIGH
	MOV	A,M

	LXI	H,LOW
	SBB	M

	LXI	H,HMINL
	MOV	M,A
	JNC	CONT

;	OUTPUT SMALL ALSO AN INVERRT H MINUS L (SIC)

	MVI	A,0
	LXI	H,HMINL+1
	SUB	M
	LXI	H,LOW+1
	MOV	M,A
	LXI	H,HMINL
	MVI	A,0
	SBB	M
	LXI	H,LOW
	MOV	M,A
	LXI	H,SMCD
	MOV	A,M

	LXI	H,CDE
	ORA	M
	MOV	M,A

;	OUTPUT ROUTINES

CONT	MOV	A,B
	CPI	0
	JNZ	CONT1

	MOV	A,C

C1	CPI	0
	JNZ	CONT1

	LXI	H,CDE+3		; 
	MOV	A,M		; 
	ORI	60H		; 
	ANI	50H		; 
	XRI	0FFH		; 

	OUT	data		; OUT TO PORT

	RET			; 

CONT1	DCX	B

DELAY	LHLD	DELY

D1	DCR	L
	JNZ	D1

	DCR	H
	JNZ	D1

	LXI	H,CDE+3
	MOV	A,M
	ORI	60H
	ANI	50H
	XRI	0FFH

	OUT 	data

;	CK FOR RAMP START

	MOV	A,C
	LXI	H,ENDRP
	SUB	M
	MOV	A,B
	INX	H
	SBB	M
	JC	ADDCK

SUBX	LXI	H,DELY
	MOV	A,M

	LXI	H,SECON
	SUB	M
	STA	DELY
	JNC	SUB1

	LXI	H,DELY+1
	DCR	M

SUB1	LXI	H,SIX
	DCR	M
	JNZ	CONT2

	LXI	H,SECON
	MOV	A,M
	ORA	A
	RAR
	MOV	M,A

DC1	LXI	H,SIX
	MVI	M,07H
	JMP	CONT2

ADDCK	MOV	A,B
	CPI	0
	JNZ	CONT2

	MOV	A,C

	LXI	H,HALFD
	CMP	M
	JNC	CONT2

	LXI	H,DELY
	MOV	A,M

	LXI	H,SECON
	ADD	M
	STA	DELY
	JNC	ADD1

	LXI	H,DELY+1
	INR	M

ADD1	LXI	H,SIX
	DCR	M
	JNZ	CONT2

	LXI	H,SECON
	MOV	A,M
	ORA	A
	RAL
	MOV	M,A
DC2	JMP	DC1

CONT2	LXI	H,CDE
	MOV	A,M
	LXI	H,SAVEB
	ANA	M
	LXI	H,CDE+2
	ORA	M
	LXI	H,CDE+3
	MOV	M,A
	ORI	40H
	XRI	0FFH

	OUT	data
;
	JMP	ITER

PENCG	MOV	A,B
	ORI	60H
	ANI	50H
	XRI 	0FFH

	OUT 	data

	MVI	C,0FFH
	MVI	D,0FH

PC1	DCR	C
	JNZ	PC1

	DCR	D
	JNZ	PC1

	MOV	A,B
	ORI	60H
	ANI	40H
	XRI 	0FFH

	OUT	data

	RET

;	DAS ENDE!

;	******* PLOTTER PORT INITIALIZE ROUTINE ***************
; 	FOR 8255, ALL OUTPUTS , CODE IS 80 H

INIT	MVI	A,80H
	OUT	stat		; SEND TO 8255 CONTROL PORT
	RET

; ***********************************************************************

HIGH	DW	0000
LOW	DW	0000
HMINL	DW	0000

ENDRP	DW	0000		; TEMP LOCATIONS NEEDED
DELY	DW	0000

PSTAT	DB	00
SAVEB	DB	00	
BIGCD	DB	00
SMCD	DB	00

CDE	DB	00
	DB	00
	DB	00
	DB	00

HALFD	DB	00
SECON	DB	00
SIX	DB	00

;	TEXT:

PPRMSG	DB	CR,LF
	DB	'PLEASE CHANGE PLOTTER PAPER THEN HIT ANY KEY$'

PNMSG1	DB	CR,LF
	DB	'PLEASE CHANGE PEN THEN HIT ANY KEY'
	DB	CR,LF
	DB	'    NEW PEN SIZE IS....$'

PNMSG2	DB	'000$'
PNMSG3	DB	'0$'
PNMSG4	DB	'1$'
PNMSG5	DB	'4$'

	org 1bf0

twoex	db	00
cirk	db	00

	END
