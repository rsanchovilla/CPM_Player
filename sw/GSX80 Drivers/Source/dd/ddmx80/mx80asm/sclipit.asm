h31882
s 00497/00000/00000
d D 1.1 83/03/17 15:56:55 tes 1 0
c date and time created 83/03/17 15:56:55 by tes
e
u
4
U
t
T
I 1
 
         TITLE 'COHEN-SUTHERLAND CLIPPING ALGORITHM'
 
; ****************************************************************************
; *                                                                          *
; *  CLIPIT : Clip the endpoint of a line to the current Plot strip edge     *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : NOV. 04, 1982   File "CLIPIT.ASM"                              *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) SET LINE ENDPOINT POSITION FLAG FOR SWAPPING LINE DIRECTION        *
;         ROUTINE, ABOVE : 0 = POINTS INSIDE OR BELOW PLOT STRIP             *
;                          1 = Y2 IS ABOVE, -1= Y1 IS ABOVE STRIP            *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;                                                                            *
;  Clipit (x1,y1,x2,y2,rejected,topy,boty)                                   *
;                                                                            *
;  Function :                                                                *
;                                                                            *
;     Clip the endpoints of a line to the current Plot Strip window          *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;     TOPY, BOTY  : Y Coord. of the Top and Bottom edges of current Strip    *
;     X1,Y1,X2,Y2 : The endpoints of the line to be clipped                  *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;     X1,Y1,X2,Y2 : The new endpoints trimmed to the window                  *
;     ZERO STATUS : Flag indicating that the Line lies entirely              *
;                   outside of the plot strip window (REJECTED)              *
;                                                                            *
;  Process  :                                                                *
;                                                                            *
;     FILTER (y1,flag1)       ;Determine the position of the first end point *
;     FILTER (y2,flag2)       ;and the second point relative to the edges    *
;                                                                            *
;     REJECT (flag1,flag2)    ;Test to see if the line can be trivially      *
;                              rejected                                      *
;     if not rejected                                                        *
;        ACCEPT (flag1,flag2) ;Test to see if the line can be trivially      *
;                              accepted                                      *
;        if not accepted                                                     *
;           if (flag1 not 0)  ;Test to see if the first point needs to be    *
;               TRIM(x1,y1)   ;Trimmed                                       *
;           if (flag2 not 0)  ;Trim the second endpoint if needed            *
;               TRIM(x2,y2)                                                  *
;                                                                            *
;     FILTER returns                                                         *
;     position flag  bit 2 | 1 |                                             *
;                   ------------                                             *
;     point   above      1 | 0 |                                             *
;                   ------------ top y edge of strip                         *
;     point  inside      0 | 0 |                                             *
;                   ------------ bottom y edge of strip                      *
;     point   below      0 | 1 |                                             *
;                                                                            *
;----------------------------------------------------------------------------*
;                                                                            +
;  CALL CLIPIT                                                               +
;      X1,Y1,X2,Y2,TOPY,BOTY passed in meory                                 +
;  RET                                                                       +
;      new X1,Y1,X2,Y2 stored                                                +
;      zero = on, line clipped                                               +
;           = off,line rejected (lies outside window)                        +
;      above : 0=both points inside/below, 1=y2 above, -1=y1 above           +
;----------------------------------------------------------------------------+
 
         PUBLIC CLIPIT, FILTER
         EXTRN  ABSHL, NEGHL, SUBDH, CMPDH, MIDH, DIDH, MULFRA, DIVFRA
         EXTRN  X1, Y1, X2, Y2, TOPY, BOTY, DX, DY, XMAX
         EXTRN  FLG1, FLG2, ABOVE
 
DXDY     DS     02               ;Variables used to compute new x intersection
DIFFY    DS     02               ;diffy = y2 - y1
 
CLIPIT
;        Initialize above flag
 
         XRA    A
         STA    ABOVE
 
;----------------------------------------------------------------------------+
;        Filter y-coordinate of the first endpoint y1 against strip          +
;----------------------------------------------------------------------------+
 
         LHLD   Y1
 
         CALL   FILTER           ;Returns position flag flg1
         MOV    A,      B        ;flg1 : 0 = boty < y1 < topy
         STA    FLG1             ;      >0 = y1 above or below strip
 
;        Filter second endpoint
 
         LHLD   Y2
         CALL   FILTER           ;flg2 : 0 = boty < y2 < topy
         MOV    A,      B        ;      >0 = y2 above or below strip
         STA    FLG2
 
