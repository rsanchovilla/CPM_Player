;	THIS WORK WAS PREPARED UNDER CONTRACT TO THE LISTER HILL NATIONAL CENTER
;	FOR BIOMEDICAL COMMUNICATIONS, NATIONAL LIBRARY OF MEDICINE, BETHESDA,
;	MARYLAND BY JOHN A. STARKWEATHER OF THE UNIVERSITY OF CALIFORNIA AT
;	SAN FRANCISCO.
;
;
;
;       P I L O T    8080    V E R S I O N   1.2
;
;	9/15/77
; MODIFIED TO INTERFACE WITH CPM.  11/11/77  JOHN I. FREDERICK
;
;
;
CPM:	EQU	5	;JIF
ORIGN:	EQU	0100H	;JIF
PSTRT:	EQU	ORIGN	;JIF
SYSDAT:	EQU	0E00H	;JIF
PBUFB:	EQU	1100H	;JIF
PBUFF:	EQU	PBUFB	;JIF
STKPR:	EQU	1000H	;JIF
MNTR:	EQU	0	;JIF	RETURN TO CPM
MON:	EQU	1000H	;JIF
INITL:	EQU	MON	;JIF
BUFAD:	EQU	MON+3	;JIF
JMPTAB:	EQU	MON+5	;JIF
;ORIGN	EQU	06000H		;ORIGIN OF PROGRAM.
;PSTRT	EQU	ORIGN+2E0H	;START OF PILOT INTERPRETER.
;PBUFB	EQU	ORIGN+1000H	;BEGINNING OF PROGRAM BUFFER.
;PBUFE	EQU	ORIGN+1FFFH	;END OF PROGRAM BUFFER.
LINE    EQU	72		;MAX INPUT AT STARTUP.
;VIDEO   EQU     0FE77H		;EXTERNAL VIDEO DISPLAY ADDR.
;MNTR    EQU     0008H           ;EXTERNAL MONITOR ADDRESS
;STKPR	EQU	ORIGN+100H	;START OF STACK
;
;PORT	EQU	0F6H	;MDS CONSOLE INPUT PORT
;STPORT	EQU	0F7H	;MDS CONSOLE STATUS PORT
;RDA	EQU	02H	;READ DATA AVAILABLE MASK.
;TBE	EQU	01H	;TRANSMIT BUFFER EMPTY MASK.
;
;INTSRT	EQU	38H	;MDS INTERRUPT 7 FOR RESTARTING PILOT.
;
;        ORG   INTSRT	;RESTART PROGRAM BY USE OF INTERRUPT 7.
;	ASEG
;        JMP   START      ;ENTRY SETS NORMAL I/O
;
        ;LXI   H,CTV      ;ENTRY TO USE VIDEO OUTPUT
        ;SHLD  CO+1       ;  AT STARTUP
        ;SHLD  LO+1
        ;SHLD  PO+1
        ;JMP   RSTRT
;CTV:    PUSH  B
        ;MOV   B,C
        ;CALL  VIDEO
        ;POP   B
        ;RET
;
; JUMP TABLE FOR I/O ROUTINES
; RELOCATED TO MONITOR			  JIF
;   ONLY TTY ROUTINES ARE PROVIDED INTERNALLY
;
CI:	EQU	JMPTAB		;JIF
CO:	EQU	JMPTAB+3	;JIF
RI:	EQU	JMPTAB+6	;JIF
LO:	EQU	JMPTAB+9H	;JIF
PO:	EQU	JMPTAB+0CH	;JIF
EXIT:	EQU	JMPTAB+0FH	;JIF
EDIT:	EQU	JMPTAB+12H	;JIF
ASCAN:	EQU	JMPTAB+15H	;JIF
;        ORG   STKPR
;CI:     JMP   CHI           ;CHAR INPUT  TO   A REG.
;CO:     JMP   CHO           ;CHAR OUTPUT FROM C REG.
;RI:     JMP   CHI           ;READER INPUT TO  A REG.
;LO:     JMP   CHO           ;LIST OUTPUT FROM C REG.
;PO:     JMP   CHO           ;PUNCH OUTPUT FROM C REG.
;EXIT:   JMP   MNTR          ;RETURN TO MONITOR
;EDIT:   JMP   MNTR          ;CALL TO EDITOR
;ASCAN:  JMP   BASIC         ;ALTERN INTERPRETER
;
; DATA AREAS
	ORG	SYSDAT		;JIF
TOPP:   DW    0             ;TOP OF PROGRAM STORAGE
HLSAV:  DW    0             ;TEMPORARY POINTER (HL)
HLLSAV: DW    0             ;TEMPORARY POINTER (HL)
HL2SAV: DW    0             ;TEMPORARY POINTER (HL)
DESAV:  DW    0             ;TEMPORARY POINTER (DE)
LLSAV:  DW    0             ;LAST LINE POINTER
RETSAV: DW    0             ;ZERO LEVEL OF STACK
        DW    0             ;LEVEL 1
        DW    0             ;LEVEL 2
        DW    0             ;LEVEL 3
        DW    0             ;LEVEL 4
        DW    0             ;LEVEL 5
        DW    0             ;LEVEL 6
        DW    0             ;LEVEL 7  (TOP)
APTR:   DW    0             ;A STMT POINTER
EPTR:   DW    0             ;ENTRY POINTER
CPTR:   DW    0             ;CHAR POINTER
IPTR:   DW    0             ;INPUT BUFFER POINTER
MPTR:   DW    0             ;M-STMT POINTER
MEMTP:  DW    0             ;LAST MEMORY LOCATION
OUTADR: DW    0             ;CO,LOPO OUTPUT VECTOR
SCANB:  DW   0            ;SCAN BEGINNING ADDR
CHMAX:  DS    1             ;MAXCHARSACCEPTED
LEVEL:	DS    1          ;CURRENT RTURN LEVEL
LNSKP:  DS    1             ;LINE NUMBER SKIP
MBRCH:  DS    1             ;M-BREAK CHAR
SCNT:   DS    1             ;STRING COUNT
TEMP:   DS    1             ;TEMPORARY BINARY VALUE
VARSAV: DS    1             ;VARIABLE SAVED
YNSW:   DS    1             ;YN-SWITCH, 000: NO MATCH
TSAVE:  DS    81            ;T-TEXT AREA
EBUFF:  DS    81            ;ENTRY BUFFER AREA
MSAVE:  DS    81            ;M LIST AREA
LABSAV: DS    12            ;LABEL SAVE AREA
LASTOP: DS    11            ;LAST OP CODE
NVAR:   DS    53            ;NUMERIC VARIABLE STORAGE
WORD:   DS    81            ;WORD AREA
;
; START AND TERMINATION OF MAIN PROGRAM
;   ORG HERE CAN SET BEGINNING OF ROM AREA
;
        ORG   PSTRT
;START:  LXI   SP,STKPR       ;INITIALIZE STACK POINTER
START:	CALL	INITL		;JIF
	JMP	ARO		;JIF
	JMP	BASIC		;JIF
	JMP	INTR		;JIF
ARO:
;        LXI   H,PBUFE-1     ;INITIALIZE APTR
;        SHLD  APTR
;        LXI   H,IOJMP       ;SET NORMAL I/O VECTORS
;        LXI   D,CI
;        MVI   C,24
;        CALL  BLKTFR
        JMP   RSTRT
;IOJMP:  JMP   CHI           ;COPY OF STD JMP TABLE
;        JMP   CHO
;        JMP   CHI
;        JMP   CHO
;        JMP   CHO
;        JMP   MNTR
;        JMP   MNTR
;        JMP   BASIC
;
RSTRT:  LXI   SP,STKPR       ;INIT STACK ON RESTART
        CALL  INIT          ;INITIALIZE THE REST
        CALL  SCAN          ;SCAN THE BUFFER
        JMP   RSTRT         ;START OVER
;
        DB    '020677',0DH
;
        DB    'PILOT-8080, 1.1',0DH
;
;
;
; INITIALIZE DATA FOR NEW PROGRAM
;
INIT:   LXI   H,IBUFF       ;RESET INPUT POINTER
        SHLD  IPTR          ;  TO FRONT OF BUFFER
        SHLD  SCANB         ;SET SCAN BEGINNING
	LHLD	BUFAD	;JIF
;        LXI   H,PBUFE       ;SET LAST MEMORY LOC
        SHLD  MEMTP
        CALL  NEWN          ;SET A-POINTER
        CALL  INITV         ;INITIALIZE VARIABLES
        MVI   M,1           ;    SET STOP
        MVI   A,LINE        ;RESET INMAX TO LINE
        STA   CHMAX
        XRA   A             ;ZERO RETURN LEVEL
        STA   LEVEL
        STA   LNSKP         ;ZERO LN NO. SKIP
        LXI   H,CO          ;RESET CONSOLE OUTPUT
        SHLD  OUTADR
        RET
;
; SCAN OF INPUT BUFFER
;   ENTER:   HL=BUFFER ADDR
;   RETURNS: HL=LAST ADDR, B=LAST CHAR (01)
;
SCAN:   LHLD  IPTR          ;GET POINTER
        MOV   A,M           ;GET FIRST CHAR
        CPI   1             ;IF END MARKER
        RZ                  ;  THEN RETURN
        CPI   0DH           ;IF NOT END OF LINE
        JNZ   CKEND         ;  THEN CK FOR SOURCE END
        INX   H             ;  ELSE BUMP POINTER
        JMP   SCAN+3        ;  AND CONTINUE
CKEND:  CALL  CNTLN         ;HL=EOL, A=BR CHAR
        CPI   1             ;IF END MARKER
        RZ                  ;  THEN RETURN
        INX   H             ;HL=START OF NEXT LINE
        SHLD  IPTR          ;SAVE THAT ADDR
        DCX   H             ;HL=BREAK CHAR
        CALL  BACKUP        ;RESET HL TO CURRENT LINE
        CALL  SKLN          ;SKIP ANY LN NOS., ETC.
        CALL  GETCH         ;   GET FIRST TEXT CHAR
        CPI   ':'           ;IF COLON
        CZ    CONTIN        ;  THEN CONTINUE SAME OP
        JZ    SCAN          ;  IF CALLED THEN NEXT SCAN
        CPI   '*'           ;IF ASTERISK
        CZ    GETWD         ;  THEN SKIP LABEL
        JZ    SCAN+3        ;IF CALLED THEN RESCAN
        CALL  OPS           ;PROCESS OPERATIONS
        JMP   SCAN
;
CONTIN: INX   H             ;COLON ADDR + 1
        SHLD  HLSAV         ;SAVE IT
        LXI   H,LASTOP      ;  ADDR LAST OP CODE
        SHLD  LLSAV         ;SAVE OP CODE ADDR
        MVI   B,':'
        CALL  INDX          ;ADDR COLON POS
        CALL  OLDOP         ;USE PART OF OPS
        XRA   A             ; SET RETURN FLAG
        RET
;
; OP CODES-- INTERPRET OPERATION
;   ENTER: HL = FIRST NON-BLANK CHAR IN LINE
;   RETURNS: RETURN (ZERO) FLAG SET
;
OPS:    SHLD  LLSAV         ;SAVE OP CODE ADDR
        CALL  SAVOP         ;SAVE OP CODE
        LHLD  LLSAV         ;ADDR OP CODE
        MVI   B,':'         ;  LOOK FOR COLON
        CALL  INDX          ;IF NOT FOUND
        MOV   A,C
        ORA   A
        JZ    ALTSC         ;  THEN TRY ALTERN SCAN
        INX   H             ;COLON ADDR + 1
        SHLD  HLSAV         ;SAVE IT
        DCX   H             ;ADDR POS OF COLON
