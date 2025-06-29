h27741
s 00509/00000/00000
d D 1.1 83/03/17 16:00:31 tes 1 0
c date and time created 83/03/17 16:00:31 by tes
e
u
4
U
t
T
I 1
 
        TITLE 'PHASE I : SET ATTRIBUTE SUPPORT, OPCODES 12 - 25'
 
; ****************************************************************************
; *                                                                          *
; *  ZSATTR : EPSON MX-80 PRINTER DRIVER OUTPUT ATTRIBUTE SUPPORTS           *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : NOV. 14, 1982   File "ZSATTR.ASM"     Version 1.0              *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
; 11/14  1. Use 6x8 Font Table, Character Width = NDTXSZ * 6 pixels (CHRSZ)  *
;                               Character Height= NDTXSZ * 8 pixels (CHRHT)  *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;    PBPTR  : Parameter Block Address Pointers                               *
;                                                                            *
;             PB    Address of Control Array (CONTRL)                        *
;             PB+2  Address of Input Parameter Array (INTIN)                 *
;             PB+4             Input Point Coordinate Array (PTSIN)          *
;             PB+6             Output Parameter Array (INTOUT)               *
;             PB+8             Output Point Coordinate Array (PTSOUT)        *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;    Opcode Dependent, Output returned to GSX in Array CONTRL, INTOUT,       *
;    and PTSOUT                                                              *
;                                                                            *
;*****************************************************************************
 
        PUBLIC ZCHSZ, ZCHRT, ZLNTY, ZLNCO, ZMKCO, ZMKTY, ZMKSZ, PMKTBL
        PUBLIC ZFITY, ZINTY, ZTXCO, ZFICO, ZESCAP
        EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT, CNTRL3
 
        EXTRN  NDLNSZ, NDTXSZ, NDMKSZ, NDTXRT
        EXTRN  WKID, NDLNTY, NDLNCO, NDMKTY, NDMKCO, NDTXTY, NDTXCO
        EXTRN  NDINTY, NDFITY, NDFICO
 
        EXTRN  CHRSZ, CHRHT, PMKSZ
 
        EXTRN  PUTBYT, PUTPT
        EXTRN  OBJCNT, OBJLST
 
LNSZ0    EQU    1
LNSZ9    EQU    1
MKSZ0    EQU    8
MKSZ9    EQU    96
TXSZ0    EQU    8
TXSZ9    EQU    96
 
;----------------------------------------------------------------------------+
;        Polymarker sumbol table                                             +
;----------------------------------------------------------------------------+
 
PMKTBL   ; Polymarker sumbol table
 
         DB     1BH    ; 1 - .
         DB     1CH    ; 2 - +
         DB     1DH    ; 3 - *
         DB     1EH    ; 4 - O
         DB     1FH    ; 5 - x
 
;----------------------------------------------------------------------------+
; Escape Function    Opcode = 5                                              +
;----------------------------------------------------------------------------+
ZESCAP
         ; Determine which opcode is desired
         LHLD   CONTRL
         LXI    D,    10         ; Determine which Escape code is desired
         DAD    D
         MOV    A,    M          ; Get the opcode from the contrl array
         DCR    A
         RNZ                     ; Code 1 is the only one that is processed
 
         LHLD   INTOUT
         MVI    M,    0FFH       ;Return -1, -1 in intout indicating no
         INX    H                ;Character cell addressing
         MVI    M,    0FFH
         INX    H
         MVI    M,    0FFH
         INX    H
         MVI    M,    0FFH
         RET
 
;----------------------------------------------------------------------------+
; Set Char Height    Opcode = 12                                             +
;----------------------------------------------------------------------------+
 
ZCHSZ
        LHLD    OBJCNT
        INX     H
        SHLD    OBJCNT  ; Increment Object Count
 
        MVI     A,12
        CALL    PUTBYT  ; Store Opcode into OBJLST
 
        lhld    ptsin
        inx     h
        inx     h       ; requested height in device units
        mov     b,m     ; <B> = Requested height in Device Units
        inx     h
        mov     a,m
        ora     a
        jz      notbig
 
        mvi     b,TXSZ9 ; max height
 
notbig  mvi     a,4     ; round to nearest 8 pixels
        add     b
        ani     0f8H
        jnz     notsml
        mvi     a,TXSZ0
notsml
        sta     CHRHT   ; Store pixel height
        rrc
        rrc
        rrc             ; repeat factor (1-12)
        sta     NDTXSZ
	CALL	PUTBYT	; Store Chracter size factor into OBJLST
	LDA	NDTXSZ
	MOV	B,A
	LDA	CHRHT
	SUB	B
	SUB	B
	STA	CHRSZ
 
;----------------------------------------------------------------------------+
;       Output Character size in device units                                +
;----------------------------------------------------------------------------+
 
        lhld    ptsout
         LDA    NDTXSZ
         MOV    B,A    ; <B> = NDTXSZ
         LDA    CHRSZ  ; <A> = NDTXSZ * 6
         SUB    B      ; <A> = NDTXSZ * 5
         MOV    M,A    ; PTSOUT(1) = NDTXSZ * 5
         INX    H
         MVI    M,0
         INX    H
 
         mvi    c,3    ; PTSOUT(2) TO (4) = NDTXSZ * 8
        LDA     CHRHT
