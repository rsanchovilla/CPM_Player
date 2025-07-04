; 30 AUG 79: PRINT MOVED TO 5690H.
; WITH 'PRINT' (UNTESTED) ADDED.
;
; PATH - MOSHELL - 23 JULY 79
;
; USE:  PATH  OBJECT, PATHOBJECT     -TAKES 'OBJECT'
;
; ALONG THE TRAJECTORY DEFINED BY 'PATHOBJECT',ONE
; PIXEL PER CALL TO 'PATH'. WHEN OBJECT HITS END OF 
; PATH-OBJECT IT CAUSES ZERO-FLAG TO BE SET. NEXT 
; CALL TO 'PATH' STARTS OBJECT OVER AT FIRST PATH
; PLACE. HITTING SPECIAL CODE 82H IN PATH 'FREEZES'
; OBJECT AND SETS Z-FLAG.

;IF THE OBJECT HITS A COLOR-CHANGE IN THE 
; PATH-OBJECT THE MOVING OBJECT IS RECOLORED
; TO THE NEW COLOR. INITIAL PATH-COLOR 
; DOESN'T AFFECT OBJECT COLOR,THOUGH.
;
;
FFLAGS	EQU	114H
INPAR	EQU	5030H
OBJR	EQU	5006H
OBJW	EQU	5009H
POSIT	EQU	2DBEH
	ORG	5620H
;
PATH:	CALL	INPAR
	MOV	B,E	;B HAS OBJECT-NAME.
	CALL	INPAR
	MOV	C,E	;C HAS PATH-NAME.
	MOV	D,B	;GO GET PATH-POSITION.
	MVI	E,255	;STORED AT LOC.255 IN OBJ.

	CALL	OBJR
	CPI	0	;IS THIS THE FIRST CALL TO 'PATH'?
	JNZ	MIDRUN	;NO
;
	MVI	A,4	;YES;STORE CORRECT POSITION.
MIDRUN:	MOV	E,A	;SELECT POSITION IN THE PATH.
	MOV	D,C	;AND ALSO SELECT THE PATH.
POSITION:CALL	OBJR	;AND SEE WHAT WE HAVE.
	MOV	L,A	;STASH X
	INR	E
	CALL	OBJR
	MOV	H,A	;STASH Y
	INR	E
	MOV	A,L	;NOW CHECK X
	CPI	255	;SPECIAL?
	JNZ	NOSPECIAL
;
;SPECIAL CODES:END OF PATH, OR FREEZE?
;
	MOV	A,H
	CPI	82H	;FREEZE?
	JNZ	TEST80
;
; FREEZE: THE OBJECT HANGS HERE FOREVER
; (BUT OF COURSE CAN BE MOVED BY 'FLY',ETC.)
;
	DCR	E
	DCR	E	;THIS IS SO WE'LL HIT THIS
	JMP	ENDOBJ	;CODE ON ALL FUTURE 'PATH'OPS.
;
TEST80: CPI	80H
	JNZ	COLOR	;TWARN'T NEITHER OF 'EM.
;
; END OF OBJECT: RESET TO BEGINNING OF PATH.
;
	MVI	E,4
ENDOBJ:	MOV	A,E;	WHAT TO WRITE?
	MOV	D,B	;SELECT OBJECT AGAIN
	MVI	E,255	;TAIL-END(PATHPLACE)MARKER.
	CALL	OBJW
	LDA	FFLAGS
	ORI	40H	;SET ZERO FLAG.
	STA	FFLAGS
	RET
;
COLOR:	PUSH	D	;SAVE PATHNAME&POSITION.
	MOV	D,B	;WE CHANGE OBJECTS.
	MVI	E,0	;COLOR-BYTE.
	CALL	OBJW	;A ALREADY HAD Y-CODE.
	POP	D
	JMP	POSITION
;
; MERELY MOVE THE OBJECT
;
NOSPECIAL:MOV	D,B	;RESET TO CORRECT OBJECT
	MOV	A,E	;AND SAVE POSITION
	MVI	E,255
	CALL	OBJW
	MOV	B,L
	MOV	C,H	;INTERFACE TO 'POSIT'
	CALL	POSIT
	LDA	FFLAGS
	ANI	0BFH	;CLEAR ZERO FLAG
	STA	FFLAGS
	RET
;
;
; PRINT - THIS OP JUST PRINTS THE STRING POINTED TO BY
; THE PARM,UNTIL A '$' IS ENCOUNTERED. IF YOU DON'T GIVE
; A VARIABLE:TYPE LABEL (I.E. AN ADDRESS POINTER TO THE
; STRING) THIS WILL PRINT GARBAGE... JMM 31 JY 79
;
	ORG	5690H
PRINT	EQU	502DH
	CALL	INPAR	;ADDRESS OF STRING IN DE.
	XCHG		;OUR 'PRINT' TAKES HL FOR POINTER.
	CALL	PRINT	;AND SQUIRT IT OUT...
	RET
	CALL	INPAR	;	
	END
