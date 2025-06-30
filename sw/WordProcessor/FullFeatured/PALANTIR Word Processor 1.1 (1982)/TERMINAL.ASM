*******************************************************
**  P A L A N T I R   T E R M I N A L   D R I V E R  **
*******************************************************


*           DEVELOPED BY
*         DESIGNER SOFTWARE
*      3400 MONTROSE - SUITE 718
*        HOUSTON, TEXAS  77006
*           (713) 520-8221

*         REVISED 12/27/81 RAB

*         THIS MODULE CONTAINS TEN ROUTINES, INTENDED TO BE CALLED
*         FROM EITHER ASSEMBLY LANGUAGE OR C, TO PERFORM CERTAIN
*         PRIMITIVE OPERATIONS WITH THE TERMINAL.  THEY COLLECTIVELY
*         REPRESENT THE ONLY INTERFACE BETWEEN IT AND THE REST OF THE
*         WORD PROCESSING SYSTEM.
*
*         THE ROUTINES ARE CALLED BY PUSHING DATA ONTO THE STACK
*         AND CALLING ONE OF THE LOCATIONS IN THE JUMP
*         TABLE AT THE BEGINNING OF THE PROGRAM.



;           PALANTIR RUNTIME PACKAGE ENTRY POINTS

SYSTEM      EQU         34BH        ;OPERATING SYSTEM LINK
MA1TOH      EQU         30AH        ;GET 1ST C PARAMETER IN HL
MA2TOH      EQU         313H        ;GET 2ND C PARAMETER IN HL

KBCANCEL    EQU         27          ;UNIFORM CANCEL CODE

BASE        EQU         0           ; CP/M STANDARD MEMORY BASE.

ORIGIN      EQU         BASE + 0A00H

            ORG         ORIGIN

CONSOLE     JMP         XCONSOLE
ALARM       JMP         XALARM
PUTCHAR     JMP         XPUTCHAR
CLRSCRN     JMP         XCLRSCRN
GOTOXY      JMP         XGOTOXY
CLRLINE     JMP         XCLRLINE
INITSCR     JMP         XINITSCR
INSERTLN    JMP         XINSERTLN
DELETELN    JMP         XDELETELN

GENDAT:     ; DATA OF GENERAL INTEREST.

SUPHIGH     EQU         80H         ; SUPPORTS HIGHLIGHTING?
SUPINSLN    EQU         00H         ; SUPPORTS INSERT LINE COMMAND?-0=NO,1=YES
SUPDELLN    EQU         00H         ; SUPPORTS DELETE LINE COMMAND?-0=NO,2=YES

**          DEFINE TERMTYPE AS SUM OF THE ABOVE FEATURES
TERMTYPE    DB          SUPHIGH + SUPINSLN + SUPDELLN
TERMATTS    DB          0

**          ENTER SCREEN DIMENSIONS
TERMDIM:    ; DIMENSIONS OF THE SCREEN.
ROWSX       DB          24          ; ROWS IN DISPLAY.
COLSX       DB          80          ; COLUMNS IN DISPLAY

ACTUAL$LOC:                         ; ACTUAL LOCATION OF THE CURSOR.
ACTUAL$ROW  DS          1
ACTUAL$COL  DS          1

BLINK       DW          0            ; CURRENT BLINK OPTION (NONE IF ZERO)
BLINKRATE   DW          0            ; BLINK RATE (IF APPLICABLE)

**          ENTER 16-CHARACTER NAME
TERMNAM     DB          'STD. DEFINITION',0
            ORG         TERMNAM+16

CURRATTR    DS          1           ; CURRENT ATTRIBUTES FOR NEXT CHARACTER.
ATTRFLAG    DS          1           ; WHICH ATTRIBUTES ARE CURRENTLY ENABLED.

*           THE FOLLOWING LIST ASSIGNS ALL LOGICAL ATTRIBUTES TO
*           VIDEO ATTRIBUTE 1, IF YOUR TERMINAL HAS MORE THAN ONE
*           ATTRIBUTE AVAILABLE ENTER THE PROPER DISPLAY NUMBERS.
*           FOR NO ATTRIBUTES ENTER A '0' FOR THE DISPLAY NUMBERS.

            DB          1           ;HIGHLIGHTING
            DB          1           ;BOLDFACE
            DB          1           ;UNDERSCORE
            DB          1           ;DOUBLESCORE
            DB          1           ;STRIKETHRU
            DB          1           ;EXTENDED
            DB          1           ;RIBBON
            DB          1           ;FONT


;           LOCAL VARIABLES REGION

KEYBUF      DS          2           ; ADDRESS OF THE CALLING PROGRAM'S KEYBOARD
                                    ;  BUFFER.  SET BY INITSCR BEFORE
                                    ;  PROCESSING. POINTS TO A TWO BYTE LENGTH
                                    ;  VALUE FOLLOWED BY AN 80 BYTE CHARACTER
                                    ;  BUFFER.
RETC        EQU         13          ; LINE-END CONTROL CHARACTER
LNFD        EQU         10          ; LINE FEED
NEWLINE     EQU         LNFD
BCKSPACE    EQU         8           ; BACKSPACE
FFORM       EQU         12          ; FORM FEED
TAB         EQU         9           ; TAB KEY (^I)
BELL        EQU         7           ; BELL CODE
ESC         EQU         27          ; ESCAPE KEY
DELKEY      EQU         127         ; DELETE KEY

********************************************************

;           THIS ROUTINE LOADS CHARACTERS FROM THE KEYBOARD INTO A BUFFER.
;           IF IS A CHARACTER IS WAITING TO BE INPUT, GRAB IT,
;           TRANSLATE IT (IF NECESSARY) AND PUT IT IN THE BUFFER.
;           IF NONE FOUND, RETURN.

XCONSOLE    PUSH        B
XCONSOL1    CALL        CONIN
            ANA         A
            JNZ         XCONSOL2
            CALL        SPOOL       ;IF NO CHARACTER, THEN SPOOL AND RETURN.
            POP         B
            RET
XCONSOL2    EQU         $           ;PROCESS KEYBOARD ACTIVITY
            MOV         E,A         ;SAVE THE CHARACTER.
            LHLD        KEYBUF      ;MOVE IT TO THE KEYBOARD BUFFER.
            CPI         KBCANCEL    ;SPECIAL HANDLE CANCEL KEY
            JNZ         XCONSOL3
            MVI         M,1         ;FORCE AS 1ST AND ONLY KEYSTROKE IN BUFFER
            INX         H           ;BY SETTING COUNT TO 1
            INX         H
            MOV         M,E         ;STORE CANCEL CODE AT START OF BUFFER
            INX         H
            MVI         M,0         ;FORCE TRAILING NULL
            POP         B
            RET                     ;RETURN WITHOUT EXAMINING REMAINING KEYS