OLDOP:  DCX   H             ;ADDR POS BEFORE COLON
        CALL  YNCHK         ;IF YN-SW OFF(Y) OR ON(N)
        ORA   A             ;   (A=000)
        RZ                  ;  THEN RETURN
        CALL  VARCHK        ;IF VARIABLE PRESENT < 1
        RZ                  ;  THEN RETURN
        LHLD  LLSAV         ;ADDR OP CODE
        CALL  GETCTL        ;GET THE CONTROL WORD
        CALL  CTLMCH        ;CALL SPECIFIC CONTROL
        CPI   1             ;IF CONTROL FOUND
        RNZ                 ;  THEN RETURN
ALTSC:  LHLD  LLSAV         ;ADDR FIRST CHAR
        CALL  ASCAN         ;TRY ALTERN SCAN
        RZ                  ;IF OK, THEN RETURN
        LHLD  LLSAV         ;ELSE ADDR FIRST CHAR
        SHLD  HLSAV         ;SET POINTER
        CALL  TOP           ;DISPLAY TEXT
        RET
;
; TEXT CHECK FOR PRESENCE OF LINE FEEDS,
;   LINE COUNTS, OR LINE NUMBERS.
; SETS LNSKP TO NO. OF CHARS TO SKIP BEFORE TEXT
;
TXTCK:  LXI   H,PBUFF       ;ADDR PROGRAM TEXT
        CALL  CNTLN         ;ADDR CR
        INX   H
        MOV   A,M           ;GET NEXT CHAR
        CPI   0AH           ;IF NOT LF
        JNZ   CKLC          ;  THEN CK FOR LINE COUNT
        CALL  CNTLN         ;ELSE CK ANOTHER LINE
        INX   H
        MOV   A,M
        CPI   0AH           ;IF NOT LF
        JNZ   CKLC          ;  THEN CK FOR LINE COUNT
        LDA   LNSKP         ;ELSE ADD 1 TO LNSKP
        ADI   1
        STA   LNSKP
CKLC:   LXI   H,PBUFF       ;CK FOR LINE COUNT
        CALL  CNTLN         ;ADDR CR
        INX   H             ;  NEXT CHAR
        CALL  SKLN          ;SKIP ANY LF
        MOV   E,M           ;GET POSSIBLE LINE COUNT
        MVI   D,0
        DCX   D             ;DECR IT
        DAD   D             ;ADDR LINE END
        MOV   A,M           ;GET CHAR
        CPI   0DH           ;IF NOT CR
        JNZ   CKLN          ;  THEN CK FOR LINE NO.
        INX   H             ;ELSE CK ANOTHER LINE
        CALL  SKLN
        MOV   E,M
        DCX   D
        DAD   D
        MOV   A,M
        CPI   0DH           ;IF NOT CR
        JNZ   CKLN          ;  THEN CK FOR LINE NOS.
        LDA   LNSKP         ;ELSE ADD 1 TO LNSKP
        ADI   1
        STA   LNSKP
CKLN:   LXI   H,PBUFF+1     ;NOW LOOK FOR LN NOS.
        CALL  CNTLN         ;ADDR CR
        INX   H             ;  NEXT CHAR
        CALL  SKLN          ;SKIP LF OR LN CNT
        MOV   A,M           ;GET CHAR AFTER LN CT
        CALL  NUM           ;IF NOT ASCII NUMBER
        RNZ                 ;  THEN QUIT
        LDA   LNSKP         ;ELSE ADD 4 TO LNSKP
        ADI   4
        STA   LNSKP
        RET
;
NUM:    CPI   '0'           ;CHECK FOR ASCII NUMBER
        RM                  ;TOO LOW
        CPI   '9'+1
        JM    YNUM
        ORA   H             ;TOO HIGH
        RET
YNUM:   XRA   A             ;OK
        RET
;
; SKIP LINE NUMBER AND LINE COUNT
;    BASED ON VALUE OF LNSKP
;
SKLN:   LDA   LNSKP         ;GET SKIP COUNT
        ORA   A             ;IF ZERO
        RZ                  ;  THEN RETURN
        INX   H             ;SKIP A CHARACTER
        DCR   A             ;DECR COUNT
        JMP   SKLN+3        ;MORE
;
;    CHECK FOR Y OR N CONDITIONS
; Y AND N FOLLOWING OP CODE
;      ACT AS A SWITCH ALONG WITH YN-SWITCH
;   ENTER:   HL = ADDR OF COLON
;   RETURNS: A = 000 IF NO ACTION REQUIRED
;                ELSE A = CHAR BEFORE COLON
;            HL = ADDR OF LAST CHAR BEFORE COLON
;

YNCHK:  CALL  GETLCH        ;GET LAST CHARACTER
        CPI   'Y'           ;IF Y
        JZ    YCHK
        CPI   'N'           ;IF N
        JZ    NCHK
        ORA   A             ; ELSE SET SWITCH ON
        RET                 ;  AND RETURN WITH CHAR
YCHK:   LDA   YNSW          ;IF YN-SWITCH
        ORA   A             ;    SHOWS MATCH
        JZ    DONT          ;  THEN QUIT
        ORA   H             ; ELSE SET SWITCH ON
        RET                 ;  AND RETURN
NCHK:   LDA   YNSW
        ORA   A             ;    SHOWS NO MATCH
        JNZ   DONT          ;  THEN QUIT
        ORA   H             ; ELSE SET SWITCH ON
        RET                 ;  AND RETURN
DONT:   XRA   A             ; SET SWITCH OFF
        RET                 ;  AND RETURN
;
;     CHECK FOR NUMERIC VARIABLE CONDITIONS
; VARIABLE IN PARENTHESES AFTER OP CODE
;   CAUSES EXECUTION IF VALUE +1 OR MORE
;    ENTER:   A = LAST CHAR BEFORE COLON
;    RETURNS: ZERO FLAG OFF IF NO ACTION REQUIRED
;
VARCHK: CPI   ')'           ;IF VARIABLE PRESENT
        JZ    VCHK          ;  THEN CHECK IT
        ORA   H             ; ELSE SET SWITCH ON
        RET                 ;  AND RETURN
VCHK:   DCX   H             ;DECR POINTER
        DCX   H             ;  TWICE
        MOV   A,M           ;   GET CHAR
        CPI   '('           ;IF PAREN NOT PRESENT
        JNZ   BADFRM        ;  THEN COMPLAIN
        INX   H             ;BUMP POINTER
        MOV   B,M           ;   SAVE CHAR IN B
        CALL  VARMCH        ;LOOK IT UP
        CPI   1             ;IF END MARKER
        JZ    BADFRM        ;  THEN COMPLAIN
        INX   H             ;  ELSE POINT AT VALUE
        MOV   A,M           ;   GET VALUE
        CPI   01
        JM    VOFF          ;  THEN QUIT
        ORA   H             ; ELSE SET SWITCH ON
        RET                 ;  AND RETURN
VOFF:   XRA   A             ; SET SWITCH OFF
        RET                 ;  AND RETURN
;
BADFRM: LHLD  LLSAV         ;SHOW THE LINE

        CALL  TOP+3
        LXI   H,EXPMSG
        CALL  ERROR
        RET
;
; VARIABLE MATCH - LOOKUP OF VARIABLE NAME/VALUE LIST
;    ENTER:   VARIABLE NAME CHAR IN B REGISTER
;    RETURNS: HL = ADDR OF MATCHED NAME
;             IF VAR NOT IN LIST THEN A = 01
;
VARMCH: LXI   H,NVAR
        MOV   A,M
        CPI   1             ;IF LIST END
        RZ                  ;  THEN RETURN
        CMP   B             ;IF MATCH
        RZ                  ;  THEN RETURN
        INX   H             ;  ELSE LOOK AGAIN
        INX   H
        JMP   VARMCH+3
;
; CONTROL MATCH- CALLS SPECIFIC CONTROL OPERATIONS
;   ENTER:   'WORD':CONTROL WORD
;   RETURNS: IF WORD NOT IN LIST, THEN 01 RETURNED
;            HL: START OF NEXT WORD
;
CTLMCH: LXI   D,CTLST       ;  DE=CONTROL LIST ADDR
        CALL  LSTMCH        ;LOOK FOR WORD
        CPI   1             ;IF NOT FOUND
        RZ                  ;  THEN RETURN
        XCHG
        INX   H
        LXI   D,RTRN        ;PUT RETURN ON STACK
        PUSH  D
        MOV   E,M
        INX   H
        MOV   D,M
        PUSH  D             ;CALL ADDR ON STACK
        RET
RTRN:   XRA   A
        RET
;
; LIST MATCH - LOOKUP OF WORD/ADDRESS LIST
;   ENTER:   'WORD' = WORD TO BE FOUND
;            DE = ADDR OF BEGINNING OF LIST
;   RETURNS: DE = ADDR OF POINTER (L BYTE)
;            IF WORD NOT IN LIST THEN A = 01
;
LSTMCH: LXI   H,WORD        ;  HL=INPUT WORD
        CALL  CMPR          ;COMPARE WORD WITH LIST
        ORA   A             ; IF MATCH

        RNZ                 ;  THEN RETURN
        INX   H             ;ELSE HL = DE
        XCHG
        INX   H             ;AND INCR HL TO
        INX   H             ;NEXT LIST ADDR
        INX   H
        MOV   A,M           ;   GET NEXT LIST CHAR
        CPI   1             ;IF END MARKER
        RZ                  ;  THEN RETURN
        XCHG                ;ELSE RESET DE TO NEXT ITEM
        JMP   LSTMCH        ;  AND TRY IT
;
; CONTROL LIST - OP CODES AND KEYWORDS
;
CTLST:  DB    'T',0DH

        DW    TOP
        DB    'A',0DH
        DW    AOP
        DB    'M',0DH
        DW    MOP
        DB    'MC',0DH
        DW    MC
        DB    'J',0DH
        DW    JOP
        DB    'R',0DH
        DW    ROP
        DB    'C',0DH
        DW    COP
        DB    'U',0DH
        DW    UOP
        DB    'E',0DH
        DW    EOP
        DB    'Y',0DH
        DW    TOP
        DB    'N',0DH
        DW    TOP
        DB    'LOAD',0DH 
;LOAD NEW PROGRAM
        DW    LOAD
        DB    'INMAX',0DH 
;LIMITS CHARS ACCEPTED
        DW    INMAX
        DB    'NEW$',0DH 
;ERASE $TEXT
        DW    NEWN
        DB    'DP',0DH 
        ;DISPLAY PROGRAM
        DW    DPRG  
        DB    'PRINT',0DH 
;PRINT PROGRAM
        DW    LPRG
        DB    'SAVE',0DH 
;SAVE PROGRAM
        DW    SPRG
        DB    'IEP',0DH 
;INTERPRET EXIST PROG
        DW    IEP
        DB    'BYE',0DH
        DW    EXIT
        DB    'EDIT',0DH
        DW    EDIT
