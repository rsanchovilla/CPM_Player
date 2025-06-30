h57219
s 00526/00000/00000
d D 1.1 83/03/17 15:59:22 tes 1 0
c date and time created 83/03/17 15:59:22 by tes
e
u
4
U
t
T
I 1
 
 
        TITLE   'INTEGER MULTIPLY DIVIDE AND 16-BIT OPERATIONS'
 
;*****************************************************************************
;                                                                            *
;       16-BIT OPERATIONS                                                    *
;                                                                            *
;*****************************************************************************
 
;       Revision : OCT. 31, 1982   File "XREG.ASM"
 
        PUBLIC  ABSHL            ;Absolute <HL>
        PUBLIC  NEGHL            ;Negate <HL>
        PUBLIC  SUBDH            ;Subtract <HL> = <DE> - <HL>
        PUBLIC  CMPS             ;Signed Compare <DE> >= <HL> ?
        PUBLIC  CMPDH            ;Binary (unsigned) Compare <DE> >= <HL> ?
        PUBLIC  GETMAX           ;Returns larger value of <hl>, <de> in <hl>
        PUBLIC  GETMIN           ;Returns smaller value of <hl>, <de> in <hl>
        PUBLIC  GETMN0           ;Returns Min (hl,de) or
                                 ;Zero if Min (hl,de) is a Negative value
        PUBLIC  MUL8             ;<HL> = <HL> * 8
        PUBLIC  MIDH             ;Integer Multiply <HL> = <DE> * <HL>
        PUBLIC  DIDH             ;Integer Devide <HL> = <DE> div <HL>
        PUBLIC  IMOD             ;Integer Mod <HL> = Mod (<DE> div <HL>)
        PUBLIC  MULFRA           ;Fraction Multiply <DE> = <HL> * <DE>
                                 ;         <HL> = Integer, <DE> = Fraction
        PUBLIC  DIVFRA           ;Fraction Devide <DE> = <HL> div <BC>
                                 ;         <HL>/<BC> must be a fraction
 
;----------------------------------------------------------------------------+
;	ABSHL   ABSOLUTE AND NEGATE FUNCTIONS : HL=ABS(HL), HL=-HL           +
;----------------------------------------------------------------------------+
;Input  :	<hl> source value
 
