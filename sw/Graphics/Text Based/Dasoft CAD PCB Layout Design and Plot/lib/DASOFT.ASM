; ************************************************************************
;
;================ WORKDATE 7-12-85 ============= CWM ======================

;	rev to 26	7-12-85	

;	dasoft for 2.6 	6-1-85	cwm
;	omos values changed so help screens back
;	cpm names replaced cause may mess up offsets
;	cpm programs taken off command list
;	nomos1  going in 
;	CHANGED PROGRAM NAMES	5-21-85	CWM
;       added code to jump around DMAC call in PRINTS,uses  GRAFLG, which used 
;	to be VERCHR, at the end of the program 1-4-85. this address must be
;	added to tgraphs and install equates

;       modified LISTEN to ignore uninstalled bs (05h) 11-84

;               
;           xperimental version so edit set to "X" 10-19-84 cwm   
;
; 		DASOFT DESIGN AUTOMATION LOAD KERNAL
;		BY DASOFT DESIGN SYSTEMS, INC.
;       	ALL RIGHTS RESERVED
;	Version 2.5	6/11/84
;
;----------------------------------------------------------
;	some useful macros
;----------------------------------------------------------

PUSHREG	MACRO			;SAVE HL,DE,BC IN THAT ORDER

	PUSH	H
	PUSH	D
	PUSH	B
	ENDM

POPREG	MACRO			;POP BC,DE,HL  
	POP	B
	POP	D
	POP	H
	ENDM

PUSHALL	MACRO			;SAVE ALL REGISTERS (8080)
	PUSHREG
	PUSH	PSW
	ENDM

POPALL	MACRO			;POP ALL REGISTERS (8080)
	POP	PSW
	POPREG
	ENDM

true	equ	-1		; 
false	equ	not true	; 

demo	equ	false		; set true for demo


;terminal definitionŠ

	if demo			; demo stuff

vers	equ	'D'		; 
rev	equ	'2'		; 
edit	equ	'5'		; 

	else

VERS	EQU	'2' 
REV	EQU	'6' 
EDIT	EQU	' ' 

	endif

	
; 	NOTHING NEEDS TO BE CHANGED HERE
; 	IF 'PATCHING' THIS ROUTINE  FOR AN UNUSUAL TERMINAL, SKIP
; 	DOWN TO THE PATCH SECTION, AT THE ENDOF THE JUMP TABLE, ABOUT
; 	ONE  PAGE DOWN.  IF EDITING, SEARCH FOR THE STRING '*PATCH'.


;    EQUATES:

WBOOT	EQU	0		; WARM BOOT ADDRESS
TYPEF	EQU	2		; BDOS PRINT COMMAND NUMBER
BDOS	EQU	5		; ADDRESS  OF BDOS JUMP POINT
BUFF	EQU	80H		; ADDRESS OF DISK INPUT BUFFER
DMA	EQU	26		; SET DMA ADDRESS FUNCT NUMB
READF	EQU	20		; DISK READ FUNCTION
WRITEF	EQU	21		; WRITE FILE TO DISK NUM
OPENS	EQU 	15		; OPEN FILE FUNCT NUMBER
CLOSES	EQU	16		; CLOSE  FILE FUNCT NUMBER

FCB	EQU	05CH		; FILE CONTROL BLOCK ADRS
FCBDN	EQU	FCB+0		; FCB DISK NAME
FCBFN	EQU	FCB+1		; FILE NAME
FCBFT	EQU	FCB+9		; FILE TYPE
FCBEX	EQU	FCB+12		; CURRENT EXTENT NUMBER
FCBRC	EQU	FCB+15		; EXTENT RECORD COUNT (0-128)
FCBCR	EQU	FCB+32		; CURRENT (NEXT) RECORD NUMBER
FCBR0	EQU	FCB+33		; LSB OF 16 BIT RANDOM RECORD ADDRESS
FCBR1	EQU	FCB+34		; MSB OF 16 BIT RANDOM RECORD ADDRESS
FCBR2	EQU	FCB+35		; RECORD OVERFLOW FLAG

TOPPTR	EQU	06H		; WAS (AD00H) STACK START 48K


OMOS0	EQU	0	; HELP SCREEN MENU                                  
OMOS1	EQU	4       ; MAC EDITOR                                        
OMOS2	EQU	10      ; DRL EDITOR                                        ŠOMOS3	EQU	17      ; OUTLINE EDITOR                                    
OMOS4	EQU	24      ; ROUTE EDITOR                                      
OMOS5	EQU	31      ; ALD COMPILER                                      
OMOS6	EQU	37      ; NETLIST/WIRELIST                                  
OMOS7	EQU	42      ; ARTWORK UTILITIES                                 
OMOS8	EQU	46      ; PCB COMPILER                                      
OMOS9	EQU	53      ; PLOTTING SCHEMATICS                               
OMOS10	EQU	60      ;    "     ARTWORK                                  
OMOS11	EQU	64;66      ; TGRAPHS                                           
OMOS12	EQU	69      ; PIN COMBOS                                        
OMOS13	EQU	75;77      ; PAD COMBOS                                        
OMOS14	EQU	80;84      ; HINTS                                             
OMOS15	EQU	93      ; GATES                                             
OMOS16	EQU	95;100     ; TYPES (ADD SCREEN)                                
OMOS17	EQU	102;104     ; QUIT                                              
OMOS18	EQU	104;105;106     ; COMMIT                                            
OMOS19	EQU	106;107     ; DRL ENTRY                                         
OMOS20	EQU	108;112     ; ALD COMPILER ENTRY                                
OMOS21	EQU	110;114;116     ; MAC ENTRY                                         
OMOS22	EQU	110;118;121     ; DASOFT MAIN MENU                                  
OMOS23	EQU	121;127     ; DRL EDITOR MENU                                   
OMOS24	EQU	125;132     ; MAC EDITOR MENU                                   
OMOS25	EQU	130;137     ; ADD PAD                                           
OMOS26	EQU	135;140     ; ADD PIN                                           
OMOS27	EQU	138;143     ; ADD TYPE 1                                        
OMOS28	EQU	140;146     ; ADD TYPE 2                                        
OMOS29	EQU	145;149     ; ADD TYPE 3                                        
OMOS30	EQU	149;153     ; ADD TYPE J                                        
OMOS31	EQU	150;159     ; OUTLINE EDITOR ENTRY                              
OMOS32	EQU	150;163     ; ROUTE EDITOR ENTRY                                
OMOS33	EQU	152;169     ; DOCUMENTATION GENERATOR ENTRY                     
OMOS34	EQU	171;    ; ARTWORK UTILITIES ENTRY                           
OMOS35	EQU	171 ;179     ; PCB COMPILER ENTRY                                
OMOS36	EQU	171 ;183     ; ALDPLOT ENTRY                                     
OMOS37	EQU	171;185     ; RTEPCB ENTRY                                      
OMOS38	EQU	171;189     ; PCBPLOT ENTRY                                     
OMOS39	EQU	155;171;194     ; outline menu                                      
OMOS40	EQU	155;171;196     ; route editor menu                             
OMOS41	EQU	175	; next message starts here



;	MACROS

LASTMAC	EQU	10H		; LAST MACRO NAME + 1
FRSTMAC	EQU	01H		; FIRST MACRO NAME

CLEAD	EQU	01H		; CURSOR POSITIONING STRING CODE
CMID	EQU	02H		;STRING SENT BETWEEN ROW AND COLUMN 
P3LINES	EQU	03H		; PRINT THREE LINES
CEND	EQU	04H		;STRING SENT AFTER ROW AND COLUMN	
CONTMSG	EQU	0BH		; CONTINUE MESSAGE CODE
CLS	EQU	0CH		; CLEAR SCREEN CODE
IVON	EQU	0EH		; INVERSE ON CODE
IVOFF	EQU	0FH		; INVERSE OFF CODE
Š;-------------------------------
;	defining the addresses
;	where files are loaded.
;-------------------------------
;
;first maximum length of kernal. 
;
kerlen	equ	1000H		;lenght of the kernal (upper bound)
;
bdosadd	equ	0c600H		;this address must not be
				;larger than the actual bdos address.
				;a value smaller than c600H will probably
				;lead to problems with dsovly.
OVLLEN	equ	400H		;lenght of dsovly. (upper bound)

;
; when dsovly is activated the memory looks as follows:
;
;               	system
;			bdos
;			saved kernal
;			overlay
;			jmp	bdos
;			TPA
;
;

; LDOVL SHOULD BE AT LEAST B000H+300H
; THE REASON IS THAT THE MATRIX WILL BE TAKING FROM 3000H
; TO B000H (8K LONG). ALSO NEED SOME STACK ROOM.
;	
ldovl 	EQU	bdosadd-kerlen-ovllen 	;load address of dsovly 

START4	EQU	04400H		; 
START1	EQU	01400H		; LOAD THIS ONE AT 1000H

CR	EQU	0DH		; RETURN CHARACTER
LF	EQU	0AH		; LINE FEED CHARACTER
BEEP	EQU	07H		; BEL CHARACTER
TAB	EQU	09H		; TAB CHARACTER
BS	EQU	08H		; BACK SPACE
ESC	EQU	1BH		; ESCAPE
EOM	EQU	0EEH		; END OF MESSAGE MARKER (MSGOVL FILE)
EOF	EQU	0FFH		; END OF FILE MARKER    (MSGOVL FILE)
MSCNT	EQU	0F9H		; 1 MSEC SOFTWARE DELAY CONSTANT

qtcmd	equ	'Q'		; help routine exit character

	ORG	100H

	JMP	SIGNON		; DISPLAY SIGNON AND TEST FCB FOR NAME
RDRL:	JMP	KERNAL		; LOADER KERNAL OR TEST PROG

DALN:	DW	LSTBYT		; END OF DASOFT FOR SAVE FROM INSTALL

CLEARS:	JMP  	CLRSCRN  	; CLEAR SCREEN ROUTINE
CURSOR:	JMP	CURPOS		; ADDRESS CURSOR ROUTINE
PSTRNG:	JMP	PRINTS		; PRINT AN ASCII STRING
WRITE:	JMP	WRITEC		; WRITE CHAR IN A TO CONSOLE
GETBYT:	JMP	GNB		; GET NEXT BYTE OF DISK READ
WRTBYT:	JMP	WNB		; WRITE NEXT BYTE TO DISK
WRTSEG:	JMP	WRS		; WRITE SEGMENT TO DISK ROUTINE
INCHNE:	JMP	NOECHO		; ROUTINE TO READ CONSOLE NO ECHO
FSNEAK:	JMP	FSCRN0		; RE-ENTER W/NEW CMD LINE
FSCMDL: JMP	FSCRN1	  	; FULL SCREEN PACKAGE CMD ONLY ENTRY
FSENTR:	JMP	FSCRN2		; FULL SCREEN NORMAL ENTRY
FSDATA:	JMP	FSCRN3		; FULL SCRN UPDATA DATA ENTRY
FSERR:	JMP	FSPERR		; PRINT MESSAGE IN ERR FIELD FS
DCODE:	JMP	COMMACH		; COMMAND DECODER ROUTINE
SETDRV:	JMP	PDRIVE		; SET PROGRAM AND DATA DRIVES
ERRFN:	JMP	PERFN		; PRINT ERROR FILE NAME
EXHELP:	JMP	HELP1		; EXTERNAL HELP ENTRY
OPENF:	JMP	OPENX		; DISK UTILITY OPEN FILE SUBR
LOADF:	JMP	LODPROG		; DISK UTILITY LOAD FILE SUBR
CLOSEF:	JMP	CLOSE		; DISK UTILITY CLOSE FILE SUBR
SELDRV:	JMP	DRVSEL		; SELECT SPECIFIED DATA DRIVE
DFTDRV:	JMP	DFTDRIV		; SELECT DEFAULT DATA DRIVE
GETNAM:	JMP	DFTNAM		; FILE NAME INPUT ROUTINE
DUMP:	JMP	BLKMOV		; BLOCK MOVE ROUTINE
MESSAGE:JMP	MSGMKR		; DISPLAY MESAGE ROUTINE
DELAY:	JMP	DLOOP		; DELAY ROUTINE
	JMP	SELECT		; SELECT PROGRAM AND DATA DRIVE. (ROUTINE)
	JMP	PDRIV1		; LIKE PDRIVE, BUT THIS IS A ROUTINE
	jmp	hltdec		; send hl to screen in decimal. (a) space
				; at least will be used.
