h51206
s 00218/00000/00000
d D 1.1 83/03/15 21:25:45 tes 1 0
c date and time created 83/03/15 21:25:45 by tes
e
u
4
U
t
T
I 1
        public     setbit
XLIMITS       equ  671
RASTERBUFFER  equ  672
RASTERLENGTH  equ  2688
        common     /raster/
ytop    ds         2
ybot    ds         2
rasbuf  ds         RASTERLENGTH
	cseg
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
; setup the color table  by using bits
;        yellow  red  blue   black
;           1     1     0      0    makes orange
;
;                         nul  red  green blue orng yelw purp black
clrtbl  db                 00,  04,  10,  02,  12,  08,  06,  01
;
;  subroutine setbit (x, y, qvis)
;     purpose : set a bit in the raster buffer if the input (x, y)
;               is in the current raster strip
;               qvis = .true. if the point is in the raster strip

xcoord:  ds       2
ycoord:  ds       2
qvis     ds       2
index    ds       2
mask     ds       1

setbit:  mov      a, m     ; get low order byte of x
	 sta      xcoord   ;   and save it
	 inx      h
	 mov      a, m     ; get high order byte of x
	 sta      xcoord+1 ;   and save it
	 xchg
	 mov      a, m     ; get low order byte of y
	 sta      ycoord   ;   and save it
         inx      h
	 mov      a, m     ; get high order byte of y
	 sta      ycoord+1 ;   and save it
	 push     b        ; push third parm for the register transfer
	 pop      h        ; get the address into HL
	 shld     qvis
	 mvi      a, 0
	 mov      m, a     ; start out by saying point not visible
;
; now check to see if y is in the current plot strip by
; comparing to ybot and ytop
;
         lhld     ybot
	 xchg
	 lhld     ycoord
	 call     isub
	 rm                ; y below current strip
	 lhld     ycoord
	 xchg
	 lhld     ytop
	 call     isub
	 rm                ; y above current strip
;
; now check the x value to make sure the point is within the x limits
;
	 lda      xcoord+1 ;  load high order byte of the x to check sign
	 ora      a
	 rm                ; if minus bit is set, the value was negative
	 lhld     xcoord   ; if x > xmax return
	 lxi      d,XLIMITS 
	 xchg              ; xcoord in DE, xlimits in HL
	 call     isub
	 rm                ; return if xcoord > xlimits

;
; check that the color is not zero
;
	 lhld     ndclrp   ; Desired color
	 mov      a,   h
	 ora      l
	 rz
;
;  since the point was not clipped away, the vis parameter is set true
;
	 mvi      a, 0ffh
	 lhld     qvis     ; start out by saying point not visible
	 mov      m, a     ; put out the output parameter

;
; Now determine which of the four rows the particular byte
; is located in
;
	 lxi      h,  2016 ; index hold the index into RASBUF, start with black
	 shld     index    ; save it away

	 lhld     ndclrp   ; Get current color
	 lxi      d,  clrtbl
	 dad      d
	 mov      a,  m
	 push     psw      ; put the color on the stack

         lhld     ycoord   ; subtract the row from the top to get the row
	 xchg
	 lhld     ytop
	 call     isub
	 call     power2
	 mov      a,  l
	 sta      mask

another: pop      psw      ; Get the color from the stack
	 rrc               ; see if the index is set
	 push     psw      ; save the rotated color
	 cc       setcolr  ; Yes, this color is used
	 lhld     index
	 lxi      d,  RASTERBUFFER
	 call     isub     ;  Decrement the index
	 shld     index    ; save the new index away
	 mov      a,  h
	 ora      h
	 jp       another  ; Not done yet
	 pop      psw
	 ret
     
setcolr: lxi      d,  rasbuf ; compute the index into rasbuf
	 lhld     index
	 dad      d        ;  Get the address of the byte in HL
	 xchg
	 lhld     xcoord   ; add in the xcoord offset
	 dad      d
	 lda      mask     ; set up the mask
	 mov      e, a
	 mov      a, m
	 ora      e        ;  Or in the mask saved in E
	 mov      m, a
	 ret
;
;  subtract de from hl with results in hl
;
isub:   mov       a,  l
	sub       e
	mov       l,  a
	mov       a,  h
	sbb       d
	mov       h,  a
	ret
;
; power2  function to return the power of 2 requested
;
power2: mov       a,  l    ; Get the power of 2 requested
	lxi       h,  1
	ana       a        ; Test if power is 0
loop:   rz                 ; Return if count is 0
	dad       h        ; add result to itself
	dcr       a        ; decrement the counter and test
	jmp       loop
;
;  subroutine prtout (c) - outputs the character to the printer device
;
        public  prtout
prtout: mov     a,m             ; get character
        ani     07fh            ; mask high order bit
        mov     e,a             ; put character in e for bdos call
        mvi     c,5             ; set list output opcode
        jmp     5               ; make bdos call to output to printer
;
;  subroutine prstot (n, c) - outputs character string to printer device
;                       c is assumed to be a byte array of characters
;
        public  prstot
prstot: mov     c,m             ; get count of characters
        inx     h
        mov     b,m
        xchg                    ; get address of character string
prt1:   push    b               ; save character count
        push    h               ; save address of character
        mov     a,m             ; get character
        ani     07fh            ; mask off parity bit
        mov     e,a             ; put character in e for bdos call
        mvi     c,5             ; set list output opcode
        call    5               ; make bdos call to output to printer
        pop     h               ; get address of character string back
        inx     h               ; update pointer into character string
        pop     b               ; get character count back
        dcx     b               ; decrement count and loop if not done
        mov     a,b             ; test for 0
        ora     c
        jnz     prt1
        ret
BDOS    Equ     5       ;
Public  Setdma
Setdma: Mov     c,m
        Call    BDOS
        ret
Public  Gzbdos          ;
Gzbdos: Mov     C,M     ;
        Call    BDOS    ;
        Mvi     H,0     ;
        Mov     L,A     ;
        Ret             ;
	end
E 1
