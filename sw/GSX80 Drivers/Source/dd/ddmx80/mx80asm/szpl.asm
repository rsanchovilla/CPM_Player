h15077
s 00145/00000/00000
d D 1.1 83/03/17 16:00:20 tes 1 0
c date and time created 83/03/17 16:00:20 by tes
e
u
4
U
t
T
I 1
 
 
         TITLE 'POLYLINE'
 
;*****************************************************************************
;                                                                            *
;        POLYLINE : Increment Object Count, Update XMAX and YMAX and         *
;                   Store Opcode, Npt, Px and Py in Object List Buffer       *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION : NOV.  08, 1982      File "ZPL.ASM"     Version : 1.2           *
;                                                                            *
;  Zpl (npt, px, py)                                                         *
;                                                                            *
;  Description :                                                             *
;                                                                            *
;    1) Get Opcode and Npt from Contrl array and store in OBJLST Buffer      *
;                                                                            *
;    2) Increment OBJCNT                                                     *
;                                                                            *
;    3) Get Points from PTSIN array, Update Max/Min Plot extent XMAX,YMAX    *
;                                                                            *
;    4) Store the Points in OBJLST Buffer, Update the BNEXT                  *
;                                                                            *
;    5) Store the New BNEXT  when all points are stored                      *
;                                                                            *
;                                                                            *
;  Input :                                                                   *
;        contrl(1) - opcode =  6                                             *
;        contrl(2) - no. of (x,y) pairs in polyline (npt)                    *
;        ptsin     - array of coordinates of polyline in pixel space         *
;                    ptsin(1,2) = x1,y1                                      *
;                    ptsin(3,4) = x2,y2                                      *
;                      .                                                     *
;                      .                                                     *
;                    ptsin(2npt-1,2npt) = x,y of last point                  *
;                                                                            *
;  Output :                                                                  *
;        contrl(3) - 0                                                       *
;                                                                            *
;  CALL ZPL                                                                  *
;        <DE> = Address of Contrl array                                      *
;                                                                            *
;  Program Variables :                                                       *
;        XMAX   - Maximum Plot extent x-axis                                 *
;        YMAX   - Maximum Plot extent y-axis                                 *
;        OBJCNT - Count of Object in the Object List Buffer                  *
;        OBJLST - Object List Buffer                                         *
;        bnext  - NEXT OBJLST Buffer location pointer                        *
;                                                                            *
;  Calls :                                                                   *
;        GETPT  - Get coord. from PTSIN array                                *
;        PUTPT  - Put coord. into OBJLST buffer                              *
;        GETMAX - Returns the larger value of the <hl>, <de> in <hl>         *
;                                                                            *
;*****************************************************************************
 
         PUBLIC ZPL
         EXTRN  GETPT, PUTPT, CMPDH, GETMAX, PUTBYT, PTADDR
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT
         EXTRN  XMAX, YMAX, OBJCNT, OBJLST, BNEXT
 
NPT      DS     1
 
;----------------------------------------------------------------------------+
;        Increment OBJCNT                                                    +
;        Store Opcode and Npt in OBJLST                                      +
;----------------------------------------------------------------------------+
 
ZPL
         LHLD   OBJCNT           ;Increment OBJCNT
         INX    H
         SHLD   OBJCNT
 
;        Get Opcode, Contrl = Address of Contrl array
 
         LHLD   CONTRL
         MOV    A,      M         ;<A> = Opcode
 
;        LHLD   NEXOBJ
;        MOV    M,      A        ;Store it into OBJLST
;
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
;        Update XMAX,YMAX and store the points in OBJLST                     +
;----------------------------------------------------------------------------+
 
;        Get the Address of PTSIN array
 
;        LHLD   PBPTR            ;Parameter Block Address Pointer
;        LXI    D,      4        ;Third entry points to PTSIN array
;        DAD    D
 
;        <a> = No. of points in PTSIN
 
         LHLD   PTSIN
         SHLD   PTADDR           ;Address of PTSIN array
         LDA    NPT
 
ZPLL01   PUSH   PSW              ;Save Npt on stack
         CALL   GETPT            ;Returns <de> = Next entry in PTSIN, X-coord.
 
         LHLD   XMAX
         CALL   GETMAX
         SHLD   XMAX             ;<HL> = XMAX
 
ZPLJ01   CALL   PUTPT            ;Store x-coord. into OBJLST
 
         CALL   GETPT            ;Returns <de> = Y-coord.
 
         LHLD   YMAX
         CALL   GETMAX
         SHLD   YMAX             ;YMAX = <HL>
 
ZPLJ02   CALL   PUTPT            ;Store y-coord. into OBJLST, returns
                                 ;BNEXT  points to next location in OBJLST
         POP    PSW
         DCR    A
         JNZ    ZPLL01           ;There are more points in PTSIN
 
         RET
 
 
         END
 
 
 
 
E 1
