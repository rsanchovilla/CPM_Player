*******************************************************
**  P A L A N T I R   T E R M I N A L   D R I V E R  **
*******************************************************

*           DEVELOPED BY DESIGNER SOFTWARE
*               (713) 520-8221

*           LAST REVISION 12/27/81  RAB
; REVISED 16 MAY FOR VT100 TERMINAL-ADVANCED VIDEO, ANSI MODE
; STORED ON VT100AV
BASE        EQU         0           ; CP/M STANDARD MEMORY BASE.

ORIGIN      EQU         BASE + 0A00H

            ORG         ORIGIN

CONSOLE     DS          3
ALARM       DS          3
PUTCHAR     DS          3
CLRSCRN     DS          3
GOTOXY      DS          3
CLRLINE     DS          3
INITSCR     DS          3
INSERTLN    DS          3
DELETELN    DS          3

GENDAT:     ; DATA OF GENERAL INTEREST.

SUPHIGH     EQU         80H         ; SUPPORTS HIGHLIGHTING?
SUPINSLN    EQU         0         ; SUPPORTS INSERT LINE COMMAND?-0=NO,1=YES
SUPDELLN    EQU         0         ; SUPPORTS DELETE LINE COMMAND?-0=NO,2=YES

**          DEFINE TERMTYPE AS SUM OF THE ABOVE FEATURES
TERMTYPE    DB          SUPHIGH + SUPINSLN + SUPDELLN
TERMATTS    DB          0

**          ENTER SCREEN DIMENSIONS
TERMDIM:                            ; DIMENSIONS OF THE SCREEN.
ROWSX       DB          24          ; ROWS IN DISPLAY.
COLSX       DB          80          ; COLUMNS IN DISPLAY

ACTUAL$LOC:                         ; ACTUAL LOCATION OF THE CURSOR.
ACTUAL$ROW  DS          1
ACTUAL$COL  DS          1

BLINK       DW          0           ; CURRENT BLINK OPTION (NONE IF ZERO)
BLINKRATE   DW          0           ; BLINK RATE (IF APPLICABLE)

**          ENTER 16-CHARACTER NAME
TERMNAM     DB          'DEC VT-100  AV ',0
            ORG         TERMNAM+16

CURRATTR    DS          1           ; CURRENT ATTRIBUTES FOR NEXT CHARACTER.
ATTRFLAG    DS          1           ; WHICH ATTRIBUTES ARE CURRENTLY ENABLED.

*           THE FOLLOWING LIST ASSIGNS ALL LOGICAL ATTRIBUTES TO
*           VIDEO ATTRIBUTE 1, IF YOUR TERMINAL HAS MORE THAN ONE
*           ATTRIBUTE AVAILABLE ENTER THE PROPER DISPLAY NUMBERS.
*           FOR NO ATTRIBUTES ENTER A '0' FOR THE DISPLAY NUMBERS.

; 1-BOLD, 2-UNDERSCORE, 4-REVERSE VIDEO
            DB          1           ;HIGHLIGHTING
            DB          1           ;BOLDFACE
            DB          2           ;UNDERSCORE
            DB          2           ;DOUBLESCORE
            DB          4           ;STRIKETHRU
            DB          4           ;EXTENDED
            DB          4           ;RIBBON
            DB          4           ;FONT


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



ATTRDAT:                            ; DATA ABOUT THE ATTRIBUTES OF 
                                    ; THIS TERMINAL.

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
HOWIMP2     DB          1
STATUS2     DS          1
ONSEQ2      DW          HL2ON
OFFSEQ2     DW          HL2OFF

ATTR3
HOWIMP3     DB          1
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

CLSATTR     DB          255,0       ;CLEAR SCREEN
CLLATTR     DB          255,0       ;CLEAR TO END OF LINE
INSATTR     DB          255,0       ;INSERT LINE
DELATTR     DB          255,0       ;DELETE LINE


INITDAT:                            ; DATA USED BY THE SCREEN
                                    ; INITIALIZE ROUTINE.

**          ENTER HERE THE ADDRESS OF ANY SEQUENCE REQUIRED TO 
**          SETUP THE TERMINAL.

