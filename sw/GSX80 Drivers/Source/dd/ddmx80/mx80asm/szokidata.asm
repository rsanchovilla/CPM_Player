h61720
s 00361/00000/00000
d D 1.1 83/03/17 16:00:08 tes 1 0
c date and time created 83/03/17 16:00:08 by tes
e
u
4
U
t
T
I 1
 
	TITLE  'Setup BITMAP accessing parameters for OKIDATA Printer'
 
; ****************************************************************************
; *                                                                          *
; *  SETUPS : SETUP BITMAP ACCESSING PARAMETERS FOR OKIDATA PRINTER          *
; *           AND SUPPORT PRINTER ENTER/EXIT GRAPHIC MODE COMMANDS           *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;    REVISION : Nov. 11, 1982   FILE "ZOKIDATA.ASM"   Version 2.1            *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) MODIFIED FROM PRISM PRINTER                                        *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;    PRINTER DEPENDENT SETUP MODULE                                          *
;                                                                            *
;    SET UP BITMAP ACCESSING PARAMETERS FOR MX-80 PRINTER                    *
;    AND SUPPORT PRINTER ENTER/EXIT GRAPHIC MODE COMMANDS                    *
;                                                                            *
;  Setups (xmax, ymax)                                                       *
;                                                                            *
;  Function :                                                                *
;                                                                            *
;      Compute the following variables at runtime to support                 *
;      the BITMAP buffer Access by the Vector rasterization                  *
;      and Bitmap Scanner Routines (RASTER and SCANIT)                       *
;                                                                            *
;      Support Enter/Exit Printer Graphic Mode commands                      *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;      XMAX, YMAX are the Maximum Plot extents                               *
;      zxmax  The Maximum Device Width in Pixels                             *
;                                                                            *
;  Program constants :                                                       *
;                                                                            *
;      BSIZE : The allocated BITMAP buffer size in bytes                     *
;      PIXL  : No. of pixel wires 'Plotted' per Graphic byte sent to the     *
;              printer                                                       *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;      XW    : No. of bytes per Horizontal Print Line                        *
;              Line Width in pixels (XMAX) / 8                               *
;      YW    : No. of Print lines per Vertical Plot page                     *
;              Plot Height in pixels (YMAX) / pixels per Vertical Line (PIXL)*
;      PLINE : No. of Print Lines per BITMAP buffer (Plot Strip)             *
;              Buffer size / Bytes per Print Line                            *
;      YLINE : No. of vertical Pixels per Plot Strip (PLINE * PIXL)          *
;                                                                            *
;      LSIZE : Offset size (bytes) to start of next Print Line in BITMAP     *
;                                                                            *
;      NSTRIP: No. of Plot Strips to Raster Scan per Plot                    *
;                                                                            *
;      YSIZE : No. of Vertical Pixels per Print line                         *
;                                                                            *
;      MAPEND: End of BITMAP buffer address                                  *
;                                                                            *
;      PSIZE : Actual Buffer Size used for each Plot Strip                   *
;                                                                            *
;      MPTY  : Bitmap Buffer Empty Flag, Set by SETBIT, Cleared by CLRBUF    *
;                                                                            *
;----------------------------------------------------------------------------+
 
         PUBLIC SETUPS, GENTER, ZFORM, GEXIT, GLF, CLRBUF
         EXTRN  NEGHL, CMPDH, MIDH, DIDH, POUT, SUBDH, MUL8
 
         PUBLIC BITMAP, MAPEND, MPTY
         PUBLIC XW, YW, NEGXW, PLINE, NSTRIP, LSIZE, YSIZE
         PUBLIC XMAX, YMAX, XMIN, YMIN, OBJCNT
         EXTRN  zxmax, OBJLST
         PUBLIC BYTEND
         page
;----------------------------------------------------------------------------+
;        PRINTER CONSTANTS (PRISM)                                           +
;----------------------------------------------------------------------------+
 
 
PIXL     EQU    7            ;7 pixels printed per graphic byte
ETX      EQU    03H          ;ASCII ETX must Preced each Control Code
GMODE    EQU    03H          ;Enter Graphic Mode
PMODE    EQU    02H          ;Exit  Graphic Mode,Enter Normal Print Mode
SO       EQU    0EH          ;Graphic LineFeed/Vertical Avance Paper
FF       EQU    0CH          ;Form Feed
NPIX     EQU    -7
 
;----------------------------------------------------------------------------+
;        PRINTER BUFFER CONSTANTS (Debug Version)                            +
;----------------------------------------------------------------------------+
 
BSIZE    EQU    1600         ;BITMAP Buffer Size
 
