h58388
s 00374/00000/00000
d D 1.1 83/03/17 16:00:14 tes 1 0
c date and time created 83/03/17 16:00:14 by tes
e
u
4
U
t
T
I 1
 
 
        TITLE ' ZOPWKMX - OPEN WORKSTATION : EPSON MX-80 PRINTER'
 
;*****************************************************************************
;                                                                            *
;       OPEN WORKSTATION : Initializes default Primitive Attributes and      *
;                          Returns Printer Capabilities Parameters to        *
;                          the Application Program                           *
;                                                                            *
;*****************************************************************************
;                                                                            *
;       Revision : Nov. 19, 1982   File : "ZOPWKMX.ASM"  Version : 1.0       *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
; 11/119 1.  Store Device Default Attribute to Reinitialize The Attributes   *
;            After Each Plot Strip                                           *
;        2.  Add 2 PUBLIC variables CHRHT, Character Height = NDTXSZ * 8     *
;                                   NDINIT, Initial Default List             *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;                                                                            *
;       opcode == OPEN WORKSTATION                                           *
;                                                                            *
;    1) Get Default Primitive Attributes from INTIN into NDATTR array        *
;                                                                            *
;    2) Returns Device Capability Parameters in INTOUT array                 *
;                                                                            *
;    3) Returns Min/Max Primitive Sizes (pixels) in PTSOUT array             *
;                                                                            *
;    4) Returns INTOUT and PTSOUT data length in Contrl array,               *
;       Contrl(3) = 6 points in PTSOUT, Contrl(5) = 44 entries in INTOUT     *
;                                                                            *
;    5) Initialize OBJLST buffer Flags/Pointers for Object List Buffer       *
;       Access Routines                                                      *
;                                                                            *
;       Calls :                                                              *
;                                                                            *
;    BLKMOV - Moves a block of data from one area of memory to another       *
;                                                                            *
;----------------------------------------------------------------------------*
;----------------------------------------------------------------------------*
 
        PUBLIC  ZOPWK, BLKMOV
	PUBLIC  ndinit, NDLNSZ, NDTXSZ, NDTXRT, NDMKSZ
	PUBLIC  WKID, NDLNTY, NDLNCO, NDMKTY, NDMKCO, NDTXTY, NDTXCO
	PUBLIC  NDINTY, NDFITY, NDFICO
        PUBLIC  CHRSZ, CHRHT, PMKSZ, LSTYLE, ZXMAX
 
        EXTRN   CONTRL, INTIN, PTSIN, INTOUT, PTSOUT, CNTRL3
        EXTRN   RSTAT, NOFILE
        EXTRN   XMAX, YMAX, XMIN, YMIN, PMKTBL
 
;----------------------------------------------------------------------------+
;       Define I/O Parameter Block Sizes in Bytes                            +
;----------------------------------------------------------------------------+
 
CTLEN   EQU     20     ; Control Parameter Block Length
IOLEN   EQU     90     ; Integer Input/Output Parameter Block Length
PTLEN   EQU     80     ; Coordinates Input/Output Array Length
 
;----------------------------------------------------------------------------+
;       Define Byte Displacements to Successive Entries in a Word Array      +
;----------------------------------------------------------------------------+
 
SECND   EQU     2      ; Second Entry Occupys Bytes 2,3
THIRD   EQU     4      ; Third  Entry at      Byte  4,5
FORTH   EQU     6      ;                            6,7
FIFTH   EQU     8      ;                            8,9
SIXTH   EQU     10     ;                           10,11
SVNTH   EQU     12     ;                           12,13
 
;----------------------------------------------------------------------------+
;       Define DEVICE CAPABILITIES                                           +
;----------------------------------------------------------------------------+
 
zdxlng  EQU     455    ; Set the length of each axis in pixels
zdylng  EQU     455    ; 1128 / 84 (pixels per inch) = 13.43 inches
deunit  EQU     0      ; Precisely scaled image
pixsiz  EQU     353    ; Size per Pixel
piysiz  EQU     296    ; SIZE PER PIXEL HIGHT
lincap  EQU     6      ; Capable of 6 different line styles
lszcap  EQU     1      ; Capable of 1 different line widths
 
mrkcap  EQU     7      ; Capable of 7 different Markers
mszcap  EQU     12     ; Capable of 12 different maker sizes
 
tszcap  EQU     12     ; Capable of 12 different text sizes
txtcap  EQU     1      ; No. of fonts
 
patcap  EQU     6      ; Capable of 6 different patterns
hatcap  EQU     0      ; Capable of 0 different hatch styles
 
cordef  EQU     2      ; 2 predefined colors (monochrome)
 
gdpcap  EQU     1      ; No. of GDPs
 
corcap  EQU     0      ; Capable of Color
rotcap  EQU     1      ; Capable of Text Rotation
filcap  EQU     0      ; Capable of Fill Area Operation
pixcap  EQU     0      ; No Pixel Operation
palete  EQU     2      ; Total of 2 Colors in the color pallette
 
