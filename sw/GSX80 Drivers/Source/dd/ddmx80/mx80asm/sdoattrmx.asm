h32974
s 00244/00000/00000
d D 1.1 83/03/17 15:57:13 tes 1 0
c date and time created 83/03/17 15:57:13 by tes
e
u
4
U
t
T
I 1
 
 
         TITLE 'PHASE II - SUPPORT SET ATTRIBUTE OPCODES '
 
;----------------------------------------------------------------------------*
;        Revision : NOV. 14, 1982    File : "DOATTRMX.ASM"  Version 1.1      *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;  11/14  1. Character height CHRHT = NDTXSZ * 8                             *
;         2. Character Width  CHRSZ = NDTXSZ * 6                             *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;----------------------------------------------------------------------------*
 
	 EXTRN  NDLNSZ, NDTXSZ, NDMKSZ, NDTXRT
	 EXTRN  WKID, NDLNTY, NDLNCO, NDMKTY, NDMKCO, NDTXTY, NDTXCO
	 EXTRN  NDINTY, NDFITY, NDFICO
         EXTRN  LSTYLE, CHRSZ, CHRHT
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT
 
         PUBLIC SELNTY, SELNSZ, SELNCO, SEMKTY, SEMKSZ, SEMKCO
         PUBLIC SETXSZ, SETXRT, SETXTY, SETXCO
         PUBLIC SEFITY, SEFINX, SEFICO
 
         EXTRN  GETBYT, GETNXT
 
;----------------------------------------------------------------------------+
; Set Char Height    Opcode = 12                                             +
;----------------------------------------------------------------------------+
 
SETXSZ
;        Get Character size Indicator (1-16) from OBJLST
 
         CALL   GETNXT           ;Returns NDTXSZ in <a>
 
         STA    NDTXSZ
         MOV    B,A
         RAL
         RAL
         RAL
         STA    CHRHT            ;Character height : NDTXSZ * 8
         sub    b
         sub    b                ;Character width : NDTXSZ * 6
         sta    CHRSZ
         RET
 
 
;----------------------------------------------------------------------------+
; Set Char Up Vector Opcode = 13                                             +
;----------------------------------------------------------------------------+
 
SETXRT
;        Get Character rotation indicator (0-3) from OBJLST
 
         CALL    GETNXT          ;Returns NDTXRT in <a>
 
         STA     NDTXRT
         RET
 
;----------------------------------------------------------------------------+
; Set Color Rep      Opcode = 14
;----------------------------------------------------------------------------+
 
;*** NOACT    RET
 
;----------------------------------------------------------------------------+
; Set Polyline Type  Opcode = 15
;----------------------------------------------------------------------------+
 
SELNTY
;        Get Line style bit pattern No. from OBJLST
 
         CALL   GETNXT
         STA    NDLNTY           ;Current Device Line Style requested
 
;        Set up requested Line Style Pattern in LSTYLE
 
         CPI    5
         JC     SELN01
         MVI    A,     0
SELN01
         LXI    H,     LNTBL
         MOV    E,     A
         MVI    D,     0
         DAD    D
         DAD    D
         MOV    E,     M
         INX    H
         MOV    D,     M
         XCHG
         SHLD   LSTYLE
 
         RET
 
;        0 - SOLID, 1 - DASHED, 2 - DOTTE, 3 - DASHED-DOTTED, 4 - LONG DASH
;        Bit patterns : 1-short dash = F0F0, 5-long dash   = FF00,
;                       2-dotted     = 8888, 3-dash dotted = FC30,
;                       4-dash dot dot = F088
LNTBL
         DW     0FFFFH           ;SOLID
         DW     0F0F0H           ;SHORT DASH
         DW     8888H            ;DOTTED
         DW     0FC30H           ;DASH DOTTED
         DW     0F088H           ;DASH DOT DOT
         DW     0FF00H           ;LONG DASH
 
;----------------------------------------------------------------------------+
; Set Polyline Width Opcode = 16
;----------------------------------------------------------------------------+
 
SELNSZ
;        Get Line Size Indicator from Objlst
 
;***         CALL   GETNXT
;***         STA    NDLNSZ
 
         RET
 
;----------------------------------------------------------------------------+
; Set Polyline Color Opcode = 17
;----------------------------------------------------------------------------+
 
SELNCO
;        Get the Color Index from OBJLST
 
         CALL   GETNXT
         STA    NDLNCO
         RET
 
;----------------------------------------------------------------------------+
; Set Polymarker Typ Opcode = 18
;----------------------------------------------------------------------------+
 
SEMKTY
;        Get ASCII MAKER SYMBOL from OBJLST
 
         CALL   GETNXT
         STA    NDMKTY
         RET
 
;----------------------------------------------------------------------------+
; Set Polymarker Scl Opcode = 19
;----------------------------------------------------------------------------+
 
SEMKSZ
;        Get Maker Size factor from OBJLST
 
         CALL   GETNXT
         STA    NDMKSZ
         RET
 
;----------------------------------------------------------------------------+
; Set Polymarker Clr Opcode = 20
;----------------------------------------------------------------------------+
 
SEMKCO
         CALL   GETNXT
         STA    NDMKCO
         RET
 
;----------------------------------------------------------------------------+
; Set Text Font      Opcode = 21
;----------------------------------------------------------------------------+
 
SETXTY
;***         CALL   GETNXT
;***         STA    NDTXTP
 
         RET
 
;----------------------------------------------------------------------------+
; Set Text Color     Opcode = 22
;----------------------------------------------------------------------------+
 
SETXCO
         CALL   GETNXT
         STA    NDTXCO
         RET
 
;----------------------------------------------------------------------------+
; Set Fill Int Style Opcode = 23
;----------------------------------------------------------------------------+
 
SEFITY
         CALL   GETNXT
         STA    NDFITY
         RET
 
;----------------------------------------------------------------------------+
; Set Fill Sty Index Opcode = 24
;----------------------------------------------------------------------------+
 
SEFINX
         CALL    GETNXT
         STA     NDINTY
         RET
 
;----------------------------------------------------------------------------+
; Set Fill Color     Opcode = 25
;----------------------------------------------------------------------------+
 
SEFICO
         CALL   GETNXT
         STA    NDFICO
         RET
 
;----------------------------------------------------------------------------+
; Inq Color Rep      Opcode = 26
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Inq Cell Array     Opcode = 27
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Input Locator      Opcode = 28                                             +
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Input Valuator     Opcode = 29
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Input Choice       Opcode = 30
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Input String       Opcode = 31
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Set Writing Mode   Opcode = 32
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
; Set Input Mode     Opcode = 33
;----------------------------------------------------------------------------+
 
         RET
 
         END
 
E 1
