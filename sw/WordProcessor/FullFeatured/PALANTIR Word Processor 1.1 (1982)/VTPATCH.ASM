; patch for palantir wp.com to introduce delete and insert
; line functions by means of the split screen scroll feature
; of the vtxx terminal
;
;
asciiout	equ	0cd6h	;output A in ascii
sendseq	equ	0ebbh	;output seq starting at HL (cnt 
				;first)
outchar	equ	0e8ah	;out char in A
gocurse	equ	0c6ch	;position cursor col=H, row=L
;
; patches to overlay
	org	0a1bh
	db	083h	;set delete and insert line functions on
	org	0da3h
	jmp	inslin	;insert line patch
	org	0dfeh
	jmp	dellin	;delete line patch
;
	org	0e01h
sen1:	mvi	a,27	;esc
	call	outchar
	mvi	a,'['	;[ char
	jmp	outchar
;
; set the top scroll margin at L and bottom at 24
	org	0dceh
;
settop:	push	h
	call	sen1
	pop	h
	mov	a,l
	call	asciiout
	mvi	a,';'
	call	outchar
	mvi	a,24
	call	asciiout	;bottom margin
	mvi	a,'r'
	call	outchar
	ret
;
; routine to clear the bottom line of screen an position cursor 
; there
	org	0d36h
;
clrbot:	mvi	a,1
	mvi	l,24
	call	gocurse
	lxi	h,clrsq
	jmp	sendseq
clrsq:	db	4,27,'[2K'	;sequence to clear line
;
; code to delete a line, enter with A=row
;
dellin:	cpi	24	;last line?
	jz	dellin2
	mov	l,a
	mvi	h,1
	push	h
	call	settop	;set scroll margin
	mvi	l,24
	mvi	h,1
	call	gocurse	;cursor at bottom
	mvi	a,10
	call	outchar	;line feed causes scroll
	mvi	l,1
	call	settop	;normal margin restored
	pop	h
	call	gocurse	;cursor away from bottom
	pop	b	;continue patched code
	ret
dellin2:	call	clrbot
	pop	b
	ret
;
;code to insert a line
;
inslin:	mov	a,l
	cpi	24	;at bottom?
	jz	dellin2	;special case
	mvi	h,1
	push	h
	CALL	SETTOP
	jmp	0c43h
	org	0c43h
	pop	h
	push	h
	call	gocurse
	mvi	a,27	;send esc M revers index
	call	outchar
	mvi	a,'M'
	jmp	0fe9h
	org	0fe9h
	call	outchar
	mvi	l,1
	call	settop	;margins to normal
	pop	h
	call	gocurse	;restore cursor, settop messes it
	pop	b	;for patched code
	ret
rmal
	pop	b	;for patched code
	