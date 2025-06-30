h42705
s 00150/00000/00000
d D 1.1 83/03/17 15:57:27 tes 1 0
c date and time created 83/03/17 15:57:27 by tes
e
u
4
U
t
T
I 1
         TITLE 'DODRAW - Draw Output Primitive Subroutines'
 
; ****************************************************************************
; *                                                                          *
; *      DODRAW : Generate Output Primitives                                 *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : NOV. 08, 1982      File "DODRAW.ASM"   Version 1.2             *
;                                                                            ;
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) LINE STYLE SUPPORT VARIABLES IN PUBLIC :                           *
;         LINE ENDPOINTS -  X0, Y0, XN, YN, SPECIL                           *
;         FILTER Y AND SET BIT FLAGS - ABOVE, INSIDE, ZONED                  *
;      2) Disk File Roll-Out on OBJLST Buffer OverFlow Supported by GETBYT   *
;         GETNXT routines                                                    *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;  Calls    :                                                                *
;                                                                            *
;  GETXY  - Get the x,y coordinates of the next point in OBJLST (4 Bytes)    *
;  DRAWIT - Raster convert vector to pixel values, maps pixel                *
;                      to bitmap address and 'sets' the bit                  *
;                                                                            *
;  GETPT  : Get pt. coord. from PTSIN array (2 bytes)                        *
;  PUTPT  : Put pt. coord. into OBJLST buffer (2 bytes)                      *
;  PUTBYT : Put 1 byte into OBJLST buffer                                    *
;  GETBYT : Get 1 byte from OBJLST buffer                                    *
;  GETNXT : Get Next byte from OBJLST buffer                                 *
;  GETMIN : Returns in <hl> the smaller of <hl>, <de> values                 *
;  GETMAX : Retruns in <de> the larger of Values in <hl> and <de>            *
;                                                                            *
;*****************************************************************************
 
         PUBLIC DOLINE, GETPT, PTADDR
;        PUBLIC DOFILL
         EXTRN  GETNXT, GETBYT, GETXY, RSTAT
         EXTRN  DRAWIT
         EXTRN  BNEXT
 
;        EXTRN   ABSHL, NEGHL, CMPDH, CMPS, SUBDH, MIDH, DIDH, IMOD
 
         PUBLIC  NBIT, NBYT
         PUBLIC  X, X1, Y, Y1, X2, Y2, DX, DY, XDIR, YDIR
         PUBLIC  FLG1, FLG2
         PUBLIC  X0, Y0, XN, YN, ABOVE, INSIDE, SPECIL
 
;----------------------------------------------------------------------------+
;        LINE DRAWING (RASTERIZE VECTOR TO PIXEL) VARIABLES                  +
;----------------------------------------------------------------------------+
 
X
X1       DS      02              ;line end points coordinates
Y
Y1       DS      02
X0       DS      02              ;Line start point coord.
Y0       DS      02
 
XN       DS      02              ;Line end point coord.
YN       DS      02
X2       DS      02
Y2       DS      02
 
DX       DS      02              ;dx = x2 - x1
DY       DS      02              ;dy = y2 - y1
XDIR     DS      01              ;if dx>0 then xdir = 1
                                 ;if dx=0 then xdir = 0
                                 ;if dx<0 then xdir = -1
YDIR     DS      01              ;y direction indicator
FLG1     DS      01              ;Position indicator of a point
FLG2     DS      01              ;relative to the Current Plot Strip
 
;        Line Style Support Variables
 
ABOVE    DB      0               ;Which Line EndPoint ABOVE Strip Flag
INSIDE   DB      1               ;Line EndPoints INSIDE Strip Flag
SPECIL   DS     02               ;Line style bit pattern
 
;----------------------------------------------------------------------------+
 
NPT      DS     1                ;No. of points
PTADDR   DS     2                ;ADDRESS OF NEXT POINT IN PTSIN ARRAY
 
XPMIN    DS     2                ;Polygon Min/Max Extents
YPMIN    DS     2
XPMAX    DS     2
YPMAX    DS     2
 
;----------------------------------------------------------------------------+
;        BITMAP BUFFER ADDRESSING VARIABLES                                  +
;----------------------------------------------------------------------------+
 
 
NBIT     DS      01              ;bit location of a pixel = x mod 8 (0...7)
NBYT     DS      02              ;byte location of a pixel in bitmap
 
         page
 
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;        Polyline                                                            +
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
DOLINE
;        LHLD   LSTPTR           ;Pointer to next entry in OBJLST
;        MOV    A,      M        ;<a> = npt
;        INX    H                ;<hl> = address of next entry in OBJLST
 
         CALL   GETNXT           ;<a> = npt
 
;        Call polyline routine
 
         CALL   DRAWIT
 
;        SHLD   NXTOBJ           ;Update Pointer to next entry in OBJLST
 
         RET
 
;*****************************************************************************
;                                                                            *
;        GETPT : Get the next coordinate from PTSIN array                    *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION : SEPT. 25, 1982  File ""                                        *
;                                                                            *
;  Getpt(from, coord)                                                        *
;                                                                            *
;  CALL GETPT                                                                *
;        <BC> = Address of next coordinate in PTSIN                          *
;  RET                                                                       *
;        <BC> = Address of next Coordinate in PTSIN                          *
;        <DE> = The Coordinate                                               *
;                                                                            *
;*****************************************************************************
 
GETPT
         LHLD   PTADDR
         MOV    E,      M        ;Put it in D
         INX    H                ;Next half
         MOV    D,      M
         INX    H                ;<bc> Points to the next entry in PTSIN
         SHLD   PTADDR
 
         RET
 
         END
 
 
E 1
