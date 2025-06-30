;
;	GSX-80 driver for Digital Research Dr Logo v2.0
;	Copyright (C) 2024 by Roberto Sancho
;      
;       hooks BDOS function 60 (call to RSX)
;       works to populate params and jumpblock as stated in
;       http://www.seasip.info/Cpm/drlogo.html (by John Elliott, undated)
;       issue GSX calls to draw image on screen 
;
	.z80
	.list
	CSEG

;	PRL Initialization entry point: 
;	- print welcome message
;	- hook BDOS function 60 
;	- adjust end of TPA
;
;       first 512 bytes of PRL are initialization code
;       and thus discarded after init
; 

Start:	
	ld	hl,(0006)	; save real BDOS
	ld 	(BDOS+1),hl	
	ld	hl,MAIN		; hook BDOS call
	ld	(0006),hl	; sets new TPA end
	
	ld	c,9		; print string
	ld	de,wtext	; welcome message
	call	0005	
	
	ld	c,9		; print string
	ld	de,hftxt	; Hook address report
	call	0005	
	ld	hl,(0006)
	call 	DispHLhex	; print addr in hex
	ld	c,9		; print <CR><LF>
	ld	de,txtend	
	call	0005	
	
	ret			; return, end of initialization of LGGSX
	
wtext: 	DB	'---------------------------------------------------',13,10
	DB	'DrLogo GSX Driver                       Version 1.0',13,10
	DB	'Copyright (c) 2024 by Roberto Sancho               ',13,10
	DB	'---------------------------------------------------'
txtend:	DB	13,10,'$'
hftxt:  DB	'Hook BDOS function 60 at 0x','$'

;
; Display a 16- or 8-bit number in hex.
; The value to be shown should be stored in HL
; code based on https://github.com/skx/z80-examples/blob/master/number-output.z80
;
DispHLhex:
	push	hl
	ld  	a,h
   	call  	OutHex8		; Show the high-value
   	pop 	hl
	ld  	a,l		
   	call 	OutHex8		; Show the low-value
	ret

	; Output 2-hex value of the 8-bit number stored in a
OutHex8:
   	push	af
   	rra
   	rra
   	rra
   	rra
   	call  	Conv
   	pop	af
Conv:	and  	0fh
   	add  	a,90h
   	daa
   	adc  	a,40h
   	daa
   	; Show the value.
   	ld	e,a
   	ld	c,2
   	call	0005	; out one char
   	ret

; reserve storage to fill up to 512 bytes
; of discardable init space

IniPad:	DS	512-(IniPad-Start)

;
; PRL BDOS Hook
;
MAIN:
	push 	af
	ld	a,c	
	cp	60		; is BDOS func 60 = call to RSX ?
	jp 	z, HookFn60
	pop	af
BDOS:	jp	0000		; jump to real BDOS
	
HookFn60:			; process RSX call
	pop	af

	ex	de,hl
	ld	(RSXPBlock),hl	; save RSX param block
	
	; decode RSX param block
	
	ld	a,(hl)		; get the RSX function called
	ld	(RSXfunc),a
	inc	hl
	ld	a,(hl)		; get the number of words in param passed to RSX
	ld	(RSXnumwords),a
	inc	hl
	ld	de,RSXparam0	; get the four firsts params (ignore RSXnumwords value)
	ld	bc,4*2
	ldir
	
	; perform RSX functions
	
	ld	a,(RSXfunc)
	cp	0
	jp	z,RSXfunc0
	
	; function not defined. Just return
	ret
	
RSXPBlock: 	DW	0	; the BDOS func 60 Call RSX parameters block
RSXfunc: 	DB	0	; the RSX func called
RSXnumwords: 	DB 	0	; the number of words (=number of params)
RSXparam0: 	DW	0	; four first params
RSXparam1: 	DW	0		
RSXparam2: 	DW	0		
RSXparam3: 	DW	0		
	
	; RSX function 0
RSXfunc0:	
	; RSXfunc 	DW	0		;RSX function 0
	; RSXparam0	DW	params		;Buffer to receive LOGO screen parameters
	; RSXparam1	DW	jumpblock	;Buffer to receive function jumpblock	
	
