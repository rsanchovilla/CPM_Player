h47859
s 00299/00000/00000
d D 1.1 83/03/17 15:58:14 tes 1 0
c date and time created 83/03/17 15:58:14 by tes
e
u
4
U
t
T
I 1
 
         TITLE ' COMPUTE THE BITMAP ADDRESS FOR PIXEL AT POSITION X,Y'
 
;----------------------------------------------------------------------------+
;        REVISION : NOV. 04, 1982     FILE "GETADR.ASM"                      +
;----------------------------------------------------------------------------+
 
         PUBLIC SBIT, GETADR, ADDRXY, SETBIT
 
         EXTRN  FILTER
         EXTRN  SUBDH, MIDH
 
         EXTRN  BITMAP, MPTY, NBYT, NBIT, TOPY, BOTTY, XW
 
         EXTRN  X0, Y0
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  SBIT                                                                      ;
;       FILTER Y TO WITH IN THE CURRENT PLOT STRIP, IF INSIDE THEN           ;
;       SET THE BIT AT ADDRESS X, Y IN THE BITMAP BUFFER                     ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                                                                            *
;  Process  :                                                                *
;                                                                            *
;     FILTER (y ,flag1)       ;Determine the relative position of the point  *
;        flag (bit 2) = sign bit of (topy - y)                               *
;        flag (bit 1) = sign bit of (y - boty)                               *
;                                                                            *
;     REJECT (flag1)          ;Test to see if the POINT outside strip        *
;                              for rejection                                 *
;     if inside then                                                         *
;                                                                            *
;        ADDRXY (x, y, nbyt, nbit)  ;Computer the BITMAP address             *
;                                                                            *
;        SETBIT (nbyt, nbit)        ;Set the bit in BITMAP                   *
;                                                                            *
;                                                                            *
;     FILTER returns                                                         *
;        flag (bit 2) = sign bit of (topy - y)                               *
;        flag (bit 1) = sign bit of (y - boty)                               *
;     position flag  bit 2 | 1 |                                             *
;                   ------------                                             *
;     point   above      1 | 0 |                                             *
;                   ------------ top y edge of strip                         *
;     point  inside      0 | 0 |                                             *
;                   ------------ bottom y edge of strip                      *
;     point   below      0 | 1 |                                             *
;                                                                            *
;----------------------------------------------------------------------------*
;                                                                            +
;  CALL SBIT                                                                 +
;      X ,Y , TOPY,BOTY passed in meory                                      +
;  RET                                                                       +
;----------------------------------------------------------------------------+
 
SBIT
         LHLD   Y0
 
;----------------------------------------------------------------------------+
;        Filter y-coordinate against strip                                   +
;----------------------------------------------------------------------------+
 
         CALL   FILTER           ;Returns position flag flg1 in <b>
                                 ;flg1 : 0 = boty < y  < topy
                                 ;      >0 = y  above or below strip
;      zero = on, point inside
;           = off,point rejected (lies outside window)
 
;----------------------------------------------------------------------------+
;        Test : Y lies entirely outside strip & can be trivially rejected ?  +
;----------------------------------------------------------------------------+
 
         XRA    A                ;reject Y if fg1 NOT= 0
         ORA    B                ;<b> = flg1
 
;        TRIVIALLY REJECT POINT
 
         RNZ                     ;Zero flag off indicating line rejected
 
;----------------------------------------------------------------------------+
;        POINT inside Plot Strip                                             +
;        Get bitmap address for first pixel x1,ystrt                         +
;----------------------------------------------------------------------------+
 
         LHLD   Y0
         XCHG                    ;<de> = y
         LHLD   X0               ;<hl> = x
         CALL   GETADR           ;Returns <hl> = nbyt, <b> = nbit
 
         CALL   SETBIT
 
         RET
 
 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  GETADR : Get the Bitmap Address for the Pixel (X,Y)                     ;
; ;                                                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Getadr (x, y, nbyt, nbit)                                                 ;
;                                                                            ;
;  Function : Compute the bitmap address                                     ;
;                                                                            ;
;  Input    : BITMAP - Start Byte address of the BITMAP Buffer               ;
;             X, Y Pixel coord.                                              ;
;  Output   :                                                                ;
;             NBYT - Pixel address pointer (byte position : y coordinate)    ;
;             NBIT - Pixel address pointer (bit position : x coordinate)     ;
;                                                                            ;
;  Calls    : ADDRXY - Compute pixel address relative to the start of BITMAP ;
;                                                                            ;
;----------------------------------------------------------------------------;
 
; CALL GETADR
;   <HL> = X
;   <DE> = Y
; RET
;   <HL> = NBYT
;   <B>  = NBIT
 
GETADR
 
;       Get the address of x,y relative to the start of bitmap
 
        CALL    ADDRXY           ;Returns <hl> = nbyt
                                 ;        <b>  = nbit
 
;       Add byte address to the base address
 
        CALL    CORADR           ;Get the base address of the corresponding
                                 ;color bitmap buffer, returns the Base
                                 ;Address + NBYT in <hl>
        SHLD   NBYT             ;STORE pixel bitmap address
        MOV    A,      B
        STA    NBIT
 
        RET
 