;----------------------------------------------------------------------------+
;        Test : line lies entirely outside strip & can be trivially rejected ?
;----------------------------------------------------------------------------+
 
         LDA    FLG1             ;reject line if (fg1 .and. flg2) NOT= 0
         ANA    B                ;<b> = flg2, <a> = flg1
 
;        TRIVIALLY REJECT LINE
 
         RNZ                     ;Zero flag off indicating line rejected
 
;----------------------------------------------------------------------------+
;        Test : line lies entirely inside strip & can be trivially accepted  ?
;----------------------------------------------------------------------------+
 
         LDA    FLG1             ;accept line if (flg1 .or. flg2) = 0
         ORA    B                ;<b> = flg2, <a> = flg1
 
;        TRIVIALLY ACCEPT LINE
 
         RZ                      ;Zero flag set indicating line accepted
 
;----------------------------------------------------------------------------+
;        Line can not be trivially accepted or rejected                      +
;        CLIP line to the new intersection point                             +
;----------------------------------------------------------------------------+
 
         LHLD   X2               ;dx = x2 - x1
         XCHG                    ;<de> = x2
         LHLD   X1               ;<hl> = x1
         CALL   SUBDH            ;<hl> = dx
;        CALL   ABSHL
         SHLD   DX
 
         LHLD   Y2               ;dy = y2 - y1
         XCHG                    ;<de> = y2
         LHLD   Y1               ;<hl> = y1
         CALL   SUBDH            ;<hl> = dy
;        CALL   ABSHL
         SHLD   DY
 
;----------------------------------------------------------------------------+
;        If point 2 is outside strip (flg2 NOT= 0), Trim x2,y2 to edge       +
;----------------------------------------------------------------------------+
 
         LDA    FLG2             ;Test flg2 = 0 ?
         ORA    A
         JZ     CLIJ01
 
;        TRIM X2,Y2 TO strip edge (toy, or boy)
 
         MOV    B,     A
         rar                     ;Y2 Above Plot Strip indicator in Bit 1
         STA    ABOVE            ;Set above flag for Y2
 
         MOV    A,     B
         LHLD   Y2
         XCHG
         LHLD   X2
         CALL   TRIM             ;Replace new y coordinate &
         SHLD   X2               ;Compute new x coordinate
         XCHG
         SHLD   Y2
 
;----------------------------------------------------------------------------+
;        If point x1,y1 is outside strip (flg1 NOT= 0), trim it to the edge  +
;----------------------------------------------------------------------------+
 
CLIJ01   LDA    FLG1             ;Test position flag = 0 ?
         ORA    A
         JZ     CLIPED           ;No trimming needed
 
;        Update the Above Flag for Y1
 
         MOV    B,      A
         RRC                     ;Above Plot Strip flag in Bit 1
         JC     CLIJ02
         MVI    A,      0FFH     ;Y1 is Above Plot Strip
                                 ;set Above = -1, if Y1 is above, then Y2
         JMP    CLIJ03           ;must not be above, only one endpoint
                                 ;should be above the Plot Strip, never
                                 ;both
CLIJ02   ;Y1 is Below Plot Strip, set ABOVE = 1
 
         MVI    A,      01H
CLIJ03
         STA    ABOVE
         MOV    A,      B        ;Restore FLag
 
;        Trim the point to strip edge
 
         LHLD   Y1
         XCHG
         LHLD   X1
         CALL   TRIM             ;Compute new x coordinate &
         SHLD   X1               ;Replace new y coordinate
         XCHG
         SHLD   Y1
 
CLIPED   XRA    A                ;Set zero flag to indicate line accepted
         RET
 
 
; ****************************************************************************
; *  FILTER : Determine whether Y lies above, inside or below the            *
; *           current Plot Strip edges (toy, boy)                            *
; ****************************************************************************
;                                                                            *
;  Filter (y, topy, boty, flag)                                              *
;                                                                            *
;  Input  : y    = the y-coordinate of point been tested                     *
;           topy = the y-coordinate of top edge                              *
;           boty = the y-coordinate of bottom edge                           *
;                                                                            *
;  Output : flag = indicate the relative position of y                       *
;                                                                            *
;  Process :                                                                 *
;        flag (bit 2) = sign bit of (topy - y)                               *
;        flag (bit 1) = sign bit of (y - boty)                               *
;                                                                            *
;                                                                            *
;     FILTER returns                                                         *
;     position flag  bit 2  1                                                *
;                                                                            *
;     point   above      1 | 0 |                                             *
;                   ------------ top y edge of strip                         *
;     point  inside      0 | 0 |                                             *
;                   ------------ bottom y edge of strip                      *
;     point   below      0 | 1 |                                             *
;                                                                            *
;*****************************************************************************
 
