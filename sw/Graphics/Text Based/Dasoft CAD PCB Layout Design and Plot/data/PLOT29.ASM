;	*****************************************************************
;	*								*
;	*	Plotter control subroutines for DASOFT DA SYSTEM	*
;	*  	Copyright (c) 1981  DASOFT DESIGN SYSTEMS, INC.		*
;	*								*
;	*	These programs are protected by licensing agreements	*
;	*	and cannot be used or duplicated without written	*
;	*	permission from DASOFT.					*
;	*								*
;	*****************************************************************
;
;			rev 2.6			cwm	4/1/85
;			2.6 requires the use of 2 new flags, twoex and cirk.
;			these are at the end of the driver and orged at 1bf0  

;	                FOR YOUR INFORMATION
;                       --------------------
;	This driver uses the CP/M LIST DEVICE to send the data via an
;	RS-232 link to the DMP-29.  
;	The DMP-29 should be in MODE 1, *NOT* the dual serial port mode.
;	The DASOFT system will be sending data to the plotter and to
;	the console during plot sequences. XON-XOFF handshaking (if used) 
;	is normally handeled through the CP/M LIST DEVICE protocol.

OUTFUNC	EQU	5		; send to CP/M LIST DEVICE 

;	Above is the equate to send the data to the CP/M LIST DEVICE,
;	function number 5.  If you would like it sent to the PUNCH DEVICE, 
;	etc..., you may change this equate.  If using another output
;	technique, you will need to modify the program segments.

;	if XON-XOFF protocol, no delays are needed.

;	The following are locations defined in the load kernal

VERS	EQU	0032H	; version
REV	EQU	0034H	; revision
EDIT	EQU	0064H	; edit letter
	            
WBOOT	EQU	0000H	; WARM BOOT ADDRESS
TYPEF	EQU	0002H	; BDOS PRINT COMMAND NUMBER
BDOS	EQU	0005H	; ADDRESS  OF BDOS JUMP POINT
BUFF	EQU	0080H	; ADDRESS OF DISK INPUT BUFFER
DMA	EQU	001AH	; SET DMA ADDRESS FUNCT NUMB
READF	EQU	0014H	; DISK READ FUNCTION
WRITEF	EQU	0015H	; WRITE FILE TO DISK NUM
OPENS	EQU	000FH	; OPEN FILE FUNCT NUMBER
CLOSES	EQU	0010H	; CLOSE  FILE FUNCT NUMBER
                   
FCB	EQU	005CH	; FILE CONTROL BLOCK ADRS
FCBDN	EQU	005CH	; FCB DISK NAME
FCBFN	EQU	005DH	; FILE NAME
FCBFT	EQU	0065H	; FILE TYPE
FCBEX	EQU	0068H	; CURRENT EXTENT NUMBER
FCBRC	EQU	006BH	; EXTENT RECORD COUNT (0-128)
FCBCR	EQU	007CH	; CURRENT (NEXT) RECORD NUMBER
FCBR0	EQU	007DH	; LSB OF 16 BIT RANDOM RECORD ADDRESS
FCBR1	EQU	007EH	; MSB OF 16 BIT RANDOM RECORD ADDRESS
FCBR2	EQU	007FH	; RECORD OVERFLOW FLAG
                    
TOPPTR	EQU	0006H	; WAS (AD00H) STACK START 48K
                   
CLEAD	EQU	0001H	; CURSOR POSITIONING string CODE
P3LINES	EQU	0003H	; PRINT THREE LINES
CONTMSG	EQU	000BH	; CONTINUE MESSAGE CODE
CLS	EQU	000CH	; CLEAR SCREEN CODE
IVON	EQU	000EH	; INVERSE ON CODE
IVOFF	EQU	000FH	; INVERSE OFF CODE
                   
CR	EQU	000DH	; RETURN CHARACTER
LF	EQU	000AH	; LINE FEED CHARACTER
BEEP	EQU	0007H	; BEL CHARACTER
TAB	EQU	0009H	; TAB CHARACTER
BS	EQU	0008H	; BACK SPACE
ESC	EQU	001BH	; ESCAPE
EOM	EQU	00EEH	; END OF MESSAGE MARKER (OVERLAY FILE)
EOF	EQU	00FFH	; END OF FILE MARKER    (OVERLAY FILE)
MSCNT	EQU	00F9H	; 1 MSEC SOFTWARE DELAY CONSTANT
                   