;----------------------------------------------------------------------------;
;       CORADR - Add the byte address of the Pixel to the Base address of    ;
;                the Current Color Bitmap Buffer                             ;
;----------------------------------------------------------------------------;
;  CALL CORADR                                                               ;
;    <HL> = NBYT                                                             ;
;  RET                                                                       ;
;    <HL> = new NBYT                                                         ;
;----------------------------------------------------------------------------;
 
CORADR
        LXI     D,      BITMAP   ;Get the Base address (one BITMAP for
                                 ;Monochrome device)
        DAD     D                ;add to the relative byte address in <hl>
 
        RET
 
;*****************************************************************************
 
;                                                                            *
;  Pixel (nbyt, nbit)                                                        *
;                                                                            *
;*****************************************************************************
;*
 
;*PIXEL
;*       LXI    D,     BITMAP    ;Bitmap buffer base address
;*       DAD    D                ;Add base to byte pointer <hl> = nbyt
;*       CALL    SETBIT
;*       RET
;*
         PAGE
; ****************************************************************************
; *                                                                          *
; *  ADDRXY : DETERMINE THE BITMAP ADDRESS AT WHICH THE PIXEL X,Y SHOULD     *
; *           BE STORED                                                      *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Addrxy (x, y, nbyt, nbit)                                                 *
;                                                                            *
;  Function : Set BITMAP USED indicator : MPTY                               *
;             Maps pixel location x,y to BITMAP address nbyt,nbit            *
;               topy is mapped to end of bitmap buffer                       *
;               botty is mapped to start of bitmap buffer                    *
 
;               adjust y to address within bitmap boundary                   *
;               y = y - botty                                                *
;               nbyt = y*xw + x/8  ;the byte position in bitmap for          *
;                                          the x,y coord., xw = (No. of      *
;                                          pixels per print line)/8          *
;               nbit = x mod 8    ;the bit position in nbyt for x coord.     *
;                                                                            *
;  Input    : X, Y                                                           *
;                                                                            *
;  Output   : nbyt - address pointer to the byte location in bitmap          *
;             nbit - bit location in nbyt for pixel x,y                      *
;                                                                            *
;  Calls    : MIDH - 16-bit integer multiply routine                         *
;                                                                            *
;----------------------------------------------------------------------------*
;                                                                            ;
;  CALL ADDRXY                                                               ;
;    <HL> = X                                                                ;
;    <DE> = Y                                                                ;
;  RET                                                                       ;
;    <HL> = NBYT                                                             ;
;    <B>  = NBIT                                                             ;
;----------------------------------------------------------------------------;
 
 
ADDRXY
;----------------------------------------------------------------------------+
;        Nbit = x mod 8                                                      +
;----------------------------------------------------------------------------+
 
         MVI    A,     07H
         STA    MPTY             ;Set BITMAP BUFFER Used Indicator
         ANA    L                ;A=nbit
         PUSH   PSW              ;Save nbit
 
;----------------------------------------------------------------------------+
;        Nbyt = Y*XW + X div 8                                               +
;----------------------------------------------------------------------------+
 
         MVI    B,     3         ;X div 8 (Shift right 3 times)
ADDL01   XRA    A                ;clear carry
         MOV    A,     H
         RAR
         MOV    H,     A         ;Double register shift
         MOV    A,     L
         RAR
         MOV    L,     A
         DCR    B
         JNZ    ADDL01           ;Shift 3 times
         PUSH   H                ;Save x div 8
 
;----------------------------------------------------------------------------+
;        Adjust y to current Plot strip bottom y = BITMAP base address       +
;----------------------------------------------------------------------------+
 
         LHLD   BOTTY            ;y = y - current bottom edge (botty)
         CALL   SUBDH            ;<hl> = y - botty
         XCHG                    ;Put into <DE>
 
         LHLD   XW               ;Get buffer row count : xw bytes
         CALL   MIDH             ;<HL> = Y * XW
         POP    D                ;<DE> = X div 8
         DAD    D                ;<HL> = NBYT
         POP    B                ;<B>  = NBIT
         RET
 
; ****************************************************************************
; *                                                                          *
; *  SETBIT : 'SET' THE BIT AT THE BITMAP BUFFER ADDRESS NBYT,NBIT           *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Setbit (nbyt, nbit)                                                       *
;                                                                            *
;  Function : 'SET' a bit in BITMAP buffer, use nbyt and nbit as address     *
;             pointer                                                        *
;                                                                            *
;  Input    : NBYT - Byte address                                            *
;             NBIT - bit position in nbyt to 'SET',                          *
;                    nbit =  0  1  2  3  4  5  6  7                          *
;                    mask = 80 40 20 10 08 04 02 01H                         *
;                                                                            *
;  Output   : None                                                           *
;                                                                            *
;----------------------------------------------------------------------------+
;                                                                            +
;  CALL  SETBIT                                                              +
;    <HL> = NBYT                                                             +
;    <B > = NBIT                                                             +
;  RET                                                                       +
;    <BC> <DE> <HL> Unchanged                                                +
;     Uses <A>                                                               +
;----------------------------------------------------------------------------+
 
SETBIT   PUSH   B                ;Save <BC>
 
;        Set bit mask
 
         MVI    A,     01H
ROTA     RRC
         DCR    B
         JP     ROTA
 
;        Set bit in nbyt
 
         ORA    M
         MOV    M,     A         ;Store new bit pattern into BITMAP
         POP    B                ;Restore nbit
         RET
 
         END
E 1
