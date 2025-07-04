; 8 SEPT; REMOVE DOUBLE QUOTE STUFF.
; MOSHELL
;
; THIS CODE READS IN 'EXEC.OBJ' AT 2800H AND STARTS IT UP.
; IT ALSO STASHES THE FILENAME OF THE FEX-FILE TO
; BE EXECUTED, FOR THE EXEC.OBJ TO WORK WITH.
; 
TRFLAG	EQU	5095H
FCBMOV	EQU	5051H
SYSFCB	EQU	5CH
DSKRD	EQU	5039H
EXEC	EQU	5018H
* THIS SECTION OF CODE READS IN EXEC AND TURNS ON THE DAZZLER FOR US
	ORG	100H
	LXI	SP,1000H
	CALL	SURVIVAL	;FIRST WE MAKE SURE ITS
				;WORTHWHILE TO CONTINUE.
* ASSUME A .FEX EXTENSION ON OBJECT FILE
	LXI	H,SYSFCB+9
	MVI	M,'F'
	INX	H
	MVI	M,'E'
	INX	H
	MVI	M,'X'
	LXI	H,SYSFCB
	LXI	D,DUMMY
	CALL	FCBMOV	;SAVE FCB OF FILE TO EXECUTE
	XCHG
	PUSH	H	;SAVE @ OF THAT FCB
	LXI	H,EXCFCB
	CALL	FCBMOV	;GET READY TO READ "EXEC.OBJ"
	LHLD	EXEC+1	;GET EXEC START ADDRESS
	CALL	DSKRD	;READ "EXEC.OBJ" THERE
	POP	H
	CALL	FCBMOV	;RESET SYSTEM FCB TO FELIX PROGRAM
;
; TRACE NOT WANTED
;
	XRA	A
	STA	TRFLAG
	JMP	EXEC	;EXECUTE THE FELIX PROGRAM SPECIFIED
* DATA AREA
DUMMY	DS	33	;DUMMY FCB
EXCFCB	DB	0,'EXEC    ','OBJ',0,0,0,0
	ORG	EXCFCB+32
	DB	0
; 16 JULY 79 : MOSHELL
;
;TACK ON CODE FOR ROUTINES THAT EXPECT THE 'FELIX' UTILITY
;PACKAGE TO BE IN RESIDENCE. CRIES 'HELP HELP' (ACTUALLY
;IN A DIGNIFIED WAY) WHEN THE DISPATCH TABLE
;AT 5000H IS MISSING. CALLS CPM BIOS...JUMPS TO WARM BOOT
;IF THE TABLE ISN'T THERE.
;
;THIS HAS NO ORG BECAUSE IT'S TACKED ON TO STUFF.
;
BIOS	EQU	5
CPM	EQU	0
SURVIVAL:LDA	5000H	;WHERE 'FELIX' STARTS.
	CPI	0C3H	;IS IT A JUMP?
	JNZ	BAD	;IF NOT WE'RE WITHOUT UTILITIES.
	LDA	5003H
	CPI	0C3H	;IS THERE ANOTHER ONE?
	RZ		;IF SO WE ASSUME ALL'S WELL.
BAD:	LXI	D,TEXT
	MVI	C,9	;CALL FOR TEXT-PRINT
	CALL	BIOS
	JMP	CPM
TEXT:	DB	'PLEASE LOAD THE FELIX UTILITIES BY '
	DB	'TYPING "FELIX" FIRST.',0DH,0AH,'$'
	END