indevs  EQU     0      ; No input devices
gincap  EQU     0      ; No Gin capability (Workastation type : Output only)
 
;----------------------------------------------------------------------------+
;       Define Minimum/Maximum Primitive Sizes in Pixels                     +
;----------------------------------------------------------------------------+
 
CHRBOX  EQU     8
LNSZ0   EQU     1
LNSZ9   EQU     1
MKSZ0   EQU     8
MKSZ9   EQU     96
TXSZ0   EQU     8
TXSZ9   EQU     96
 
 
;----------------------------------------------------------------------------+
;       Initialize Printer Output Parameter Blocks                           +
;----------------------------------------------------------------------------+
 
OUTBLK
ZXMAX   DW      ZDXLNG           ; Addressable width in pixels
        DW      ZDYLNG           ; Adderssable height in pixels
        DW      DEUNIT           ; Precisely Scaled Image Capability
        DW      PIXSIZ           ; Pixel Size in Micrometers (width)
        DW      PIYSIZ           ; Pixel Size (Height)
        DW      TSZCAP           ; No. of Character Heights
        DW      LINCAP           ; No. of Line styles
        DW      LSZCAP           ; No. of Line widths
        DW      MRKCAP           ; No. of Marker types
        DW      MSZCAP           ; No. of Marker sizes
        DW      TXTCAP           ; No. of Fonts
        DW      PATCAP           ; No. of Patterns
        DW      HATCAP           ; No. of Hatch Styles
        DW      CORDEF           ; No. of Predefined Colors
 
;       Generalized Drawing Primitives Capabilities
 
        DW      GDPCAP
        DW       1               ; Device has bars
        DW      -1, -1, -1, -1, -1, -1, -1, -1, -1 ; No other GDPs are defined
        DW       3
        DW      -1, -1, -1, -1, -1, -1, -1, -1, -1
 
        DW      CORCAP           ; Color Capability Flag
        DW      ROTCAP           ; Text Rotation
        DW      FILCAP           ; Fill Area
        DW      PIXCAP           ; Pixel Operation
        DW      PALETE           ; No. of available colors
 
;       Available Input devices
 
        DW      INDEVS
        DW      INDEVS
        DW      INDEVS
        DW      INDEVS
 
        DW      GINCAP           ; Workstation type : Output Only
 
;----------------------------------------------------------------------------+
;       More Output Initializations                                          +
;----------------------------------------------------------------------------+
 
DWSIZE
        DW      0
        DW      TXSZ0            ; Minimum character height in pixels
        DW      0
        DW      TXSZ9            ; Maximum character height
 
        DW      LNSZ0            ; Minimum Line width in pixels
        DW      0
        DW      LNSZ9            ; Maximun Line width in pixels
        DW      0
 
        DW      0
        DW      MKSZ0            ; Minimum Marker Height in Pixels
        DW      0
        DW      MKSZ9            ; Maximum Maker height
 
;----------------------------------------------------------------------------+
;       Initialize other default values                                      +
;----------------------------------------------------------------------------+
 
NDSIZE
ndlnsz  DS      02               ; Set current device line size
ndtxsz  DS      02               ; Set current device text size (1-16)
ndtxrt  DS      02               ; Set currnet device text rotation (0-3)
                                 ; 0=0, 1=90, 2=180, 3=270
ndmksz  DS      02               ; Set current device marker size (1-16)
 
;----------------------------------------------------------------------------+
;       Initial defaults (Line style, Color, Character size, etc)            +
;----------------------------------------------------------------------------+
 
CHRSZ   DS      02               ;Character width  = 6 pixels * NDTXSZ
CHRHT   DS      02               ;Character height = 8 pixels * NDTXSZ
PMKSZ   DS      02               ;Maker size in pixels = 8 * NDMKSZ
 
NDATTR
wkid    DS      02               ;Workstation Identifier
ndlnty  DS      02               ;Current Line Style
ndlnco  DS      02               ;        Line Color
ndmkty  DS      02               ;        Marker Type
ndmkco  DS      02               ;        Marker Color
ndtxty  DS      02               ;        Text Font
ndtxco  DS      02               ;        Text Color
ndinty  DS      02               ;        Fill Interior Style
ndfity  DS      02               ;        Fill Style
ndfico  DS      02               ;        Fill Color
LSTYLE  DW      0FC30H           ;Line style pattern word
 
NDINIT  DS      34               ;Initial Device Default Attribute List
 
;----------------------------------------------------------------------------+
;        Setup Default Device Primitive Attributes in NDATTR Array           +
;----------------------------------------------------------------------------+
 
ZOPWK
 
;        Move Primitive Attribute Defaults from INTIN to NDATTR
 
