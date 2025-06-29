;###S
;MODIFIED BY A.R.G 10/9/77 FOR CP/M ASSEMBLER.
;CHANGES ENCLOSED IN ;###S AND ;###E WITH ORIGINAL
;CODE REMAINING AS COMMENTS.
;
MEMST	EQU	1800H	;ACTIVE VAR TABLE.  NOT START OF FREE MEMORY
;MEMST     EQU    2000Q            ;MUST BE ON PAGE BOUNDARY
; DEFINE I-O/SP/SUB ADD. JUMP TABLE LOCATIONS
INIT	EQU	1920H	;INITIALIZATION ROUTINE IN MONITOR
IOJUMP	EQU	1900H
SPNT	EQU	IOJUMP	;STACK ADDRESS IS FIRST WORD IN IOJUMP TABLE
SUBAD	EQU	IOJUMP+2
CONIN	EQU	IOJUMP+4
CONOUT	EQU	IOJUMP+7
STATUS	EQU	IOJUMP+0AH
HSRDR	EQU	IOJUMP+0DH
FPTBL	EQU	1774H
NORM	EQU	FPTBL
FLOAT	EQU	FPTBL+3
ZROL	EQU	FPTBL+6
LADD	EQU	FPTBL+9H
LMUL	EQU	FPTBL+0CH
LDIV	EQU	FPTBL+0FH
LSUB	EQU	FPTBL+12H
DFXL	EQU	FPTBL+15H
LMCM	EQU	FPTBL+18H
CONV	EQU	FPTBL+1EH
FINPT	EQU	FPTBL+21H
MULT	EQU	FPTBL+24H
PTVAL	EQU	FPTBL+27H
DCOMP	EQU	FPTBL+2AH
MCHK	EQU	FPTBL+2DH
CHAR2	EQU	FPTBL+30H
;SPNT      EQU    400Q
;SUBAD     EQU    402Q
;CONIN     EQU    404Q
;CONOUT    EQU    407Q
;STATUS    EQU    412Q
;HSRDR     EQU    415Q
;
;###E
OBUFF     EQU    MEMST            ;INPUT AND OUTPUT BUFFERS OCCUPY
IBUF      EQU    MEMST+1          ;SAME AREA
STLINE    EQU    MEMST+111Q
NLINE     EQU    MEMST+113Q   
NL2       EQU    MEMST+115Q
NL4       EQU    MEMST+117Q
NL6       EQU    MEMST+121Q
KLINE     EQU    MEMST+122Q
KL2       EQU    MEMST+124Q
KL4       EQU    MEMST+126Q
KL6       EQU    MEMST+130Q
PLINE     EQU    MEMST+131Q
PL2       EQU    MEMST+133Q
PL4       EQU    MEMST+135Q
SBSAV     EQU    PL4              ;RETURN ADD. SAVE FOR CALL STMT.
PL6       EQU    MEMST+137Q
KASE      EQU    MEMST+140Q
LEN       EQU    MEMST+141Q
MULT1     EQU    MEMST+142Q
MULT2     EQU    MEMST+144Q
NXTSP     EQU    MEMST+131Q
STSPAC    EQU    MEMST+113Q
;###S
;NORM      EQU    113707Q
;FLOAT     EQU    113712Q
;ZROL      EQU    113715Q
;###E
LPNT      EQU    MEMST+122Q
KLEN      EQU    MEMST+130Q
CPNT      EQU    MEMST+133Q
KFPNT     EQU    MEMST+126Q
FREG2     EQU    MEMST+200Q
CREG      EQU    MEMST+204Q
;###S
;LADD      EQU    113720Q
;LMUL      EQU    113723Q
;LDIV      EQU    113726Q
;LSUB      EQU    113731Q
;DFXL      EQU    113734Q
;LMCM      EQU    113737Q
;###E
HLINP     EQU    MEMST+206Q
GREG      EQU    MEMST+167Q
FREG1     EQU    MEMST+174Q
SCR       EQU    MEMST+146Q
;###S
;CONV      EQU    113745Q
;###E
MODE      EQU    MEMST+205Q
;###S
;FINPT     EQU    113750Q
;MULT      EQU    113753Q
;PTVAL     EQU    113756Q
;DCOMP     EQU    113761Q
;MCHK      EQU    113764Q
;CHAR2     EQU    113767Q
;###E
MESCR     EQU    MEMST+210Q       ;DEFINE MEMORY SCR AREA PNTR
VARAD     EQU    MEMST+212Q       ;TEMP SPACE FOR INP. STMT.
VNAME     EQU    MEMST+214Q       ;TEMP SPACE FOR 'FOR-NEXT'
VLOC      EQU    MEMST+216Q       ;TEMP SPACE FOR 'FOR-NEXT'
FLIMT     EQU    MEMST+220Q       ;TEMP SPACE FOR 'FOR-NEXT'
NEST      EQU    MEMST+224Q       ;NESTING STACK-POINTER
STAC      EQU    MEMST+226Q       ;FOR-NEXT NESTING STACK
;###S
;STSIZ     SET    20               ;STACK SIZE, ALLOWS 10 NESTED FOR-NEXT
STSIZ	EQU	20
;###E
TOPNS     EQU    STAC             ;TOP OF STACK
BOTNS     EQU    STAC+STSIZ       ;BOTTOM OF STACK
VEND      EQU    MEMST+252Q       ;DEF. END OF VAR. STORAGE AREA
;###S
FWAM	EQU	1923H	;POINTER TO FREE MEMORY MOVED OUT OF INTERP
;###E
;  MAIN ROUTINE--HANDLES ALL USER INPUT
;###S
	ORG	0100H
;          ORG    100000Q
	JMP	INIT
;###E
M1:       LXI    H,OBUFF
          MVI    M,1
          LXI    H,STLINE
          MVI    M,377Q
          INR    L
          MVI    M,377Q
          LHLD   FWAM             ;GET ADDRES OF FWA MEM.
          SHLD   NLINE            ;STORE IN FREE SPACE PNTR.
M1A:      LHLD   SPNT
          SPHL
M2:       LXI    H,ODATA
          CALL   FORM1
          CALL   WRIT
M3:       LHLD   NLINE
          INX    H
          INX    H
          INX    H
          INX    H
          INX    H
          CALL   TTYIN
          MOV    C,A
          CPI    0
          JZ     M3
          CALL   ALPHA
          JC     M4
          CALL   NUMB
          CNC    WHAT
          CALL   INSERT
          JMP    M3
M4:       MVI    A,0
          CALL   SYMSRT
M4A:      INR    A
          CZ     WHAT
          DCR    A
          JZ     RUN
          DCR    A
          CZ     TAPE
          JZ     M2
          DCR    A
          CZ     LIST
          JZ     M2
          DCR    A
          JZ     M1
          DCR    A
          CNZ    WHAT
; ROUTINE TO INPUT FROM HSR
PTAPE:    CALL   CHAR5
          CPI    0
          JZ     PTAPE
PT1:      CALL   HSRIN
          MOV    C,A
          CPI    0
          JZ     PTAPE
          CALL   ALPHA
          JC     M4
          CALL   INSERT
          CALL   CHAR5
          CPI    0
          JZ     M2
          INX    H
          INX    H
          INX    H
          INX    H
          INX    H
          JMP    PT1
; ROUTINE TO HANDLE ALL SOURCE LINE INPUT.
; THIS INCLUDES INSERTION, DELEATION, AND
; ADDITION OF NEW SOURCE LINES.
INSERT:   DCX    H
          MOV    M,C
          INX    H
          CALL   CVB
          CPI    5
          JC     ISR1A
          CNZ    WHAT
          MOV    A,E
          RAL
          CC     WHAT
ISR1A:   LHLD   NLINE
          MOV    M,D
          INX    H
          MOV    M,E
          LXI    H,NLINE
          CALL   PTVAL
          LHLD   STLINE
          CALL   CHK1
          JNC    ISRT3
          LHLD   NLINE
          SHLD   STLINE
ISRT1:    MVI    D,377Q
          MOV    E,D
          CALL   STPNT
          INX    H
ISRT2:    MOV    A,M
          ADI    5
          LHLD   NLINE
          ADD    L
          MOV    L,A
          MVI    A,0
          ADC    H
          MOV    H,A
          SHLD   NLINE
          RET
ISRT3:    SHLD   KLINE
ISRT4:    LXI    H,KLINE
          CALL   PTVAL
          LXI    H,NL2
          MOV    D,M
          INR    L
          MOV    E,M
          LXI    H,KL2
          MOV    B,M
          INR    L
          MOV    C,M
          CALL   DCOMP
          JZ     ISRT6
          JC     ISR12
          LHLD   KL4
          CALL   CHK1
          JC     ISRT5
          PUSH   H
          LHLD   KLINE
          SHLD   PLINE
          LXI    H,PLINE
          CALL   PTVAL
          POP    H
          SHLD   KLINE
          JMP    ISRT4
ISRT5:    LHLD   NLINE
          CALL   NOLINE
          RZ
          XCHG
          LHLD   KLINE
          CALL   STPNT
          XCHG
          JMP    ISRT1
ISRT6:    LHLD   NLINE
          CALL   NOLINE
          JNZ    ISRT8
          LHLD   STLINE
          XCHG
          LHLD   KLINE
          PUSH   H
          POP    B
          CALL   DCOMP
          LHLD   KL4
          JZ     ISRT7
          XCHG
          LHLD   PLINE
          CALL   STPNT
          RET
ISRT7:    SHLD   STLINE
          RET
ISRT8:    LHLD   KL4
          XCHG
          LHLD   NLINE
          CALL   STPNT
ISRT9:    LHLD   KLINE
          XCHG
          LHLD   STLINE
          PUSH   H
          POP    B
          CALL   DCOMP
          JZ     ISR11
          LHLD   NLINE
          XCHG
          LHLD   PLINE
          CALL   STPNT
ISR10:   LXI    H,NL6
          JMP    ISRT2
ISR11:   LHLD   NLINE
          SHLD   STLINE
          JMP    ISR10
ISR12:   LHLD   KLINE
          XCHG
          LHLD   NLINE
          CALL   NOLINE
          RZ
          CALL   STPNT
          JMP    ISRT9
; ROUTINE TO STORE POINTERS INTO MEM ARRAY
STPNT:    INX    H
          INX    H
          MOV    M,E
          INX    H
          MOV    M,D
          RET
; ROUTINE TO CHECK NEW LINE FOR SOURCE STMT.
NOLINE:   PUSH   H
          INX    H
          INX    H
          INX    H
          INX    H
          MOV    C,M
          INX    H
          CALL   LENGTH
          POP    H
          CMP    C
          RET
; ROUTINE TO RESPOND WITH 'WHAT?' FOR UNIDENTIFIED
; COMMAND.
WHAT:     LXI    H,ODATA
          CALL   FORM7
          CALL   WRIT
          JMP    M1A
; ROUTINE TO PUNCH PAPER TAPE OF SOURCE.
TAPE:     PUSH   PSW
          PUSH   B
          LXI    H,ODATA
          CALL   FORM2
          CALL   WRIT
          MVI    A,0
          POP    B
          MVI    B,100Q
          PUSH   PSW
          PUSH   B
          CALL   PAD
          CALL   WRIT
          POP    B
          PUSH   B
          CALL   LIST
          POP    B
          POP    PSW
          CALL   PAD
          CALL   WRIT
          POP    PSW
          RET
; ROUTINE TO LIST TO TTY THE SOURCE STMTS.
LIST:     LHLD   STLINE
          CALL   CHK1
          JC     M1A
          SHLD   PLINE
          LXI    H,177777Q
          SHLD   KLINE
          DCR    C
          CNZ    BOUND
          LHLD   PLINE
LIS1:     INX    H
          INX    H
          MOV    B,M
          INX    H
          MOV    C,M
          PUSH   B
          INX    H
          CALL   FORM5
          CALL   WRIT
          POP    B
          LHLD   KLINE
          XCHG
          CALL   DCOMP
          RZ
          MOV    L,B
          MOV    H,C
          CALL   QUITT            ;CHECK FOR INTERRUPTION
          JMP    LIS1             ;NONE - CONTINUE
;THIS ROUTINE CHECKS PORT 2 FOR A CNTRL/S CHARACTER
;IF ONE IS FOUND THEN EXECUTION IS TO BE INTERRUPTED
;CONTROL IS PASSED TO M1A
QUITT:    CALL   STATUS            ;TEST FLAG PORT
          RAR                     ;FLAG TO CY
          RNC                     ;NOTHING THERE
          CALL   CONIN            ;FLAG WAS SET, GET DATA
