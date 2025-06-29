h05370
s 00183/00000/00000
d D 1.1 83/03/17 16:00:25 tes 1 0
c date and time created 83/03/17 16:00:25 by tes
e
u
4
U
t
T
I 1
 
 
         TITLE 'PHASE I : POLYMAKER '
 
;*****************************************************************************
;                                                                            *
;      POLYMARKER : Increment Object Count, Update XMAX and YMAX and         *
;                   Store Opcode, Npt, Px and Py in Object List Buffer       *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION : NOV.  08, 1982      File "ZPM.ASM"    Version 1.0              *
;                                                                            *
;  Zpm (npt, px, py)                                                         *
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
;        contrl(2) - no. of (x,y) pairs in polymarker (npt)                  *
;        ptsin     - array of coordinates of polymarker in pixel space       *
;                    ptsin(1,2) = x1,y1                                      *
;                    ptsin(3,4) = x2,y2                                      *
;                      .                                                     *
;                      .                                                     *
;                    ptsin(2npt-1,2npt) = x,y of last point                  *
;                                                                            *
;  Output :                                                                  *
;        contrl(3) - 0                                                       *
;                                                                            *
;  CALL ZPM                                                                  *
;                                                                            *
;  Program Variables :                                                       *
;        XMAX   - Maximum Plot extent x-axis                                 *
;        YMAX   - Maximum Plot extent y-axis                                 *
;        OBJCNT - Count of Object in the Object List Buffer                  *
;        OBJLST - Object List Buffer                                         *
;        BNEXT  - NEXT OBJLST Buffer location pointer                        *
;                                                                            *
;  Calls :                                                                   *
;        GETPT  - Get coord. from PTSIN array                                *
;        PUTPT  - Put coord. into OBJLST buffer                              *
;        GETMAX - Returns the larger value of the <hl>, <de> in <hl>         *
;                                                                            *
;*****************************************************************************
 
         PUBLIC ZPM
 
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT, PTADDR
         EXTRN  XMAX, YMAX, OBJCNT, OBJLST, BNEXT
         EXTRN  PMKSZ
 
         EXTRN  GETPT, PUTPT, CMPDH, SUBDH, GETMAX, PUTBYT
 
;----------------------------------------------------------------------------+
;        Increment OBJCNT                                                    +
;        Store Opcode and Npt in OBJLST                                      +
;----------------------------------------------------------------------------+
 
ZPM
         LHLD   OBJCNT           ;Increment OBJCNT
         INX    H
         SHLD   OBJCNT
 
;        Get Opcode, Contrl = Address of Contrl array
 
         LHLD   CONTRL
         MOV    A,      M         ;<A> = Opcode
 
;        LHLD   NXTOBJ
;        MOV    M,      A        ;Store it into OBJLST
;
;        INX    H                ;Next location in OBJLST
 
         CALL   PUTBYT
 
         LHLD   CONTRL
         INX    H
         INX    H
         MOV    A,      M        ;<A> = Npt
         PUSH   PSW
 
;        MOV    M,      A        ;Store it
;        INX    H
;        SHLD   NXTOBJ           ;Point to Next location in OBJLST
 
         CALL   PUTBYT
 
;----------------------------------------------------------------------------+
;        Store the Polymaker size (NDMKSZ * 8) in OBJLST                     +
;----------------------------------------------------------------------------+
;***
;***     LDA    PMKSZ
;***     CALL   PUTBYT
;***
;----------------------------------------------------------------------------+
;        Get the vertices from PTSIN array                                   +
;        Update XMAX,YMAX and store the points in OBJLST                     +
;----------------------------------------------------------------------------+
 
;        Get the Address of PTSIN array
 
;        LHLD   PBPTR            ;Parameter Block Address Pointer
;        LXI    D,      4        ;Third entry points to PTSIN array
;        DAD    D
 
         LHLD   PTSIN
         SHLD   PTADDR           ;Address of PTSIN array
 
         POP    PSW              ;Get no. of Points
ZPML01   PUSH   PSW              ;Save Npt on stack
         CALL   GETPT            ;Returns <de> = X-coord. from PTSIN
 
;----------------------------------------------------------------------------+
;        Adjust X, Y to Lower Left Corner position                           +
;        Update XMAX, YMAX                                                   +
;----------------------------------------------------------------------------+
 
         LDA    PMKSZ
         RRC                     ;Half Marker size
         MOV    L,      A
         MVI    H,      0
         PUSH   H
         PUSH   D
 
         CALL   SUBDH            ;X = X - (PMKSZ / 2)
         XCHG
         CALL   PUTPT            ;Store x-coord. into OBJLST
 
         POP    D                ;<DE> = X
         POP    H                ;<HL> = PMKSZ
         DAD    D                ;X2 = X + (PMKSZ / 2)
         XCHG
 
         LHLD   XMAX
         CALL   GETMAX           ;Update Xmax
         SHLD   XMAX
 
         CALL   GETPT            ;Returns <de> = Y-coord.
 
         LDA    PMKSZ
         RRC                     ;Half Marker size
         MOV    L,      A
         MVI    H,      0
         PUSH   H
         PUSH   D
 
         CALL   SUBDH            ;Y = Y - (PMKSZ / 2)
         XCHG
         CALL   PUTPT            ;Store Y-coord. into OBJLST
 
         POP    D                ;<DE> = Y
         POP    H                ;<HL> = PMKSZ / 2
         DAD    D                ;Y2 = Y + PMKSZ / 2
         XCHG
 
         LHLD   YMAX
         CALL   GETMAX
         SHLD   YMAX             ;YMAX = <HL>
 
         POP    PSW
         DCR    A
         JNZ    ZPML01           ;There are more points in PTSIN
 
         RET
 
 
         END
 
 
 
 
E 1