schlp   mov     m,a
        inx     h
        mvi     m,0
        inx     h
        dcr     c
        jnz     schlp
 
        lhld    ptsout
        lxi     d,4
        dad     d
        lda     CHRSZ
        mov     m,a     ;ptsout(3) = ndtxsz * 6
 
;----------------------------------------------------------------------------+
;       contrl(3) = 2                                                        +
;----------------------------------------------------------------------------+
 
        lhld    CNTRL3
        mvi     m,2     ; return 2 vertices
 
        ret
 
;----------------------------------------------------------------------------+
; Set Char Up Vector Opcode = 13                                             +
;----------------------------------------------------------------------------+
 
ZCHRT
        lhld    objcnt
        inx     h
        shld    objcnt
 
        MVI     A,13
        CALL    PUTBYT  ; Store OPCODE into OBJLST
 
        lhld    intin
        mov     e,m     ; round to nearest 90
        inx     h
        mov     d,m     ; <DE> = Requested angle
 
 
;0      0    - 450,  rotation = 0,   SET NDTXRT : 1, do 90 rotation
;4      3150 - 4050, rotation = 0,   SET NDTXRT : 1, do 90
;1      450  - 1350, rotation = 90,  SET NDTXRT : 2, do 180 rotation
;2      1350 - 2250, rotation = 180, SET NDTXRT : 3, do 270
;3      2250 - 3150, rotation = 270, SET NDTXRT : 0, do 0
 
;                                                                            *
;** NOTE **                                                                  *
;**      The Character Cell is mapped using Character Up Vector, NOT         *
;**      The Character Base Vector -- this translate the angles :            *
;**          Base vector  =  Up vector                                       *
;**               0       =  90                                              *
;**              90       =  180                                             *
;**              180      =  270                                             *
;**              270      =  0                                               *
;**                                                                          *
 
        lxi     h,450
        dad     d       ; add 450
        mvi     c,4
dirlp   mov     a,l
        sui     84H     ; 900 is 384H
        mov     l,a
        mov     a,h
        sbi     3
        mov     h,a
        jc      gotdir
        dcr     c
        jnz     dirlp
 
;       STORE NDTXRT
 
gotdir
        PUSH    B
        MVI     A,5
        SUB     C
        ANI     3
        sta     NDTXRT
 
        CALL    PUTBYT  ; Store rotation factor into OBJLST
 
;       Return in intout(1) - rotation angle : angle indicator in <c>
 
        POP     B
        mvi     b,0
        lxi     h,seldir
        dad     b
        dad     b
        mov     e,m
        inx     h
        mov     d,m
        lhld    intout
        mov     m,e
        inx     h
        mov     m,d
 
        RET
 
;
;       Angle of Rotation selected
;
SELDIR  DW      0
        DW      2700
        DW      1800
        DW      900
        DW      0
 
 
;----------------------------------------------------------------------------+
; Set Color Rep      Opcode = 14                                             +
;----------------------------------------------------------------------------+
 
 
;----------------------------------------------------------------------------+
; Set Polyline Type  Opcode = 15                                             +
;----------------------------------------------------------------------------+
 
ZLNTY
         LHLD   OBJCNT
         INX    H
         SHLD   OBJCNT
 
         MVI    A,     15
         CALL   PUTBYT           ;Store OPCODE into OBJLST
 
         LHLD   INTIN
         MOV    A,     M         ;LINE STYLE REQUESTED
         CPI    6                ;If type out of range (>6), then type = 1
         JC     ZLNJ01
         MVI    A,     1
ZLNJ01
         LHLD   INTOUT
         MOV    M,     A         ;Return Line style
         inx    h
         mvi    m,     0
 
         DCR    A
         CALL   PUTBYT           ;Store Line Style flag in OBJLST
 
         RET
 
;----------------------------------------------------------------------------+
; Set Polyline Width Opcode = 16
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Set Polyline Color Opcode = 17
;----------------------------------------------------------------------------+
 
ZLNCO
         LHLD   INTOUT
         MVI    M,     1         ;Always return line color 1
         INX    H
         MVI    M,     0
         RET
 
;----------------------------------------------------------------------------+
; Set Polymarker Typ Opcode = 18                                             +
;----------------------------------------------------------------------------+
 
ZMKTY
         LHLD   OBJCNT
         INX    H
         SHLD   OBJCNT
 
         MVI    A,     18
         CALL   PUTBYT           ;Store OPCODE into OBJLST
 
         LHLD   INTIN
         MOV    A,     M         ;MAKER TYPE REQUESTED
         CPI    8                ;If type out of range (>8), then type = 3
         JC     ZMKJ01
         MVI    A,     3
 
