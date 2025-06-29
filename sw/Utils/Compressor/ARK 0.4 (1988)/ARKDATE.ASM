;
; ARKDATE - support for Time and Date stamping
;
; 11/28/88 BEM -- changed to overlay structure
;				- Brian Moore
;
; Patch your time routine entry into the jump at TDATE_ (for systems
; without individual file stamping) or at FDATE (for systems that DO
; have date stamps on each file).  Your routine should call CDATE_ to
; convert the date to the .ARK format.	The TDATE_ call is made immed-
; iately after printing the signon message, and may include a message
; indicating what date-stamping routine is used.  You may call the PUTS
; function to output a null-terminated message addressed by HL.  Note
; that PUTS will convert a LF (ASCII 0Ah) to a CR-LF sequence.
;
YR:	DB	88		;				; [103h]
MO:	DB	11		;				; [104h]
IDAY:	DB	28		;				; [105h]
HOUR:	DB	16		;				; [106h]
MIN:	DB	0		;				; [107h]
;
	PUBLIC	TDATE_,	FDATE_
TDATE_:	JMP	TDOSDATE	; Today's-Date (called at init-time)
FDATE_:	DB	0C9H,00,00	; File-Date (called immediately after F_OPEN
CDATE_:	JMP	GET_DATE	; Convert and save date
PUTS:	JMP	PUTS		; Print the null-terminated string at HL
;
; Start of user-supplied date routine
;
; Get Z80-DOS date, convert to YYMMDDHHMM and save at 0103h.  DO NOT
; CHANGE IX,IY, or BC.	Any and all other registers can be destroyed.
;
TDOSDATE:
	DB	0DDH, 0E5H	; Push	ix
	DB	0FDH, 0E5H	; Push	iy
	PUSH	B
	LXI	H,TDOSMSG
	CALL	PUTS
	XRA	A
	STA	OSFLAG
	MVI	C,105		; DOS+ get date routine
	LXI	D,MO		; Buffer area
	CALL	5
	MOV	A,H
	ORA	L		; Return == 0??
	JZ	JTOC4
	STA	OSFLAG
	LHLD	MO		; Get the Julian date
	LXI	D,06F0DH	; Adjust fm Digital Research
	DAD	D		; Format to algorithm
	LXI	D,4		; 4*JDATE +3
	CALL	MULWW		; DE*HL to (DE,HL)
	LXI	B,3
	DAD	B
	JNC	JTOC1
	INX	D
;
JTOC1:	LXI	B,1461		; Y = (4*JDATE+3)/1461
	CALL	DIVLW		; (DE,HL)/BC to DE(Q) and HL(R)
	PUSH	D		; Save Y, HL has D (remainder)
	LXI	B,4		; D = D/4 +1
	LXI	D,0
	CALL	DIVLW
	INX	D
	LXI	H,5		; 5 * D - 3
	CALL	MULWW		; DE*HL to (DE,HL)
	LXI	B,3
	ORA	A
	DB	0EDH,042H	; Sbc	hl,bc
	JNC	JTOC2
	DCX	D
;
JTOC2:	LXI	B,153		; M = (5*D - 3)/153
	CALL	DIVLW
	PUSH	D		; Save m, HL has D (remainder)
	LXI	B,5		; Day = D/5 + 1
	LXI	D,0
	CALL	DIVLW
	INX	D
	MOV	A,E
	STA	IDAY
	POP	H		; M
	POP	D		; Y
	MOV	A,L		; Month = M + 3
	ADI	3
	CPI	12+1		; If month > 12
	JC	JTOC3
	SUI	12		; Month = Month - 12
	INX	D		; Y = Y + 1
;
JTOC3:	STA	MO
	MOV	A,E
	STA	YR
;
JTOC4:	ORA	A
	CALL	CDATE_		; Make it readable to ARK
	POP	B
	DB	0FDH, 0E1H	; Pop	iy
	DB	0DDH, 0E1H	; Pop	ix
	RET

MULWW:	MOV	B,H		; 16 * 16 multiplicaton    DE*HL to (DE,HL)
	MOV	C,L
	LXI	H,0
	MVI	A,10H
;
MULW1:	DAD	H
	XCHG
	DB	0EDH,06AH	; ADC	HL,HL
	XCHG
	JNC	MULW2
	DAD	B
	JNC	MULW2
	INX	D
;
MULW2:	DCR	A
	JNZ	MULW1
	RET
;
DIVLW:	XCHG			; 32-bit divide (DE,HL)/BC to DE(Q) and HL(R)
	MVI	A,10H
;
DIVL1:	XCHG
	DAD	H
	XCHG
	DB	0EDH,06AH	; Adc	hl,hl
	DB	0EDH,042H	; Sbc	hl,bc
	JNC	DIVL3
	DAD	B
;
DIVL2:	DCR	A
	JNZ	DIVL1
	RET
;
DIVL3:	INX	D
	JMP	DIVL2
;
;
OSFLAG:	DB	0
TDOSMSG:DB	'Turbo-DOS version',10,0
	DS	200H
;
; Put date in .ARC format (YYYYYYYM MMMDDDDD)
;
GET_DATE:
	LDA	MO
	MOV	L,A
	LDA	YR
	SUI	80
	DB	0CBH, 025H	; SLA	l
	DB	0CBH, 025H	; SLA	l
	DB	0CBH, 025H	; SLA	l
	DB	0CBH, 025H	; SLA	l
	DB	0CBH, 025H	; SLA	l
	RAL			; RLA
	MOV	H,A
	LDA	IDAY
	ANI	01FH
	ORA	L
	MOV	L,A
	SHLD	ARCDATE_	; Save in ARK.COM
;
; Put time in .ARC format (HHHHHMMM MMMSSSSS) (ignoring seconds)
;
	LXI	H,HOUR
	LDA	OSFLAG
	ORA	A
	JNZ	GET_D0		; If O/S supports time of day, Jump
	MOV	D,M		; Else get hour...
	INX	H
	MOV	E,M
	JMP	GET_D1
;
GET_D0:	XRA	A
	DB	0EDH,06FH	; RLD	  : A = 1, (HL) = 80
	MOV	D,A
	DB	0CBH,027H	; SLA	A : A = 2
	DB	0CBH,027H	; SLA	A : Aga = 4
	ADD	D		; A = 5
	DB	0CBH,027H	; SLA	A : A = A
	MOV	D,A		; D =0ah
	XRA	A
	DB	0EDH,067H	; RRD	  : A = 0, (HL) = 08
	MOV	A,M
	ADD	D		; A = 12
	MOV	D,A
	INX	H
	XRA	A
	DB	0EDH,06FH	; RLD
	MOV	E,A
	DB	0CBH,027H	; SLA	A
	DB	0CBH,027H	; SLA	A
	ADD	E
	DB	0CBH,027H	; SLA	A
	MOV	E,A
	XRA	A
	DB	0EDH,067H	; RRD
	MOV	A,M
	ADD	E
	MOV	E,A
;
GET_D1:	DB	0CBH,023H	; SLA	E
	DB	0CBH,023H	; SLA	E
	DB	0CBH,023H	; SLA	E
	DB	0CBH,012H	; RL	D
	DB	0CBH,023H	; SLA	E
	DB	0CBH,012H	; RL	D
	DB	0CBH,023H	; SLA	E
	DB	0CBH,012H	; RL	D
;
; Save in ARK.COM
;
	XCHG
	SHLD	ARCTIME_
	RET
;
	EXTRN	ARCDATE_, ARCTIME_, PUTS
;
	END