RDRL	EQU	0103H	; LOADER KERNAL OR TEST PROG
CLEARS	EQU	0108H	; CLEAR SCREEN ROUTINE
PSTRNG	EQU	010EH	; PRINT AN ASCII string
INCHNE	EQU	011DH	; ROUTINE TO READ CONSOLE NO ECHO
DUMP	EQU	014DH	; BLOCK MOVE ROUTINE


;      ***** Revision 2.6 for HOUTSTON INSTRUMENTS DMP-29 ******

	org 1800H	; load address of driver for DASOFT 2.6

;	jump table entry points for external entry
;	PINIT, CHGPPR, and CHGPEN may need to be changed by user

PINIT:	JMP	INIT		; INITIALIZE OUTPUT PORT
				; setup communications between the computer...
				; ...and the plotter.
PHOME:	JMP	HOME		; HOME THE PLOTTER TO 0,0
				; in this driver the user will be asked for...
				; ...a string to be sent to the plotter...
				; ...if a (RETURN) is entered without an...
				; ...entry the home command will be sent.
VECTOR:	JMP	MOVE		; move the pen ... with the X,Y vectors in...
				; ...TBLAD along with pen up/down information
CHGPPR:	JMP	CHGPR		; CHANGE PAPER COMMAND
CHGPEN:	JMP	CHGPN		; this plotter can change pens itself so...
				; ...the instructions for the plotter are...
				; ...sent to the plotter by this routine...
				; ...the number of the new pen is in the...
				; ...(A) register on entry.

;	table of 12 bit vectors for plotter

TBLAD:				; PLOTTER COORDINATE TABLE
	db	0000$0000b	; X low
	db	0000$0000b	; pen up/down, X sign, X high
	db	0000$0000b	; Y low
	db	0000$0000b	; Y sign, Y high

YASIGN:	db	00		; SIGN OF Y CORRECTION 0=+
YADJUST:db	00  		; MAGNITUDE OF Y CORRECTION

XASIGN:	db	00		; SIGN OF CORRECTION 0=+
XADJUST:db	00		; NUMBER OF GRIDS BEFRE CORRECTION X

SLOW:	db	00		; FLAG FOR DRAWING SLOW LINES

;vecptr:	dw	@vector		; address of completed vector string

; *************************************************************************
;   ~~~~~~~~~~~~~~~ PLOTTER PORT INITIALIZE ROUTINE ~~~~~~~~~~~~~~~~~~~~~
; *************************************************************************

used?	equ	0000$0010b	; first time through flag

INIT:	push	psw		; 
	push	b		; 
	PUSH	D		; save (DE)
	push	h		; 

	lxi	h,cmdflg	; 
	mvi	a,used?		; 
	ana	m		; test for first time through
	jz	noSIGN		; 

	LXI	D,@signon	; point to ID mesage
	CALL	PSTRNG		; send it to the console

	mvi	a,used?		; 
	cma			; 
	ana	m		; 
	mov	m,a		; 

noSIGN:	LXI	D,@init		; point to plotter init message
	CALL	PLIST		; send it to the plotter

	LDA	SLOW		; get slow flag
	ORA	A		; test for zero
	lxi	d,@fast		; point to fast command
	JZ	setSPD		; zero = NORMAL SPEED
				; nonzero = half speed
	LXI	D,@slow		; point to HALF SPEED command 
	jmp	setSPD		; send it to the plotter

setSPD:	call	Plist		; send speed command

; ~~~~~~~~~~~~~~~~~~~ restore registers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

restore	POP	H		; 
	POP	D		; 
	POP	B		; 
	POP	PSW		; restore machine
	RET			; return to caller

; ********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~ HOME PLOTTER COMMAND ~~~~~~~~~~~~~~~~~~~~~
; ********************************************************************

H?help	equ	0000$0001b	; home help flag

HOME:	PUSH	PSW		; 
	PUSH	B		; 
	PUSH	D		; 
	PUSH	H		; save machine

	call	penUP		; pick up the pen

	LXI	D,@home		; point to home plotter command string

	lda	cmdflg		;
	ani	H?help		; 
	jz	gohome		; 

	mvi	b,30		; buffer length
	mvi	a,'$'		; load (A) with space
	lxi	h,@buf		; point to data buffer

kbuf:	mov	m,a		; store in buffer
	inx	h		; bump pointer
	dcr	b		; decriment counter
	jnz	kbuf		; loop til done

	lxi	d,@nuorg	; point to prompt
	call	pstrng		; send it to the console

	lxi	d,@buflen	; point to data buffer
	mvi	c,10		; read console buffer function number
	call	bdos		; execute function

	lxi	d,@crlf		; point to return string
	call	pstrng		; send it to the console