params		EQU	RSXparam0		;equates to ease RSX func implementation
jumpblock	EQU	RSXparam1

	; populate params
	ld	hl,(params)
	ex	de,hl
	ld	hl,LogoParams
	ld	bc,30h
	ldir
	; populate jumpblock
	ld	hl,(jumpblock)
	ex	de,hl
	ld	hl,LogoJumpBlock
	ld	bc,4eh
	ldir
	jp	0100h		; do not return, instead re-start logo interpreter

LogoParams:
nlines:	DW	24		;params+00h	DW	* Text screen height, characters
	DW	80		;params+02h	DW	* Text screen width, characters
	DW	24		;params+04h	DW	* Text screen height, characters
	DW	80		;params+06h	DW	* Text screen width, characters
	DW	16		;params+08h	DW	* Standard split line
	DW	1		;params+0Ah	DW	Default foreground ink
	DW	0		;params+0Ch	DW	Default background ink
	DW	4		;params+0Eh	DW	Text X-coordinate mask for tabulation
	DW	8		;params+10h	DW	* Maximum foreground ink number 
	DW	1		;params+12h	DW	Maximum R/G/B value for SETPAL
	DW	0		;params+14h	DW	Unknown - possibly a frequency limit for TONES?
	DW	0ffffh		;params+16h	DW	Maximum paddle number (-1 for none)
xdots:	DW	1024		;params+18h	DW	* Graphics screen width, pixels
ydots:	DW	256		;params+1Ah	DW	* Graphics screen height, pixels
	DW	8		;params+1Ch	DW	Unknown - possibly character height in pixels
	DW	10		;params+1Eh	DW	Maximum scrunch ratio (for SETSCRUNCH)
	DW	0		;params+20h	DW	Nonzero if separate text and graphics screens
	DW	0		;params+22h	DW	* Maximum background ink number
	DW	24		;params+24h	DW	* Maximum split line (usually = text screen height)
	DW	14		;params+26h	DW	* Pixel width  (for setting initial aspect ratio)	
	DW	32		;params+28h	DW	* Pixel height
	DW	PRGTIT		;params+2Ah	DW	Address of program title, ASCIIZ, to be shown on startu screen
	DW	EDTTIT		;params+2Ch	DW	Address of "Edit", ASCIIZ
	DW	UNDRSC		;params+2Eh	DW	Address of "_" (used for drawing horizontal lines in	
				;			text mode), ASCIIZ	
PRGTIT: DB	"DrLogo 2.0",0
EDTTIT: DB	"Edit",0
UNDRSC: DB	"_",0

LogoJumpBlock:
	JP	init		;+0000	Any initialisation should already have been done 
				;	when the RSX was called, so this is normally a no-op.
	JP	bye		;+0003	Terminate Logo. Undo any initialisation and jump
				;	to zero rather than returning.
	JP	txtmode		;+0006	Switch to text mode, enable cursor.
	JP	gfxmode		;+0009	Switch to graphics or split-screen mode. One 
				;	parameter: 0 for fullscreen graphics, else split line.
	JP	conin		;+000C	As the BIOS CONIN function, returning result in HL.
	JP	const		;+000F	As the BIOS CONST function, returning result in HL.
	JP	conout		;+0012	One parameter: Character to output. If not in 
				;	fullscreen graphics mode, output it using the BIOS
				;	CONOUT function.
	JP	clrtext		;+0015	Clear some or all of the text screen. Two 
				;	parameters (X,Y) giving the top / bottom line of area to clear.
				;	area to clear.
	JP	setcurpos	;+0018	 ;Set text cursor position. Two parameters (X,Y).
	JP	scroll		;+001B	Scroll some or all of the text screen up one line. Two 
				;	parameters (X,Y) giving the top / bottom line of area to scroll.
	JP	plot		;+001E	Plot a point. Four parameters: (X,Y,pen,colour)
				;	where pen is 0 for Pen Up, 1 for Pen Down, 2 for Pen Xor, 
				;       3 for Pen Erase
	JP	draw		;+0021	Draw a line. Six parameters: (X1,Y1,X2,Y2,pen,colour)
	JP	bg_set		;+0024	Set background colour. One parameter: the colour.
	JP	clrgfx		;+0027	Clear graphic screen. Two parameters: colour, height
				;	in pixels.
	JP	beep		;+002A	Sound the beeper.
	JP	memtop		;+002D	Return the top of memory in HL.	
	JP	getpix		;+0030	Get the colour at the specified point. Two parameters
				;	(X,Y). Returns the colour in HL.
	JP	listst		;+0033	Return printer ready status in HL.
	JP	list		;+0036	Send a byte to the printer. One parameter.
	JP	noop		;+0039	Not called.
	JP	noop		;+003C	Not called.
	JP	noop		;+003F	Not called.
	JP	noop		;+0042	Not called.
	JP	noop		;+0045	Not called.
	JP	savepic		;+0048	Save picture record. Two parameters; buffer address,
				;	record number. Returns Z reset if buffer populated, 
				;	set if no more records to be written.
	JP	loadpic		;+004B	Load picture record. Two parameters: buffer address,
				;	record number. Returns Z reset if record was OK,
				;	set if file is invalid or end of file reached.