QTCHK:    CPI    223Q             ;WAS IT CNTRL/S?
          JZ     M1A              ;YES
          RET                     ;NO, RETURN
;  ROUTINES NUMB AND ALPHA CHECK IF CONTENTS OF MEMORY
;  LOCATION IN HL CONTAIN ASCII NUMERIC OR ALPHBETIC
; CHARACTER. RETURN CY=1 IF YES, CY=0 IF NO.
NUMB:     PUSH   B
          MVI    B,260Q
          MVI    C,272Q
C1:       MOV    A,M
          CMP    B
          CMC
          JNC    BAC
          CMP    C
BAC:      POP    B
          RET
ALPHA:    PUSH   B
          MVI    B,301Q
          MVI    C,333Q
          JMP    C1
; ROUTINE TO CONVERT ASCII NUMERIC CHAR. STRING TO
; EQUIVALENT BINARY NUMBER. RETURNS EQUIVALENT IN
; DE REG.  LENGTH OF LINE PASSED IN REG C AND
; RETURNED POINTING TO LAST NUMERIC CHAR. LENGTH
; OF CHAR STRING RETURNED IN REG A.
CVB:      PUSH   H
          PUSH   B
          CALL   LENGTH
          PUSH   PSW
          PUSH   H
          CPI    0
          JZ     CVB2
          LXI    H,KASE
          MOV    M,A
          INR    L
          MOV    M,C
          LXI    H,10
          SHLD   MULT1
          LXI    H,0
          SHLD   MULT2
          LXI    H,MULT2+1
CVB1:     CALL   MULT
          XTHL
          MOV    A,M
          SBI    260Q
          ADD    D
          MOV    D,A
          MVI    A,0
          ADC    E
          MOV    E,A
          INX    H
          XTHL
          MOV    M,D
          INR    L
          MOV    M,E
          PUSH   H
          LXI    H,LEN
          DCR    M
          DCR    L
          DCR    M
          POP    H
          JNZ    CVB1
CVB2:     POP    H
          POP    PSW
          POP    B
          LXI    H,LEN
          MOV    C,M
          POP    H
          RET
; ROUTINE TO EVALUATE LENGTH OF ASCII NUMERIC
; CHAR STRING: PASSED ADD OF FIRST CHAR IN HL REG.
; RETURNS LENGTH IN REG A.
LENGTH:   PUSH   B
          PUSH   H
          MVI    B,0
NLE1:     CALL   NUMB
          JNC    NLE2
          INX    H
          INR    B
          DCR    C
          JZ     NLE2
          JMP    NLE1
NLE2:     MOV    A,B
          POP    H
          POP    B
          RET
; ROUTINE TO LOCATE SOURCE LINE IN MEM. PASSED BIN VALUE
;OF LINE NUMBER IN DE(LOW,HIGH) REG. RETURNS ADDRESS OF
;SOURCE LINE IN HL REGS.(HIGH,LOW). CY SET=OT FOUND.
NSRCH:    LHLD   STLINE
L2:       CALL   CHK1
          RC
          MOV    B,M
          INX    H
          MOV    C,M
          CALL   DCOMP
          JZ     FOUND
          INX    H
          MOV    A,M
          INX    H
          MOV    H,M
          MOV    L,A
          JMP    L2
FOUND:    DCX    H
          ORA    A
          RET
; ROUTINE TO COMPARE CONTENTS OF HL TO 177777Q.
; RETURNS CY=1 IF YES: CY=0 IF NO.
CHK1:     PUSH   B
          PUSH   H
          MVI    B,0
          MVI    C,1
          DAD    B
          POP    H
          POP    B
          RET
; ROUTINE TO PAD OUTPUT BUFFER WITH CONTENTS OF REG A.
; REG B CONTAINS NUMBER OF CHAR TO PAD.
PAD:      PUSH   B
          PUSH   D
          PUSH   H
          LXI    H,OBUFF
          MOV    C,L
          MOV    L,M
          MOV    D,A
          MVI    A,73
P1:       CMP    L
          JNZ    P2
          MOV    L,C
          MOV    M,A
          CALL   WRIT
          INR    L
P2:       MOV    M,D
          INR    L
          DCR    B
          JNZ    P1
          MOV    A,D
          MOV    B,L
          MOV    L,C
          MOV    M,B
          POP    H
          POP    D
          POP    B
          RET
; ROUTINE TO DUMP OUTPUT BUFFER TO TTY.
WRIT:     MVI    D,0
WRIT1:    PUSH   PSW
          PUSH   H
          PUSH   B
          LXI    H,OBUFF
          PUSH   H
          MOV    C,M
          DCR    C
          JZ     W2
          INR    L
W1:       MOV    A,M
          CALL   CONOUT           ;PRINT VIA ODT
          INR    L
          DCR    C
          JNZ    W1
          DCR    D
          JZ     W2
          MVI    A,215Q
          CALL   CONOUT           ;PRINT VIA ODT
          MVI    A,212Q
          CALL   CONOUT           ;PRINT VIA ODT
W2:       POP    H
          MVI    M,1
          POP    B
          POP    H
          POP    PSW
          RET
; ROUTINE TO LOCATE COMMANDS, KEY WORDS, OPERATORS,
; AND FUNCTION.  HL CONTAINS ADD OF FIRST CHAR.:
; REG C CONTAINS LENGTH OF LINE: RETURNS SYMBOL NUMBER
; IF FOUND IN REG A, 377Q IN A IF NOT FOUND.
SYMSRT:   PUSH   D
          PUSH   B
          PUSH   H
          PUSH   H
          LXI    H,LEN            ;SAVE C IN LEN
          MOV    M,C
          LXI    H,KDATA          ;LOCATE TYPE OF SYMBOL SOUGHT.
          MVI    E,0              ;REG A CONTAINS:
          ADD    L                ; 0 FOR COMMAND
          MOV    L,A              ; 1 FOR KEYWORD
          MOV    L,M              ; 2 FOR OPERATOR AND DELIMITER
S2:       MOV    C,M              ; 3 FOR FUNCTION
S3:       INR    L
          MOV    B,M
          XTHL
          MOV    A,M
          CMP    B
          JNZ    S4
          DCR    C
          JZ     S5
          PUSH   H
          LXI    H,LEN
          DCR    M
          POP    H
          JZ     S4A
          INX    H
          XTHL
          JMP    S3
S4A:      INR    C
S4:       POP    H
          MOV    A,C
          ADD    L
          MOV    D,H
          POP    H
          POP    B
          PUSH   B
          PUSH   H
          PUSH   H
          LXI    H,LEN
          MOV    M,C
          MOV    L,A
          MOV    H,D
          MOV    A,M
          INR    E
          MOV    C,A
          INR    A
          JNZ    S3
          LXI    H,LEN
          INR    M
          MVI    E,377Q
S5:       MOV    A,E              ; MOVE SYMBOL NUMBER INTO REG A
          LXI    H,LEN
          MOV    E,M
          DCR    E
          POP    H
          POP    H
          POP    B
          MOV    C,E              ;MOVE NUMBER OF CHAR. LEFT IN LINE INT
          POP    D
          RET
;*****************************************************
;THE CODE FROM HERE TO THE NEXT LINE OF *'S MUST BE ON ONE PAGE
;THIS MACRO ADDS PARITY BITS TO CHARACTERS
KDATA:    DB     KDAT1 AND 377Q
          DB     KDAT2 AND 377Q
          DB     KDAT3 AND 377Q
          DB     KDAT4 AND 377Q
KDAT1:   DB     3,322Q,325Q,316Q  ;RUN
          DB     3,320Q,314Q,323Q  ;PLS
          DB     3,314Q,311Q,323Q  ;LIS
          DB     3,323Q,303Q,322Q  ;SCR
          DB     3,320Q,324Q,301Q  ;PTA
          DB     377Q
KDAT2:   DB     3,314Q,305Q,324Q  ;LET
          DB     3,320Q,322Q,311Q  ;PRI
          DB     3,322Q,305Q,315Q  ;REM
          DB     3,323Q,324Q,317Q  ;STO
          DB     3,305Q,316Q,304Q  ;END
          DB     3,307Q,317Q,324Q  ;GOT
          DB     2,311Q,306Q       ;IF
          DB     3,311Q,316Q,320Q  ;INP
          DB     3,304Q,311Q,315Q  ;DIM
          DB     3,'C'+200Q       ;CAL
          DB     'A'+200Q
          DB     'L'+200Q
          DB     4,'G'+200Q       ;GOSU
          DB     'O'+200Q
          DB     'S'+200Q
          DB     'U'+200Q
          DB     3,'R'+200Q       ;RET
          DB     'E'+200Q
          DB     'T'+200Q
          DB     3,'F' OR 200Q    ;FOR
          DB     'O' OR 200Q
          DB     'R' OR 200Q
          DB     4,'N' OR 200Q    ;NEXT
          DB     'E' OR 200Q
          DB     'X' OR 200Q
          DB     'T' OR 200Q
          DB     377Q
;DELIMITERS HAVE FOLLOWING VALUES:
;
;         <      0
;         >      1
;         ,      2
;         =      3
;         )      4
;         ;      5
;         THEN   6
;         TO     7
;         STEP   8
;         *      9
;         /      10
;         +      11
;         -      12
;
KDAT3:   DB     1,274Q,1,276Q    ;'<','>'
          DB     1,254Q,1,275Q    ;',','='
          DB     1,251Q           ;')'
          DB     1,';'+200Q       ;';'
          DB     4                ;THEN
          DB   200Q OR  'T'
          DB   200Q OR 'H'
          DB   200Q OR 'E'
          DB   200Q OR 'N'
          DB     2                ;TO
          DB   200Q OR 'T'
          DB   200Q OR 'O'
          DB     4                ;STEP
          DB   200Q OR 'S'
          DB   200Q OR 'T'
          DB   200Q OR 'E'
          DB   200Q OR 'P'
          DB     1,'*'+200Q       ;'*'
          DB     1,257Q,1,253Q    ;'/','+'
          DB     1,255Q           ;'-'
          DB     377Q
KDAT4:   DB     3,307Q,305Q,324Q  ;GET
          DB     3,320Q,325Q,324Q  ;PUT
          DB     377Q
;*****************************************************
; ROUTINE TO INPUT SOURCE LINE FROM TTY. PASSED ADD
; OF FIRST CHAR IN HL. RETURNS LENGTH OF LINE IN REG A
TTYIN:    PUSH   H
          MVI    B,0
TIN1:     CALL   CHAR2
          CPI    231Q             ;CNTRL Y?
          JZ     TIN5
          CPI    377Q             ;RUBOUT?
          JZ     TIN2
          CPI    337Q             ;BACK ARROW (RUBOUT)?
          JZ     TIN2+3
          CPI    212Q             ;LF?
          JZ     TIN1
          CPI    215Q             ;CR
          JZ     TIN4
          CPI    214Q             ;FORM FEED?
          JZ     TIN1             ;IGNORE
          MOV    M,A
          INX    H
          INR    B
          CALL   MEMFUL
          JMP    TIN1
TIN2:     MVI    A,337Q
          CALL   CONOUT           ;PRINT VIA ODT
          DCX    H
          DCR    B
          JP     TIN1
          POP    H
          XRA    A                ;ZERO A
          RET
TIN5:     MVI    A,334Q
          CALL   CONOUT           ;PRINT VIA ODT
TIN5A:    MVI    A,0
          POP    H
          RET
TIN4:     MVI    A,212Q
          CALL   CONOUT           ;PRINT VIA ODT
TIN4A:    MVI    C,0
          POP    H
          MOV    A,B
          CMP    C
          RZ
;ROUTINE TO REMOVE BLANKS FROM SOURCE UNLESS ENCLOSED IN EXCLAIM'S
          PUSH   D                ;SAVE REG'S
          PUSH   H
          PUSH   H
          MVI    E,'"'+200Q       ;INIT E FOR COMPARES
          MVI    D,0              ;D=1=>WITHIN QUOTES, LEAVE BLANKS
PK1:      XRA    A                ;CLEAR A
          CMP    D                ;CHECK INPUT MODE
          MOV    A,M              ;GET CHAR
          JNZ    QSTRG            ;WITHIN QUOTE STRING
          CMP    E                ;IS IT 1ST EXCLAIM?
          JNZ    $+7              ;NO - PROCEED
          INR    D                ;YES, SET FLAG
          JMP    QSTR1            ;CONTINUE
          CPI    240Q             ;IS IT A SPACE?
          JZ     PK2              ;YES - LEAVE OUT
