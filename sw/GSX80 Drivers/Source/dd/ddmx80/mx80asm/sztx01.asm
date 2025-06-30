h26321
s 00367/00000/00000
d D 1.1 83/03/17 16:00:37 tes 1 0
c date and time created 83/03/17 16:00:37 by tes
e
u
4
U
t
T
I 1
 
 
         TITLE 'ZTX : OUTPUT TEXT STRING'
 
;*****************************************************************************
;                                                                            *
;        TEXT : Increment Object Count, Update Plot Minimum and Maximum      *
;               Extent, Store Opcode, Nchr, Rotation flags, chrsiz, x1,      *
;               y1, and Text String in the Object List Buffer.               *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION : NOV. 14, 1982   File : "ZTX01.ASM"    Version 1.0              *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
; 11/14  1)  Text String Size Extent = CHRSZ * Nchr : (6 pixels wide)/char.  *
;        2)  Character Size Extent   = CHRHT        : (8 pixels high)/char.  *
;        3)  Update XMAX, YMAX using both the TEXT and CHAR. Size Extents    *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;                                                                            *
;  ZTX (nchr, x1, y1, ndtxrt, ndtxsz, character string)                      *
;                                                                            *
;  Description :                                                             *
;                                                                            *
;    1) Get Opcode and Nchr from Contrl array and store in OBJLST Buffer     *
;                                                                            *
;    2) Increment OBJCNT                                                     *
;                                                                            *
;    3) Get X1, Y1 from PTSIN array                                          *
;                                                                            *
;    4) Get Text Rotation flags and store in OBJLST                          *
;                                                                            *
;    5) Compute the Text String size to Update Max/Min Plot extent XMAX,YMAX *
;                                                                            *
;    6) Store the Chracter size and x1, y1 in the OBJLST buffer              *
;                                                                            *
;    7) Store the Character string in OBJLST                                 *
;                                                                            *
;                                                                            *
;  Input :                                                                   *
;        contrl(1) - opcode =  8                                             *
;        contrl(4) - no. of chracters in text string (nchr)                  *
;        ptsin     - location of text string                                 *
;                    ptsin(1,2) = x1,y1                                      *
;        intin     - character string, 1 char/word, char. in low byte        *
;                                                                            *
;  Output :                                                                  *
;        contrl(3) - 0                                                       *
;        OBJLST    - Object List Buffer Contains :                           *
;                    byte 1 : Opcode                                         *
;                         2 : Nchr                                           *
;                         3 : Rotation Flag                                  *
;                       4,5 : X                                              *
;                       6,7 : Y                                              *
;                      8,...: Character String, 1 Char. / Byte               *
;                                                                            *
;        bnext     - points to next location in OBJLST                       *
;                                                                            *
;  CALL ZTX                                                                  *
;        <DE> = Address of Contrl array                                      *
;                                                                            *
;  Program Variables :                                                       *
;        NDTXSZ - Current Character size                                     *
;        NDTXRT - Current Character rotation                                 *
;        CHRSZ  - Current Character size based on NDTXSZ * 8                 *
;        CHRBOX - Character cell size 8 x 8 pixels                           *
;        XMAX   - Maximum Plot extent x-axis                                 *
;        YMAX   - Maximum Plot extent y-axis                                 *
;        X2     - Min/Max Text extent                                        *
;        Y2     - Min/Max Text extent                                        *
;        OBJCNT - Count of Object in the Object List Buffer                  *
;        OBJLST - Object List Buffer                                         *
;        bnext  - Next OBJLST Buffer location pointer                        *
;                                                                            *
;        ROTATE - BIT 1=CHGXY, 2=CUP, 3=ROWINC, 4=COLINC                     *
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
;                 | rowinc | 1 |  1 | -1  |  -1 |                            *
;                 +--------+---+----+-----+-----+                            *
;                 | colinc |-1 |  1 |  1  |  -1 |                            *
;                 +--------+---+----+-----+-----+                            *
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
;                                                                            *
;  Calls :                                                                   *
;        GETPT  : Get pt. coord. from PTSIN array (2 bytes)                  *
;        PUTPT  : Put pt. coord. into OBJLST buffer (2 bytes)                *
;        PUTBYT : Put 1 byte into OBJLST buffer                              *
;        GETMIN : Returns in <hl> the smaller of <hl>, <de> values           *
;        GETMN0 : Returns in <hl> the smaller of <hl>, <de> or zero if       *
;                 the smaller value < 0                                      *
;        GETMAX : Retruns in <de> the larger of Values in <hl> and <de>      *
;        MUL8   : <hl> = <hl> * 8                                            *
;                                                                            *
;*****************************************************************************
 
         PUBLIC ZTX
 
         EXTRN  MIDH, CMPDH, MUL8, NEGHL, GETPT, PUTPT, PUTBYT
         EXTRN  GETMIN, GETMAX, GETMN0
 
         EXTRN  NDTXSZ, NDTXRT, CHRSZ, CHRHT
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT, PTADDR
         EXTRN  XMAX, YMAX, OBJCNT, OBJLST, bnext
         EXTRN  XMIN, YMIN
 