INSEQAD     DW          INITSEQ     ; ADDRESS OF STARTUP CODE SEQUENCE.
ENDSEQAD    DW          EXITSEQ     ; ADDRESS OF SIGNOFF CODE SEQUENCE.



CLSDAT:                             ; DATA USED BY THE CLEAR SCREEN ROUTINE.

**          ENTER HERE THE FLAGS/CODES TO CLEAR THE SCREEN 

CLSSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = MEMORY MAPPED.
CLSSEQAD    DW          CLRSCRNSEQ  ; ADDRESS OF CLEAR-SCREEN SEQUENCE.
CLSNULCT    DB          0           ; NO. OF TIMING NULLS TO SEND AFTER SEQ.



CLLDAT:                             ; DATA USED BY THE CLEAR LINE ROUTINE.

**          ENTER HERE THE FALS/CODES TO CLEAR TO END OF LINE

CLLSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = WRITE SPACES AND REPOSITION CURSOR.
                                    ; 2 = MOVE SPACES TO MEMORY.
CLLSEQAD    DW          CLREOLNSEQ  ; ADDRESS OF CLEAR-TO-EOLN CODE SEQUENCE.
CLLNULCT    DB          0           ; NO. OF TIMING NULLS TO SEND AFTER SEQ.



INSDAT:                             ; DATA USED BY THE INSERT LINE ROUTINE.

**          ENTER HERE THE FLAGS/CODES TO INSERT A LINE
*           (MUST BE PRESENT IF INSLINE ON IN TERMTYPE - ELSE IGNORED)

INSSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = MOVE MEMORY.
INSSEQAD    DW          INSLNSEQ    ; ADDRESS OF INSERT-LINE SEQUENCE.
INSNULCT    DB          0           ; NO. OF TIMING NULLS TO SEND AFTER SEQ.



DELDAT:                             ; DATA USED BY THE DELETE LINE ROUTINE.

**          ENTER HERE THE FLAGS/CODES TO DELETE A LINE
*           (MUST BE PRESENT IF DELLINE ON IN TERMTYPE - ELSE IGNORED)

DELSELECT   DB          0           ; 0 = SEND A CODE SEQUENCE.
                                    ; 1 = MOVE MEMORY.
DELSEQAD    DW          DELLNSEQ    ; ADDRESS OF DELETE-LINE SEQUENCE.
DELNULCT    DB          0           ; NUMBER OF TIMING NULLS TO
                                    ; SEND AFTER SEQUENCE.


ALDAT:                              ; DATA USED BY THE ALARM ROUTINE.

**          ENTER METHOD & DATA FOR GIVING ALARM.  NOTHING, SCREEN FLASH,
*           OR A BELL CODE (THE LATTER IS PREFERRED IF AVAILABLE).

ALSELECT    DB          2           ; 0 = DO NOTHING.  1 = FLASH THE SCREEN
                                    ; 2 = SEND A CODE SEQUENCE.

ALDATA      EQU         $           ; TWO DATA BLOCKS AT SAME LOCATION.

**          CASE OF ALSELECT = 2
ALSEQAD     DW          BELLSEQ     ; ADDRESS OF ALARM SEQUENCE.
            DB          0           ;NULLS TO OUTPUT

**           CASE OF ALSELECT = 1
;ALFLSCT     DB          6           ; NUMBER OF LINES TO FLASH.
;ALFLSTIM    DW          100         ; TIME, IN MILLISECONDS, TO STAY FLASHED.


GODAT:                               ; DATA USED BY THE GOTOXY ROUTINE.

**          CURSOR CONTROL DATA HERE

GOSELECT    DB           2           ; 0 = STANDARD SEQUENCE
                                     ; 1 = SEPARATE ROW, COLUMN SEQUENCES
                                     ; 2 = SEND THE LOCATION IN ASCII
GOORDER     DB           0           ; ORDER OF ELEMENTS.
                                     ; 0 = ROW FIRST, 1 = COLUMN FIRST.
GOFLDSIZ    DB           2           ; SIZE OF ASCII FIELD.
                                     ; 2->2, 3->3, 0->VARIABLE.
