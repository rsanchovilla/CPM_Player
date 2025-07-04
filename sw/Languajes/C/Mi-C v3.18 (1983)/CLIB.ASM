;MI - C  v-3.18   (C) COPYRIGHT  G. KERSTING / H. ROSE, 1983
;  RUNTIME LIBRARY FOR MI - C  V3.26
;
; PUBLIC CCOR,CCXOR,CCAND
; PUBLIC CCEQ,CCNE,CCGT,CCLE,CCGE,CCLT,CUGE,CULT,CUGT,CCLNOT
; PUBLIC CULE,CCASR,CUASR,CCASL,CCSUB,CCNEG,CCCOM,CCMULT,CCDIV
; PUBLIC CUDIV,CCSCOM,CCSNEG,CCSLNOT
; PUBLIC CUSDIV,CCSDIV,CCSASR,CUSASR,CCSASL,CCSSUB
; PUBLIC CC0DIV
;
;
;
; CC0DIV WIRD AUFGERUFEN, WENN EINE DIVISION DURCH 0 
; AUFTRITT. EINE ANDERE REAKTION KANN VOM BENUTZER 
; EINGEFUEGT WERDEN. 
;
CC0DIV:
	PUSH PSW
	PUSH B
	PUSH D
	PUSH H
;
	LXI D,CC0TEXT
	MVI C,9
	CALL 5		; BDOS AUFRUF TEXTAUSGABE KONSOLE
;
	POP H
	POP D
	POP B
	POP PSW
	JMP 0
;
; ALTERNATIVES ENDE STATT JMP 0
;
;	RET
;
CC0TEXT:
 DB 0DH,0AH,'0 - DIVISION',0DH,0AH,'$'
;
; BEI DEN FOLGENDEN UNTERPROGRAMMEN IST DAS ERGEBNIS IN HL
;
; INCLUSIVES 'ODER' HL ODER DE
CCOR:	MOV A,L
	ORA E
	MOV L,A
	MOV A,H
	ORA D
	MOV H,A
	ORA L
	RET
; EXCLUSIVES 'ODER' HL ODER DE
CCXOR:	MOV A,L
	XRA E
	MOV L,A
	MOV A,H
	XRA D
	MOV H,A
	ORA L
	RET
; 'UND' HL UND DE
CCAND:	MOV A,L
	ANA E
	MOV L,A
	MOV A,H
	ANA D
	MOV H,A
	ORA L
	RET
;
; BEI VERGLEICHEN BEDEUTET: 1 IN HL WAHR --   0 IN HL UNWAHR
;
;TEST  HL GLEICH DE
CCEQ:	
	MOV A,L
	SUB E
	MOV A,H
	LXI H,0
	JNZ CCEQ1
	SUB D
	JNZ CCEQ1
	INR L
	RET
CCEQ1:
	XRA A
	RET
; TEST  DE UNGLEICH HL
CCNE:	
	MOV A,L
	SUB E
	MOV A,H
	LXI H,1
	RNZ
	SUB D
	RNZ
	DCR L
	RET
;
; TEST  DE < HL (MIT VORZEICHEN)
CCLT:
	XCHG
; TEST  DE > HL (MIT VORZEICHEN)
CCGT:
	MOV A,D
	XRA H
	JM CCGT1
	MOV A,L
	SUB E
	MOV A,H
	SBB D
	LXI H,1
	RC
	DCR L
	RET
CCGT1:
	ANA H
	LXI H,1
	RM
	DCR L
	RET 
; TEST  DE >= HL (MIT VORZEICHEN)
CCGE:
	XCHG
; TEST  DE <= HL (MIT VORZEICHEN)
CCLE:
	MOV A,D
	XRA H
	JM CCLE1
	MOV A,L
	SUB E
	MOV A,H
	SBB D
	LXI H,0
	INR L
	RNC
	DCR L
	RET
CCLE1:
	LXI H,1
	ANA D
	RM
	DCR L
	RET 
;
; TEST  DE < HL (OHNE VORZEICHEN)
CULT:
	XCHG
; TEST  DE > HL (OHNE VORZEICHEN)
CUGT:
	MOV A,L
	SUB E
	MOV A,H
	SBB D
	LXI H,1
	RC
	DCR L
	RET
; TEST  DE >= HL (OHNE VORZEICHEN)
CUGE:
	XCHG
; TEST  DE <= HL (OHNE VORZEICHEN)
CULE:
	MOV A,L
	SUB E
	MOV A,H
	SBB D
	LXI H,0
	INR L
	RNC
	DCR L
	RET
;
; SHIFTE DE RECHTS (ARITHMETISCH) 
CCASR:
	XCHG
