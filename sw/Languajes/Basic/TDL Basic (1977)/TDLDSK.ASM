;
;
;Disk - Routinen fuer SAVE, LOAD und FILES unter CP/M
;fuer das 12k - Z80 - BASIC von TDL, stehend ab Adresse
;400h, Rampage 100h bis 2FFh.
;
;Hardcopy - Routine HARD fuer mc-Term1, I/O fuer Console
;an SIO der Kontron-ECB-C/8 (spezifische Routine).
;Terminal muss sich im mc-Graphik-Modus befinden und auf
;die zu kopierende Bildseite gestellt sein.
;Anzuschliessender Drucker : EPSON MX-80 (Steuercodes !).
;
;Tilmann Reh 20.4.1985
;
.pabs
;
;Konstanten:
bdos	= 5
fcb	= 5Ch
basic	= 400h
syntax	= basic+16Dh
error	= basic+17Eh
offset	= basic+9DBh
hloop	= basic+256h
string	= basic+4BDh
entry	= basic+1A0h
new	= basic+2B4h
ram	= 100h
progbeg	= ram+5Ch
progend	= ram+5Eh
buffer	= ram+180h
cr	= 0Dh
lf	= 0Ah
esc	= 1Bh
;
;Adressen im Terminal Term1:
get	= 458h
moveto	= 183h
cmd	= 0C7h
wait	= 0C0h
cco	= 3CAh
readout	= 0A0h
;
.loc	100h
;
start:	jmp	basic
;
.loc	300h
;
cin:	call	cstat
	ora	a
	jrz	cin
	ret
;
cstat:	push	h
	push	d
	push	b
	mvi	c,6
	mvi	e,255
	jmpr	io
;
riv:	push	h
	push	d
	push	b
	mvi	c,3
	jmpr	io
;
con:	push	h
	push	d
	push	b
	mov	e,c
	mvi	c,2
	jmpr	io
;
wrtv:	push	h
	push	d
	push	b
	mov	e,c
	mvi	c,4
	jmpr	io
;
listx:	push	h
	push	d
	push	b
	mov	e,c
	mvi	c,5
io:	call	bdos
	pop	b
	pop	d
	pop	h
	ret
;
cstsx:	in	07
	ani	01
	rz
	mvi	a,255
	ret
;
iochx:	lda	3
	ret
;
iostx:	mov	a,c
	sta	3
	ret
;
;
save:	call	putfcb
	jrnz	open
	lxi	d,fcb
	mvi	c,22
	call	bdos		;make file
	inr	a
	mvi	e,7
	jz	error		;out of memory
open:	lhld	progbeg
	lxi	d,128
savelp:	push	d
	mov	b,d
	mov	c,e
	ldir
	push	h
	mvi	c,21
	lxi	d,fcb
	call	bdos		;write sequential
	ora	a
	mvi	e,7
	jnz	error		;out of memory
	pop	d
	lhld	progend
	dsbc	d
	xchg
	pop	d
	jrnc	savelp
savend:	mvi	c,16
	lxi	d,fcb
	call	bdos		;close file
	inr	a
	mvi	e,19
	jz	error		;file not found
	pop	h
	ret
;
;
load:	call	putfcb		;fcb vorbereiten
	mvi	e,19
	jz	error		;file not found
	lhld	progbeg
	lxi	d,128
	xchg
	push	h
loadlp:	push	d
	mvi	c,20
	lxi	d,fcb
	call	bdos		;read sequential
	ora	a
	pop	d
	pop	h
	jrnz	ldend
	push	h
	mov	b,h
	mov	c,l
	ldir
	lxi	h,-40
	dad	sp
	xra	a
	dsbc	d
	ora	h
	jrnz	loadlp
	mov	a,l
	cpi	128
	jrnc	loadlp
	mvi	e,7
	jmp	error		;out of memory
ldend:	xchg
	dsbc	d
	dcx	h
	dcx	h
srch3:	mvi	b,3
srch0:	mov	a,m
	ora	a
	inx	h
	jrnz	srch3
	djnz	srch0
	shld	progend
	pop	h
	call	offset
	jmp	hloop
;
;
files:	xchg
	lxi	h,fcb
	mvi	m,0
