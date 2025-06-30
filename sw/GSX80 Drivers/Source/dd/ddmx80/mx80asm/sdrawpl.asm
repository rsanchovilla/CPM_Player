h15195
s 00204/00000/00000
d D 1.1 83/03/17 15:57:49 tes 1 0
c date and time created 83/03/17 15:57:49 by tes
e
u
4
U
t
T
I 1
 
         TITLE  'POLYLINE DRAWING ROUTINES'
 
; ****************************************************************************
; *                                                                          *
; *  DRAWIT : RASTER CONVERT A POLYLINE INTO THE PRINTER BITMAP BUFFER,      *
; *           CLIPPING EACH LINE SEGMENT BETWEEN THE CURRENT PLOT STRIP      *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : Nov. 05, 1982    File "DRAWPL.ASM"                             *
;                                                                            *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) BITMAP BUFFER EMPTY FLAG  11/3                                     *
;      2) SET EMPTY FLAG IN ADDRXY indicating Bitmap Used                    *
;      3) Check LINE STYLE BIT pattern : SPECIL   (Call LINETY)              *
;      4) New Pieces : Drawit, textit = Drawpl, Textit, Drawxy, Getadr       *
;      5) Special Line Style Support :                                       *
;         .Drawit Stores Line Start Point X0, Y0 for Swapping                *
;         .Clipit Returns ABOVE flag : 0=inside, 1=Y2 above, 2=Y1 above      *
;         .Drawxy Swaps Line Endpoints : Line Direction Ymax to Ymin         *
;                 Filters Y0 to TOPY and Sets Y0 inside flag for ADDRXY      *
;                 and SETBIT Rontines to start Setting Bit in BITMAP         *
;      6) Restore the Line Style Pattern After Rasterization                 *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;  POLYLINE DRAWING ROUTINES                                                 *
;                                                                            *
;  Drawit (npt,x1,y1,x2,y2,...xnpt,ynpt,cindex)                              *
;                                                                            *
;  Function : For each line segment ..                                       *
;             Clip the endpoints of the line to the current plot strip and   *
;             Scan convert the line into raster pixel values mapped          *
;             into the bitmap buffer                                         *
;                                                                            *
;             Get x1, y1                                                     *
;             do i = 1, npt                                                  *
;                Get x2, y2                                                  *
;                Call Clipit                                                 *
;                Call Drawxy                                                 *
;                x1 = x2                                                     *
;                y1 = y2                                                     *
;             end;                                                           *
;                                                                            *
;  Input    : NPT - No. of Vertices in the Ployline                          *
;             XP  - Array of X-coordinates                                   *
;             YP  - Array of Y-coordinates                                   *
;             LSTPTR - Object List Buffer Pointer, where xp ans yp arrays    *
;                      are stored                                            *
;             MPTY - Bitmap Buffer Set Indicator                             *
;                                                                            *
;  Output   : Returns Pointer to the next entry in OBJLST in <hl>            *
;                                                                            *
;  Calls    : GETXY  - Get the x,y coordinates of the next point in OBJLST   *
;             CLIPIT - Clip line to printer plot strip (ystart, yend)        *
;             DRAWXY - Raster convert vector to pixel values, maps pixel     *
;                      to bitmap address and 'sets' the bit                  *
;             LINETY - Check the LINESTYLE PATTERN for SETBIT                *
;                                                                            *
;  Raster Variables  :                                                       *
;             X0     - Line start point coord.                               *
;             XN     - Line end point coord.                                 *
;  Line Style Support Variables                                              *
;             ABOVE  - Which Line EndPoint ABOVE Strip Flag                  *
;             SPECIL - Special Line Style Bit Pattern for the Current NDLNTY *
;             INSIDE - Line EndPoints INSIDE Strip Flag                      *
;                                                                            *
;----------------------------------------------------------------------------*
 
        PUBLIC  DRAWIT, SWAPY
 
        EXTRN   GETXY, CLIPIT, DRAWXY
 
        EXTRN   ABSHL, NEGHL, CMPDH, CMPS, SUBDH, MIDH, DIDH, IMOD
 
        EXTRN   BITMAP, NBIT, NBYT, MPTY
        EXTRN   XMAX, YMAX
        EXTRN   XW, TOPY, BOTY, BOTTY
        EXTRN   LSTYLE, NDLNTY
	EXTRN	X, X1, Y, Y1, X2, Y2, DX, DY, XDIR, YDIR
        EXTRN   X0, Y0, XN, YN, ABOVE, INSIDE, SPECIL
 