NCHR     DS     02               ;No. of characters in text string
FLGS     DS     01               ;Rotation flag
TXTSZ    DS     02               ;Character Extents in Pixels
XTEXT    DS     02               ;Text String Width
YTEXT    DS     02               ;Text String Height
 
;----------------------------------------------------------------------------+
;        Increment OBJCNT                                                    +
;        Store Opcode and Nchr in OBJLST                                     +
;----------------------------------------------------------------------------+
 
ZTX
         LHLD   OBJCNT           ;Increment OBJCNT
         INX    H
         SHLD   OBJCNT
 
;        Get Opcode, CONTRL = Address of Contrl array
 
         LHLD   CONTRL
         MOV    A,      M       ;<A> = Opcode
 
;        LHLD   NXTOBJ
;        MOV    M,      A        ;Store it into OBJLST
;        INX    H                ;Next location in OBJLST
         CALL   PUTBYT
 
         LHLD   CONTRL
         LXI    D,      6        ;Contrl(4) = Nchr
         DAD    D                ;<hl> = Address of Contrl(4)
         MOV    A,      M        ;<A> = Nchr
         STA    NCHR
 
;        MOV    M,      A        ;Store it
;        INX    H
;        SHLD   NXTOBJ           ;Point to Next location in OBJLST
 
         CALL   PUTBYT
 
;----------------------------------------------------------------------------+
;        Compute Character size CHRHT = NDTXSZ * 8                           +
;        and     Text string    TXTSZ = NCHR * CHRSZ   (CHRSZ = NDTXSZ * 6)  +
;----------------------------------------------------------------------------+
 
         LHLD   CHRSZ
         XCHG
 
;----------------------------------------------------------------------------+
;        Extent of Text string updating XMAX, YMAX                           +
;        If rotation = 0, X2 = X1 + CHRSZ, Y2 = Y1 - TXTSZ                   +
;                     90, X2 = X1 + TXTSZ, Y2 = Y1 + CHRHT                   +
;                    180, X2 = X1 - CHRSZ, Y2 = Y1 + TXTSZ                   +
;                    270, X2 = X1 - TXTSZ, Y2 = Y1 - CHRHT                   +
;----------------------------------------------------------------------------+
 
         LHLD   NCHR
         MVI    H,      0
         CALL   MIDH             ;<hl> = txtsz
         SHLD   TXTSZ            ;Store txtsz
 
;        Set up TXTSZ, CHRSZ for computing X2, Y2 : the Text width and height
;        depending on the Rotation
 
         XCHG                    ;<de> = TXTSZ
         LHLD   CHRHT            ;<hl> = CHRHT
 
;----------------------------------------------------------------------------+
;        Setup Character Rotation flags                                      +
;----------------------------------------------------------------------------+
 
                                 ;Initialize bit3 = rowinc, bit2 = colinc
                                 ;           bit0 = chgxy,  bit1 = cup
         LDA    NDTXRT           ;0=0,1=90,2=180,3=270 rotation
         RRC
         JC     ZTXJ01           ;carry set, rotate = 90, 270
 
;        Ist bit off, rotate = 0, 180
 
         RRC                     ;check 2nd bit
         JC     ZTXJ03           ;2nd bit ON,  rotate = 180
 
;        carry OFF, rotate = 0
 
         XCHG
         CALL   NEGHL            ;Negate String Height, TXTSZ
         XCHG
         MVI    A,      05H      ;0 rotation FLAG : 0101
         JMP    ZTXJ04
ZTXJ01
;        First bit set, 90, 270 rotation
 
         RRC
         JC     ZTXJ02           ;2nd bit set, 270 rotation FLAG : 0100
 