tsthm:	LXI	D,@home		; point to home plotter command string

	lda	@bufcnt		; get number of characters input
	ora 	a		; test for zero
	jz	gohome		; if zero then send home command

	lxi	d,@buf		; point to input buffer

gohome:	CALL	PLIST		; send string to plotter
	jmp	restore		; restore machine

; *********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~ CHANGE PAPER ROUTINE ~~~~~~~~~~~~~~~~~~~~~
; *********************************************************************

;	SOME PLOTTERS CAN CHANGE THEIR OWN PAPER, WHICH IS WHY
;	THERE  IS A USER ROUTINE FOR THIS. 

CHGPR:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; 

	LXI	D,@chgppr	; PRINT MESSAGE
	CALL	PSTRNG		; CALL PRINT ROUTINE
	CALL	INCHNE		; WAIT FOR ANSWER

	jmp	restore		; restore machine

; *********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~ CHANGE PEN ROUTINE ~~~~~~~~~~~~~~~~~~~~~~~~~
; *********************************************************************

;	AGAIN, SOME PLOTTERS CAN CHANGE THEIR OWN PEN

;	** CONTACT DASOFT FOR MORE INFORMATION.
;	** THE DMP-29 PEN FACILITY IS OPERATIONAL. 

;	for SCHEMATIC plotting: 

;		00 OR 000 PEN IN SLOT #1.  

;	for PCB plotting: 

;		TRACE pens in #1 AND #2
;		POWER GRID pen in #3
;		FAT LINE pen in #4

;	THE PEN SIZE IS SENT IN THE ACCUMULATOR ON CALL

;	NO OTHER INPUTS
;	NO OUPUTS.

CHGPN:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; 

	push	psw		; 
	call	penUP		; pick up the pen first
	pop	psw		; 

	mov	b,a		; put new pen number in (B)
	lda	curpen		; get the current pen number in (A)
	cmp	b		; test for match
	jz	restore		; no change if match

	mov	a,b		; get pen number back in (A)
	sta	curpen		; say what pen is in use

	ori	00110000b	; make number in (A) ascii
	sta	@pennum		; put in message

	LXI	D,@pencmd	; point to change pen command string
	CALL	PLIST		; send command to plotter
	jmp	restore		; return to caller

; **********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~ PLOTTER CONTROL ROUTINES ~~~~~~~~~~~~~~~~~~~
; **********************************************************************

;	DATA IS STORED IN TBLAD AS  XLOW, XHI, YLO , YHI
;	WITH BIT 10 (H) AS SIGN, BIT 20(XH) PEN DOWN
;	FIRST CHECK PEN UP, PEN DOWN

penU?D	equ	0010$0000b	; pen up/down flag

MOVE    LDA	cirk		; test for circle
	ana	a		;
	jnz	move1		; in this set-up, circles are at one step always
	lda 	twoex		; test for 2x
	ana	a
 	cnz	move1		; if flag set call, then rets and falls thru
				; to move1 a second time. if not then one move.


MOVE1	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; 

	LDA	TBLAD+1		; get pen up/down, sign, X high byte
	ANI	penU?D		; CLEAR ALL BUT PEN BIT
	JZ	PENGOUP		; zero = pen up

; ~~~~~~~~~~~~~~~~~~~~~~~~ PEN GOING DOWN? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

penDN:	LDA	penstat		; WHAT IS THE PEN NOW?
	ORA	A		; test for zero
	JNZ	NOPEN		; NO NEED TO SEND PEN COMMAND

	lda	@penDN		; 
	CALL	send?A		; execute function

	MVI	A,1		; load nonzero byte to (A)
	STA	penstat		; say the pen is down

	JMP	NOPEN		; go on through

; ~~~~~~~~~~~~~~~~~~~~~~~~ PEN GOING UP? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PENGOUP:LDA	penstat		; WHAT IS THE PEN NOW?
	ORA	A		; test for zero
	JZ	NOPEN		; if up now then skip next code

	call	penUP		; pick pen up
	xra	a		; zero (A)
	STA	penstat		; say pen is up

; ~~~ FIRST WE CHECK FOR A 0 LENGTH VECTOR, THERE ARE LOTS SOMETIMES ~~~

NOPEN:	LDA	TBLAD+1		; get X high
	ANI	0000$1111b	; strip off excess shit
	JNZ	NONZERO		; go on through if somthing there

	LDA	TBLAD+3		; get Y high
	ANI	0000$1111b	; strip excess shit out
	JNZ	NONZERO		; go on through if somthing there

	LDA	TBLAD		; get X low
	ORA	A		; test for zero
	JNZ	NONZERO		; go on through if somthing there

	LDA	TBLAD+2		; get Y low
	ORA	A		; test for zero
	jz	restore		; all zero so return to caller
	