;Output :	<hl> the absolute or negative (2's complement) of input value
 
abshl	inr	h	;test positive hl value
	dcr	h
	rp
	call    neghl   ;negate hl
 
;neghl	mov	a,h	;hl is negative, get 2's complement of hl
;	cma
;	mov	h,a
;	mov	a,l
;	cma
;	mov	l,a
;	inx	h
	ret
;
;----------------------------------------------------------------------------+
;	SUBDH   SUBTRACT HL FROM DE : HL = DE - HL                           +
;----------------------------------------------------------------------------+
;Input  :	<de> = minuend
;	        <hl> = subtrahend
 
;Output :	<hl> = result
;		carry = on,  de <  hl
;		      = off, de >= hl
 
subdh	mov	a,e
	sub	l	;subtract l from e
	mov	l,a	;store partial result
	mov	a,d
	sbb	h	;subtract h from d
	mov	h,a	;store result
	ret
;
;----------------------------------------------------------------------------+
;	CMPS    COMPARE DE AND HL (SIGNED VALUES <DE> - <HL>)                +
;----------------------------------------------------------------------------+
;Input	:	<de> = value 1
;		<hl> = value 2
 
;Output :	carry = on,  de <  hl
;		      = off, de >= hl
;               Uses <a>
 
cmps
;	Test sing bits
	mov	a,d
	ana	h
	jp	cmpj01
;	Both negative
        mov	a,e
	sub	l	;subtract l from e
	mov	a,d
	sbb	h	;subtract h from d
;       if carry set ==> dl > hl
	rz              ;if de=hl leave carry off
	cmc             ;complement carry
	ret
;	Test if both positive or different signs
cmpj01	
	mov	a,d
	ora	h
	jp	cmpj02
;	de and hl have different signs : carry off if de>=0 (de>hl)
	xra	a
	ora	d
	rp
	cmc
	ret		;carry on if hl>=0 (de<hl)
cmpj02	
;	both positive : de-hl sets carry if de<hl
	mov	a,e
	sub	l	;subtract l from e
	mov	a,d
	sbb	h	;subtract h from d
	ret             ;carry set for de<hl, off for de>=hl
 
;----------------------------------------------------------------------------+
;	CMPDH   COMPARE DE AND HL (UNSIGNED BINARY)                          +
;----------------------------------------------------------------------------+
;Input	:	<de> = value 1
;		<hl> = value 2
 
;Output :	carry = on,  de <  hl
;		      = off, de >= hl
;               zero  = on,  de  = hl
 
cmpdh	mov	a,d
	cmp	h	;compare higher byte d,h
	rnz		;carry set for d<h, carry off for d>h
	mov	a,e	;d=h
	cmp	l	;compare lower byte e,l
	ret		;carry set for e<l, carry off for e>=l
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;   GETMIN  :   RETURNS IN <HL> THE SMALLER VALUE OF <HL> AND <DE>           ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;on entry:	
;		values in <hl>, <de>
 
;on exit:	Smaller value in <hl>
;               <a>  used
 
GETMIN                           ;eg.                 ;----------------------;
         CALL   CMPS             ;       lhld  xmin   ;  call  cmps          ;
         RNC                     ;       call  xr --->;  rnc                 ;
         MOV    H,      D        ;       shld  xmin   ;  mov   h, d/mov  l,e ;
         MOV    L,      E        ;                    ;  ret                 ;
         RET                     ;                    ;----------------------;
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;   GETMN0  :   RETURNS IN <HL> THE SMALLER VALUE OF <HL> AND <DE>           ;
;               IF SMALLER  VALUE IS NAGATIVE, THEN RETURNS ZERO             ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;on entry:	
;		values in <hl>, <de>
 
;on exit:	Smaller value of <hl>, <de> or zero in <hl>
;               <a>  used
 
GETMN0                           ;eg.                 ;----------------------;
         CALL   CMPS             ;       lhld  xmin   ;  call  cmps          ;
         JNC    GMINJ1           ;       call  xr --->;  rnc                 ;
         MOV    H,      D        ;       shld  xmin   ;  mov   h, d/mov  l,e ;
         MOV    L,      E        ;                    ;  ret                 ;
                                 ;                    ;----------------------;
GMINJ1   ;Check <hl> < 0 ?
 
         MOV    A,      H
         ORA    H
         RP
         LXI    H,      0
         RET
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;   GETMAX  :   RETURNS IN <HL> THE LARGER VALUE OF <HL> AND <DE>            ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;on entry:	
;		values in <hl>, <de>
 
;on exit:	larger value in <hl>
;               <a>  used
 
GETMAX                           ;eg.                 ;----------------------;
         CALL   CMPS             ;       lhld  xmax   ;  call  cmps          ;
         RC                      ;       call  xr --->;  rc                  ;
         MOV    H,      D        ;       shld  xmax   ;  mov   h, d/mov  l,e ;
         MOV    L,      E        ;                    ;  ret                 ;
         RET                     ;                    ;----------------------;
 
PAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;               INTEGER MULTIPLICATION <hl> = <hl> * 8                       ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;on entry:	
;		<hl> has multiplicant
 
;on exit:	<hl> has product
;               <a>  used
 
MUL8
        PUSH    B                ;Stack <b>
        MVI     B,     3         ;Left shift <hl> 3 times
MUL01
        XRA     A
        MOV     A,     L
        RAL                      ;Left shift <hl> Thru carry
        MOV     L,     A
        MOV     A,     H
        RAL
        MOV     H,     A
        DCR     B
        JNZ     MUL01
 
        POP     B
        RET
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;               INTEGER MULTIPLICATION                                       ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;on entry:	<de> has multiplicand
;		<hl> has multiplier
 
;on exit:	<hl> has product
;		<de> has multiplicand
;               <bc> unchanged
 
;registers used: <a> and flags
 
;this routine version ensures that the multiplier is
;the smaller of the two operands, so that if either is
;a one byte value, execution time is halved.
 
;code length: 64 bytes
 
;execution time: 257 clock cycles (8080) - best case
;		 613 clock cycles (8080) - worst case
;		 539 clock cycles (8080) - typical
 
midh:
        push    b       ;save <bc>
	mov	a,h	;is <h> less than <d>?
	cmp	d
	jc	mpy3	;don't exchange if so
	xchg		;smallest operand now in <hl>
mpy3:
	mov	b,h	;<bc> gets multiplier
	mov	c,l
	lxi	h,0	;clear partial product
	mov	a,b	;get hi byte of multiplier
	ora	a	;see if it is zero
        push    b       ;save the multiplier
	cnz	mpy	;multiply hi byte if non-zero
	pop	b	;get the saved multiplier
	mov	a,c	;now multiply by lo byte
 
        call    mpy
        pop     b       ;Restore <bc>, cleanup stack
        ret
 
;       Replace this macro to reduce code size
;--------------------------------------------------------------|
;mpy:                                                          |
;	rept	7	;in-line for speed                     |
;	dad	h	;shift partial product                 |
;	ral		;next multiplier bit                   |
;	jnc	$+4	;add multiplicand if...                |
;	dad	d	;...multiplier set                     |
;	endm                                                   |
;	dad	h	;break out of macro on last            |
;	ral		;...iteration so we can do a...        |
;	rnc		;...return instead of jump             |
;	dad	d                                              |
;	ret                                                    |
;--------------------------------------------------------------|
 
mpy:    mvi     c,8
mpy1:
        dad     h
        ral             ;next multiplier bit
        jnc     mpy7    ;add multiplicand if ...
        dad     d       ;... multiplier set
mpy7    dcr     c       ;done ?
        jnz     mpy1
        ret
 
        page
;
;----------------------------------------------------------------------------+
;       integer divide routine                                               +
;----------------------------------------------------------------------------+
 
;on entry:	<de> has dividend
;		<hl> has divisor
 
;on exit:	<hl> has quotient
;               <bc> has remainder
;all registers used
 
didh:
	mov	a,h
	xra	d	;sgn(result) = sgn(op1) xor sgn(op2)
	push	psw	;save sign of result in sign flag
	xra	d	;test sign of divisor
	cm	neghl	;negate it if neg
	xchg		;divisor to <de>, <hl>=dividend
	mov	a,h
	ora	a	;test sign of dividend
	cm	neghl	;negate dividend if neg
 
;now test for small divisor and/or small dividend and
;take appropriate shortcut
 
	jz	id1	;if 1-byte dividend, gen 8 dig quot
	mvi	b,16	;else 16-bit quotient
	mov	a,d	;is divisor 1-byte value?
	ora	a
	jnz	id4	;long-loop if not
	ora	e	;less than 128? (7-bit value)
	jp	id5	;short loop if so
id4	mov	a,b	;<a> counts bits for long-divisor
	lxi	b,0	;clear remainder
idiv1	push	psw	;save # digits to go
	dad	h	;this starts a 32-bit left shift...
	mov	a,c	;... with <hl> as lo order word...
	ral		;and <bc> as hi order word
	mov	c,a	;carry bit communicates between bytes
	mov	a,b
	ral
	mov	b,a
	mov	a,c	;now compare divisor, dividend
	sub	e
	mov	a,b
	sbb	d	;carry bit tells story
	jc	idiv2	;carry set if divisor larger
	mov	b,a	;otherwise subtract divisor...
	mov	a,c	;...from current dividend
	sub	e
	mov	c,a
	inx	h	;increment quotient
idiv2	pop	psw	;retrieve # digits remaining
	dcr	a	;one less to go
	jnz	idiv1	;loop till done
id3	pop	psw	;get sign of result
	rp		;done if positive
neghl	sub	a	;else, negate
	sub	l
	mov	l,a
	sbb	h
	sub	l	;remove <l> from hi byte
	mov	h,a
	ret
id1	mvi	b,8	;only 8-bit quotient
	mov	h,l	;put 8-bit dividend in <h>
	mov	l,a	;clear <l>
	ora	d	;<a>=0. test hi divisor
	jnz	id4	;do long-divisor loop if 2 bytes
	ora	e	;7-bit value?
	jm	id4	;do long-divisor loop if > 127
id5	sub	a	;clear remainder
id2	dad	h	;short divisor loop. next dividend...
	ral		;...bit to <a>
	cmp	e	;exceeds divisor?
	jc	id6	;don't subtract if not
	sub	e	;else subtract divisor
	inx	h	;update quotient
id6	dcr	b	;one less quotient bit to go
	jnz	id2
	mov	c,a	;remainder to <bc> (<b>=0)
	jmp	id3	;take care of quotient sign
 
 
;routine to return in <hl> the stacked integer modulo
;the integer passed in <hl>.
 
imod:
	pop	b	;get return address
	pop	d	;dividend to <de>
	push	b	;restore return addr
	call	didh	;divide <de> by <hl>, remainder in <bc>
	mov	h,b	;move remainder to <hl>
	mov	l,c
	ret
	
        page
        TITLE   'FRACTION MULTIPLY AND DIVIDE ROUTINES'
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  MULFRA : Multiply 16-bits fraction and integer, returns 16-bits result    ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;  Revision : Oct. 15, 1982
 
;  CALL MULFRA
;    <DE> = Fraction Multiplier
;    <HL> = Integer  Multiplicant
;  RET
;    <HL> = 16-bits Result
;    <BC> = Unchanged
 
MULFRA	
        PUSH    B       ;Save <bc>
 
;       test sign of integer, ensure that it is positive before doing
;       the multiplication
 
        xra     a
        ora     h
;****
;       push    psw     ;Saves the sign for result
;****
        cm      neghl   ;if negative then make it positive
        push    h
 
        mvi	c,16    ;do 16-bit multiply
        XRA     A       ;Clear work registers
        LXI     H,0
 
FRAL01  MOV     A,D
        RAR
        MOV     D,A
        MOV     A,E
        RAR
        MOV     E,A
        JNC     NOADD   ; No bit, no add.
        MOV     A,C     ; Save the counter for a moment.
        POP     B       ; Get operator number 2.
        DAD     B       ; Add this to the temp result.
        PUSH    B       ; Save op2.
        MOV     C,A     ; Move the counter back.
 
NOADD   MOV     A,H
        RAR
        MOV     H,A
        MOV     A,L
        RAR
        MOV     L,A
        DCR     C
        JNZ     FRAL01
        JNC     FRAJ01  ;If Carry is set,
        INX     H       ;add one to result
;----------------------------------------------------------------------------+
;       Reset the sign for the result                                        +
;                                                                            +
;       POP     D       ; Op 2 no longer needed                              +
;       POP     PSW     ; the sign of multiplicant                           +
;       CM      NEGHL   ; get correct sign for the result                    +
;       XCHG            ; Move the result to DE.                             +
;                                                                            +
;----------------------------------------------------------------------------+
 
FRAJ01
;      clean up stack
       POP     D        ; Op 2 no longer needed
       POP     B        ; Restore <bc> register
 
       RET
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  DIVFRA : Fractional Divide 2 16-bit integers, returns fractional result   ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;  CALL DIVFRA
;    <HL> = DIVIDEND, must be smaller than the divisor
;    <BC> = DIVISOR
;  RET
;    <DE> = The Fraction result
 
DIVFRA
 
;       make both operands positive
 
        call    abshl   ; set dividend positive
        push    h
        mov     h,b
        mov     l,c
        call    abshl   ; set divisor positive
        mov     b,h
        mov     c,l
        pop     h
 
        mvi     a,16    ; hl/bc => de   (must be a fraction)
        push    psw
        lxi     d,0     ;clear work register
 
divl01  xchg
        dad	h	; temp=temp*2
        xchg
        dad     h
        mov     a,l
        sub     c
        mov     l,a
        mov     a,h
        sbb     b
        mov     h,a
        jnc     gezero  ; op1-op2 >= 0
        dad     b
        jmp     divj02
gezero  inx     d
 
divj02  pop     psw
        dcr     a
        push    psw
        jnz     divl01
 
        pop     psw     ; clear the junk
        ret
 
        end
E 1