;        2nd bit off, rotate = 90
 
         XCHG                    ;Move <hl> = TXTSZ (Width,x)
                                 ;     <de> = CHRHT (Height,y)
         MVI    A,      0EH      ;SET FLAG : 1110
         JMP    ZTXJ04
 
ZTXJ02   ;rotation = 270
 
         CALL   NEGHL            ;Negate Height, y = CHRHT
         XCHG
         CALL   NEGHL            ;Negate Width, x = TXTSZ
 
         MVI    A,      00H      ;270 rotation FLAG : 0100
         JMP    ZTXJ04
 
ZTXJ03   ;rotation = 180
 
         CALL   NEGHL            ;Negate Width, x = CHRHT
 
         MVI    A,      0BH      ;set chgxy, 180 rotation FLAG : 1011
 
ZTXJ04
         SHLD   XTEXT            ;Text string Width in pixels
         XCHG
         SHLD   YTEXT            ;Text string Height in Pixels
 
         STA    FLGS
         CALL   PUTBYT           ;Store rotation flag in OBJLST
 
;----------------------------------------------------------------------------+
;        Get text location from PTSIN array                                  +
;        Update Maximum/Minimum extents                                      +
;        Store x1, y1, in OBJLST                                             +
;----------------------------------------------------------------------------+
 
;        Get the Address of PTSIN array
 
;        LHLD   PBPTR            ;Parameter Block Address Pointer
;        LXI    D,      4        ;Third entry points to PTSIN array
;        DAD    D
;        MOV    C,      M
;        INX    H
;        MOV    B,      M        ;<bc> = address of PTSIN array
 
         LHLD   PTSIN
         SHLD   PTADDR
 
         CALL   GETPT            ;Returns <de> = X-coord. from PTSIN
 
;        Update xmax/xmin
 
         LHLD   XMAX
         CALL   GETMAX
         SHLD   XMAX
 
         LHLD   XMIN             ;Minimum Plot X extent
         CALL   GETMN0
         SHLD   XMIN
         PUSH   D                ;Stack x1
         CALL   PUTPT            ;Store x-coord. in <de> into OBJLST
 
         CALL   GETPT            ;Returns <de> = Y-coord. from PTSIN
 
;        Update ymin/ymax
 
         LHLD   YMAX
         CALL   GETMAX
         SHLD   YMAX
 
         LHLD   YMIN             ;Minimum Plot Y extent
         CALL   GETMN0
         SHLD   YMIN
 
         PUSH   D                ;Stack Y1
         CALL   PUTPT            ;Store y-coord. into OBJLST, returns
                                 ;NXTOBJ points to next location in OBJLST
 
;----------------------------------------------------------------------------+
;        USE Text Extent : XTEXT, YTEXT to Update XMAX, YMAX                 +
;----------------------------------------------------------------------------+
 
         POP    D                ;UNstack Y1
         LHLD   YTEXT
         DAD    D                ;<hl> = Text Height
         XCHG
 
;        Update ymax/ymin
 
         LHLD   YMAX
         CALL   GETMAX
         SHLD   YMAX
 
         LHLD   YMIN
         CALL   GETMN0
         SHLD   YMIN
 
         POP    D                ;Unstack X1
         LHLD   XTEXT            ;Get Text Width
 
         DAD    D                ;<hl> = Max/Min Text string WIDTH
         XCHG                    ;Move Text width to <de>
 
;        Update Xmax/Xmin extent, <de> = TEXT WIDTH
 
         LHLD   XMAX
         CALL   GETMAX
         SHLD   XMAX
 
         LHLD   XMIN
         CALL   GETMN0           ;Returns smaller value in <hl> or
         SHLD   XMIN             ;zero if value < 0
 
;----------------------------------------------------------------------------+
;        Get Text string from INTIN and store in OBJLST                      +
;----------------------------------------------------------------------------+
 
;        LHLD   PBPTR
;        INX    H
;        INX    H                ;<HL> = Address pointer of INTIN array
;        MOV    C,      M
;        INX    H
;        MOV    B,      M        ;<bc> = Address of INTIN array
 
         LHLD   INTIN
         SHLD   PTADDR
 
         LDA    NCHR             ;Get the No. of Characters
ZTXL01
         PUSH   PSW
         CALL   GETPT            ;Get next character, returned in <e>
 
         MOV    A,      E
         CALL   PUTBYT           ;Store in OBJLST
 
         POP    PSW
         DCR    A
         JNZ    ZTXL01
 
 
         RET
 
 
         END
 
 
 
E 1