QSTRG:    CMP    E                ;2ND "?
          JNZ    $+4              ;NO - CONTINUE
          DCR    D                ;RESET FLAG
QSTR1:    XTHL                    ;GET DESTINATION ADDRESS
          MOV    M,A              ;SAVE
          INX    H                ;BUMP PNTR.
          XTHL                    ;GET SOURCE ADD.
          INR    C                ;BUMP CHAR. CNT
PK2:      INX    H                ;BUMP PNTR.
          DCR    B                ;DCR INPUT LINE CHAR CNT
          JNZ    PK1              ;MORE - GO AGAIN
          MOV    A,C              ;CHAR CNT TO A
          POP    H                ;RESTORE REG'S, RETURN
          POP    H
          POP    D
          RET
; ROUTINES TO  PAD MESSAGES TO  OUTPUT BUFFER.
; FOR12 PADS 'UNDERFLOW'
; FOR11 PADS 'OVERFLOW'
; FOR10 PADS 'ZERODIVIDE'
; FORM9 PADS 'INPUT ERROR, TRY AGAIN'
; FORM8 PADS 'MEMORY FULL'
; FORM7 PADS 'WHAT?'
; FORM4 PADS 'IN LINE'
; FORM3 PADS 'ERROR'
; FORM2 PADS 'TURN ON PUNCH'
; FORM1 PADS 'READY'
; FORM5 PADS SOURCE LINE, PASSED ADDRESS OF
; LENGTH OF LINE IN HL REGS.
; FORM6 PADS CHAR STRING, PASSED ADD OF FIRST CHAR IN
; HL, LENGTH OF STRING IN REG C
FOR12:    INR    L
FOR11:    INR    L
FOR10:    INR    L
FORM9:    INR    L
FORM8:    INR    L
FORM7:    INR    L
FORM4:    INR    L
FORM3:    INR    L
FORM2:    INR    L
FORM1:    MOV    L,M
FORM5:    MOV    C,M
          MOV    A,C
          CPI    0
          RZ
F1:       INX    H
FORM6:    MOV    A,M
          MVI    B,1
          CALL   PAD
          DCR    C
          JNZ    F1
          RET
;*****************************************************
;THE CODE FROM HERE TO THE NEXT LINE OF *'S MUST BE ON ONE PAGE
ODATA:    DB     ODAT1 AND 377Q
          DB     ODAT2 AND 377Q
          DB     ODAT3 AND 377Q
          DB     ODAT4 AND 377Q
          DB     ODAT5 AND 377Q
          DB     ODAT6 AND 377Q
          DB     ODAT7 AND 377Q
          DB     ODAT8 AND 377Q
          DB     ODAT9 AND 377Q
          DB     ODA10 AND 377Q
ODAT1:    DB     5,'READY'
ODAT2:    DB     13,'TURN ON PUNCH'
ODAT3:    DB     8,215Q,212Q,'ERROR '
ODAT4:    DB     9,' IN LINE '
ODAT5:    DB     5,'WHAT?'
ODAT6:    DB     14,'MEMORY FULL',215Q,212Q,'?'
ODAT7:    DB     22,'INPUT ERROR, TRY AGAIN'
ODAT8:    DB     10,'INDEFINITE'
ODAT9:    DB     8,'OVERFLOW'
ODA10:    DB     9,'UNDERFLOW'
;*****************************************************
; ROUTINE TO INPUT SOURCE LINE FROM HSR. PASSED ADD
; OF FIRST CHAR IN HL. RETURNS LENGTH OF LINE IN REG A
HSRIN:    PUSH   H
          MVI    B,0
          JMP    PIN1A
PIN1:     CALL   CHAR5
PIN1A:    CPI    231Q             ;CNTRL Y?
          JZ     TIN5A
          CPI    377Q
          JZ     PIN3
          CPI    337Q
          JZ     PIN3
          CPI    212Q
          JZ     TIN4A
          CPI    215Q
          JZ     PIN1
          MOV    M,A
          INX    H
          INR    B
          CALL   MEMFUL
          JMP    PIN1
PIN3:     DCX    H
          DCR    B
          JP     PIN1
          POP    H
          XRA    A                ;ZERO A
          RET
; ROUTINE TO INPUT CHAR FROM HSR
CHAR5:    PUSH   B
          CALL   HSRDR
          POP    B
          RET
; ROUTINE TO INSURE SOURCE DOES NOT OVERFLOW MEM SPACE
; COMPARES CURENT MEM ADDRESS TO SP.
MEMFUL:   PUSH   B
          PUSH   D
          PUSH   H
          MVI    A,50
          ADD    L
          MOV    B,A
          MVI    A,0
          ADC    H
          MOV    C,A
          LXI    H,0
          DAD    SP
          MOV    D,L
          MOV    E,H
          CALL   DCOMP
          POP    H
          POP    D
          POP    B
          RNC
          LXI    H,ODATA
          CALL   FORM8
          CALL   WRIT
          CALL   CHAR2
          CALL   PAD
          CALL   WRIT
          SBI    260Q
          CPI    4
          CZ     WHAT
          LHLD   SPNT
          SPHL
          MVI    C,1
          JMP    M4A
; ROUTINE TO EVALUATE BOUNDS FOR LIST AND PLIST
; COMMANDS. RETURNS PLINE AS FIRST LINE, KLINE
; AS LAST LINE TO BE LISTED.
BOUND:    LHLD   NLINE
          MVI    A,9
          ADD    L
          MOV    L,A
          MVI    A,0
          ADC    H
          MOV    H,A
          PUSH   H
          CALL   NUMB
          CNC    WHAT
          CALL   CVB
          PUSH   PSW
          PUSH   B
          CALL   BND2
          POP    B
          DCX    H
          SHLD   PLINE
BND1:     POP    PSW
          POP    H
          INR    A
          ADD    L
          MOV    L,A
          MVI    A,0
          ADC    H
          MOV    H,A
          MVI    A,0
          CMP    C
          RZ
          DCR    C
          CALL   NUMB
          CNC    WHAT
          PUSH   D
          CALL   CVB
          PUSH   D
          PUSH   B
          CALL   BND2
          POP    B
          INX    H
          MOV    D,M
          INX    H
          MOV    E,M
          XCHG
          SHLD   KLINE
          POP    D
          POP    H
          MOV    A,C
          CPI    0
          JNZ    WHAT
          MOV    B,H
          MOV    C,L
          CALL   DCOMP
          RNC
          JMP    WHAT
BND2:     LHLD   STLINE
BND3:     MOV    B,M
          INX    H
          MOV    C,M
          CALL   DCOMP
          RC
          RZ
          PUSH   H
          INX    H
          MOV    A,M
          INX    H
          MOV    H,M
          MOV    L,A
          CALL   CHK1
          POP    B
          JNC    BND3
          PUSH   B
          POP    H
          RET
; ROUTINE TO OUTPUT ERROR MSG. TO USER.
; REG A CONTAINS BCD ERROR NUMBER, HL
; LOADED WITH VALUE OF KLINE.
ERROR:    LXI    H,M1A            ;RETURN ADDRESS
          PUSH   H                ;PUT ON STACK
          LXI    H,ODATA          ;OUTPUT BUFFER DATA TABLES
          PUSH   H
          MOV    D,A              ;SAVE ERROR NUMB. IN D
          CALL   FORM3            ;PAD 'ERROR '
          MVI    B,1              ;INIT FOR PADS
          MOV    C,B              ;INIT AS CNTR.
          MOV    A,D              ;GET ERROR NUMB.
          RLC                     ;ROTATE HIGH 4 BITS TO LOW 4
          RLC
          RLC
          RLC
ERRR1:    ANI    17Q              ;MASK
          ADI    260Q             ;CONVERT TO ASCII
          CALL   PAD              ;PAD IT
          MOV    A,D              ;GET ERROR NUMB.
          DCR    C                ;ANOTHER PASS?
          JP     ERRR1            ;YES
          POP    H                ;NO-CONTINUE
ERLN:     CALL   FORM4
          LHLD   KLINE
          INX    H
          INX    H
          INX    H
          INX    H
          MOV    C,M
          INX    H
          CALL   LENGTH
          MOV    C,A
          CALL   FORM6
          CALL   WRIT
          RET
;THIS ROUTINE INCREMENTS H AND L AND
;DECR. C(CHARS IN LINE) SHOULD C RESULT
;IN 0 THEN THE ERROR CORRES. TO ENTRY PNT.
;IS GIVEN
ICP7:     MVI    A,7
          JMP    INCPT
ICP8:     MVI    A,8
          JMP    INCPT
ICP4:     MVI    A,4
          JMP    INCPT
ICP2:     MVI    A,2
INCPT:    INX    H
          DCR    C
          RNZ
          JMP    ERROR
;FSYM FINDS SYMBOLS IN TABLE
;B,C CONTAIN SYMBOL
;RET WITH B,C,D,E SAME
;H AND L PNT TO VALUE (1ST BYTE)
;CY=1  =OUND
;CY=0  AND A SCALAR VAR. =NSERTED
;   AND SET TO 0
;CY=0  AND AN ARRAY  =O ACTION,
;    H AND L PNT TO LAST ENTRY IN SYMBOL TABLE
FSYM:     PUSH   D
          XRA    A
          ORA    B                ;SET CARRY IF NOT
          JZ     AR               ;AN ARRAY AND SAVE
          CMC
AR:       PUSH   PSW
          LHLD   NXTSP            ;GET NEXT AVAILABLE
          PUSH   B                ;SPACE PNTR.
          MOV    B,H
          MOV    C,L              ;CHECK TO SEE
          LHLD   STSPAC           ;IF SYMBOL TABLE
          MOV    D,H              ;EMPTY
          MOV    E,L
          CALL   DCOMP            ;DOUBLE BYTE COMPARE
          POP    B                ;GET VAR. BACK
          JZ     NOSYM
LUKON:    CALL   CHK1             ;CHECK FOR END
          JC     NOENT
          MOV    D,H              ;SAVE OLD PNTR
          MOV    E,L
          MOV    A,B
          CMP    M                ;DO VARIABLES MATCH
          JNZ    NOMAT
          INX    H
          MOV    A,C
          CMP    M
          JZ     ENTRY
          DCX    H
NOMAT:    INX    H                ;NO MATCH GET NEW PNT.
          INX    H
          MOV    A,M
          INX    H
          MOV    H,M
          MOV    L,A
          JMP    LUKON
;ARRIVE HERE IF SYMBOL TABLE IS EMPTY
NOSYM:    DCX    D                ; =STSPAC-2 SO STPNT WORKS RIGHT
          DCX    D
;ARRIVE HERE WHEN NO ENTRY FOUND
NOENT:    LHLD   NXTSP            ;ADD. OF FREE MEMORY
          XCHG                    ;TO DE, HL HAVE LAST SYM. TAB. ENTRY
          POP    PSW              ;ARRAY?
          JNC    FBAC             ;YES, RETURN
          CALL   CHKLC            ;CHECK FOR PAGE BOUNDARY CROSSING
          CALL   STPNT            ;UPDATE PNTR
          XCHG                    ;NXTSP TO HL
          MOV    M,B              ;STORE VAR.
          INX    H
          MOV    M,C
          INX    H
          PUSH   H
          INX    H                ;STORE NXTSP+8 IN NXTSP
          INX    H
          INX    H
          INX    H
          INX    H
          INX    H
          SHLD   NXTSP
          CALL   MEMFUL           ;MEMORY FULL?
          POP    H                ;SET FWD PNT. TO -1
          MVI    M,377Q
          INX    H
          MVI    M,377Q
          INX    H                ;INIT TO FLT. PNT. 0
          CALL   ZROL
          ORA    A                ;CLEAR CY
          JMP    FBAC             ;RESET CARRY AND RETURN
ENTRY:    POP    PSW              ;VAR FOUND
          INX    H                ;MOVE PNT. TO FIRST BYTE
          INX    H                ;OF FLT. PNT. NO.
          INX    H
          STC                     ;SET CY AND RET.
FBAC:     POP    D                ;RESTORE D
          RET