;now some place holder in case we want to save something, later
;we won't have to re-compute every address.

	jmp	0
	jmp	0
	jmp	0
	jmp	0
	jmp	0		

TRMINI:	DB	00,00,00,00,00,00
	DB	CR,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,'$'
TRMUNI:	DB	00,00,00,00,00,00
	DB	CR,P3LINES,'Exiting to CP/M...',CR,LF,'$'

SIGN:	DB	'DASOFT Design automation System version 'Š
	DB	VERS,'.',REV,EDIT

	DB	CR,LF
	DB	'Copyright (C) 1982  DASOFT Design Systems, Inc.'
	DB	CR,LF

	if demo
	db	'This software is sold for demonstration purposes only.     '
	db	'              '
	else
	DB	'User License Agreement allows copies to be made for backup '
	DB	'purposes only.'
	endif

	DB	CR,LF
	DB	'Serial number: '

SERNUM:	if demo
	db	'DEMO '
	else
	DB	'X9999'
	endif

	DB	CR,LF,LF,LF,LF
	DB	'Installed for: '
TERM:	DB	'-UNINSTALLED-      '
	DB	CR,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,'$'Š
; 	KEYS FOR CURSOR ADDRESSING:

SCRLUP:	DB	'<'		; SCROLL CURSOR UP KEY
SCRLDN:	DB	'>'		; SCROLL CURSOR DOWN KEY (RET DEFAULT)
HOME:	DB	'/'		; HOME CURSOR TO UPPR LEFT CORNER
DELETE:	DB	'X'-40H		; DELETE AN ENTIRE FIELD CHARACTER
CHARDEL:DB	'D'-40H		; DELETE A SINGLE CHARACTER (BACKSPACE)
ESCFLAG:DB	00H		; FLAG, SEE BELOW:
TBS:	DB	BS,5FH,BS,'$'	; TERMINAL BACKSPACE (BS,_,BS)

; 	IF THE ESCAPE FLAG IS ZERO, THE ABOVE CHARACTERS ARE INTERPRETED
; 	AS CURSOR CONTROLS.  IF THE FLAG IS NONZERO, THE CURSOR CONTROLS
; 	ARE INTERPRETED AS A TWO CHARACTER STRING STARTING WITH AN ESCAPE
; 	CHARACTER (01BH), AND FOLLOWED BY THE CHARACTER DEFINED ABOVE.

;---------CURSOR POSITIONING ITEMS--------------------------------------

COL$OFF:			; Y OFFSET

	DB	32

ROW$OFF:			; X OFFSET

	DB	32

;THÅ NEXÔ ITEÍ IÓ MISNAMED®  IÆ ° SAYÓ THAÔ ROW¬ COLUMÎ ARÅ TÏ BÅ 
;SENT IN HEX, IF >0 INDICATES HOW MANY ASCII CHARACTERS ARE TO
;BE SENT FOR EACH (NORMALLY TWO OR THREE) 

ASCIIFLG:			; 0 TO SEND IN HEX, 1 TO SEND IN ASCII

	DB	0

XB4YFLG:			; SET TO 1 IF X IS SENT BEFORE Y

	DB	0

NULLS:	DB	00		; NULLS TO BE SENT B4 POS STRINGŠ;-------------------------------------------------
DEL1:	DB	10		; SHORT DELAY CONSTANT
DEL2:	DB	20		; LONG DELAY CONSTANT

MACTBL:
;	FORMAT: MACRO NAME,STRING,$,ETC...,*
;		** = UNUSED 
;------------------------------------------------
;	SCREEN CONTROL STRINGS.
;	MAXIMUM VALUE IS 7 FOR EACH
;	STRING TO SEND BEFORE VALUE WHEN CURSOR POSITIONING.
;

CD1:	DB	CLEAD				; CURSOR POSITIONING STRING
	DB	0,0,0,0,0,0,0,'$'

;------------------------------------------------
;STRING SENT BETWEEN VALUES
CD2:	DB	CMID
	DB	0,0,0,0,0,0,0,'$'

;------------------------------------------------
CD3:	DB	P3LINES				; 3 LINE FEEDS
	DB	LF,LF,LF,'$'			; 
;-------------------------------------------------
; STRING SENT AFTER VALUES WHEN CURSOR POSITIONINGŠ; 
CD4:	DB	CEND
 	DB	0,0,0,0,0,0,0,'$'

;------------------------------------------------
CDB:	DB	CONTMSG				; CONTINUE PROMPT
	DB	'  Press any key to continue$'	; 
;-------------------------------------------------
CDC:	DB	CLS				;CLEAR SCREEN
	DB	0,0,0,0,0,0,0,'$'
		
;-------------------------------------------------
CDE:	DB	IVON				; INVERSE ON
	DB	0,0,0,0,0,0,0,'$'

;-------------------------------------------------

CDF:	DB	IVOFF				; INVERSE OFF
	DB	0,0,0,0,0,0,0,'$'

;-------------------------------------------------
	DB	'*'				; END OF TABLE

; 	SYSTEM TEMPORARY STORAGE NEEDS:

MATRIX:	DW	3000H		;ADDRESS OF MATRIX	

TLC:	DW	0000		; TOP LEFT CORNER

XPOINT:	DB	00		; X  COORD POINTER 
YPOINT:	DB	00		; Y COORD POINTER

FLDBGN:	DW	0000		; START ADRS OF SCB
CURFLD:	DB	00		; CURRENT FIELD NUMBER
LASTFLD:DB	00		; LAST FIELD NUMBER

ERRFLG:	DB	00		; ERROR PRINTED FLAG

IBP:	DB	80H		; INPUT BUFFER POINTER
OBP:	DB	00H		; OUTPUT BUFFER POINTER

SCREENX:DB	80		; SCREEN WIDTH CHARRACTERSŠSCREENY:DB	24		; SCREEN CHARACTER LENGTH