beep:	
noop:	
	ret	

memtop:	; return top of mem in HL
	ld      hl,(0006)
	ld      a,h
	or      l
	ret     

getarg:	; guarantees bc is preserved. Set ix to addr of funtion arg frame

	ld	ix,2		
	add	ix,sp		; sp points to arg pushed by caller before calling routine
	pop	hl		; retrieve it in hl
	push    bc		; save bc 
	call	getar1		; call the func
	pop	bc
	ld      a,h
	or      l
	ret     
getar1: jp      (hl)

conin:	
	call    getarg		; preserves bc
	ld	hl,EscShowCursor
	call	PrtHL		; Show/enable cursor 
conin1:	ld	c,6		
	ld	e,255		; call BDOS func 6 read console
	call	0005		; return 0 if no char available. 
	or	a
	jp	z,conin1	; wait for keypress
	ld      l,a
	ld      h,0
	ret     
	
const:	
	call    getarg		; preserves bc
	ld	c,11		; call BDOS func 11 console status
	call	0005		; return 0 if no char available. 
	or	a
	jp	z,const1	
	ld	a,255		; $ff if char availble
const1:	ld      l,a
	ld      h,0
	ret     

listst:
	call    getarg		; preserves bc
	ld      h,0
	ret     

list:		
	call    getarg		; preserves bc
	ld      e,(ix+2)
	ld	c,5		; call BDOS func 5 printer output
	call	0005		
	ld      h,0
	ret     

PrtA:	; print char in reg a
	ld	e,a
	ld	c,2		; call BDOS func 5 console output
	call	0005	
	ret

PrtHL:	; prints stringz pointed by HL
	ld	a,(hl)
	or	a
	ret	z
	push	hl
	call 	PrtA
	pop	hl
	inc	hl
	jp	PrtHL

txtmode:
	ld iy,200h ; YYY
	call    getarg		; preserve bc
	ld	a,0ffh	
	ld	(Echo),a	; Echo=ff -> enable print chars on text screen
	ld	hl,EscShowCursor
	call	PrtHL		; print Show/enable cursor escape sequence
CloseGsx:
	ld	a,(GsxOpen)
	or	a
	ret	z
	; now call GSX CloseWorkStation 
	ld	hl,2		; gsx func 2 = CloseWorkstation
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	hl,0		
	ld	(Nintin),hl	; num int in = 0
	ld	de,pblock
	ld	c,115
	call	0005
	xor	a
	ld 	(GsxOpen),a	; GSX WorkStation is closed	
	ret

conout:	
	ld iy,220h ; YYY
	call    getarg		; preserve bc
	ld	a,(Echo)
	or	a
	ret	z		; return if Echo=0
	ld      a,(ix+2)	; get the char to print
	jp	PrtA