;
;
;RUN - THE INTERP.
;
;
;INIT. NXTSP
RUN:      LHLD   STSPAC
          XCHG
          CALL   CKDIM          ; ADJUST START OF SYMBOL TABLE SO
                                ; IT STARTS ON AN EVEN 4 WORD BOUNDARY
          CALL   CHKLC          ; ADJUST START OF SYMBOL TABLE SO IT
                                ; DOES NOT CROSS PAGE BOUNDARY
          XCHG
          SHLD    STSPAC
          SHLD   NXTSP
          LXI    H,BOTNS          ;INIT SP FOR NESTING STACK
          SHLD   NEST
          LXI    H,M1A            ;PRECAUTION, IN CASE RETURN IS
          PUSH   H                ;EXECUTED BEFORE A GOSUB
          PUSH   H
          LHLD   STLINE           ;START OF SOURCE
ILOOP:    CALL   QUITT            ;CHECK FOR INTERRUPTION
          CALL   CHK1             ;HL=-1 =O MORE SOURCE
          JNC    SORCE
          MVI    A,1
          JMP    ERROR            ;ERROR 1, NO END STMT.
SORCE:    SHLD   LPNT
          PUSH   H
          LXI    H,LPNT           ;DEFINE VALUES OF
          CALL   PTVAL            ;KBIN,KFPNT,KLEN
          LDA    KLEN             ;CHAR'S IN LINE TO C
          MOV    C,A
          INR    C
          POP    H                ;MOVE PNTR. TO 1ST CHAR
          INX    H                ;IN SOURCE REC.
          INX    H
          INX    H
          INX    H
L1:       CALL   ICP2             ;INCR. H,L DCR C
          CALL   ALPHA            ;FIND FIRST LETTER
          JNC    L1
          XRA    A
          INR    A                ;LETTER FOUND
          CALL   SYMSRT           ;DETERMINE KEYWORD
          CPI    377Q
          JNZ    GKEY
          MVI    A,2              ;BAD KEYWORD
          JMP    ERROR
GKEY:     SHLD   CPNT
          LXI    H,JTBL           ;LOAD JUMP TABLE PNTR.
          ADD    A                ;DOUBLE A
          MOV    E,A
          MVI    D,0
          DAD    D                ;PNT. TO PROPER PROC.
          MOV    A,M              ;ADD. IN JUMP TABLE
          INX    H                ;GET PROC. ADD.
          MOV    H,M
          MOV    L,A
          PCHL                    ;INDIRECT JUMP TO PROC.
JTBL:     DW     LET              ;JMP TABLE
          DW     PRI
          DW     IEND             ;REM STMT. - NO ACTION
          DW     M1A              ;STOP STMT.-RETURN TO EDIT MODE
          DW     ENDD
          DW     GOTO
          DW     IFRT
          DW     INPUT
          DW     DIM
          DW     CALLP
          DW     GOSUB
          DW     RETRN
          DW     FOR
          DW     NEXT
ENDD:     LHLD   KFPNT            ;CHECK TO SEE IF MORE
          CALL   CHK1             ;SOURCE AFTER END
          JC     M1A
          MVI    A,3              ;MORE SOURCE ERROR 3
          JMP    ERROR
GOTO:     LHLD   CPNT             ;GOTO STMT. PROC.
GSENT:    INX    H                ;INCREMENT PAST KEYWORD
          INX    H
          INX    H
          CALL   ICP4             ;POSSIBLE ERROR 4
GTRA:     CALL   CVB              ;GET DESTINATION
          ORA    A                ;MAKE SURE IT WAS OK
          JNZ    OKN
          MVI    A,4
          JMP    ERROR
OKN:      CALL   NSRCH            ;GET NEXT LPNT
          JNC    ILOOP            ;MAKE SURE IT EXISTED
          MVI    A,5
          JMP    ERROR            ;NON-EXISTENT
DIM:      LHLD   CPNT             ;DIM STMT. PROC.
          INX    H                ;PNT TO FIRST VAR.
          INX    H
          INX    H
DLOOP:    CALL   ALPHA            ;CHECK IF IT IS A VAR.
          JC     OKLET
ER6:      MVI    A,6              ;ERROR 6
          JMP    ERROR
OKLET:    MOV    B,M
          CALL   ICP7             ;INCR.CPNT
          MVI    A,250Q           ;CHECK FOR (
          CMP    M
          JNZ    ER6
          CALL   ICP7             ;INCR. CPNT
          CALL   CVB              ;CONV. TO BIN NO.
          ADD    L                ;UPDATE CPNT
          MOV    L,A              ;ED CONTAIN ARRAY LEN.
          MVI    A,0
          ADC    H                ;C CONT. NO. CHARS LEFT
          MOV    H,A              ;IN LINE
          MVI    A,251Q           ;CHECK FOR )
          CMP    M
          JNZ    ER6
          PUSH   H
          PUSH   B                ;SAVE B,C,H,L
          MOV    C,B              ;SET UP FOR CALL TO FSYM
          MVI    B,0
          CALL   FSYM
          JNC    NDOU
          POP    B
          POP    H
          MVI    A,11H            ;ERROR 11
          JMP    ERROR            ;DUPLICATE ARRAY DEF.
NDOU:     PUSH   D                ;SAVE DIM. LENGTH
          XCHG                    ;ADD. OF LAST SYM. TAB. ENTRY TO DE
          LHLD   NXTSP            ;GET ADD. OF AVAILABLE MEM.
          XCHG                    ;SET UP FOR CALL
          CALL   CKDIM            ; CHECK START OF 'DIM' ARRAY
          CALL   STPNT            ;STORE NEW PNTR
          XCHG                    ;NXTSP TO HL
          POP    D                ;RESTORE D
          MVI    M,0
          INX    H                ;INSERT VAR IN SYMB. TAB.
          MOV    M,C
          INX    H
          MVI    M,377Q           ;FPNT TO -1
          INX    H
          MVI    M,377Q
          INX    H                ;PNTS TO FIRST DATA
          MOV    A,D              ;GET ONE'S COMPLEMENT OF
          CMA                     ;NUMBER OF ELEMENTS
          MOV    C,A              ;IN ARRAY TO B,C
          MOV    A,E
          CMA
          MOV    B,A
CONT:     CALL   ZROL             ;ZEROE OUT ELEMTS.
          INX    H                ; OF ARRAY
          INX    H
          INX    H
          INX    H
          INX    B
          PUSH   H
          CALL   MEMFUL           ;MEMORY FULL?
          MOV    H,B
          MOV    L,C
          CALL   CHK1
          POP    H
          JNC    CONT
          SHLD   NXTSP            ;NEW VALUE OF NXTSP.
          POP    B                ;RESTORE REG'S
          POP    H
          INX    H
          DCR    C                ;MORE ELEMTS IN LINE?
          JZ     IEND
          DCR    C
          JZ     ER6
          MVI    A,254Q           ;NEXT ELEMENT A ,
          CMP    M
          INX    H
          JZ     DLOOP
          JMP    ER6
;ROUTINE TO COPY CONTENTS PNTED TO
;BY DE TO LOCATION H,L
COPDH:    PUSH   PSW              ;SAVE REGISTERS
          PUSH   B
          PUSH   D
          PUSH   H
          MVI    B,4              ;COUNT
COPD1:    LDAX   D                ;GET FROM SOURCE
          MOV    M,A              ;PUT TO DESTINATION
          INX    D                ;BUMP PNTRS, CNT
          INX    H
          DCR    B
          JNZ    COPD1
          POP    H                ;RESTORE REGISTERS
          POP    D
          POP    B
          POP    PSW
          RET
;OUTR PADS OUTPUT FROM CONV INTO
;OUTPUT BUFFER USING ROUTINE PAD
;ALL REG'S MAINTAINED
OUTR:     PUSH   B                ;SAVE REG B
          MVI    B,1              ;PAD ONCE
          CALL   PAD              ;DO IT
          POP    B                ;RESTORE B AND RET.
          RET
;VALUE RETURNS IN D(H),E(L) PNTR.
;TO THE VALUE OF A TOKEN
;C,H,L ARE UPDATED
;A,B ARE DESTROYED
VALUE:    CALL   VAR              ;IS IT A VARIABLE?
          RC                      ;YES - ALL DONE
          MVI    A,3              ;NO CHEK IF A FUNC.
          CALL   SYMSRT
          CPI    377Q
          JZ     KONT             ;NOT A FUNCTION -
          CPI    1                ;WAS IT PUT(--)?
          JNZ    GET              ;NO - OK
          JMP    ER10             ;ILLEGAL USE OF FUNCTION
GET:      INX    H                ;OK, IT'S GET(--)
          INX    H                ;UPDATE H,L
          INX    H
          MOV    A,C              ;CHECK FOR PREMATURE EOL
          ORA    A
          JZ     ER8
          MVI    A,250Q           ;CHEK FOR (
          CMP    M
          JNZ    ER8
          CALL   ICP8             ;BUMP PNTR'S
          CALL   EVAL             ;GET PORT =
          PUSH   H                ;SAVE REG H,L
          LXI    H,FREG1
          CALL   COPDH            ;COPY IT
          XCHG
          POP    H                ;RESTORE H,L
          CALL   FIX              ;FIX IT
          INX    D
          INX    D                ;GET LOWEST BYTE TO
          INX    D                ;REG D
          LDAX   D
          MOV    D,A
          MOV    A,C              ;EOL?
          ORA    A
          JZ     ER8
          MVI    A,251Q           ;CHECK FOR )
          CMP    M
          JNZ    ER8
          INX    H                ;BUMP PNTR'S
          DCR    C
          PUSH   H                ;SAVE H,L,B,C
          PUSH   B                ;STORE PROGRAM SEGMENT
          LXI    B,GREG           ;IN RAM,START AT GREG
          LXI    H,RINST          ;ADD. OF INST'S
          MVI    E,5              ;NUMB. OF BYTES
V1:       MOV    A,M              ;GET BYTE
          STAX   B                ;STORE IN RAM
          INX    H
          INX    B
          DCR    E                ;BUMP PNTR'S,DCR CNT
          JNZ    V1
          LXI    H,GREG+1         ;STORE PORT =
          MOV    M,D              ;IN RAM
          JMP    GREG             ;OK - TRANSFER
HOME:     LXI    H,GREG+2         ;SET UP FOR FLOAT
          MOV    M,A              ;STORE AWAY INPUT
          DCX    H
          XRA    A                ;ZERO OUT HIGHER BYTES
          MOV    M,A              ;BUT CHAR. DOESN'T MATTER
          DCX    H
          MOV    M,A
          CALL   DFXL             ;FLOAT IT
          LXI    D,GREG           ;FIX D,E RESTORE C,H,L
          POP    B
          POP    H
          RET
RINST:    IN     0                ;RAM INSTRUCTIONS
          JMP    HOME
KONT:     CALL   NUMB             ;NUMBER
          JC     OKK
          MVI    A,256Q           ;DEC. PNT.?
          CMP    M
          JNZ    ER8
OKK:      MVI    A,1              ;MODE=1, IE. INPUT FROM SOURCE
          CALL   RDKON            ;READ CONSTANT TO GREG
          JC     ER9              ;IF ERROR THEN CY=1
          LXI    D,GREG           ;PNTS. TO CONSTANT
          RET
;THIS ROUTINE READS A CONSTANT INTO GREG FROM ASCII
;CHARACTERS POINTED TO BY HL AND C
;ENTER WITH A=0 => DATA FROM TTY
;ENTER WITH A=1 => DATA FROM SOURCE
;RETURN WITH CY=1 => ERROR IN CONVERSION
RDKON:    STA    MODE             ;SAVE MODE FOR ROUT. INP
          SHLD   HLINP            ;SAVE HL FOR ROUT. INP
          MOV    A,C
          STA    CREG             ;SAVE C FOR ROUT. INP
          LXI    H,GREG           ;WHER VALUE WILL GO
          MVI    C,SCR AND 377Q   ;SET UP AND CALL FINPT
          CALL   FINPT
          LHLD   HLINP            ;RETORE H,L AND C
          LDA    CREG
          MOV    C,A
          RET                     ;DONE
ER9:      MVI    A,9
          JMP    ERROR
;VAR DECIDES WHETHER A TOKEN IS
;A VARIABLE IF SO CY=1 AND
;ADDRESS IS COMPUTED,(SUBSCRIPT IS
;EVALUATED ETC.), RETURNS WITH DE PNTING
;TO VAR. REFERENCED H,L,C,UPDATED
;A,B DESTROYED
;IF NOT A VARIBLE CY=0
;H,L,C ARE LEFT UNTOUCHED
VAR:      CALL   ALPHA            ;1ST CHAR A LETTER?
          RNC                     ;NO-NOT VAR.
          INX    H                ;BUMP PNTR'S
          DCR    C
          JNZ    MORE             ;MORE TO LINE
