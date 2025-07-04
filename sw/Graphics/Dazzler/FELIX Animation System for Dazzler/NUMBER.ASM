;16 MAR 79,MOSHELL: REMOVE STTACK-INIT.IN 'MOVE'.
;************************************************************************
;
; NUMBER GROUP * MOVE, COMP, COMPU, ADD, SUBT *
;   1/79       * JANE KIENINGER
;
;
;  NOTES:
;	1.  WHEN AN 8 BIT PARAMETER IS PROCESSED AGAINST A 16 BIT PARAMETER,
;		THE 8 BIT PARAMETER IS TREATED LIKE A 16 BIT PARAMETER
;		WITH 0'S IN THE HIGH ORDER 8 BITS - FLAGS AND PROCESSING
;		PROGRESS AS IF BOTH WERE 16 BITS (MOVE ROUTINE IS NOT
;		AFFECTED).
;	2.  COMPARE - USE 'COMP' TO COMPARE SIGNED INTEGERS, USE 'COMPU'
;		TO COMPARE UNSIGNED.
;	3.  ADD - TO DETECT A RESULT WHICH HAS EXCEEDED STORAGE ALLOWED:
;		A. CHECK CARRY FLAG FOR UNSIGNED INTEGERS.
;		B. CHECK OVERFLOW FLAG FOR SIGNED INTEGERS.
;	4.  SUBT - 
;		A. FOR UNSIGNED INTEGERS CHECK CARRY FLAG TO DETECT A
;			NEGATIVE RESULT.
;		B. FOR SIGNED INTEGERS CHECK OVERFLOW FLAG TO DETECT A RESULT
;			WHICH HAS EXCEEDED STORAGE ALLOWED.
;	5.  MINUS FLAG - IS SET:
;		A.  IN ADD, SUB OR MOVE ROUTINES TO INDICATE THAT THE
;			RESULLT (OR PARAMETER OF 'MOVE') IS NEGATIVE - TO
;			BE USED WITH SIGNED INTEGERS ONLY.
;		B.  IN COMP, TO INDICATE THAT THE SECOND PARAMETER IS GREATER
;			THAN THE FIRST WHEN DEALING WITH SIGNED INTEGERS.
;		C.  IN COMPU, TO INDICATE THAT THE SECOND PARAMETER IS
;			GREATER THAN THE FIRST WHEN DEALING WITH
;			UNSIGNED INTEGERS.
;
;	6.  WARNING - IF SIGNED AND UNSIGNED PARAMETERS ARE INADVERTANTLY
;		MIXED, RESULTS AND FLAGS ARE UNPREDICTABLE.
;
;;************************************************************************
INPARM	EQU	5030H
OUTPRM	EQU	5033H
FLAGS	EQU	0114H	;(*REGISTER #2)
MFLAG	EQU	80H	; LOCATION OF MINUS FLAG (BIT 7)
OFFM	EQU	7FH	; TO TURN OFF MINUS FLAG
ZFLAG	EQU	40H	; LOCATION OF ZERO FLAG  (BIT 6)
OFFZ	EQU	0BFH	; TO TURN OFF ZERO FLAG
ZAPFLAG EQU	3FH	; TO TURN OFF BOTH ZERO AND MINUS (BIT 6 AND 7)
CFG	EQU	02H	; TO TURN ON  CARRY FLAG (BIT 1)
OFG	EQU	08H	; TO TURN ON OVERFLOW FLAG (BIT 3)
ZAPALL	EQU	35H	; TO TURN OFF ALL FELIX FLAGS (BITS 1,3,6,7)
ON	EQU	0FFH	; USED TO TURN INTERNAL FLAG ON
ZERO	EQU	00H	;
	ORG	5300H
RESULT	DB	00H	; TEMPORARY SAVE AREA FOR COMPUTATIONAL RESULTS
RTSW	DB	00H	; ROUTINE SWITCH
;*************************************************************************
;
; MOVE 	* MOVE ROUTINE * J-2LANE KIENINGER
;	*     1/79     * VERSION 1.1
;
;  DESCR:   THIS ROUTINE EXAMINES THE FIRST PARAMETER AND
;	SETS MINUS AND ZERO (FELIX) FLAGS AS NECESSARY.  
;	IT TESTS THE SIGN FLAG SET BY INPARM TO DETERMINE WHETHER 8 OR
;	16 BITS SHOULD BE EXAMINED.  OUTPRM ACTUALLY MOVE THE VALUE TO A
;	NEW VARIABLE.
;  INPUT:  REGISTERS D AND E FROM INPARM.
;  OUTPUT: REGISTERS D AND E TO OUTPRM.
;  SUBROUTINES:  INPARM, OUTPRM
;  REGISTERS DESTROYED: A AND B
;
;****************************************************************************
MOVE:	LDA	FLAGS	; ZERO FLAGS
	ANI	ZAPFLAG	
	STA	FLAGS
	MVI	B,00H	; ZERO B USED TO INDICATE 16 BIT PARAMETER SIZE
	CALL	INPARM	; GET PARAMETER
	JC	BIT16	; IF CARRY FLAG SET, PARAMETER SIZE IS 16 BITS
;
;  SET MINUS FLAG FOR 8-BIT IF NEGATIVE
;
	MOV	A,E	; IF E IS NEGATIVE 
	CPI	0H	;     SET MINUS FLAG TEMPORARILY IN B
	JP	CKZERO	
	MVI	B,MFLAG
	JMP	CKZERO
;
;  SET MINUS FLAG FOR 16 BIT IF NECESSARY
;
BIT16:	MOV	A,D	; IF D IS NEGATIVE SET TEMPORARY MINUS FLAG IN B
	CPI	0H	;
	JP	CKZERO
	MVI	B,MFLAG
CKZERO: MOV 	A,D	; CHECK TO SEE IF VALUE =0
	ORA	E
	LDA	FLAGS	;  UPDATE FLAGS
	JNZ	MVEND
	ORI	ZFLAG	; SET ZERO FLAG
MVEND:  ORA	B	; SET MINUS FLAG FROM B
	STA	FLAGS	; RESTORE FLAGS
	CALL	OUTPRM	; CALL OUTPRM TO GET VALUE TO BE MOVED
	RET
;********************************************************************
; COMP/COMPU * COMPARE SIGNED (COMP) AND COMPARE UNSIGNED (COMPU) ROUTINES *
;      * JANE KIENINGER
;      *      1/79       * VERSION 1.1
;
; DESCR:  THIS ROUTINE COMPARES THE SECOND PARAMETER VALUE FROM
;	THE FIRST.  IF THE SECOND VALUE IS GREATER THAN THE FIRST THE
;	FELIX MINUS FLAG IS SET AND IF THE RESULT IS ZERO (THE VALUES
;	ARE EQUAL) THE FELIX ZERO FLAG IS SET.  THE MINUS FLAG IS
;	SET BASED ON THE 16 BITS OF THE RESULT EXCEPT WHEN BOTH
;	PARAMETER VALUES ARE 8 BITS AS INDICATED BY THE CARRY FLAG
;	SET BY INPARM - IN THAT CASE  THE MINUS FLAG IS SET BASED
;	ON THE LOWER 8 BITS OF DE.
;	  COMP SETS THE FLAGS ASSUMING BOTH PARAMETERS ARE SIGNED
;	INTEGERS WHILE COMPU SETS THE FLAGS ASSUMING THEY ARE UNSIGNED
;	INTEGERS.  THE ENTRY POINT INTO THIS ROUTINE DETERMINES WHETHER
;	IT WILL DO A SIGNED OR UNSIGNED COMPARE.  A ROUTINE FLAG IS SET
;	(RTSW) TO 00 FOR UNSIGNED AND FF FOR SINGED.
; INPUT:  REGISTERS D AND E FROM INPARM
; OUTPUT:   FELIX FLAGS ZERO (BIT 6) AND MINUS (BIT 7) SET
; SUBROUTINES:  INPARM
; REGISTERS DESTROYED: ALL
;
;***************************************************************************
	ORG	5340H
;
;  UNSIGNED COMPARE ROUTINE START POINT
;
CKMPU:	XRA	A	; SET ROUTINNE SWITCH TO 0
	STA	RTSW	;
	JMP	C0	;
;
;  SIGNED COMPARE ROUTINE START POINT
;
	ORG	5350H
COMP:	ORI	ON	; SET ROUTINE SWITCH TO FF TO INDICATE
	STA	RTSW	;	SIGNED NUMBERS.
; 
; BEGIN COMPARE ROUTINE
;
C0:	LDA	FLAGS	; ZERO FLAGS
	ANI	ZAPFLAG 
	STA	FLAGS
	MVI	B,00H	; ZERO REGISTERS
	MVI	C,00H	; 
;
;  GET PARAMETERS - SET 16 BIT FLAG IN B IF EITHER IS 16 BITS LONG
;
	CALL	INPARM	; GET FIRST PARAMETER TO BE COMPARED
	JNC	C1	; IF CARRY FLAG IS SET, SET
	MVI	B,ON	;    16 BIT FLAG IN REG B
C1:	XCHG		; MOVE VALUE OF FIRST PARM INTO HL
	CALL	INPARM	; GET SECOND PARAMETER
	JNC	C2	; IF CARRY FLAG SET, SET
	MVI	B,ON	;    16 BIT FLAG IN REG B.
;
;  8 BIT PROCESSING
;
C2: 	MOV	A,L	; COMPARE L AND E
	CMP	E
	RAL		; PUT CARRY BIT IN LOW ORDER BIT OF ACCUM
	MOV	C,A	; 	SAVE CARRY IN C
	JNZ	C3	; IF ZERO SET ZERO FLAG AND BYPASS CARRY CHECK
	LDA	FLAGS
	ORI	ZFLAG
	STA	FLAGS
	JMP	C65
C3:	CALL 	CSUBR1
;
;  IF BOTH VALUES ARE 8 BITS END PROCESSING
;
C65:	MOV	A,B	; B = 16 BIT FLAG
	CPI	ON	; IF FLAG ON?
	JNZ	CEND	; IF NOT, END PROCESSING
;
;   16-BIT PROCESSING
C7:	MOV	E,D	; MOVE D TO E AND H TO L TO SET UP
	MOV	L,H	;	UP FOR SUBROUTINE CALL
	MOV	A,L	; COMPARE H & D
	CMP	E
	JZ	CEND	; IF EQUAL THEN THE MINUS AND ZERO FLAGS ALREADY HAVE
			;	BEEN SET IN 8 BIT COMPARE.
	RAL		; PUT CARRY BIT IN LOW ORDER BIT OF ACCUM.
	MOV	C,A	; SAVE CARRY IN C
	LDA	FLAGS	; GET FELIX FLAGS
	ANI	OFFZ	; TURN OFF ZERO FLAG IF SET IN 8 BIT COMPARE
	STA	FLAGS
	CALL 	CSUBR
CEND:	RET
;**
;
; COMPARISON SUBROUTINE
;
; 	SETS MINUS FLAG IF SECOND OPERAND GREATER THAN FIRST
;
;**
CSUBR1: MOV	A,B	; IF 16 BIT PROCESSING, SIGNED ROUTINE MUST
	CPI	ON	;	BE IGNORED DURING 8 BIT COMPARE
	JZ	C4
CSUBR:	LDA	RTSW	; IF SIGNED NO. (IF ON), THEN MUST
	CPI	ON	;	CHECK SIGNS.
	JNZ	C4	;	ELSE BYPASS SECTION.
;**
;  SIGNED NUMBER SPECIAL ROUTINE
;
	PUSH 	B	; SAVE REGISTERS
	MOV	A,E	; TURN OFF ALL BUT SIGN BIT IN E
	ANI	80H	;
	MOV	C,A	; SAVE IN C
	MOV	A,L	; TURN OFF ALL BUT SIGN BIT IN H
	ANI	80H
	CMP	C	; COMPARE TWO SIGNS
	POP	B	; RESTORE BC
	MOV	A,C	; LOW BIT OF C CONTAINS CARRY
	JZ	C4	; IF UNEQUAL COMPLEMENT CARRY
	RAR		; PUT CARRY BACK
	CMC		; COMPLEMENT CARRY
	JMP	C5	
C4:	MOV	A,C	; LOW BIT OF C CONTAINS CARRY
	RAR
C5:	LDA	FLAGS	; GET FELIX FLAGS
	JNC	C55	; IF CARRY, SET MINUS FLAG
	ORI	MFLAG	; SET MINUS FELIX FLAG
	JMP	C6
C55:	ANI	OFFM	; TURN OFF MINUS IF SET IN 8 BIT COMPARE
C6:	STA	FLAGS	; RETURN FELIX FLAGS
	RET
;******************************************************************************
;
; ADD/SUB * ADD AND SUBTRACT ROUTINE * JANE KIENINGER
;         *         1/79             * VERSION 1.1
;
; DESCR:  THIS ROUTINE ADDS THE FIRST PARAMETER TO THE SECOND, OR
;	SUBTRACTS THE SECOND FROM THE FIRST, AND PLACES THE RESULT
;	IN THE THIRD.  THE ENTRY POINT INTO THIS ROUTINE DETERMINES
;	WHETHER IT WILL ADD OR SUBTRACT.  A ROUTINE FLAG (RTSW) IS SET TO
;	00 FOR ADD AND FF FOR SUBTRACT.  THE ROUTINE USES INPARM AND OUTPRM
;	FOR INPUT AND OUTPUT OF PARAMETERS AND SETS FELIX FLAGS.  THE
;	MINUS FLAG IS SET BASED ON THE 16 BITS OF THE RESULT EXCEPT WHEN
;	BOTH PARAMETER VALUES ARE 8 BITS (AS INDICATED BY THE CARRY FLAG
;	SET BY INPARM), WHEN THAT OCCURS THE MINUS FLAG IS SET BASED
;	ON AN 8 BIT RESULT.
; INPUT:  REGISTERS D AND E FROM INPARM
; OUPUT:  REGISTERS D AND E FOR OUTPRM AND FELIX FLAGS: ZERO (BIT 6),
;	MINUS (7), CARRY (1), OVERFLOW (3)
; SUBROUTINES:  INPARM, OUTPRM
; REGISTERS DESTROYED:  ALL
;
;******************************************************************************
	ORG	53E0H
;
;  ADD ROUTINE START POINT
;
ADDIT:  XRA	A	; SET ROUTINNE SWITCH TO 0 TO INDICATE
	STA	RTSW	;	ADD ROUTINE.
	JMP	A1
;
;  SUBTRACT ROUTINE START POINT
;
	ORG	53F0H
SUBIT:	ORI	ON	; SET ROUTINE SWITCH TO FF TO INDICATE SUBTRACT
	STA	RTSW	;   	ROUTINE.
;
;	BEGIN
;
A1:	LDA	FLAGS	; ZERO FLAGS AND REGISTERS.
	ANI	ZAPALL
	STA	FLAGS	;
	MVI	C,00H
	MVI	B,00H
;
; GET PARAMETERS - SET 16 BIT FLAG IN REG B IF EITHER IS 16 BITS LONG
;
	CALL	INPARM	; 1ST PARAMETER PLACED IN DE
	JNC	A5	; IF CARRY FLAG SET, SET
	MVI	B,ON	;   16 BIT FLAG IN REG B
A5:	XCHG		; 1ST PARAMETER NOW IN HL
	CALL	INPARM	; 2ND PARAMETER IN DE
	JNC	A10	; IS CARRY FLAG SET, SET
	MVI	B,ON	;    16 BIT FLAG IN REG B
;
; 8-BIT PROCESSING
;
A10:	LDA	RTSW	; IS THIS ADD OR SUBTRACT ROUTINE?
	CPI	ON	; IF NOT ON THEN ADD ELSE SUBTRACT
	JNZ	A15	;
*
*  8 BIT SUBTRACTION
*
	MOV	A,L	; SUBTRACT LOWER 8 BITS (E & L)
	SUB	E	;
	STA	RESULT	; STORE 8-BIT RESULT
	PUSH	PSW	; SAVE RESULTS AND FLAGS FOR LATER USE
	MOV	A,B	; IF 16 BIT PROCESSING, SKIP 8 BIT FLAG SETTINGS
	CPI	ON
	LDA	RESULT	; ACCUMULATOR MUST CONTAIN RESULT FOR OVERFLOW
				;     SUBROUTINE.
	JZ	A31
	CALL	SOVFLOW	; SET 8 BIT OVERFLOW FLAG IN REG C IF NEC.
	JMP	A20	; BYPASS ADD ROUTINE.
*
*  8-BIT ADDITION
*
A15:	MOV	A,L	; ADD LOWER 8 BITS (E & L)
	ADD	E	;
	STA	RESULT	; STORE 8 BIT RESULT
	PUSH	PSW	; SAVE RESULTS AND FLAGS FOR LATER USE
	MOV	A,B	; IF 16 BIT PROCESSING, SKIP 8 BIT FLAG SETTING
	CPI	ON	;
	LDA	RESULT	; ACCUMULATOR MUST CONTAIN RESULT FOR OVERFLOW
			;    SUBROUTINE.
	JZ	A31	;
	CALL	OVFLOW	; SET 8BIT OVERFLOW FLAG IN REG C
A20:	POP	PSW	; RECOVER RESULT AND FLAGS
	MVI	A,ZERO	; CLEAR ACCUMULATER (MUST USE MVI)
	JNC	A25	; SET  CARRY FLAG TEMPORARILY IN A
	MVI	A,CFG	;   IF CARRY SYSTEM FLAG SET
A25:	JP	A30	; SET FELIX MINUS FLAG TEMP WITH 8 BIT
	ORI	MFLAG	;   CARRY FLAG IN A IF RESULT WAS NEGATIVE
A30: 	ORA	C	; ADD OVERFLOW FLAG TO CARRY AND MINUS
	MOV	C,A	; SAVE ALL FLAGS IN C
	LDA	FLAGS	; BRING IN FELIX FLAGS
	ORA	C	; SET 8-BIT OVERFLOW, CARRY AND MINUS PERMANNENTLY
	STA	FLAGS
	JMP	A60	; SKIP TO SET ZERO FLAG
;
; 16 BIT PROCESSING
;
;
A31:	LDA	RTSW	; IF THIS ADD OR SUBTRACT ROUTINE ?
	CPI	ON	; IF NOT ON THEN ADD ELSE SUBTRACT
	JNZ	A35	;
*
*  16 BIT SUBTRACTION
*
	POP	PSW	; RESTORE CARRY FLAG
A32:	MOV	A,H	; SUBTRACT TOP 8 BITS (H & D) WITH BORROW FROM
	SBB	D	; 	LOWER 8 BITS.
	MOV	E,D	; MOVE D TO E AND H TO L TO PROPERLY USE 
	MOV	L,H	;	OVERFLOW ROUTINE.
	PUSH	PSW	; SAVE RESULT AND SYSTEM FLAGS
	CALL	SOVFLOW	; SETS OVERFLOW FLAG IN C IF ANY
	JMP	A38	; BYPASS ADD ROUTINE
*
*
*  16 BIT ADDITION
*
A35:	POP	PSW	; RESTORE CARRY FLAG
A36:	MOV	A,H	; ADD TOP 8-BITS (H & D) WITH CARRY FROM
	ADC	D	;     LOWER 8-BITS.
	MOV	E,D	; MOVE D TO E AND H TO L TO PROPERLY USE OVERFLOW
	MOV	L,H	;     ROUTINE.
	PUSH	PSW	; SAVE RESULT AND SYSTEM FLAGS.
	CALL	OVFLOW  ; SETS OVERFLOW FLAG IN REG C (IF ANY)
A38:	POP	PSW	; RESTORE RESULT IN ACCUMULATOR AND ALL SYSTEM FLAGS
	MOV	D,A	; SAVE RESULT OF FUNCTION IN D
	MVI	H,00H	; CLEAR H
	JNC	A40	; SET  CARRY TEMP IN H IF SYSTEM 
	MVI	H,CFG	;    CARRY WAS SET
A40:	LDA	FLAGS	; BRING IN FELIX FLAGS
	JP	A45	; IF RESULT WAS NEGATIVE SET MINUS FLAG
	ORI	MFLAG  ;      PERMANENTLY.
	JMP	A50	;
A45:	ANI	OFFM	; IF RESULT WAS POSITIVE RESET FLAG
A50: 	ORA	C	; SET 16 BIT OVERFLOW FLAG PERMANENTLY
	ORA	H	; SET 16 BIT CARRY FLAG PERMANENTLY
	STA	FLAGS	; RETURN FELIX FLAGS TO MEMORY
;
; SET ZERO FLAG
;
A60:	LDA	RESULT ; READ IN 8 BIT PROCESSING RESULTS
	MOV	E,A	; STORE THIS RESULT PERMANENTLY IN E
	ORA	D	; COMPARE IT WITH 16-BIT RESULTS
	JNZ	A65	; IF RESULT = 0 SET ZERO FLAGS
	LDA	FLAGS	;
	ORI	ZFLAG	;
	STA	FLAGS	; RETURN FELIX FLAGS TO MEMORY FOR LAST TIME
A65:	CALL	OUTPRM
	RET
;
; OVFLOW * OVERFLOW SUBROUTINE FOR ADD *
;
; DESCR: THIS SUBROUTINE SETS THE FELIX OVERFLOW FLAG IF BOTH OPERANDS ARE
;     THE SAME SIGN AND THE RESULT IS OF THE OPPOSITE SIGN. THE CODING HAS
;     THE ORDER OF THIS REVERSED FOR EFFICIENCY.  AT THE END OF THE 
;     ROUTINE REGISTER C CONTAINS AN 8 BIT OVERFLOW FLAG CONFIGURATION.
; REGISTERS: REG A - RESULT OF ADDITION (INITIALLY ONLY)
;            REG E - SECOND OPERAND
;	     REG L - FIRST OPERAND
;	     REG C - ALL ZEROS OR 8 BIT OVERFLOW FLAG CONFIGURATION
;                    (AT  END OF SUBROUTINE)
;;;
; 1.  COMPARE SIGN BITS OF RESULT (A) WITH OPERAND IN E.  IF = THEN
;     NO OVERFLOW.
;
OVFLOW:	ANI	80H	; TURN OFF ALL BUT SIGN BIT IN RESULT
	MOV	C,A	; SAVE THIS
	MOV	A,E	; NOW BRING IN OPERAND IN E AND TURN OFF
	ANI 	80H	;     ALL BUT SIGN BIT.
	CMP	C	; COMPARE SIGN BIT OF RESULT WITH OPERAND FROM E
	JZ	F15	; IF SIGNS ARE EQUAL THEN NO OVERFLOW
;
; 2.  NOW COMPARE SIGN BIT OF OPERAND FROM E WITH THAT OF L.
;
	MOV	C,A	; SAVE E'S SIGN
	MOV	A,L	; BRING IN L AND TURN OFF ALL BUT SIGN BIT
	ANI	80H	; 
	CMP	C	; COMPPARE SIGN BIT OF E WITH L
	JNZ	F15	; IF EQUAL SET OVERFLOW FLAG TEMPORARILY
	MVI	C,OFG  ;    IN C.
	JMP	F20	; BYPASS CLEARING C.
F15:	MVI	C,00H	; CLEAR C FOR FLAG USE
F20:	RET
;
; SOVFLOW * OVERFLOW SUBROUTINE FOR SUBTRACT *
;
; DESCR:  THIS SUBROUTINE SETS THE FELIX OVERFLOW FLAG IF THE SIGNS
;	OF THE OPERANDS DIFFER AND THE RESULT SIGN IS THE SAME AS THE
;	SIGN OF THE SECOND OPERAND.  THE CODING HAS THE ORDER OF THIS
;	REVERSED FOR EFFICIENCY.  AT THE END OF THE ROUTINE REGISTER C 
;	CONTAINS AN 8 BIT OVERFLOW FLAG CONFIGURATION.
; REGISTERS:	REG A - RESULT OF SUBRACTION (INITIALLY ONLY)
;		REG L - FIRST OPERAND
;		REG E - SECOND OPERAND
;		REG C - ALL ZEROS OR 8 BIT OVERFLOW FLAG CONFIGURATION
;			AT END OF SUBROUTINE.
;
; 1.  COMPARE SIGN BITS OF RESULT (A) WITH OPERAND IN E.  IF UNEQUAL
;	THEN NO OVERFLOW.
;
SOVFLOW:	ANI	80H	; TURN OFF ALL BUT SIGNN BIT IN RESULT
	MOV	C,A	; SAVE THIS
	MOV	A,E	; NOW BRING IN OPERAND IN E AND TURN OFF
	ANI	80H	;	ALL BUT SIGN BIT.
	CMP	C	; COMPARE SIGN BIT OF RESULT WITH OPERAND FROM E.
	JNZ	S15	; IF SIGNS DIFFER THEN NO OVERFLOW.
;
; 2.  NOW COMPARE SIGNS OF TWO OPERANDS
;
	MOV	C,A	; SAVE E'S SIGNN
	MOV	A,L	; BRING IN L AND THRN OFF ALL BUT SIGN BIT
	ANI	80H	; 
	CMP	C	; COMPARE SIGN BIT OF E WITH L
	JZ	S15	; IF UNEQUAL SET OVERFLOW FLAG IN C
	MVI	C,OFG	;
	JMP	S20	; BY PASS CLEARING C
S15:	MVI	C,00H	; CLEAR C FOR FLAG USE
S20:	RET
