; MONITOR TO INTERFACE PILOT TO CPM
;   BY JIF  10/24/77
;   WITH DISK CODE LIFTED FROM PRINT PROGRAM WRITTEN BY JK
;
SYSDAT:	EQU	0E00H	; PILOT TABLE
APTR:	EQU	SYSDAT+1CH ; LAST WORD OF MEMORY AVAILABLE TO PILOT
				; NOTE: THIS BYTE GETS CHANGED
PBUFB:	EQU	1100H	; BEGINNING OF SPACE AVAILABLE FOR PILOT PROGRAMS
;JUMP TABLE ADDED AT BEGIN OF PILOT SO MONITOR CAN ACCESS ROUTINES IN PILOT
ORIGN:	EQU	0100H
BASIC:	EQU	ORIGN+6
INTR:	EQU	ORIGN+9H

BOOT	EQU	0	;REBOOT ENTRY POINT
CPM	EQU	5	;CPM ENTRY POINT

TBUF	EQU	80H	;TRANSIENT PROGRAM BUFFER
TFCB	EQU	5CH	;TRANSIENT PROGRAM FCB

OPEN	EQU	15	;OPEN FUNCTION CODE
READ	EQU	20	;READ FUNTION CODE

;************************************************
;                                               ;
;NOTE:  FROM HERE TO NEXT LINE OF STARS,	;
;        ENTRIES MUST STAY IN PLACE.  THEY ARE	;
;        REFERENCED IN PILOT PROGRAMS		;
	
	
	ORG	1000H
	JMP	INITL
BUFAD:	DW	0

JMPTAB:
CI:	JMP	CHI	; CONSOLE INPUT
CO:	JMP	CHO	; CONSOLE OUTPUT
RI:	JMP	RDSK	; USED BY "LOAD" COMMAND
LO:	JMP	CHO	; USED BY "PRINT" COMMAND
PO:	JMP	CHO	; USED BY "SAVE" COMMAND
EXIT:	JMP	BOOT
EDIT:	JMP	BOOT	; ACCESSES ROUTINE TO EDIT PILOT PROGRAMS IN MEMORY
ASCAN:	JMP	BASIC	; ACCESSES INTERPRETER FOR COMMAND NOT
			; RECOGNIZED BY PILOT.  NOT IMPLEMENTED.

;************************************************
;						;
;  INITIALIZE PILOT DATA AND OPEN DISK FILE	;
;						;
;************************************************
INITL:
	LHLD	6
	DCX	H	; CCP WILL BE OVERLAID
	SHLD	BUFAD
	DCX	H
	SHLD	APTR
;  OPEN DISK FILE
	LXI	D,TFCB
	CALL	FOPEN
	JC	ERR
	RET

;************************************************
;                                               ;
;  CPM ACCESS ROUTINES USED BY PILOT		;
;                                               ;
;*************************************************
CHI:	; INPUT BYTE FROM CONSOLE
	PUSH	B
	PUSH	D
	PUSH	H

	MVI	C,1
	CALL	CPM	; CHR RETURNED IN A
	ANI	07FH

	POP	H
	POP	D
	POP	B
	RET

CHO:	; OUTPUT BYTE TO CONSOLE
	PUSH	PSW	; PILOT EXPECTS ALL REGISTERS TO BE RETURNED INTACT
	PUSH	D
	PUSH	H
	PUSH	B

	MVI	C,11	; RETURNS NON ZERO ACCUM IF READY
	CALL	CPM
	ORA	A
	JZ	CHO1	; THEN CONTINUE
	MVI	C,1
	CALL	CPM
	ANI	07FH
	CPI	1AH	; IF CNTRL/Z
	JZ	INTEX	; THEN INTERRUPT
CHO1:
	POP	B
	PUSH	B
	MOV	E,C
	MVI	C,2
	CALL	CPM

	POP	B
	POP	H
	POP	D
	POP	PSW
	RET
INTEX:
	POP	B
	POP	H
	POP	D
	POP	PSW
	JMP	INTR

;************************************************
;						;
;  PILOT "LOAD" COMMAND IN SIGN ON SEQUENCE	;
;  COMES HERE TO READ PROGRAM FROM DISK		;
;						;
;************************************************
;
RDSK:
	PUSH	B
	PUSH	D
	PUSH	H
LP:	CALL	GETBT
	CPI	0AH	; PILOT DOESN'T LIKE <LF>, SO DISCARD
	JZ	LP
	POP	H
	POP	D
	POP	B
	RET

;************************************************
;						;
;  DISK ROUTINES				;
;						;
;************************************************
ERR:	LXI	D,ERMSG
	MVI	C,09H	;WRITE MSG
	CALL	CPM
	JMP	BOOT

 
;********************************;
;           F O P E N            ;
;  ROUTINE TO OPEN A DISK FILE   ;
;                                ;
;  INPUT:     DE=A(FCB)          ;
; OUTPUT:     CARRY=ERROR        ;
;********************************;

FOPEN:	MVI	C,OPEN	;OPEN CODE
	CALL	CPM	;ISSUE OPEN
	CPI	0FFH	;ERROR?
	JZ	FOERR	;YES
	XRA	A	;CLEAR CARRY
	RET
FOERR:	STC
	RET


;********************************;
;            G E T B T           ;
;   ROUTINE TO READ A BYTE       ;
;                                ;
;  OUTPUTS:     A=BYTE           ;
;               CARRY=ERROR      ;
;********************************;

GETBT:	LXI	H,TBUF+128
	XCHG		;BUFFER END ADDR. IN DE
	LHLD	INPTR	;CURRENT POINTER IN HL
	CALL	CPHL	;TEST FOR END OF BUFFER
	JZ	GETB2	;YES, READ
GETB1:	MOV	A,M	;GET BYTE
	INX	H	;BUMP POINTER
	SHLD	INPTR	;SAVE POINTER
	ORA	A	;RESET CARRY
	RET
GETB2:	MVI	C,READ	;READ CODE
	LXI	D,TFCB	;FCB ADDRESS
	CALL	CPM	;ISSUE READ
	CPI	00	;ERROR?
	JNZ	IERR	;YES
	LXI	H,TBUF	;RESET BUFFER POINTER
	SHLD	INPTR
	JMP	GETB1	;CONTINUE
IERR:	STC
	RET

;********************************;
;   MISCELLANEOUS SUBROUTINES    ;
;********************************;

;********************************;
;             C P H L            ;
;  ROUTINE TO COMPARE HL VS DE   ;
;********************************;

CPHL:	MOV	A,H
	CMP	D
	RNZ
	MOV	A,L
	CMP	E
	RET

;********************************;
;             D A T A            ;
;********************************;

ERMSG:	DB	'ERROR',0DH,0AH,'$'
	DS	32
INPTR:	DW	TBUF+128;INPUT POINTER
DECWRK:	DB	'000'
	ORG	PBUFB
PBUFF:	DB	1