XCONSOL3    EQU         $           ;PROCESS ALL OTHER KEYS
            MOV         A,M
            CPI         80          ;IF KEYBOARD BUFFER FULL,
            JNC         XCONSOL1    ; JUST DROP IT.
            INR         M           ;INCREMENT COUNT.
            INX         H
            INX         H           ;HL POINTS TO THE START OF THE BUFFER
            MOV         C,A         ;HL POINTS TO THE NEXT OPEN CHARACTER IN
            MVI         B,0         ; THE BUFFER.
            DAD         B
            MOV         M,E         ;STORE THE CHARACTER.
            JMP         XCONSOL1    ;REPEAT UNTIL KEYBOARD IS QUIET

CONIN       CALL        GETK        ;GET THE ACTUAL KEYSTROKE IN A.
            ANA         A           ;RETURN WITH THE KEYSTROKE IF IT'S
            RZ                      ; ZERO OR BETWEEN ' ' AND 127.
            CPI         ' '
            JC          CONSEQ
            CPI         127
            RC

CONSEQ      LXI         H,MULTTBLS  ;IS THIS A LEAD-IN CHARACTER?
            LXI         D,5
            MVI         B,3

CONMULTLP   CMP         M           ;COMPARE TO THE CURRENT LEAD-IN,
            JZ          CONHDLSEQ   ; AND HANDLE IT IF IT'S EQUAL.
            DAD         D           ;OTHERWISE, POINT TO NEXT LEAD-IN CHARACTER
            DCR         B           ; AND GO BACK FOR MORE.
            JNZ         CONMULTLP
            LXI         H,LASTCON1  ;IF IT'S NOT ONE OF THEM,
            MVI         B,CON1LEN   ; TRANSLATE IT IN THE ONE-TO-ONE
                                    ; LOOKUP TABLE.

CONLOOP     CMP         M           ;WE SEARCH FOR CHARACTER (STORED IN A).
            JZ          CONFOUND    ;CHARACTER IS FOUND.
            DCX         H           ;IF NOT FOUND, WE STEP THROUGH THE TABLE
            DCR         B           ; BACKWARDS, UNTIL NONE LEFT.
            JNZ         CONLOOP ;IF NOT FOUND, B FINISHES UP ZERO.

CONFOUND    MOV         A,B         ;RETURN TRANSLATION OF CHARACTER, OR ZERO
            RET                     ; IF NOT FOUND.

CONHDLSEQ   INX         H
            CALL        CONSKIP     ;SKIP OVER ((HL)) CHARACTERS.
            PUSH        H
CONHDLK     CALL        GETK        ;GET THE CHARACTER
            JZ          CONHDLK
            POP         H
            INX         H
            MOV         B,M         ;HL := ((HL)), WHICH IS THE ADDRESS
            INX         H           ; OF THE APPROPRIATE LOOKUP TABLE.
            MOV         H,M
            MOV         L,B
            CALL        MULTTRANS   ;TRANSLATE A USING THE LOOKUP TABLE AT HL
            MOV         A,M         ;PUT IT IN A.  (IT WAS RETURNED IN M.)
            ANA         A           ;IS THERE A TRAILING CODE?
            JP          CONHDLX     ;NO - RETURN AS IS
            PUSH        PSW         ;ELSE SAVE THE CHARACTER TO RETURN.

CONHDLL     CALL        GETK
            JZ          CONHDLL     ;WAIT FOR THE THROWAWAY
            POP         PSW
            ANI         127         ;STRIP TRAILING CODE FLAG BIT

CONHDLX     EQU         $           ;RETURN CODE IN ACCUMULATOR
            RET

CONSKIP     MOV         C,M         ;SKIP OVER 'M' CHARACTERS.
            INR         C
CONSKIP1    DCR         C
            RZ
            PUSH        B
            PUSH        H
CONSKL      CALL        GETK
            JZ          CONSKL
            POP         H
            POP         B
            JMP         CONSKIP1

GETK        EQU         $
            LHLD        INADDR
            MOV         A,H
            ANA         A
            JNZ         GETK1
            MVI         C,6         ;GET A PHYSICAL KEYSTROKE, IF ANY PRESENT.
            MVI         E,255
            CALL        SYSTEM      ;CALL SYSTEM, AND RETURN.
            ANA         A
            RET

GETK1       EQU         $           ;FUNCTION 6 NOT RELIABLE - USE CP/M PRIMITIVES
            DCR         A           ;IF TYPE 0 OR TYPE 1,
            JNZ         GETK3       ;USE ROUTINE AT INADDR
GETK2       LHLD        1           ;LOCATE WARM BOOT ENTRY
            INX         H!          INX         H!          INX         H!
            PUSH        H           ;SAVE GENERATED CONSTAT ENTRY
            CALL        HLCALL      ;GET STATUS
            POP         H
            ANA         A
            RZ                      ;RETURN NULL IF NO ACTIVITY
            INX         H!          INX         H!          INX         H!
GETK3       CALL        HLCALL      ;CALL CONIN ENTRY
            ANA         A
            RET

HLCALL      PCHL                    ;INDIRECT SUBROUTINE CALL

;  TRANSLATE A CHARACTER USING THE LOOKUP
MULTTRANS:                          ; TABLE POINTED TO BY HL.
MTRLOOP     INR         M           ;IF THE CURRENT ENTRY IS ZERO, THE TABLE IS
            DCR         M           ; EXHAUSTED, AND WE RETURN ZERO.
            RZ
            CMP         M           ;IF WE FIND IT, WE RETURN THE NEXT 
            INX         H           ; CHARACTER IN THE TABLE.
            RZ
            INX         H
            JMP         MTRLOOP

********************************************************

;           THIS ROUTINE RAISES AN ALARM.

;           EITHER SEND A SEQUENCE TO THE
;           TERMINAL (CAUSING IT TO BEEP, TYPICALLY), OR
;           FLASH THE FIRST N LINES OF THE SCREEN.

XALARM      LDA         ALSELECT
            ORA         A
            RZ                      ;IF SELECT = 0, DO NOTHING.
            DCR         A
            PUSH        B
            JZ          ALFLASH     ;IF SELECT = 1, FLASH THE FIRST N LINES.

            ;IF SELECT = 2, SEND A SEQUENCE.

            LHLD        ALSEQAD
            CALL        SENDSEQ
            POP         B
            RET

ALFLASH     CALL        REVSCRN     ;IF SELECT = 1, FLASH THE SCREEN.
            LHLD        ALFLSTIM    ;WAIT FOR ALARM FLASH TIME.
            CALL        DELAY
            CALL        REVSCRN
            POP         B
            RET

REVSCRN     LDA         COLSX
            MVI         D,0
            MOV         E,A
            LDA         ALFLSCT     ;COUNT HOW MANY CHARACTERS TO FLASH.
            CALL        MULTIPLY    ;HL = COLSX * ALFSCT
            XCHG                    ;DE = COUNT
            LHLD        MEMBASE     ;HL = START ADDRESS
            JMP         REVLOPST

REVLOP2     MOV         A,M         ;REVERSE DE CHARACTERS STARTING AT HLDE
            XRI         80H         ; HOLDING THE COUNT OF HOW MANY TO REVERSE.
            MOV         M,A
            INX         H
            DCX         D