DEFALDX:DB	250		; DEFAULT #COLUMNS IN ALD PAGE
DEFALDY:DB	110		; DEFAULT #ROWS IN ALD PAGE
DEFPCBX:DB	250		; DEFAULT PCB WIDTH (.05"/SPACE) 12.5"
DEFPCBY:DB	120		; DEFAULT PCB HEIGHT (.05"/SPACE) 6"

TMPNM:	DW	0000		; TEMPORARY STORAGE
MREC:	DB	00		; MESSAGE RECORD POINTER
TDRV:	DB	00		; TEMP DRIVE NAME STORAGE

DSPERFN:			; ERR FILE NAME DISPLAY FLAG
	DB	0fh		; NON-ZERO TO DISPLAY NAME

;	-= * WARNNING *  USE THIS BYTE CAREFULLY =-
;	      -= ALWAYS RESET AFTER USING =-

MPFLAG:	DB	10000000B	; 

;	BIT 0 = EXIT ON (RETURN) KEY MODE
;	BIT 1 = SINGLE CHARACTER INPUT MODE
;	BIT 2 = UNDERLINE FLAG
;	BIT 3 = CMD,PARM FLAG
;	BIT 4 = **
;	BIT 5 = **
;	BIT 6 = **
;	BIT 7 = COLD START FLAG

; 	SCREEN CONTROL BLOCK (SCB) FOR DASOFT COMAND SCREEN

CMDLN:	DB	IVON,'CMD? ',IVOFF,'$'	; COMMAND LINE CHARACTERS

CMDBFR:	DB  	'...             $'	; SPACE FILLED 16 BYTE BUFFER $TER

RSCB1:	DW	0000		; DATA LOCATION
	DB	00,17,0FFH, '                  program drive is ',IVON
DPD:	DB	' :',IVOFF,'$'
	DB	00,18,0FFH, '             default data drive is ',IVON
DDD:	DB	' :',IVOFF,'$'
	DB	0FFH		; TERMINATION OF SCB

VERSION:DB	IVON,'DASOFT DESIGN AUTOMATION  '

	DB	VERS,'.',REV,EDIT

	db	IVOFF,'$'

PDRVM:	DW	0000
	DB	05,05,0FFH,'Enter ',IVON,'PROGRAM DRIVE',IVOFF
	DB	' name? (A - P)$'
	DB	05,07,0FFH,'Press <return> to use ',IVON
PDRV:
	DB	'A'

	db	':',IVOFF,'$',0FFH

DDRVM:	DW	0000
	DB	05,05,0FFH,'Enter default ',IVON,'DATA DRIVE',IVOFF
	DB	' name? (A - P)$'
	DB	05,07,0FFH,'Press <return> to use ',IVON
DDRV:
	if demo 
	DB	'A'
	else
	DB	'B'
	endif

	db	':',IVOFF,'$',0FFH

DFTMSG	DB	CR,LF,'Default  ',IVON	; default file name
DFTDR:	DB	' :'
DFTFN:	DB	'        ',IVOFF,'$'		; 

NAMEW:	DB	'WIRELIST',VERS,REV,EDIT
NAME1:	DB	'DESEDIT ',VERS,REV,EDIT
NAME2:	DB	'NETLIST ',VERS,REV,EDIT
NAME3:	DB	'ALDCOMP ',VERS,REV,EDIT
NAME4:	DB	'OUTLINE ',VERS,REV,EDIT
NAME5:	DB	'BORDCOMP',VERS,REV,EDIT
NAME6:	DB	'MATRIX  ',VERS,REV,EDIT
NAME7:	DB	'BORDEDIT',VERS,REV,EDIT
; NAME8:	DB	'UTILS   ',VERS,REV,EDIT
NAME9:	DB	'PARTEDIT',VERS,REV,EDIT
INSNAM:	DB	'INSTALL ',VERS,REV,EDIT
MSGOVL:DB	'DSMSGS  ',VERS,REV,EDIT
RUN1FN:	DB	'DSOVLY  ',VERS,REV,EDIT

LDERR:	DB	BEEP,'Error reading file$'
RCMSG:	DB	BEEP,'  is not between A and P, try again$'
WRMSG:	DB	'Error writing file '
ERRM1:	DB	BEEP,'$'
OPERR:	DB	BEEP,'Error opening file...$'
LOADQ:	DB	BEEP, 'N(etlist), W(irelist) or Q(uit)?$'
MSERR:	DB	BEEP,'Error reading overlay file$'
ERFILEM:DB	cr,lf,'File: ',ivon,'$'
ntfound$:db	' not found.',ivoff,'$'
CLERMSG:DB	CR,LF,'                                        $'


; 	COMMANDS AND JUMP TABLE

CMDLIST:DB	'A$'		; WAS: 'DRL$'
	DW	LOAD9
	DB	'B$'		; WAS: 'MAC$'
	DW	LOAD1
	DB	'C$'
	DW	LOAD3		; WAS: 'ALD$'
	DB	'D$'
	DW	LOAD2		; WAS: 'DOC$'
	
; 	NOW THE PCB COMMANDS

	DB	'E$'
	DW	LOAD4		; WAS: 'OTL$'
	DB	'F$'
	DW	LOAD5		; WAS: 'PCB$'
	DB	'G$'
	DW	LOAD7		; WAS: 'RED$'
	DB	'H$'
	DW	LOAD6		; WAS: 'ART$'
;	DB	'N$'
;	DW	LOAD8		; Display next menu
	DB	'?$'
	DW	HELP		; Help
	DB	':$'
	DW	PDRIVE		; change program drive
 	DB	'%$'
	DW	RUN1		; Run ALDPLOT
	DB	'&$'
	DW	RUN1		; Run RTEPCB
	DB	'|$'
	DW	RUN1		; Run PCBPLOTŠ	db	'R$'		
	DW	run1		; Run a program
 	DB	'*'		; END OF COMMAND LIST

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ COLD START ENTRY POINT ~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

 
SIGNON:	LXI	D,TRMINI	; POINT TO TERMINAL INITIALIZATION STRING
	CALL	prints		; DISPLAY IT

	LXI	D,SIGN		; POINT 'DE' TO NEXT MESSAGE
	CALL	prints		; DISPLAY THAT TOO!

	LDA	DEL1		; GET DELAY FACTOR
	MOV	D,A		; 
	MVI	E,0		; SET UP COUNTER
	CALL	DLOOP		; WAIT FOR A WHILE

; the signon procedure has been changed as follows:
; if the user enters "I" as a parameter, or if the terminal
; has not been installed, Install will be loaded.
; otherwise, The Kernal takes control
;					sb 4/7/84 

SIGND:	LDA	TERM		; GET FIRST CHARACTER OF DESC.
	CPI	'-'		; IS IT A DASH?
	JZ	INSTALL		; NOT INSTALLED IF IT IS	
	LDA	FCBFN		; GET FIRST CHAR OF FCB IN A
	CPI	'I'		; ARE THEY INSTALLING NOW?
	JZ	INSTALL		; YES

ASO:	ORA	A		; SEE IF FILE NAME THERE
	JZ	KERNAL		; NO FILE NAME GO START PROGRAM

	LDA	FCB		; GET DRIVE WITH FILE
	ORA	A		; TEST FOR ZERO
	JZ	JMN		; JUST MOVE NAME IF NO DRIVE 

	ORI	040H		; MAKE DRIVE SELECTION ASCII
	STA	DDRV		; SET DEFAULT DATA DRIVE
	STA	DFTDR		; SET IN DEFAULT MESSAGE

JMN:	LXI	D,DFTFN		; POINT DEST. TO DEFAULT FILE STORAGE
	LXI	H,FCBFN		; POINT SOURCE TO FILE NAME
	LXI	B,8		; SET COUNT TO LENGTH OF NAME
	CALL	BLKMOV		; MOVE NAME
	JMP	KERNAL

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~ CLEAR SCREEN ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~ 
; **************************************************************************

; 	NO REGISTERS CHANGED

CLRSCRN:PUSH	PSW		; SAVE 'A'
	MVI	A,CLS		; GET CLEAR SCREEN MACRO
	CALL	DMAC		; SEND IT OUT
	push	d		; save 'D'
	lxi	d,20		; delay after clear screen
	call	delay
	pop	d		; restore 'DE'
	MVI	A,IVOFF		; GET INVERSE OFF MACRO 
	CALL	DMAC		; SEND IT OUTŠ	POP	PSW		; RESTORE 'A'
	RET			; THATS ALL THERE IS FOR THIS ONE

; ***********************************************************************
;   ~~~~~~~~~~~~~~~~~~~ CURSOR POSITIONING ROUTINE ~~~~~~~~~~~~~~~~~~~~
; ***********************************************************************

; 	MOVES THE CURSOR TO THE X,Y COORD
; 	ADDRESS OF XY COORD IN 'DE'

; 	INPUTS:  D,E POINT TO 2 BYTES OF X,Y
; 	OUTPUTS: NONE, NO REGISTERS CHANGED

CURPOS:	PUSHALL			; SAVE ALL REGISTERS

; 	FIRST SEND NULLS, IF CALLED FOR

	LDA	NULLS		; GET COUNT
	MOV	B,A		; MOVE COUNT TO SAFE PLACE
	XRA	A		;ZERO A
	CALL	OUTMANY		;SENT B 0'S

POS:	MVI	A,CLEAD		; GET CURSOR POS MACRO NAME
	CALL	DMAC		; PRINT THAT STUFF

;	COMPUTE IN HL X,Y INCLUDING OFFSETS

	XCHG			; MAKE HL POINT TO XY
	MOV	D,M		; D=X
	INX	H		
	MOV	E,M		; E=Y
	LHLD	COL$OFF		; H=X OFFSET, L=Y OFFSET
	DAD	D		; H=X, L=Y TO SEND	

; 	NOW CHECK IF X FIRST OR Y FIRST

	LDA	XB4YFLG		; GET X BEFORE Y FLAG
	ORA	A		; 
	JNZ	HFIRST		; IF NON ZERO THEN X GOES OUT FIRST

;EXCHANGE H AND L SINCE Y GOES FIRST

	MOV	A,L
	MOV	L,H
	MOV	H,A

HFIRST:;SEND FIRST COORDINATE
	MOV	A,H		;SEND H
	CALL	SASCHEX		

;NOW SEND STRING THAT COMES IN BETWEEN
	MVI	A,cmid
	call	DMAC		;SENT

; SEND SECOND COORDINATEŠ
	MOV	A,L		;NOW L
	CALL	SASCHEX

;FINALLY SEND POST CURSOR POSITIONING STRING.
	MVI	A,CEND
	JMP	DMAC1		;DO DMAC,RESTORE REGISTER  AND RETURN 	
;-----------------------------------------------
;send A in ascii or hex depending on ascii flag set or not.
;
SASCHEX:PUSHALL			;SAVE REGISTERS
	MOV	C,A		;SAVE A
	LDA	ASCIIFLG	;SEE IF WANT ASCII TO BE SENT
	ORA	A
        MOÖ     B,Á             ;SAVÅ VALUÅ OÆ FLAÇ IÎ  B
	MOV	A,C		;CHAR BACK IN A
	JZ	WRTC1		;NO, SEND IN BINARY
	JMP	OUTDEC1		;SEND CHAR IN DEC ASCII

;--------------------------------------------------------------------------
;
OUTDEC:;SEND A TO CONSOLE IN DECIMAL (ASCII)
       ;B HAS HOW MANY CHARACTERS TO SENT AS A MINIMUM.
  
	PUSHALL			;SAVE ALL REGISTERS
OUTDEC1:MOV	L,A		;MOVE A TO HL
	MVI	H,0
	MOÖ      A,Â 		;SAÙ THAÔ MUSÔ SENÄ AÔ LEASÔ  Â CHARACTERS 
	JMP	HLTDC0		;SEND AND RETURN TO CALLER

;-----------------------------------
;	ROUTINE TO SEND HL TO SCREEN IN DECIMAL
;	AT LEAST [REG A] CHARACTES ARE SENT, PADDED IF NECESSARY WITH 
;	LEADING 0's
;

HLTDEC:PUSHALL	;SAVE MACHINE STATUS
HLTDC0: CPI	6		;SEND LEADING SPACES
	JC	HLTDC01		;DONE?
	PUSH	PSW
	MVI	A,' '
	CALL	WRITEC		;SEND CHARACTER
	POP	PSW
	DCR	A
	JMP	HLTDC0		;LOOP UNTIL ALL SENT
	
HLTDC01:ADI	-5	;A=5-A
	MOV	B,A	; SUPRESS LEADING 0'S AS LONG AS B<0
	LXI	D,-10000
	CALL	HLTDC1	;SHOW CORRESPONDING DIGIT
	LXI	D,-1000
	CALL	HLTDC1
	LXI	D,-100
	CALL	HLTDC1
	LXI	D,-10Š	CALL	HLTDC1
	MOV	A,L		;GET UNITS
	ADI	'0'		;MAKE ASCII
	JMP	WRTC1		;SEND, POP REGISTERS AND RETURN  TO CALLER.
 

HLTDC1:	; COMPUTE CORRESPONDING POWER OF 10
	MVI	C,'0'-1
HLTDCLP:INR	C
	DAD	D	;
	JC	HLTDCLP
; IF TOO MANY SUBSTRACTS, CORRECT
	call	@deneg	;negate de	
	DAD	D
	MOV	A,C	; GET COUNT
	CPI	'1'
	JNC	NOTZERO
	INR	B	;CHECK ZERO FLAG
	RM		;RETURN IF SO
	RZ	
	MOV	A,B
	CPI	6	;FIRST SIGNIFICANT CHAR MET YET?
	MVI	a,'0'
	JNC	HLTDC3	;THEN PRINT THE ZERO
	MVI	A,' '	;PRINT A SPACE OTHERWISE
HLTDC3:	JMP	WRITEC	;SEND AND RETURN	
NOTZERO:MVI	B,10	;NO MORE SUPRESS
	JMP	WRITEC	;SEND AND RETURN TO CALLER

;--------------------------------------------------------------------
;
@DENEG:; ROUTINE TO NEGATE de
	PUSH	PSW

	MOV	A,d
	CMA		;COMPLEMENT d
	MOV	d,A

	MOV	A,e
	CMA		;COMPLEMENT e
	MOV	e,A

	INX	d	;DE=-de	
	POP	PSW

	RET 
;---------------------------------------------------------------------
OUTMANY:;ROUTINE TO SEND B TIMES CHARACTER IN A TO CONSOLE
	PUSH	B		;SAVE COUNT,REGISTER C
	MOV	C,A		;SAVE CHARACTER

OUTMLP:	MOV	A,B		;GET COUNT
	ORA	A		;SEE IF ZERO
	JZ	OUTEDM		;DONE IF  ZERO
	MOV	A,C		;CHAR IN AŠ	CALL	WRITEC		;WRITE IT
	DCR	B		;UPDATE COUNT
	JMP	OUTMLP		;KEEP LOOPING

OUTEDM:	POP	B
	RET

; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~ prints ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	PSTRING PRINTS CHARACTERS UNTIL A $ TERMINATOR LIKE CPM FUNCT 9
; 	EXCEPT IT LEAVES DE POINTING TO NEXT BYTE AFTER $ .  ALL OTHER
; 	REGS SAVED


PRINTS:	PUSH	PSW
	PUSH	B
	PUSH	H		; SAVE ALL  OTHER REGS

PRNTLP:	LDAX	D
	CPI	'$'		; CHECK FOR TERMINATOR
	JZ	PRTDUN		; DONE IF TERMINATOR

	LDA	MPFLAG		; GET FLAG
	ANI	04		; CHECK BIT 2
	LDAX	D		; GET CHARACTER TO PRINT
	JZ	SAYSP		; IF BIT 2 IS CLEAR THEN GO PRINT IT

	CPI	' '		; SEE IF NEXT CHARACTER IS A SPACE
	JNZ	SAYSP		; IF NOT GO PRINT IT

	MVI	A,'_'		; REPLACE (SPACE) WITH (UNDERLINE) CHARACTER
	JMP	PCHR1		; GO PRINT UNDERLINE CHARACTER

SAYSP:	CPI	LASTMAC		; COMPARE TO CHECK FOR MACRO
	JNC	PCHR		; too big, not a macro.

	ORA	A		; TEST LOWER RANGE
	JZ	NXTCHR		; SKIP NULLS.
	
	lda	graflg		; see if this is a graphics string
	ora	A		; TEST   
	jNz	pchr		; dont decode cause not mac CWM 		

        LDAX	D		; GET THE CHARACTER BACK,CLOD CWM 1-7
	CALL	DMAC		; GO DECODE MACRO
	JMP	NXTCHR		; LOOP FOR THE NEXT CHARACTER

PCHR:	ldax	d		; yes , get char once again 
pchr1	CALL	WRITEC		; SEND CHARACTER TO TERMINAL

; 	ENTER HERE IF CHARACTER WAS TERMINAL CODE

NXTCHR:	INX	D		; INCREMENT STRING POINTER
	JMP	PRNTLP		; CONTINUE

PRTDUN:	LDA	MPFLAG		; 
	ANI	11111011B	; 
	STA	MPFLAG		; RESET UNDERLINE BIT
	xra 	a
	sta	graflg		; reset graflgŠ	INX	D		; POINT TO CHAR AFTER THE TERM.
 	POP	H
	POP	B
	POP	PSW		; RESTORE MACHINE STATE
	RET

; ***************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ MACRO DECODER ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ***************************************************************************

;	ENTER WITH MACRO CHARACTER IN 'A'
;	SAVES ALL REGS

DMAC:	PUSHALL			;SAVE ALL REGISTERS

DMAC1:;ENTRY POINT FOR THOSE WHICH DO NOT WANT TO POP REGISTERS THEMSELVES

	MOV	B,A		; SAVE CHARACTER IN B
	LXI	H,MACTBL	; POINT TO TOP OF TRANSLATION TABLE

CHECK:	MOV	A,M		; GET CHARACTER FROM TABLE 
	CPI	'*'		; TEST FOR END OF LIST?
	JZ	SAYIT		; STORE AND PRINT IT

	CMP	B		; TEST FOR VALID CODE
	JZ	XLAT		; TRANSLATE IF FOUND

RPLOOP:	INX	H		; BUMP POINTER
	MOV	A,M		; GET CHARACTER
	CPI	'$'		; TEST FOR END OF STRING
	JNZ	RPLOOP		; SKIP OVER REPLACE STRING
	INX	H		; POINT PAST TERMINATOR
	JMP	CHECK		; GO CHECK NEXT CODE

SAYIT:	MOV	A,B		; RESTORE CHARACTER
	JMP	WRTC1


XLAT:	INX	H		; BUMP TABLE POINTER
	MOV	A,M		; PUT POINTER IN 'DE'

	ORA	A		; TEST FOR ZERO
	JZ	RSTALL		; TRANLATION DONE

	CPI	'$'		; TEST FOR END OF STRING
	JZ	RSTALL		; TRANSLATION DONE

 	CALL	WRITEC		; PRINT CHARACTER
	JMP	XLAT		; LOOP FOR NEXT BYTE


; ***********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ WRITE SUBROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~~~
; ***********************************************************************
Š; 	USES CPM BIOS TO SEND CHARACTER IN A TO CONSOLE
; 	INPUTS:   A REGISTER ASCII CHARACTER (OR OTHER) TO BE SENT
; 	OUTPUTS:  NONE, NO REGISTERS CHANGED

WRITEC:	PUSHALL

	;WRTC1 IS AN ENTRY POINT WHICH SEND CHAR THEN POP REGISTERS AND
	;RETURN TO CALLER

WRTC1:	MVI	C,TYPEF		; TYPE FUNCTION CALL
	MOV	E,A		; MOVE A INTO E SPOT FOR CALL
	CALL	BDOS		; MAKE TO CALL INTO DOS
	JMP	RSTALL		;RESTORE REG AND LEAVE

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~~ GET NEXT BYTE ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

;	RETURNS THE NEXT BYTE OF A FILE OPENED IN FCB IN THE A REG.
;  	IF CARRY SET THERE IS AN ERROR.

;	A HAS THE ERROR NUMBER 1 = END OF FILE / 2 = BAD READ

;  	LAST JMP TABLE ENTRY IS IBPPTR, THE ADDRESS OF IBP.
; 	THIS LOCATION SHOULD BE SET TO 80 BEFORE STARTING GNB.

; 	NO INPUT NEEDED, ALL REGISTERS SAVED

GNB:	PUSH	D
	PUSH	H

	LDA	IBP		; SAVE REGS AND BRING IN POINTER.
	CPI	080H		; HAVE WE FINISHED OFF A BUFFER?OR START
	JNZ	G0		; BUFFER STILL HAS DATA, GET IT

	CALL	DISKR		; EXHAUSTED BUFFER, READ ANOTHER
	JC	NOCANDO		; ERROR IN DISK READ, EXIT 

NOTFRST:XRA	A		; RESET BUFFER POINTER

; 	NOW READ THE BYTE AT BUFF+REG A

G0:	MOV	E,A		; SET UP 'DE' REG A AS 16 BIT POINTER
	MVI	D,0

	INR	A		; BUMP POINTER AND STORE BACK
	STA	IBP

	LXI	H,BUFF		; LOAD BASE BUFFER POINTER
	DAD	D		; ADD IN OFFSET, H HAS ADDRESS

	MOV	A,M		; BYTE IS IN ACCUM
	ORA	A		; CLEAR CARRY FLAG

NOCANDO:POP	HŠ	POP	D		; CARRY SET AND ERR NUMBER IN 'A' IF ERROR
	RET			; RESTORE AND EXIT

; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~ WRITE NEXT BYTE ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	FILLS BUFFER WITH WRITES THEN STORES OUT TO DISK.

;	INPUT = A, ALL REGS SAVED
;	ON ERROR, CODE IS RETURNED IN 'A'	-NOTE-   A DESTROYED

WNB:	PUSHALL			;SAVE ALL REGISTERS, PSW LAST

	LDA	OBP		; LOAD OUTPUT BUFFER POINTER
	CPI	80H		; BUFFER FULL? AT START
	JNZ	WR0		; OK, JUST STORE BYTE

	CALL	DISKW		; FULL, WRITE TO DISK
	JNZ	WNBERR		; ERROR RETURN

	XRA	A		; ZERO OFFSET POINTER

WR0:	MOV	E,A		; MAKE OFFSET TO 16 BIT NUM
	MVI	D,0

	INR	A		; BUMP OFFSET FOR NEXT TIME
	STA	OBP

	LXI	H,BUFF		; LOAD  BASE BUFFER ADRS
	DAD	D		; BASE + OFFSET

	POP	PSW		; GET DATA BACK IN
	MOV	M,A		; STORE IN BUFFER

	ORA	A		; NO ERRORS
	JMP	RSTREG		; POP OTHER REGISTERS

;------------------------------

WNBERR:	LXI	D,WRMSG		; 
	CALL	CLERR		; 
	jmp	FSP1		; show message and return to user

; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~  DISK WRITE FUNCTION ~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

;	write sector. return zf set if no error

DISKW:	pushreg

	LXI	D,FCB		; LOAD FCB ADDRESS
	MVI	C,WRITEF	; LOAD WITH WRITE FUNCTION NO.
	CALL	BDOS		; EXECUTE
	ora	a		; see if error
	jmp	rstreg

; ***********************************************************************
;   ~~~~~~~~~~~~~~~~~~ WRITE BYTES SEGMENT ROUTINE ~~~~~~~~~~~~~~~~~~~~
; ***********************************************************************
;
;major changes here on 4/17/84
;
; 	HL = ADRS OF DATA TO BE WRITTEN
; 	DE = BYTE COUNT(16 BITS)
; 	ALL REGS SAVED, CARRY SET ON ERROR RETURN

WRS:	PUSHreg
	push	psw		;save af

CHKLP:	MOV	A,D		; check if done.
	ORA	E
	JZ	endwrs		;DONWRS		; DONE WITH WRS

	MOV	A,M		; write byte pointed to by hl 
	CALL	WNB		; 
	JC	endwrs		;ERRWRS		; ERROR IF CARRY SET

	DCX	D		; BUMP COUNT DOWN
	INX	H		; BUMP POINTER UP
	JMP	CHKLP		; LOOP

	
;DONWRS:	ORA	A		; MAKE SURE CARRY FLAG CLEAR
;	JMP	ENDWRS		; 

;ERRWRS:	STC			; MAKE SURE CARRY SET

ENDWRS:	POP	d		;pop	psw
	mov	a,d		;get a back
	jmp	rstreg		;get other registers back

; ***********************************************************************
;   ~~~~~~~~~~~~~~~~~ CPM READ DISK SECTOR ROUTINE ~~~~~~~~~~~~~~~~~~~~
; ***********************************************************************

DISKR:	PUSHreg			;save registers

	LXI	D,FCB		; GET ADRS OF FILE CONTROL BLOCK
	MVI	C,READF		; GET FUNCTION FOR READ DISK
	CALL	BDOS		; INITIATE FUNCTION

	ora	a		;a=0 means ok
	jz	rstreg		;
	stc			;error
	jmp	rstreg

; ***********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ INCHNE ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ***********************************************************************

;	READS CONSOLE INTO A, BUT DOES NOT ECHO

; 	-NOTE- THIS ROUTINE IS SET UP FOR CPM 2.2, AND WILL NT WORK WITH
;	 REVISION 1.4.  FOR A 1.4 VERSION, CONTACT DASOFT

; 	INPUTS:  NONE
; 	OUTPUTS: A REG ASCII CHAR, NO REGS EXCEPT A CHANGED

NOECHO:	PUSHreg

; 	THE READ CHAR FROM CONSOLE WITHOUT ECHO IS IN THE BIOS
; 	FIRST CHECK STATUS AND WAIT FOR CHARACTER

CHKSTAT:MVI	C,6		; DIRECT CONSOLE I/O
	MVI	E,0FFH		; INPUT
	CALL	BDOS		; NOW CHAR IN A

	ORA	A
	JZ	CHKSTAT		; not ready if 0.

	cpi	'$'		;do not allow terminator
	jz	chkstat

	call	toupper		;make upper case
	jmp	rstreg

;-------------------------------------------
toupper:;makes char upper case if lower case

	cpi	'a'
	rc			;too small
	cpi	'z'+1
	rnc			;too big
	adi	'A'-'a'		;convert to upper case
	ret 

; *************************************************************************
;    ~~~~~~~~~~~~~~~~~~~~~~~ FULL SCREEN PACKAGE ~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	ENTRY1  PRINTS COMMAND LINE ONLY
; 	ENTRY2  BUILDS TRACK FROM SCB AND EDITS
; 	ENTRY3  UPDATES DATA FIELDS VIA TRACK ONLY

; 	INPUTS: 'DE' point to SCREEN CONTROL BLOCK (SCB)
; 	OUTPUTS:'HL' point to COMMAND INPUT BUFFER
; 	CARRY SET if 'Q' was exit character

FSCRN0:	PUSH	B		; ENTRY SNEAK IN NO SETUP
	PUSH	D		; FOR USE NEW CMD LINE AFTER START
	JMP	FSCRN1B		; ISSUE NEW CMD AND START EDIT

; 	ENTRY PRINT COMMAND LINE AND EDIT

FSCRN1:	PUSH	B		; 
	PUSH	D		; OTHER REGS CHANGED

	XCHG			; MOVE D,E TO H,L
	SHLD	FLDBGN		; SAVE START FIELD ADRS SCB
	XCHG			; PUT THEM BACK

	XRA	A		; CLEAR ACCUMULATOR
	STA	LASTFLD		; ONLY CMD FIELD IF ENTERED HERE

FSCRN1B:XRA	A		; AN INTERNAL ENTRY POINT, CLEAR 'A'
	STA	CURFLD		; CURRENT FIELD IS ZERO
	STA	XPOINT		; ADDRESS CURSOR AT 0,0
	STA	YPOINT
 
	LXI	D,XPOINT	; POINT  D,E TO CURSOR LOCATION
	CALL 	CURPOS		; POSITION CURSOR 0,0

	LXI	D,CMDLN		; POINT D,E TO C
	CALL	PRINTS		; PRINT COMMAND LINE

	LXI	D,CMDCTL	; POINT TO CMD LINE TRACK

	LXI	H,CMDBFR	; POINT TO DATA BUFFER
	MOV	A,M		; GET FIRST BYTE IN BUFFER
	CPI	' '		; CHECK IF EMPTY  
	JZ	LISTEN		; LINE CLEAR, GO TO INPUT STAGE

CLRIT:	CALL	CLRBFR		; CLEAR OUT BUFFER UNTIL $
	JMP	LISTEN		; GO TO COMMAND INTERPRETER
Š; 	FSCRN2 ENTRY POINT BUILDS FULL FIELDS AND EDITS

FSCRN2:	PUSH	B
	PUSH	D		; SAVE THESE REGS AS USUAL

	XCHG			; EXCHANGE 'DE' WITH 'HL'
	SHLD	FLDBGN		; SAVE FIELD START

; 	START BUILDING SCREEN TRACKING FIELD 25 ENTRIES MAX
; 	'HL' POINTS TO SCB 

	MOV	E,M		; GET LOW ADRS DATA BLOCK
	INX	H		; POINT TO HIGH ADRS
	MOV	D,M		; GET HIGH ADRS DATA BLOCK
	INX	H		; POINT PAST ADDRESS TO START OF SCB
	XCHG			; NOW (D = SCB / H = DATA) OK.

	XRA	A		; CLEAR ACCUM
	STA	CURFLD
	STA	LASTFLD		; MAKE SURE COUNTERS INITIALIZED

	LXI	B,TRKFLD	; B POINTS TO TRACK FIELD

; 	START BUILDING

SCBLD:	LDAX	D		; GET FIRST SCB FILE DATA
	CPI	0FFH		; CHECK FOR END OF FILE
	JZ	FSCRN1B		; FINISHED BUILDING FILE

; 	FIRST CHECK PROMPT FIELD FOR COMMENT SPECIFICATION

	INX	D
	INX	D		; MOVE  POINTER TO PROMPT COUNTER

	LDAX	D		; BRING IN COUNTER
	CPI	0FFH		; FLAG MEANS NO DATA, ONLY COMMENT 
	JZ	NOBLD		; NO SCREEN ENTRY FOR THIS ONE

	DCX	D
	DCX	D		; PUT D BACK TO WHERE IT WAS AT START

; 	IF NOT FF, D,E POINTS TO XY COORD OF PROMPT FOR FIELD

	CALL	CURPOS

	LDAX	D		; GET THE X COORD INTO ACCUM

	INX	D
	INX	D		; POINT BACK TO PROMPT COUNT AGAIN

	PUSH	B		; GET B OUT OF WAY FOR MORE ROOM

	MOV	B,A		; SAVE X COORD
	LDAX	D		; GET NUMBER OF PROMPT CHARS
	ADD	B		; ADD X+PROMPT = DATA COORDŠ
	POP	B		; GET TRACKING ADRS BACK

	STAX	B		; STORE DATA FIELD X COORD IN TRACK

	INX	B		; BUMP POINTER
	DCX	D		; POINT BACK TO Y COORDINATE

	LDAX	D		; BRING Y IN
	STAX	B		; STORE Y COORD OF DATA IN TRACKING

	INX	B		; BUMP POINTER

; 	NOW STORE THE DATA ADDRESS TO GO WITH THE XY COORDINATE

	MOV	A,L		; STORING H AND L INTEL STYLE  AT B
	STAX	B
	INX	B		; STORED LOW BYTE ADDRESS IN TRACK
	MOV	A,H
	STAX	B
	INX	B		; STORED HIGH ADRS AND BUMPED POINTER

; 	NOW PRINT PROMPT AND DATA FIELDS AND UPDATE ALL POINTERS

	INX	D
	INX	D		; POINT TO FIRST CHAR OF PROMPT STRING
	CALL	PRINTS		; PRINT IT, D NOW POINTS TO NEXT SCB

	XCHG			; D NOW POINTS TO DATA ADDRESS

	LDA	MPFLAG		; 
	ORI	00000100B	; SET BIT 2, REPACE 20H WITH 5FH ON PRINT
	STA 	MPFLAG		; 

	CALL	PRINTS		; PRINT DATA, D NOW POINTS TO NEXT DATA
	XCHG			; NORMAL. D=SCB,H=DATA,B=TRACK

	LDA	LASTFLD		; BUMP NUMBER OF FIELDS POINTER
	INR	A
	STA	LASTFLD

	JMP	SCBLD		; ALL UPDATES COMPLETE, DO NEXT SCB

NOBLD:	DCX	D
	DCX	D		; FIRST POINT BACK TO XY
	CALL	CURPOS		; POSTION CURSOR FOR FIELD

	INX	D
	INX	D
	INX	D		; NOW POINT TO DATA ADDRESS
	CALL	PRINTS		; PRINT IT, D POINTS TO NEXT SCB

	JMP	SCBLD		; DATA FIELDS, TRACKS UNAFFECTED

; 	FSCRN3 ENTRY JUST REPRINTS DATA FIELDS FROM BUILT TRACKSŠ
FSCRN3:	PUSH	B
	PUSH	D		; STORE AS USUAL, BUT NO ENTRY PARMS

	LDA	LASTFLD		; FIND OUT HOW MANY TO DO
	MOV	C,A		; C IS NOW COUNTER

	LXI	D,TRKFLD	; POINT TO TRACKS

	ORA	A		; CHECK LASTFLD FOR ZERO
	JZ	FSCRN1B		; NO DATA TO PRINT IF ZERO

DATAF:	CALL	CURPOS		; D POINTS TO DATA XY IN TRACK

	INX	D
	INX	D		; NOW POINT TO DATA ADDRESS IN TRACK
	LDAX	D		; GET ADDRESS LOW BYTE
	MOV	L,A		; PUT IN HL
	INX	D		; POINT TO HIGH BYTE
	LDAX	D		; GET HI BYTE
	MOV	H,A		; NOW HL IS DATA ADDRESS	

	XCHG
	LDA	MPFLAG		; 
	ORI	00000100B	; SET BIT 2, UNDERLINE FLAG
	STA	MPFLAG		; UNDERLINE
	CALL	PRINTS		; PRINT DATA
	XCHG			; NOW BACK TO NORMAL

	INX	D		; POINT D TO NEXT TRACK FIELD
	DCR	C

	JZ	FSCRN1B		; WHEN CONTER ZEROES, END

	JMP	DATAF		; CONTINUE LOOP

; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~ COMMAND INPUT PROCESSOR ~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

;	LISTEN IS THE COMMAND INPUT PROCESSOR.
; 	SCROLL KEYS DEFINED ABOVE IN BIOS
; 	AT ENTRY, D = TRACKING / H = DATA ADRS / B = DONT CARE

LISTEN:	LDA	ESCFLAG		; CHECK IF ESCAPE SEQ. WANTED
	ORA	A		; 
	JZ	NOESC		; TWO-BYTE SEQUENCE NO GO

	CALL	NOECHO		; WANTED, GET ESC CHARACTER

	MOV	B,A		; PUT IN B FOR USE
	CPI	1BH		; MAKE SURE IT WAS AN ESCAPE
	JNZ	RETCHK		; NO ESCAPE, REGULAR CHAR ENTRY

NOESC:	CALL	NOECHO		; NOW GET BYTE AFTER ESCAPEŠ
CHKCHAR:MOV	B,A

	LDA	SCRLUP		; COMPARE TO SCROLL UP COMMAND
	CMP	B
	JZ	SCUP		; BRANCH TO COMMAND IF MATCH

	LDA	SCRLDN		; COMPARE SCROLL DOWN
	CMP	B
	JZ	SCDN

	LDA	HOME		; COMPARE TO HOME TO CMD LINE
	CMP	B
	JZ	SCHOME

	LDA	DELETE
	CMP	B
	JZ	DEL

	LDA	CHARDEL		; BACKSPACE?
	CMP	B
	JZ	BKSPAC

RETCHK:	MOV	A,B		; PUT CHARACTER BACK

	CPI	' '		; CHECK IF SPACE
	JZ	SPACE

	CPI	CR		; CHECK FOR CARRIAGE RETURN
	JZ	RETURN	

	MOV	B,A		; SAVE CHARACTER

	MOV	A,M		; GET CURRENT BUFFER CHARACTER
	CPI	'$'		; ARE WE AT END OF BUFFER?

	MOV	A,B		; RETURN CHARACTER

	JZ	SCDN		; SCROLL TO NEXT FIELD
        CPI     ' '             ; CHECK FOR NON PRINT CHAR CWM
        JC      LISTEN          ; IGNORE IT AND GET NEXT CHAR
        CPI     7FH             ; CHECK FOR DEL
        JZ      LISTEN          ; IGNORE ALIEN ORDERS                 
ECHO:	MOV	A,B		; GET CHARACTER BACK
	CALL	WRITEC		; ECHO IT TO TERMINAL

	MOV	M,A		; STORE IN DATA BUFFER

	INX	H		; BUMP BUFFER POINTER

TP1:	LDA	MPFLAG		; 
	ANI	010B		; BIT 2 SET = SINGLE CHARACTER COMMAND INPUT
	JNZ	RETURN		; 

	JMP	LISTEN		; GET ANOTHER CHARACTER

; *************************************************************************
;   ~~~~~~~~~~~  SYSTEM ROUTINES CALLED BY SPECIAL CHARACTERS ~~~~~~~~~~~Š; *************************************************************************

BKSPAC:	DCX	H		; BACK POINTER UP 1

	MOV	A,M		; GET CHARACTER

	INX	H		; PUT IT BACK TO LAST PLACE

	CPI	'$'		; A FILE MARKER?
	JZ	LISTEN		; JUST STOP AND IGNORE IT

	DCX	H		; OK TO BACK UP
	MVI	A,' '		; 
	MOV	M,A		; 

	PUSH	D		; SAVE 'DE'

	LXI	D,TBS		; TERMINAL BACKSPACE STRING
	CALL	PRINTS		; SEND STRING TO TERMINAL

	POP	D		; RESTORE 'DE'
	JMP	LISTEN

; ~~~~~~~~~~~~~~~~~~~~~~~~~~ return ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RETURN:	LDA	MPFLAG		; 
TP2:	ANI	00000001B	; BIT 1 SET MEANS RETURN ON (RETURN) KEY
	LXI	H,CMDBFR	; POINT TO COMMAND BUFFER
	JNZ	RETURN3		; SINGLE CHARACTER EXIT

RETURN2:LDA	CURFLD		; NORMAL EXIT
	ORA	A		; SET FLAGS ON FIELD NUMBER
	JNZ	SCDN		; IF NONZERO, JUST SCROLL DOWN

	MOV	A,M		; BRING IN FIRST CHARACTER
	CPI	' '		; IF SPACE, NO COMMAND, SCRLDN
	JZ 	SCDN	

RETURN3:MOV	A,M		; GET CHARACTER
	CPI	qtcmd		; CHECK IF QUIT COMMAND
	JZ	EXIT1		; QUIT SO SET SPECIAL FLAG

	LDA	ERRFLG		; DEFINATELY EXITING, CHECK ERR FLD
	ORA 	A		; IF SET, AN ERROR IS ON SCREEN
	CNZ	CLERR		; CLEAR OUT THE SCREEN PART

EXIT0:	LDA	MPFLAG		; GET IT
	ANI	11111000B	; RESET IT
	STA	MPFLAG		; STORE IT

	ORA	A		; CLEAR CARRY, NOT Q EXITING

EXITL:	POP	D
	POP	B		; BRING BACK REGS
	RET			; EXIT FULL SCREEN PACKAGEŠ
EXIT1:	INX	H		; CHECK Q AND ONLY Q
	MOV	A,M
	DCX	H		; PUT H BACK WHERE IT BELONGS
	CPI	' '		; Q FOLLOWED BY SPACE
	JNZ	EXIT0

	LDA	MPFLAG		; GET IT
	ANI	01111000B	; RESET IT
	STA	MPFLAG		; STORE IT

	STC			; Q EXITING, SET CARRY
	JMP	EXITL		; 

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ space ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SPACE:	MOV	B,M		; IF SPACE, ECHO OLD LETTER
	MOV	A,M

	CPI	'$'		; MOVING TO END OF FIELD?
	JZ	SCDN		; YES, SCROLL

	JMP	ECHO		; SAME AS CURSOR RIGHT

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ delete ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; 	DELETE CLEARS THE BUFFER D POINTS TO XY OF BUFFER IN TRACK

DEL:	PUSH	PSW
	PUSH	D		; SAVE SOME REGS
	PUSH	D		; SAVE IT TWICE FOR REFERENCE

	XRA	A		; CLEAR ACCUM
	STA	XPOINT
	STA	YPOINT		; MAKE SURE COORD ZEROED

	LXI	D,XPOINT	; NEED TO CONVINCE CURSOR HAS CHANGED
	CALL	CURPOS	

	POP	D
	CALL	CURPOS		; POINT BACK TO START OF DATA FLD

	CALL	FETCHHL		; GET ADDRESS OF DATA IN HL

	CALL	CLRBFR		; CLEAR BUFFER HL UNTIL $

	POP	D
	POP	PSW
	JMP	LISTEN		; GO BACK TO COMMAND PROCESSING

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ fetchhl ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FETCHHL:PUSH	D
	INX	D		; D ONLY IMPORTANT, A DESTROYT
	INX	D		; POINT D TO ADDRS OF DATAŠ
	LDAX	D		; GET LOW BYTE
	MOV	L,A		; PUT IN L
	INX	D		; GET HIGH ADDRESS BYTE
	LDAX	D
	MOV	H,A		; NOW ADDRESS IN H,L

	POP	D		; RESTORE ADDRS TO TRACKING XY
	RET

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~ clear buffer ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CLRBFR:	PUSH	H		; H ONLY IMPORTANT, A DESTROYT
CLRB1:	MOV	A,M		; PULL IN CHAR FROM BUFFER
	CPI	'$'		; END OF BUFFER?
	JZ	CLRB2		; YES, END IT ALL

	MVI	A,'_'
	CALL	WRITEC		; CLEAR THE SCREEN

	MVI	A,' '		; JUST TO MAKE SURE
	MOV	M,A		; CLEAR THE BUFFER

	INX	H		; POINT TO NEXT LOCATION
	JMP	CLRB1

CLRB2:	CALL	CURPOS		; POINT  CURSOR BACK TO START
	POP	H		; POINT ADRS PNTR BACK TO START
	RET			; GOODBYE CRUEL  WORLD

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ schome ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; 	SCROLL HOME TO COMMAND LINE

SCHOME:	LXI	D,CMDCTL	; POINT TO COMMAND LINE
	LXI	H,CMDBFR	; WE KNOW WHERE THIS ONE IS

	XRA	A		; CLEAR ACCUM
	STA	CURFLD		; SET CORRECT FIELD NUMBER

	CALL	CURPOS		; POSTION CURSOR TO CMD LINE
	JMP	LISTEN		; RETURN TO CMD PROCESSING

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ scdn ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SCDN:	LDA	CURFLD		; CHECK FOR LAST FIELD
	LXI	H,LASTFLD	; GOING TO COMPARE AGAINST MAX
	CMP	M		; COMPARE  CURRENT TO MAX
	JZ 	SCHOME		; IF SO, SCROLL TO TOP

	INX	D
	INX	D
	INX	D		; POINT DOWN FOR
	INX	D		; TO NEXT TRACKING FIELD
Š	LDA	CURFLD		; UPDATE FIELD NUMBER
	INR	A
	STA	CURFLD		; DOWN IS POSITIVE

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ update ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UPDATE:	CALL	CURPOS		; REPOSITION CURSOR
	CALL	FETCHHL		; GET DATA ADDRESS
	JMP	LISTEN		; RETURN TO PROCESSING

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ scup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SCUP:	LDA	CURFLD		; CHECK FOR  TOP OR NEXT TO TOP
	ORA	A		; SET FLAGS ZERO IS TOP FIELD
	JZ	BOTTOM		; SCROLL TO LAST FIELD

	CPI	1		; NEXT TO TOP?
	JZ	SCHOME		; GO TO COMMAND LINE

	DCX	D
	DCX	D		; GO UP FOUR TO NEXT TRACK FLD
	DCX	D
	DCX	D		; NOW POINTING AT NEW XY

	LDA	CURFLD
	DCR	A		; UP IS NEGATIVE
	STA	CURFLD
	JMP	UPDATE		; FINISH IT OFF

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ bottom ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BOTTOM:	LDA	LASTFLD		; GET NUMBER OF FIELDS IN TRACK
	STA	CURFLD		; NUMBER OF FIELD GOING TO

	RLC			; MULTIPLY BY FOUR (BYTES/TRACINIG)
	RLC
	MOV	E,A		; DE FORMS OFFSET FROM START OF TRAK
	MVI	D,0
	LXI	H,CMDCTL	; POINT TO START OF TRAK FIELD
	DAD	D		; NOW SHOULD BE ADDRES OF LAST TRAK
	XCHG			; D=TRACKING

	CALL	CURPOS		; MOVE TO XY LOC
	CALL	FETCHHL		; D=TRACK	H=DATA ADRS
	JMP	LISTEN		; RETURN TO PROCESSING

; **************************************************************************
;   ~~~~~~~~~~~~~~~~ FULL SCREEN ERROR DISPLAY ROUTINE ~~~~~~~~~~~~~~~~~~~
; **************************************************************************

;	THIS ACTUALLY CONCLUDES FULL SCREEN MODE EXCEPT FOR ERROR
; 	REPORTING SUBROUTINES. FSERR PRINTS UP TO 32 CHARS IN TOP
;	LEFT OF SCREEN STARTING AT MIDSCREEN. WHEN A COMMAND IS
; 	ENTERED, THIS FIELD IS ERASED.
; 	DE POINTS TO STRING TO BE PRINTED, ALL REGS SAVEDŠ
FSPERR:	pushall

fsp1:	LDA	SCREENX		; GET USER'S SCREEN WIDTH
	RAR			; DIVIDE BY 2, HOPE CARRY WAS CLEAR
	ANI	7fH		; MAKE SURE NOTHING SHIFTED IN FROM C
	STA	XPOINT		; TEMP LOCATION
	XRA	A		; CLEAR ACCUM
	STA	YPOINT		; LINE ZERO

	PUSH	D		; SAVE STRING POINTER AGAIN
	LXI	D,XPOINT	; POINT TO XY
	CALL	CURPOS		; POSTION CURSOR

	POP	D		; RESTORE STRING POINTER
	CALL	PRINTS		; PRINT STRING

	MVI	A,1		; SET ERROR FLAG

	STA	ERRFLG

	jmp	rstall

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~ CLEAR ERROR ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

CLERR:	pushall

	LXI	D,CLERMSG	;
	CALL	PRINTS		; CLEAR SECOND LINE TOO!

	LDA	SCREENX		; GET HALF SCREEN LOCATION
	RAR			; BY DIVIDING BY 2
	ANI	7FH		; MAKE SURE C WAS CLR
	STA	XPOINT
	XRA	A		; CLEAR ACCUM
	STA	YPOINT		; LINE ZERO

	LXI	D,XPOINT	; POINT D TO XY
	CALL	CURPOS		; POSITION CURSOR

	XRA	A		; CLEAR ACCUM
	STA	ERRFLG		; RESET EROR FLAG

	LDA	XPOINT		; GET HALF SCREEN WIDTHŠ	MOV	C,A		; NUMBER OF CHARS TO CLEAR   *LMH,(WAS 39)
	MVI	A,' '		; CLEAR WITH SPACES

CLERR1:	DCR	C		; BUMP COUNTER
	cnz	writec		; writec preserves psw
	Jnz	CLERR1		; if not done.
;-------------------------------
RSTALL:;ROUTINE TO RESTORE ALL REGISTERS AFTER A PUSHALL
	POP	PSW
RSTREG:;ROUTINE TO RESTORE ALL REGISTERS BUT PSW AND RETURN TO CALLER
	POPREG			;POP REGISTER PAIRS
	RET			;AND RETURN 
;-------------------------------


;			------------------------------
;			          NOW KERNAL
;			------------------------------

; *************************************************************************
;   ~~~~~~~~~~~~~~~~ COMMAND RECOGNITION ROUTINE  ~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	COMMACH MATCHES THE NAME POINTED TO BY THE HL REGISTER
; 	AGAINST POSSIBLE COMMANDS AND JUMPS(CLEARING STACK)
; 	IF A MATCH FOUND. IF NOT FOUND, RETURNS, A,D,DESTROYED

COMMACH:PUSH	H		; SAVE POINTER
COMM2:	LDAX	D		; DE POINTS TO next COMMAND TO MATCH
	CPI	'$'		; HAVE WE FINISHED MATCH?
	JZ	COMM3		; YES, FULL MATCH FOUND

	CPI	'*'		; END OF COMMAND LIST?
	JZ	COMM6		; NO MATCH, RETURN

	CMP	M		; NO, COMPARE WITH POINTER DATA
	JNZ	COMM4		; NO MATCH, INCRIMENT TO NEXT COMMAND

	INX	D		; MATCH HERE, CHECK NEXT BYTE
	INX	H		; BUMP BOTH POINTERS
	JMP	COMM2

COMM3:	INX	D		; POINT AFTER TERMINATOR
	LDAX	D		; BRING IN FIRST OF ADDRESS
	MOV	L,A
	INX	D
	LDAX	D
	MOV	H,A		; HL NOW HAS THE FULL ADDRESS FOR JUMP

	POP	B		; CLEAR PUSHED H
	POP	B		; CLEAR SUBROUTINE RETURN
	PCHL			; JUMP TO HL ADDRESS

COMM4:	LDAX	D		; GET NEXT CHARACTER
	CPI	'$'		; END OF STRING?
	INX	D		; bump pointer
	JNZ	COMM4

;here d point to first byte of address.

	INX	D		; DE = ADRS HI
	INX	D		; DE = NEXT COMMAND

	POP	H		; GET BACK ADDRESS OF INPUT STRING
	PUSH	H		; 
	JMP	COMM2		; SEARCH 'TIL DONE

COMM6:	POP	H		;
	RET

; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ PROGRAM DRIVE SELECTION ~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

PDRIVE:	CALL	GTNUDRV
	JMP	SELDSK
PDRIV1:	call	gtnudrv		; go get new drive info
        JMP	SELECT		; select drives and return to caller.

gtnudrv:CALL	CLRSCRN		; CLEAR SCREEN

PDRIVE2:LXI	D,PDRVM		; POINT TO PROGRAM DRIVE QUESTION

	LDA	MPFLAG		; 
	ORI	01110011B	; BIT 1 = RETURN ON <CR>
;				  BIT 2 = SINGLE CHARACTER INPUT
	STA	MPFLAG		; SET FLAG
	CALL	FSCRN2		; GET RESPONSE
TP3:
	MOV	A,M		; GET SELECTION BACK
	CPI	' '		; RETURN YEILDS CURRENT DRIVE    
	JZ	DDRIVE		; GET DEFAULT DATA DRIVE

	CPI	'A'		; => 'A'?
	JC	RCERR		; < 'A' = ERROR

RC2:	CPI	'P'		; <= 'P'?
	JNC	RCERR		; > 'P' = ERROR
SPD:	STA	PDRV		; PUT IN PrOGRAM DRIVE STORAGE SPACE
	STA	DPD		; PUT IN MAIN MENU SCB

DDRIVE:	CALL	CLRSCRN		; CLEAR SCREEN
DDRIVE2:LXI	D,DDRVM		; POINT TO DATA DRIVE MESSAGE

	LDA	MPFLAG		; 
	ORI	01110011B	; BIT 1 = RETURN ON <CR>
;				  BIT 2 = SINGLE CHARACTER INPUT
	STA	MPFLAG		; SET FLAG

	CALL	FSCRN2		; GET RESPONSE
TP4:
	MOV	A,M		; GET SELECTION BACK
	CPI	' '		; RETURN YEILDS CURRENT DRIVE    
	JZ	SELECT		; SET DRIVE

	LDA	MPFLAG		; 
	ORI	01110001B	; BIT 1 = SECOND PART OF DRIVE SELECTION
	STA	MPFLAG		; SET FLAG

	MOV	A,M		; GET SELECTION BACK
	CPI	'A'		; SEE IF IT'S => 'A'
	JNC	RC3		; IF => 'A' THEN CHECK UPPER RANGE
	JMP	RCERR		; LESS THAN 'A' - ERROR

RC3:	CPI	'P'		; SEE IF IT'S <= 'P'
	JNC	RCERR		; IF > 'P' THEN - ERROR
	STA	DDRV		; PUT IN POGRAM DRIVE STORAGE SPACE
	STA	DDD		; PUT IN MAIN MENU SCB
	STA	DFTDR		; SET IN DEFAULT MESSAGEŠ	ret			; make this a sub return point

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SELECT A DRIVE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT:	MVI	C,14		; SELECT DISK FUNCTION CODE
	LDA	PDRV		; 
	DCR	A		; 
	ANI	0FH		; 
	MOV	E,A		; NOW LOG DEFAULT PROGRAM DRIVE
	CALL	BDOS		; 
	XRA	A		; SET FCBDN TO 0 FOR DEFAULT DRIVE
	STA	FCBDN		; MAKE SURE FCB IS UP TO DATE
        RET  

; *************************************************************************
;    ~~~~~~~~~~~~~~~~~~~~~~~~ KERNAL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

KERNAL:	LHLD	TOPPTR		; POINTER FOR STACK
	dcr	h		; leave some room. (god knows what for)
	SPHL			; SET STACK.

	XRA	A		; 
	STA	MPFLAG		; CLEAR MPFLAG HOB TO SAY WARM START

; 	MAKE SURE ALL DISKS OK TO GO

	LDA	PDRV		; GET PROGRAM DRIVE STORAGE
	STA	DPD		; STORE IN MENU

	LDA	DDRV		; GET DEFAULT DATA DRIVE STORAGE
	STA	DDD		; STORE IN MENU

	MVI	C,13		; RESET DISK SYSTEM FUNCTION CODE
	CALL	BDOS		;

;select drives

SELDSK:	CALL    SELECT
;
; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~ MAIN MENU LOOP ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

INSCRN0:CALL	CLRSCRN		; CLEAR SCREEN AND GO!!
	LXI	D,VERSION
	CALL	FSPERR		; PRINT VERSION NUMBER

INSCRN:	MVI	A,010B		; SINGLE CHARACTER RESPONSE
	STA	MPFLAG		; MULTI-PURPOSE FLAG

	LXI	D,TLC		; POINT TO TOP LEFT CORNER
	CALL	CURSOR		; PUT CURSOR THERE

	MVI	A,OMOS22	; GET OFFSET
	STA	MREC		; PUT IN STORAGE
	MVI	B,22		; GET PAGE POINTER FOR MAIN MENU
	CALL	MSGMKR		; GO DISPLAY PAGE

	LXI	D,RSCB1		; POINT D TO THE SCB
	CALL	FSCRN2		; NORMAL SCREEN ENTRY POINT
INCHEX:	JC	QUIT1		; IF Q EXIT JUMP TO FINAL,CPM

; 	NOW FOR COMMAND RECOGNITION

	LXI	D,CMDLIST
	CALL	COMMACH
	call	complain	;to user about his/her sloppiness
	jmp	inscrn		;and try again.
;------------------------
;complain to user.
;-----------------------
complain:mvi	a,beep
	jmp	writec		;send then return to user.

;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ quit1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

QUIT1:	CALL	CLRSCRN		; 
	LXI	D,TRMUNI	; POINT TO TERMINAL DE-INIT
	CALL	PRINTS		; 
	JMP	WBOOT		; CLEAR GARBAGE AND GO TO CPM

;  ~~~~~~~~~~~~~~~~~~~~~~~~ recog,perr ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RECOG:	LXI	D,ERRM1		; just beep.
PERR:	PUSH	D		; 
	LDA	DSPERFN		; GET DISPLAY ERROR FILE NAME FLAG
	ORA	A		; TEST FOR ZERO
	JZ	PERR1		; SKIP DISPLAY IF NOT SET

	LXI	D,ERFILEM	; POINT TO "FILE : "
	CALL	FSPERR		; DISPLAY IT
	CALL	PERFN		; SAY WHICH FILE
	lxi	d,ntfound$	; finish message
	call	prints
PERR1:	POP	D		; 
	CALL	CLERR		; 
	CALL	FSPERR		; CALL ERROR ROUTINE
	XRA	A		; CLEAR 'A'
	STA	FCB		; SELECT PROGRAM DRIVE
	JMP	HEDR2		; LEAVE ERROR MESAGE ON SCREEN

;--------------------------------
;shows file name. no drive shown
;--------------------------------

perfn:	PUSHall

	LXI	H,FCB+1		; POINT TO file name
	MVI	B,8		; SET COUNTER
	CALL	FCBLP		; PRINT FILENAME

	MVI	A,'.'		; 
	CALL	WRITEc		; 

	LXI	H,FCBft		; POINT TO file type
	MVI	B,3		; SET UP COUNTER
	CALL	FCBLP		; 
	jmp	rstall

FCBLP:	MOV	A,M		; 
	CPI	' '		; TEST FOR SPACE
	RZ			; IF SPACE THEN DOT HERE

	CALL	WRITEc		; PRINT IT
	INX	H		; BUMP POINTER
	DCR	B		; DECRIMENT FILENAME LENGTH COUNTER
	RZ			; END OF NAME
	JMP	FCBLP		; LOOP THROUGH FILENAME

;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ hedr ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; 	NOW IF INSTALLATION ROUTINE BOMBED, EXIT ALL THE WAY

HEDR:	CALL	CLRSCRN
HEDR2:	LDA	MPFLAG		; IF INSTALLATION BOMBED EXIT ALL THE WAY
	RLC			; 
	JC	WBOOT		; 
	JMP	INSCRN		; LOOP  FOR NEW INPUT

;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ rcerr ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RCERR:	STA	RCMSG+1		; PUT CHARACTER IN ERROR MESSAGE
	LXI	D,RCMSG		; POINT TO OUT OF RANGE MESSAGE
	CALL	FSPERR		; CALL ERROR ROUTINE
	LDA	MPFLAG		; GET MPFLAG TO DETERMINE WHERE...
	ANI	00000001B	; ...TO RETURN TOŠ	JNZ	DDRIVE2		; 1 MEANS DATA DRIVE SELECTION
	JMP	PDRIVE2		; 0 MEANS PROGRAM DRIVE SELECTION

;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ failed  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ERROR:	XRA	A		; CLEAR 'A'
	STA	MREC		; RESET RECORD POINTER

	LDA	TDRV		; GET DRIVE WE WERE WORKING ON
	STA	FCB		; RESET DRIVE

	LXI	D,MSERR		; POINT TO OVERLAY FILE ERROR MESSAGE
	CALL	CLERR		; 
	CALL	FSPERR		; DISPLAY MESSAGE

	pop	psw		;get psw back
	stc			;indicate error
	jmp	rstreg		;get other registers back

; **************************************************************************
;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ help ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

HELP:	CALL	HELP1		; dasoft entry point
	JC	HEDR2		; ERROR exit
	JMP	HEDR		; normal exit

;	EXTERNAL ENTRY

HELP1:	MVI	B,0		; POINT TO MESAGE MENU
	CALL	MSGMKR		; DISPLAY MENU, PAGE #0
	RC			; ERROR exit

HELP2:	CALL	NOECHO		; WAIT FOR CHARACTER
HECHR:	CPI	qtcmd		; HELP EXIT TEST CHARACTER, DONE?
 	RZ			; EXIT ON 'X'

	CPI	'A'		; LOWER RANGE
	JNC	HELP3		; 
	JMP	HELP2		; 	

HELP3:	CPI	'P'		; UPPER RANGE
	JNC	HELP2		; 

	CALL	WRITEC		; DISPLAY CHOICE
	ANI	0FH		; STRIP ASCII OFF
	MOV	B,A		; PUT PAGE NUMBER IN 'B'

	DCR	A		; 
	LXI	H,OMOS		; POINT TO OMOS TABLE

	ADD	L		; ADD OFFSET INTO TABLEŠ	MOV	L,A		; SET POINTER

	MOV	A,M		; GET OFFSET FROM TABLE
	STA	MREC		; SET RECORD OFFSET

	CALL	MSGMKR2		; DISPLAY ENTERED PAGE
	CALL	NOECHO		; WAIT FOR CHARACTER
	JMP	HELP1		; LOOP TO PAGE #0

;		OVERLAY FILE MESSAGE OFFSETS:

OMOS	DB	04,10,17,24,31,36,38,40,42,44,46,48,50,52,54,56



; **************************************************************************
;    ~~~~~~~~~~~~~~~~~~~~~~~~~ LOAD MODULES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

; 	OVERLAY LOADERS LOAD OTHER RDRL PROGRAMS .
; 	FOLLOWED BY DISK READ/WRITE MODULES FOR CPM.
; 	THESE PROBABLY SHOULD NOT NEED CHANGING.

LOAD1:	LXI	H,NAME1
	jmp	loadw1
LOAD2:

; 	WE NEED ANOTHER QUESTION HERE

	CALL	CLRSCRN

	LXI	D,LOADQ		; WHICH TO LOAD QUESTION
	CALL	CLERR
	CALL	FSPERR

	LDA	MPFLAG		; 
	ORI	00000011B	; 
	STA	MPFLAG		; 

	CALL	FSCRN1
	JC	RDRL

	MOV	A,M		; GET RESPONSE
	CPI	'W'
	JZ	LOADW

	LXI	H,NAME2		; WANT NETLIST
	JMP	LOADW1

LOADW:	LXI	H,NAMEW
LOADW1:	LXI	D,START1		; LOADS ADDRESS 
	JMP	LDCMD

LOAD3:	LXI	H,NAME3
	JMP	LOADW1

LOAD4:	LXI	H,NAME4Š	JMP	LOADW1

LOAD5:	LXI	H,NAME5
	JMP	LOADW1

LOAD6:	LXI	H,NAME6
	JMP	LOADW1

LOAD7:	LXI	H,NAME7
	JMP	LOADW1

; LOAD8:LXI	H,NAME8
;	LXI	D,START4
;	JMP	LDCMD

LOAD9:	LXI	H,NAME9			; H = NAME OF FIL  TO BE OPENED
	JMP	LOADW1

INSTALL:LXI	H,INSNAM
	JMP	LOADW1

RUN1:	LXI	H,RUN1FN	; POINT TO NAME
	LXI	D,ldovl		; START address
;
;falls through to ldcmd
; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ LDCMD ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	ON ENTRY H = POINTER TO FILE NAME D = START ADDRESS

LDCMD:	XCHG			; NOW REVERSE H AND D
	SHLD	TMPNM		; SAVE LOAD ADDRESS 
	XCHG			; NOW H POINTS TO FILE

	LXI	D,FCB		; POINT TO FCB ADRS
	CALL	OPENX		; OPEN THE FILE
	JNC	OOK		; OPEN OK

	MVI	A,1		; GET DRIVE CODE
	STA	FCBDN		; SELECT DRIVE A:

	LXI	D,FCB		; POINT 'DE' TO FCB
	CALL	OPENX		; TRY DRIVE A:
	JC	RECOG		; IF ERROR, D POINTS TO MSG

OOK:	LHLD	TMPNM 		; NOW GET STARTING ADRS FROM TMP
	CALL	LODPROG		; LOAD THE FILE
	JC	PERR		; PROBLEMS?

;	CALL	CLOSE		; CLOSE FILE
	LHLD	TMPNM		; GET STARTING ADRS BACK
	CALL	CLRSCRN		;
 	PCHL			; JUMP TO START OF PORGARMŠ
; *************************************************************************
;   ~~~~~~~~~~~~~~ DISK WORK MODULES OPEN CLOSE, LOAD ~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	FOR OPEN D = FCB ADDRESS, -- FILE NAME IN FCB --

; 	FOR OPENX, D = FCB, H = ADDRESS OF FILE NAME

OPEN:	PUSH	B
	PUSH	D
	PUSH	H		; SAVE ALL THEM LIL CHILLENS
	JMP	OPEN2		; NO MOVE NAME

OPENX:	PUSH	B
	PUSH	D
	PUSH	H

	PUSH	D

	CALL	CLRFCB		; CLEAN UP ANY GARBAGE
	INX	D		; POINT TO FCB+1  OR NAME REGION
	MVI	B,11		; NUMBER OF BYTES IN NAME

OPEN1:	MOV	A,M		; BRING IN BYTE OF NAME
	STAX	D		; STORE OUT AT FCB
	INX	H
	INX	D		; BUMP POINTERS
	DCR	B		; LOWER COUNT
	JNZ	OPEN1

	POP	D		; GET FCB ADRS BACK

OPEN2:	XRA	A
	STA	FCBEX
	STA	FCBCR

	MVI	C,OPENS		; SET FUNCTION NUMER FOR OPEN
	CALL	BDOS		; OPEN IT UP

; 	CHECK FOR ERRORS

;	NOP
	INR	A
	JNZ	OPENOK		; ALLS WELL THAT ENDSWELL
	STC			; SET CARRY FLAG FOR ERRROR

EXITO:	POP	H
	POP	D
	POP	B
	LXI	D,OPERR		; GO BACK WITH D POINT  TO ERR MSG
	RET

OPENOK:	XRA	A		; SET CARRY FLAG TO ZERO
	STA	FCBCR
	POP	HŠ	POP	D
	POP	B		; EXIT ALL INTACT
	RET

; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ LOAD PROGRAM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

;	BRINGS AN ENTIRE FILE INTO MEMORY
; 	ENTRY PARMS:  	D = ADRS OF FCB
; 			H = ADRS OF WHERE FILE TO BE LOADED
; 	EXIT PARMS:   	CARRY SET IF ERROR, D POINTS TO ERROR MSG
; 			NO OTHER REGS CHANGED 

LODPROG:pushreg	

	MVI	A,80H		; SET BUFFER POINTER FIRST
	STA	IBP		; STORE  IN POINTER LOC
LD1:	CALL	GNB		; READ OPEN FILE BYTE INTO A
	JC	ERRLOD		; EXIT ON CARRY SET ERROR

	MOV	M,A		; STORE AT HL LOCATION
	INX	H		; BUMP FILE POINTER
	JMP	LD1		; LOOP UNTIL WHOLE FILE READ

ERRLOD:	popreg			
	CPI	1		; END OF FILE?
	rz			; YES, NORMAL RETURN
	STC			; SET CARRY ERROR INDICATOR
	LXI	D,LDERR		; POINT TO ERROR MSG
	RET

; ************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~ CLOSE ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ************************************************************************

;	CLOSE ROUTINE CLOSES FILE POINTED TO BY D FCB.
; 	NO PARMS, NOTHING CHANGED.

CLOSE:	pushreg
Š	MVI	C,CLOSES	; ENTRY NUMBER FOR CLOSE FILE FUNCTION
	CALL	BDOS		; DO IT

	jmp	rstreg

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ DRIVE SELECTION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

; 	INPUT:  ADDRESS OF FILE NAME IN 'HL'
; 	OUTPUT: ADDRESS OF FILE NAME IN 'HL', 'A' DESTROYED

DRVSEL:	PUSH	H		; SAVE ADDRS

	INX	H		; POINT TO SECOND CHARACTER
	MOV	A,M		; GET SECOND CHARACTER
	CPI	':'		; IF IT'S ":" THEN 1ST CHARACTER IS DRIVE
	JNZ	NDS		; USE DEFAULT IF NO DRIVE SPECIFIED

	POP	H		; 
	INX	H		; 
	INX	H		; 
	PUSH	H		; REAL ADDRESS OF FILE NAME

	DCX	H		; 
	DCX	H		; GO BACK TO DRIVE NAME
	MOV	A,M		; GET IT 
	STA	DDRV		; 
	STA	DFTDR		; SET IN DEFAULT MESSAGE

NDS:	POP	H		; 

DFTDRIV:LDA	DDRV		; GET DEFAULT DRIVE
	ANI	0FH		; MASK UN-NEEDED BITS
	STA	FCBDN		; 
	RET			; ALL DONE!

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~ DEFAULT FILE NAME SELECTION ~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

;	ENTER WITH 'DE' POINTING TO PROMPT TO BE PRINTED
;	'A', 'BC', 'DE'  DESTROYED
;	ADDRESS OF FILE IN 'HL' ON EXIT

DFTNAM:	CALL	FSERR		; DISPLAY PROMPT

	LXI	H,DFTFN		; POINT 'HL' TO DEFAULT DRIVE NAME BUFFER
	MOV	A,M		; GET FIRST CHARACTER FROM BUFFER
	CPI	' '		; COMPARE TO SPACE?
	JZ	DFTFN2		; SKIP DISPLAY IF BLANK

	LXI	D,DFTMSG	; POINT 'DE' DEFAULT DRIVE MESSAGEŠ	CALL	FSERR		; GO DISPLAY MESSAGE
	LDA	MPFLAG		; 
	ORI	01110001B	; BIT 1 = SECOND PART OF DRIVE SELECTION
	STA	MPFLAG		; SET FLAG

DFTFN2:	CALL	FSCMDL		; GET ANSWER:HL POINTS TO ENTRY
	RC			; ALWAYS ESCAPE ON CARRY

	CALL	CLEARS		; CLEAR SCREEN

	LXI	H,CMDBFR	; POINT 'HL' BACK TO START OF BUFFER
	MOV	A,M		; GET FIRST CHARACTER OF FILE NAME
	CPI	' '		; BLANK FIELD?
	JNZ	GOTNM		; IF NOT THEN THERE MUST BE A FILE NAME

;	IF GOING THROUGH HERE THEN DEFAULT FILE NAME

GETDFT:	LXI	D,CMDBFR	; DESTINATION, COMMAND LINE BUFFER
	LXI	H,DFTFN		; SOURCE, DEFAULT FILE NAME

	MOV	A,M		; GET FIRST CHARACTER OF DEFAULT NAME
	CPI	' '		; BLANK?
	JZ	DFTFN2		; IF SO, MUST ENTER SOMETHING
	
	LDA	DDRV		; DEFAULT DATA DRIVE
	STAX	D		; PUT IN FILE NAME BUFFER
	INX	D		; BUMP POINTER
	MVI	A,':'		; COLON TO SEPARATE NAME FROM DRIVE
	STAX	D		; PUT IN FILE NAME BUFFER
	INX	D		; BUMP POINTER

	LXI	B,8		; COUNT
	CALL	DUMP		; MOVE NAME
	LXI	H,CMDBFR	; POINT TO FILE NAME

GOTNM:	CALL	DRVSEL		; SELECT DRIVE

	MOV	A,M		; GET FIRST CHARACTER OF FILE NAME
	CPI	' '		; BLANK?
	JZ	DFTFN2		; IF BLANK THEN GO TRY AGIAN
	
	LXI	D,DFTFN		; POINT DESTINATION TO BUFFER
	LXI	B,8		; LOAD COUNT IN 'BC'
;falls through to blkmov to move file name
; *************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BLKMOV ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

; 	BLKMOV SUBROUTINE MOVES A BLOCK OF DATA
; 	INPUTS:  BC = 16 BIT COUNT
;       	 DE = DESTINATION
;	         HL = SOURCE 
; 	OUTS:  NONE, ALL REGS SAVEDŠ
BLKMOV:	PUSHALL			;SAVE ALL REGISTERS

DLUP:	MOV	A,B		; TEST BC FOR ZERO
	ORA	C
	JZ	RSTALL		; RETURN WHEN FINI
	MOV	A,M		; READ FROM OLD LOC
	STAX	D		; STORE TO NEW LOC
	INX	D
	INX	H
	DCX	B		; BUMP ALL POINTERS
	JMP	DLUP		; LOOP

; ***************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ OVERLAY MESAGES ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~
; ***************************************************************************

;	INPUT: 'B' = MESSAGE (PAGE) NUMBER , MREC = OFFSET INTO FILE
;	OUTPUT: ALL REGS DESTROYED

MSGMKR:	pushall

	LDA	FCB		; GET CURRENT DRIVE
	STA	TDRV		; SAVE THAT SUCKER
	CALL	CLRFCB		; 

	LXI	D,FCB		; POINT 'DE' TO FCB
	XRA	A		; ZERO 'A'
	STAX	D		; SELECT DEFAULT DRIVE

	LXI	H,MSGOVL	; POINT TO FCB ADRS
	CALL	OPENX		; OPEN THE FILE
	JC	ERROR		; IF ERROR, D POINTS TO MSG
	JMP	MSGMKR3		; DONT SAVE MACHINE AGIAN

MSGMKR2:pushall			; ENTER HERE IF FILE IS ALREADY OPEN

MSGMKR3:XRA	A		; CLEAR 'A'
	STA	FCB		; STORE IN FCB TO SELECT PROGRAM DRIVE
	STA	FCBEX		; SELECT FIRST EXTENT 
	MVI	A,80H		; GET MAX IBP VALUE
	STA	IBP		; FORCE RECORD READ

	LDA	MREC		; GET PAGE NUMBER
	CPI	129		; IS PAGE IN FIRST EXTENT?
	JC	SETREC		; NO CARRY MEANS NO

	MVI	A,01		; SELECT NEXT EXTENT
	STA	FCBEX		; SET EXTENT NUMBER IN FCBŠ
	PUSH	B		; SAVE PAGE POINTER
	MVI	C,OPENS		; GET OPEN FILE FUNCTION CODE
	LXI	D,FCB		; POINT TO FCB
	CALL	BDOS		; OPEN THE NEXT EXTENT
	POP	B		; RESTORE PAGE POINTER

	LDA	MREC		; GET RECORD OFFSET
   	SBI	128		; SUBTRACT FOR NEXT EXTENT

SETREC:	STA	FCBCR		; START AT THAT RECORD
	LXI	D,TLC		; POINT TO TOP LEFT CORNER
	CALL	CURSOR		; PUT CURSOR THERE

FINPAGE:CALL	GNB		; GET A BYTE
	JC	ERROR		; ERROR

	CPI	EOF		; END OF FILE?
	JZ	MSGDONE		; IF SO THEN EXIT

	CPI	EOM		; IS THAT A PAGE MARKER?
	JNZ	FINPAGE		; IF NOT LOOP BACK FOR NEXT CHARACTER

	CALL	GNB		; GET NEXT BYTE AFTER PAGE MARKER
	JC	ERROR		; CARRY MEANS ERROR *

	CMP	B		; TEST FOR THE RIGHT MESSAGE
	JNZ	FINPAGE		; IF NOT RIGHT PAGE THEN LOOP FOR NEXT BYTE

;	START READING MESAGE HERE

RMF:	CALL	GNB		; GET A BYTE
	JC	ERROR		; CARRY MEANS ERROR *

	CPI	EOM		; END OF MESAGE?
	JZ	MSGDONE		; EXIT IF SO

	CALL	DMAC		; DISPLAY CHARACTER OR MACRO
	JMP	RMF		; TRANSLATION DONE, LOOP FOR NEXT CHARACTER

MSGDONE:XRA	A		; CLEAR 'A'
	STA	MREC		; START NEXT ONE AT BEGINING
	LDA	TDRV		; GET DRIVE WE WERE WORKING ON
	STA	FCB		; RESET DRIVE

	pop	psw
	ora	a		;no errors
	jmp	rstreg
	
; ***************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~~ DELAY LOOP ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Š; ***************************************************************************

;	1 MSEC DELAY LOOP * (DE)
;	INS: 'DE' = LOOP COUNT
;	SAVES ALL REGISTERS

DLOOP:	PUSHALL			;SAVE ALL REGISTERS

	MVI	B,MSCNT		; GET 1 MSEC DELAY LOOP CONSTANT
DLY10:	MOV	A,E		; GET REMAINING DELAY
	ORA	D		; TIMED OUT?
	JZ	RSTALL		; IF DONE RETURN TO CALLER AFTER POPING REG.

	MOV	A,B		; INITIALIZE
DLY20:	DCR	A		; COUNT UP TO 1 MSEC 
	JNZ	DLY20		; LOOP TIL DONE

	DCX	D		; COUNT 1 MSEC DONE
	JMP	DLY10		; LOOP FOR NEXT COUNT
	
; ~~~~~~~~~~~~~~~~~~~~ clear FCB routine ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CLRFCB:	PUSH	PSW		; 
	PUSH	B		; 
	PUSH	H		; save machine

	MVI	B,31		; load 'B' with length of FCB - 1
	XRA	A		; clear 'A'
	LXI	H,FCBFN		; point 'HL' to FCB FILENAME

CFCBLP:	MOV	M,A		; clear byte
	INX	H		; bump pointer
	DCR	B		; bump counter
	JNZ	CFCBLP		; loop if not done

	POP	H		; 
	POP	B		; 
	POP	PSW		; restore machine
	RET			; to caller
baddog	db	00		; hold my place, will ya 
bigdog	db	00		; why, sure...
graflg:	DB	00		; used to be verchr: CWM
CMDCTL:	DW	5,CMDBFR	; COMMAND LINE CONTROLS

LSTBYT	EQU	$		; LAST BYTE OF DASOFTŠ
TRKFLD:	DS	100H		; FIELD PLACED AT END SO IT

; 	CAN GROW UP TO 13FFH, 4 BYTES PER FIELD, 64 DEFAULT

	END
