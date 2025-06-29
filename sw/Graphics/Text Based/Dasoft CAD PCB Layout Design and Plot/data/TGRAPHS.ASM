

;	tgraphs.asm for 2.6	cwm	6-1-85


	ORG	1C00H	;LOAD ADDRESS FOR TGRAPHS

;***************************************************************************
;	GRAPHICS CONTROL PACKAGE FOR MAGIC DA SYSTEM
;	THESE ROUTINES ARE PROTECTED BY SOFTWARE LICENSING
;	AGREEMENTS AND MAY NOT BE USED OR COPIED WITHOUT
;	WRITTEN PERMISSION OF DASOFT.
;	  COPYRIGHT 1981 DASOFT DESIGN SYSTEMS, INC.

;	THESE PROGRAMS MUST NOT BE LONGER THAN 1K (1024) BYTES LONG
;	 AND  MUST BE ORIGINED AT 1C00 HEX
;                                 ----

;====================== WORKDATE 1-16-85 ========= CWM =====================

;		added graflg (0xxxH) to tell kernal to leave char<10h alone
;		if graphic string. used in psrtng call in plot2 1-4-85
;				also in side1, side2, EVERYWHERE RDMATX => PSTRNG

;	**** SPECIAL CONSOLE TERMINAL GRAPHICS PACKAGE **********
;			*** REV 2.5 ***
;            08/1/84 changed otl? to otl0, now ASM.COM compat. cwm
;	last edit:	05/25/84, kgh
;	change  05/25/84  mod to display X for finger mark and changed to
;			  ASM file
;	change	03/08/84	sb 
;				'lxi	h,matrix' to  'lhld	matrix' , in kernal
;			03/09/84
;	MOVED CURUP.... TO BOTTOM OF TABLE
;	USE NOW M80 TO ASSEMBLE BECAUSE NOW USE PHASE.. DEPHASE
; 
;
;;;-----------------------START OF NEW EQUATES------------------------


MATRIX	EQU	2FDH	; POINTER TO MATRIX. INDICATES WHERE THE MATRIX
			; IS LOADED. OR WHERE IT IS TO BE LOADED

VERS	EQU	'2'	; 
REV	EQU	'5'	; 
EDIT	EQU	'X'	;
                
GRAFLG	EQU	0EEfH
WBOOT	EQU	0000H		;  WARM BOOT ADDRESS
TYPEF	EQU	0002H		;  BDOS PRINT COMMAND NUMBER
BDOS	EQU	0005H		;  ADDRESS  OF BDOS JUMP POINT
BUFF	EQU	0080H		;  ADDRESS OF DISK INPUT BUFFER
DMA	EQU	001AH		;  SET DMA ADDRESS FUNCT NUMB
READF	EQU	0014H		;  DISK READ FUNCTION
WRITEF	EQU	0015H		;  WRITE FILE TO DISK NUM
OPENS	EQU	000FH		;  OPEN FILE FUNCT NUMBER
CLOSES	EQU	0010H		;  CLOSE  FILE FUNCT NUMBER
                
FCB	EQU	005CH		;  FILE CONTROL BLOCK ADRS
FCBDN	EQU	005CH		;  FCB DISK NAME
FCBFN	EQU	005DH		;  FILE NAME
FCBFT	EQU	0065H		;  FILE TYPE
FCBRL	EQU	0068H		;  CURRENT REEL NUMBER
FCBRC	EQU	006BH		;  FILE RECORD COUNT (0-128)
FCBCR	EQU	007CH		;  CURRENT (NEXT) RECORD NUMBER
FCBLN	EQU	007DH		;  FCB LENGTH
                
TOPPTR	EQU	0006H		;  WAS (AD00H) STACK START 48K
                
CLEAD	EQU	1		; CURSOR POSITIONING STRING CODE
CMID    EQU     2       	; STRING SENT BETWEEN ROW AND COLMN  
P3LINES	EQU	3		; PRINT THREE LINES
CEND    EQU     4       	; STRING SENT AFTER BOTH ROW AND COLUMN   
;
CONTMSG	EQU	000BH		;  CONTINUE MESSAGE CODE
CLS	EQU	000CH		;  CLEAR SCREEN CODE
IVON	EQU	000EH		;  INVERSE ON CODE
IVOFF	EQU	000FH		;  INVERSE OFF CODE
                
CR	EQU	000DH		;  RETURN CHARACTER
LF	EQU	000AH		;  LINE FEED CHARACTER
BEEP	EQU	0007H		;  BEL CHARACTER
TAB	EQU	0009H		;  TAB CHARACTER
BS	EQU	0008H		;  BACK SPACE
ESC	EQU	001BH		;  ESCAPE
EOM	EQU	00EEH		;  END OF MESSAGE MARKER (OVERLAY FILE)
EOF	EQU	00FFH		;  END OF FILE MARKER    (OVERLAY FILE)
MSCNT	EQU	00F9H		;  1 MSEC SOFTWARE DELAY CONSTANT
                