REVLOPST    MOV         A,D
            ORA         E
            JNZ         REVLOP2
            RET

********************************************************

;        THIS ROUTINE OUTPUTS A CHARACTER TO THE SCREEN.

;        IF IT IS A LF, TAB, OR CR, MOVE THE CURSOR ACCORDINGLY.
;        IF IT IS NOT A CONTROL CHARACTER, PRINT IT.

;        TABS BECOME SPACES AND LF'S BECOME CRLF'S.

XPUTCHAR    CALL        MA1TOH
            PUSH        B
            PUSH        H
            MOV         A,L
            CPI         NEWLINE     ;IF IT'S A LF, ADD A CR IN FRONT.
            JZ          PUTCRLF
            CPI         TAB         ;IF IT'S NOT A TAB, IT'S JUST A CHARACTER.
            JNZ         PUTCH

PUTLOOP     MVI         A,' '       ;HANDLE TABS (REPLACE WITH SPACES).
            CALL        CONOUT
            LDA         ACTUAL$COL
            ANI         7
            JNZ         PUTLOOP
            JMP         PUTCHDONE

PUTCRLF     MVI         A,RETC      ;GENERATE CRLF FROM NEWLINE CODE.
            CALL        CONOUT
            MVI         A,LNFD

PUTCH       CALL        CONOUT      ;OUTPUT THE CHARACTER (HOWEVER IT WAS WE GOT HERE.)

PUTCHDONE   POP         H
            POP         B
            RET

CONCHAR     DS          1           ;TEMPORARY STORAGE FOR THE CHARACTER

CONOUT      EQU         $           ;OUTPUT A CHARACTER.
            LHLD        ACTUAL$LOC  ;H == COL, L == ROW.
            INR         H           ;POINT AT NEXT CHAR.
            CPI         ' '         ;IS CHARACTER PRINTABLE OR CONTROL?
            JC          CONCTRL     ;IF LESS THAN ' ', IT'S CONTROL.
            PUSH        H           ;SAVE LOCATION.
            STA         CONCHAR     ;SAVE THE CHARACTER
            LXI         H,CURRATTR
            MOV         A,M         ;IF IT'S PRINTABLE, WE HANDLE ATTRIBUTES.
            INX         H           ;IF AN ATTRIBUTE IS ON...
            XRA         M           ;OR IF ONE WAS LEFT ON...
            CNZ         HANDATTR    ;GO HANDLE ATTRIBUTES.
            LDA         CONCHAR     ;GET THE CHARACTER BACK.
            POP         H           ;GET LOCATION BACK.
            JMP         CONPUTCH    ;AND PRINT THE CHARACTER.

CONCTRL     EQU         $           ;IT'S A CONTROL CHARACTER.  WHAT TO DO?
            DCR         H
            CPI         LNFD        ;LINE FEED
            JZ          CONLF
            CPI         RETC        ;CARRIAGE RETURN
            JZ          CONCR
            CPI         BCKSPACE    ;BACKSPACE
            JZ          CONBS
            RET                     ;IGNORE IT IF IT'S NOT ONE OF THE ABOVE.

CONLF       INR         L           ;FOR LINE FEED, MOVE THE CURSOR ONE DOWN.
            JMP         CONPUTCH
CONCR       MVI         H,1         ;FOR CARRIAGE RETURN, MOVE TO COLUMN 1.
            JMP         CONPUTCH
CONBS       DCR         H           ;FOR BACKSPACE, BACK UP ONE.

CONPUTCH    SHLD        ACTUAL$LOC  ;UPDATE THE CURSOR POSITION
            PUSH        H           ; AND PUT THE CHAR.
            CALL        OUTCHAR
            POP         H
            LDA         COLSX       ;CHECK THE CURSOR POSITION.
            CMP         H           ;ARE WE OFF THE RIGHT HAND MARGIN?
            JNC         CONIF1
            MVI         H,1         ;GO TO LEFT MARGIN,
            INR         L           ; ON THE NEXT LINE.
CONIF1      LDA         ROWSX
            CMP         L           ;ARE WE OFF THE BOTTOM OF THE SCREEN?
            JNC         CONIF2
            DCR         L           ;IF SO, BACK UP ONE.

CONIF2      SHLD        ACTUAL$LOC  ;STORE UPDATED CURSOR POSITION.
            RET

;  SET ATTRIBUTE FOR NEXT CHARACTER OUT.
CONATTR     DS          1
HANDATTR    LDA         CURRATTR    ;STASH THE NEW ATTRIBUTE STATUS
            STA         CONATTR
            LXI         H,ATTRTBL   ;START OF THE ATTRIBUTE TABLE
            LXI         D,1         ;ATTRIBUTE NUMBER IN E
ATTRLOOP    MOV         A,M         ;A := 'HOW IMPLEMENTED'
            ORA         A
            RZ                      ;IF ZERO, WE ARE AT END OF LIST.
            PUSH        H           ;SAVE POINTER INTO ATTRIBUTE TABLE.
            PUSH        D           ;SAVE ATTRIBUTE NUMBER
            LDA         CONATTR     ;GET STATUS FOR THIS ATTRIBUTE.
            ANA         A           ;CLEAR THE CARRY.
            RAR                     ;CARRY := ON/OFF BIT FOR THIS ATTRIBUTE.
            STA         CONATTR     ;SAVE CURRENT ATTRIBUTE STATUS WORD.
            CALL        SETATTR     ;(RE)SET THE ATTRIBUTE, ACCORDING TO CARRY.
            POP         H           ;RETRIEVE ATTRIBUTE NUMBER
            DAD         H           ;BUMP IT TO NEXT
            XCHG                    ;RESTORE TO DE
            POP         H
            LXI         B,6
            DAD         B           ;POINT HL TO NEXT ENTRY IN ATTRIBUTE TABLE.
            JMP         ATTRLOOP    ;GO BACK FOR MORE.

SETATTR     EQU         $           ;SET OR RESET THE CURRENT ATTRIBUTE.
            MOV         A,M         ;FIND OUT HOW IMPLIMENTED.
            INX         H           ;BUMP PAST (NOW UNUSED) NEXT BYTE
            LXI         B,ATTRFLAG  ;SET LOCAL POINTER TO ACTUAL FLAGS
            JNC         ATTROFF     ;TURN IT ON OR OFF?
            CPI         INVBIT      ;DO WE SET THE HIGH ORDER BIT?
            JNZ         ATTRON      ;IF NOT, USE A SEQUENCE (AT ATTRON).
            LDA         CONCHAR     ;IF SO, DO IT AND RETURN.
            ORI         80H
            STA         CONCHAR
            RET

ATTRON      CPI         EACHTIM     ;DO WE SEND A SEQUENCE EACH TIME?
            JZ          SENDATSEQ   ;YES - NO FLAGGING REQUIRED