;COMMON DATAPOINT PILOT CODES NOT IN OPERATION
        DB    'CA',0DH
        DW    CURSR
        DB    'CE',0DH
        DW    CLRE
        DB    'CL',0DH
        DW    CLRL
        DB    'CH',0DH
        DW    CLRH
        DB    'RL',0DH
        DW    ROLL
;        DB    'WA',0DH
;        DW    WAIT
	DB	1
;
CURSR:	MVI C,1BH
	CALL CO
	MVI C,'&'
	CALL CO
	MVI C,61H
	CALL CO
	LHLD HLSAV
CURS1:	MOV A,M
	CPI ','
	JZ CURS3
	CPI 0DH
	JZ CURS4
	MOV C,A
CURS2:	CALL CO
	INX H
	JMP CURS1
CURS3:	MVI C,'r'
	JMP CURS2
CURS4:	MVI C,'C'
	CALL CO
  	RET
CLRE:	MVI C,1BH
	CALL CO
	MVI C,'J'
	CALL CO
	RET
CLRL:	MVI C,1BH
	CALL CO
	MVI C,'K'
	CALL CO
	RET
CLRH:	MVI C,1BH
	CALL CO
	MVI C,'H'
	CALL CO
	JMP CLRE
ROLL:	MVI C,1BH
	CALL CO
	MVI C,'S'
	CALL CO
   	RET
;WAIT:   RET
;
; INTERPRET EXISTING PROGRAM
;    STARTS SCAN OF PROGRAM BUFFER
;
IEP:    LXI   H,PBUFF
        SHLD  IPTR          ;SET POINTER
        SHLD  SCANB         ;  AND SCAN BEGINNING
	CALL	TXTCK		;CHK FOR CHARS TO SKIP
        RET
;
INMAX:  CALL  NMCTL         ;E = NUMBER CONTROL
        MOV   A,E
        CPI   73            ;LIMIT TO 72
        JM    INMX2
        MVI   A,72
        MOV   E,A
INMX2:  LXI   H,CHMAX       ;  SET INPUT CHAR MAX
        MOV   M,E
        RET
;
; CHAR TO BINARY CONVERSION FOR CONTROL ARGUMENTS
; NUMBER CONTROL - FINDS 1 OR 2 DIGIT NUMBER OR NAME
;  OF VARIABLE IN NEXT WORD. NEGATIVE VALUES SET TO ZERO.
;    ENTER:   HLSAV = EXPRESSION ADDRESS
;    RETURNS: E = BINARY VERSION OF THE NUMBER
;             A = 0DH IF ALREADY AT END OF LINE
;             HLSAV = BR CHAR   ADDR
;
NMCTL:  LHLD  HLSAV         ;EXPRESSION ADDR
        CALL  GETCH         ;GET CHAR
        CPI   0DH           ; IF CR
        RZ                  ;  THEN RETURN
        CALL  GETWD         ;GET NEXT WORD
        DCX   H             ;BACK UP TO BR CHAR
        SHLD  HLSAV         ;SAVE POINTER
        LXI   H,WORD        ;    IN 'WORD'
        CALL  LETTER        ;IF NOT LETTER
        JNZ   CVNUM         ;  THEN CONVERT A NUMBER
        MOV   B,M           ;   ELSE SAVE CHAR IN B
        CALL  VARMCH        ;LOOK IT UP
        CPI   1             ;IF END MARKER
        CZ    BADFRM        ;  THEN COMPLAIN
        RZ                  ;  AND RETURN
        INX   H             ;ELSE POINT AT VALUE
        MOV   E,M           ;   PUT VALUE IN E
        JMP   CVNUM+3       ;  AND QUIT
CVNUM:  CALL  GETNM         ;CONVERT NUMBER
        MOV   A,E           ;      GET VALUE
        ORA   A
        RP                  ;RETURN IF POSITIVE
        MVI   E,0           ;  ELSE SET TO ZERO
        RET
;
; JUMP TO LABEL NAME
;   ENTER:   HLSAV = EXPRESSION FIELD
;   RETURNS: HL RESET OR MESSAGE
;
JOP:    LHLD  HLSAV         ;ADDR EXPRESSION
        CALL  GETCH         ;GET FIRST CHAR
        CPI   '*'           ;IF *
        JZ    JOP2          ;  THEN MOVE WORD
        MVI   A,'*'
        STA   WORD          ;ELSE ADD *
        LXI   D,WORD+1      ;  THEN MOVE WORD
        LHLD  HLSAV
        CALL  WDTFR
        JMP   JOP2+3        ;AND CONTINUE
JOP2:   CALL  GETWD         ;GET NEXT WORD
        LHLD  SCANB         ;  START OF SCAN AREA
        CALL  LOOKL         ;LOOK FOR IT
        CPI   1             ;IF LABEL NOT FOUND
        CZ    NTFND         ;  THEN COMPLAIN
        RZ                  ;  AND RETURN
        INX   H
        SHLD  IPTR          ;NEW SCAN POSITION
        RET                 ;RESTART SCAN
;
;
NTFND:  LXI   H,WORD        ;  SHOW THE LABEL
        CALL  DSPLY
        LXI   H,BLMSG
        CALL  ERROR
        RET
;
UOP:    CALL  SAVRET        ;SAVE RETURN POINTER
        JMP   JOP
;
; SET A BLOCK OF LENGTH C TO CHAR B
;
BLKSET: MOV   M,B           ;   STORE ONE CHAR
        INX   H             ;BUMP ADDR
        MOV   A,C           ;   DECR COUNT
        SUI   1
        MOV   C,A           ;      IF COUNT NOT ZERO
        JNZ   BLKSET        ;  THEN STORE ANOTHER
        RET
;
; BLANK THE INPUT BUFFER
;
BLKBF:  LHLD  APTR          ;DE=TOP OF BUFFER
        XCHG
        LXI   H,PBUFF       ;HL=BOTTOM OF BUFFER
        MVI   B,' '
BLKB2:  MOV   M,B
        INX   H
        CALL  ADRCMP
        JNZ   BLKB2
        RET
;
; ADDRESS COMPARISON - COMPARES HL + DE
;    RETURNS: ZERO AND SIGN FLAGS SET AS THOUGH
;             A CONTAINED HL AND DE WAS COMPARED
;    CALLED BY BLKBF
;
ADRCMP: MOV   A,H           ;      GET H
        CMP   D             ;COMPARE D
        RM                  ;IF D > H THEN RETURN
        RNZ                 ;IF D NOT = H THEN RETURN
        MOV   A,L           ;      GET L
        CMP   E             ;COMPARE E
        RET                 ;  AND RETURN
;
;    CHARACTER TO BINARY CONVERSION
; GET A DECIMAL NUMBER-- UP TO 99
;   ENTER:   HL= CHAR ADDR OF ONE OR TWO DIGIT NUMBER
;   RETURNS: BINARY NUMBER IN E
;      IF INPUT NOT NUMERIC, THEN E = 0
;
GETNM:  MVI   E,0           ;  INIT. OUTPUT VALUE
        INX   H             ;LOOK AT NEXT CHAR
        CALL  BRCHAR        ;IF BREAK CHAR
        JZ    SDIG          ;  THEN SINGLE DIGIT
        CPI   '+'
        JZ    SDIG
        CPI   '-'
        JZ    SDIG
        DCX   H             ;ELSE BACK UP
        MOV   A,M           ;   GET FIRST CHAR
        CPI   '0'           ;LIMIT RANGE
        RM                  ;  TO NUMERALS
        CPI   '9'+1
        RP
        SUI   '0'           ;REMOVE ASCII BIAS
        ADD   A             ;MULT. BY 10
        MOV   E,A           ;        E=A*2
        ADD   A             ;  A*4
        ADD   A             ;  A*8
        ADD   E             ;  A+E=A*10
        MOV   E,A           ;      SAVE IT
        INX   H             ;HL=HL+1
UNITS:  MOV   A,M           ;   GET SECOND CHAR
        CPI   '0'           ;LIMIT RANGE
        RM                  ;  TO NUMERALS
        CPI   '9'+1
        RP
        SUI   '0'           ;REMOVE ASCII BIAS
        ADD   E             ;ADD NEW DIGIT
        MOV   E,A           ;        TO E
        RET
SDIG:   DCX   H             ;BACK UP POINTER
        JMP   UNITS         ;CONVERT UNITS POSITION
;
;    BINARY TO CHARACTER CONVERSION
; PUT BINARY NUMBER IN DECIMAL CHARS -99 TO +99
;    ENTER:   BINARY NUMBER IN E
;             HL = CHARACTER AREA
;    RETURNS: HL = ADDR OF 0DH AFTER RIGHT DIGIT
;
PUTNM:  MVI   C,0           ;  INITIALIZE C
        MOV   A,E           ;      GET BINARY NUMBER
        ORA   A             ; IF NEGATIVE
        CM    NEG           ;  THEN SHOW MINUS SIGN
        CPI   10            ;IF < 10
        JM    FRMCH         ;  THEN FORM CHAR
        SUI   10            ;  ELSE SUBTR 10
        MOV   E,A           ;        SAVE IN E
        MOV   A,C           ;   INCR TENS COUNT
        ADI   1
        MOV   C,A
        JMP   PUTNM+2       ;  AND LOOP
FRMCH:  MOV   A,C           ;   GET TENS COUNT
        ADI   '0'           ;ADD ASCII BIAS
        CPI   '0'           ;IF CHAR IS 0
        JZ    FRMU          ;  THEN FORM UNITS
        MOV   M,A           ;   STORE THE CHAR
        INX   H             ;BUMP CHAR ADDR
FRMU:   MOV   A,E           ;      GET THE UNITS
        ADI   '0'           ;ADD ASCII BIAS
        MOV   M,A           ;   STORE THE CHAR
        INX   H             ;BUMP POINTER
        MVI   A,0DH         ;   STORE EOL
        MOV   M,A
        RET
;
NEG:    MVI   A,'-'         ;  STORE MINUS SIGN
        MOV   M,A
        INX   H             ;BUMP CHAR ADDRESS
        XRA   A             ; MAKE BINARY POSITIVE
        SUB   E
        MOV   E,A           ;      SAVE IN E
        RET
;
; LOOK FOR *LABEL OR $NAME OF STRING VARIABLE
;   (LOOKL OR LOOKS)
;   ENTER: 'WORD'=LABEL TO BE FOUND, HL=SCAN ADDR
;   RETURNS: HL = ADDR OF BLANK AFTER LABEL
;            IF LABEL NOT FOUND THEN A = 01
;
LOOKS:  XRA   A             ;SET TEMP FOR NO SKIPS
        STA   TEMP
        JMP   LOOK
LOOKL:  ORA   H             ;SET TEMP ON FOR SKIPS
        STA   TEMP
        CALL  SKLN          ;SKIP ANY LINE NOS.
LOOK:   CALL  GETCH         ;NEXT CHAR
        CPI   1             ;IF DATA END
        RZ                  ;  THEN RETURN
        CPI   '*'           ;IF *
        JZ    CHK           ;  THEN CHECK THE LABEL
        CPI   '$'           ;IF $
        JZ    CHK           ;  THEN CHECK STRING NAME
        CALL  CNTLN         ;ELSE GO TO NEXT LINE
        INX   H
        LDA   TEMP          ;IF TEMP=0
        ORA   A
        JZ    LOOK          ;  THEN NO SKIPS
        JMP   LOOK-3        ;ELSE SKIP LN NOS.
