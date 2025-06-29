h26380
s 00298/00000/00000
d D 1.1 83/03/17 15:57:43 tes 1 0
c date and time created 83/03/17 15:57:43 by tes
e
u
4
U
t
T
I 1
 
         TITLE 'DOTEXT - Output Text to Printer Bit Map'
 
 
;*****************************************************************************
;                                                                            *
;  DOTEXT :  Clip the Text String to the Current Printer Plot Strip and      *
;            Output the Character to the Printer BITMAP based on current     *
;            Character Size and Rotation                                     *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION :  NOV. 18, 1982     FILE "DOTEXT.ASM"    Version 1.0            *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
; 11/14   1)  Character Height (CHRHT) = NDTXSZ * 8 pixels                   *
;         2)  Character width  (CHRSZ) = NDTXSZ * 6 pixels                   *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;                                                                            *
;  Input :                                                                   *
;        OBJLST    - Object List Buffer Contains :                           *
;                    byte 1 : Opcode                                         *
;                         2 : Nchr                                           *
;                         3 : Rotation Flag                                  *
;                       4,5 : X                                              *
;                       6,7 : Y                                              *
;                      8... : Character String, 1 Char. / Byte               *
;                                                                            *
;        x,y - starting point for text string                                *
;        nchr   - No. of characters in text string                           *
;        chrstr - text string (in ADE)                                       *
;        ndtxsz - scale factor for character size (1-16)                     *
;        ndtxrt - text rotation                                              *
;                    0 = no rotation  1 = 90 degrees                         *
;                    2 = 180 degrees  3 = 270 degrees                        *
;                                                                            *
;        CBUF   - ASCII CHARACTER BUFFER 32 - 127                            *
;                                                                            *
;                                                                            *
;  Program Variables :                                                       *
;                                                                            *
;        OBJLST - Object List Buffer                                         *
;        NXTOBJ - Next OBJLST Buffer location pointer                        *
;                                                                            *
;        FLGS   - Character Rotation Indicator                               *
;                 BIT 1=CHGXY, 2=CUP, 3=ROWINC, 4=COLINC                     *
;                 CHGXY = Change row, column flag due to character rotation  *
;                 CUP   = Character up flag, 90, 180 rotation                *
;                 ROWINC= row increment flag, +/- 1                          *
;                 COLINC= column increment flag                              *
;                                                                            *
;        FLGS   - +-----------------------------+                            *
;                 | rotate | 0 | 90 | 180 | 270 |                            *
;                 +--------+---+----+-----+-----+                            *
;                 | chgxy  | 1 |  0 |  1  |  0  |                            *
;                 +--------+---+----+-----+-----+                            *
;                 | cup    | 0 |  1 |  1  |  0  |                            *
;                 +--------+---+----+-----+-----+                            *
;                 | rowinc | 1 |  1 | -1  | -1  |                            *
;                 +--------+---+----+-----+-----+                            *
;                 | colinc |-1 |  1 |  1  | -1  |                            *
;                 +--------+---+----+-----+-----+                            *
;                                                                            *
;                                                                            *
;  Calls :                                                                   *
;        GETXY  : Get X,Y (4 bytes) from OBJLST                              *
;        GETPT  : Get Coordinate from OBJLST (2 bytes)                       *
;        GETNXT : Get next byte from OBJLST buffer                           *
;        MUL8   : <hl> = <hl> * 8                                            *
;        CLIPTX : Clip a Chracter cell (8*size) to the current PLot Strip    *
;                 based on rotation                                          *
;        TEXTIT : Output a Character to the BITMAP buffer                    *
;                                                                            *
;*****************************************************************************
 
         PUBLIC DOTEXT
 
         EXTRN  CBUF
         EXTRN  GETXY, GETNXT
         EXTRN  CLIPTX, TEXTIT
         EXTRN  MUL8, NEGHL
         EXTRN  NDTXSZ, CHRSZ, CHRHT, CSIZE
         EXTRN  NBYT, NBIT
         EXTRN  X1, Y1, Y2, XDIR, YDIR
         PUBLIC FLGS, CHROFF, CHRPTR, CCLIP
         dseg
;NCHR     DS     01               ;No. of characters in the text string
FLGS     DS     01               ;Character Rotation flag
CCLIP    DB     00
CHRPTR   DS     02               ;Character Buffer byte pointer
CHRSIZ   DS     02               ;Chracter Size = 8 * Text size (ndtxsz)
CHROFF   DS     02               ;Offset to next character position based
                                 ;on character size and rotation
YSTRT    DS     02               ;Character y-coord. after clipping
         cseg
;----------------------------------------------------------------------------+
;        Get NCHR, no. of characters                                         +
;----------------------------------------------------------------------------+
 
DOTEXT
         CALL   GETNXT           ;Returns <A> = Nchr
 
;        STA    NCHR             ;Save no. of characters : nchr
         PUSH   PSW              ;Stack it for loop counter
 
;        Rotation Flags : bit 1=chgxy, 2=cup
;        0, 180 : chgxy = 1,   90, 270 : chgxy = 0
;        0, 270 : cup  = 0,    90, 180 : cup = 1
 
         CALL   GETNXT           ;Returns <a> = FLGS
         STA    FLGS
 
;        Set up Size factor for Character Raster Routine
         XRA    A
         LDA    NDTXSZ
         STA    CSIZE
 