ATTR1SEQ    EQU         $           ;THIS ATTRIBUTE HANGS AROUND FOR A WHILE.
            LDAX        B           ;GET ACTUAL FLAGS
            ANA         E           ;CHECK AGAINST NUMBER
            RNZ                     ;IF ALREADY ON, NO ACTION
            LDAX        B
            ORA         E           ;TURN ON BIT IN ATTRFLAG
            STAX        B
            JMP         SENDATSEQ

ATTROFF     CPI         ONETIME     ;IS IT A ONETIME SEQUENCE?
            RNZ                     ;IF NOT, IT'S ALREADY OFF.
            LDAX        B           ;CHECK ACTUAL FLAGS (ATTRFLAG)
            MOV         D,A         ;(TEMP SAVE)
            ANA         E
            RZ                      ;IF ALREADY OFF, NO ACTION
            MOV         A,E
            CMA                     ;INVERT CURRENT ATTRIBUTE NUMBER
            ANA         D
            STAX        B           ;STORE FLAG WITH THIS ATTR OFF
            INX         H
            INX         H           ;POINT TO END SEQUENCE.

SENDATSEQ   INX         H           ;(RE)SET ATTRIBUTE BY SENDING SEQUENCE.
            MOV         E,M
            INX         H
            MOV         D,M
            XCHG 
            CALL        SENDSEQ
            RET
********************************************************

;           THIS ROUTINE CLEARS THE SCREEN

;           EITHER SEND A SEQUENCE TO THE TERMINAL OR MOVE SPACES
;           TO THE APPROPRIATE MEMORY LOCATIONS.

XCLRSCRN    PUSH        B           ;SAVE ENVIRONEMENT.
            LHLD        CLSATTR
            CALL        ADJATTR   ;ACCOUNT FOR EFFECT OF CLRSCRN ON ATTRIBUTES
            LXI         H,0101H
            CALL        GOCURSE     ;HOME THE CURSOR.
            LDA         CLSSELECT
            ORA         A
            JZ          CLSSENDSQ   ;IF SELECT = 0, SEND A SEQUENCE.
            LHLD        SCRSIZE ;IF SELECT = 1, MOVE SPACES TO MEMORY.
            XCHG
            LHLD        MEMBASE
            MVI         B,' '

CLRLOOP     MOV         M,B         ;MOVE SPACES TO ALL OF SCREEN MEMORY.
            INX         H
            DCX         D
            MOV         A,D
            ORA         E
            JNZ         CLRLOOP
            POP         B           ;RESTORE THE ENVIROMENT.
            RET

CLSSENDSQ   LHLD        CLSSEQAD    ;SEND THE CLEAR-SCREEN SEQUENCE
            CALL        SENDSEQ     ; TO THE TERMINAL.
            LDA         CLSNULCT    ;FOLLOW WITH NULLS.
            CALL        NULSOUT
            POP         B           ;RESTORE THE ENVIRONMENT.
            RET

********************************************************

;  THIS ROUTINE SENDS THE CURSOR TO A SPECIFIED LOCATION

;  SEND A LEAD SEQUENCE, THE FIRST ADDRESS BYTE,
;  A MIDDLE SEQUENCE, THE SECOND ADDRESS BYTE,
;  AND A TAIL SEQUENCE.

XGOTOXY     EQU         $           ; GO TO X, Y.
            CALL        MA2TOH      ;X, Y ON STACK.
            XCHG
            CALL        MA1TOH
            MOV         H,E

GOCURSE     PUSH        B           ;STORE THE ENVIRONMENT.
            MOV         A,L         ;X, Y IN L,H
            ORA         A           ;CORRECT FOR POSSIBLE ZERO (I.E, DEFAULT).
            JNZ         ROWGIVEN
            LDA         ACTUAL$ROW
            MOV         L,A
ROWGIVEN    MOV         A,H
            ORA         A
            JNZ         COLGIVEN
            LDA         ACTUAL$COL
            MOV         H,A

COLGIVEN    SHLD        ACTUAL$LOC  ;ADJUST ACTUAL LOCATION VARIABLE.
            LDA         GOROWOFF    ;ADD OFFSETS.
            ADD         L
            MOV         D,A
            LDA         GOCOLOFF
            ADD         H
            MOV         E,A         ;D = ROW, E = COL.
            LDA         GOORDER     ;CHECK FOR ORDER (ROW OR COL FIRST?)
            ORA         A
            JZ          GONORMAL    ;IF ORDER = ZERO, ROW COMES FIRST.
            MOV         A,E
            MOV         E,D
            MOV         D,A

GONORMAL    EQU         $           ;NOW, D = FIRST AND E = SECOND.
            PUSH        D           ;SAVE D
            LHLD        GOHEADSEQ   ;SEND LEAD SEQUENCE
            CALL        SENDSEQ
            POP         D           ;SEND FIRST COORDINATE
            PUSH        D
            LDA         GOSELECT    ;DO WE SEND ASCII OR A BYTE?
            ORA         A           ;0 = BYTE, 1 = ASCII.
            JNZ         DOASCII1
            MOV         A,D         ;SEND THE BYTE DIRECTLY.
            CALL        OUTCHAR
            JMP         GODONE1

DOASCII1    MOV         A,D         ;TRANSLATE IT INTO ASCII AND SEND IT.
            CALL        ASCIIOUT

GODONE1     LHLD        GOMIDSEQ    ;SEND THE MIDDLE SEQUENCE.
            CALL        SENDSEQ
            POP         D           ;SEND SECOND BYTE.
            LDA         GOSELECT
            ORA         A           ;0 = BYTE, 1 = ASCII.
            JNZ         DOASCII2
            MOV         A,E         ;SEND THE BYTE DIRECTLY.
            CALL        OUTCHAR
            JMP         GODONE2

DOASCII2    MOV         A,E         ;TRANSLATE IT INTO ASCII, AND SEND IT.
            CALL        ASCIIOUT

GODONE2     LHLD        GOTAILSEQ
            CALL        SENDSEQ
            POP         B
            RET

ASCIIBUF    DS          4           ;STORAGE FOR THE NUMBERS TO BE PUT OUT.

ASCIIOUT    EQU         $           ;OUTPUT AND ASCII STRING FOR VALUE IN A
            LXI         H,'00'
            SHLD        ASCIIBUF    ;CLEAR THE BUFFER
            SHLD        ASCIIBUF+2
            LXI         H,ASCIIBUF+1 ;TRANSLATE INTO BASE 100, ASCII,
            MVI         C,100       ; ONE DIGIT AT A TIME.
            CALL        NEXTDIG
            MVI         C,10
            CALL        NEXTDIG
            ADD         M           ;APPLY RESIDUAL 1'S
            MOV         M,A
            LXI         H,ASCIIBUF ;POINT HL TO THE FIRST APPROPRIATE
            LDA         GOFLDSIZ   ; DIGIT.  IF FIELD SIZE = 3, 3 DIGITS.
            CPI         3
            JNZ         ASCNOT3
            MVI         M,3
            CALL        SENDSEQ    ;SEND THE THREE BYTE SEQUENCE AND RETURN.
            RET