;        LHLD   PBPTR            ;Address Pointer to Parameter Block
;        LXI    D,      SECND
;        DAD    D                ;Address Pointer to INTIN array
;        MOV    E,      M
;        INX    H
;        MOV    D,      M        ;<de> = address of INTIN array
 
         LHLD   INTIN
         LXI    D,      NDATTR   ;<hl> = Address of Current Device Primitive
         LXI    B,      20       ;
         CALL   BLKMOV           ;Move 20 bytes of Data from INTIN array
 
                                 ;Input Line Style Index = 1 - 6
         LXI    H,      NDLNTY   ;Stored Line Style index = 0 - 5
         DCR    M
         LDA    NDMKTY           ;Put ASCII Maker Symbol in Current Attribute
         DCR    A
         LXI    H,      PMKTBL   ;Maker ASCII sequence Table
         MOV    E,      A
         MVI    D,      0
         DAD    D
         MOV    A,      M
         STA    NDMKTY
 
         MVI    A,      1
         STA    NDTXSZ           ;Initialize Text size
         STA    NDMKSZ           ;           Maker size
         STA    NDLNSZ           ;           Line size
         STA    NDTXRT           ;           Text rotation
         MVI    A,      8        ;           Character height
         STA    CHRHT
         STA    PMKSZ            ;           Maker Height
         DCR    A
         DCR    A
         STA    CHRSZ            ;           Character Width
 
;        Initialize Device Default Attribute Value List
 
         LXI    H,      NDSIZE   ;These Are the Current Attibute Values
         LXI    D,      NDINIT   ;These Default Values Never get Modified
         LXI    B,      34
         CALL   BLKMOV
 
;----------------------------------------------------------------------------+
;        Initialize OBJLST Buffer Flags, Indeces and Pointers                +
;----------------------------------------------------------------------------+
 
         XRA    A
         STA    RSTAT            ;Set Roll-Out File Flag, 0=No File Used
         CALL   NOFILE           ;Initialize Buffer Index and Address Pointers
 
;----------------------------------------------------------------------------+
;        Setup Output Control Parameters                                     +
;----------------------------------------------------------------------------+
 
;        LHLD   PBPTR            ;Parameter Block Address Pointer
;        MOV    E,      M
;        INX    H
;        MOV    D,      M        ;<de> = Control Parameter Block Address
 
         LHLD   CNTRL3           ;<hl> = Control(3)
 
         MVI    M,      6        ;Control(3) = 6 Output Coord. Points
                                 ;             in PTSOUT
         LXI    D,      4        ;Get start byte address of 5th entry
         DAD    D                ;<hl> = Control(5)
         MVI    M,      45       ;Control(5) = 45 Output values in INTOUT
         INX    H
         MVI    M,      0
 
;----------------------------------------------------------------------------+
;        Output Device Capability Parameters in INTOUT array                 +
;----------------------------------------------------------------------------+
 
;        Move Predefined Printer Capability values to INTOUT
 
;        LHLD   PBPTR            ;Parameter Block Address Pointers
;        LXI    D,      FORTH
;        DAD    D                ;<hl> = Address Pointer of INTOUT array
;        MOV    E,      M
;        INX    H
;        MOV    D,      M        ;<de> = INTOUT Array Address
 
         LHLD   INTOUT
         XCHG
         LXI    H,      OUTBLK   ;<hl> = Address of predefined INTOUT values
 
         LXI    B,      IOLEN    ; INTOUT length in Bytes
         CALL   BLKMOV           ; Move to Output Area
 
;----------------------------------------------------------------------------+
;        Output Values that need to be Transformed to NDC space in PTSOUT    +
;----------------------------------------------------------------------------+
 
;        LHLD   PBPTR            ;Parameter Block Address Pointer
;        LXI    D,      FIFTH
;        DAD    D                ;<hl> = Address Pointer of PTSOUT array
;        MOV    E,      M
;        INX    H
;        MOV    D,      M        ;<de> = PTSOUT Array Address
 
         LHLD   PTSOUT
         XCHG
         LXI    H,      DWSIZE   ;<hl> = Predefined Drawing Primitive Sizes
                                 ;       in Pixels
         LXI    B,      24       ;Move 24 bytes of data to PTSOUT
         CALL   BLKMOV
 
         RET                     ;End of Open Workstation Setup
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  BLKMOV : MOVE A BLOCK OF DATA FROM ONE AREA OF MEMORY TO ANOTHER          ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Revision : Sept. 15, 1982                                                 ;
;                                                                            ;
;  Blkmov (from, to, count)                                                  ;
;                                                                            ;
;  CALL BLKMOV                                                               ;
;    <HL> = Source Address                                                   ;
;    <DE> = Destination                                                      ;
;    <BC> = No. of Bytes to Move                                             ;
;                                                                            ;
;  RET                                                                       ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
BLKMOV
         MOV    A,      M        ;Load source byte
         INX    H                ;Next source byte address
         STAX   D                ;Store in Destination
         INX    D                ;Increment Destination address
         DCX    B                ;Decrement Byte count
         MOV    A,      B        ;Any more ?
         ORA    C
         JNZ    BLKMOV           ;Continue if not Done
         XRA    A
BLKJ01   JC     BLKJ01
 
 
         RET
 
 
         END
 
E 1
