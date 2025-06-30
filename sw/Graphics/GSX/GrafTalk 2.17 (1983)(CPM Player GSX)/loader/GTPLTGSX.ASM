;
;	GSX-80 driver for HP 7400 plotter commands
;	Copyright (C) 2024 by Roberto Sancho
;      
;       hooks BDOS function 5 (send char to printer/LIST port)
;       receive chars as HP74XX HP/GL commands
;       issue GSX calls to draw image on screen instead of plotter
;
	.z80
	.list
	CSEG

;	PRL Initialization entry point: 
;	- print welcome message
;	- hook BDOS function 5 
;	- adjust end of TPA
;
;       first 512 bytes of PRL are initialization code
;       and thus discarded after init
; 

Init:	
	ld	hl,(0006)	; save real BDOS
	ld 	(BDOS+1),hl	
	ld	hl,MAIN		; hook BDOS call
	ld	(0006),hl	; sets new TPA end
	
	ld	c,9		; print string
	ld	de,wtext	; welcome message
	call	0005	
	
	ld	c,9		; print string
	ld	de,hf5txt	; Hook address report
	call	0005	
	ld	hl,(0006)
	call 	DispHLhex	; print addr in hex
	ld	c,9		; print <CR><LF>
	ld	de,txtend	
	call	0005	
	
	ret			; return, end of initialization of GTPLTGSX
	
wtext: 	DB	'---------------------------------------------------',13,10
	DB	'HP74XX to GSX Driver                    Version 1.0',13,10
	DB	'Copyright (c) 2024 by Roberto Sancho               ',13,10
	DB	'---------------------------------------------------'
txtend:	DB	13,10,'$'
hf5txt: DB	'Hook BDOS function 5 at 0x','$'

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

IniPad:	DS	512-(IniPad-Init)

;
; PRL BDOS Hook
;
MAIN:
	push 	af
	ld	a,c	
	cp	5		; is BDOS func 5 = print char in printer  ?
	jp 	z, HookFn5
	pop	af
BDOS:	jp	0000		; jump to real BDOS
	
HookFn5:			; process HP 7400 command char
	pop	af

	ld	a,e
	ld	(ch),a		; saves the received char

	ld	a,(EscMode)	; chech if we are in Esc Mode
	or	a
	jp	z,NoEscMode	
	
	ld	a,(ch)		; we are in ESC mode. Skip any char
	cp	':'		; received until receiving ':' (terminator)
	jp	nz,NoEscTerminator
ClrRx:	xor	a		; disable ESC mode
	ld	(EscMode),a	; next char will be processed
	ld	(RxBufLen),a	; init rxbuf
NoEscTerminator:
	ret

NoEscMode:
	ld	a,(ch)
	cp	27
	jp	nz,NoEscChar	
	
	; received an ESC char
	ld	a,1		; activate ESC mode: will skip any char
	ld	(EscMode),a	; until reception of ':'
	ret

NoEscChar:
	ld	de,RxBuf	; save the received char 
	ld	a,(RxBufLen)	; RxBuf[RxBufLen]=ch
	ld	l,a
	ld	h,0
	add	hl,de
	ld	a,(ch)
	ld	(hl),a
	ld	a,(RxBufLen)	; RxBufLen=(RxBufLen + 1) and 63
	add	a,1
	and	RxBufSize-1
	ld	(RxBufLen),a
	
	; check if command terminator
	ld	a,(ch)
	cp	32
	jp	c,CmdTerminated	; if a<32 -> non-printable char terminates the command
	cp	';'
	ret	nz		; any char <>';' is stored as part of incomming command 
	ld	a,(RxBufLen)	
	cp	3
	jp	c,ClrRx		; ';' char with less than 3 chars -> invalid command -> clear rx buf
	ld	a,(RxBuf)	; get first char of received command
	cp	'L'
	jp	nz,CmdTerminated	; if command is not LB
	ld	a,(RxBuf+1)		; the ';' is interpreted as		
	cp	'B'			; command terminator
	jp	nz,CmdTerminated
	ret			; char ';' is part of LB command

