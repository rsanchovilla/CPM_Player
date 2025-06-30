h47819
s 00216/00000/00000
d D 1.1 83/03/17 15:59:55 tes 1 0
c date and time created 83/03/17 15:59:55 by tes
e
u
4
U
t
T
I 1
 
 
         TITLE 'ZFA : FILL AREA (POLYGON)'
 
;*****************************************************************************
;                                                                            *
;        POLYGON  : Increment Object Count, Update XMAX and YMAX and         *
;                   Store Opcode, Npt, Px ,Py and Polygon Minimum, Maximum   *
;                   extents in the Object List Buffer                        *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION : NOV. 10, 1982   File : "ZFA.ASM"     Version 1.0               *
;                                                                            *
;  ZFA (npt, px, py)                                                         *
;                                                                            *
;  Description :                                                             *
;                                                                            *
;    1) Get Opcode and Npt from Contrl array and store in OBJLST Buffer      *
;                                                                            *
;    2) Increment OBJCNT                                                     *
;                                                                            *
;    3) Get Points from PTSIN array, Update Max/Min Plot extent XMAX,YMAX    *
;                                                                            *
;    4) Store the Points in OBJLST Buffer, repeat the first point to close   *
;                                                                            *
;    5) Store the Max/Min Polygon extents in OBJLST Buffer                   *
;                                                                            *
;                                                                            *
;  Input :                                                                   *
;        contrl(1) - opcode =  9                                             *
;        contrl(2) - no. of vertices in polygon (npt)                        *
;        ptsin     - array of coordinates of polygon in pixel space          *
;                    ptsin(1,2) = x1,y1                                      *
;                    ptsin(3,4) = x2,y2                                      *
;                      .                                                     *
;                      .                                                     *
;                    ptsin(2npt-1,2npt) = x,y of last point                  *
;                                                                            *
;  Output :                                                                  *
;        contrl(3) - 0                                                       *
;                                                                            *
;  CALL ZFA                                                                  *
;        <DE> = Address of Contrl array                                      *
;                                                                            *
;  Program Variables :                                                       *
;        XMAX   - Maximum Plot extent x-axis                                 *
;        YMAX   - Maximum Plot extent y-axis                                 *
;        XPMAX  - Maximum Polygon extent                                     *
;        YPMAX  - Maximum Polygon extent                                     *
;        XPMIN  - Minimum Polygon extent                                     *
;        YPMIN  - Minimum Polygon extent                                     *
;        OBJCNT - Count of Object in the Object List Buffer                  *
;        OBJLST - Object List Buffer                                         *
;        BNEXT  - Next OBJLST Buffer location pointer                        *
;                                                                            *
;*****************************************************************************
 
         PUBLIC ZFA
         EXTRN  CMPDH, GETPT, PUTPT, PUTBYT, GETMAX, GETMIN
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT, PTADDR
         EXTRN  XMAX, YMAX, OBJCNT, OBJLST, BNEXT
 
 
;        Initialize Minimum and Maximum Polygon extents
 
XPMIN    DW     7FFFH
YPMIN    DW     7FFFH
XPMAX    DW     0
YPMAX    DW     0
NPT      DS     1
XP0      DS     2
YP0      DS     2
IST      DS     1
 
;----------------------------------------------------------------------------+
;        Increment OBJCNT                                                    +
;        Store Opcode and Npt in OBJLST                                      +
;----------------------------------------------------------------------------+
 
ZFA
         LHLD   OBJCNT           ;Increment OBJCNT
         INX    H
         SHLD   OBJCNT
 
;        Get Opcode, CONTRL = Address of Contrl array
 
         LHLD   CONTRL
         MOV    A,      M        ;<A> = Opcode
 
;        LHLD   NXTOBJ
;        MOV    M,      A        ;Store it into OBJLST
;        INX    H                ;Next location in OBJLST
 
         CALL   PUTBYT
 
         LHLD   CONTRL
         INX    H
         INX    H
         MOV    A,      M        ;<A> = Npt
 
;        MOV    M,      A        ;Store it
;        INX    H
;        SHLD   NXTOBJ           ;Point to Next location in OBJLST
 
         STA    NPT
         CALL   PUTBYT
 
;----------------------------------------------------------------------------+
;        Get the vertices from PTSIN array                                   +
;        Update Maximum/Minimum extents and store the points in OBJLST       +
;----------------------------------------------------------------------------+
 
;        Get the Address of PTSIN array
 
;        LHLD   PBPTR            ;Parameter Block Address Pointer
;        LXI    D,      4        ;Third entry points to PTSIN array
;        DAD    D
;        MOV    C,      M
;        INX    H
;        MOV    B,      M        ;<bc> = address of PTSIN array
 
;        <a> = No. of points in PTSIN
 
         LHLD   PTSIN
         SHLD   PTADDR
         XRA    A
         STA    IST
         LDA    NPT
 
ZFAL01   PUSH   PSW              ;Save Npt on stack
         CALL   GETPT            ;Returns <de> = X-coord.
         LDA    IST
         ORA    A
         JNZ    ZFAJ10
         MOV    H,     D
         MOV    L,     E
         SHLD   XP0
 
ZFAJ10
         LHLD   XMAX
         CALL   GETMAX
         SHLD   XMAX
ZFAJ01
         LHLD   XPMAX            ;Maximum Polygon X extent
         CALL   GETMAX
         SHLD   XPMAX            ;XPMAX = new X-coord.
ZFAJ02
         LHLD   XPMIN            ;Minimum Polygon X extent
         CALL   GETMIN
         SHLD   XPMIN            ;XPMIN = new X-coord.
ZFAJ03
         CALL   PUTPT            ;Store x-coord. into OBJLST
 
         CALL   GETPT            ;Returns <de> = Y-coord.
 
         LDA    IST
         ORA    A
         JNZ    ZFAJ11
         INR    A
         STA    IST
         MOV    H,     D
         MOV    L,     E
         SHLD   YP0
 
ZFAJ11   LHLD   YMAX
         CALL   GETMAX
         SHLD   YMAX             ;YMAX = Y-coord.
ZFAJ04
         LHLD   YPMAX            ;Maximum Polygon Y extent
         CALL   GETMAX
         SHLD   YPMAX            ;YPMAX = new Y-coord.
ZFAJ05
         LHLD   YPMIN            ;Minimum Polygon Y extent
         CALL   GETMIN
         SHLD   YPMIN            ;YPMIN = new Y-coord.
ZFAJ06
         CALL   PUTPT            ;Store y-coord. into OBJLST, returns
                                 ;NXTOBJ points to next location in OBJLST
         POP    PSW
         DCR    A
         JNZ    ZFAL01           ;There are more points in PTSIN
 
;        Store the First point into the Polygon Point list, so the
;        draw line routine will close the polygon outline
 
         LHLD   XP0
         XCHG
         CALL   PUTPT
         LHLD   YP0
         XCHG
         CALL  PUTPT
 
;        Store Max/Min Polygon extent in OBJLST
 
         LHLD   XPMIN
         XCHG
         CALL   PUTPT
         LHLD   YPMIN
         XCHG
         CALL   PUTPT
         LHLD   XPMAX
         XCHG
         CALL   PUTPT
         LHLD   YPMAX
         XCHG
         CALL   PUTPT
 
         RET
 
 
         END
 
 
 
 
E 1
