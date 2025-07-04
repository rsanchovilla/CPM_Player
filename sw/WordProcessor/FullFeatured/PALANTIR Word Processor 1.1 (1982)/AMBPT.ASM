; ROUTINE TO PARSE ESCAPE SEQUENCES FOR AMBASSADOR TERMINAL
; ENTER WITH CHARACTER IN A
ESC	EQU	27
XCONSOL2	EQU	0A4EH
LASTCON1	EQU	0F82H
CON1LEN	EQU	01BH
	ORG	0A42H
XCONSOL1:	CALL	GETK
	ORA	A
	JZ	XCONR
	jmp	xconx
;CODE IN HERE FROM ORGINAL
	ORG	0A72H
xconx:	call xcon2
	ora	a
	jnz	xconsol2
XCONR:	POP	B
	RET
XCON2:
	CALL	PESC	;PARSE ESCAPE SEQ
	ORA	A
	RZ
	CPI	' '
	JC	TRANS
	CPI	127
	JNC	TRANS
	ORA	A
	RET
TRANS:	LXI	H,LASTCON1
	MVI	B,CON1LEN
CONLOOP:	CMP	M
	JZ	CONFOUND
	DCX	H
	DCR	B
	JNZ	CONLOOP
CONFOUND:	MOV	A,B	;TRANSLATED CODE
	ORA	A
	RET
PESC:	CPI	ESC
	RNZ		;NOT ESCAPE
	CALL	CONINS	;GET NEXT CHAR
	CPI	'['	; ESC [ ...?
	JZ	PESC2
	CPI	'O'
	JZ	PESC3
	LXI	H,TABLA
	JMP	PTABL	;PARSE ESC .
PESC2:	CALL	CONINS	;GET 3RD CHAR
	LXI	H,TABLB
	JMP	PTABL
PESC3:	CALL	CONINS
	LXI	H,TABLC
;ENTER WITH PTR TO TABLE IN HL
PTABL:	MOV	E,A	;SAVE CHAR
PTABL1:	MOV	A,M	;TABLE ENTRY
	ORA	A	;RZ END OF TABLE, NULL RESULT
	RZ
	INX	H	;STEP TO TRANSLATION IN TABLE
	CMP	E	;MATCH?
	JNZ	PTABL3	;NO
	MOV	A,M	;TRANSLATED VALUE
	ORA	A
	RET
PTABL3:	INX	H	;NEXT TABLE ENTRY
	JMP	PTABL1	;LOOP
;CHAR IN ROUTINE
GETK:	CALL	CONTEST
	ORA	A
	RZ
CONINS:	LHLD	1	;WARM BOOT VECTOR
	LXI	D,6	;OFFSET
	DAD	D
	PCHL
CONTEST:	LHLD	1
	LXI	D,3
	DAD	D
	PCHL
; TABLE FOR ESC-SIGNIFICENT CHAR
TABLA:	DB	'H','X'-64	;SET
	DB	'F','E'-64	;LINE
	DB	'G','V'-64	;DIR
	DB	0
;TABLE FOR ESC [ SIG
TABLB:	DB	'H','Q'-64	;HOME
	DB	'@','J'-64,'L','J'-64	;INSERT
	DB	'g','C'-64	;CLEAR
	DB	'A','W'-64	;CURSOR UP
	DB	'B','Z'-64	;CURSOR DN
	DB	'C','S'-64	;CURSOR RIGHT
	DB	'D','A'-64	;CURSOR LEFT
	DB	'P',27,'M',27	;CANCEL
	db	'Z',9		;alternate tab
	DB	0
	org	0fbdh
;TABLE FOR ESC [ O SIG
TABLC:	DB	'F','L'-64	;LEX
	DB	'G','N'-64	;DEC TAB
	DB	'H','G'-64	;FIND
	DB	'L','Y'-64	;DOCUMENT
	DB	'K','T'-64	;PAGE
	DB	'I','F'-64	;FORMAT
	DB	'J','R'-64	;SCREEN
	DB	0	; END OF TABLE