CmdTerminated:	
	; add a 0 as terminator (followed by $ to allow print it for debug)
	ld	de,RxBuf	
	ld	a,(RxBufLen)	; RxBuf[RxBufLen]='$'
	ld	l,a
	ld	h,0
	add	hl,de
	ld	a,(ch)
	ld	(hl),0
	
     ; uncoment the following code to print on
     ; console the command to be processed
     ;
     ;  inc	hl
     ;  ld	(hl),'$'	
     ;  ; print cmd in console for debug
     ;  ld	c,9		; print string
     ;  ld	de,RxBuf	; print received command
     ;  call	0005	
     ;  ld	e,13
     ;  ld	c,2
     ;  call	0005		; print in console
     ;  ld	e,10
     ;  ld	c,2
     ;  call	0005		; print in console

	; locate the command handling routine
	ld	hl,CmdTable
	ld	(pCmd),hl
	
cmd0:	ld	hl,(pCmd)	; search cmd in CmdTable
	ld	a,(hl)
	or	a
	jp	z,ClrRx		; command not found -> discard command
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,(RxBuf)
	or	a		; force clear carry 
	sbc	hl,bc
	jp	nz,cmd1
	ld	hl,(pCmd)
	inc	hl
	inc	hl		; command found
	ld	e,(hl)		; get addr of routine to process the command
	inc	hl
	ld	d,(hl)
	ex	de,hl
	jp	(hl)		; jump to routine to process the command
cmd1:	ld	hl,(pCmd)
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	(pCmd),hl
	jp	cmd0
	
GetDecimalParam:
	; Converts an ASCII string to an unsigned 16-bit integer
	; Quits when it reaches a non-decimal digit
	; based on https://github.com/Zeda/Z80-Optimized-Routines/blob/master/conversion/string_to_uint16.z80
	ld 	hl,0
dec0:	ld 	a,(de)
  	sub 	30h
  	cp 	10
  	ret 	nc
  	inc 	de
  	ld 	b,h
  	ld 	c,l
  	add 	hl,hl
  	add 	hl,hl
  	add 	hl,bc
  	add 	hl,hl
  	add 	a,l
  	ld 	l,a
  	jr 	nc,dec0
  	inc 	h
  	jp 	dec0
	
CmdPA:
	xor	a
	ld	(LastOpWasPD),a	; init
	call	ChkGsxOpen	; check GSX Workstation is Open
	ld	hl,(PenX)	; save current pen pos
	ld 	(X0),hl
	ld	hl,(PenY)
	ld 	(Y0),hl
	ld	de,RxBuf+2	; start of param
	call	GetDecimalParam	; get new pen pos from command params
	ld	(PenX),hl
	inc 	de
	call	GetDecimalParam
	ld	(PenY),hl
	ld	a,(PenDown)
	or	a
	jp	z,ClrRx		; pen up -> no drawing done
CmdLine:
	; call GSX Draw polyLine
	ld	hl,6		; gsx func 6 = Draw Poly Line
	ld	(gsxfunc),hl
	ld	hl,2
	ld	(Nptsin),hl	; num pts in = 2
	ld	hl,0		
	ld	(Nintin),hl	; num int in = 0
	ld	hl,(X0)
	call	hl_x3		; mult x-coord by 3
	ld	(ptsin+0),hl	; set the line coords
	ld	hl,(Y0)	
	call	hl_x4		; mult y-coord by 4
	ld	(ptsin+2),hl	
	ld	hl,(PenX)
	call	hl_x3		; mult x-coord by 3
	ld	(ptsin+4),hl
	ld	hl,(PenY)
	call	hl_x4		; mult y-coord by 4
	ld	(ptsin+6),hl	
	ld	de,pblock
	ld	c,115
	call	0005
	jp	ClrRx
CmdPU:
	xor	a
	ld	(PenDown),a
	call	ChkGsxOpen	; check GSX Workstation is Open
	ld	a,(LastOpWasPD)
	or	a
	jp	nz,CmdPoint
	jp	ClrRx
	
CmdPoint:	
	xor	a
	ld	(LastOpWasPD),a	; reset	
	; draw a point
	ld	hl,(PenX)	; save current pen pos
	call	hl_x3		; mult x-coord by 3
	ld 	(X0),hl
	ld	hl,(PenY)
	call	hl_x4		; mult y-coord by 4
	ld 	(Y0),hl
	jp	CmdLine
CmdPD:
	ld	a,1
	ld	(PenDown),a
	ld	(LastOpWasPD),a	; set
	call	ChkGsxOpen	; check GSX Workstation is Open
	jp	ClrRx