SC1:      PUSH   B                ;SAVE B,EOL
          MVI    C,0              ;SET FOR CALL TO FSYM
          DCX    H                ;GET SINGLE LETTER
          MOV    B,M              ;VAR TO B
          INX    H
          JMP    SCALR
MORE:     CALL   ALPHA            ;2ND A LETTER?
          JNC    SFSG             ;SO FAR SO GOOD
          PUSH   B                ;SAVE C
          MVI    A,2              ;CHECK FOR DELIMITER
          CALL   SYMSRT
          POP    B                ;RESTORE C
          INR    A                ;FOUND?
          JNZ    SC1              ;YES
BUPT:     INR    C                ;NOT A VAR.
          DCX    H                ;BACK UP PNTR'S
          ORA    A                ;CY=0 AND RET
          RET
SFSG:     CALL   NUMB             ;TEST FOR NUMBER
          JNC    ARCK             ;MAYBE AN ARRAY
          INX    H                ;ITS A SCALAR
          DCR    C                ;BUMP PNTR'S
          JZ     SLOAD            ;EOL
          PUSH   B                ;SAVE C
          MVI    A,2              ;SET UP FOR SYMSRT
          CALL   SYMSRT           ;TEST FOR LEGAL
          POP    B                ;GET C BACK
          INR    A                ;DELIMITER FOUND?
          JZ     ER8              ;NO, ERROR
SLOAD:    DCX    H                ;MOVE BACK,
          PUSH   B                ;SAVE C,
          MOV    C,M              ;GET VAR. INTO
          DCX    H                ;B,C FOR FSYM
          MOV    B,M
          INX    H
          INX    H
SCALR:    XCHG                    ;SAVE H,L IN D,E
          CALL   FSYM             ;GET PNTR TO VALUE
          XCHG                    ;RESTORE H,L PNTR TO DE
          POP    B                ;GET C REG BACK
          STC                     ;SET CY,RET
          RET
ARCK:     MOV    A,M              ;ARRAY CHEK, GET CHARACTER
          CPI    250Q             ;IS IT (?
          JZ     ARYES            ;YES,ITS AN ARRAY
          MVI    A,2              ;NO-CHEK FOR LEGAL DELIM.
          PUSH   B                ;SAVE C
          CALL   SYMSRT
          POP    B                ;RESTORE C
          INR    A                ;DELIMITER FOUND?
          JZ     ER8
          JMP    SC1              ;1 CHAR. SCALAR VAR.
ARYES:    DCX    H                ;YES-WE HAVE ARRAY
          MOV    A,M              ;GET VAR.
          INX    H
          PUSH   PSW              ;SAVE VAR.
          CALL   ICP8             ;BUMP PNTR'S
          CALL   EVAL             ;EVALUATE SUBSCRIPT
          PUSH   H                ;SAVE REG H,L
          LXI    H,FREG1
          CALL   COPDH            ;COPY IT
          XCHG
          POP    H                ;RESTORE H,L
          CALL   FIX              ;FIX VALUE
          MVI    A,251Q           ;CHECK FOR )
          CMP    M
          JNZ    ER8
          INX    H
          DCR    C                ;BUMP PNTR'S
          INX    D                ;PNT TO LOWER 2 BYTES
          INX    D
          LDAX   D
          MOV    B,A              ;H-BYTE TO B
          INX    D                ;PNT TO LOW BYTE
          LDAX   D                ;LOW BYTE TO A
          ORA    A                ;KILL CY
          RAL                     ;START MULT OF OFFSET
          MOV    E,A              ;BY 4(BYTES/FLTPT =)
          MOV    A,B              ;GET H BYTE
          RAL
          MOV    D,A              ;DE IS OFFSET*2
          MOV    A,E              ;GET LOW
          ORA    A                ;KILL CARRY
          RAL
          MOV    E,A
          MOV    A,D
          RAL
          MOV    D,A
          POP    PSW              ;DE CONTAIN OFFSET*4
          PUSH   B                ;GET VAR., SAVE C
          MOV    C,A
          MVI    B,0              ;SETUP TO CALL FSYM
          PUSH   H                ;SAVE H,L
          CALL   FSYM             ;GET START ADD.
          JC     AFOND
          MVI    A,12H            ;ERROR 12
          JMP    ERROR            ;ARRAY REF. NOT DIM'ED.
AFOND:    DAD    D                ;H,L NOW PNT TO START OF
          XCHG                    ;ARRAY, ADD OFFSET, EXCHG
          POP    H                ;RESTORE PNTR'S AND RET.
          POP    B
          STC                     ;SET CY
          RET
;ROUTINE TO FIX FLOATING POINT
;NUMBERS, ALL REG'S BUT A ARE
;MAINTAINED. DE PNT TO 4 BYTES
;OF = TO BE FIXED
FIX:      PUSH   B
          PUSH   H
          PUSH   D                ;SAVE REG'S
          INX    D
          INX    D
          INX    D                ;PNT TO 4TH BYTE
          LDAX   D
          PUSH   PSW              ;SAVE CHAR. (FOR SIGN)
          ANI    177Q
          RAL                     ;CHEK IF EXP SIGN IS -
          RAL
          JC     MINSE
          RAR
          RAR                     ;RESTORE CHAR
          CPI    30Q              ;IS IT TOO BIG?
          JC     GOOD
          MVI    A,13H            ;ERROR 13
          JMP    ERROR            ;FIX = TOO BIG
MINSE:    RAR
          RAR
GOOD:     STAX   D                ;ABSOLUTE VALUE
          DCX    D
          DCX    D
          DCX    D                ;MOV PNTR BACK
          LXI    H,FREG1
          CALL   COPDH            ;COPY TO FREG1
          LXI    H,FREG2          ;STORE .5*2**24 IN
          LXI    D,FDAT           ;FREG2
          CALL   COPDH            ;COPY IT
          LXI    H,FREG1          ;SET UP TO CALL LADD
          MVI    B,FREG2 AND 377Q
          MVI    C,SCR AND 377Q
          CALL   LADD             ;ADD THEM,RESULT IN FREG1
          LXI    H,FREG1
          POP    PSW              ;GET SIGN AND ADD.
          POP    D
          RAL
          MVI    A,0              ;GET SIGN ONLY
          RAR
          MOV    B,M              ;GET BYTE1
          STAX   D                ;STORE BYTE 1 OF FIX
          MOV    A,B
          ANI    177Q             ;CLEAR HIGH BIT (FROM ADD)
          INX    D
          INX    H
          MOV    B,M              ;GET BYTE 2
          STAX   D                ;STORE BYTE 2 OF FIX
          INX    D
          MOV    A,B
          INX    H
          MOV    B,M              ;GET BYTE 3
          STAX   D                ;STORE BYTE 3 OF FIX
          MOV    A,B
          INX    D
          STAX   D                ;STORE BYTE 4 OF FIX
          DCX    D                ;FIX D PNTR
          DCX    D
          DCX    D
          POP    H
          POP    B
          RET
FDAT:     DB     200Q,0,0,30Q
;INP SAVES ALL REG'S
;SERVES AS BUFFER BETWEEN FINPT AND
;DATA INPUT. IF MODE=0, DATA COMES FROM TTY
;IF MODE=1 DATA COMES FROM SOURCE STMTS.
;IN ALL CASES HL,C ARE UPDATED FROM HLINP, AND
;CREG AND RETURNED TO THOSE LOCATIONS
INP:      PUSH   H                ;SAVE ALL REG'S
          PUSH   D
          PUSH   B
          LHLD   HLINP            ;GET PNTR'S
          LDA    CREG
          MOV    C,A
          ORA    A                ;CHECK FOR EOL
          JNZ    CHKMD            ;NO CHECK MODE
SPACE:    MVI    A,240Q           ;SEND A SPACE
IDONE:    POP    B                ;RESTORE REG'S
          POP    D
          POP    H
          RET                     ;AND RETURN
CHKMD:    LDA    MODE             ;GET MODE
          DCR    A                ;CHECK IT
          JZ     MODE1            ;MODE IS 1
          MOV    A,M              ;MODE 0, GET CHAR.
          CPI    ',' OR 200Q      ;IS IT A ','?
          JZ     SPACE            ;YES - SEND A SPACE
          JMP    BMPTR            ;NO - SEND IT
MODE1:    CALL   NUMB             ;NUMBER? (ALSO LOADS IT TO A)
          JC     BMPTR            ;YES - SEND IT AND BUMP PNTR'S
          CPI    256Q             ;DEC. PNT.?
          JZ     BMPTR
          CPI    305Q             ;E?
          JZ     BMPTR
          CPI    253Q             ;+?
          JZ     CHEKE
          CPI    255Q             ;-?
          JNZ    SPACE            ;SEND A SPACE
CHEKE:    MOV    B,A              ;CHEK IF E PRECEDES +,-
          DCX    H                ;BACK UP AND GET PRE-
          MOV    A,M              ;CEDING CHARACTER
          CPI    305Q             ;IS IT E?
          JNZ    SPACE            ;NO,+OR- WAS DELIMITTER
          MOV    A,B              ;YES,GET + OR -
          INX    H                ;RESTORE H,L
BMPTR:    INX    H                ;BUMP AND STORE PNTR'S
          DCR    C
          SHLD   HLINP
          LXI    H,CREG
          MOV    M,C
          JMP    IDONE            ;RESTORE REG'S AND RETURN
;THIS ROUTINE WILL EVALUATE UNARY AND/OR
;BINARY EXPRESIONS CALLED WITH H AND L
;POINTING TO FIRST CHAR. OF EXP.,C CONTAINS
;NUMBER OF CHAR'S LEFT IN LINE. RETURNS
;D(H) AND E(L) POINTING TO THE ANSWER
;THIS ROUTINE CALLS ITSELF RECURSIVELY
;IN ORDER TO EVALUATE SUBSCRIPT
;EXPRESIONS.  REG A,B DESTROYED
;C,H,L ARE UPDATED
EVAL:     MVI    A,255Q           ;IS IT UNARY -
          CMP    M                ;Z=1 => YES
          PUSH   PSW              ;Z=0 => NO
          JNZ    ECAV
          CALL   ICP8             ;BUMP POINTER
ECAV:     CALL   VALUE            ;GET PNTR. TO VALUE
          PUSH   H                ;GET VALUE TO FREG1
          LXI    H,FREG1
          CALL   COPDH
          XCHG
          POP    H
          POP    PSW              ;GET SIGN
          JNZ    DOL              ;SHALL WE NEGATE?
          INX    D                ;YES, POINT TO CHAR.
          INX    D
          INX    D
          LDAX   D                ;AND LOAD TO A
          RAL                     ;ROTATE SIGN TO CY
          CMC                     ;COMPLEMENT IT
          RAR                     ;ROTATE BACK
          STAX   D                ;STORE AWAY
          DCX    D                ;AND FIX PNTR.
          DCX    D
          DCX    D
DOL:      MOV    A,C              ;IS THIS END OF LINE?
          ORA    A
          RZ                      ;YES-RETURN
          PUSH   B                ;SAVE C
          MVI    A,2              ;NO SET UP TO CALL
          CALL   SYMSRT           ;SYMSRT AND CALL
          POP    B                ;RESTORE C
          INR    A                ;DELIMITER FOUND?
          JZ     ER8              ;NO, ERROR
EOK:      SUI    10               ;CHECK FOR EXPRESSION
          RC                      ;DELIMITER
          PUSH   PSW              ;SAVE OVERATION
          CALL   ICP8             ;BUMP PNTR'S
          ORA    A                ;CLEAR CY
AGA:      PUSH   H                ;GET BYTES OF NUMBER
          LDAX   D                ;AND PLACE ON STACK
          MOV    L,A
          INX    D
          LDAX   D
          INX    D
          MOV    H,A              ;2 BYTES TO H,L
          XTHL                    ;XCHANGE, RESTORES H,L
          CMC
          JC     AGA              ;ANOTHER PASS?
          CALL   VALUE            ;GET 2ND VALUE
          MOV    A,C              ;CHECK FOR END OF LINE
          ORA    A                ;IF SO => WELL FORMED
          JZ     WFOR
          PUSH   B                ;SAVE C
          MVI    A,2              ;ELSE CALL SYMSRT TO
          CALL   SYMSRT           ;CHEK FOR EXP. DEL.
          POP    B                ;RECOVER IT
          CPI    10
          JC     WFOR             ;YES, WELL FORMED