init:
	ld iy,202h ; YYY
	call    getarg		; preserve bc
	ld	hl,EscDiscardAtEOL
	call	PrtHL		; chars at end of line does not send an auto <CR><LF>
	ret

gfxmode:
	; Switch to graphics or split-screen mode. One 
	; parameter: 0 for fullscreen graphics, else split line.
	ld iy,203h ; YYY
	call    getarg		
	ld      a,(ix+2)	
	ld      (Echo),a	; Set echo. Echo=$ff -> enable printing on text screen, =0 -> do not output chars to screen	
	ld	l,a
	ld	a,(nlines)
	inc	a
	ld	h,a
	call    SetRegion
	ld	hl,EscCls
	call	PrtHL		; clear text screen 
	call	ChkGsxOpen	; check GSX Workstation is Open
	ret
clrtext:
	; Clear some or all of the text screen. Two 
	; parameters (X,Y) giving the top / bottom line of area to clear.
	; area to clear.	
	ld iy,204h ; YYY
	call    getarg		; preserve bc
	ld	l,(ix+2)
	ld	h,(ix+4)
	call    SetRegion
	ld	hl,EscCls
	call	PrtHL		; clear text screen 
	ret
setcurpos:
	;+0018	 ;Set text cursor position. Two parameters (X,Y)
	ld iy,205h ; YYY
	call    getarg
	ld      a,(Echo)	; if Echo=0 -> do not print chars on text screen
	or      a
	ret     z
	ld      l,(ix+4)
	ld      h,(ix+2)
	ld      de,01f1fh	; print ESC Y to set cursor at HL=rc
	add     hl,de
	ld      (EscCurPos+2),hl
	ld      hl,EscCurPos
	call	PrtHL		
	ret
	
scroll: ; Scroll some or all of the text screen up one line. Two 
	; parameters (X,Y) giving the top / bottom line of area to scroll.
	ld iy,206h ; YYY
	call    getarg		; preserve bc
	ld      a,(Echo)	; if Echo=0 -> do not print chars on text screen
	or      a
	ret     z
	ld	hl,EscSaveCursorPos
	call	PrtHL		
	ld      l,(ix+2)	; 16
	ld      h,(ix+4)	; 24
	call    SetRegion
	ld	hl,EscScroll
	call	PrtHL	
	ld	hl,EscRestoreCursorPos
	call	PrtHL	
	ret
	
SetRegion:	; set scroll region to HL (l=first line, h=last line of region)
	push	hl
	ld      a,l
	ld	hl,EscSetScrollRegion+2
	call	saveNNdec
	pop	hl
	ld	a,h
	inc	a
	ld	hl,EscSetScrollRegion+5
	call	saveNNdec
	ld	hl,EscSetScrollRegion
	call	PrtHL	
	ret	
	
plot:	; Plot a point. Four parameters: (X,Y,pen,colour)
	; where pen is 0 for Pen Up, 1 for Pen Down, 2 for Pen Xor, 3 for Pen Erase
	ld iy,207h ; YYY
	call    getarg		; preserve bc
	ld      a,(ix+7)	; pen?
	ld	(PenMode),a
	ld      a,(ix+6)	; color?
	ld	(PenColor),a
	ld      l,(ix+2)	; x coord
	ld      h,(ix+3)
	ld	(x0),hl	
	ld	(x1),hl	
	ld      l,(ix+4)	; y coord
	ld      h,(ix+5)	
	ld	(y0),hl	
	ld	(y1),hl	
	call	LineGsx
	ret
draw:	; Draw a line. Six parameters: (X1,Y1,X2,Y2,pen,colour)
	ld iy,208h ; YYY
	call    getarg		; preserve bc
	ld      a,(ix+11)	; pen?
	ld	(PenMode),a
	ld      a,(ix+10)	; color?
	ld	(PenColor),a
	ld      l,(ix+6)	; x coord
	ld      h,(ix+7)	
	ld	(x0),hl	
	ld      l,(ix+8)	; y coord
	ld      h,(ix+9)	
	ld	(y0),hl	
	ld      l,(ix+2)	; x coord
	ld      h,(ix+3)	
	ld	(x1),hl	
	ld      l,(ix+4)	; y coord
	ld      h,(ix+5)	
	ld	(y1),hl	
	call	LineGsx
	ret