;  CALL FILTER
;    <HL> = Y
;     TOPY, BOTY passed in memory
;  RET
;    <B>  = FLAG
 
FILTER
 
;        Test Y against top edge TOPY
 
         MVI    B,      0        ;Initialize flag = 0 (inside)
         XCHG
         LHLD   TOPY             ;<hl> = y
         XCHG                    ;<de> = topy
         CALL   CMPDH            ;Carry set = topy < y
         JNC    FILJ01           ;Carry off = topy > y
 
;        Set flag to indicate y above top edge
 
         INR    B
         INR    B                ;Set bit 2
         RET
 
;        Test y against bottom edge : boty
 
FILJ01   XCHG                    ;<de> = y
         LHLD   BOTY             ;<hl> = boty
         CALL   CMPDH            ;Carry set = y < boty
         RNC                     ;Carry off = y > boty : point inside strip
 
;        Set flag to indicate y below bottom edge
 
         INR    B                ;Set bit 1
         RET
 
         page
; ****************************************************************************
; *  TRIM : Trim endpoint of line to the edge of strip                       *
; ****************************************************************************
;                                                                            *
; Trim (flag, x, y, topy, boty)                                              *
;                                                                            *
; Input  :                                                                   *
;        flag : 2 = point above, 0 = point inside, 1 = point below           *
;        x, y : coordinate of point                                          *
;        topy : top edge of strip                                            *
;        boty : bottom edge of strip                                         *
;                                                                            *
; Outpyt :                                                                   *
;        x, y : new x,y coordinate trimmed to inside the strip               *
;                                                                            *
; Process :                                                                  *
;        if (flag = above)                                                   *
;            newy = topy + 1                                                 *
;        else                                                                *
;            newy = boty                                                     *
;        compute new x intersection                                          *
;        dxdy = (x2-x1) / (y2-y1)                                            *
;        newx = x + dxdy * (newy - oldy)                                     *
;                                                                            *
;----------------------------------------------------------------------------*
 
;  CALL TRIM
;    <HL> = OLDX
;    <DE> = OLDY
;    <A>  = FLAG
;     TOPY, BOTY passed in memory
;  RET
;    <DE> = NEWX
;    <HL> = NEWY
 
 
DFRAC    DS     01
 
TRIM
         MOV    B,     H         ;Put oldx in <bc>
         MOV    C,     L
 
;        Point above strip ?
 
         RRC                     ;bit 1 set : point below strip
 
;        Set new y to top edge of strip
 
         LHLD   TOPY
         INX    H
         JNC    TRIJ01
 
;        Else set new y to bottom edge of strip
 
         LHLD   BOTY
 
;        Compute the new x intersection at new y
;        newx = oldx + dxdy * (newy - oldy)
 
TRIJ01
         PUSH   PSW              ;Save flag
         PUSH   B                ;Save oldx
         PUSH   H                ;save oldy
         XCHG                    ;<de> = new y
                                 ;<hl> = old y
         CALL   SUBDH            ;<hl> = newy - oldy
         SHLD   DIFFY            ;Save diffy
 
;----------------------------------------------------------------------------+
;        Get newx using integer arithmetics AND handles overflow correctly   +
;        dx = (x2-x1), dy = (y2-y1), diffy = (newy - oldy)                   +
;        Q1 = Quotient  (dx/dy)                                              +
;        R1 = Remainder (dx/dy)                                              +
;      FRAC = Fraction  (r1/dy)                                              +
;       QX1 = q1 * diffy                                                     +
;       RX1 = frac * diffy                                                   +
;      NEWX = oldx + (qx1 + rx1)                                             +
;----------------------------------------------------------------------------+
 
         LHLD   DX
         XCHG
         LHLD   DY
;*
;*       Save sign of integer part (Q1) : sgn(Q1) = sgn(DX) xor sgn(DY)
;*
         MOV    A,      H
         XRA    D
         PUSH   PSW              ;Save sign of Integer part
 
         CALL   DIDH             ;<hl> = Q1, <bc> = R1
 
         PUSH   H                ;Save Q1
         LXI    H,      0
         MOV    A,      B
         ORA    C                ;R1 = 0 ?
         JNZ    TRIJ07
         PUSH   H                ;Save Integer Fraction value on stack
         JMP    TRIJ03           ;Fraction part = 0
 
;        Get Fraction Part
 