;----------------------------------------------------------------------------+
;        The following variables are computed at runtime :                   +
;----------------------------------------------------------------------------+
;
;        XMAX,YMAX = Maximum Plot Extent (varys from plot to plot)
;
 
XMAX    DW      00           ;XMAX  = Pixels per Print line width (bits)
YMAX    DW      00           ;YMAX  = Pixel per Plot height
 
XMIN	DW	07FFFH
YMIN	DW	07FFFH
 
XW       DS     02           ;XW    = XMAX div 8,Print line width, ie.
                             ;        BITMAP buffer row order (bytes)
                             ;PIXL  = BITMAP buffer colunm order
 
N1       DS     01           ;Pixel count needed by printer
N2       DS     01           ; Extra bit of pixel count
 
NEGXW    DS     02
YW       DS     02           ;No. of Print Lines for this plot
                             ;YW    = YMAX div PIXL
BMIN     DS     02           ;Minimum buffer size = XW * PIXL
PLINE    DS     02           ;No. of Graphic Print Lines per BITMAP
                             ;PLINE = BSIZE div BMIN
NSTRIP   DS     01           ;No. of Plot Strips to clip the plot for
                             ;output, NSTRIP = YW div PLINE
                             ;YW = Total no. of vertical Print Lines per
                             ;Plot, YW = YMAX div PIXL + 1
LSIZE    DS     02           ;BITMAP Offset to start of next Print Line
                             ;if   addr = last byte of current print line
                             ;            lsize = -xw*(pixl+1)
                             ;then addr of new print line = addr + lsize
 
YSIZE    DS     02           ;No. of vertical Pixels per Print Line
                             ;PLINE * PIXL
 
;----------------------------------------------------------------------------+
;        BITMAP BUFFER and OBJECT LIST BUFFER VARIABLES                      +
;----------------------------------------------------------------------------+
 
MAPEND   DS     02           ;Address of Last Row of Actual Buffer
                             ;MAPEND= (PLINE * BMIN) + BITMAP - XW
BYTEND   DS     02
PSIZE    DS     02           ;Size of Actual Buffer used for each Plot Strip
                             ;The BITMAP buffer is not always entirely used
MPTY     DS     01           ;If 0 : The BITMAP is Empty
 
OBJCNT   DS     02           ;Total No. of Objects Stored in Object List
 
;----------------------------------------------------------------------------+
;        BITMAP Buffer Allocation                                            +
;----------------------------------------------------------------------------+
 
BITMAP   DS     BSIZE        ;Allocate BITMAP Buffer
 
;----------------------------------------------------------------------------+
         page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  This module sets up the Plot Strip variables for RASTER                   ;
;  and SCANNER modules to access the BITMAP BUFFER properly                  ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
SETUPS
 
;        xw = (xmax / 8) + 1     Print line width in bytes
 
;*******
; NOTE * Error : If bmin > bsize, Not enough buffer space allocated
;*******
 
         LHLD   ZXMAX            ;Check Xmax < ZXMAX
         XCHG
         LHLD   XMAX
         CALL   CMPDH
         JNC    SETJ06           ;Carry off, ZXMAX  > Xmax
         XCHG
         SHLD   XMAX             ;Xmax = ZXMAX
SETJ06
         MVI    B,     3
DIV8     XRA    A                ;Clear carry
         MOV    A,     H
         RAR
         MOV    H,     A         ;<hl> div 8 = right shift <hl> 3 times
         MOV    A,     L
         RAR
         MOV    L,     A
         DCR    B
         JNZ    DIV8             ;xw = xmax / 8 + 1
         INX    H
         SHLD   XW               ;<hl> = xw
 
;        bmin = xw * pixl         Mimimum bitmap buffer size in Bytes
 
         LXI    D,     PIXL      ;<de> = pixl
         CALL   MIDH             ;bmin = xw * pixl
         SHLD   BMIN             ;<hl> = bmin
 
;        pline = bsize / bmin     Print lines per band (PLot Strip)
 
         LXI    D,     BSIZE     ;<de> = bsize
         CALL   DIDH             ;pline = bsize / bmin
         PUSH   H                ;Stack pline
 
;        yw = (ymax / pixl) + 1   No. of Print lines for this plot
 
         LHLD   YMAX             ;<hl> = ymax
         MOV    A,     H         ;HANDLE Y = 0 CONDITION
         ORA    L
         JZ     SETJ05
         MOV    A,     H
         ORA    A                ;HANDLE Y < 0 CONDITION
         JM     SETJ05
         XCHG                    ;<de> = ymax
         LXI    H,     PIXL      ;<hl> = pixl
         CALL   DIDH             ;yw = ymax / pixl
 