LineGsx:
	call	ChkGsxOpen	; check GSX Workstation is Open
	; set pen mode
	ld	a,(PenMode)	; 0 for Pen Up, 1 for Pen Down, 2 for Pen Xor, 3 for Pen Erase
	or	a
	ret	z		; pen-up -> do not draw
	ld	de,3		; xor mode
	cp	2
	jp	z,setlnm
	ld	de,4		; erase mode
	cp	3
	jp	z,setlnm
	ld	de,1		; replace mode
	; call GSX Set Writing Mode
setlnm:	ld	hl,32		; gsx func 32 = Set Set Writing Mode
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	hl,1		
	ld	(Nintin),hl	; num int in = 1
	ld	(intin),de	; store the value
	ld	de,pblock
	ld	c,115
	call	0005
	; set draw color
	ld	a,(PenColor)
	ld	d,0
	ld 	e,a
	; call GSX Set Line color
	ld	hl,17		; gsx func 17 = Set Line Color
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	hl,1		
	ld	(Nintin),hl	; num int in = 1
	ld	(intin),de	; store the value
	ld	de,pblock
	ld	c,115
	call	0005
	; call GSX Draw polyLine
	ld	hl,6		; gsx func 6 = Draw Poly Line
	ld	(gsxfunc),hl
	ld	hl,2
	ld	(Nptsin),hl	; num pts in = 2
	ld	hl,0		
	ld	(Nintin),hl	; num int in = 0
	ld	hl,(x0)
	call	hl_x32		; mult x-coord by 32
	ld	(ptsin+0),hl	; set the line coords
	ld	hl,(y0)	
	call	hl_y32		; mult y-coord 
	ld	(ptsin+2),hl	
	ld	hl,(x1)
	call	hl_x32		; mult x-coord by 32
	ld	(ptsin+4),hl
	ld	hl,(y1)
	call	hl_y32		; mult coord 
	ld	(ptsin+6),hl	
	ld	de,pblock
	ld	c,115
	call	0005	
	ret
	
hl_x32:
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ret		
hl_y32:
	or	a
	ex	de,hl
	ld	hl,(ydots)
	sbc	hl,de
	dec	hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	add	hl,hl
	ret
	
bg_set:	; Set background colour. One parameter: the colour.
	ld iy,209h ; YYY
	ret
clrgfx: ; Clear graphic screen. Two parameters: colour, height in pixels
	ld iy,210h ; YYY
	call    getarg		; preserve bc
	ld      l,(ix+4)	; height of graf screen, in pixels
	ld      h,(ix+5)	
	ld      a,(ix+2)	; screen color?
ClrGsx:	ld	a,(GsxOpen)
	or	a
	ret	z
	; call GSX Clear Picture
	ld	hl,3		; gsx func 3 = Clear Picture
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	(Nintin),hl	; num int in = 0
	ld	de,pblock
	ld	c,115
	call	0005
	ret
getpix:	; Get the colour at the specified point. Two parameters
	; (X,Y). Returns the colour in HL.
	ld iy,211h ; YYY
	ret	

savepic:			; these functions are not implemented
loadpic:	
	call    getarg		
	;XXX retrieve second argument?
	ld	hl,0
	ret

bye:	
	call	ClrGsx
	call	CloseGsx
	ld	hl,EscEnableLineWrap
	call	PrtHL		; enable normal <CR><LF>
	ld	hl,EscResetScrollRegion
	call	PrtHL	
	ld	hl,EscCls
	call	PrtHL		; clear text screen 
	ld	hl,EscShowCursor
	call	PrtHL		; Show/enable cursor 
	jp	0000;

saveNNdec:	; saves reg A as two-digits ascii decimal number NN at addr HL
	ld	d,0
n0:	cp	10
	jp	c,n1		; jump if a is less than 10
	sub	10
	inc	d
	jp	n0