CHK:    SHLD  HLSAV         ;SAVE POINTER
        CALL  CNTWD         ;C = WORD LENGTH
        MOV   A,C
        CPI   13            ;LIMIT TO 12 CHARS
        JM    MVLAB
        MVI   C,12
MVLAB:  LHLD  HLSAV         ;RETRIEVE POINTER
        LXI   D,LABSAV      ;  DESTIN ADDR
        CALL  BLKTFR        ;MOV   A,BSAV=LABEL
        XCHG                ;HL:DESTIN BR CHAR+1
        DCX   H             ;   DESTIN BR CHAR
        MVI   A,0DH         ;   REPLACE WITH 0DH
        MOV   M,A
        LXI   H,LABSAV
        LXI   D,WORD        ;    WORD ADDR
        CALL  CMPR          ;COMPARE THEM
        ORA   A             ; LOOK AT A REGISTER
        JNZ   LFND          ;IF MATCH THEN LABEL FOUND
        LHLD  HLSAV         ;ELSE RETRIEVE POINTER
        CALL  CNTWD         ;SKIP LABEL
        JMP   LOOK          ;  AND CONTINUE
LFND:   LHLD  HLSAV         ;RETRIEVE POINTER
        CALL  CNTWD         ;SKIP LABEL
        RET                 ;  AND RETURN
;
; COMPARE STRINGS X AND Y
;   ENTER:   HL= X ITEM ADDR, DE= Y ITEM ADDR
;            BOTH ITEMS TERMINATE IN 0DH
;   RETURNS: A=0 FOR NO MATCH,
;            HL AND DE AT 0DH ADDRESS
;
CMPR:   MOV   A,M           ;   GET X CHAR
        CPI   0DH           ; IF END OF LINE
        JZ    XEND          ;  THEN END OF X ITEM
        MOV   C,A           ;      SAVE X CHAR IN C
        INX   H             ;ADDR Y ITEM
        XCHG
        MOV   A,M           ;   GET Y CHAR
        CPI   0DH           ; IF END OF LINE
        JZ    YENDB         ;  THEN END OF Y ITEM
        CMP   C             ;IF A(Y) NOT= C(X)
        JNZ   NOMCH         ;THEN NO MATCH
        INX   H             ;ADDR NEXT X ITEM
        XCHG
        JMP   CMPR          ;START OVER
XEND:   XCHG                ;ADDR Y ITEM
        MOV   A,M           ;   GET Y CHAR
        CPI   0DH           ; IF END OF LINE
        JZ    MCH           ;  THEN MATCH FOUND
        CALL  CNTWD         ;ADDR Y BR CHAR
        XCHG                ;SET DE
        XRA   A             ;  NOMATCH
        RET
NOMCH:  CALL  CNTWD         ;ADDR Y BR CHAR
YENDB:  XCHG                ;  SET DE
        CALL  CNTWD         ;ADDR X BR CHAR
        XRA   A             ; NO MATCH
        RET
MCH:    XCHG                ;SET DE & HL
        ORA   H             ; MATCH
        RET
;
; GET CHARACTER-- SKIPS LEADING BLANKS
;   ENTER:   HL=SOURCE ADDR
;   RETURNS: HL=NEXT NON-BLANK ADDR, A=CHAR
;
GETCH:  MOV   A,M           ;   GET CHARACTER
        CPI   20H           ;IF NOT BLANK
        RNZ                 ;  THEN RETURN
        INX   H             ;  ELSE GET NEXT CHAR
        JMP   GETCH
;
; GET LAST CHAR - SCANS BACKWARD, SKIPS BLANKS AND CR'S
;   ENTER:   HL = STRING ADDR
;   RETURNS: HL = LAST NON-BLANK CHAR, A = CHAR
;
GETLCH: MOV   A,M           ;   GET CHARACTER
        CPI   20H           ;IF NOT BLANK
        RNZ                 ;  THEN RETURN
        DCX   H             ;ELSE GET NEXT CHAR
        JMP   GETLCH
;
; GET WORD -- UP TO FIRST BREAK CHARACTER
;            IGNORES LEADING BLANKS
;   ENTER:   HL=SOURCE ADDR
;   RETURNS: 'WORD'=SOURCE STRING + 0DH
;            HL= BR CHAR+1 ADDR, B= BR CHAR
;            DE= 'WORD' ADDR AFTER 0DH
;            C = NO OF CHARS MOVED INCL BR CHAR
;
GETWD:  CALL  GETCH         ;IGNORE LEADING BLANKS
        LXI   D,WORD        ;  DESTIN ADDR
        CALL  WDTFR         ;MOVE IT
        RET
;
; COUNT WORD
;   ENTER:   HL=SOURCE ADDR
;   RETURNS: HL=BR CHAR ADDR
;            A,B=BR CHAR, C=COUNT INCL BR CHAR
;
CNTWD:  MVI   C,1           ;  COUNT=1
        CALL  BRCHAR        ;IF CHAR=BREAK
        RZ                  ;  C=CHAR COUNT
        MOV   A,C           ;   GET COUNT
        ADI   1             ;C=C+1
        MOV   C,A           ;      STORE IT
        INX   H             ;HL=NEXT
        JMP   CNTWD+2       ;NEXT CHAR
;
; WORD TRANSFER
;   MOVES STRING FROM HL TO DE + 0DH ADDED
;   ENTER:   HL= SOURCE ADDR, DE= DESTIN ADDR
;   RETURNS: HL= SOURCE ADDR AFTER BR CHAR
;            DE= DESTIN ADDR AFTER 0DH
;            B= BR CHAR
;            C= NO OF CHARS MOVED INCL BR CHAR
;
WDTFR:  MVI   C,1           ;  INIT COUNT
        CALL  BRCHAR        ;IF BREAK CHAR
        JZ    MVBR          ;  THEN END OF SOURCE
        INX   H             ;HL= DESTIN ADDR
        XCHG
        MOV   M,B           ;   MOVE CHARACTER
        MOV   A,C           ;   INCR COUNT
        ADI   1
        MOV   C,A
        INX   H             ;HL= NEXT SOURCE ADDR
        XCHG
        JMP   WDTFR+2
MVBR:   INX   H             ;HL= DESTIN BR CHAR ADDR
        XCHG
        MVI   A,0DH         ;   REPLACE WITH 0DH
        MOV   M,A
        INX   H             ;HL= SOURCE BR CHAR ADDR+1
        XCHG
        XRA   A             ; SET RETURN FLAG
        RET
;
; GET CONTROL WORD IN 'WORD'
;   REPLACES FINAL Y OR N WITH 0DH
;   ENTER:   HL = SOURCE ADDR
;
GETCTL: LXI   D,WORD        ;  DESTIN ADDR
        CALL  WDTFR         ;MOVE WORD
        MOV   A,C           ;   GET COUNT
        CPI   3             ;IF < 3 CHARS MOVED
        RM                  ;  THEN RETURN
        MOV   H,D           ;   ADDR WORD
        MOV   L,E
        DCX   H             ;AVOID COLON
        DCX   H
        CALL  GETLCH        ;GET LAST CHAR
        CPI   'Y'           ;IF Y
        JZ    YNOUT         ;  THEN REMOVE IT
        CPI   'N'           ;IF NOT N
        RNZ                 ;  THEN RETURN
YNOUT:  MVI   A,0DH         ;   REPLACE Y OR N
        MOV   M,A           ;     WITH 0DH
        RET
;
; SAVE OP CODE THROUGH COLON IN LASTOP
;
SAVOP:  MVI   B,':'
        CALL  INDX          ;COUNT CHARS TO COLON
        LHLD  LLSAV         ;ADDR OP CODE
        LXI   D,LASTOP
        CALL  BLKTFR        ;MOVE CHAR STRING
        RET
;
; COUNT LINE
;   ENTER:   HL=SOURCE ADDR
;   RETURNS: C=CHAR COUNT INCL 0DH OR 01
;            HL=BREAK POS., A=BR CHAR
;
CNTLN:  MVI   C,1           ;  COUNT=1
        MOV   A,M           ;   GET CHARACTER
        CPI   0DH           ; IF 0DH
        RZ                  ;   C=CHAR COUNT
        CPI   1             ;IF 01
        RZ                  ;  C=CHAR COUNT
        MOV   A,C           ;   GET COUNT
        ADI   1             ;C=C+1
        MOV   C,A           ;      STORE IT
        INX   H             ;HL=NEXT
        JMP   CNTLN+2       ;NEXT CHAR
;
; BACKUP-- DECREMENTS HL BY VALUE OF C-1
;   ENTER:   HL START VALUE, C=COUNT
;   RETURNS: NEW HL VALUE
;
BACKUP: MOV   A,C           ;   GET COUNT
        CPI   1             ;IF COUNT=1
        RZ                  ;  THEN RETURN
        SUI   1             ;C=C-1
        MOV   C,A           ;      STORE C
        DCX   H             ;HL=HL-1
        JMP   BACKUP
;
; BREAK CHARACTER SEARCH
;   ENTER:   HL=CHAR ADDR
;   RETURNS: A, B = CHARACTER
;            IF BR CHAR THEN Z FLAG TRUE
;
BRCHAR: MOV   A,M           ;   GET CHAR
        MOV   B,A           ;   AND SAVE IT
        CPI   ' '           ;CHECK FOR VARIOUS
        RZ                  ;BREAK CHARACTERS
        CPI   0DH           ;   END OF LINE
        RZ
        CPI   ','
        RZ
        CPI   ';'
        RZ
        CPI   ':'
        RZ
        CPI   '.'
        RZ
        CPI   '?'
        RZ
        CPI   21H           ;EXCLAMATION
        RZ
        CPI   '"'           ;DOUBLE QUOTE
        RZ
        CPI   '('           ;L PARENS
        RZ
        CPI   ')'           ;R PARENS
        RZ
        CPI   27H           ;APOSTROPHE
        RZ
        CPI   1             ;END OF LIST
        RET                 ;BR CHAR NOT FOUND
;
; INDEX - FIND CHAR POSITION OF MATCHED STRING
;    ENTER: HLSAV = STRING ADDR, HLLSAVE = SUBSTR ADDR
;    RETURNS: C = CHAR POS OF MATCH, IF NOMATCH, C=0
;             HLSAV = STRING ADDR OF FIRST MATCHED CHAR
;             EPTR = ADDR OF NEXT CHAR AFTER MATCH
;
INDEX:  XRA   A
        STA   SCNT          ;INIT STRING COUNT