;----------------------------------------------------------------------------+
;                                                                            +
;  CALL DRAWIT                                                               +
;       <A>  = npt                                                           +
;       <HL> = current OBJLST pointer : LSTPTR                               +
;  RET                                                                       +
;                                                                            +
;        Get x1, y1                                                          +
;        do i = 1, npt                                                       +
;          Get x2, y2                                                        +
;          Call Clipit                                                       +
;          Call Drawxy                                                       +
;          x1 = x2                                                           +
;          y1 = y2                                                           +
;        end;                                                                +
;----------------------------------------------------------------------------+
 
DRAWIT
         PUSH    PSW             ;Stack <A> = npt
 
;        Get x1, y1
 
         CALL    GETXY           ;Returns : <de> = x, <bc> = y,
         XCHG                    ;          <hl> = address of next pt
         SHLD    X0
         SHLD    X1
         MOV     H,     B
         MOV     L,     C
         SHLD    Y0
         SHLD    Y1
         XCHG
 
;        (npt - 1) = 0 ?
 
DRAL01   POP     PSW
         DCR     A               ;npt = npt - 1
         JZ      DRAJ99          ;DONE
         PUSH    PSW
;
;        Get x2, y2
;
         CALL    GETXY           ;Returns <de> = x, <bc> = y,
         XCHG                    ;        <hl> = address of next pt.
         SHLD    X2
         SHLD    XN              ;Save Uncliped x2, y2 for next line segment
         MOV     H,     B
         MOV     L,     C
         SHLD    Y2
         SHLD    YN
 
;***     PUSH    D               ;Save LSTPTR
 
         LHLD    LSTYLE          ;Current Line Style Bit Pattern
         SHLD    SPECIL          ;16 Bit Line Pattern for Drawxy routine
 
         CALL    CLIPIT          ;Clip line to inside current Plot Strip
;
;        Zero = Off, if Line object lies entirely outside current Plot Strip
;
         CZ      DRAWXY          ;Draw line if not entirely clipped
 
;        Draw to point,  x1 = x2, y1 = y2
 
         LHLD    XN
         SHLD    X0
         SHLD    X1              ;x1 = x2
         LHLD    YN
         SHLD    Y0
         SHLD    Y1              ;y1 = y2
 
;****    POP     H               ;Unstack LSTPTR
 
         JMP     DRAL01          ;Draw next line segment
 
DRAJ99
         RET
 
;----------------------------------------------------------------------------+
;        SWAPY - Standardize Line direction to always go from Ymax to Ymin   +
;                So the line Rasterization Routine can stop at bottom of     +
;                the current Plot strip                                      +
;        ABOVE - 0 = Both endpoints are either inside or below the Current   +
;                    Plot strip,                                             +
;                1 = Y2 is above the Current Plot Strip                      +
;               -1 = Y1 is above the Current Plot Strip, Direction ok        +
;----------------------------------------------------------------------------+
 
SWAPY
         LDA     ABOVE           ;Get Position Flag for endpoints
 
;        Above : 0 : no swap, both point inside strip
;                1 : change line direction, and make line start from XN, YN
;                    Y2 = Y1, X2 = X1, Y1 = YN, X1 = XN
;               -1 : make line start from X0, Y0
 
         ORA     A
         RZ
         JM      SWAJ01          ;-1 : Y1 is above Top y
 
;        Y2 is above Strip
 
         LHLD    X1
         SHLD    X2
         LHLD    Y1
         SHLD    Y2              ;Change Y2 to lower point
         LHLD    YN
         SHLD    Y1
         LHLD    XN              ;Line was trimmed to Top y
         SHLD    X1              ;Change Y1 to the original end point
         RET
 
SWAJ01
         LHLD    Y0              ;Y1 was clipped to Top y
         SHLD    Y1              ;Change Y1 to the Original Start point
         LHLD    X0
         SHLD    X1
         RET
 
         END
E 1