CmdLB:
	; label: draw an ascii char
	xor	a
	ld	(LastOpWasPD),a	; init
	call	ChkGsxOpen	; check GSX Workstation is Open
	ld	a,(RxBuf+2)	; get param = the char to print
	ld	e,a
	ld	d,0		; de=reg a = the char
	
	; call GSX Draw Text
	ld	hl,8		; gsx func 8 = Draw Text
	ld	(gsxfunc),hl
	ld	hl,1		
	ld	(Nptsin),hl	; num pts in = 1
	ld	(Nintin),hl	; num int in = 1
	ld	(intin),de	; store the char
	ld	hl,(PenX)
	call	hl_x3		; mult x-coord by 3
	ld	(ptsin+0),hl	; set the pos to
	ld	hl,(ChHeight)
	ex	de,hl
	ld	hl,(PenY)	; place the char
	or	a
	sbc	hl,de
	call	hl_x4		; mult y-coord by 4
	ld	(ptsin+2),hl	
	ld	de,pblock
	ld	c,115
	call	0005
	jp	ClrRx
CmdSP:
	; set pen color
	xor	a
	ld	(LastOpWasPD),a	; init
	ld	(PenDown),a	; pen is UP
	call	ChkGsxOpen	; check GSX Workstation is Open
	ld	a,(RxBuf+2)	; get param = pen color
	sub	30h
	jp	c,ClrRx		; invalid pen. Should be '0'..
	jp	z,CmdErase	; SP0 is interpreted as erase graphic
	ld	d,0
	ld	e,a		; de=reg a = the color
	
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
	; call GSX Set text color
	ld	hl,22		; gsx func 22 = Set text Color
	ld	(gsxfunc),hl
	ld	de,pblock
	ld	c,115
	call	0005
	jp	ClrRx
CmdErase:
	; call GSX Clear Picture
	ld	hl,3		; gsx func 3 = Clear Picture
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	(Nintin),hl	; num int in = 0
	ld	de,pblock
	ld	c,115
	call	0005
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
	jp	ClrRx
	
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

hl_x3:	; mult x-coord in HL by 3 to traslate from HP74XX coords to GSX coords
	push	bc
	push 	hl
	add	hl,hl
	pop	bc
	add	hl,bc
	pop 	bc
	ret
	
hl_x4:	; mult y-coord in HL by 4 to traslate from HP74XX coords to GSX coords
	add	hl,hl
	add	hl,hl
	ret

CmdSI:	; character size
	call	ChkGsxOpen	; check GSX Workstation is Open
	ld	a,(RxBuf+3)	; get param = 1st digit of size
	ld	hl, 110
	ld	(ChHeight),hl
	ld	de,2800
	cp	'3'
	jp	z,settext
	
	ld	hl, 200
	ld	(ChHeight),hl
	ld	de,500
	cp	'1'
	jp	z,settext
	
	ld	hl, 130
	ld	(ChHeight),hl
	ld	de,1400
settext:	
	; call GSX Set text size
	ld	hl,12		; gsx func 12 = Set text size
	ld	(gsxfunc),hl
	ld	hl,1		
	ld	(Nptsin),hl	; num pts in = 0
	ex 	de,hl
	ld	(ptsin+0),hl	
	ld	(ptsin+2),hl	
	ld	hl,0		
	ld	(Nintin),hl	; num int in = 0
	ld	de,pblock
	ld	c,115
	call	0005
	jp	ClrRx
	

	jp	c,ClrRx		; invalid pen. Should be '1', '2' or '3'
	
	jp	z,CmdErase	; SP0 is interpreted as erase graphic

ch:		DB	0	; the received char from GrafTalk
EscMode:	DB	0	; ESC mode flag
RxBufSize	equ	64	; max chars in buffer (must be power of 2)
RxBuf:		DS	RxBufSize	; the received plotter command buffer 
		DB	0	; safety
RxBufLen:	db	0	; number of received chars in RxBuf
	
pCmd:		DW 	0;
CmdTable:	DB	'P','A'
		DW	CmdPA
		DB	'P','U'
		DW	CmdPU
		DB	'P','D'
		DW	CmdPD
		DB	'L','B'
		DW	CmdLB
		DB	'S','P'
		DW	CmdSP
		DB	'S','I'
		DW	CmdSI
		DB	0	; end of table
		
; driver variables

GsxOpen:	DB	0
PenDown:	DB	0
LastOpWasPD:	DB	0
PenX:		DW 	0
PenY:		DW 	0
X0:		DW 	0
Y0:		DW 	0
ChHeight:	DW	0
	
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

	DW      0EEEEh		; end of PRL signature
	END