; ~~~~~~~~~~~~~~~ PUT POINTER IN DE, VALUE IN HL ~~~~~~~~~~~~~~~~~~~~~~~

NONZERO:LXI	D,@coords	; X POSITION

	call	X?flg		; 
	call	Y?flg		; 

	call	setXval		; 
	call	setYval		; 

	LXI	D,@coords	; point to vector string
	CALL	PLIST		; send it to the plotter
	jmp	restore		; return to caller

; ********************************************************************
;  ~~~~~~~~~~~~~~ PRINT string TO OUTFUNCT SUBROUTINE ~~~~~~~~~~~~~~
; ********************************************************************

;	THIS PRINTS A string POINTED TO BY THE (DE) REGISTER PAIR
;	TO THE OUT FUNCTION DEVICE (LIST DEVICE).  

;	THE string MUST BE TERMINATED BY A $ DOLLAR SIGN.  

;	ALL REGISTERS SAVED.

PLIST:	PUSH	PSW		; 
	PUSH	B		; 
	PUSH	D		; 
	PUSH	H		; save machine

PLOOP:	LDAX	D		; BRING IN CHARACTER
	CPI	'$'		; test for terminator
	JZ	restore		; END IF DOLLAR SIGN

	call	send?A		; 
	INX	D		; bump pointer
	JMP	PLOOP		; loop til done

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	send character in (A) to plotter

send?A:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; 

	mov	e,a		; character to send, pen up
	MVI	C,OUTFUNC	; list device function number
	CALL	BDOS		; execute function

	jmp	restore		; 

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

setXval:lxi	h,Xval		; 
	shld	decptr		; setup deconvert buffer

	LHLD	TBLAD		; get X coordinate in (HL)

T2dec:	mov	a,h		; 
	ani	0000$1111b	; just need 12 bits
	mov	h,a		; 

	CALL	prn?HL		; go convert it to an ascii ...
	ret			; 

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

setYval:lxi	h,Yval		; 
	shld	decptr		; setup output buffer

	LHLD	TBLAD+2		; get Y coordinate in (HL)
	jmp	T2dec		; 


; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

penUP:	lda	@penUP		; 
	call	send?A		; 
	ret			; 

; **********************************************************************
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ X?flg ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **********************************************************************

X?flg:	lda	tblad+1		; get high byte of X coordinate
	call	n?p		; get X sign
	sta	Xsign?		; set X sign
	ret			; return to caller

; **********************************************************************
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Y?flg ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **********************************************************************

Y?flg:	lda	tblad+3		; get high order byte of Y coordinate
	call	n?p		; get Y sign
	sta	Ysign?		; set Y sign
	ret			; return to caller

; **********************************************************************
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ n?p ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **********************************************************************

n?p:	ani	sign?		; get Y sign
	mvi	a,'+'		; assume positive
	rz			; return to caller

	mvi	a,'-'		; get negative flag
	ret			; return to caller

; **********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~ prn?HL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **********************************************************************

;	convert 'HL' to ascii decimal and print them out
;	16 bit un-signed

sign?	equ	0001$0000b	; sign bit position

digits:	db	4		; number of digits to send
@coords:
Xsign?:	db	'+'		; 
Xval:	db	'0000'		; 
xSPy:	db	' '		; 
Ysign?:	db	'+'		; 
Yval:	db	'0000'		; 
xySP:	db	' $$$'		; vector buffer

clrDB:	lhld	decptr		; get addr. of decimal buffer

	mvi	a,' '		; 
	sta	xSPy		; in case it was distroyed
	sta	xySP		; 

	lda	digits		; get number of digits

clrdec:	ora	a		; 
	rz			; 

	push	psw		; 
	xra	a		; 
	mov	m,a		; 
	inx	h		; 
	pop	psw		; 

	dcr	a		; count one gone
	jmp	clrdec		; loop 'til done


prn?HL:	push	psw		; 
	push	b		; 
	push	d		; 
	push	h		; save all
	push	h		; 

	call	clrDB		; go clear decimal buffer

	xra	a		; 
	sta	leadZ		; 

	pop	h		; get number to deconvert back

	lxi	d,1000		; 
	call	phl1		; print 1,000s
	lxi	d,100		; 
	call	phl1		; print 100s
	lxi	d,10		; 
	call	phl1		; print 10s

	mvi	a,'0'		; 
	ora	l		; 
	call	add??		; print out the 1s

	pop	h		; 
	pop	d		; 
	pop	b		; 
	pop	psw		; 
	ret			; return to caller

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