ER8:      MVI    A,8              ;ILL-FORMED EXP.
          JMP    ERROR
WFOR:     PUSH   B                ;SAVE C, AND H,L
          PUSH   H
          LXI    H,FREG2          ;COPY 2ND VALUE TO
          CALL   COPDH            ;FREG2
          POP    D                ;GET BYTES FROM STACK
          POP    B
          POP    H                ;INTO FREG1+2
          SHLD   FREG1+2
          POP    H                ;AND NEXT 2 BYTES
          SHLD   FREG1            ;FROM STACK TO FREG1
          XCHG
          POP    PSW              ;GET OPERATION
;THIS ROUTINE PERFORMS BINARY OPERATIONS ON OPERANDS IN FREG1 AND FREG2
;B,C,H,L ARE LEFT UNDISTURBED. A IS DESTROYED
;D,E PNT TO RESULT
;OPERATIONS ARE SPECIFIED BY A REGISTER AS FOLLOWS:
;
;         A=0    =>               FREG1 * FREG2
;         A=1    =>               FREG1 / FREG2
;         A=2    =>               FREG1 + FREG2
;         A=3    =>               FREG1 - FREG2
;
;IN CASE OF ARITHMETIC ERROR A MESSAGE IS SENT TO USER.
;IF A CONTAINS ILLEGAL OPERATION REQUEST ERROR IS SENT TO USER
;(ERROR 8) AND THE INTERPRETER IS ABORTED.
BINOP:    PUSH   B                ;SAVE REG'S
          PUSH   H
          LXI    H,FREG1          ;SET UP PNTR'S TO
          MVI    B,FREG2 AND 377Q ;FREG'S AND SCR AREA
          MVI    C,SCR AND 377Q   ;AND DO OPERATION
          DCR    A
          JM     FMULT            ;0,1=>* OR /
          JZ     DIV              ;2,3=>+ OR -
          DCR    A
          JZ     ADDD
          DCR    A
          JZ     SUBB
          JMP    ER8              ;ILLEGAL OPER.
ADDD:     CALL   LADD             ;DO ADDITION
ASBC:     MOV    D,H              ;FIX PNTR'S FOR RET.
          MOV    E,L
FPERR:    ORA    A                ;SET FLAGS
          JZ     NFPER            ;NO ERROR
          PUSH   D                ;SAVE DE
          PUSH   PSW              ;SAVE A
          CALL   WRIT             ;DUMP BUFFER
          POP    PSW              ;GET A BACK
          LXI    H,WFPER          ;RETURN ADDRESS
          PUSH   H                ;SAVE ON STACK
          LXI    H,ODATA          ;MESSAGE TABLE
          RAL                     ;UNDERFLOW?
          JC     FOR12            ;YES
          RAL                     ;OVERFLOW?
          JC     FOR11            ;YES
          JMP    FOR10            ;NO - ITS ZERODIVIDE
