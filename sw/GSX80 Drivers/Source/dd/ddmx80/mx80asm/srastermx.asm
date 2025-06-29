h11569
s 00186/00000/00000
d D 1.1 83/03/17 15:58:38 tes 1 0
c date and time created 83/03/17 15:58:38 by tes
e
u
4
U
t
T
I 1
 
 
 
         TITLE 'RASTER : RASTER CONVERTS OBJECTS STORED IN THE OBJLST BUFFER'
 
; ****************************************************************************
; *                                                                          *
; *      RASTER : RASTER CONVERTS THE VECTOR LISTS STORED IN THE OBJECT      *
; *               LIST BUFFER (OBJLST) INTO THE PRINTER BITMAP BUFFER        *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  REVISION : NOV. 19, 1982    File "RASTERMX.ASM"    Version : 1.0          *
;                                                                            *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
; 11/19  1.  Reinitialize Current Device Attribute List, Move values from    *
;            NDINIT to ndlnsz use BLKMOV                                     *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;                                                                            *
;  Raster (objcnt, objlst)                                                   *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;    OBJLST : Object List Buffer                                             *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;    BITMAP : Bitmap buffer ready for scan output to the printer             *
;                                                                            *
;  Description :                                                             *
;             Get the Parameter Block Address Pointer from <DE> and          *
;             Jump to the Program identified by the Opcode in Contrl(1)      *
;                                                                            *
;             do i = 1, objcnt                                               *
;                Get opcode                                                  *
;                Call Subroutine                                             *
;                                                                            *
;  Program Jump Table :                                                      *
;                                                                            *
;    DOTBL  : Sequence of addresses pointing to the start address of         *
;             a number of different programs supporting the graphic          *
;             function required                                              *
;             i.e. DOTBL(0) = Start address of the Polyline routine          *
;                  DOTBL(1) = Start address of the Polymaker routine         *
;                  DOTBL(2) = Start address of the Text routine              *
;                                                                            *
;                                                                            *
;*****************************************************************************
 
         PUBLIC RASTER
 
         EXTRN  BLKMOV
         EXTRN  NDINIT
 
         EXTRN  XMAX, YMAX, XMIN, YMIN, OBJCNT, OBJLST
	 EXTRN  NDLNSZ, NDTXSZ, NDMKSZ, NDTXRT
	 EXTRN  WKID, NDLNTY, NDLNCO, NDMKTY, NDMKCO, NDTXTY, NDTXCO
	 EXTRN  NDINTY, NDFITY, NDFICO
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT
 
         EXTRN  DOLINE, DOMARK, DOTEXT
         EXTRN  DOBAR
         EXTRN  DOFILL, DOCELL
;        EXTRN  DOGDPS
         EXTRN  SELNTY, SELNSZ, SELNCO, SEMKTY, SEMKSZ, SEMKCO
         EXTRN  SETXSZ, SETXRT, SETXTY, SETXCO
         EXTRN  SEFITY, SEFINX, SEFICO
         EXTRN  GETNXT
         EXTRN  DOROLL, NOFILE, RSTAT, BNEXT
 
;----------------------------------------------------------------------------+
;        The Opcode Program Jump Table                                       +
;----------------------------------------------------------------------------+
 
DOTBL
         DW     noact            ; Escape Sequences,  Opcode = 5
         DW     DOLINE           ; PolyLine,          Opcode = 6
         dw     DOMARK           ; Polymarker,        Opcode = 7
         DW     DOTEXT           ; Text,              Opcode = 8
         DW     DOFILL           ; Fill Area,         Opcode = 9
         DW     DOCELL           ; Cell Array,        Opcode = 10
         DW     DOBAR            ; GDP, Bar           Opcode = 11,1
         DW     SETXSZ           ; Set Char Height    Opcode = 12
         DW     SETXRT           ; Set Char Up Vector Opcode = 13
         DW     noact            ; Set Color Rep      Opcode = 14
         DW     SELNTY           ; Set Polyline Type  Opcode = 15
         DW     SELNSZ           ; Set Polyline Width Opcode = 16
         DW     SELNCO           ; Set Polyline Color Opcode = 17
         DW     SEMKTY           ; Set Polymarker Typ Opcode = 18
         DW     SEMKSZ           ; Set Polymarker Scl Opcode = 19
         DW     SEMKCO           ; Set Polymarker Clr Opcode = 20
         DW     SETXTY           ; Set Text Font      Opcode = 21
         DW     SETXCO           ; Set Text Color     Opcode = 22
         DW     SEFITY           ; Set Fill Int Style Opcode = 23
         DW     SEFINX           ; Set Fill Sty Index Opcode = 24
         DW     SEFICO           ; Set Fill Color     Opcode = 25
         DW     noact            ; Inq Color Rep      Opcode = 26
         DW     noact            ; Inq Cell Array     Opcode = 27
         DW     noact            ; Input Locator      Opcode = 28
         DW     noact            ; Input Valuator     Opcode = 29
         DW     noact            ; Input Choice       Opcode = 30
         DW     noact            ; Input String       Opcode = 31
         DW     noact            ; Set Writing Mode   Opcode = 32
         DW     noact            ; Set Input Mode     Opcode = 33
 
INDEX    EQU    DOTBL-10         ; Base Offset from Opcode 0
 
 
RASTER
 
;        Initialize Device Default Attribute Value List
 
         LXI    D,      ndlnsz   ;These Are the Current Attibute Values
         LXI    H,      NDINIT   ;These Default Values Never get Modified
         LXI    B,      34
         CALL   BLKMOV
 
;        Initialize OBJLST buffer and Roll-Out Area Accessing
;        Index and Pointers for a fresh pass through the Object List
;        for the Current Plot Strip
 
         LDA    RSTAT            ;Object List Buffer Roll-Out File Status
         ANA    A                ;Was Roll-Out File Created ?
         JZ     RASJ02           ;Initialize Object List Buffer Address
                                 ;Pointers
         CALL   DOROLL           ;Reset Roll-Out Area with The First
         JMP    RASJ03           ;Roll-Out File Record
 
RASJ02   CALL   NOFILE
 
RASJ03
;        Decrement objcnt
 
         LHLD   OBJCNT
 
RASL01   DCX    H
         MOV    A,      H        ;objcnt = 0 ?
         ORA    H
 
         JM     RASJ99           ;Yes, Done
 
;        No, next opcode from objlst
 
         PUSH   H                ;Save objcnt on stack
;*       LHLD   NXTOBJ
;*       MOV    A,      M        ;<a> = opcode
;*       INX    H
;*       SHLD   LSTPTR
         CALL   GETNXT
 
;        Jump to the required program identified by the opcode
 
         LXI    H,      INDEX    ;Program jump table Base address
         RLC
         ADD    L                ;Compute the Opcode Offset : <A> * 2
         MOV    L,      A
         MVI    A,      0        ;Add offset to base
         ADC    H
         MOV    H,      A        ;<hl> = Program Location Pointer
 
         MOV    E,      M
         INX    H
         MOV    D,      M        ;<de> = Program start address
 
         LXI    H,      DONEXT   ;Set up Return address on stack
         PUSH   H
         XCHG
         PCHL                    ;and Go do it
 
;        Next Object
 
DONEXT
         POP    H
         JMP    RASL01
 
NOACT
RASJ99   RET
 
         END
 
 
 
E 1