phl1:	call	phl2		; loop counter
	mov	a,b		; get count from (B)
	ora	a		; test for zero
	jnz	addnum		; if not zero then add number to list

addZIP:	lda	leadZ		; get leading zero flag
	ora	a		; test for leading zeros

	lda	pading		; get ready to put in the padding
	jz	add??		; go add space if nothing has been printed yet

	mvi	a,'0'		; zero
	jmp	add??		; go add a zero

addnum:	mvi	a,1		; 
	sta	leadZ		; print all from now on

	mvi	a,'0'		; 
	ora	b		; make ascii

add??:	lhld	decptr		; 
	mov	m,a		; 
	inx	h		; 
	shld	decptr		; 

;	call	write		; print

	lhld	HEXnum		; 
	ret			; return to caller

 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

phl2:	mvi	b,0		; reset counter

phl2a:	shld	HEXnum		; save current number

	call	sbcDEHL		; add (DE) to (HL)
	rc			; exit if (HL) is less than (DE)
 
	inr	b		; bump counter (0-9)
	jmp	phl2a		; loop if (HL) is greater than (DE)


leadZ:	db	00		; leading zero flag
pading:	db	00		; pad value
hexnum:	dw	0000		; number we are working on
decptr:	dw	decbuf		; pointer into buffer
decbuf:	db	'      '	; decimal buffer


; **********************************************************************
;   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ sbcDEHL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **********************************************************************

;	*********** 16 bit subtraction ROUTINE **********
;	subtract (DE) from (HL)

;	INPUTS:	(DE) 	16 bit value1
;		(HL)	16 bit value2

;	output:	(HL) 	((HL) - (DE))
;		(FLAGS)
;		carry SET if (DE) is larger than (HL)
;		carry CLEAR if (DE) is less than (HL)

sbcDEHL:mov	a,l		; 
	sub	e		; subtract 1st without borrow
	mov	l,a		; 
	mov	a,h		; 
	sbb	d		; subtract next with borrow
	mov	h,a		; 
	ret			; return to caller

; **************************************************************************
;   ~~~~~~~~~~~~~~~~~~~~ plotter driver variables ~~~~~~~~~~~~~~~~~~~~~~~~
; **************************************************************************

curpen:	db 	00		; CURRENT PEN IN PLOTTER
penstat:db	00		; current pen status

SIGN:	db	00		; sign of vector in use
LEAD0:	db	00		; LEADING 0'S SUPPRESS
THOUS:	db	00		; thousands place
HUNDS:	db	00		; hundreds place
TENS:	db	00		; tens place
ONES:	db	00		; ones place

cmdflg:	db	0000$0010b	; bit 0 set means ask for keyboard input on home command	
				; bit 1 set means this driver has not been initialized

@buflen:db	30		; length of plotter command input buffer
@bufcnt:db	00		; number of characters entered storage
@buf:	db	'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
@nuorg:	db	cr,lf,lf	; plotter command prompt
	db	'Enter plotter command, (ret) = HOME'
	db	cr,lf		; 
	db	':$'		; 
@chgppr:db	cr,lf		; change plotter paper message
	db	'Change PAPER and hit (SPACEBAR)'
	db	beep,beep	; 
	db	'$'		; 
@signon:db	cr,lf,lf	; driver signon message
	db	' * DMP-29 Plotter Driver, Rev 2.6 *'
	db	cr,lf,lf,lf	; 
	db	'-- For schematics --'
	db	cr,lf
	db	' slot  1   - line pen'
	db	cr,lf,lf,lf	; 
	db	'-- For artwork --'
	db	cr,lf
	db	' slots 1&2 - line pens'
	db	cr,lf
	db	' slot  3   - POWER GRID pen'
	db	cr,lf
	db	' slot  4   - FAT LINE pen'
	db	lf		; 
@crlf:	db	cr,lf,'$'	; carrage return, line feed
@penDN:	db	'D'		; pen down command
@penUP:	db	'U'		; pen up command
@pencmd:db	'P'		; change pen command leadin 
@pennum:db	'1 $'		; pen number for change
@home: 	db	';:H $'		; home plotter command
@init:	db	';:U RH V12 $'	; plotter initialization string
@slow:	db	';:V4 $'	; velocity setting for half speed
@fast:	db	';:V16 $'	; fast setting
@vector:db	';: R $'	; vector leadin string

	org 1bf0h		; fix location of new flags
	
twoex	db	00		; new flag 
cirk	db	00		; new flag
	

	END