TRIJ07   MOV    D,      B
         MOV    E,      C
         LHLD   DY
         XCHG                    ;<hl> = R1
         MOV    B,      D
         MOV    C,      E        ;<bc> = DY
         CALL   DIVFRA           ;Returns FRAC in <de>
         PUSH   D                ;Save Integer Fraction value on stack
 
         LHLD   DIFFY            ;Get diffy
         CALL   MULFRA           ;<hl> = RX1 : FRAC * DIFFY
 
TRIJ03
         POP    B                ;Get Integer fraction from stack
         POP    D                ;Get Q1
         MOV    A,     D
         ORA    E                ;Is dx/dy < 0.2 ?
         MVI    A,     034H
         JNZ    TRIJ08
         CMP    B
         JM     TRIJ08
         XRA    A
TRIJ08
         STA    DFRAC            ;dfrac = 0, if dx/dy < 0.2
                                 ;dfrac = 34h, if dx/dy > 0.2
 
         POP    PSW              ;Get sign flag of Q1
         PUSH   H                ;Put RX1 on stack
         LHLD   DIFFY
         MOV    A,      H        ;Update Sign flag of QX1
         RLC
         JP     TRIJ06
         CMC                     ;If Q1 < 0, sign(QX1) = Negate sign(DIFFY)
TRIJ06   PUSH   PSW              ;Stack it
         CALL   MIDH
 
;*       MOV    A,      D
;*       ORA    E                ;Q1 = 0 ?
;*       LHLD   DIFFY
;*       JZ     TRIJ04
;*       CALL   MIDH             ;<hl> = Q1 * DIFFY
;*       JMP    TRIJ05
;*
;*TRIJ04   POP    D                ;Integer part (QX1) = 0
;*         POP    PSW              ;Must Update the Sign bit of integer part
;*         XRA    H
;*         PUSH   PSW              ;sign bit of integer part
;*         PUSH   D                ;sng(QX1) = sgn(Q1) xor sgn(DIFFY)
;*         LXI    H,      0        ;Interget part (QX1) = 0
;*
;*TRIJ05   POP    D                ;Get RX1
;*         XCHG
;*         POP    PSW              ;Check the sign bit of integer part
;*         CM     NEGHL            ;Negate fraction part if minus
;*
;----------------------------------------------------------------------------+
;*       Integer and Fraction calculations are each done independant of      +
;*       their sign parts                                                    +
;----------------------------------------------------------------------------+
 
         CALL   ABSHL            ;Use Unsigned Integer Part
         XCHG
         POP    H                ;Get RX1 from stack
         XTHL                    ;<de> = QX1, <hl> = RX1
         DAD    D                ;<hl> = QX1 + RX1
 
         POP    PSW              ;Check the sign bit of integer part
         CC     NEGHL            ;Negate if sign(QX1) = minus
 
         POP    B                ;Unstack new y
         POP    D                ;Unstack old x
         DAD    D                ;<hl> = newx = oldx + QX1 + RX1
         POP    PSW              ;Check new y flag
         XCHG                    ;Put newx in <de>
         JC     TRIJ10
 
;        If newy is topy, adjust newy and newx to within plot strip
;        because topy + 1 is used to compute newx
 
         DCX    B                ;Readjust newy to equal topy
 
;        Check sign(dx/dy) to adjust newx by 1, optimize new x, y to
;        eliminate zigzaging of rasterization as a result of clipping to
;        Plot Strip edge
 
 
         LDA    DFRAC
         ORA    A
         JZ     TRIJ10           ;If dx/dy < 0.2, new x not changed
         LHLD   DX
         MOV    A,     H
         ORA    L
         JZ     TRIJ10           ;If dx = 0, newx not changed
         MOV    A,     H
         LHLD   DY               ;Check sign(dx/dy)
         XRA    H
         JM     TRIJ09
         DCX    D                ;If sign > 0, newx = newx - 1
         JMP    TRIJ10           ;Return
TRIJ09
         INX    D                ;If sign < 0, newx = newx + 1
 
;        Clip newx to within 0 and XMAX
 
TRIJ10   XRA    A
         ORA    D
         JP     TRIJ11
         LXI    D,     0         ;If newx < 0, then newx = 0
TRIJ11
         LHLD   XMAX
         CALL   CMPDH
         JNC    TRIJ99           ;If newx >= XMAX, then newx = XMAX
         XCHG                    ;newx < XMAX, no change
 
TRIJ99   MOV    D,     B         ;<de> = new y
         MOV    E,     C
 
         RET
 
 
         END
 
 
 
E 1