n1:	ld	e,a
	push 	hl
	ld	hl,3030h	; ascii 00
	add	hl,de		; ascii NN
	ex	de,hl
	pop	hl
	ld	(hl),d
	inc 	hl
	ld	(hl),e
	ret

ChkGsxOpen:	; check if GSX WorkStation is open. If not, open it
	ld 	a,(GsxOpen)
	or	a
	ret	nz		; return. WorkStation already open
	ld	a,1
	ld 	(GsxOpen),a	; Mark GSX WorkStation as Open
	; now OpenWorkStation
	ld	hl,1		; gsx func 1 = OpenWorkstation
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	hl,10		
	ld	(Nintin),hl	; num int in = 10
	ld	hl,1
	ld	(INTIN + 0*2),hl	; open device number = 1
	ld	hl,0
	ld	(INTIN + 1*2),hl	; line style
	ld	hl,1
	ld	(INTIN + 2*2),hl	; line color (0=black, 1=white)
	ld	hl,0
	ld	(INTIN + 3*2),hl	; marker style
	ld	hl,1
	ld	(INTIN + 4*2),hl	; marker color
	ld	hl,0
	ld	(INTIN + 5*2),hl	; text style
	ld	hl,1
	ld	(INTIN + 6*2),hl	; text color
	ld	hl,0
	ld	(INTIN + 7*2),hl	; fill style
	ld	hl,0
	ld	(INTIN + 8*2),hl	; fill index (0=solid)
	ld	hl,1
	ld	(INTIN + 9*2),hl	; fill color
	ld	de,pblock
	ld	c,115
	call	0005
	ret

; driver variables

Echo:		DB	0	; 0=do not print on text screen, 1=print chars
GsxOpen:	DB	0	; 1=GSX WorkStation is open
PenMode:	DB	0	; 0 for Pen Up, 1 for Pen Down, 2 for Pen Xor, 3 for Pen Erase
PenColor:	DB	0
x0:		DW	0
y0:		DW	0
x1:		DW	0
y1:		DW	0
	
; GSX variables
	
pblock:	DW	CONTRL		; Address of control array
	DW	INTIN		; Address of integer input array
	DW	PTSIN		; Address of pixel input array
	DW	INTOUT		; Address of integer output array
	DW	PTSOUT		; Address of pixel output array	
CONTRL:	
gsxfunc:	DW	0	; Input:  GSX function to call, 1-33
Nptsin:		DW   	0	; Input:  Number of points in PTSIN array.
Nptsout:	DW   	0	; Output: Number of points in PTSOUT array.
Nintin:		DW   	0	; Input:  Number of integers in INTIN array.
Nintout:	DW   	0	; Output: Number of integers in INTOUT array.	
INTIN:	DS	8		; room for 4 input words
PTSIN:	DS	8		; room for 4 input coords (2 points)
INTOUT:	DS	64		; room for 32 output words
PTSOUT:	DS	32 		; room for 16 output coords (8 points)
	

; Terminal Escape sequences

EscCurPos:		DB	27,'Y',0,0,0	; Cursor positioning
EscShowCursor:		DB	27,'[?25h',0	; Enable cursor/Cursor On
EscHideCursor:		DB	27,'[?25l',0	; Disable cursor/Cursor Off
EscEnableLineWrap:	DB	27,'[?7h',0	; Auto <CR><LF> at end of line (normal setting)
EscDiscardAtEOL:	DB	27,'[?7l',0	; Discard chars at eol instead of auto <CR><LF>
EscCls:			DB	27,'[2J',0	; Clear screen
EscSetScrollRegion:	DB	27,'[16;25r',0	; Set scroll region
EscResetScrollRegion:	DB	27,'[r',0	; Reset set scroll region
EscScroll:		DB	27,'[S',0	; Scroll up one line
EscSaveCursorPos:	DB	27,'[s',0	; Save Cursor pos
EscRestoreCursorPos:	DB	27,'[u',0	; Restore Cursor pos

	DW      0EEEEh		; end of PRL signature
	END