;----------------------------------------------------------------------------+
;        Get x1, y1 from OBJLST                                              +
;----------------------------------------------------------------------------+
 
         CALL   GETXY            ;Returns <de> = x1, <bc> = y1
         XCHG
         SHLD   X1
         MOV    H,     B
         MOV    L,     C
         SHLD   Y1
         SHLD   YSTRT
 
;        Set row, column direction flag for clipping
 
         LDA    FLGS             ;Check chgxy flag
         RRC
         JC     TXTJ04
 
;        90, 270 rotation, xdir = +/- 1 column, ydir = +/- 1 row
 
         LDA    FLGS             ;bit 3 = row increment indicator
         ANI    04H
         MVI    A,      1
         JNZ    TXTJ05           ;row increment = 1 or -1
         MVI    A,      0FFH
TXTJ05   STA    YDIR
 
         LDA    FLGS             ;bit 4 = column increment indicator
         ANI    08H
         MVI    A,      1
         JNZ    TXTJ06
         MVI    A,      0FFH
TXTJ06   STA    XDIR
         JMP    TXTL01
 
;        0, 180 Rotation, xdir = +/- 1 row, ydir = +/- 1 column
 
TXTJ04   LDA    FLGS
         ANI    04H               ;bit 3 = row increment
         MVI    A,      1
         JNZ    TXTJ07
         MVI    A,      0FFH
TXTJ07   STA    XDIR
 
         LDA    FLGS
         ANI    08H               ;bit 4 = column increment
         MVI    A,      1
         JNZ    TXTJ08
         MVI    A,      0FFH
TXTJ08   STA    YDIR
 
;----------------------------------------------------------------------------+
;        Do k = 1, nchr                                                      +
;----------------------------------------------------------------------------+
 
TXTL01
         POP    PSW              ;Unstack character count
         DCR    A
         JM     TXT099           ;Done ?
         PUSH   PSW              ;Stack nchr
 
;----------------------------------------------------------------------------+
;        Get next character from OBJLST                                      +
;----------------------------------------------------------------------------+
 
         CALL   GETNXT           ;Returns Character in <a>
 
;        Valid Ascii ?
 
         SUI    01BH             ;Lower bound
         JM     TXTL09           ;Invalid character
         CPI    065H             ;Upper bound
         JP     TXTL09           ;Invalid ascii character
 
;        Get Character Buffer byte address = K * 8 + CBUF
 
         MOV    L,     A
         MVI    H,     0
         CALL   MUL8             ;8 bytes per Character in CBUF
         LXI    D,     CBUF      ;Character buffer base address
         DAD    D
         SHLD   CHRPTR           ;Pointer to the 8 bytes character cell
                                 ;in CBUF
 
;***     Check clipping Indicator
;***
;***     LDA    CCLIP
;***     RRC
;***     JNC    TXTJ01           ;No clipping if CCLIP = 0
;***
 
;----------------------------------------------------------------------------+
;        Clip Character cell based on Chracter rotaion and size              +
;----------------------------------------------------------------------------+
 
;        Character Width  Computed using Current text size : NDTXSZ * 6
;        Character Height Computed using NDTXSZ * 8
 
         LHLD   CHRSZ            ;CHRSZ = 6 * NDTXSZ
 
;        Get Y2, Character cell height extent : y1 to y2
;        If cup   y2 = y1 + chrht   (90, 180)
;        else     y2 = y1 - chrht   (0,  270)
 
         LDA    FLGS             ;Cup = flag bit # 2
         ANI    02H
         JNZ    TXTJ02           ;Cup = 1, rotate = 90, 180
 
;        0, 270 rotation
 
         CALL   NEGHL
         SHLD   CHROFF           ;Offset to next character position
         LHLD   CHRHT            ;Character Height in Pixels
         CALL   NEGHL
         INX    H
         JMP    TXTJ03
 
;        90, 180 rotation
TXTJ02
         SHLD   CHROFF
         LHLD   CHRHT
         DCX    H
TXTJ03
         XCHG                    ;Character Height in Pixels
         LHLD   Y1
         DAD    D
         SHLD   Y2               ;Y2 = Y1 +/- CHRHT +/- 1
 
;        Clip character to Current PLot Strip
 
         CALL   CLIPTX
 
;----------------------------------------------------------------------------+
;        If Carry flag set, Trivial reject : Character outside current Strip +
;----------------------------------------------------------------------------+
 
TXTJ01
         CNC    TEXTIT           ;Output the Character byte to BITMAP
 
;----------------------------------------------------------------------------+
;        Update x,y to next character position                               +
;----------------------------------------------------------------------------+
 
TXTL09
         LHLD   CHROFF           ;Position offset based on size and rotation
         XCHG
         LDA    FLGS             ;Check rotation flag
         RRC
         JC     TXTJ10
 
;        90, 270 rotation : x = x +/- chroff
 
         LHLD   X1
         DAD    D                ;<hl> = Next character x-coord.
         SHLD   X1
         XRA    A
         STA    CCLIP            ;Next character needs not be clipped,
                                 ;because y-coord. not changed
         JMP    TXTL01
 
;        0, 180 rotation : y = y +/- chroff
 
TXTJ10
         LHLD   Y1
         DAD    D                ;<hl> = next character y-coord.
         SHLD   Y1
         MVI    A,     01
         STA    CCLIP            ;Set Clip character flag
                                 ;because y-coord. changed for next character
 
         JMP    TXTL01
TXT099
         RET
 
         END
 
 
 
E 1
