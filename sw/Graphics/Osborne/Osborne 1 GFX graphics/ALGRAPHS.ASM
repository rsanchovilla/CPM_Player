;       ALGRAPHS.ASM
;
;	ASSEMBLY LANGUAGE PROGRAM TO PRODUCE THE
;	OSBORNE 1 SCREEN GRAPHICS CHARACTER SET
;
;	Robert E. Daniels
;	Raleigh Osborne Computer Club
;	November 17, 1985
;
;.......NOTE......................................
;	This is written for a 52 column screen.
;	To adapt to an 80 column screen, change
;	the two lines that read: mov	d,10
;			     to: mov	d,13
;
;-------equates-----------------------------------
tab	equ	9	; 9=09h=^I
lf	equ	10	;10=0Ah=^J
cr	equ	13	;13=0Dh=^M
clear	equ	26	;26=1Ah=^Z
escape	equ	27 	;27=1Bh=^ESC
;
graph	equ	'g'	;turn graphics mode ON
nograph	equ	'G'	;turn graphics mode off
;
chrfun  equ	2	;CP/M function number 2
		        ;display ASCII character
			;in register E on screen
; 	
strfun  equ	9	;CP/M function number 9
			;send character string whose
			;starting address is in DE register
			;pair to screen
;
wboot	equ	0000h	;warm boot
bdos	equ	5	;CP/M BDOS entry point
;-------------------------------------------------
;
	org 100h
;
	lxi	sp,stack
;
;----set initial values of numeric variables------
;
;
	mvi	d,10	;counter for number of characters left to
			;be displayed (along with their equivalents
			;in graphics) on the current screen line.
			;Decremented to 0 and then reset to 10.
;				
	mvi	b,64	;ASCII numeric value of current character.
			;Starts at 1 less than starting character 
			;and is incremented by 1 from 65 through 97,
			;stopping when b = 98.
;       
	push	d	;Store these two values
	push	b 	;to the stack
;		
	lxi	d,clear	      
	call	prchr	;clear the screen	
	lxi	d,head
	call	prstr	;DISPLAY THE HEADER TEXT
	lxi	d,setup	      
	call	prstr	;insert two cr's and two line feeds
	lxi	d,setup	      
	call	prstr	;insert two cr's and two line feeds
loop:
	pop	b	;Retrieve numeric value current character
	pop	d	;Retrieve number of characters in line
;
	mov	a,d	;Put number of characters left in current 
			;line in register A
	cpi	00	;If this = 0,
	jz	newl	;jump to "newline" subroutine
;
	dcr	a	;Subtract 1 from number of characters left 
			;in the current line
	mov	d,a	;Put this value in the accumulator
	push	d	;Store this number to stack
	inr	b	;Go on to the first/next character
	mov	a,b	;Put this value in the accumulator
	push	b	;Store numeric value of current character	
	cpi	98 	;If this = 98
	jz	fnote   ;jump to "footnote" and end
	mov	e,a 	;Put numeric value of current character
			;in register E preparatory to BDOS call
	call	prchr	;DISPLAY THE CURRENT CHARACTER
	lxi	d,32	;\    
	call	prchr	;/ Add a blank space after it
	lxi	d,grfon	;point to graphics ON command string
	call	prstr	;Turn graphics mode ON
	pop	b 	;Retrieve numeric value current character
	mov	a,b 	;Put this value in the accumulator
	push	b	;Save it again
	sui	65	;Subract 65dec from this value
	mov	e,a 	;Put value of graphic equivalent
			;in register E preparatory to BDOS call
	call	prchr	;DISPLAY THE GRAPHIC EQUIVALENT
	lxi	d,grfoff ;Point to graphics off
	call	prstr	;Turn graphics mode off
	lxi	d,32	;\    
	call	prchr	; \
	lxi	d,32	;  Add 2 blank spaces after it
	call	prchr	;/
	jmp 	loop
;
fnote:	lxi	d,setup	      
	call	prstr	;insert two cr's and two line feeds
	lxi	d,setup	      
	call	prstr	;insert two cr's and two line feeds
	lxi	d,note 
	call	prstr	;DISPLAY THE TEXT OF THE FOOTNOTES
;
done:	jmp	wboot
;
prchr:	mvi	c,chrfun
	jmp	bdos
;
prstr:	mvi	c,strfun
	jmp	bdos
;
newl:	          	;subroutine to start a new line of display
	push	d	;Store number of characters in current line
	push	b	;Store numeric value of current character
	push	psw	;Store Program Status Word
;
	lxi	d,setup 
	call	prstr	;insert two cr's and two line feeds
;
	pop	psw	;Retrieve Program Status Word
	pop	b 	;Retrieve numeric value of next character
	pop	d	;Retrieve number of characters in line
			;(just to get it out of the way)
	mvi	d,10	;Reset number of characters in new line
	push	d 	;Store number of characters in current line
	push	b	;Store numeric value of current character
;
	jmp	loop	;Jump to "loop"
;
;---directives to initialize storage areas in memory
;
setup:	db	cr,lf,lf,'$'
head:	db	'SCREEN GRAPHICS CHARACTER SET USING ASSEMBLY LANGUAGE$'
grfon:	db	escape,graph,'$'
grfmes:	db	8,9,10,'$'
grfoff:	db	escape,nograph,'$'
note:	db	'NOTES:',13,10,10
      	db	'ASCII 127 in NONgraphic mode produces ',127,13,10
        db	'"a" in graphics mode produces 1 blank space',13,10
      	db	'"J" in graphics mode produces 3 blank spaces',13,10
	db	'The character produced by \ appears to be a glitch$'
	ds	10h
stack:
;-------------------------------------------------
	end