INDE2:  LHLD  HLSAV         ;ADDR STRING
        XCHG                ;DE = STRING ADDR
        LHLD  HLLSAV        ;ADDR SUBSTRING
        MOV   B,M           ;FIRST SUBSTR CHAR IN B
        INX   H             ;ADDR STRING
        XCHG
        CALL  INDX          ;LOOK FOR FIRST CHAR
        MOV   A,C
        ORA   A             ; IF NOT FOUND
        RZ                  ;  THEN RETURN
        SHLD  HLSAV         ;  ELSE SAVE POINTER
        LDA   SCNT          ;GET OLD STRING COUNT
        ADD   C             ;ADD NEW COUNT
        STA   SCNT          ;  IN SCNT
        LHLD  HLLSAV        ;ADDR SUBSTR
        CALL  CNTLN         ;COUNT SUBSTR CHARS
        MOV   A,C           ;   REDUCE COUNT TO
        SUI   1             ;  ALPHA CHARS
        MOV   C,A
        LXI   D,WORD        ;  MOVE SAME NUMBER OF
        LHLD  HLSAV         ;  CHARS FROM STRING
        CALL  BLKTFR        ;  TO 'WORD'
        SHLD  EPTR          ;SAVE NEXT CHAR ADDR
        XCHG                ;ADDR END OF 'WORD'
        MVI   A,0DH         ;   TERMINATE WITH 0DH
        MOV   M,A
        LHLD  HLLSAV        ;ADDR SUBSTR
        XCHG                ;DE = SUBSTR ADDR
        LXI   H,WORD        ;  ADDR PORTION OF STRING
        CALL  CMPR          ;COMPARE THEM
        ORA   A             ; IF FOUND
        JNZ   SETCNT        ;  THEN SET POSITION COUNT
        LHLD  HLSAV         ;  ELSE GET STRING POINTER
        INX   H             ;  BUMP IT
        SHLD  HLSAV         ;  SAVE IT
        JMP   INDE2         ;  AND TRY AGAIN
SETCNT: LXI   H,SCNT        ;  PUT STRING COUNT IN C
        MOV   C,M
        RET                 ;    AND RETURN
;
; INDX - FIND CHARACTER POSITION OF SINGLE LETTER
;    ENTER:    HL = STRING ADDR, B= CHAR
;    RETURNS:  C = CHAR POS OF MATCH, IF NOMATCH, C=0
;              HL = ADDR OF MATCHED CHAR OR EOL
;
INDX:   MVI   C,1           ;  INIT C REGISTER
        MOV   A,M           ;   GET CHAR
        CMP   B             ;IF B-CHAR FOUND
        RZ                  ;  THEN RETURN
        CPI   0DH           ; IF END OF LINE
        JZ    ZC            ;  THEN ZERO COUNT
        MOV   A,C           ;     ELSE
        ADI   1             ;  BUMP COUNT
        MOV   C,A
        INX   H             ;  BUMP ADDR
        JMP   INDX+2        ;  GO TO NEXT
ZC:     XRA   A             ; RETURN WITH
        MOV   C,A           ;        C = 0
        RET
;
; SINDX - SPECIAL INDEX FOR POSITION OF $ OR #
;    ENTER:   HL = STRING ADDRESS
;    RETURNS: BA = $, #, OR 0DH;  C = CHAR POS
;             HL = ADDR OF MATCHED CHAR
;
SINDX:  MVI   C,1           ;  INIT C REGISTER
        MOV   A,M           ;   GET CHAR
        CPI   '$'           ;IF $
        RZ                  ;  THEN RETURN
        CPI   043O          ;IF #
        RZ                  ;  THEN RETURN
        CPI   0DH           ; IF EOL
        RZ                  ;  THEN RETURN
        MOV   A,C           ;   ELSE
        ADI   1             ;BUMP COUNT
        MOV   C,A
        INX   H             ;BUMP ADDR
        JMP   SINDX+2       ;GO TO NEXT
;
; LETTER TESTS WHETHER CHARACTER IS UPCASE A-Z
;    ENTER:   HL = ADDR OF CHAR
;    RETURNS: ZERO FLAG TRUE IF IT IS
;             B = CHARACTER
;
LETTER: MOV   A,M           ;   GET CHAR
        MOV   B,M           ;   SAVE IN B
        CPI   41H           ;CHECK RANGE
        JM    NOTL          ;TOO LOW?
        CPI   5AH
        JP    NOTL          ;TOO HIGH?
        XRA   A             ;   ELSE RESET ZERO FLAG
        RET                 ;  AND RETURN IF LETTER
NOTL:   ORA   H             ; RETURN IF NOT LETTER
        RET
;
; SETUP GETS CHAR COUNT AND SETS ADDR FOR TEXT MOVES
;
SETUP:  CALL  CNTLN         ;C=CHAR COUNT
        MOV   B,C           ;   SAVE COUNT
        CALL  BACKUP        ;RESET HL
        MOV   C,B           ;   RESET COUNT
        RET
;
; T OPERATION--DISPLAY 'T' STATEMENT
;   ENTER:   HLSAV= FIRST CHAR OF T EXPRESSION FIELD
;
TOP:    LHLD  HLSAV         ;RETRIEVE POINTER
        SHLD  CPTR          ;SAVE CHAR POINTER
        SHLD  LLSAV         ;SAVE FIRST CHAR ADDR
        LXI   H,TSAVE       ;  DESTIN START ADDR
        SHLD  DESAV         ;SAVE DESTIN ADDR
        XCHG                ;AND KEEP IN DE
TMORE:  LHLD  CPTR          ;GET CHAR POINTER
        CALL  SINDX         ;LOOK FOR $ OR #
        CPI   '$'           ;IF $ FOUND
        JZ    GETXT         ;  THEN GET LABELED TEXT
        CPI   043O          ;IF # FOUND
        JZ    GETNUM        ;  THEN GET NUMBER
        JMP   TMOVE         ;ELSE MOVE REST OF TEXT
GETXT:  CALL  INSERT        ;INSERT TEXT
        CPI   1             ;IF FOUND (A NOT 01)
        JNZ   TMORE         ;  THEN CONTINUE
        LXI   D,TSAVE       ;  ELSE DISPLAY THE LINE
        LHLD  LLSAV
        JMP   TALL
GETNUM: CALL  INSNUM        ;INSERT NUMBER
        JMP   GETXT+3       ;  AND SEE IF FOUND
TMOVE:  LHLD  DESAV         ;DESTIN ADDR
        XCHG
        LHLD  CPTR          ;ADDRESS INPUT
TALL:   CALL  SETUP         ;C = CHAR COUNT
        CALL  BLKTFR        ;MOVE T-TEXT
        MVI   A,0DH         ;   TERMINATE
        XCHG
        MOV   M,A
        LXI   H,TSAVE       ;  ADDRESS TEXT
        CALL  DSPLY         ;DISPLAY T STATEMENT
        XRA   A             ; SET RETURN FLAG
        RET
;
; INSERT NUMERIC VALUE INTO T-STATEMENT
;    ENTER:   C = POSITION OF '#'
;    RETURNS: TSAVE CONTAINS ASSEMBLED T-TEXT
;             IF LABEL NOT FOUND, THEN A = 01
;
INSNUM: MOV   A,C           ;   GET POSITION OF #
        SUI   1             ;REDUCE COUNT BY 1
        JZ    VBL           ;IF 0 THEN GET VARIABLE
        MOV   C,A
        LHLD  DESAV         ;DESTIN ADDR
        XCHG
        LHLD  CPTR          ;GET CHAR POINTER
        CALL  BLKTFR        ;MOVE FRONT OF TEXT
VBL:    MOV   B,H
        MOV   C,L
        XCHG
        SHLD  DESAV         ;SAVE DESTIN POINTER
        MOV   H,B           ;   GET CHAR POINTER
        MOV   L,C
        INX   H             ;BUMP TO VAR NAME
        MOV   C,M           ;   SAVE NAME IN C
        INX   H             ;BUMP ADDR
        SHLD  CPTR          ;SAVE CHAR POINTER
        MOV   B,C           ;   PUT VAR NAME IN B
        CALL  VARMCH        ;LOOK UP VAR NAME
        CPI   1             ;IF NOT FOUND (A = 01)
        RZ                  ;  THEN RETURN
        INX   H             ;ELSE POINT AT VALUE
        MOV   E,M           ;   GET VALUE IN E
        LXI   H,WORD        ;  PUT DIGITS IN WORD
        CALL  PUTNM
        LHLD  DESAV         ;DESTIN ADDR
        XCHG
        LXI   H,WORD        ;  DIGIT CHAR ADDR
        CALL  SETUP         ;C = CHAR COUNT+1
        MOV   A,C
        SUI   1
        MOV   C,A           ;      C = CHAR COUNT
        CALL  BLKTFR        ;MOVE DIGITS
        XCHG
        SHLD  DESAV         ;SAVE DESTIN ADDR
        XRA   A             ; SET RETURN FLAG
        RET
;
; INSERT LABELED TEXT INTO T-STATEMENT
;    ENTER:   C = POSITION OF '$'
;    RETURNS: TSAVE CONTAINS ASSEMBLED T-TEXT
;             IF LABEL NOT FOUND, THEN A = 01
;
INSERT: MOV   A,C           ;   GET POSITION COUNT
        SUI   1             ;REDUCE COUNT BY 1
        JZ    LBL           ;IF 0 THEN POINT TO LABEL
        MOV   C,A
        LHLD  DESAV         ;DESTIN ADDR
        XCHG
        LHLD  CPTR          ;GET CHAR POINTER
        CALL  BLKTFR        ;MOVE FRONT OF TEXT
LBL:    MOV   B,H           ; SAVE CHAR POINTER IN BC
        MOV   C,L
        XCHG
        SHLD  DESAV         ;SAVE DESTIN POINTER
        MOV   H,B           ;   GET CHAR POINTER
        MOV   L,C
        CALL  GETWD         ;GET LABEL
        DCX   H             ;ADDR BR CHAR
        SHLD  CPTR          ;SAVE CHAR POINTER
        LHLD  APTR          ;HL = START OF LIST
        INX   H
        CALL  LOOKS         ;LOOK FOR STRING NAME
        CPI   1             ;IF NOT FOUND (A = 01)
        RZ                  ;  THEN RETURN
        CALL  GETA          ;  ELSE GET A-TEXT
        RET
;
; GET A-TEXT POINTED TO BY MATCHED LABEL
;    ENTER:   HL = BLANK AFTER MATCHED LABEL
;             DESAV = DESTIN ADDRESS
;    RETURNS: A-TEXT MOVED TO DESTINATION
;             DESAV = NEXT DESTIN ADDRESS
;
GETA:   INX   H             ;ADDR FIRST A-CHAR
        MOV   B,H           ;   BC = A-TEXT ADDR
        MOV   C,L
        LHLD  DESAV         ;DESTIN ADDR
        XCHG
        MOV   H,B           ;   HL = A-TEXT ADDR
        MOV   L,C
        CALL  SETUP         ;C = CHAR COUNT
        MOV   A,C           ;   REDUCE COUNT TO
        SUI   1             ;  EXCLUDE MOVE OF 0DH
        MOV   C,A
        CALL  BLKTFR        ;MOVE A-TEXT
        XCHG
        SHLD  DESAV         ;SAVE DESTIN POINTER
        XRA   A             ; SET RETURN FLAG
        RET
;
; A OPERATION-- ACCEPT INPUT
;   ENTER:    HLSAV = ADDR AFTER COLON
;   RETURNS:  INPUT IN EBUFF
;   'CTL Z' ALLOWS SINGLE STATEMENT EXECUTION OR QUIT
;
AOP:    LHLD  HLSAV         ;ADDR EXPRESSION
        CALL  GETCH         ;GET FIRST CHAR
        CPI   '$'           ;IF NOT $
        JNZ   NIN           ;  THEN LOOK FOR #
        LXI   D,LABSAV      ;  ELSE ADDR DESTIN
        CALL  WDTFR         ;  SAVE THE LABEL
        CALL  ENTRY         ;GET THE ENTRY
        CALL  ASTORE        ;  STORE IT
        RET                 ;  THEN EXIT