ASCNOT3     CPI         2          ;IF FIELD SIZE = 2, 2 DIGITS.
            JNZ         ASCNOT2
            INX         H
            MVI         M,2
            CALL        SENDSEQ    ;SEND THE TWO BYTE SEQUENCE AND RETURN.
            RET

ASCNOT2     MVI         A,'0'      ;IF FIELD SIZE = 1, VARIABLE LENGTH.
            MVI         B,3        ;B IS COUNT OF DIGITS IN NUMBER.
ASCLOOP     INX         H
            DCR         B           ;CHECK FOR MINIMUM DIGITS
            JZ          ASCFORCE
            CMP         M
            JZ          ASCLOOP
ASCFORCE    EQU         $           ;SIGNIFICANT DIGIT OR MINIMUM STRING FOUND
            DCX         H
            INR         B
            MOV         M,B
            CALL        SENDSEQ     ;SEND THE N-BYTE SEQUENCE AND RETURN.
            RET

NEXTDIG     EQU         $           ;CALCULATE THE NEXT DECIMAL DIGIT.
            SUB         C           ;SEE HOW MANY 'C'S WILL COME FROM
            INR         M           ; 'A' WITHOUT BORROW.  STORE RESULT IN
            JNC         NEXTDIG     ; ASCII, AT M.
            DCR         M
            ADD         C
            INX         H
            RET

********************************************************

;    THIS ROUTINE CLEARS TO THE END OF THE CURRENT LINE.

;    EITHER SEND A CLEAR-TO-EOLN CODE SEQUENCE OR PRINT A
;    SUFFICIENT NUMBER OF SPACES TO FILL THE REST OF THE LINE.

XCLRLINE    PUSH        B           ;STORE THE ENVRIONEMENT.
            LHLD        CLLATTR
            CALL        ADJATTR     ;ACCOUNT FOR EFFECT ON DISPLAY ATTRIBUTES
            LDA         CLLSELECT
            ORA         A
            JZ          CLLSEQ      ;IF SELECT = 0, SEND A SEQUENCE.
            DCR         A
            JZ          CLLPUTSP    ;IF SELECT = 1, PUT SPACES.
            LDA         COLSX       ;IF SELECT = 2, MOVE SPACES TO MEMORY.
            MOV         E,A
            PUSH        D           ;SAVE E (I.E., COLSX)
            MVI         D,0
            LDA         ACTUAL$ROW
            DCR         A
            CALL        MULTIPLY
            XCHG
            LHLD        MEMBASE
            DCX         H
            DAD         D
            LDA         ACTUAL$COL
            MOV         C,A         ;HL = MEMBASE + (ACTUAL$ROW - 1) * COLSX +
            MVI         B,0         ;     ACTUAL$COL - 1, WHICH IS THE FIRST
            DAD         B           ;     LOCATION TO CLEAR.
            POP         D           ;RESTORE E (I.E., COLSX)
            CMA
            INR         A
            ADD         E           ;A = COLSX - ACTUAL$COL + 1, WHICH IS THE
            INR         A           ;     NUMBER OF CHARACTERS TO MOVE.

CLRMOVLOP   MVI         M,' '       ;STORE SPACES AT HL FOR (A) COUNT
            INX         H
            DCR         A
            JNZ         CLRMOVLOP
            POP         B
            RET

CLLPUTSP    LHLD        ACTUAL$LOC
            PUSH        H           ;SAVE THE LOCATION OF THE CURSOR.
            LDA         COLSX       ;A = COLSX - ACTUAL$COL + 1, WHICH IS THE
            SUB         H           ;     NUMBER OF CHARACTERS TO MOVE.
            INR         A
            MOV         B,A
            MVI         L,' '       ;PRINT OUT ENOUGH SPACES TO GET TO THE
CLRLLOOP    PUSH        B           ; END OF THE LINE.
            PUSH        H
            CALL        PUTCHAR
            POP         H
            POP         B
            DCR         B
            JNZ         CLRLLOOP

CLRDONE     POP         H           ;WHEN THE LINE IS CLEARED, WE RETURN TO
            CALL        GOCURSE     ; TO THE ORIGINAL POSITION
            POP         B
            RET

CLLSEQ      LHLD        CLLSEQAD    ;SEND A SEQUENCE, THEN NULLS, THEN RETURN.
            CALL        SENDSEQ
            LDA         CLLNULCT
            CALL        NULSOUT
            POP         B
            RET

********************************************************

;      INSERT A NEW, EMPTY LINE, AT A SPECIFIED LOCATION
;      EITHER SEND AN INSERTLN CODE SEQUENCE TO THE TERMINAL
;      OR MOVE THE MEMORY IN WHICH THE SCREEN IS STORED (IF DMA).

XINSERTLN   CALL        MA1TOH      ;GET THE LINE TO BE INSERTED.
            PUSH        B           ;STORE THE ENVIRONMENT.
            PUSH        H
            LHLD        INSATTR
            CALL        ADJATTR     ;ACCOUNT FOR EFFECT ON DISPLAY ATTRIBUTES
            POP         H
            XRA         A           ;IS IT THE CURRENT LINE?
            CMP         L
            JNZ         LINEGIVEN   ;IF NOT, WE INSERT AT THE LINE GIVEN.
            LDA         ACTUAL$ROW
            MOV         L,A

LINEGIVEN   LDA         INSSELECT   ;DO WE USE A CODE SEQUENCE OR MEMORY?
            ORA         A
            JNZ         INSMOVMEM   ;IF SELECT = 1, MOVE MEMORY.
            MVI         H,1
            CALL        GOCURSE
            LHLD        INSSEQAD    ;IF SELECT = 0, SEND A SEQUENCE
            CALL        SENDSEQ
            LDA         INSNULCT
            CALL        NULSOUT
            JMP         INSFINIS

INSMOVMEM   PUSH        H           ;SAVE THE LINE WE ARE INSERTING AT.
            LDA         ROWSX
            SUB         L           ;COUNT OF HOW MANY LINES TO MOVE.
            ORA         A
            JZ          INSDONOTH   ;IF LAST LINE, NO LINE MOVE IS NECESSARY.
            LHLD        SCREND
            XCHG
            LHLD        SCR2NDLST ;POINT HL AT DESTINATION, DE AT SOURCE
            MOV         C,A

INSOUTLOP   LDA         COLSX
            MOV         B,A

INSINLOOP   MOV         A,M
            STAX        D
            DCX         H
            DCX         D
            DCR         B
            JNZ         INSINLOOP
            DCR         C
            JNZ         INSOUTLOP

INSDONOTH   POP         H
            MVI         H,1
            CALL        GOCURSE
            CALL        XCLRLINE    ;CLEAR THE NEW LINE, (WHOSE ADDRESS WAS
                                    ; PUSHED ON THE STACK BACK AT INSMOVMEM).
INSFINIS    EQU         $
            POP         B
            RET

********************************************************

;           DELETE A LINE