OMOS16	EQU	0058H		; 
OMOS17	EQU	005FH		; 
OMOS18	EQU	0064H		; 
OMOS19	EQU	0065H		; 
OMOS20	EQU	0067H		; 
OMOS21	EQU	006CH		; 
OMOS22	EQU	006EH		; 
OMOS23	EQU	0073H		; 
OMOS24	EQU	0079H		; 
                
                
CURSOR	EQU	010BH	; ADDRESS CURSOR ROUTINE
RDRL	EQU	0103H	; LOADER KERNAL OR TEST PROG
DALN	EQU	0106H	; END OF DASOFT FOR SAVE FROM INSTALL
CLEARS	EQU	0108H	; CLEAR SCREEN ROUTINE
PSTRNG	EQU	010EH	; PRINT AN ASCII STRING
WRITE	EQU	0111H	; WRITE CHAR IN A TO CONSOLE
GETBYT	EQU	0114H	; GET NEXT BYTE OF DISK READ
WRTBYT	EQU	0117H	; WRITE NEXT BYTE TO DISK
WRTSEG	EQU	011AH	; WRITE SEGMENT TO DISK ROUTINE
INCHNE	EQU	011DH	; ROUTINE TO READ CONSOLE NO ECHO
FSNEAK	EQU	0120H	; RE-ENTER W/NEW CMD LINE
FSCMDL  EQU	0123H	; FULL SCREEN PACKAGE CMD ONLY ENTRY
FSENTR	EQU	0126H	; FULL SCREEN NORMAL ENTRY
FSDATA	EQU	0129H	; FULL SCRN UPDATA DATA ENTRY
FSERR	EQU	012CH	; PRINT MESSAGE IN ERR FIELD FS
DCODE	EQU	012FH	; COMMAND DECODER ROUTINE
SETDRV	EQU	0132H	; SET PROGRAM AND DATA DRIVES
ERRFN	EQU	0135H	; PRINT ERROR FILE NAME
EXHELP	EQU	0138H	; EXTERNAL HELP ENTRY
OPENF	EQU	013BH	; DISK UTILITY OPEN FILE SUBR
LOADF	EQU	013EH	; DISK UTILITY LOAD FILE SUBR
CLOSEF	EQU	0141H	; DISK UTILITY CLOSE FILE SUBR
SELDRV	EQU	0144H	; SELECT SPECIFIED DATA DRIVE
DFTDRV	EQU	0147H	; SELECT DEFAULT DATA DRIVE
GETNAM	EQU	014AH	; FILE NAME INPUT ROUTINE
DUMP	EQU	014DH	; BLOCK MOVE ROUTINE
MESSAGE	EQU	0150H	; DISPLAY MESAGE ROUTINE
DELAY	EQU	0153H	; DELAY ROUTINE
;------------------------------------------
; these are new routines in the kernal
; up to now, (4/7/84) only INSTALL uses them.
;------------------------------------------

SELECT	EQU	 156H	; LIKE SELDSK, BUT THIS IS A REAL ROUTINE. USE TO SELECT THE CURRENT DEFAULT DRIVES
PDRIV1	EQU	 159H	; LIKE PDRIVE (ALIAS SETDRV ). GETS DEFAULT DRIVES FROM USER.
HLTDEC	EQU	 15CH	; DISPLAY HL IN DECIMAL, RIGHT JUSTIFIED. A CONTAINS WIDTH OF FIELD.
;NEXT 5 ITEMS IN THE JUMP VECTOR
;ARE NOT USED CURRENTLY. THEY ACT AS  PLACE HOLDERS for possible expansion
;

UJMP1	EQU	 15FH	;
UJMP2	EQU	UJMP1+3
UJMP3	EQU	UJMP2+3
UJMP4	EQU	UJMP3+3
UJMP5	EQU	UJMP4+3
;---------------------------END OF JUMP VECTOR---------------------
; 
;  the following entries are used in most of the programs
;  and their addresses are different in 2.4d and 2.5
;  Errors, if any are likely to have arisen from here.
;------------------------------------------------------------------                
;
TRMINI	EQU	016EH	; string to initialize the terminal
TRMUNI	EQU	0182H	; string to de-initialize the terminal
TERM	EQU	0271H	; terminal name
                
SCRLUP	EQU	0293H	; SCROLL CURSOR UP KEY

;------------KEEP THESE ITEMS TOGETHER, IN THIS ORDER -----------------
                