NIN:    CPI   043O          ;IF NOT #
        JNZ   CENT          ;  THEN CALL ENTRY
        INX   H             ;ELSE ADDR VARIABLE
        MOV   A,M           ;   GET THE NAME
        STA   VARSAV        ;AND SAVE IT
        CALL  ENTRY         ;GET THE ENTRY
        CALL  CKNUM         ;REQUIRE NUMERIC
        CALL  NSTORE        ;  STORE THE NUMBER
        RET                 ;THEN EXIT
CENT:   CALL  ENTRY
        RET
;
ENTRY:  CALL  KEYIN         ;GET ONE LINE IN EBUFF
        LXI   H,EBUFF       ;IF ENTRY NOT CTL Z
        MOV   A,M
        CPI   1AH
        RNZ                 ;THEN RETURN
        INX   H             ;ELSE BUMP POINTER
        MOV   A,M           ;GET CHAR
        CPI   0DH           ;IF CR
        JZ    RSTRT         ;  THEN RESTART
        CALL  OPS           ;ELSE DO IMMED OP
        JMP   ENTRY         ;  AND ACCEPT MORE INPUT
;
CKNUM:  CPI   '0'           ;CHECK FOR NUMBER
        JM    NERR          ;TOO LOW
        CPI   '9'+1
        RM                  ;MUST BE NUMBER
NERR:   LXI   H,NMSG        ;OUT OF RANGE
        CALL  ERROR         ;SEND MESSAGE
        CALL  ENTRY         ;TRY AGAIN
        JMP   CKNUM
;
; A ITEM STORE - STORAGE OF LABELED TEXT FROM ENTRY
;    FROM TOP OF INPUT BUFFER AREA AND SETS POINTER
;
ASTORE: LXI   H,EBUFF       ;  SOURCE ADDR
        CALL  CNTLN         ;C = CHAR COUNT
        MOV   B,C           ;   DUPL COUNT IN B
        LHLD  APTR          ;LAST A-ADDR
        CALL  DECA          ;BACK UP DESTIN ADDRESS
        MOV   A,C           ;   IF CHAR COUNT = 0
        ORA   A
        RZ                  ;  THEN RETURN
        LXI   H,EBUFF       ;  SOURCE ADDR
        CALL  BLKTFR        ;MOVE TEXT
        LXI   H,LABSAV      ;  ADDR LABEL
        CALL  CNTLN         ;C = CHAR COUNT
        MOV   B,C           ;   DUPL COUNT IN B
        LHLD  APTR          ;GET A-POINTER
        CALL  DECA          ;BACK UP ADDR
        MOV   A,C           ;   IF CHAR COUNT = 0
        ORA   A
        RZ                  ;  THEN RETURN
        LXI   H,LABSAV      ;  SOURCE ADDR
        CALL  BLKTFR        ;MOVE THE LABEL
        MOV   L,E           ;   ADDR A-TEXT
        MOV   H,D
        DCX   H             ;BACK UP ONE CHAR
        MVI   A,' '         ;AND SET
        MOV   M,A           ;     BLANK THERE
        RET
;
; DECREMENT ADDRESS FOR TEXT STORAGE
;    ENTER:  HL = LAST (LOWEST) ADDRESS USED (01)
;            B & C = CHAR COUNT IN WORD TO BE MOVED
;    RETURNS:DE = DESTIN ADDR,  C = CHAR COUNT
;       APTR POINTS AT STOP(01) BELOW LIST
;
DECA:   MOV   E,L           ;DESTIN ADDR IN DE
        MOV   D,H
        DCX   H             ;DECR POINTER
        MOV   A,M           ;   GET CHARACTER
        CPI   1             ;IF 01 (END OF SPACE)
        JZ    STOVF         ;  THEN STORAGE OVERFLOW
        MOV   A,B           ;      DECR COUNT
        SUI   1
        MOV   B,A
        JNZ   DECA          ;BACK UP AGAIN?
        SHLD  APTR          ;SAVE A-POINTER
        MVI   M,1           ;SET STOP
        RET
;
STOVF:  LXI   H,NRMSG       ;  COMPLAIN OF OVERFLOW
        CALL  ERROR
        MVI   C,0           ;  SET CHAR COUNT = 0
        RET
;
; NUMBER STORAGE - STORAGE OF NUMERIC VALUE FROM ENTRY
;             AS VALUE OF VARIABLE NAME IN A-STATEMENT
;
NSTORE: LXI   H,EBUFF       ;  SOURCE ADDR
        CALL  GETCH         ;ADDR 1ST CHAR
        CALL  GETNM         ;GET THE NUMBER
        LXI   H,VARSAV      ;  GET THE NAME IN B
        MOV   B,M
        CALL  VARMCH        ;LOOK IT UP
        CPI   1             ;IF END MARKER
        CZ    BADFRM        ;THEN COMPLAIN
        RZ                  ;  AND RETURN
        INX   H             ;  ELSE BUMP TO NEXT
        MOV   M,E
        RET
;
; M OPERATION - MOVING WINDOW STRING MATCH
;    COMPARE ITEMS IN LIST WITH LAST INPUT
;      M-ITEMS HAVE MULTIPLE BLANKS REDUCED TO ONE
;      INPUT HAS BLANK ADDED AT EACH END AND
;      MULTIPLE BLANKS REDUCED TO ONE.
; ENTER: HLSAV = ADDR AFTER LAST COLON, INPUT IN EBUFF
; RETURNS: YNSW = 0 IF MATCH NOT FOUND WITH LAST ENTRY
;
MC:     LXI   H,MBRCH       ;SET BR CHAR
        MVI   M,'^'         ;  TO CARET (SHIFT N)
        JMP   MOP1
MOP:    LXI   H,MBRCH       ;SET BR CHAR TO COMMA
        MVI   M,','
MOP1:   LHLD  HLSAV         ;ADDR EXPRESSION FIELD
        SHLD  MPTR          ;INIT M-POINTER
NEXTM:  CALL  MMOV          ;MSAVE = M-ITEM
        LHLD  MPTR          ;ADDR M-ITEM
        SHLD  HLSAV
        CALL  SQUEZ         ;REDUCE MULTIPLE BLANKS
        LXI   H,EBUFF
        SHLD  HLSAV         ;HLSAV = STRING ADDR
        CALL  PAD           ;ADD BLANKS AT EACH END
        CALL  SQUEZ         ;REDUCE MULTIPLE BLANKS
        LXI   H,EBUFF       ;  PUT EBUFF ADDR
        SHLD  HLSAV         ;  IN HLSAV
        LXI   H,MSAVE       ;  PUT MSAVE ADDR
        SHLD  HLLSAV        ; IN HLLSAV
        CALL  INDEX         ;LOOK FOR M-ITEM
        MOV   A,C
        ORA   A             ; IF ITEM FOUND
        CNZ   SWY           ;  THEN SET SWITCH YES
        RNZ                 ;  AND RETURN
        LHLD  MPTR          ;RETRIEVE M-POINTER
        DCX   H             ;ADDR BR CHAR
        MOV   A,M           ;   IF END OF LINE
        CPI   0DH
        JZ    MDONE         ;  THEN QUIT
        INX   H             ;ADDR NEXT CHAR
        MOV   A,M           ;   IF END OF LINE
        CPI   0DH
        JZ    MDONE         ;  THEN QUIT
        JMP   NEXTM         ;ELSE MORE M-ITEMS
MDONE:  CALL  SWN           ;SET SWITCH NO
        RET
;
SWY:    ORA   H             ; SET YN SWITCH YES
        STA   YNSW
        RET
;
SWN:    XRA   A             ; SET YN SWITCH NO
        STA   YNSW
        RET
;
; M-MOVE: MOVE M-ITEM TO MSAVE
;   ITEMS ARE SEPARATED BY COMMA OR TERMINATED BY 0DH
;   ENTER:   MPTR = M-ITEM ADDRESS
;   RETURNS: HL & MPTR = NEXT M-ITEM ADDR
;            B = BR CHAR
;
MMOV:   LHLD  MPTR          ;GET M-POINTER
        LXI   D,MSAVE       ;  DESTIN ADDR
MMOV2:  CALL  MBR           ;IF BR CHAR OR EOL
        JZ    SMOV          ;  THEN STOP THE MOVE
        INX   H
        XCHG                ;HL = DESTIN ADDR
        MOV   M,B           ;   MOVE CHAR
        INX   H
        XCHG                ;HL = NEXT SOURCE ADDR
        JMP   MMOV2         ;CHECK THE NEXT CHAR
SMOV:   INX   H
        XCHG                ;HL = DESTIN BR CHAR ADDR
        MVI   A,0DH         ;   PUT AN 0DH THERE
        MOV   M,A
        INX   H
        XCHG                ;HL = NEXT M-ITEM ADDR
        SHLD  MPTR          ;SAVE M-POINTER
        RET
;
; M-BREAK CHAR BETWEEN ITEMS
;    ENTER:   HL = CHAR ADDR
;    RETURNS: A,B = CHAR.  IF BR CHAR THEN Z FLAG TRUE
;
MBR:    MOV   A,M           ;   GET CHAR
        MOV   B,A           ;   SAVE IT
        CPI   0DH           ; IF EOL
        RZ                  ;  THEN RETURN
        LDA   MBRCH         ;GET CURRENT BR CHAR
        CMP   B
        RET
;
; PAD ADDS A BLANK TO EACH END OF A STRING
;   ENTER:   HLSAV = STRING ADDRESS
;
PAD:    LXI   H,WORD
        MVI   A,' '         ;  SET BLANK AT FRONT OF
        MOV   M,A
        INX   H             ;DE = DESTIN ADDR
        XCHG
        LHLD  HLSAV         ;GET SOURCE ADDR
        CALL  CNTLN         ;C = CHAR COUNT
        LHLD  HLSAV         ;GET SOURCE ADDR
        CALL  BLKTFR        ;MOVE TEXT
        XCHG                ;ADDR NEW TEXT END
        DCX   H             ;SET BLANK AT
        MVI   A,' '         ;    END OF
        MOV   M,A           ;     TEMP STRING
        INX   H             ;SET EOL
        MVI   A,0DH
        MOV   M,A
        LHLD  HLSAV         ;MOVE NEW STRING
        XCHG                ;  TO ORIGINAL
        LXI   H,WORD        ;    LOCATION
        CALL  CNTLN
        LXI   H,WORD
        CALL  BLKTFR
        RET
;
; SQUEZ REDUCES MULTIPLE BLANKS TO A SINGLE BLANK
;   ENTER:   HLSAV = STRING ADDRESS
;
SQUEZ:  LHLD  HLSAV         ;ADDR STRING
        SHLD  HLLSAV        ;SAVE POINTER
        MOV   A,M           ;   GET CHAR
CKEOL:  CPI   0DH           ; IF EOL
        RZ                  ;  THEN RETURN
        CPI   ' '           ;IF BLANK
        JZ    CKNC          ;  THEN CHECK NEXT CHAR
        INX   H             ;ELSE BUMP ADDR
        JMP   SQUEZ+3       ;  AND CONTINUE