XDELETELN   CALL        MA1TOH      ;GET THE NUMBER OF THE LINE TO DELETE
            PUSH        B
            PUSH        H
            LHLD        DELATTR
            CALL        ADJATTR     ;ACCOUNT FOR EFFECT ON DISPLAY ATTRIBUTES
            POP         H
            MOV         A,L
            ORA         A
            JNZ         DLINEGVN    ;IF ZERO LINE IS GIVEN,
            LDA         ACTUAL$ROW  ; DELETE THE CURRENT LINE

DLINEGVN    MOV         L,A         ;L CONTAINS THE LINE NUMBER.
            MVI         H,1
            PUSH        H
            CALL        GOCURSE
            POP         H
            LDA         DELSELECT   ;DO WE SEND A CODE SEQUENCE,
            ORA         A           ; OR 
            JNZ         DELMOVMEM   ; MOVE MEMORY
            LHLD        DELSEQAD    ;IF SELECT = 0, CODE SEQUENCE.
            CALL        SENDSEQ
            LDA         DELNULCT
            CALL        NULSOUT
            JMP         DELFINIS

DELMOVMEM   LDA         ROWSX       ;IF SELECT = 1, DO MEMORY MAP MOVE
            SUB         L
            MOV         C,A         ;C GETS NUMBER OF LINES TO MOVE
            PUSH        B
            LDA         COLSX       ;GET LENGTH OF EACH LINE
            MOV         E,A
            MVI         D,0
            MOV         A,L
            DCR         A
            CALL        MULTIPLY
            PUSH        D
            XCHG
            LHLD        MEMBASE
            DAD         D
            XTHL
            POP         D           ;HL IS START OF THE FOLLOWING LINE
            DAD         D           ; DE IS START OF THE CURRENT LINE
            POP         B           ;C IS NUMBER OF LINES TO MOVE

DELOUTLOP   LDA         COLSX
            MOV         B,A

DELINLOOP   MOV         A,M         ;MOVE THE CURRENT LINE UP ONE ON THE
            STAX        D           ; SCREEN.
            INX         H
            INX         D
            DCR         B
            JNZ         DELINLOOP
            DCR         C           ;DO IT FOR MANY LINES.
            JNZ         DELOUTLOP
            LDA         ROWSX       ;CLEAR THE CURRENT LINE.
            MOV         L,A
            MVI         H,1
            CALL        GOCURSE
            CALL        CLRLINE
DELFINIS    EQU         $
            POP         B           ;RESTORE THE ENVIRONMENT, AND RETURN.
            RET

********************************************************

;   INITIALIZES THE TERMINAL AT THE BEGINNING OR END OF A SESSION
;   SEND A SEQUENCE OF CHARACTERS, WHILST SETTING A TOGGLE TO
;   REMEMBER WHETHER IT'S THE BEGINNING OR END THAT WE ARE AT.

INITTGL     DB          0           ;THIS IS A TOGGLE TO TELL IF
                                    ; IT IS STARTUP OR SIGNOFF.

XINITSCR    CALL        MA1TOH      ;STORE THE ADDRESS OF THE KEYBOARD BUFFER.
            SHLD        KEYBUF
            PUSH        B
            LDA         INITTGL
            ORA         A
            JZ          INITINIT   ;IF TOGGLE = 0, INITIALIZE.
            LHLD        ENDSEQAD   ;IF TOGGLE = 1, SIGNOFF.
            CALL        SENDSEQ
            JMP         INITRET ;RETURN

INITINIT    INR         A           ;SET TOGGLE FOR WHEN WE COME BACK.
            STA         INITTGL
            LHLD        INSEQAD     ;SEND STARTUP SEQUENCE.
            CALL        SENDSEQ

INITRET     LXI         H,TERMTYPE  ;RETURN POINTER TO COMMUNICATION REGION.
            POP         B           ;RESTORE THE ENVIRONMENT, AND RETURN.
            RET

********************************************************
;           GENERAL PROCEDURES
;           DO NOTHING, AT PRESENT.

SPOOL       RET

;           OUTPUT NULLS.
NULSOUT     ORA         A           ;COUNT IN A.
            RZ
NULLOOP     PUSH        PSW
            XRA         A           ;LOAD A NULL INTO A.
            CALL        OUTCHAR
            POP         PSW
            DCR         A
            JNZ         NULLOOP
            RET

;           OUTPUT A CHARACTER WITHOUT CURSOR ACCOUNTING.
OUTCHAR     MOV         E,A         ;A CONTAINS THE CHARACTER.
            LHLD        OUTADDR
            MOV         A,H
            ANA         A
            JNZ         OUTCHAR1
            MVI         C,6
            CALL        SYSTEM
            JMP         OUTCHAR3
OUTCHAR1    EQU         $           ;PROBLEM WITH BDOS 6 -- USE CONOUT PRIMITIVE
            DCR         A
            JNZ         OUTCHAR2
            LHLD        1
            LXI         B,9
            DAD         B
            MOV         C,E
OUTCHAR2    EQU         $
            CALL        HLCALL
OUTCHAR3    EQU         $
            CALL        XCONSOLE  ;LET'S CHECK THE CONSOLE.
            RET

;           DELAY N TICKS. A TICK IS ABOUT .97 MILLISECONDS ON A 4 MHZ Z-80.
DELAY       MVI         B,0         ;WE RUN 256 SUB-CYCLES OF 15/4 (@4 MHZ) =
DEL1        DCR         B           ; 3.75 MICROSECONDS EACH.
            JNZ         DEL1
            DCX         H
            MOV         A,H
            ORA         L
            JNZ         DELAY       ;WE LOOP BACK UNTIL HL = 0.
            RET

;           OUTPUT A SEQUENCE.
SENDSEQ     MOV         C,M         ;HL POINTS TO THE SEQUENCE, WHICH STARTS
            INR         C           ; WITH A LENGTH COUNT, N, FOLLOWED BY N
            DCR         C           ; DATA BYTES.
            RZ                      ;RETURN IF THE LENGTH IS ZERO.
            INX         H
            XCHG

OUTLOOP     LDAX        D           ;OUTPUT SEQUENCE AT DE FOR C BYTES
            PUSH        B
            PUSH        D
            CALL        OUTCHAR
            POP         D
            POP         B
            INX         D
            DCR         C
            JNZ         OUTLOOP
            RET

ADJATTR     EQU         $           ;ADJUST DISPLAY ATTRIBUTE STATUS FOR SPECIAL FUNCTIONS
            LDA         ATTRFLAG
            ANA         L
            ORA         H
            STA         ATTRFLAG
            RET

;             MULTIPLY DE BY A, PUTTING RESULT IN HL.
MULTIPLY    LXI         H,0
            ORA         A
            RZ
MULTLOOP    DAD         D
            DCR         A
            JNZ         MULTLOOP
AAALAST     RET

*           THIS IS THE DATA THAT THE ABOVE ROUTINES USE TO PERFORM
*           THEIR RESPECTIVE FUNCTIONS.


            ORG         ORIGIN + 500H