;        Is ymax integer multiple of pixl  ?
 
         MOV    A,     C         ;check the remainder in <bc>
         ORA    A                ;add one line if non-zero remainder
         JZ     SETJ01
         INX    H
         JMP    SETJ01
 
SETJ05   LXI    H,     1
         SHLD   YMAX
SETJ01   SHLD   YW               ;<hl> = yw
 
;        No. of Print Lines per Plot Strip is the smaller value of
;        yw and pline, If yw<pline = Plot needs less than one Strip
 
         POP    D                ;Unstack <de> = pline
         PUSH   H                ;Stack yw
         CALL   CMPDH
         JNC    SETJ03           ;If Carry set : Pline < Yw, no change
         XCHG                    ;   Carry off : Pline > Yw, use Yw as Pline
SETJ03   SHLD   PLINE            ;<hl> = Pline, No. of Print Lines per Strip
 
 
;        nstrip = yw / pline
 
         POP    D                ;Unstack <de> = yw
         PUSH   H                ;Stack pline
         CALL   DIDH             ;nstrip = yw / pline
 
;        Is yw a multiple of pline ?
 
         MOV    A,     C         ;remainder in <bc>
         ORA    A
         JZ     SETJ02           ;Add one strip for non-zero remainders
         INX    H                ;
SETJ02   SHLD   NSTRIP           ;<hl> = nstrip
 
;        Mapend = (Pline * Bmin) + Bitmap - Xw , Start byte address of
;        Last Row (Maximum Y) in Buffer
 
         POP    D                ;Unstack <de> = pline
         LHLD   BMIN
         CALL   MIDH             ;<hl> = pline * bmin
         SHLD   PSIZE            ;Actual Buffer size in Bytes
 
         LXI    D,     BITMAP
         DAD    D
         SHLD   BYTEND
         XCHG                    ;<de> = (pline * bmin) + bitmap
         LHLD   XW
         CALL   NEGHL            ;<hl> = -xw
         SHLD   NEGXW
         DAD    D
         SHLD   MAPEND
 
;        Ysize = -(Pixl * Pline) + 1
 
         LHLD   PLINE
         LXI    D,     NPIX      ;npix = - pixl
         CALL   MIDH
         INX    H
         SHLD   YSIZE            ;<hl> = Ysize
 
;        lsize = -[xw * (pixl+1)]
 
         LHLD   NEGXW
         LXI    D,     PIXL      ;<de> = pixl
         INX    D                ;pixl + 1
         CALL   MIDH             ;lsize = -xw * (pixl+1)
         SHLD   LSIZE            ;<hl> = lsize
         XCHG
         LHLD   BYTEND
         DAD    D
         XCHG
         LHLD   XW
         DAD    D
         SHLD   BYTEND
 
;        Enter Graphic Mode
 
;        Graphic setup for the printer
;         ETX    - Initialize the printer TO GRAPHICS MODE
 
GENTER
         MVI    A,     GMODE
         CALL   POUT
         RET
 
 
;----------------------------------------------------------------------------+
;        Do a FormFeed                                                       +
;----------------------------------------------------------------------------+
 
ZFORM
         MVI    A,     FF
         CALL   POUT
         RET
 
;----------------------------------------------------------------------------+
;        Exit graphic mode
;----------------------------------------------------------------------------+
 
;        Exit Graphic Mode
 
GEXIT
         MVI    A,     ETX       ;ASCII ETX Must preced each control code
         CALL   POUT
         MVI    A,     PMODE     ;Enter Normal Print Mode
         CALL   POUT
         RET
 
 
;-------------------------------------------------------------------+
;        Graphic Line Feed, ADVANCE PAPER 7 PIXELS VERTICALLY       +
;-------------------------------------------------------------------+
 
GLF      MVI    A,    ETX
         CALL   POUT
         MVI    A,    SO
         CALL   POUT
         RET
 
;----------------------------------------------------------------------------+
;        Clear BITMAP Buffer for Next Plot Strip                             +
;----------------------------------------------------------------------------+
 
CLRBUF
         LXI    H,     BSIZE      ;Get Byte count
         XCHG
         LXI    H,     BITMAP     ;Get Start Address
 
CLRL01   MVI    M,     0          ;Clear the word
         INX    H                 ;Next byte address
         DCX    D                 ;Decrement byte count
         MOV    A,     D
         ORA    E
         JNZ    CLRL01            ;More Bytes
 
         XRA    A
         STA    MPTY              ;Clear BITMAP buffer MPTY flag
 
         RET
 
         END
 
E 1