CKNC:   INX   H             ;IF NEXT CHAR IS
CKNC1:  MOV   A,M           ;     NOT BLANK
        CPI   ' '           ;  THEN CHECK IF EOL
        JNZ   CKEOL
        SHLD  HLLSAV        ;ELSE SAVE ADDRESS
        CALL  SHIFT         ;  REMOVE A BLANK
        LHLD  HLLSAV        ;  RETRIEVE ADDRESS
        JMP   CKNC1         ;  AND CONTINUE
;
; SHIFT STRING CHARS LEFT WITH LOSS OF FIRST CHAR
;   ENTER:   HL = ADDR OF STRING
;   RETURNS: HL = ADDR OF 0DH
;
SHIFT:  INX   H             ;ADDR NEXT CHAR
        MOV   B,M           ;   GET IT IN B
        DCX   H             ;MOVE IT
        MOV   M,B
        MOV   A,M
        CPI   0DH           ; IF IT WAS EOL
        RZ                  ;  THEN RETURN
        INX   H             ;  ELSE MOVE ANOTHER
        JMP   SHIFT
;
; C OPERATION:  COMPUTE WITH TEXT OF STATEMENT
;    LIMITED TO: X = NN  (NN = INTEGER -99 TO +99)
;                OR X = X + NN  OR X = X - NN
;                OR X = X + X   OR X = X - X
;      WHERE X = SINGLE LETTER VARIABLE NAME A-Z
;           FIRST LETTER ONLY OF LONGER NAME GETS USED
;    ENTER:   HLSAV = ADDR OF EXPRESSION FIELD
;
COP:    LHLD  HLSAV         ;ADDR EXPRESSION FIELD
        MVI   B,'='         ;  LOOK FOR EQUAL SIGN
        CALL  INDX
        MOV   A,C
        ORA   A             ; IF NOT PRESENT
        JZ    EXMSG         ;  THEN COMPLAIN
        INX   H             ;BUMP POINTER
        CALL  GETCH         ;GET THE CHAR
        CPI   '-'           ;IF NOT MINUS SIGN
        JNZ   CGVAL         ;  THEN GET THE VALUE
        SHLD  HLLSAV        ;SAVE THE POINTER
        XRA   A
        STA   TEMP          ;SET TEMP = 0
        LHLD  HLLSAV        ;RETRIEVE POINTER
        JMP   SUBV          ;  AND SUBTRACT
CGVAL:  CALL  GVALUE        ;GET THE VALUE
        LXI   H,TEMP        ;  SAVE IT
        MOV   M,E
        LHLD  CPTR          ;RETRIEVE CHAR POINTER
        INX   H             ;BUMP POINTER
        CALL  GETCH         ;GET CHAR
        CPI   0DH           ; IF END OF LINE
        JZ    AVAL          ;  THEN ASSIGN VALUE
        CPI   '-'           ;IF MINUS
        JZ    SUBV          ;  THEN SUBTRACT VALUE
        CPI   '+'           ;IF PLUS
        JZ    ADDV          ;  THEN ADD VALUE
        CALL  GVALUE        ;ELSE GET VALUE
        JMP   AVAL          ;ASSIGN VALUE
ADDV:   INX   H             ;BUMP POINTER
        CALL  GVALUE        ;GET THE VALUE
        LDA   TEMP          ;GET OLD VALUE
        ADD   E             ;ADD VALUES
        CPI   100           ;IF > 99
        JP    OVMSG         ;  THEN COMPLAIN
        MOV   E,A           ;      ELSE FORM NEW VALUE
        JMP   AVAL          ;ASSIGN VALUE
SUBV:   INX   H             ;BUMP POINTER
        CALL  GVALUE        ;GET THE VALUE
        LDA   TEMP          ;GET OLD VALUE
        SUB   E             ;SUBTRACT VALUES
        CPI   9DH           ;IF >= -99
        JP    AVAL-1        ;  THEN CONTINUE
        CPI   100           ;IF > 99
        JP    UNMSG         ;  THEN COMPLAIN
        MOV   E,A
AVAL:   CALL  ASSIGN
        RET
;
EXMSG:  CALL  TOP           ;SHOW THE BAD EXPR
        LXI   H,EXPMSG
        CALL  ERROR
        RET
;
OVMSG:  MVI   E,99          ;  SET VALUE TO 99
        CALL  ASSIGN
        CALL  TOP           ;SHOW THE EXPR
        LXI   H,OVFMSG
        CALL  ERROR
        RET
;
UNMSG:  MVI   E,9DH         ;  SET VALUE TO -99
        CALL  ASSIGN
        CALL  TOP
        LXI   H,UNFMSG
        CALL  ERROR
        RET
;
; GVALUE - GETS VALUE OF CONSTANT OR VARIABLE
;    ENTER:   HL = ADDRESS OF CHAR NAMING THE VARIABLE
;             CPTR = ADDRESS OF CHAR
;    RETURNS: E = VALUE
;             CPTR = ADDRESS OF THE CHARACTER
;
GVALUE: CALL  GETCH         ;GET CHAR
        MOV   E,A           ;      SAVE IN E
        CALL  LETTER        ;IF LETTER
        JZ    LTR           ;  THEN PROCEED
        CALL  GETNM         ;ELSE EXPECT NUMBER
        SHLD  CPTR          ;SAVE CHAR POINTER
        RET
LTR:    SHLD  CPTR          ;SAVE CHAR POINTER
CONV:   MOV   B,M           ;   SAVE CHAR IN B
        CALL  VARMCH        ;LOOK IT UP
        CPI   1             ;IF END MARKER
        CZ    BADFRM        ;  THEN COMPLAIN
        RZ                  ;  AND RETURN
        INX   H             ;ELSE POINT AT VALUE
        MOV   E,M           ;   SAVE VALUE IN E
        RET
;
; ASSIGN SETS A NEW VALUE TO AN OLD OR NEW VARIABLE
;    ENTER:   HLSAV = ADDR OF EXPRESSION FIELD
;             BINARY VALUE IN E
;
ASSIGN: LHLD  HLSAV         ;ADDR EXPRESSION FIELD
        CALL  GETCH         ;GET FIRST CHAR
        CALL  LETTER        ;IF NOT A LETTER
        JNZ   EXMSG         ;  THEN COMPLAIN
        MOV   B,M           ;   GET CHAR IN B
        CALL  VARMCH        ;LOOK IT UP
        CPI   1             ;IF END MARKER
        CZ    BADFRM        ;  THEN COMPLAIN
        RZ                  ;  AND RETURN
        INX   H             ;  ELSE BUMP TO VALUE ADDR
        MOV   M,E
        RET                 ;  AND RETURN
;
; BASIC INTERPRETATION -
;   IF PROGRAM TEXT IS NOT LEGAL PILOT, THEN
;   AN ALTERNATE INTERPRETER SUCH AS BASIC CAN BE
;   SUPPLIED TO BE TRIED BEFORE PILOT COMPLAINS.
;
BASIC:  ORA   H             ;DUMMY ILLEGAL RETURN
        RET
;
; R OPERATION -
;    ENTER:   HLSAV = R-STATEMENT ADDRESS
;
ROP:    RET
;
; E OPERATION - RETURNS FROM CALL OR ENDS PROGRAM
;
EOP:    LDA   LEVEL         ;IF RETURN LEVEL = 0
        ORA   A             ;   THEN QUIT
        JZ    RSTRT
        CALL  RESRET        ;  ELSE SET RETURN FROM
        RET                 ;  PILOT CALL
;
LOAD:   LXI   H,PBUFF
        CALL  INPUT
        RET
;
; NEW$ DELETES $NAMES BY RESETTING A-POINTER
;
NEWN:   LHLD  APTR          ;REMOVE STOP CHAR
        MVI   M,20H
        LHLD  MEMTP         ;ADDR MEMTP
        MVI   M,1           ;PLACE STOP CHAR
        DCX   H
        SHLD  APTR          ;STORE MEMTP-1 ADDRESS
        RET
;
; INITIALIZE NUMERIC VARIABLES
;   SETS A-Z TO ZERO VALUE
;
INITV:  LXI   H,NVAR        ;ADDR FRONT OF VAR LIST
        MVI   B,'A'         ;START WITH 'A'
        MOV   A,B
NV:     CPI   'Z'+1         ;IF ALPHABET COMPLETE
        RZ                  ;THEN RETURN
        MOV   M,A           ;   STORE THE LETTER
        INX   H             ;BUMP ADDRESS
        MVI   A,0
        MOV   M,A           ;   STORE ZERO
        INX   H             ;BUMP THE ADDRESS
        MOV   A,B           ;      GET LETTER
        ADI   1             ;CHANGE TO NEXT LETTER
        MOV   B,A           ;   SAVE IN B
        JMP   NV            ;NEXT VARIABLE
;
; SAVE RETURN POINTER IN STACK
;    ENTER:   IPTR = START OF NEXT SOURCE LINE
;    RETURNS: LEVEL BUMPED ONE HIGHER
;             IPTR COPIED AT LEVEL POSITION
;
SAVRET: LXI   H,LEVEL       ;GET CURRENT LEVEL
        MOV   A,M
        ADI   1             ;BUMP TO NEXT LEVEL
        CPI   8             ;IF < 8
        JM    SAV2          ;  THEN CONTINUE
        LXI   H,STMSG       ;ELSE STACK OVERFLOW
        CALL  ERROR
        RET
SAV2:   MOV   M,A           ;   STORE IT
        ADD   A             ;DOUBLE IT
        MOV   C,A           ;      SAVE IN C
        LHLD  IPTR          ;PUT IPTR IN DE
        XCHG
        LXI   H,RETSAV      ;  GET BASE ADDR
        MOV   A,L
        ADD   C             ;BASE + 2 X LEVEL
        MOV   L,A           ;      HL = STACK ADDR
        MOV   M,D           ;   SAVE IPTR
        ADI   1
        MOV   L,A           ;      HL = STACK ADDR+1
        MOV   M,E
        RET
;
; RESET RETURN POINTER FROM STACK
;    RETURNS: IPTR SET TO LAST SAVED RETURN
;             LEVEL REDUCED BY ONE
;
RESRET: LDA   LEVEL         ;GET RETURN LEVEL
        ADD   A             ;DOUBLE IT
        MOV   C,A           ;      SAVE IN C
        LXI   H,RETSAV      ;  GET BASE ADDR
        MOV   A,L
        ADD   C             ;BASE + 2 X LEVEL
        MOV   L,A           ;      HL = STACK ADDR
        MOV   D,M           ;   SAVE POINTER IN DE
        ADI   1
        MOV   L,A           ;      HL = STACK ADDR+1
        MOV   E,M
        XCHG
        SHLD  IPTR          ;RESET IPTR
        LXI   H,LEVEL       ;REDUCE LEVEL
        MOV   A,M
        SUI   1
        MOV   M,A
        RET
;
; BLOCK TRANSFER FROM HL TO DE, C CHARACTERS
;   RETURNS: HL AND DE AT LAST CHAR+1 ADDR
;
BLKTFR: MOV   A,C           ;   GET COUNT
        ORA   A             ; IF COUNT = 0
        RZ                  ;  THEN RETURN
        MOV   B,M           ;   GET A SOURCE CHARACTER
        INX   H             ;GET NEXT DEST ADDR
        XCHG
        MOV   M,B           ;   PUT IT IN DEST LOCATION
        INX   H             ;GET NEXT SOURCE ADDR
        XCHG
        MOV   A,C           ;   DECREMENT COUNT
        SUI   1
        MOV   C,A
        JNZ   BLKTFR        ;IF NONZERO THEN NEXT
        RET