**          IF INTYPE AND OUTYPE ARE ZERO, BDOS FUNCTION 6 IS USED FOR I/O
*           IF THEY ARE 1, BIOS PRIMITIVES CONST, CONIN, AND CONOUT ARE USED
*           ELSE, INADDR AND OUTADDR ARE ADDRESSES OF CUSTOM I/O ROUTINES

INADDR      DB          0
INTYPE      DB          0
OUTADDR     DB          0
OUTYPE      DB          0

**          IF MEMORY MAPPING IS USED IN THE DRIVER FOR ANY FUNCTION
*           ENTER THE SCREEN CONSTANTS HERE
MEMBASE     DW          00000H      ; ADDRESS OF START OF SCREEN.
SCRSIZE     DW            000H      ; NUMBER OF BYTES BETWEEN FIRST AND LAST
                                    ;  CHARACTERS ON SCREEN.
SCREND      DW          00000H      ; ADDRESS OF LAST CHARACTER ON SCREEN.
SCR2NDLST   DW          00000H      ; ADDRESS OF LAST CHARACTER ON SECOND
                                    ;  TO LAST LINE OF SCREEN



ATTRDAT:                ; DATA ABOUT THE ATTRIBUTES OF THIS TERMINAL.

INVBIT      EQU         80H         ; IMPLEMENTED BY SETTING HIGH ORDER BIT.
ONETIME     EQU         01H         ; IMPLEMENTED WITH A ONE-TIME SEQUENCE
                                    ; SENT AT THE START OF STRING.
EACHTIM     EQU         02H         ; IMPLEMENTED BY SENDING A SEQUENCE
                                    ; BEFORE EACH CHARACTER

**          ENTER AN EXPANDED ATTRIBUTE IMPLEMENTATION STRUCTURE FOR EACH
*           DISPLAY ATTRIBUTE YOUR TERMINAL OFFERS.  THE EXAMPLE SHOWS A
*           SINGLE ATTRIBUTE.

ATTRTBL:

ATTR1
HOWIMP1     DB          ONETIME
STATUS1     DS          1
ONSEQ1      DW          HL1ON
OFFSEQ1     DW          HL1OFF

ATTR2
HOWIMP2     DB          0
STATUS2     DS          1
ONSEQ2      DW          HL2ON
OFFSEQ2     DW          HL2OFF

ATTR3
HOWIMP3     DB          0
STATUS3     DS          1
ONSEQ3      DW          HL3ON
OFFSEQ3     DW          HL3OFF

ATTR4
HOWIMP4     DB          0
STATUS4     DS          1
ONSEQ4      DW          HL4ON
OFFSEQ4     DW          HL4OFF

ATTR5
HOWIMP5     DB          0
STATUS5     DS          1
ONSEQ5      DW          HL5ON
OFFSEQ5     DW          HL5OFF

ATTR6
HOWIMP6     DB          0
STATUS6     DS          1
ONSEQ6      DW          HL6ON
OFFSEQ6     DW          HL6OFF

ATTR7
HOWIMP7     DB          0
STATUS7     DS          1
ONSEQ7      DW          HL7ON
OFFSEQ7     DW          HL7OFF

ATTR8
HOWIMP8     DB          0
STATUS8     DS          1
ONSEQ8      DW          HL8ON
OFFSEQ8     DW          HL8OFF


**          IF ANY OF THE FOLLOWING SPECIAL FUNCTIONS AFFECT THE SETTTINGS
*           OF ANY DISPLAY ATTRIBUTES, UPDATE THE ENTRY ACCORDINGLY.
*           THE FIRST BYTE OF EACH ENTRY SHOULD HAVE ALL BITS ON (8..1)
*           UNLESS ONE OF THE CORRESPONDING ATTRIBUTES IS AUTOMATICALLY
*           TURNED OFF BY THE FUNCTION.  THE SECOND BYTE SHOULD HAVE ALL
*           BITS OFF UNLESS ONE OF THE CORRESPONDING ATTRIBUTES IS TURNED
*           ON BY IT.

;   THE PAIR 255,0 IS THE DEFAULT -- ASSUMES NO IMPACT FROM CONTROL CODES

CLSATTR     DB          255,0                   ;CLEAR SCREEN
CLLATTR     DB          255,0                   ;CLEAR TO END OF LINE
INSATTR     DB          255,0                   ;INSERT LINE
DELATTR     DB          255,0                   ;DELETE LINE


INITDAT:    ; DATA USED BY THE SCREEN INITIALIZE ROUTINE.

**          ENTER HERE THE ADDRESS OF ANY SEQUENCE REQUIRED TO 
**          SETUP THE TERMINAL.

INSEQAD     DW          INITSEQ     ; ADDRESS OF STARTUP CODE SEQUENCE.
ENDSEQAD    DW          EXITSEQ     ; ADDRESS OF SIGNOFF CODE SEQUENCE.



CLSDAT:     ; DATA USED BY THE CLEAR SCREEN ROUTINE.

**          ENTER HERE THE FLAGS/CODES TO CLEAR THE SCREEN 

CLSSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = MEMORY MAPPED.
CLSSEQAD    DW          CLRSCRNSEQ  ; ADDRESS OF CLEAR-SCREEN SEQUENCE.
CLSNULCT    DB          0           ; NO. OF TIMING NULLS TO SEND AFTER SEQ.



CLLDAT:     ; DATA USED BY THE CLEAR LINE ROUTINE.

**          ENTER HERE THE FALS/CODES TO CLEAR TO END OF LINE

CLLSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = WRITE SPACES AND REPOSITION CURSOR.
                                    ; 2 = MOVE SPACES TO MEMORY.
CLLSEQAD    DW          CLREOLNSEQ  ; ADDRESS OF CLEAR-TO-EOLN CODE SEQUENCE.
CLLNULCT    DB          0           ; NO. OF TIMING NULLS TO SEND AFTER SEQ.



INSDAT:                 ; DATA USED BY THE INSERT LINE ROUTINE.

**          ENTER HERE THE FLAGS/CODES TO INSERT A LINE
*           (MUST BE PRESENT IF INSLINE ON IN TERMTYPE - ELSE IGNORED)

INSSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = MOVE MEMORY.
INSSEQAD    DW          INSLNSEQ    ; ADDRESS OF INSERT-LINE SEQUENCE.
INSNULCT    DB          0           ; NO. OF TIMING NULLS TO SEND AFTER SEQ.



DELDAT:     ; DATA USED BY THE DELETE LINE ROUTINE.

**          ENTER HERE THE FLAGS/CODES TO DELETE A LINE
*           (MUST BE PRESENT IF DELLINE ON IN TERMTYPE - ELSE IGNORED)

DELSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = MOVE MEMORY.
DELSEQAD    DW          DELLNSEQ    ; ADDRESS OF DELETE-LINE SEQUENCE.
DELNULCT    DB          0           ; NUMBER OF TIMING NULLS TO SEND AFTER SEQUENCE.
;