CCSASR:
	MOV A,E
	ANA A
	RZ
	MOV A,H
	RAL
	MOV A,H
	RAR
	MOV H,A
	MOV A,L
	RAR
	MOV L,A
	DCR E
	JNZ CCASR+4
	RET
; SHIFTE DE RECHTS (LOGISCH) 
CUASR:
	XCHG
CUSASR:
	MOV A,E
	ANA A
	RZ
	MOV A,H
	ANA	A
	RAR
	MOV H,A
	MOV A,L
	RAR
	MOV L,A
	DCR E
	JNZ CUASR+4
	RET
; SHIFTE DE LINKS (ARITHMETISCH) 
CCASL:
	XCHG
CCSASL:
	MOV A,E
	ANA A
	RZ
	DAD H
	DCR E
	JNZ CCASL+4
	RET
; SUBTRACTION HL - DE
CCSSUB:
	XCHG
; SUBTRACTION DE - HL
CCSUB:
	MOV A,E
	SUB L
	MOV L,A
	MOV A,D
	SBB H
	MOV H,A
	RET
; ZEIERKOMPLEMENT HL
CCNEG:
	MOV A,H
	CMA
	MOV H,A
	MOV A,L
	CMA
	MOV L,A
	INX H
	RET
; ZEIERKOMPLEMENT DE
CCSNEG:
	MOV A,D
	CMA
	MOV D,A
	MOV A,E
	CMA
	MOV E,A
	INX D
	RET
; EINERKOMPLEMENT HL
CCCOM:
	MOV A,H
	CMA
	MOV H,A
	MOV A,L
	CMA
	MOV L,A
	RET
; EINERKOMPLEMENT DE
CCSCOM:	MOV A,D
	CMA
	MOV D,A
	MOV A,E
	CMA
	MOV E,A
	RET
; LOGISCHES NICHT  (0-1) VON HL
CCLNOT:	MOV A,H
	ORA L
	LXI H,1
	JZ CCLN1
	DCR L
	RET
CCLN1:
	ORA L
	RET
; LOGISCHES NICHT  (0-1) VON DE
CCSLNOT:
	MOV A,D
	ORA E
	LXI D,1
	JZ CCSL1
	DCR E
	RET
CCSL1:
	ORA E
	RET
; MULTIPLICATION DE * HL (MIT/OHNE VORZEICHEN)
CCMULT:	MOV B,H
	MOV C,L
	LXI H,0
CCMUL1:	MOV A,C
	RRC
	JNC CCMUL2
	DAD D
CCMUL2:	XRA A
	MOV A,B
	RAR
	MOV  B,A
	MOV A,C
	RAR
	MOV C,A
	ORA B
	RZ
	XRA A
	MOV A,E
	RAL
	MOV E,A
	MOV A,D
	RAL
	MOV D,A
	ORA E
	RZ
	JMP CCMUL1
; DIVISION DE / HL (REST IN DE)
; (OHNE VORZEICHEN)
CUDIV:
	XCHG
CUSDIV:
	XRA A
	PUSH PSW
	JMP CCDIV4
;
; DIVISION DE / HL (REST IN DE)
; (MIT VORZEICHEN)
CCDIV:
	XCHG
CCSDIV:
	MOV A,D
	XRA H
	PUSH PSW
	MOV A,D
	ORA A
	CM CCSNEG
	MOV A,H
	ORA A
	CM CCNEG
;
CCDIV4:
	MOV B,D
	MOV C,E
	MOV A,B
	ORA C
	CZ CC0DIV
	MVI A,16
	PUSH PSW
	LXI D,0
CCDIV1:
	DAD H
;
	MOV A,E
	RAL
	MOV E,A
	MOV A,D
	RAL
	MOV D,A
	ORA E
;
	JZ CCDIV2
;
	MOV A,E
	SUB C
	MOV A,D
	SBB B
;
	JM CCDIV2
	MOV A,L
	ORI 1
	MOV L,A
	MOV A,E
	SUB C
	MOV E,A
	MOV A,D
	SBB B
	MOV D,A
CCDIV2:
	POP PSW
	DCR A
	JZ CCDIV3
	PUSH PSW
	JMP CCDIV1
CCDIV3:
	POP PSW
	RP
	CALL CCSNEG
	JMP CCNEG
; 
V A,D
	ORA A
	CM CCSNEG
	MOV A,H
	ORA A
	CM CCNEG
;
CCDIV4:
	MOV B,D
	MOV C,E
	MOV A,B
	ORA C
	CZ CC0DIV
	MVI A,16ееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее