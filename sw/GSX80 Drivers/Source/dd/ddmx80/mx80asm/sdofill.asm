h28868
s 00119/00000/00000
d D 1.1 83/03/17 15:57:32 tes 1 0
c date and time created 83/03/17 15:57:32 by tes
e
u
4
U
t
T
I 1
         TITLE 'DOFILL - DRAW POLYGON OUTLINE'
 
; ****************************************************************************
; *                                                                          *
; *      DOFILL : Generate Polygon Outlines                                  *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : NOV. 10, 1982      File "DOFILL.ASM"   Version 1.0             *
;                                                                            ;
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) LINE STYLE SUPPORT VARIABLES IN PUBLIC :                           *
;         LINE ENDPOINTS -  X0, Y0, XN, YN, SPECIL                           *
;         FILTER Y AND SET BIT FLAGS - ABOVE, INSIDE, ZONED                  *
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
;  GETMIN : Returns in <hl> the smaller of <hl>, <de> values                 *
;  GETMAX : Retruns in <de> the larger of Values in <hl> and <de>            *
;                                                                            *
;*****************************************************************************
 
         PUBLIC DOFILL
         EXTRN  GETXY, GETNXT, GETBYT, RSTAT
         EXTRN  DRAWIT
         EXTRN  BNEXT, NDLNTY
 
;        EXTRN   ABSHL, NEGHL, CMPDH, CMPS, SUBDH, MIDH, DIDH, IMOD
 
 
NPT      DS     1                ;No. of points
XPMIN    DS     2                ;Polygon Min/Max Extents
YPMIN    DS     2
XPMAX    DS     2
YPMAX    DS     2
LNTY     DS     1
 
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;        Polygon (Fill Area)                                                 +
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
DOFILL
 
;----------------------------------------------------------------------------+
;        Take care of Attributes - Linestyle, color                          +
;        Save Current polyline linetype, linecolor                           +
;        Set linestyle to SOLID, color to Current Fill area color            +
;----------------------------------------------------------------------------+
 
         LDA    NDLNTY
         STA    LNTY
         XRA    A
         STA    NDLNTY
 
;----------------------------------------------------------------------------+
;        Save NPT                                                            +
;----------------------------------------------------------------------------+
 
         CALL   GETNXT
         INR    A
         STA    NPT
 
;----------------------------------------------------------------------------+
;        Output Polygon edge, Call Polyline routine                          +
;----------------------------------------------------------------------------+
 
         CALL   DRAWIT           ;Returns Pointer to next entry in <hl>
 
;----------------------------------------------------------------------------+
;        Get Polygon Minimum/Maximum extents                                 +
;----------------------------------------------------------------------------+
 
         CALL   GETXY            ;Get Minimum polygon extent xpmin, ypmin
         XCHG                    ;Returns <de> = xpmin, <bc> = ypmin,
         SHLD   XPMIN
         MOV    H,      B
         MOV    L,      C
         SHLD   YPMIN
 
                                 ;Get Maximum polygon extert from OBJLST
         CALL   GETXY            ;Returns <de> = xpmax, <bc> = ypmax,
         XCHG
         SHLD   XPMAX
         MOV    H,      B
         MOV    L,      C
         SHLD   YPMAX
 
;----------------------------------------------------------------------------+
;        Polygon outside of current Plot Strip ?                             +
;----------------------------------------------------------------------------+
 
 
;----------------------------------------------------------------------------+
;        Determine No. of fill lines for solid fill                          +
;----------------------------------------------------------------------------+
 
;----------------------------------------------------------------------------+
;        Restore Line style                                                  +
;----------------------------------------------------------------------------+
 
         LDA    LNTY
         STA    NDLNTY
 
         RET
 
 
 
         END
E 1