ffnblk:	ldax	d
	inx	d
	cpi	' '
	jrz	ffnblk
	ora	a
	jz	fname
	ani	0DFh
	cpi	'A'
	jc	syntax
	cpi	'Q'
	jnc	syntax
	ani	1Fh
	mov	m,a
	ldax	d
	cpi	':'
	jmp	ffnbkc
;
.loc	basic
;
	jmp	init
	jmp	basic+173h		;recover
	jmp	basic+744h		;usr
ci:	jmp	cin
ri:	jmp	riv
co:	jmp	con
po:	jmp	wrtv
lo:	jmp	listx
csts:	jmp	cstsx
iochk:	jmp	iochx
ioset:	jmp	iostx
	jmp	0
trap:	jmp	0
;
.loc	basic+0ACh
	.word	save
.loc	basic+0D8h
	.word	load
.loc	basic+0E0h
	.word	syntax
	.word	syntax
	.word	files
	.word	hard
	.word	syntax
;
.loc	basic+147Eh
;
ffnbkc:	jnz	syntax
ffnbk1:	inx	d
	ldax	d
	cpi	' '
	jrz	ffnbk1
	ora	a
	jnz	syntax
fname:	push	d
	inx	h
	mvi	b,11
fill1:	mvi	m,'?'
	inx	h
	djnz	fill1
	mvi	b,24
fill2:	mvi	m,0
	inx	h
	djnz	fill2
	lxi	d,fcb
	mvi	c,17
	call	bdos		;search for first
	mvi	e,19
	cpi	255
	jz	error		;file not found
	mvi	d,5
nextf:	ani	3
	add	a
	add	a
	add	a
	add	a
	add	a
	mov	c,a
	mvi	b,0
	lxi	h,129
	dad	b
	mvi	e,11
outlp:	mov	c,m
	inx	h
	call	co
	mov	a,e
	cpi	4
	jrnz	outnxt
	mvi	c,' '
	call	co
outnxt:	dcr	e
	jrnz	outlp
	dcr	d
	jrnz	spc
	mvi	c,cr
	call	co
	mvi	c,lf
	call	co
	mvi	d,5
	jmpr	nospc
spc:	mvi	c,' '
	call	co
	call	co
nospc:	push	d
	lxi	d,fcb
	mvi	c,18
	call	bdos		;search for next
	pop	d
	cpi	255
	jrnz	nextf
	pop	h
	ret
;
;
hard:	push	h
	lxi	h,msg1
	mvi	b,msg1l
mloop1:	mov	c,m
	call	co
	inx	h
	djnz	mloop1
	mvi	e,255		;y=255 am Anfang
	lxi	h,msg2
	mvi	b,9
	jmpr	mloop2		;Drucker - Erstinitialisierung
zeile:	lxi	h,msg2+3
	mvi	b,6
mloop2:	mov	c,m
	inx	h
	call	lo
	djnz	mloop2		;Drucker - Zeileninitialisierung
	mvi	d,0		;x=0 am Anfang jeder Zeile
block:	mov	c,d
	call	co		;x-Koordinate an Term1
	mov	c,e
	call	co		;y-Koordinate an Term1
	mvi	b,8		;Groesse des Blocks
	lxi	h,buffer
cwait:	in	07
	bit	0,a
	jrz	cwait
	in	05
	mov	m,a
	inx	h
	djnz	cwait
	push	d
	mvi	h,10000000b	;Bitmasken setzen
	mov	l,h
nxtbyt:	lxi	d,buffer
	mvi	c,0
nxtbit:	ldax	d
	ana	l
	jrz	nopix
	mov	a,h
	ora	c
	mov	c,a
nopix:	inx	d
	rrcr	h
	jrnc	nxtbit
	call	lo
	rrcr	l
	jrnc	nxtbyt
	pop	d
	mov	a,d
	adi	4
	mov	d,a		;x-Koord. +4 (in Term1 *2)
	jrnz	block		;Zeile noch nicht zu Ende
	mov	a,e
	sui	8
	mov	e,a		;y-Koord. -8
	jrnc	zeile		;Bild noch nicht fertig
	mvi	c,1
	call	co		;Ende fuer Term1
	lxi	h,msg3
	mvi	b,5
mloop3:	mov	c,m
	inx	h
	call	lo
	djnz	mloop3
	pop	h
	ret
;
;
putfcb:	lxi	d,fcb
	xra	a
	stax	d
