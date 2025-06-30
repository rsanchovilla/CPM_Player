h32326
s 00111/00000/00000
d D 1.1 83/03/17 15:59:28 tes 1 0
c date and time created 83/03/17 15:59:28 by tes
e
u
4
U
t
T
I 1
 
         TITLE 'CELL ARRAY'
 
;*****************************************************************************
;                                                                            *
;        GDP      : Increment Object Count, Update XMAX and YMAX and         *
;                   Store Opcode, Px1, Py1, px2, py2 in Object List Buffer   *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  REVISION : NOV.  10, 1982      File "ZCELL.ASM"                           *
;                                                                            *
;  ZCELL                                                                     *
;                                                                            *
;  Description :                                                             *
;                                                                            *
;    1) Get Opcode from Contrl array and store in OBJLST Buffer              *
;                                                                            *
;    2) Increment OBJCNT                                                     *
;                                                                            *
;    3) Get Points from PTSIN array, Update Max/Min Plot extent XMAX,YMAX    *
;                                                                            *
;    4) Store the Points in OBJLST Buffer                                    *
;                                                                            *
;                                                                            *
;  Input :                                                                   *
;        contrl(1) - opcode =  11                                            *
;        ptsin     - corners of the Cell array in pixel space                *
;                    ptsin(1,2) = x1,y1                                      *
;                    ptsin(3,4) = x2,y2                                      *
;                                                                            *
;  Output :                                                                  *
;        contrl(3) - 0                                                       *
;                                                                            *
;  CALL ZCELL                                                                *
;                                                                            *
;  Program Variables :                                                       *
;        XMAX   - Maximum Plot extent x-axis                                 *
;        YMAX   - Maximum Plot extent y-axis                                 *
;        OBJCNT - Count of Object in the Object List Buffer                  *
;        OBJLST - Object List Buffer                                         *
;                                                                            *
;  Calls :                                                                   *
;        GETPT  - Get coord. from PTSIN array                                *
;        PUTPT  - Put coord. into OBJLST buffer                              *
;        PUTBYT - Puts byte into the OBJLST buffer                           *
;        GETMAX - Returns the larger value of the <hl>, <de> in <hl>         *
;                                                                            *
;*****************************************************************************
 
         PUBLIC ZCELL
         EXTRN  GETPT, PUTPT, CMPDH, GETMAX, PUTBYT
         EXTRN  CONTRL, INTIN, PTSIN, INTOUT, PTSOUT
         EXTRN  XMAX, YMAX, OBJCNT, OBJLST, PTADDR
 
;----------------------------------------------------------------------------+
;        Increment OBJCNT                                                    +
;        Store Opcode and Npt in OBJLST                                      +
;----------------------------------------------------------------------------+
 
ZCELL
;        Get Opcode, Contrl = Address of Contrl array
 
         LHLD   CONTRL
         MOV    A,      M        ;<A> = Opcode
 
         CALL   PUTBYT           ; Store the Cell opcode away
 
         LHLD   OBJCNT           ;Increment OBJCNT
         INX    H
         SHLD   OBJCNT
 
 
;----------------------------------------------------------------------------+
;        Get the vertices from PTSIN array                                   +
;        Update XMAX,YMAX and store the points in OBJLST                     +
;        On this device, only concerned with outlining the cell array, not   +
;            filling it.                                                     +
;----------------------------------------------------------------------------+
 
;        Get the Address of PTSIN array
 
;        <a> = No. of points in PTSIN
 
         LHLD   PTSIN
         SHLD   PTADDR
 
         MVI    A,    2          ; Get two points
ZPLL01   PUSH   PSW              ;Save Npt on stack
         CALL   GETPT            ;Returns <de> = X-coord.
         LHLD   XMAX
         CALL   GETMAX
         SHLD   XMAX             ;<HL> = XMAX
 
ZPLJ01   CALL   PUTPT            ;Store x-coord. into OBJLST
 
         CALL   GETPT            ;Returns <de> = Y-coord.
                                 ;<bc> = address of next point in PTSIN
         LHLD   YMAX
         CALL   GETMAX
         SHLD   YMAX             ;YMAX = <HL>
 
ZPLJ02   CALL   PUTPT            ;Store y-coord. into OBJLST, returns
                                 ;NXTOBJ points to next location in OBJLST
         POP    PSW
         DCR    A
         JNZ    ZPLL01           ;There are more points in PTSIN
 
         RET
 
         END
E 1