WFPER:    LXI    H,ODATA          ;MESSAGE TABLE
          CALL   ERLN             ;PRINT 'IN LINE --' (USE PART OF ERROR
          POP    D                ;RESTORE REG'S
NFPER:    POP    H
          POP    B
          RET
SUBB:     CALL   LSUB             ;DO SUBTRACTION
          JMP    ASBC
FMULT:    CALL   LMUL             ;DO MULT.
          JMP    MDBC
DIV:      CALL   LDIV             ;DO DIV.
MDBC:     MOV    D,H              ;AND FIX PNTR'S FOR RET.
          MOV    E,C
          JMP    FPERR            ;CHECK FOR ERROR
;PRINT PROCESSOR
PRI:      LHLD   CPNT
          INX    H                ;INCR. PAST KEYWORD
          INX    H
          INX    H
          CALL   ICP7
          INX    H                ;BUMP PNTRS
          DCR    C
          MVI    B,0              ;SET CHAR CNT
          JNZ    PLOOP            ;CONTINUE IF MORE
          INR    B                ;NOTHING MORE, PAD A NULL
          MVI    A,0
          CALL   PAD
          JMP    PEND             ;WRITE IT AND CONTINUE
PLOOP:    MOV    A,M              ;GET CHARACTER
          CPI    '"'+200Q         ;IS IT "?
          JNZ    EXPRE            ;NO
QUOTE:    CALL   ICP7             ;GET CHARACTER TO A
          MOV    A,M
          CPI    '"'+200Q         ;IS IT "?
          JZ     QCHEK
QOTOK:    INR    B                ;INCREMENT CNT
          MOV    D,B              ;SAVE IN D
          MVI    B,1              ;PAD ONCE
          CALL   PAD
          MOV    B,D              ;RESTORE CNT
          JMP    QUOTE            ;AGAIN
QCHEK:    INX    H                ;BUMP PNTRS
          DCR    C
          JZ     PEND             ;EOL
          MOV    A,M
          CPI    '"'+200Q         ;ANOTHER "?
          JZ     QOTOK
          JMP    SCOLN
EXPRE:    CALL   ALPHA            ;IS IT A LETTER
          JC     PRTIT            ;YES, EVALUATE AND PRINT
          CALL   NUMB             ;IS IT A NUMB?
          JC     PRTIT            ;YES, EVALUATE AND PRINT
          MOV    A,M
          CPI    '.'+200Q         ;IS IT A DECIMAL PNT?
          JZ     PRTIT            ;YES EVALUATE, PRINT
          CPI    '-'+200Q         ;IS IT A -?
          JNZ    SCOLN            ;NO, CHECK FOR ;
PRTIT:    PUSH   B                ;SAVE CNT
          CALL   EVAL             ;EVALUATE EXPRESION
          PUSH   B                ;SAVE C,H,L
          PUSH   H
          XCHG                    ;DE TO HL
          MVI    C,SCR AND 377Q   ;SET UP, CONVERT
          CALL   CONV
          POP    H                ;RESTORE REG'S
          POP    B
          MOV    A,C
          POP    B
          MOV    C,A
          ORA    A                ;CHECK EOL
          JZ     PEND
          MVI    A,11             ;UPDATE CNTR
          ADD    B
          MOV    B,A
          MOV    A,M              ;GET CHAR.
SCOLN:    CPI    ';'+200Q         ;IS IT ;?
          JZ     SONWD            ;YES
          CPI    ','+200Q         ;IS IT ,?
          JNZ    ER6              ;NO-UNEXPECTED CHAR.
          XRA    A                ;ZERO A
ADFLD:    ADI    13               ;ADD FIELD LENGTH
          CMP    B                ;COMPARE TO CNT
          JZ     $+6
          JNC    FLDFD
          CPI    52               ;LAST FLD?
          JNZ    ADFLD
          CALL   WRIT             ;YES-WRITE LINE
          MVI    B,0              ;RESET CNT
ONWD:     INX    H                ;BUMP PNTRS
          DCR    C
          JZ     PEND
          JMP    PLOOP
FLDFD:    SUB    B                ;FOUND FIELD
          MOV    D,B              ;DETERMIN   OF SPACES TO PAD
          MOV    E,A              ;SET UP TO CALL PAD
          MOV    B,A
          MVI    A,240Q
          CALL   PAD              ;PAD SPACES
          MOV    A,D
          ADD    E                ;NEW CNT
          MOV    B,A              ;SAVE IN B
SONWD:    INX    H                ;CHECK EOL
          DCR    C
          JNZ    PLOOP
          MVI    D,1              ;SUPPRESS CR/LF
          CALL   WRIT1
          JMP    $+6
PEND:     CALL   WRIT             ;DUMP BUFFER, CONTINUE
          JMP    IEND
;INPUT PROCESSOR - READS VALUES FROM TTY
;THEY MUST BE DELIMITED BY COMMAS ONLY
INPUT:    MOV    A,C              ;IN CASE OF ERROR
          STA    PL6              ;SAVE
INPER:    LHLD   CPNT             ;INPUT LINE (V-STRING) PNTR
          INX    H                ;ADJUST PNTR'S
          INX    H
          INX    H
          CALL   ICP7
          CALL   ICP7
PRMPT:    PUSH   B                ;SAVE PNTR'S
          PUSH   H
          MVI    B,1              ;SEND PROMPT
          MVI    A,':'
          MOV    D,B              ;TO SUPPRESS CR/LF
          CALL   PAD              ;PAD IT
          CALL   WRIT1            ;WRITE IT
          LXI    H,IBUF           ;ADD. OF INPUT BUFFER
          CALL   TTYIN            ;READ A LINE
          XCHG                    ;ADD. OF K-STRING TO DE
          POP    H                ;ADD. OF V-STRING
          POP    B                ;V-STRING CNT TO C
          MOV    B,A              ;K-STRING CNT TO B
          CALL   STRIN            ;TRANSFER CONSTANTS TO VARIBLES
          JZ     INPOK            ;NO ERROR
          LXI    H,ODATA          ;SEND ERROR MESSAGE
          CALL   FORM9
          CALL   WRIT
          LDA    PL6              ;GET V-STRING CNT
          MOV    C,A
          JMP    INPER            ;START AGAIN
INPOK:    JC     PRMPT            ;NEED MORE CONSTANTS
IEND:     LHLD   KFPNT            ;ALL OK - GET NEW PNTR.
          JMP    ILOOP            ;CONTINUE
;THIS ROUTINE TRANSFERS THE FLOATING POINT VALUES
;OF AN ASCII STRING OF CONSTANTS TO THE LOCATIONS
;SPECIFIED BY AN ASCII STRING OF VARIBLES
;POINTER AND LINE CNT OF VAR. STRING ARE IN HL,C
;POINTER AND LINE CNT OF CONST. STRING ARE IN DE,B
;ON RETURN:
;          Z=0 AND CY=0   ALL OK
;          Z=0 AND CY=1   NEED MORE CONSTANTS
;          Z=1            ERROR IN CONVERSION
;ALL POINTERS AND LINE CNT'S ARE RETURNED UPDATED
STRIN:    MOV    A,C              ;GET V-STRING CNT
          ORA    A                ;TEST FOR EOL
          RZ                      ;DONE, CY=0 => ALL OK
          MOV    A,M              ;GET CHAR.
          CPI    ',' OR 200Q      ;IS IT A ,?
          JNZ    STOKV            ;IT'S NOT A ,
          INX    H                ;COMMA, BUMP PNTR'S
          DCR    C
          JZ     ERRET            ;POSSIBLE ERROR (IF EOL)
STOKV:    MOV    A,B              ;GET K-STRING LENGTH
          ORA    A                ;TEST FOR EOL
          STC                     ;IN CASE IT'S EOL
          RZ                      ;RET, CY=1 =EED MORE CONSTANTS
          LDAX   D                ;GET CHAR
          CPI    ',' OR 200Q      ;TEST FOR ,
          JNZ    STOKK            ;NOT A , - READY TO GO
          INX    D                ;BUMP PNTR'S
          DCR    B
          JZ     ERRET            ;POSSIBLE ERROR (IF EOL)
STOKK:    PUSH   B                ;SAVE K-STRING CNT
          PUSH   D                ;SAVE K-STRING PNTR
          CALL   VAR              ;ADD. TO VARIBLE TO DE
          XCHG                    ;VAR. ADD TO H,L
          SHLD   VARAD            ;SAVE
          POP    H                ;ADDRESS OF K-STRING
          MOV    A,C              ;V-STRING CNT TO A
          POP    B                ;K-STRING CNT TO B
          MOV    C,B              ;K-STRING CNT TO C
          PUSH   PSW              ;SAVE V-STRING CNT
          PUSH   D                ;SAVE V-STRING ADD.
          MVI    A,0              ;A=0 =ATA FROM TTY
          CALL   RDKON            ;GET CONSTANT TO GREG
          JNC    STNER
          POP    H                ;EMPTY STACK
          POP    H
ERRET:    XRA    A                ;ERROR
          INR    A
          RET
STNER:    PUSH   H                ;SAVE K-STRING PNTR.
          LHLD   VARAD            ;GET VAR. ADD
          LXI    D,GREG           ;ADD. TO CONST.
          CALL   COPDH            ;COPY IT TO VARIABLE LOC.
          POP    D                ;K-STING PNTR. TO DE
          MOV    B,C              ;K-STRING LENGTH TO B
          POP    H                ;V-STRING PNTR. TO HL
          POP    PSW              ;V-STRING LENGTH TO C
          MOV    C,A
          JMP    STRIN            ;LOOP
;LET STMT. PROCESSOR
LET:      LHLD   CPNT             ;GET PNTR.
          INX    H                ;FIX PNTR.
          INX    H
          INX    H
          MOV    A,C              ;CHECK FOR EOL
          ORA    A
          JNZ    LOK
ER7:      MVI    A,7
          JMP    ERROR
LOK:      CALL   VAR              ;GET ADDRESS TO VAR.
          JC     SAVV             ;IT'S A VARIABLE
          MVI    A,3              ;NO-CHEK FOR FUNC.
          CALL   SYMSRT
          CPI    377Q
          JZ     ER8              ;DON'T KNOW WHAT IT IS
          DCR    A
          JNZ    ER10             ;ILLEGAL USE OF FUNC.
          INX    H                ;IT'S PUT,UPDATE H,L
          INX    H
          INX    H
          MOV    A,C              ;EOL CHK
          ORA    A
          JZ     ER8
          MOV    A,M              ;CHEK FOR (
          CPI    250Q
          JNZ    ER8
          CALL   ICP8             ;BUMP PNTRS
          CALL   EVAL             ;EVALUATE AND FIX
          PUSH   H                ;SAVE H,L
          LXI    H,FREG1
          CALL   COPDH            ;COPY IT
          XCHG
          POP    H
          CALL   FIX
          INX    D
          INX    D
          INX    D
          LDAX   D                ;GET LOWEST BYTE
          PUSH   PSW              ;PORT = IS SAVED
          MOV    A,M
          CPI    251Q             ;CHECK FOR )
          JNZ    ER8
          CALL   ICP8             ;BUMP PNTR'S
          MVI    D,377Q
          MOV    E,D
SAVV:     PUSH   D                ;KEEP ADDRESS
          MOV    A,M              ;CHEK FOR =
          CPI    275Q
          JNZ    ER8
          CALL   ICP8             ;BUMP PNTRS
          CALL   EVAL             ;EVALUATE EXPRESSION
          POP    H                ;GET ADDRESS
          CALL   CHK1
          JC     PTFIN            ;IT WAS A PUT
          CALL   COPDH            ;COPY TO ADDRESS
          JMP    IEND             ;CONTINUE
PTFIN:    LXI    H,FREG1          ;COPY VALUE TO FREG1
          CALL   COPDH
          XCHG
          CALL   FIX              ;FIX THE VALUE
          INX    D
          INX    D
          INX    D
          LDAX   D
          MOV    C,A              ;SAVE IN C
          LXI    H,PINST          ;ADD OF BYTES TO GO TO
          LXI    D,GREG           ;RAM AT GREG
          MVI    B,5              ;BYTE CNT
PRI1:     MOV    A,M              ;STORE PROG. SEG. IN
          STAX   D                ;RAM
          INX    H
          INX    D
          DCR    B
          JNZ    PRI1
          POP    PSW              ;GET PORT =
          LXI    H,GREG+1
          MOV    M,A              ;STORE
          MOV    A,C              ;GET DATA OUT TO A
          DCX    H                ;TRANSFER
          PCHL
PINST:    OUT    0                ;RAM INSTRUCTIONS
          JMP    IEND
ER10:     MVI    A,10H
          JMP    ERROR
;IF STMT. PROCESSOR
IFRT:     LHLD   CPNT             ;GET PNTR., ADJUST
          INX    H
          INR    C                ;CHECK EOL
          CALL   ICP7
          CALL   EVAL             ;EVALUATE EXPRESSION
          MOV    A,C
          ORA    A                ;CHECK EOL
          JZ     ER7
IAGA:     PUSH   H                ;SAVE H,L, PUT VALUE ON STK
          LDAX   D
          INX    D
          MOV    L,A
          LDAX   D
          INX    D
          MOV    H,A
          XTHL                    ;RESTORE H,L
          CMC
          JC     IAGA             ;ANOTHER PASS?
          MVI    A,2
          CALL   SYMSRT           ;CHEK TYPE OF RELATION
          CPI    4                ;WAS IT LEGAL?
          JC     II1
ER14:     MVI    A,14H
          JMP    ERROR
II1:      CPI    2                ;WAS IT A ,?
          JZ     ER14
          INR    A                ;ALL OK, INC,SAVE
          PUSH   PSW
          INR    C
          CALL   ICP7             ;BUMP PNTRS
          MVI    A,2              ;CALL SYMSRT
          CALL   SYMSRT
          CPI    377Q             ;FOUND ANYTHING?
          JZ     RELAT            ;DONE
          CPI    2
          JZ     ER14             ;IT WAS A ,
          CPI    4
          JNC    ER14             ;NOT LEGAL
          INR    A
          MOV    B,A
          INR    C
          CALL   ICP7
          POP    PSW              ;GET SECOND RELATION
          ADD    B                ;ADD THEM
          PUSH   PSW              ;AND SAVE
          CPI    10Q              ;TEST FOR ==
          JZ     ER14
;RELATION IS STORED ON TOP OF STACK (PUSH PSW) ACCORDING TO
;THE FOLLOWING
;
;         1 =>   <
;         2 =>   >
;         3 =>   <>
;         4 =>   =
;         5 =>   <=
;         6 =>   >=
;
RELAT:    CALL   EVAL             ;EVALUATE
          PUSH   H                ;SAVE H,L
          LXI    H,FREG2          ;COPY TO FREG2
          CALL   COPDH
          POP    H                ;GET H,L
          POP    PSW              ;AND RELATION
          XTHL                    ;GET 2ND 2 BYTES
          SHLD   FREG1+2          ;STORE
          POP    H                ;GET 1ST 2 BYTES,STORE
          XTHL
          SHLD   FREG1
          PUSH   B
          PUSH   PSW              ;SAVE A,B,C
          CALL   FCOMP            ;COMPARE NUMBERS
          MOV    D,A              ;SAVE RESULT IN D
          POP    PSW              ;GET RELATION,B,C
          POP    B
          CMP    D                ;SAME?
          JZ     TRUE             ;YES
          SUI    4
          JP     NOT3             ;NOT RELATION 3
          INR    A                ;IS IT RELATION 3?
          JNZ    FALSE            ;NO, ITS FALSE
          MVI    A,4              ;IT IS, CHECK FOR INEQUALITY
          CMP    D
          JNZ    TRUE
          JMP    FALSE
NOT3:     CMP    D                ;RELATION 5,6 TRUE?
          JZ     TRUE             ;YES
          MVI    A,4              ;IT WAS, CHECK FOR EQUALITY
          CMP    D
          JZ     TRUE
FALSE:    POP    H                ;CONTINUE
          JMP    IEND
TRUE:     POP    H
          MVI    B,4
THEN:     CALL   ICP7             ;INCREMENT PAST THEN
          DCR    B
          JNZ    THEN
          JMP    GTRA             ;TRANSFER TO GOTO
;ROUTINE FCOMP COMPARES 2 FLOATING POINT ='S.  THEY ARE ASSUMED
;TO BE IN FREG1 AND FREG2.
;ALL REGISTERS ARE DESTROYED.
;THE VALUE RETURNED IN REG A IS RESULT OF COMPARISON.
;RESULTS ARE AS FOLLOWS:
;
;         A=1    =>     FREG1 < FREG2
;         A=2    =>     FREG1 > FREG2
;         A=4    =>     FREG1 = FREG2
;
FCOMP:    LXI    H,FREG1+3        ;PNTS TO CHAR OF 1ST
          LXI    D,FREG2+3        ;PNTS TO CHAR OF 2ND
          MOV    A,M              ;GET  1 CHAR
          MVI    B,200Q           ;MASK TO B
          ANA    B                ;GET SIGN,  1
          MOV    C,A              ;SAVE IN C
          LDAX   D                ;GET CHAR  2
          ANA    B                ;GET SIGN  2
          XRA    C
          JZ     SINEQ            ;SAME SIGNS
          MOV    A,C              ;OPPISITE SIGNS,GET  1 SIGN
          RAL                     ;ROTATE TO CY
          MVI    A,1
          RC                      ;FREG1 < FREG2 => A=1
          INR    A                ;ELSE FREG1 > FREG2
          RET                     ;AND A=2
SINEQ:    PUSH   B                ;SAVE SIGN
          DCX    H                ;PNTR TO  1 IN H,L
          DCX    H
          DCX    H
          MOV    B,E              ;PNTR TO  2 IN B
          DCR    B
          DCR    B
          DCR    B
          CALL   LMCM             ;COMPARE MAGNITUDES
;AT THIS POINT Z=1 => =, CY=1 => 1<2
          POP    B                ;GET SIGN BACK
          JNZ    $+6
          MVI    A,4              ;EQUAL => A=4
          RET
          MOV    A,C              ;GET SIGN TO A
          INR    A                ;SET SIGN BIT
          MVI    A,1
          JM     $+6              ;SIGN IS NEGATIVE
          RC                      ;SIGN=+ AND ABS(FREG1)<ABS(FREG2)
          INR    A                ;ABS(FREG1)>ABS(FREG2)
          RET
          RNC                     ;SIGN=- AND ABS(FREG1)>ABS(FREG2)
          INR    A                ;ABS(FREG1)<ABS(FREG2)
          RET
;CALL PROCESSOR
CALLP:    LXI    H,IEND           ;INIT RETURN ADDRESS
          PUSH   H
          LHLD   CPNT             ;INIT POINTERS
          INX    H
          INX    H
          INX    H
          CALL   ICP7
          MOV    A,M              ;GET CHAR
          CPI    '('+200Q         ;IS IT A (?
          JNZ    ER7              ;BAD
          CALL   ICP7             ;BUMP PNTRS
          CALL   CVB              ;GET SUB
          ADD    L                ;UPDATA H,L
          MOV    L,A
          MVI    A,0
          ADC    H
          MOV    H,A              ;D NOW CONTAINS SUB
          PUSH   H                ;SAVE HL
          LHLD   SUBAD           ;GET START OF SUB TABLE
NUSUB:    MOV    A,M              ;GET ENTRY
          CMP    D                ;COMPARE
          JZ     FNDSB            ;FOUND IT
          INX    H                ;PNT TO NEXT ENTRY
          INX    H
          INX    H
          INR    A                ;CHECK TO SEE IF LAST WAS 377Q
          JNZ    NUSUB
          MVI    A,15H            ;ER 15 - NO SUB BY THIS =
          JMP    ERROR
FNDSB:    INX    H                ;FOUND IT,GET STARTING ADD.
          MOV    E,M
          INX    H
          MOV    H,M
          MOV    L,E              ;AND SAVE IT
          SHLD   SBSAV
          LHLD   NXTSP            ;INIT MEMORY SCRATCH AREA
          SHLD   MESCR
          POP    H                ;GET SOURCE PNTR BACK
PARLP:    MOV    A,M              ;GET CHAR
          CPI    ')'+200Q         ;IS IT )?
          JZ     CLSUB            ;YES - GO CALL SUB
          CPI    ','+200Q         ;DO WE HAVE A ,?
          JNZ    ER6              ;UEXPECTED CHARACTER
          CALL   ICP7             ;BUMP PNTRS
          CALL   VAR              ;DO WE HAVE A VARIABLE
          JNC    PREXP            ;NO
          PUSH   D                ;YES - SAVE ADDRESS
          JMP    PARLP            ;CONTINUE
PREXP:    CALL   EVAL             ;EVALUATE EXPRESSION
          PUSH   H                ;SAVE H,L
          LHLD   MESCR            ;GET SCRATCH AREA
          CALL   COPDH            ;AND COPY TO IT
          POP    D                ;HL TO DE
          PUSH   H                ;SAVE ADDRESS
          INX    H                ;UPDATE MESCR
          INX    H
          INX    H
          INX    H
          SHLD   MESCR            ;SAVE IT
          XCHG                    ;GET H,L BACK
          JMP    PARLP            ;CONTINUE
CLSUB:    LHLD   SBSAV            ;START OF ROUTINE
          PCHL                    ;TRANSFER
;GOSUB PROCESSOR
GOSUB:    LXI    H,ILOOP          ;FOR RETURN STMT.
          PUSH   H                ;TO STACK
          LHLD   KFPNT            ;PNTR. TO NEXT STMT.
          PUSH   H                ;SAVE ON STACK
          LHLD   NXTSP            ;CHECK MEMORY
          CALL   MEMFUL
          LHLD   CPNT             ;GET CHAR. PNTR
          INX    H
          JMP    GSENT            ;PART OF GOTO TO FINISH
;RETURN STMT. PROCESSOR
RETRN:    POP    H                ;GET RETURN ADD. FROM STACK
          RET                     ;CONTINUE
;FOR STATEMENT PROCESSOR
FOR:      LHLD   CPNT             ;FIX PNTRS
          INR    C
          INX    H
          INX    H
          CALL   ICP7
          CALL   ALPHA            ;LETTER?
          JNC    ER21             ;NO
          MOV    B,M              ;GET IT TO B
          CALL   ICP7             ;BUMP PNTR'S
          MOV    D,C              ;SAVE C
          MVI    C,0              ;INIT C TO 0
          CALL   NUMB             ;NUMBER?
          JNC    $+9              ;NO
          MOV    C,M              ;YES, GET IT
          INX    H                ;BUMP PNTR'S
          DCR    D
          JZ     ER7              ;PREMATURE EOL
          PUSH   H                ;SAVE H,L
          CALL   FSYM             ;GET VAR. LOCATION
          XTHL                    ;PUT ON STACK, GET H,L
          MOV    E,C              ;VARIABLE TO D,E
          MOV    C,D              ;RESTORE C
          MOV    D,B
          XCHG                    ;SAVE VAR NAME
          SHLD   VNAME
          XCHG                    ;RESTORE H,L
          MOV    A,M              ;LOOK FOR =
          CPI    '=' OR 200Q
          JNZ    ER16
          CALL   ICP7             ;BUMP PNTR'S
          CALL   EVAL             ;EVALUATE EXPRESSION
          XTHL                    ;VARIABLE LOCATION
          CALL   COPDH            ;WRITE VALUE
          SHLD   VLOC             ;SAVE PNTR TO VARIABLE LOCATION
          POP    H                ;GET H,L BACK
          MOV    A,C              ;CHECK EOL
          ORA    A
          JZ     ER7
          MVI    A,2              ;CHECK FOR 'TO'
          CALL   SYMSRT
          CPI    7
          JNZ    ER17
          INX    H                ;BUMB PNTR'S
          INX    H
          MOV    A,C              ;CHECK EOL
          ORA    A
          JZ     ER7
          CALL   EVAL             ;EVALUATE LIMIT
          PUSH   H                ;SAVE H,L
          LXI    H,FLIMT          ;SAVE LIMIT VALUE
          CALL   COPDH
          MOV    A,C              ;CHECK EOL
          ORA    A
          JNZ    STP
          LXI    D,FONE           ;DEFAULT STEP=1
          POP    H                ;RESTORE H,L
          JMP    FBILD
STP:      POP    H                ;GET H,L
          MVI    A,2              ;LOOK FOR 'STEP'
          CALL   SYMSRT
          CPI    8
          JNZ    ER17
          INX    H                ;FIX H,L
          INX    H
          INX    H
          INR    C                ;CHECK EOL
          CALL   ICP7
          CALL   EVAL             ;GET STEP SIZE
;AT THIS POINT:
;VARIABLE NAME IS IN LOCATION VNAME
;VARIABLE ADDRESS IS IN LOCATION VLOC
;VARIBLE HAS BEEN INITIALIZED
;LIMIT IS IN 4 BYTE LOCATION FLIMT
;STEP IS POINTED TO BY D,E
;H,L,C ARE POINTER, COUNTER AS USUAL
FBILD:    PUSH   D                ;SAVE PNTR TO STEP
          LHLD   VNAME            ;GET VARIABLE NAME
          MVI    A,77Q            ;MASK
          ANA    H                ;MASK OFF TOP 2 BITS
          MOV    B,A              ;SET UP TO CALL FSYM
          MOV    C,L
          CALL   FSYM             ;FIND ENTRY
          JC     FEXST            ;IT WAS THERE
          PUSH   H                ;IT WASN'T, SAVE H,L
          LHLD   NXTSP            ;UPDATE NXTSP
          MVI    A,8              ;ADD 8 TO H,L
          ADD    L
          MOV    L,A
          MVI    A,0
          ADC    H
          MOV    H,A
          SHLD   NXTSP            ;NEW VALUE OF NXTSP
          CALL   MEMFUL           ;CHECK MEMORY
          POP    H                ;GET ADD. IN DATA BLOCK
FEXST:    POP    D                ;ADDRESS OF STEP SIZE
          CALL   COPDH            ;STORE IT
          INX    H                ;PNT TO WHERE VAR. PNTR GOES
          INX    H
          INX    H
          INX    H
          LDA    VLOC             ;FIRST BYTE
          MOV    M,A              ;STORE IT
          INX    H
          LDA    VLOC+1           ;SECOND BYTE
          MOV    M,A
          INX    H                ;PNT TO WHERE LIMIT GOES
          LXI    D,FLIMT          ;WHERE IT IS NOW
          CALL   COPDH            ;COPY IT
          INX    H                ;PNT TO WHERE KFPNT GOES
          INX    H
          INX    H
          INX    H
          LDA    KFPNT            ;1ST BYTE
          MOV    M,A
          INX    H
          LDA    KFPNT+1          ;2ND BYTE
          MOV    M,A
;PUT CURRENT VNAME ON NESTING STACK
          LXI    H,0              ;GET STACK-POINTER
          DAD    SP
          SHLD   VLOC             ;SAVE IT
          LHLD   NEST             ;GET NEST SP
          MOV    A,L              ;COMPARE WITH STACK LIMIT
          CPI    TOPNS AND 377Q   ;NEED ONLY COMPARE PAGE LOCATION
          JZ     ER18             ;FOR'S NEXTED TOO DEEPLY
NSTOK:    SPHL                    ;LOAD NEW SP
          XCHG                    ;SAVE NEST SP
          LHLD   VNAME            ;GET INDEX NAME
          PUSH   H                ;SAVE IT
          DCX    D                ;UPDATE NEST SP
          DCX    D
          XCHG                    ;SAVE IT
          SHLD   NEST
          LHLD   VLOC             ;RESTORE OLD SP
          SPHL
          JMP    IEND             ;ALL DONE
FONE:     DB     200Q,0,0,001Q    ;FLOATING PNT ONE
;NEXT STATEMENT PROCESSOR
NEXT:     LHLD   CPNT             ;FIX PNTR'S
          INX    H
          INX    H
          INX    H
          INR    C
          CALL   ICP7
          CALL   ALPHA            ;LETTER?
          JNC    ER21             ;NO, ERROR
          MOV    B,M              ;YES, GET IT
          MOV    D,C              ;SAVE C
          MVI    C,0              ;INIT C TO 0
          INX    H                ;BUMP PNTR'S
          DCR    D
          JZ     NEXT1
          CALL   NUMB             ;NUMBER?
          JNC    ER21             ;NO, ERROR
          MOV    C,M              ;YES, GET IT
          DCR    D                ;SHOULD BE EOL
          JNZ    ER21
NEXT1:    LXI    H,0              ;GET SP
          DAD    SP
          SHLD   VLOC             ;SAVE IT
          LHLD   NEST             ;GET NEST SP
          MOV    A,L              ;COMPARE WITH BOTTOM
          CPI    BOTNS AND 377Q
          JZ     ER19             ;NEXT BEFORE FOR
          SPHL                    ;LOAD SP
          POP    H                ;GET LAST INDEX
          MOV    A,B              ;COMPARE TO CURRENT
          CMP    H
          JNZ    ER20             ;NESTING ERROR
          MOV    A,C
          CMP    L
          JNZ    ER20
          LHLD   VLOC             ;ALL OK, RESTORE OLD SP
          SPHL
          MVI    A,77Q            ;MASK
          ANA    B                ;MASK OUT TOP 2 BITS
          MOV    B,A
          CALL   FSYM             ;FIND SYMBOL
          XCHG                    ;ADDRESS TO D,E
          LXI    H,FREG1          ;COPY STEP TO FREG1
          CALL   COPDH
          INX    D                ;PNT TO CHARACTERISTIC OF STEP
          INX    D
          INX    D
          LDAX   D                ;GET IT
          ANI    200Q             ;GET SIGN
          RAL                     ;ROTATE IT INTO CARRY
          CMC                     ;COMPLEMENT IT
          MVI    A,0              ;MAKE SURE A=0
          RAL                     ;ROTATE TO LSB
          INR    A                ;BUMP BY ONE
          STA    VLOC             ;SAVE IT, ITS =1 IF - STEP, ELSE = 2
          INX    D                ;PNT TO VARIABLE PNTR
          XCHG                    ;GET IT TO DE
          MOV    E,M
          INX    H
          MOV    D,M
          INX    H
          PUSH   H                ;SAVE DATA BLOCK PNTR.
          LXI    H,FREG2          ;COPY VARIBLE VALUE TO FREG2
          CALL   COPDH            ;SAVE VARIABLE LOCATION IN H,L
          XCHG
          MVI    A,2              ;SET UP TO ADD
          CALL   BINOP            ;AND DO IT
          CALL   COPDH            ;COPY TO VARIABLE
          LXI    H,FREG1          ;AND TO FREG1 FOR COMPARE
          CALL   COPDH
          POP    D                ;PNT TO LIMIT
          LXI    H,FREG2          ;COPY TO FREG2
          CALL   COPDH
          PUSH   D                ;SAVE DATA BLOCK PNTR
          CALL   FCOMP            ;COMPARE
          LXI    H,VLOC           ;COMPARE WITH STEP TYPE
          CMP    M
          POP    H                ;GET DATA BLOCK PNTR.
          JZ     NXTDN            ;YES => LOOP DONE
          INX    H                ;LOOP NOT DONE
          INX    H                ;PNT TO TRANSFER ADD.
          INX    H
          INX    H
          MOV    E,M              ;GET IT TO H,L
          INX    H
          MOV    D,M
          XCHG
          JMP    ILOOP
NXTDN:    LXI    H,NEST           ;POP NEST STACK
          INR    M
          INR    M
          JMP    IEND             ;CONTINUE
ER16:     MVI    A,16H            ;'=' EXPECTED(NOTE: NO ARRAY ELEMENTS
          JMP    ERROR            ;FOR INDICES)
ER17:     MVI    A,17H            ;BAD SYNTAX NEAR 'TO' OR 'STEP'
          JMP    ERROR            ;IN FOR STATEMENT
ER18:     MVI    A,18H            ;FOR'S NESTED TOO DEEPLY
          JMP    ERROR
ER19:     MVI    A,19H            ;'NEXT' EXECUTED BEFORE A 'FOR'
          JMP    ERROR
ER20:     MVI    A,20H            ;NESTING ERROR, 'FOR'-'NEXT'
          JMP    ERROR
ER21:     MVI    A,21H            ;BAD INDEX IN FOR-NEXT
          JMP    ERROR
;
; THIS SUB CHECKS FOR PAGE BOUNDARY CROSSING
; OF VARIABLE STORAGE BEFORE UPDATING
; FORWARD POINTER
;    D-E  POINT TO CURRENT LOCATION OF NEXT VARIABLE
;    H-L  POINT TO PREVIOUS VARIABLE LOCATION
;
;  MODIFY D-E ( IF NECESSARY ) SO VARIABLE WILL NOT CROSS PAGE BOUNDARY
;
CHKLC:
          PUSH    PSW
          PUSH    D              ; SEE IF CURRENT VARIABLE
          MVI     A,7            ; STORAGE 8 WORD BLOCK
          ADD     E              ; WILL CROSS PAGE BOUNDARY
          JC      CH0VL
;  OK  -  DOES NOT CROSS PAGE
          POP     D
          POP     PSW
          RET
;  PAGE BOUNDARY CROSSED  -  SET D-E TO START OF NEXT PAGE
CH0VL:
          POP     D
          INR     D
          MVI     E,0
          POP     PSW
          RET
;
;  THIS SUB IS CALLED FROM 'DIM' PROCESSOR
;  REGS. 'D-E' POINT TO NEXT AVAILABLE WORD OF VARIABLE STORAGE
;  THIS SUB MAKES SURE THAT STORAGE STARTS ON A 4-WORD
;  BOUNDARY SO FLT. PT. NUMBER WILL NOT CROSS PAGE
;
CKDIM:
          MOV    A,E
          ANI    3
          RZ
          MOV    A,E
          ANI    374Q
          ADI    4
          MOV    E,A
          MOV    A,D
          ACI    0
          MOV    D,A
          RET

; CALL ROUTINES

;###S
;FWAM:    DW VEND             ;DEFINE FWAM POINTER
;###E

         END