GOHEADSEQ   DW           GOSEQ       ; ADDRESS OF THE HEAD CODE SEQUENCE.
GOMIDSEQ    DW           CSEQ1 	     ; ADDRESS OF THE MIDDLE SEQUENCE, IF ANY.
GOTAILSEQ   DW           CSEQ2       ; ADDRESS OF THE TAIL CODE SEQUENCE.
GOROWOFF    DB           0           ; OFFSETS TO ADD TO THE ROW AND COLUMN
GOCOLOFF    DB           0           ; TO FORM PROPER ROW AND COLUMN.



CONDAT:                              ; DATA USED BY THE CONSOLE ROUTINE.

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
            DB          8     	;08 - BACKSPACE
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
            DB          07FH        ;24 - CHARACTER DELETE
            DB          'X'-64      ;25 - SET KEY
            DB          'Z'-64      ;26 - CURSOR DOWN
LASTCON1    DB          '['-64      ;27 - CANCEL (ESCAPE KEY)


**          EXPAND TABLES IF MULTI-CODE KEYS TO BE USED ON TERMINAL

MULTTBL1
LEADCH1     DB          ESC         ; LEAD-IN CHARACTER USUALLY ESCAPE OR
                                    ; CTRL-A ; 0=LAST ENTRY IN TABLE
BEFSIG1     DB          1           ; NUMBER OF CHARACTERS BEFORE SIGNIFICANT
                                    ; CHARACTER IN SEQUENCE (NOT COUNTING
                                    ; LEAD-IN).
MLTTBL1     DW          MULTBL1
AFTSIG1     DS          1           ; NOT USED

MULTTBL2
LEADCH2     DB          0
BEFSIG2     DB          0	;PF.. KEYS ON VT100
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

INITSEQ     DB          2,esc,'='	;init , ascii keypad
EXITSEQ     DB          2,esc,'>'	;init
CLRSCRNSEQ  DB          4,esc,'[','2','J'
CLREOLNSEQ  DB		4,ESC,'[0K'
INSLNSEQ:
DELLNSEQ:
GOSEQ       DB          2,esc,'['	;cursor position
BELLSEQ     DB          1,7
HL1ON       DB          4,esc,'[1m'	;bold on
HL2ON       DB          4,esc,'[4m'	;underscore
HL3ON       DB          4,esc,'[7m'	;reverse
HL1OFF
HL2OFF
HL3OFF      DB		4,ESC,'[0m'	;attributes off
HL4ON
HL4OFF
HL5ON
HL5OFF
HL6ON
HL6OFF
HL7ON
HL7OFF
HL8ON
HL8OFF
cseq1	db	1,';'	;separator, cursor position
cseq2	db	1,'H'	;terminator

; MULTIPLE SEQUENCE FUNCTION KEYS - TRANSLATION TABLE
; FIRST ENTRY IS SIGNIFICANT CHARACTER,
; SECOND CHARACTER IS THE NUMBER FROM THE TERMINAL CONTROL KEY MAP (ABOVE)
; THAT THIS ENTRY TRANSLATES TO.
; IF THERE IS A CHARACTER AFTER THE SIGNIFICANT CHARACTER ADD 128 TO THE
; NUMBER FROM THE TERMINAL CONTROL KEY MAP.

MULTBL1     EQU         $
	db	'A',23	;CURSOR UP
	DB	'B',26	;CURSOR DN
	DB	'C',19	;CURSOR RIGHT
	DB	'D',1	;CURSOR LEFT
	DB	'x',22	;insert	8
	db	'u',20	;document 5
	db	'q',12	;direction	1
	db	'M',27	;cancel 0
	db	'r',10	;line 2
	db	'v',16	;page 6
	db	'l',6	;format ,
	db	's',14	;screen 3
	db	'n',21	;clear .
	db	'm',4	;decimal tab -
	db	't',18	;find ,4
	db	'p',25	; set   enter
	db	'w',17	;home 7
	db	'y',3	;lexicon 9

            DB          0,0         ; LAST ENTRY FOR EACH TABLE MUST BE 0,0.

MULTBL2     EQU         $
            DB          0,0

MULTBL3     EQU         $
            DB          0,0

            END
            END


            END

            END


         