h13573
s 00149/00000/00000
d D 1.1 83/03/17 15:57:06 tes 1 0
c date and time created 83/03/17 15:57:06 by tes
e
u
4
U
t
T
I 1
 
         TITLE  'EPSON MX-80 PRINTER DRIVER'
 
; ****************************************************************************
; *                                                                          *
; *  DDMX80 : EPSON MX-80 PRINTER DRIVER - MAIN MODULE                       *
; *                                                                          *
; *           Get the Parameter Block Address Pointer from <DE> and          *
; *           Jump to the Program identified by the Opcode in Contrl(1)      *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : NOV. 10, 1982   File "DDMX80.ASM"     Version 1.0              *
;                                                                            *
;  ddmx80 (pbptr)                                                            *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;    PBPTR  : Parameter Block Address Pointer in <DE>                        *
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
;  Program Jump Table :                                                      *
;                                                                            *
;    OPTBL  : Sequence of addresses pointing to the start address of         *
;             a number of different programs supporting the graphic          *
;             function required                                              *
;             i.e. OPTBL(6) = Start address of the Polyline routine          *
;                             Opcode 6 identifies a Polyline call            *
;                                                                            *
;                                                                            *
;  CALL DDMX80                                                               *
;    <DE> = Address of Parameter Block                                       *
;                                                                            *
;*****************************************************************************
 
         PUBLIC CONTRL, INTIN, PTSIN, INTOUT, PTSOUT, CNTRL3
CONTRL   DS     2
INTIN    DS     2
PTSIN    DS     2
INTOUT   DS     2
PTSOUT   DS     2
CNTRL3   DS     2
 
         EXTRN  RASOUT, BLKMOV
         EXTRN  ZOPWK, ZCLRWK, ZCLWK, ZFORM, ZUPDWK, ZPL, ZFA, ZTX
         EXTRN  ZPM, ZGDP
         EXTRN  ZCHSZ, ZCHRT, ZLNCO, ZLNTY, ZMKTY, ZMKCO, ZMKSZ
         EXTRN  ZFITY, ZINTY, ZTXCO, ZFICO, ZESCAP, ZCELL
 
;----------------------------------------------------------------------------+
;        The Opcode Program Jump Table                                       +
;----------------------------------------------------------------------------+
 
OPTBL    DW     noact            ; Opcode = 0
         DW     ZOPWK            ; Open Workstation,  Opcode = 1
         DW     ZCLWK            ; Close Workstation, Opcode = 2
         DW     ZCLRWK           ; Clear Workstation, Opcode = 3
         DW     ZUPDWK           ; Update Workstation,Opcode = 4
         DW     ZESCAP           ; Escape Sequences,  Opcode = 5
         DW     ZPL              ; PolyLine,          Opcode = 6
         DW     ZPM              ; Polymarker,        Opcode = 7
         DW     ZTX              ; Text,              Opcode = 8
         DW     ZFA              ; Fill Area,         Opcode = 9
         DW     ZCELL            ; Cell Array,        Opcode = 10
         DW     ZGDP             ; GDP                Opcode = 11
         DW     ZCHSZ            ; Set Char Height    Opcode = 12
         DW     ZCHRT            ; Set Char Up Vector Opcode = 13
         DW     noact            ; Set Color Rep      Opcode = 14
         DW     ZLNTY            ; Set Polyline Type  Opcode = 15
         DW     noact            ; Set Polyline Width Opcode = 16
         DW     ZLNCO            ; Set Polyline Color Opcode = 17
         DW     ZMKTY            ; Set Polymarker Typ Opcode = 18
         DW     ZMKSZ            ; Set Polymarker Scl Opcode = 19
         DW     ZMKCO            ; Set Polymarker Clr Opcode = 20
         DW     noact            ; Set Text Font      Opcode = 21
         DW     ZTXCO            ; Set Text Color     Opcode = 22
         DW     ZFITY            ; Set Fill Int Style Opcode = 23
         DW     ZINTY            ; Set Fill Sty Index Opcode = 24
         DW     ZFICO            ; Set Fill Color     Opcode = 25
         DW     noact            ; Inq Color Rep      Opcode = 26
         DW     noact            ; Inq Cell Array     Opcode = 27
         DW     noact            ; Input Locator      Opcode = 28
         DW     noact            ; Input Valuator     Opcode = 29
         DW     noact            ; Input Choice       Opcode = 30
         DW     noact            ; Input String       Opcode = 31
         DW     noact            ; Set Writing Mode   Opcode = 32
         DW     noact            ; Set Input Mode     Opcode = 33
 
DDMX80
         LXI    H,     CONTRL    ;Get Parameter Block Address Pointer
         XCHG
         LXI    B,     10
         CALL   BLKMOV
 
;        opcode = contrl(1)
 
;        MOV    E,      M        ;Get Address of the Control Block
;        INX    H
;        MOV    D,      M
;        LDAX   D                ;<a> = opcode
 
         LHLD   CONTRL
         MOV    A,      M
 
         LXI    D,      4
         DAD    D                ;<hl> = Contrl(3)
         SHLD   CNTRL3
         MVI    M,      0
         INX    H
         MVI    M,      0        ;Initialize Contrl(3) to zero
 
;        Jump to the required program identified by the opcode
;        <A> = Opcode
 
         CPI    34
         JNC    NOACT
 
         LXI    H,      OPTBL    ;Program jump table Base address
         RLC
         ADD    L                ;Compute the Opcode Offset : <A> * 2
         MOV    L,      A
         MVI    A,      0        ;Add offset to base
         ADC    H
         MOV    H,      A        ;<hl> = Program Location Pointer
 
         MOV    E,      M
         INX    H
         MOV    D,      M        ;<de> = Program start address
 
         XCHG
         PCHL                    ;and Go do it
 
;----------------------------------------------------------------------------+
;        No Action Opcode Supports                                           +
;----------------------------------------------------------------------------+
 
NOACT    RET
 
         END    DDMX80
E 1