ZMKJ01
         LHLD   INTOUT
         MOV    M,     A         ;Return Maker type
         INX    H
         MVI    M,     0
 
         DCR    A
         LXI    H,     PMKTBL    ;Maker type table
         MOV    E,     A
         MVI    D,     0
         DAD    D                ;<hl> = requested Maker index to table
         MOV    A,     M         ;Maker symbol in ACSII
 
         STA    NDMKTY
         CALL   PUTBYT           ;Store ASCII Maker symbol in OBJLST
 
         RET
 
;----------------------------------------------------------------------------+
; Set Polymarker Scl Opcode = 19                                             +
;----------------------------------------------------------------------------+
 
ZMKSZ
        LHLD    OBJCNT
        INX     H
        SHLD    OBJCNT  ; Increment Object Count
 
        MVI     A,19
        CALL    PUTBYT  ; Store Opcode into OBJLST
 
        lhld    ptsin
        inx     h
        inx     h       ; requested height in device units
        mov     b,m     ; <B> = Requested height in Device Units
        inx     h
        mov     a,m
        ora     a
        jz      ZMKJ02  ; Size is Not too big
 
        mvi     b,MKSZ9 ; set to max height
 
ZMKJ02
        mvi     a,4     ; round to nearest 8 pixels
        add     b
        ani     0f8H
        jnz     ZMKJ03  ; Size is not too small
 
        mvi     a,MKSZ0 ; Set to minimal height
 
ZMKJ03
        sta     PMKSZ   ; Store pixel height
        rrc
        rrc
        rrc             ; repeat factor (1-12)
        sta     NDMKSZ
 
        CALL    PUTBYT  ; Store Character size factor into OBJLST
 
;----------------------------------------------------------------------------+
;       Output Maker size in device units                                    +
;----------------------------------------------------------------------------+
 
        lhld    ptsout ; Return NDMKSZ : MAKER SIZE FACTOR
 
         MVI    M,0    ; PTSOUT(1) = 0
         INX    H
         MVI    M,0
         INX    H
 
         LDA    PMKSZ  ; <A> = MARKER FACTOR * 8
         MOV    M,A    ; PTSOUT(2) = NDMKSZ * 8
         INX    H
         MVI    M,0
 
;----------------------------------------------------------------------------+
;       contrl(3) = 1                                                        +
;----------------------------------------------------------------------------+
 
        lhld    CNTRL3
        mvi     m,1              ;Returns 1 vertices
 
        RET
 
;---------------------------------------------------------------------------+
; Set Polymarker Clr Opcode = 20                                            +
;---------------------------------------------------------------------------+
 
ZMKCO
         LHLD   INTOUT
         MVI    M,     1         ;Always return marker color 1
         INX    H
         MVI    M,     0
         RET
 
 
;----------------------------------------------------------------------------+
; Set Text Font      Opcode = 21
;----------------------------------------------------------------------------+
 
 
;----------------------------------------------------------------------------+
; Set Text Color     Opcode = 22
;----------------------------------------------------------------------------+
ZTXCO
 
         LHLD   INTOUT
         MVI    M,     1         ;Always return text color 1
         INX    H
         MVI    M,     0
         RET
 
;----------------------------------------------------------------------------+
; Set Fill Int Style Opcode = 23
;----------------------------------------------------------------------------+
 
ZFITY
         LHLD   OBJCNT
         INX    H
         SHLD   OBJCNT
 
         MVI    A,     23
         CALL   PUTBYT           ;Store OPCODE into OBJLST
 
         LHLD   INTIN
         MOV    A,     M         ;FILL STYLE REQUESTED
         CPI    3                ;If type out of range (>3), then type = 2
         JC     ZFIJ01
         MVI    A,     2
ZFIJ01
         LHLD   INTOUT
         MOV    M,     A         ;Return Fill style
         inx    h
         mvi    m,     0
 
         CALL   PUTBYT           ;Store Fill Style flag in OBJLST
 
        RET
 
;----------------------------------------------------------------------------+
; Set Fill Sty Index Opcode = 24
;----------------------------------------------------------------------------+
 
ZINTY
         LHLD   OBJCNT
         INX    H
         SHLD   OBJCNT
 
         MVI    A,     24
         CALL   PUTBYT           ;Store OPCODE into OBJLST
 
         LHLD   INTIN
         MOV    A,     M         ;FILL PATTERN REQUESTED
         CPI    7                ;If type out of range (>7), then type = 6
         JC     ZINJ01
         MVI    A,     6
ZINJ01
         LHLD   INTOUT
         MOV    M,     A         ;Return Fill style
         inx    h
         mvi    m,     0
 
         CALL   PUTBYT           ;Store Fill Style flag in OBJLST
 
        RET
 
 
;----------------------------------------------------------------------------+
; Set Fill Color     Opcode = 25
;----------------------------------------------------------------------------+
ZFICO
 
         LHLD   INTOUT
         MVI    M,     1         ;Always return text color 1
         INX    H
         MVI    M,     0
         RET
 
;----------------------------------------------------------------------------+
;        No Action Opcode Supports                                           +
;----------------------------------------------------------------------------+
 
NOACT
NOTYET   RET
 
 
         END
 
E 1
