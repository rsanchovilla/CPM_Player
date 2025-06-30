h45211
s 00193/00000/00000
d D 1.1 83/03/17 15:57:38 tes 1 0
c date and time created 83/03/17 15:57:38 by tes
e
u
4
U
t
T
I 1
 
         TITLE 'DOMARK - Output MARKER TO PRINTER BITMAP'
 
 
;*****************************************************************************
;                                                                            *
;  DOMARK :  Clip the MARKER to the Current Printer Plot Strip and           *
;            Output the Character to the Printer BITMAP based on current     *
;            MARKER Size                                                     *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION :  NOV. 19, 1982     FILE "DOMARK.ASM"     Version 1.0           *
;                                                                            *
;  Input :                                                                   *
;        OBJLST    - Object List Buffer Contains :                           *
;                    byte 1 : Opcode = 7                                     *
;                         2 : Npt                                            *
;                       3,4 : X-coord. of Ist Marker                         *
;                       5,6 : Y-coord. of Ist Marker                         *
;                      7... : X, Y coord. of Markers                         *
;                                                                            *
;        nxtobj    - points to next location in OBJLST                       *
;                                                                            *
;                                                                            *
;        x,y - point Coord. for the Marker String                            *
;        npt    - No. of Markers in the Marker string                        *
;        NDMKTY - Marker symbol in ASCII                                     *
;        NDMKSZ - scale factor for Marker symbol  (1-12)                     *
;                                                                            *
;        CBUF   - MARKER ASCII CHARACTER BUFFER 27 - 31                      *
;                                                                            *
;                                                                            *
;  Program Variables :                                                       *
;                                                                            *
;        OBJLST - Object List Buffer                                         *
;        NXTOBJ - Next OBJLST Buffer location pointer                        *
;        CHRPTR - Character Buffer byte pointer                              *
;        PMKSZ  - MARKER SIZE  = 8 * MARKER SIZE (NDMKSZ)                    *
;        CHROFF - Offset to next MARKER position                             *
;        CCLIP  - Character Clipping indicator, 1=do clipping                *
;                                                                            *
;  Calls :                                                                   *
;        GETXY  : Get X,Y (4 bytes) from OBJLST                              *
;        GETPT  : Get Coordinate from OBJLST (2 bytes)                       *
;        GETNXT : Get 1 byte from OBJLST buffer                              *
;        MUL8   : <hl> = <hl> * 8                                            *
;        CLIPTX : Clip a Chracter cell (8*size) to the current PLot Strip    *
;                 based on rotation                                          *
;        TEXTIT : Output a Character to the BITMAP buffer                    *
;                                                                            *
;*****************************************************************************
 
         PUBLIC DOMARK
         EXTRN  CMPDH
         EXTRN  CBUF
         EXTRN  GETXY, GETNXT
         EXTRN  CLIPTX, TEXTIT
         EXTRN  MUL8, NEGHL
         EXTRN  NDMKTY, NDMKSZ, PMKSZ, CSIZE, ZXMAX
         EXTRN  NBYT, NBIT
         EXTRN  X1, Y1, Y2, XDIR, YDIR
         EXTRN  FLGS, CHROFF, CHRPTR, CCLIP
 
NPT      DS     01               ;No. of MARKERS in the string
 
;----------------------------------------------------------------------------+
;        Get NPT,  no. of MARKERS                                            +
;----------------------------------------------------------------------------+
 
DOMARK
         CALL   GETNXT           ;Returns Npt in <a>
         STA    NPT
         PUSH   PSW              ;Stack it for loop counter
 
         MVI    A,     0EH       ;Set 90 rotation for Marker symbols
         STA    FLGS
 
 
;        Set up Size Factor for Raster routine
         XRA    A
         LDA    NDMKSZ
         STA    CSIZE
         ral
         ral                     ;Marker symbol size = NDMKSZ * 8
         ral
         STA    PMKSZ
 
;----------------------------------------------------------------------------+
;        Get Marker symbol pointer                                           +
;----------------------------------------------------------------------------+
 
         LDA    NDMKTY           ;Returns Character in <a>
;        Valid Ascii TABLE symbol ?
         SUI    01BH             ;Lower bound
         JM     PMKJ01           ;Invalid character symbol
         CPI    01FH             ;Upper bound
         JP     PMKJ01           ;Invalid ascii character symbol
         JMP    PMKJ02
 
PMKJ01   ;Invalid Marker Symbol, use *
 
         MVI    A,     02H
 
;        Get Character Buffer byte address = K * 8 + CBUF
 
PMKJ02   MOV    L,     A
         MVI    H,     0
         CALL   MUL8             ;8 bytes per Character in CBUF
         LXI    D,     CBUF      ;Character buffer base address
         DAD    D
         SHLD   CHRPTR           ;Pointer to the 8 bytes character cell
                                 ;in CBUF
 
;        Set row, column direction flag for clipping
;        90 rotation, xdir = +1 column, ydir = +1 row
 
         MVI    A,      1
         STA    YDIR
         STA    XDIR
 
;----------------------------------------------------------------------------+
;        Do k = 1, Npt                                                       +
;----------------------------------------------------------------------------+
 
PMKL01
         POP    PSW              ;Unstack character count
         DCR    A
         JM     PMK099           ;Done ?
         PUSH   PSW              ;Stack nchr
 
;----------------------------------------------------------------------------+
;        Get x1, y1 from OBJLST                                              +
;----------------------------------------------------------------------------+
 
         CALL   GETXY            ;Returns <de> = x1, <bc> = y1
         XCHG
         SHLD   X1
         MOV    H,     B
         MOV    L,     C
         SHLD   Y1
 
;----------------------------------------------------------------------------+
;        Clip Character cell based on Current Marker size                    +
;        MARKER size use Current Marker size : NDMKSZ                        +
;----------------------------------------------------------------------------+
 
;        Get X2, Character cell WIDTH extent FOR MARKING CLIPPING
;        X2 = X1 + PMKSZ
 
         LHLD   PMKSZ
         DCX    H
         XCHG
         LHLD   X1
         DAD    D
         XCHG
         LHLD   ZXMAX
         CALL   CMPDH
         JNC    PMKL09
 
;        Get Y2, Character cell height extent : y1 to y2
;        y2 = y1 + PMKSZ
 
         LHLD   PMKSZ
         DCX    H
         XCHG
         LHLD   Y1
         DAD    D
         SHLD   Y2               ;Y2 = Y1 + PMKSZ
 
;        Clip character to Current PLot Strip
 
         CALL   CLIPTX
 
;----------------------------------------------------------------------------+
;        If Carry flag set, Trivial reject : Character outside current Strip +
;----------------------------------------------------------------------------+
 
         CNC    TEXTIT           ;Output the Character byte to BITMAP
 
;----------------------------------------------------------------------------+
;        Next MARKER position                                                +
;----------------------------------------------------------------------------+
 
PMKL09
 
         JMP    PMKL01
PMK099
         RET
 
         END
 
 
E 1
