h03472
s 00076/00001/00115
d D 1.2 83/03/30 11:31:03 mrk 2 1
c compatible with rat4 driver
e
s 00116/00000/00000
d D 1.1 83/03/25 19:31:40 mrk 1 0
c date and time created 83/03/25 19:31:40 by mrk
e
u
mrk
U
t
T
I 1
;
I 2
; Allow access to the two common blocks that the driver contain
;
	common     /gssdev/
ndclrf  ds         2
ndclrl  ds         2
ndclrm  ds         2
ndclrp  ds         2
ndclrt  ds         2
ndflpt  ds         2
ndfstl  ds         2
ndlntp  ds         2
ndmktp  ds         2
ndmkht  ds         2
ndotkt  ds         2
ndpnpr  ds         2
ndtxrt  ds         2
ndtxsz  ds         2
ndtysz  ds         2
ndxpos  ds         2
ndypos  ds         2
ndlcmd  ds         2
ndvlmd  ds         2
ndchmd  ds         2
ndstmd  ds         2
        cseg
	common     /cmotrn/
writmd  ds         2
extras  ds         20
	cseg
;
E 2
; subroutine otrnot (i)
;    output a character to the console
;
        public  otrnot
otrnot:	mvi	c,6	; BDOS opcode for direct output to console
	mov	e,m	; e=character to output
	jmp	5	; call BDOS
; ************************************************************
;
D 2
;  subroutine sebit (x, y)
E 2
I 2
;  subroutine setbit (x, y)
E 2
;      purpose: set a bit in the display memory
;
        public setbit
        extrn divid
INFO    equ 00feh
CMD     equ 00eeh
xcoord: ds 2
ycoord: ds 2
cnst10: dw 10
segmnt: ds 2
extrax: ds 1
column: ds 2
row:    ds 1
mask:   ds 1
I 2
curclr: ds 1
E 2
scanum: db 80h, 60h, 40h, 20h, 0h
I 2
OVRSTK: equ 2h
XORMOD  equ 3h
CLEAR   equ 4h
E 2
;
setbit: mov   a, m    ; Get the x, y parameters from fortran
        sta   xcoord
        inx   h
        mov   a, m
        sta   xcoord+1
        xchg
        mov   a, m
        sta   ycoord
        inx   h
        mov   a, m
        sta   ycoord+1
 
I 2
; Get a local copy of the color to use 
	lda    ndclrp
	sta    curclr

;  Start off by checking the writing mode, 
;      if it is OVERSTRKIE and color is 0 there is no action
;      if mode is CLEAR, set color to 0
        lda    writmd
        sui    OVRSTK
        jnz    godmod
	;  the mode was overstrike, now check color
	lda    curclr
	ora    a
	jnz    godmod
	ret               ; yes overstrike and color 0

; now check if CLEAR is on, if yes set color to be 0
godmod: lda    writmd
	sui    CLEAR
	jnz    godclr
	; the mode was clear, set color to 0
	mvi    a, 0
	sta    curclr
godclr:
E 2
; Get the bottem 2 bits of the x coordinate,
; They will be used to determine the bit
        lda   xcoord
        ani   03h
        mov   b, a
        mvi   a, 3h
        sub   b
        sta   extrax
 
; Now need to shift the xcoord by 2 to determine with character column
; rotate the high byte right and carry the carry flag to the rotate of
; the low byte
        lhld  xcoord
        mov   a, h
        rar
        mov   h, a
        mov   a, l
        rar
        mov   l, a
        xra   a         ; clear the old carry bit so it will not be appended
        mov   a, h
        rar
        mov   h, a
        mov   a, l
        rar
        mov   l, a
        shld  column
 
; Begin to form the y corrdinate, determine which row it is in
        lxi   b, segmnt
        lxi   d, cnst10
        lxi   h, ycoord
        call  divid
        mvi   a, 23
        sub   l
        sta   row
        xra   a
        lda   segmnt
        rar
        sta   segmnt
        jc    setbias
        mvi   a, 0h     ; do not need bias for odd scan
        jmp   endbias
setbias:mvi   a, 4h    ; will need to rotate mask 4
endbias:
        mov b, a
        lda extrax
        add b
        mov b, a
        mvi a, 1h
loop:   dcr b
        jm out1
        ral
        jmp loop
out1    sta   mask   ; save away the new bit to set
        lxi   h,  scanum
        lda   segmnt 
        mvi   d,  0
        mov   e,  a
        dad   d
        mov   a, m       ; Get the scan pair number
        mov   b, a
        lda   row        ; Load the row number
        ora   b          ; Produce the Display status register
        out   CMD        ; Put out this command
        lda   column     ; Get the column number
        mov   b, a       ; Prepare for input
        mvi   c, info
;       in    a, (c)     ; Get what is currently there into A
        db    0edh, 078h ; Fake out the z80 instruction
        mov   d, a       ; Save away the memory
I 2
        lda    writmd
        sui    XORMOD
        jnz    nonxor
;  the mode was xor
        lda    mask
	xra    d
	jmp    outblk

nonxor: lda curclr
	ora   a          ; check if color is 0
E 2
        lda   mask       ; get the least sig x part
I 2
	jz    color0
color1: 
E 2
        ora   d          ; Combine exisiting and new info
I 2
	jmp   outblk
color0: 
        cma
	ana   d          ; Mask off the bit to clear
outblk:
E 2
;       out  (c), a      ; put out the new byte
        db   0edh, 079h  ; Fake out the z80 instruction
        ret
        end
E 1