;
; KEYBOARD INPUT TO EBUFF
;   ENTER:  CHMAX= MAXIMUM CHARS ALLOWED IN LINE
;   DEL (SHIFT O) OR RUBOUT CANCELS LAST CHAR
;   CTL/U CANCELS CURRENT LINE
;   USES B FOR CHAR COUNT, C FOR OUTPUT
;
KEYIN:  LXI   H,EBUFF       ;POINT AT EBUFF
        SHLD  EPTR          ;SAVE POINTER
        LXI   H,CHMAX       ;GET MAX COUNT
        MOV   B,M
KIN2:   LHLD  EPTR          ;RETRIEVE POINTER
        CALL  CI            ;GET CHAR AND ECHO
        CPI   5FH           ;IF DEL
        JZ    CANC          ;  THEN CANCEL LAST CHAR
        CPI   7FH           ;IF RUBOUT
        JZ    CANC          ;  THEN CANCEL LAST CHAR
        CPI   15H           ;IF CTL/U
        JZ    CANL          ;  THEN CANCEL LINE
        CPI   61H           ;FORCE UPPER CASE
        JM    NTR
        XRI   20H
NTR:    MOV   M,A           ;STORE THE CHAR
        INX   H             ;INCR POINTER
        SHLD  EPTR          ;SAVE IT
        CPI   0DH           ;IF CR
        JZ    KOUT          ;  THEN STOP ENTRY
        DCR   B             ;ELSE DECR CHAR COUNT
        MOV   A,B
        ORA   A             ;IF COUNT NOT 0
        JNZ   KIN2          ;  THEN NEXT CHAR
        MVI   C,0DH         ;ELSE END WITH CR
        MOV   M,C
        CALL  CO            ;  AND SEND IT
KOUT:   CALL  LF            ;SEND LINE FEED
        RET                 ;  AND RETURN
CANL:   MVI   C,3CH         ;SEND <
        CALL  CO 
        CALL  CRLF          ;SEND CRLF
        JMP   KEYIN         ;  START OVER
CANC:   MOV   A,B           ;INCR CHAR COUNT
        LXI   H,CHMAX       ;  UNLESS AT BEGINNING
        MOV   C,M
        CMP   C
        JZ    KIN2
        INR   B
        LHLD  EPTR
        DCX   H             ;DECR POINTER
        SHLD  EPTR
        JMP   KIN2+3
;
CRLF:   MVI   C,0DH
        CALL  CO 
LF:     MVI   C,0AH
        CALL  CO 
        RET
;
; INPUT PROGRAM TO BUFFER AREA
;   DEL (SHIFT O) CANCELS LAST CHAR, CTL/U CANCELS LINE
;   TERMINATES WITH CTL/Z (1AH)
;
INPUT:  CALL  BLKBF         ;BLANK THE BUFFER
        LXI   H,PBUFF       ;SET POINTER
INPT1:  MOV   A,M           ;GET EXISTING CHAR
        SHLD  LLSAV         ;SAVE FIRST CHAR ADDR
        CPI   1             ;IF END MARK
        JZ    CHOP          ;  THEN CHOP ENTRY
        CALL  RI            ;GET CHAR
        CPI   ' '           ;IF NOT BLANK
        JNZ   INPT3+3       ;  THEN CONTINUE
        JMP   INPT1         ;ELSE SKIP LEADING BLANK
INPT2:  MOV   A,M           ;GET EXISTING CHAR
        CPI   1             ;IF END MARK
        JZ    CHOP          ;  THEN CHOP ENTRY
INPT3:  CALL  RI            ;GET CHARACTER
        CPI   0             ;IGNORE NULLS
        JZ    INPT3
        CPI   7FH           ;IGNORE RUBOUTS
        JZ    INPT3
        CPI   1AH           ;IF TERM CHAR CTL/Z
        JZ    INEND         ;  THEN END OF INPUT
        CPI   15H           ;IF CTL/U
        JZ    KLN           ;  THEN KILL THE LINE
        CPI   5FH           ;IF DEL
        JZ    CLC           ;  THEN CANCEL LAST CHAR
        MOV   M,A           ;ELSE STORE THE CHAR
        INX   H             ;AND INCR THE POINTER
        CPI   0DH           ;IF NOT CR
        JNZ   INPT2         ;  THEN GET NEXT CHAR
        CALL  LF            ;ELSE SEND LF
        JMP   INPT1         ;AND GET NEXT NEW LINE
INPT4:  MOV   M,A           ;STORE CHAR
        INX   H             ;INCR POINTER
        JMP   INPT2
CLC:    DCX   H             ;CANCEL LAST CHAR
        JMP   INPT3
KLN:    MVI   C,3CH         ;SEND <
        CALL  CO 
        CALL  CRLF          ;SEND CRLF
        LHLD  LLSAV         ;ADDR FRONT OF LINE
        JMP   INPT3
CHOP:   LHLD  LLSAV         ;ADDR FRONT OF LINE
        CALL  DSPLY
        LXI   H,IOVMSG
        CALL  ERROR
INEND:  MVI   M,1           ;STORE END MARK
        SHLD  TOPP          ;STORE ADDRESS
        CALL  CRLF          ;SEND CRLF
        LXI   H,LEVEL       ;ZERO RETURN LEVEL
        MVI   M,0
        RET
;
; DISPLAY A CHARACTER STRING TO CR OR 01
;   ENTER:  HL = STARTING ADDRESS
;   OUTADR CONTAINS ADDRESS OF CO, LO, OR PO
;
DSPLY:  MOV   A,M           ;GET A CHARACTER
        INX   H             ;BUMP POINTER
        MOV   D,H           ;SAVE IT
        MOV   E,L
        CPI   1             ;IF 01
        RZ                  ;  THEN RETURN
        MOV   C,A           ;PUT CHAR IN C
        LHLD  OUTADR        ;MAKE AN INDIRECT CALL
        CALL  OVCTR         ;  TO SEND THE CHAR
        CPI   0DH           ;IF CR
        JZ    ENDOL         ;  THEN EOL
        XCHG                ;ELSE RETRIEVE POINTER
        JMP   DSPLY         ;AND DISPLAY MORE
ENDOL:  MVI   C,0AH         ;SEND LINE FEED
        LHLD  OUTADR        ;MAKE AN INDIRECT CALL
        CALL  OVCTR         ;  TO SEND IT
        XCHG                ;RETRIEVE POINTER
        CALL  SKLN           ;SKIP ANY LINE NOS.
        RET
OVCTR:  PCHL
;
; OUTPUT PROGRAM IN MEMORY TO 01 END MARK
;
PRGOUT: LXI   H,PBUFF        ;PGM START ADDR
        CALL  DSPLY          ;DISPLAY ONE LINE
        CPI   1              ;IF NOT END MARK
        JNZ   PRGOUT+3       ;  THEN MORE
        RET
;
DPRG:   LXI   H,CO           ;DISPLAY PROGRAM IN MEMORY
        SHLD  OUTADR
        CALL  PRGOUT
        RET
;
LPRG:   LXI   H,LO           ;LIST PROGRAM IN MEMORY
        SHLD  OUTADR
        CALL  PRGOUT
        LXI   H,CO           ;RESET TO CONSOLE
        SHLD  OUTADR
        RET
;
SPRG:   LXI   H,PO           ;SAVE PROGRAM
        SHLD  OUTADR
        CALL  PRGOUT
        LXI   H,CO           ;RESET TO CONSOLE
        SHLD  OUTADR
        RET
;
; I/O ROUTINES
;     USE STPORT (MDS-0F7H) FOR STATUS, PORT (MDS-0F6H) FOR DATA
;     STATUS BIT 1 (2H) FOR READ DATA AVAIL (RDA)
;     BIT 0 (1H) FOR TRANSMIT BUFFER EMPTY (TBE)
;
; OUTPUT CHAR FROM C
;   LOOKS FOR CTL/Z         INPUT FOR PANIC EXIT
;
;CHO:	IN	STPORT	;GET STATUS
;	ANI	RDA	;IF NO INPUT
;	JZ	CHO1	;THEN CONTINUE
;	CALL	CI	;ELSE SEE WHAT IT IS
;	CPI	1AH	;IF CNTRL/Z
;	JZ	INTR	;THEN INTERRUPT
;CHO1:   IN    STPORT          ;NOW FOR STANDARD OUTPUT
;        ANI   TBE
;        JZ    CHO1
;        MOV   A,C
;        OUT   PORT
;        RET
;
INTR:   PUSH  H          ;SAVE REGISTERS
        PUSH  D
        PUSH  B
        LXI   H,INTMSG   ;INTERRUPT MESSAGE
        CALL  ERROR
        CALL  ENTRY      ;ALLOW RESTART
        POP   B          ;ELSE CONTINUE
        POP   D
        POP   H
        RET
;
; INPUT CHAR TO A AND ECHO
;
;CHI:    IN    STPORT          ;NORMAL INPUT
;        ANI   RDA
;        JZ    CHI
;        IN    PORT
;        ANI   7FH
CHI:	PUSH	B
	MVI	C,1
	CALL	CPM
	POP	B
        MOV   C,A
        CALL  CO
        RET
;
; ERROR - DISPLAYS ERROR MESSAGE
;    ENTER:  HL = ADDRESS OF MESSAGE
;    RETURNS: ZERO FLAG SET
;
ERROR:  CALL  DSPLY
        XRA   A
        RET
;
; ERROR MESSAGES
;
BLMSG:  DB    '- LABEL NOT FOUND',0DH
;
IOVMSG: DB    '/OVERFLOW',0DH
;
NRMSG:  DB    '*NO ROOM',0DH
;
EXPMSG: DB    '*ILLEGAL EXPRESSION',0DH
;
OVFMSG: DB    '*VALUE >  99',0DH
;
UNFMSG: DB    '*VALUE < -99',0DH
;
STMSG:  DB    '*USE DEPTH EXCEEDED',0DH
;
NMSG:   DB    '*NUMERIC RESPONSE REQUIRED',0DH
;
INTMSG: DB    '*INTERRUPTED',0DH
;
IBUFF:  DB    'T:',0DH
        DB    'T:PILOT-8080, 1.1',0DH
;
;        DB    ':LOAD A NEW PROGRAM?',0DH
;
;        DB    'A:',0DH
;
;        DB    'M: Y',0DH
;
;        DB    'JN:*%',0DH
;
;        DB    'T:ENTER PILOT PROGRAM',0DH
;
;        DB    ':TERMINATE INPUT WITH CTL/Z',0DH
;
        DB    'LOAD:',0DH
;
        DB    '*% IEP:',0DH
;
; ORG HERE CAN SET START OF RAM PROGRAM BUFFER SPACE
;
; RELOCATED TO END OF MONITOR			;JIF
;        ORG   PBUFB
;PBUFF:  DB    1
;
; SOURCE PROGRAM AND $STRING STORAGE HERE TO MEMTP
;DISPLACEMENTS NEEDED IN PMON		JIF
        END	START