fnblk:	mov	a,m
	inx	h
	cpi	' '
	jrz	fnblk
	cpi	'"'
	jrz	name
	ani	0DFh
	cpi	'A'
	jc	syntax
	cpi	'Q'
	jnc	syntax
	ani	1Fh
	stax	d
	mov	a,m
	inx	h
	cpi	':'
	jnz	syntax
	mov	a,m
	inx	h
	cpi	'"'
name:	mvi	b,9
	jmp	namec
;
.loc	basic+19F2h
;
namec:	jnz	syntax
name1:	inx	d
	mov	a,m
	stax	d
	inx	h
	dcr	b
	jrz	type
	cpi	' '
	jrz	type
	cpi	'"'
	jrz	type
	ora	a
	jrnz	name1
type:	mov	a,b
	ora	a
	jrz	type1
	mvi	a,' '
typel:	stax	d
	inx	d
	djnz	typel
type1:	xchg
	mvi	m,'T'
	inx	h
	mvi	m,'D'
	inx	h
	mvi	m,'L'
	inx	h
	xchg
	mvi	b,24
	xra	a
typel2:	stax	d
	inx	d
	djnz	typel2
	xthl
	push	h
	lxi	d,fcb
	mvi	c,15
	call	bdos		;open file
	inr	a
	ret
;
;
msg1:	.ascii	'WD18176 6 44 33 14 71 205 88 4 56 251 '
	.ascii	'119 35 16 247'
	.byte	cr,lf
	.ascii	'WE18176'
	.byte	cr
getx:	call	get
	jrc	getx
	bit	0,a
	rnz			;Ende des Bilds
	mov	l,a		;x/2 von Host
gety:	call	get
	jrc	gety
	mov	e,a		;y von Host
	mvi	d,0
	mov	h,d
	dad	h		;richtige x-Koordinate
	mvi	b,8		;8 Byte pro Block
coutlp:	call	moveto
	mvi	a,0Fh
	call	cmd
	call	wait
	in	readout
	cma
	mov	c,a
	call	cco
	dcx	d		;y - 1
	djnz	coutlp
	jmpr	getx		;naechster Block
;
msg1l	= .-msg1
;
msg2:	.byte	esc,'A',8,cr,lf,esc,'L',0,2
;
msg3:	.byte	cr,lf,lf,esc,'2'
;
;
.loc	basic+2AD3h
;
	.ascii	'ALOAD'
	.byte	0C3h
	.ascii	'AMERGE'
	.byte	0C3h
	.ascii	'FILE'
	.byte	0D3h
	.ascii	'HAR'
	.byte	0C4h
	.ascii	'AAASAV'
	.byte	0C5h
;
.loc	basic+2CB7h
;
init:	xra	a
	lxi	h,ram
page2:	cmc
page:	mov	m,a
	inr	l
	jrnz	page
	inr	h
	jrc	page2
	lxi	h,-1
	shld	ram+54h
	mvi	a,2Ch
	sta	ram+0B0h
	mvi	a,0C3h
	sta	ram+8Dh
	sta	ram+0A4h
	lxi	h,init
	shld	ram+0A5h
	lxi	y,ram+90h
	lxi	h,co
	shld	ram+8Eh
	mvi	a,48h
	sta	ram+91h
	sta	ram+96h
	mvi	a,38h
	sta	ram+92h
	sta	ram+97h
	lxi	h,ram+8
	shld	ram+6
	lxi	h,8000h
	shld	ram+87h
	shld	ram+89h
	shld	ram+8Bh
	lhld	bdos+1
	dcx	h
	shld	ram+4
	shld	ram+48h
	lxi	d,-100
	dad	d
	lxi	d,init
	sphl
	shld	ram+5Ah
	sded	progbeg
	ora	a
	dsbc	d
	lxi	b,-16
	dad	b
	call	basic+9EEh
	call	basic+21C9h
	lxi	h,fremsg
	call	string
	lxi	h,string
	shld	ram+0A5h
	call	new
	jmp	entry
;
fremsg:	.ascii	' Bytes Free'
	.byte	lf,lf
	.ascii	'Welcome to BASIC, Ver. 2.1'
	.byte	lf
	.ascii	'<TDL Z-80 High Precision Extended CP/M Version>'
	.byte	8Ah
;
;
.end
;