ALDAT:                  ; DATA USED BY THE ALARM ROUTINE.

**          ENTER METHOD & DATA FOR GIVING ALARM.  NOTHING, SCREEN FLASH,
*           OR A BELL CODE (THE LATTER IS PREFERRED IF AVAILABLE).

ALSELECT    DB          2           ; 0 = DO NOTHING.  1 = FLASH THE SCREEN
                                    ;  2 = SEND A CODE SEQUENCE.

ALDATA      EQU         $           ; TWO DATA BLOCKS AT SAME LOCATION.


; CASE OF ALSELECT = 1
ALFLSCT     DB          6           ; NUMBER OF LINES TO FLASH.
ALFLSTIM    DW          100         ; TIME, IN MILLISECONDS, TO STAY FLASHED.

            ORG         ALDATA

; CASE OF ALSELECT = 2
ALSEQAD     DW          BELLSEQ     ; ADDRESS OF ALARM SEQUENCE.
            DB          0           ;NULLS TO OUTPUT

GODAT:                  ; DATA USED BY THE GOTOXY ROUTINE.

**          CURSOR CONTROL DATA HERE

GOSELECT    DB           0           ; 0 = STANDARD SEQUENCE
                                     ; 1 = SEPARATE ROW, COLUMN SEQUENCES
                                     ; 2 = SEND THE LOCATION IN ASCII
GOORDER     DB           0           ; ORDER OF ELEMENTS.
                                     ; 0 = ROW FIRST, 1 = COLUMN FIRST.
GOFLDSIZ    DS           1           ; SIZE OF ASCII FIELD.
                                     ; 2->2, 3->3, 0->VARIABLE.
GOHEADSEQ   DW           GOSEQ       ; ADDRESS OF THE HEAD CODE SEQUENCE.
GOMIDSEQ    DW           NULSEQ      ; ADDRESS OF THE MIDDLE SEQUENCE, IF ANY.
GOTAILSEQ   DW           NULSEQ      ; ADDRESS OF THE TAIL CODE SEQUENCE.
GOROWOFF    DB           31          ; OFFSETS TO ADD TO THE ROW AND COLUMN
GOCOLOFF    DB           31          ; TO FORM PROPER ROW AND COLUMN.



CONDAT:     ; DATA USED BY THE CONSOLE ROUTINE.

CON1LEN     EQU          27          ; LENGTH OF THE CON1 TABLE.

**          TERMINAL CONTROL KEY MAP

NULSEQ      DB          0           ;INVALID KEYSTROKE TRAP.
CON1TBL     DB          'A'-64      ;01 - CURSOR LEFT
            DB          0           ;02 -
            DB          'L'-64      ;03 - LEXICON
            DB          'N'-64      ;04 - DECIMAL TAB
            DB          0           ;05 -
            DB          'F'-64      ;06 - FORMAT
            DB          0           ;07 -
            DB          'B'-64      ;08 - BACKSPACE
            DB          'I'-64      ;09 - TAB KEY
            DB          'E'-64      ;10 - LINE KEY
            DB          0           ;11 -
            DB          'V'-64      ;12 - DIRECTION
            DB          'M'-64      ;13 - CARRIAGE RETURN
            DB          'R'-64      ;14 - SCREEN
            DB          'O'-64      ;15 - ATTENTION
            DB          'T'-64      ;16 - PAGE
            DB          'Q'-64      ;17 - HOME KEY
            DB          'G'-64      ;18 - GOTO (FIND)
            DB          'S'-64      ;19 - CURSOR RIGHT
            DB          'Y'-64      ;20 - DOCUMENT
            DB          'C'-64      ;21 - CLEAR
            DB          'J'-64      ;22 - CHANGE/INSERT
            DB          'W'-64      ;23 - CURSOR UP
            DB          'D'-64      ;24 - CHARACTER DELETE
            DB          'X'-64      ;25 - SET KEY
            DB          'Z'-64      ;26 - CURSOR DOWN
LASTCON1    DB          '['-64      ;27 - CANCEL (ESCAPE KEY)


**          EXPAND TABLES IF MULTI-CODE KEYS TO BE USED ON TERMINAL

MULTTBLS

MULTTBL1
LEADCH1     DB          0           ; LEAD-IN CHARACTER USUALLY ESCAPE OR
                                    ; CTRL-A ; 0=LAST ENTRY IN TABLE
BEFSIG1     DB          0           ; NUMBER OF CHARACTERS BEFORE SIGNIFICANT
                                    ; CHARACTER IN SEQUENCE (NOT COUNTING
                                    ; LEAD-IN).
MLTTBL1     DW          MULTBL1
AFTSIG1     DS          1           ; NOT USED

MULTTBL2
LEADCH2     DB          0
BEFSIG2     DB          0
MLTTBL2     DW          MULTBL2
AFTSIG2     DS          1           ; NOT USED

MULTTBL3
LEADCH3     DB          0
BEFSIG3     DB          0
MLTTBL3     DW          MULTBL3
AFTSIG3     DS          1           ; NOT USED

BUFFER      EQU         $           ;CODE SEQUENCES FOLLOW

**          ENTER CODE SEQUENCES IN THIS AREA
**          FIRST CHARACTER OF SEQUENCES INDICATED HOW MANY
**          CHARACTERS FOLLOW (SEE BELLSEQ BELOW - THIS SEQUENCE
**          SENDS OUT A SINGLE CHARACTER - ASCII 7).

INITSEQ     DB          0
EXITSEQ     DB          0
CLRSCRNSEQ  DB          0
CLREOLNSEQ  DB          0
INSLNSEQ    DB          0
DELLNSEQ    DB          0
GOSEQ       DB          0
BELLSEQ     DB          1,7
HL1ON       DB          0
HL1OFF      DB          0
HL2ON       DB          0
HL2OFF      DB          0
HL3ON       DB          0
HL3OFF      DB          0
HL4ON       DB          0
HL4OFF      DB          0
HL5ON       DB          0
HL5OFF      DB          0
HL6ON       DB          0
HL6OFF      DB          0
HL7ON       DB          0
HL7OFF      DB          0
HL8ON       DB          0
HL8OFF      DB          0

; MULTIPLE SEQUENCE FUNCTION KEYS - TRANSLATION TABLE
; FIRST ENTRY IS SIGNIFICANT CHARACTER,
; SECOND CHARACTER IS THE NUMBER FROM THE TERMINAL CONTROL KEY MAP (ABOVE)
; THAT THIS ENTRY TRANSLATES TO.
; IF THERE IS A CHARACTER AFTER THE SIGNIFICANT CHARACTER ADD 128 TO THE
; NUMBER FROM THE TERMINAL CONTROL KEY MAP.

MULTBL1         EQU     $
                DB              0,0 ; LAST ENTRY FOR EACH TABLE MUST BE 0,0.

MULTBL2         EQU             $
                DB              0,0

MULTBL3         EQU             $
                DB              0,0

            END
TTR     DB          255,0                   ;DELETE LINE


INI 