MOVOFS	EQU	029DH	; ROW OFFSET (USED BY CURSOR POSITIONING ROUTINE
COLOFF	EQU	MOVOFS		; COLUMN OFFSET	
ROWOFF	EQU	COLOFF+1	; ROW OFFSET
ASCIIFLG EQU	ROWOFF+1	; 0=SEND CHARACTER IN BINARY
;                      		 ELSÅ HO× MANÙ ASCIÉ CHARACTERÓ TÏ SEND
XB4YFLG	EQU	ASCIIFLG+1	; FLAG, 0=Y,X 1=X,Y
NULLS	EQU	XB4YFLG+1	; NULLS TO BE SENT B4 POS STRING
DEL1	EQU	NULLS+1		; SHORT DELAY CONSTANT
DEL2	EQU	DEL1+1		; LONG DELAY CONSTANT

;EACH OF THE ITEMS BELOW IS COMPOSED OF AN IDENTIFICATION BYTE (USED BY DMAC TO FIND THE STRING)
;A (DEFINABLE ) STRING. ALL ARE 7 BYTES LONG WITH THE EXCEPTION OF CD3 AND THE CONTINUE PROMPT.

                
CD1	EQU	02A4H	; CURSOR POSITIONING STRING . 7 BYTES
CD2	EQU	02ADH	; STRING SENT BETWEEN ROW AND COLUMN. 7 BYTES	
CD3	EQU	02B6H	; 3 LINE FEEDS	              3 BYTES
CD4	EQU	02BBH	; STRING SENT AFTER BOTH ROW AND COLUMN WHEN DOING CURSOR POSITIONING. 7 BYTES.
CDB	EQU	02C4H	; CONTINUE PROMPT; QUITE A LONG STRING
CDC	EQU	02E1H	; CLEAR SCREEN	; 7 BYTES
CDE	EQU	02EAH	; INVERSE ON.	;7 BYTESŠCDF	EQU	02F3H	; INVERSE OFF.	;7 BYTES

			;
	               
TLC	EQU	02FFH	; TOP LEFT CORNER
                
XPOINT	EQU	0301H	; X  COORD POINTER 
YPOINT	EQU	XPOINT+1; Y COORD POINTER
                
FLDBGN	EQU	0303H	; START ADRS OF SCB
CURFLD	EQU	0305H	; CURRENT FIELD NUMBER
LASTFLD	EQU	0306H	; LAST FIELD NUMBER
                
ERRFLG	EQU	0307H	; ERROR PRINTED FLAG
                
IBP	EQU	0308H	; INPUT BUFFER POINTER
OBP	EQU	IBP+1	; OUTPUT BUFFER POINTER
                
SCREENX	EQU	030AH	; SCREEN WIDTH 
SCREENY	EQU	SCREENX+1; SCREEN HEIGHT
                
DEFALDX	EQU	030CH		; DEFAULT #COLUMNS IN ALD PAGE
DEFALDY	EQU	DEFALDX+1	; DEFAULT #ROWS IN ALD PAGE
DEFPCBX	EQU	DEFALDY+1	; DEFAULT PCB WIDTH (.05"/SPACE) 12.5"
DEFPCBY	EQU	DEFPCBX+1	; DEFAULT PCB HEIGHT (.05"/SPACE) 6"
                
TMPNM	EQU	0310H	; TEMPORARY STORAGE
MREC	EQU	0312H	; MESSAGE RECORD POINTER
TDRV	EQU	0313H	; TEMP DRIVE NAME STORAGE
                
DSPERFN	EQU	0314H	; ERR FILE NAME DISPLAY FLAG
MPFLAG	EQU	0315H	; 
                
CMDLN	EQU	0316H	; COMMAND LINE CHARACTERS
CMDBFR	EQU	031EH	; SPACE FILLED 16 BYTE BUFFER $TER
                
DPD	EQU	0358H	;
DDD	EQU	0383H	;
PDRV	EQU	03ECH	;
DDRV	EQU	0439H	;
                
DFTMSG	EQU	043EH	; DEFAULT FILE NAME
DFTFN	EQU	044CH	; 



GINIT:	JMP	INIT		; GRAPHICS INITIALIZATION
PIXEL:	JMP	PLOT		; PLOT POINT COMMAND
CURSER:	JMP	SETCURS		; 
INCHAR:	JMP	CHARIN		; READ EXTERNAL CURSOR CONTROL
SIDE1:	JMP	SID1		; IF 128 WIDE, SWITCH SIDES
SIDE2:	JMP	SID2		; 
USER3:	JMP	USR3		; THIRD USER ROUTINE (ZOOM)

;	TEMP LOCATIONS

ACTIVE1:DB	00		; 
ACTIVE2:DB	00		; CURRENTLY ACTIVE SIDE
XDOT:	DB	00		; X COORDINATE
YDOT:	DB	00		; Y COORDINATE

otl:
MODREG: DB	00000000B	; jdb 11/17/83

;		MODREG is another multipurpose byte that
;		will be used to test whether TGRAPHS is being
;		used by the Outline editor or the Route Editor

;		Bit 0 - If set then Outline is using TGRAPHS
;			If not set the Route Edit is here
;		Bit 1 - Available
;		Bit 2 - Available
;		Bit 3 - Available
;		Bit 4 - Available
;		Bit 5 - Available
;		Bit 6 - Available
;		Bit 7 - Available	

CSIDE:	DB	00		; NOT USED IN CGS-808
SHORT:	DB	00		; SHORT MATRICES USED
TEMP1:	DB	00		; 
TEMP2:	DB	00		; THESE ARE USED FOR MAX MIN
TEMP3:	DB	00		; 
TEMP4:	DB	00		; THESE ARE USED FOR MATRIX SIZE
CURSID:	DB	00		; 0 = SIDE1 .. 1 = SIDE2 CURRENTLY DISPLAYED


;	**** THESE ARE KEY DEFINITIONS FOR DOING INTERACTIVE
;	GRAPHICS.  A 10-KEY PAD IS SHOWN SET UP HERE, USER MAY
;	CHANGE AS NECESSARY

CURMOV:	DB	','		; MOVE CURSOR ONLY, NO POINTS SET
SETPNT:	DB	'.'		; CURSOR DEFINES A USED POINT
SETPAD:	DB	'0'		; CURSOR DEFINES A PAD LOCATION
SIDX1:	DB	'7'		; CURSOR IS ON SIDE 1
SIDX2:	DB	'9'		; CURSOR IS ON SIDE 2
FUNCT:	DB	'5'		; SPECIAL FUNCTION KEY
;  (  MOVED THESE HERE FROM TOP OF TABLE	SB.   3/9/84)
CURUP:	DB	'8'		; MOVE CURSOR UP
CURLFT:	DB	'4'		; 
CURRT:	DB	'6'		; 
CURDN:	DB	'2'		; MOVE CURSOR DOWN

BLINK:	JMP	DOBLINK		; SUBROUTINE FOR SETTING VIDEO

;	****** THE USER MAY CHANGE THESE TO NORMAL PRINT CHARACTERS
;	OR TO WHATEVER STRING IS NECESSARY TO TURN ON THE GRAPHICS 
;	CHARACTERS FOR THE TERMINAL.  NOTE THAT A 24H OR $ TERMINATOR
;	IS REQUIRED ON THE END OF THE STRING.  IF YOUR TERMINAL REQUIRES
;	A $ AS PART OF THE GRAPHICS STRING, MOST TERMINALS IGNORE THE 
;	UPPER ASCII BIT, SO AN 0A4H WILL ACCOMPLISH THE SAME THING.


QHORIZ:	DB	'-',24H,0,0,0,0,0,0	; horizontal line segment
QVERT:	DB	'|',24H,0,0,0,0,0,0	; vertical line segment
QULC:	DB	'/',24H,0,0,0,0,0,0	; upper left corner line segment
QURC:	DB	'\',24H,0,0,0,0,0,0	; upper right corner line segment
QLLC:	DB	'\',24H,0,0,0,0,0,0	; lower left corner line segment
QLRC:	DB	'/',24H,0,0,0,0,0,0	; lower right corner line segment


;	NOW SOME DEFINTIONS

XMAX	EQU	80		; MAX X SIZE
YMAX	EQU	24		; MAX Y XIZE
BACKG	EQU	' '		; BACKGROUND COLOR CODE

;	**** NOW A FEW TEMP VARIABLES USEED BY THE ROUTINES


CURXHI:	DB	80		; CURRENT MAXIMUM DISPLAYED X VALUE
CURXLO:	DB	00		; CURRENT MIN DISPLAYED X VALUE

CURYHI:	DB	20		; CURRENT MAX Y DISPLAYED VALUE
CURYLO:	DB	00		; CURRENT MIN Y DISPLAYED VALUE

XPOSX:	DB	00		; 
YPOSY:	DB	00		; CURSOR LOC FOR PRINTING

;      ****************************************************
;      ****************************************************

;	*********** READ MATRIX CHARACTTER ROUTINE *************
;	WITH B=X, C=Y, DETERMINE WHAT CHARACTER SHOULD BE DISPLAYED
;	ALL REGS SAVED, EXITS WITH 'DE' POINTING TO ASCII STRING TO
;	BE PRINTED. THIS IS FOR "DIALOG 80" ESCAPE SEQUENCES TO
;	DRAW GRAPHICS CHARACTERS ON THE SCREEN

QNORM:	DB	00,24H		; string to be sent to the terminal

;	********** SUBROUTINES **************


otl0	equ	00000001b	; test for 

RDMATX:	PUSH	B		; 
	PUSH	H		; 

; GET matrix value from (xdot) corrected for current side
	call	coord		; get matrix addr. in (HL)
	mov	a,m
	cpi	0eah		; check for finger
	jc	rn2

	cpi	0eeh
	jc	regmark		; yup, a finger go mark it

rn2	lda	curSID		; get current display side
	ora	a		; 
	mov	a,m		; get byte from matrix
	jnz	rn1		; side 2 so just strip and exit

	rrc			; 
	rrc			; 
	rrc			; 
	rrc			; move value to lower nibble

rn1	ani	00001111b	; strip out upper nibble
	ORA	A		; TEST FOR ZERO
	JZ	NUTN		; NOTHING THERE IF ZERO

	MOV	B,A		; put it away for a bit (sorry)

	LDA	modreg		; the multibyte motif to determine
	ani	otl0		; whether it is the ouline or rte editor
	jz	NORMDEC		; outline = 0 ; rte = 1

	mov	a,b		; get value back
	CPI	10		; if >= 10 then it is a single byte
	JNC	NORMDEC		; so it can be sent out normally

	ORI	00110000b	; convert it to ascii number for power grid ID
	JMP	OUTCX		; single character exit point

NORMDEC:MOV	A,B		; get matrix value

	dcr	a		; 1
	JZ	GRID		; power grid

	dcr	a		; 2
	JZ	FATline		; fat line

	dcr	a		; 3, not used

	dcr	a		; 4
	JZ	HLIN		; horizontal line

	dcr	a		; 5
	JZ	VLIN		; vertical line

	dcr	a		; 6
	JZ	URCCORN		; upper right corner

	dcr	a		; 7
	JZ	LRCCORN		; lower right corner

	dcr	a		; 8
	JZ	ULCCORN		; upper left corner

	dcr	a		; 9
	JZ	LLCCORN		; lower left corner

	dcr	a		; A
	JZ	VIAS		; via

	dcr	a		; B
	JZ	PADS		; type 1 pad

	dcr	a		; C
	JZ	HOLE		; type 2 pad

	dcr	a		; D
	JZ	BIGHOLE		; type 3 pad

	dcr	a		; E
	JZ	EDGE		; edge marker

	dcr	a		; F
	JZ	MNTHOLE		; mounting hole

;  	in OUTCX the data is first moved into a temporary address
; 	then DE is pointed in to that temp address and call is made.
; 	in OUTCX2 D is already pointed to the string to go out -- the regs are poped

NUTN:	MVI	A,BACKG		; we got here because there weren't nuthin
OUTCX:	STA	QNORM		; 
	LXI	D,QNORM		; 

OUTCX2:	POP	H		; 
	POP	B		; 
	RET			; 

GRID:	MVI	A,'*'		; these are the characters that will be 
	JMP	OUTCX		; shoved out as symbols

VIAS:	MVI	A,'o'		; these are single ascii representation
	JMP	OUTCX		; 

PADS:	MVI	A,'@'		; 
	JMP	OUTCX		; 

REGMARK:MVI	A,'X'		; 
	JMP	OUTCX		; 

HOLE:	MVI	A,'O'		; 
	JMP	OUTCX		; 

EDGE:	MVI	A,'#'		; EDGE MARK
	JMP	OUTCX		; 

MNTHOLE:MVI	A,'.'		; MOUNTING HOLE
	JMP	OUTCX		; 

FATline:mvi	a,'F'		; fat line
	jmp	outCx		; 

BIGHOLE:MVI	A,'0'		; 
	jmp	outCx		; 

HLIN:	LXI	D,QHORIZ	; 
	JMP	OUTCX2		; 

VLIN:	LXI	D,QVERT		; 
	JMP	OUTCX2		; 

ULCCORN:LXI	D,QULC		; 
	JMP	OUTCX2		; 

URCCORN:LXI	D,QURC		; 
	JMP	OUTCX2		; 

LRCCORN:LXI	D,QLRC		; 
	JMP	OUTCX2		; 

LLCCORN:LXI	D,QLLC		; 
	JMP	OUTCX2		; 

;	******** CHARACTER INPUT ROUTINE *************
;	IF JOYSTICK AVAILABLE OR LIGHT PEN, THIS ROUTINE
;	COULD READ DEVICE AND SEND CODE. IF NOT, JUST
;	READ CONSOLE.
;	NO INPUTS, CHARACTER COMMAND EXPECTED IN A
;	NO OTHER REGS CHANGED

CHARIN	EQU	INCHNE		; READ MAGIC KERNAL CHAR IN

;	******** BLINK SUBROUTINE TO BLINK OR SET INVERSE VIDEO *****
;	WHEN CALLED, XDOT,YDOT,HAVE COORDINATE OF POINT, AND WHENEVER
;	THAT POINT IS GOING TO BE CALLED, INVERSE VIDEO OR BLINK IS
;	ADDED TO IT.  UP TO TWO POINTS MAY BE BLINKED A THE SAME TIME.
;	ALL REGS SAVED

BLINK1:	DW	0		; XY OF FIRST BLINK POINT
BLINK2:	DW	0		; XY OF SECOND BLINK POINT
B12:	DB	0		; KEEPS TRACK OF WHERE TO STORE NEW BLINK

DOBLINK:PUSH	PSW		; 
	PUSH	H		; 

	LHLD	XDOT		; get x coordinate into HL

	LDA	B12		; get the temp value
	ORA	A		; test = 0 or 1
	JZ	BLK1		; if 0 then go there

	SHLD	BLINK2		; since it is 1 then this
	JMP	ENDB		; is the destination

BLK1:	SHLD	BLINK1		; store it as the origin

ENDB:	INR	A		; which is the value of B12
	ANI	1		; change the value to the opposite
	STA	B12		; of what it was above

	POP	H		; retrieve and jam
	POP	PSW		; 
	RET			; 




;	******* USER DEFINED PROGRAM 3 *************
;	WILL MOST LIKELY BE USED FOR ZOOM FUNCTION A LITTLE  LATER, OR 
;	WHATEVER YOUR LITTLE HEART DESIRES. 
;	JUST DON'T DESTROY ANY REGISTERS!

;	FOR THIS IMPLEMENTATION, THE ROUTINE WILL  DETERMIINE
;	A SQUARE AREA AROUND THE CURRENT XY 20 BY 80, SET THE
;	CORRECT X AND Y MAX AND MIN, THEN CALL THE CORRECT SIDE
;	ROUTINE TO PRINT OUT THAT NEW AREA, ACCOMPLISHING SCROLL.


USR3:	PUSH	PSW		; save the 'ACCU'

	LDA	XDOT		; get the current x location
	CPI	40		; and see if it is greater than 40
	JC	NOT40		; it is < 40 therefore 0 will be left boundry

;	NEXT CHECK FOR HITTING RIGHT SIDE

	CPI	210		; if it is greater than 40 then we need to test
	JNC	NOT210		; here for the right side; if greater then go

;	BOTH REGIONS OK

	SUI	40		; now sub 40 from XDOT in order
	STA	CURXLO		; to set the left or lo side

	ADI	80		; now we add 80 back to go 40 beyond original
	STA	CURXHI		; point in order to set the right side
	JMP	CHECKYS		; x is done so check out Y

NOT40:	MVI	A,0		; get the 0
	STA	CURXLO		; and use that as the left side lo

	MVI	A,80		; so the current window will be 0-80 on the x
	STA	CURXHI		; axis
	JMP	CHECKYS		; x is cool go do Y

NOT210:	MVI	A,170		; we are now in the far right window
	STA	CURXLO		; so set the lo

	MVI	A,250		; and the hi appropriately
	STA	CURXHI		; 

CHECKYS:LDA	YDOT		; 
	CPI	10		; get the current Y and check it our
	JC	NOT10		; a is less than 10 so set the the lo to 0

	CPI	118		; how about is it greater than 117
	JNC	NOT117		; if it is then 127 is the top

;	BOTH BOUNDARIES OK

	SUI	10		; set the lower limit YDOT-10
	STA	CURYLO		; 

	ADI	20		; and the upper limit YDOT+10
	STA	CURYHI		; 
	JMP	OUT3		; 

NOT10:	MVI	A,0		; setting the window to the default size 
	STA	CURYLO		; of Y being twix 0 and 20

	MVI	A,20		; 
	STA	CURYHI		; 
	JMP	OUT3		; 

NOT117:	MVI	A,108		; this takes care of the condition when
	STA	CURYLO		; there is "danger" of being too close 

	MVI	A,128		;  so the limits are set here
	STA	CURYHI		; 

;	NOW CALL THE CORRECT DISPLAY FUNCTION,AND PUT THE CURSOR
;	TO ITS NEW POSITION WHATEVER THAT IS.

OUT3:	LDA	CURSID		; get the current side
	ORA	A		; and test it for 0 or 1
	JZ	CALS1		; if it comes up zero then we are on side 1

	CALL	SIDE2		; <> 0 then we are on side 2
	JMP	CALCS		; find out where we are

CALS1:	CALL	SIDE1		; 

CALCS:	CALL	SETC		; GET CURSOR POSITION IN NEW SCRN
	PUSH	D		; save D cuz when we goto CURPOS we need it

	LXI	D,XPOSX		; get the cursor position
	CALL	CURSOR		; 

	POP	D		; 
	POP	PSW		; restore the machine
	RET			; 


;	************* MULTIPLY ROUTINE *****************
;	MULTIPLY BC=C*D
; on entry BC = xy coord in matrix
; 	   D = 250

MULT:	PUSH	PSW		; store flags
	PUSH	D		; and D which is pointer to char to print

	MVI	B,0		; 
	MVI	E,9		; 

MULT0:	MOV	A,C		; A = YDOT of matrix
	RAR			; moving everything right through carry
	MOV	C,A		; and saving new value YDOT/2
	DCR	E		; if E = 0 then we have 
	JZ	MULT2		; looped through eight bits -- we are done

	MOV	A,B		; 
	JNC	MULT1		; if the above RAR did set carry then

	ADD	D		; 250

MULT1:	RAR			; again half that
	MOV	B,A		; put it away
	JMP	MULT0		; 

MULT2:	POP	D		; multiplication is complete
	POP	PSW		; so retore and jam
	RET			; 





;	INITIALIZATION , JUST SET SOME INITIAL VARAIBLES

INIT:	RET			; 

;	******* PLOT POINT ROUTINE *****************
;	THIS ROUTINE PLOTS A POINT ON GRAPHICS SCREEN
;	BY DISPLAYING ONLY ONE SIDE BLACK&WHITE, AND CHECKING
;	THE ORIGINAL MEMORY MATRIX FOR THE EXACT CHARACTER PLACED.

;	NO OUTPUT
;	ENTRY PARMS ARE:
;			ACT1,2 		active side
;			XDOT,YDOT	matrix position
;			OTL		outline editor in use flag


PLOT:	PUSH	PSW		; 
	PUSH	B		; 
	PUSH	D		; 
	PUSH	H		; SAVE  MACHINE STATE

	CALL	SETC		; determine if XDOT,YDOT is in screen range
	JMP	PLOT2		; if so continue with the plot


;	***** SETC ROUTINE DETERMINES  IF XDOT,YDOT IS WITHIN
;	SCREEN RANGE AND SETS XPOSY WITH CURRENT SCREEN CURSOR LOCATION
;	IF IT IS WITHIN RANGE. IF NOT WITHIN RANGE, CARRY SET

AUTOS:	DB	00		; AUTO SCROLL ENABLED

SETC:	LDA	AUTOS		; 
	MOV	C,A		; move auto into C

	LDA	CURXHI		; GET MAX X XOUNT
	MOV	B,A		; 

	LDA	XDOT		; is the current location within the limits
	CMP	B		; if x>= the currentxhi that is not so great
	JNC	ENDP		; and we must leave the plot routine to update

;	NOW CHECK FOR AUTO SCROLL

	DCR	C		; which holds the auto scroll value
	JNZ	NOSCR1		; if it is now <> 0 then no auto scroll

	CPI	249		; compare XDOT with this
	JZ	NOSCR1		; if we are already at the max -- no scroll

	DCR	B		; B holds the current x hi allowed --  so
	CMP	B		; so if B = A (XDOT) then we better
	JZ	SCROLLQ		; go scroll the screen and try again.

;	NOW TRY FOR X BELOW RANGE

NOSCR1:	LDA	AUTOS		; 
	MOV	C,A		; we start again for the low range

	LDA	CURXLO		; minimum x allowable
	MOV	B,A		; and stick it away

	LDA	XDOT		; current location
	CMP	B		; if it is less than the low
	JC	ENDP		; then no plotting

;	CHECK FOR AUTO SCROLL

	DCR	C		; again check to see if there is auto scroll
	JNZ	NOSCR2		; if 0 then we do have auto scroll

	CPI	1		; is XDOT = 1?  if so then we are already
	JZ	NOSCR2		; at the bottom so no scroll

	INR	B		; see if we are just one away from the edge
	CMP	B		; by comparing XDOT to CURXLO-1
	JZ	SCROLLQ		; if yes then scroll

	DCR	B		; put B back to where it was

;	NOT TO FIND SCREEN LOCATION, SUBTRACT SCREEN LOW FROM XDOT

NOSCR2:	SUB	B		; sub XDOT-CURXLO
	STA	XPOSX		; and this is the new location

;	now see if y is cool all the way around

	LDA	AUTOS		; same motif as above
	MOV	C,A		; 

	LDA	CURYHI		; nothing new here if you can remember
	MOV	B,A		; what happened above

	LDA	YDOT		; current Y location
	CMP	B		; if it is greater than or equal to the 
	JNC	ENDP		; current Y hi then now we don't plot

;	check for auto scroll and hi range for Y

	DCR	C		; again we see if we have auto scroll
	JNZ	NOSCR3		; 

	CPI	127		; check to see if we are at the max
	JNC	NOSCR3		; if greater then we don't need a scroll

	DCR	B		; again check to see if we are almost there
	CMP	B		; or at least one away (B = CURYHI)
	JZ	SCROLLQ		; if so then go and scroll it

;	NOW CHECK FOR Y UNDER RANGE

NOSCR3:	LDA	AUTOS		; do it again one mo' time
	MOV	C,A		; 

	LDA	CURYLO		; 
	MOV	B,A		; B again holding the boundary

	LDA	YDOT		; 
	CMP	B		; if current < lo then end
	JC	ENDP		; 

;	CHECK FOR AUTO SCROLL

	DCR	C		; again checking if C = 1 or 0
	JNZ	NOSCR4		; if <> 0 then leave

	CPI	1		; is YDOT = 1     if yes then 
	JZ	NOSCR4		; leave

	INR	B		; else inc CURYLO and then test to see if 
	CMP	B		; YDOT is within one of CURYLO
	JZ	SCROLLQ		; if yes then go and scroll it

	DCR	B		; PUT B BACK WHERE IT WAS

;	FIND ACTUAL LOCATION

NOSCR4:	SUB	B		; A = YDOT : B = CURYLO
				; eg.  5 - 0 = 5

;	THIS GIVES THE DISTANCE FROM SCREEN 0, BUT ON TERMINALS 0 IS TOP
;	SO NEED TO INVERT TO BOTTOM

	MOV	B,A		; eg.  5 -> B
	MVI	A,23		;      23 -> A
	SUB	B		;     23 - 5 = 18
	STA	YPOSY		;    YPOSY = 18

	XRA	A		; clear carry
	RET			; 

ENDP:	STC			; set carry for error flag -- we are out of
	RET			; one of the four bounds so return

SCROLLQ:CALL	USER3		; go do the scroll routine
	JMP	SETC		; and then go and update the current locations




;	x and y are fine so let's go ahead and plot them

PLOT2:	JC	ENDP2		; if on entry carry is set then  error in SETC

	LXI	D,XPOSX		; point D to current cursor location
	CALL	CURSOR		; and go put it there through the CURPOS

	LDA	XDOT		; 
	MOV	B,A		; 

	LDA	YDOT		; 
	MOV	C,A		; B = X and C = Y to set up call below

	CALL	RDMATX		; get the character from the matrix
	MVI	A,1		; set graflg		
	sta	graflg
	CALL	PSTRNG		; and print the character to the consol

ENDP2:	POP	H		; 
	POP	D		; 
	POP	B		; 
	POP	PSW		; 
	RET			; GONZO WITH THE WINDO


;	******** CURSOR MOVEMENT ROUTINES ****************
;	SUBROUTINE TO DETERMINE THE MEMORY ADDRESS OF A
;	MATRIX COORDINATE IN NORMAL 32K ARRAY WHICH STARTS
;	AT "MATRIX" AND DOES X BEFORE Y. INPUTS..B=X, C=Y
;	'DE' DESTROYED, AND 'ACCU', 'HL' = ADRS AT EXIT


COORD:	PUSH	B		; save x and y
	MVI	D,250		; MULTIPLIER FOR Y
	CALL	MULT		; 

	LHLD	MATRIX		; standard starting point of the data
	DAD	B		; add to this the first offset -- Y
	POP	B		; get the original xy back

CDND:	MOV	E,B		; and move it into E
	MVI	D,0		; make x in de into 16 bits
	DAD	D		; add it to base
	RET			; HL NOW HAS ADDRESS



;	***** MOVE CURSOR ROUTINE ***************
;	NOTE:
;	IF 'ACCU' = 1 ON ENTRY, THE  OLD CURSOR POSITION WILL BE MARKED.
;	FOR TERMINAL, SIMPLY GET CORRECT CURSOR ADDRESS AND MOVE THERE.

LASTCUR:DW	00		; CURENT POS BEFORE MOVE

SETCURS:PUSH	PSW		; 
	PUSH	B		; 
	PUSH	D		; 
	PUSH	H		; standard save machine

	PUSH	PSW		; one more time
	MVI	A,1		; 
	STA	AUTOS		; turn on auto scroll

	CALL	SETC		; get the cussor position if on screen
	JC	NOCURS		; return with carry then it ain't on de screen

	POP	PSW		; get A back
	ORA	A		; if it is = to 0 then 
	JZ	NOSTC		; do not set current position

	LHLD	XDOT		; get current matrix postion
	PUSH	H		; and save it 

	LHLD	LASTCUR		; get the position last time through
	SHLD	XDOT		; and throw it into here to see if there

	CALL	SETC		;  has been a change
	JC	NOSTC		; 

	PUSH	D		; 
	LHLD	XDOT		; get it back  for it is within bounds
	MOV	B,L		; 
	MOV	C,H		; B=X, C=Y
	CALL	RDMATX		; go look at the character at that point

	PUSH	D		; 
	LXI	D,XPOSX		; point d to the char or string
	CALL	CURSOR		; and first put the cursor there
	POP	D		; 
	
	MVI	A,1
	STA	GRAFLG		; MORE,MORE 
	CALL	PSTRNG		; then print that bad boy
	POP	D		; 
	POP	H		; retrieve 'old' XDOT

	SHLD	XDOT		; and store in current
	CALL	SETC		;  to see if within range

NOSTC:	LXI	D,XPOSX		; point D to the place
	CALL	CURSOR		; put the cursor there
	JMP	NOC2		; continue exit

NOCURS:	POP	PSW		; get A back

NOC2:	LHLD	XDOT		; 
	SHLD	LASTCUR		; save this for next time through

	XRA	A		; 
	STA	AUTOS		; turn of the auto scroll

	POP	H		; restore the machine 
	POP	D		; 
	POP	B		; 
	POP	PSW		; 
	RET			; 



;	************ SIDE1, SIDE2 COMMANDS ******************
;	THIS ROUTINES DISSPLAY TOP OR BOTTOM SIDE OR BOARD
;	SIDE1 =TOP, WITHIN SCREEN LIMITS SET BY CURSOR.  CURSOR
;	SCREEN POSISTIONS ARE MOVED BY FUNCTION 3.

;	B=CURRENT X
;	C=CURRENT Y

SXPOS:	DB	00		; POS XY FOR CURSOR
SYPOS:	DB	04		; Y STARTS AT 4

SID1:	PUSH	PSW		; 
	PUSH	B		; 
	PUSH	D		; 
	PUSH	H		; 

	XRA	A		; zero
	STA	CURSID		; so that everything will be happening on side1

SRET:	CALL	PRTSCRN		; go print the screen
	CALL	SETC		; and go get the cursor

	LXI	D,XPOSX		; point it and do it
	CALL	CURSOR		; 

	POP	H		; restore that bad machine
	POP	D		; 
	POP	B		; 
	POP	PSW		; 
	RET			; 

SID2:	PUSH	PSW		; save the machine
	PUSH	B		; 
	PUSH	D		; 
	PUSH	H		; 

	MVI	A,1		; set up for side 2
	STA	CURSID		; 
	JMP	SRET		; go and print it


;	******* SRET SUBROUTINE PRINTS  OUT ONE PAGE  OF SCREEN INFO
;	BOUNDED BY CURXLO,CURYLO,  20 BY 80 USING RDMATX.

SIDCURS:DB	00,00		; CURSOR LOCATION

PRTSCRN:XRA	A		; zero out for
	STA	SIDCURS		; side 1

	MVI	A,3		; 
	STA	SIDCURS+1	; UPPER LEFT CORNER SCREEN

	LDA	CURXLO		; 
	STA	SXPOS		; temp screen coord vars

	LDA	CURYHI		; 
	STA	SYPOS		; temp vars for screen

	MVI	E,20		; to be used as a counter

;	NOW THE PRINT LOOP.  'D' IS INSIDE LOOP PRINTING 80 CHARACTERS,
;	'E' IS THE OUTSIDE LOOP PRINTING 20 LINES

PLINE:	MOV	A,E		; CHECK ALL LINES DONE
	CPI	0		; LAST LINE?
	JNZ	CHEK0		; CHECK FOR ZERO

;	IF 1, THEN ONLY DO 79 CHARACTERS, DUE TO AUTO LF

	MVI	D,79		; second counter
	JMP	CONT79		; continue

CHEK0:	MVI	D,80		; reset the no. of characters

CONT79:	PUSH	D		; save it tempwise
	LXI	D,SIDCURS	; and move the cursor there
	CALL	CURSOR		; 
	POP	D		; get it back

PCHAR:	MOV	A,D		; use it test
	ORA	A		; if we are at the end
	JZ	ENDLIN		; of this line

	PUSH	D		; 
	LDA	SXPOS		; get temp of current cursor x coord
	MOV	B,A		; B=X

	LDA	SYPOS		; 
	MOV	C,A		; C=Y

;	NOW SEE IF THESE MATCH THE BLINK POSITIONS, AND CALL THE
;	ROUTINE TO SET THAT ATTRIBUTE IF SO.

	LDA	BLINK1		; GET X
	CMP	B		; if not = to B
	JNZ	NOBLINK		; then no blinky

	LDA	BLINK1+1	; get the y part of first blink point
	CMP	C		; is it = to SYPOS 
	MVI	A,'S'		; 
	JZ	BLINKOK		; if SYPOS is equal then go ahead and blink

NOBLINK:LDA	BLINK2		; the second blink point x coord
	CMP	B		; is it equal to SXPOS
	JNZ	NOBL		; if not then no blinky

	LDA	BLINK2+1	; get the y of the second blink point
	CMP	C		; is it equal to SYPOS
	JNZ	NOBL		; if not then no blink

	MVI	A,'D'		; to lable Destination

BLINKOK:PUSH	D		; current count

;	EXPLANATION:  SINCE THE TERMINAL CANNOT DISPLAY A BLINKING
;	CHARACTER WITHOUT THE ATTRIBUTE CHARACTERS VISIBLE ON EACH 
;	SIDE OF IT, WE WILL MARK ONLY WITH S AND D.  IF THE TERMINAL IS
;	CAPABLE OF BLINKING A SINGLE CHARACTER, PRINT A STRING WHICH 
;	WILL DO SO, (THEN REMEMEBER TO TURN BLINK OFF)
;	'ACCU' CONTAINS THE BLINK CHARACTER

	CALL	WRITE		; put either S or D on the screen
	POP	D		; get the count back
	JMP	NOBL2		; do not print normal character

NOBL:	CALL	RDMATX		; get character within the matrix
	mvi 	a,1
	sta	graflg		; another time
	CALL	PSTRNG		; and print the character

NOBL2:	POP	D		; this is now the number of chars on the line
	DCR	D		; since we did something dec it

	LDA	SXPOS		; inc the x coord
	INR	A		; since we have moved over 1
	STA	SXPOS		; for the next loop through

	JMP	PCHAR		; go do it again

ENDLIN:	LDA	CURXLO		; get the left side lo
	STA	SXPOS		; and put in temp before loop

	LDA	SYPOS		; get the y
	DCR	A		; dec it cuz' we be movin on down
	STA	SYPOS		; 

	LDA	SIDCURS+1	; get the location of the line to print
	INR	A		; 
	STA	SIDCURS+1	; and store

	MOV	A,E		; this is the external loop counter
	CPI	0		; and if it is down to 
	RZ			; zero then all done

	DCR	E		; else dec that bad boy
	JMP	PLINE		; and jam to print another line


	END
