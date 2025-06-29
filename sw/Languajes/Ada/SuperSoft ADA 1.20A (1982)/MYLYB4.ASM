;
;
;	putpix(line,sample,value,ws6) 
;
;	is a c-callable function that will put a pixel
;	of VALUE at position LINE,SAMPLE on the cat-800
;	screen.  The origin for LINE and SAMPLE is the
;	upper left corner of the screen.  484 lines by
;	512 sample format is assumed.  LINE may be from
;	0 to 483, SAMPLE may be from 0 to 511.  Value
;	may be from 0 to 255, with 0 being black and
;	255 being white (assuming a ramp function for
;	mapping memory).  WS6 is the value already sent
;	to port = portbase + 6.
;
;
;	ARG1 = line (but after it is no longer needed, ARG1
;		     is used again for storing THISBIT)
;
;	ARG2 = sample
;
;	ARG3 = value
;
;	ARG4 = WS6
;
;	ARG5 = ADDR
;
;	ARG6 = loop index in main loop
;
;	ARG6+1 = mask
;
;	ARG7 = imask
;
;	ARG7+1 = relpage
;
;  NOTE:  These locations are absolute and exist in the
;	  run time package, C.CCC.
;
;



;cat-800 equates:

membase	equ	0a000h

portbase	equ	0f0h

ws2	equ	portbase+2
ws6	equ	portbase+6


;  entry points in run time package:

shlrbe	equ	2e5h
shllbe	equ	2f3h
blau	equ	1ebh

	maclib bds
	maclib cmac
	
	direct
	define putpix
	enddir

	prelude putpix

	call arghak
	push	b
	lhld	arg1	;get line coord
	mov	a,l
	ani	1	;mod 2
	reloc	jnz,odd
even:	inx	h
	inx	h	;line=line+2
	mvi	e,5
	call	shllbe	;shift hl left by 5 (=e) bits
	push	h
	pop	b	;save 32*(line+2) in bc reg
	lhld	arg2	;get sample coord
	mvi	e,3
	call	shlrbe	;samp=samp/8
	stc
	cmc		;clear carry bit
	dad	b	;compute:  ((line+2)<<5)+(sample>>3)
	push	h
	pop	b
	lhld	arg1	;get line again
	lxi	d,253d
	call	blau	;hl<de ? , if so, return with carry set
	reloc	jc,zero
one	mvi	d,1	;relpage=1
	reloc	jmp,cont
zero	mvi	d,0	;relpage=0
	reloc	jmp,cont
odd	inx	h
	mvi	e,5
	call	shllbe
	push	h
	pop	b
	lhld	arg2
	mvi	e,3
	call	shlrbe
	stc
	cmc
	dad	b
	push	h
	pop	b
	lhld	arg1
	lxi	d,254d
	call	blau
	reloc	jc,two
three	mvi	d,3	;relpage=3
	reloc	jmp,cont
two	mvi	d,2
cont	mov	a,d
	sta	arg7+1
	push	b
	pop	h
	ani	1	;relpage mod 2
	reloc	jz,skip
	lxi	h,0e000h	;loads hl with minus 2000h
	dad	b	;hl = byte - 2000h
skip	lxi	b,membase
	dad	b	;hl=membase+byte=addr
	shld	arg5
	push	h
	pop	b
	lhld	arg2
	mov	a,l
	ani	7
	mov	l,a
	mvi	a,7
	sub	l	;(a= 7 - sample mod 8)
	mov	d,a	;d = bit
	lhld	arg4
	mov a,l
	out 	ws6
	lxi	h,0
	mvi	l,80h
	mvi	a,7
	sub	d	;a = 7 - bit
	mov 	e,a
	call	shlrbe
	mov	a,l
	cma		;a = ~(mask>>(7-bit)) = imask
	sta	arg7	;imask
	mvi	a,0
	sta	arg6	;initialize loop counter
	mvi	a,80h
	sta	arg6+1	;mask
pixlup:	lda	arg6
	cpi	10h
	reloc	jz,p16
	reloc	jmp,doit
p16:	lhld	arg4
	mov	a,l
	ori	40h
	out	ws6
doit:	lda	arg6
	stc
	cmc
	rar
	rar		;divide by 4
	mov	e,a
	mvi	a,7
	sub	e
	sub	d	;a = 7-(page>>2)-bit
	push	psw
	lda	arg6
	mov	e,a
	lda	arg7+1
	add	e
	stc
	cmc
	ral
	ral
	ani	3fh
	ori	80h
	out	ws2
	pop	psw
	reloc	jz,zip
	reloc	jp,pos
	reloc	jm,neg
zip:	lhld	arg3	;l=value
	lda	arg6+1
	ana	l
	sta	arg1	;arg1=thisbit	
	reloc	jmp,cunt
pos:	mov	e,a
	lhld	arg3
	lda	arg6+1
	ana	l
	mov	l,a
	mvi	h,0
	call	shlrbe
	mov	a,l
	sta	arg1
	reloc	jmp,cunt
neg:	cma
	inr	a	;twos complement of a
	mov	e,a
	lhld	arg3
	lda	arg6+1
	ana	l
	mov	l,a	
	mvi	h,0
	call	shllbe
	mov	a,l
	sta	arg1
cunt:	lhld	arg5
	mov	a,m
	mov	b,a
	lda	arg7
	ana	b
	mov	b,a
	lda	arg1
	ora	b
	mov	m,a
	lda	arg6+1
	stc
	cmc
	rar
	sta	arg6+1	;mask = mask >>1
	lda	arg6
	inr	a
	inr	a
	inr	a
	inr	a
	cpi	20h
	reloc	jz,quit
	sta	arg6
	reloc	jmp,pixlup
quit	pop	b
	ret

	postlude putpix

	end
	