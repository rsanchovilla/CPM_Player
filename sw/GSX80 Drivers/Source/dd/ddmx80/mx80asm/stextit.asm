h09711
s 00397/00000/00000
d D 1.1 83/03/17 15:59:14 tes 1 0
c date and time created 83/03/17 15:59:14 by tes
e
u
4
U
t
T
I 1
 
        TITLE  'MAP CLIPPED CHRACTER CELL TO BITMAP BASE ON SIZE AND ROTATION'
 
;******************************************************************************
;                                                                             *
;        TEXTIT : Map clipped character cell to bitmap base on size and       *
;                 rotation                                                    *
;                                                                             *
;******************************************************************************
;                                                                             *
;        REVISION : NOV. 09, 1982   FILE "TEXTIT.ASM"   File : "TEXTIT.ASM"   *
;                                                                             *
;  Input :                                                                    *
;                                                                             *
;******************************************************************************
 
 
         PUBLIC TEXTIT, CLIPTX, CSIZE
         EXTRN  NEGHL
         EXTRN  FILTER, GETADR, SBIT, ADDRXY, SETBIT
 
         EXTRN  BITMAP, NBYT, NBIT, XW, TOPY, BOTY
;        EXTRN  I0, I7, J0, J7, YSTRT
         EXTRN  X1, Y1, X0, Y0, Y2, XDIR, YDIR, FLG1, FLG2
         EXTRN  CHRPTR, CBUF, CHROFF, FLGS
 
CSIZE    DS     01               ;Character Cell Size factor (1-12)
 
;----------------------------------------------------------------------------+
;        Draw (raster scan) character cell to bitmap                         +
;----------------------------------------------------------------------------+
 
TEXTIT
 
;----------------------------------------------------------------------------+
;        Get X1, Y1                                                          +
;----------------------------------------------------------------------------+
 
         LHLD   Y1
         SHLD   Y0
         LHLD   X1               ;<hl> = x
         SHLD   X0
 
;----------------------------------------------------------------------------+
;        Get current byte from Character Buffer = CBUF(chrptr)               +
;----------------------------------------------------------------------------+
 
         LHLD   CHRPTR           ;CBUF Address pointer to First character row
 
;----------------------------------------------------------------------------+
;        For each Character, scan i-row of bytes (0-7)                       +
;        Do i =  0,  7                                                       +
;----------------------------------------------------------------------------+
 
TXTI00
         MVI    A,     07        ;Character Row Loop Counter (0-7)
TXTI01
         PUSH   PSW
         PUSH   H                ;Current Character byte pointer
         MOV    B,     M         ;Get the byte from Character Buffer
 
         LDA    CSIZE            ;Get Current Size Factor
 
;----------------------------------------------------------------------------+
;        Repeat each row for size                                            +
;        Do i-repeat = 1, size                                               +
;----------------------------------------------------------------------------+
 
TXTIR1   PUSH   PSW              ;Stack Repeat Row count
         PUSH   B                ;Save Current byte
 
;----------------------------------------------------------------------------+
;        for each byte, scan the bit pattern (j-column : 0 - 5)              +
;        Do j =  0,  5                                                       +
;----------------------------------------------------------------------------+
 
TXTJ01
         MVI    A,     05        ;Column loop counter
         PUSH   PSW              ;Stack j
 
TXTJ02
         MOV    A,     B         ;Put Current byte in <a>
         MVI    B,     0         ;Setflg = 0
         RRC
         JNC    TXTJR0
         INR    B                ;<b> = Setflg, if setflg = 1, Set the bit
 
;----------------------------------------------------------------------------+
;        Repeat each column for size                                         +
;        Do j-repeat = 1, size                                               +
;----------------------------------------------------------------------------+
 
TXTJR0
         PUSH   PSW              ;Stack Current byte
         LDA    CSIZE            ;Column repeat loop count
TXTJR1
         PUSH   PSW              ;Stack j-repeat loop count
         XRA    A                ;Check Setflg
         ORA    B
         PUSH   B                ;Stack Setflg
 
;----------------------------------------------------------------------------+
;        If Setflg = 1, Set bit at X, Y                                      +
;----------------------------------------------------------------------------+
 
         CNZ    SBIT
 
;----------------------------------------------------------------------------+
;        Update x,y coordinate for next pixel, based on rotation             +
;----------------------------------------------------------------------------+
 
         LDA    FLGS
         RRC
         JNC    TXTJR2
 
;        Rotation = 0,180 : Move y-coord. to next pixel
 
         CALL   MOVEY
         JMP    TXTJR3
 
;        Rotation = 90, 270 : move x-coord. to next pixel
 
TXTJR2
         CALL   MOVEX
TXTJR3
         POP    B                ;Unstack Setflg
         POP    PSW              ;Unstack j-repeat count
         DCR    A                ;Decrement J-repeat count
         JNZ    TXTJR1
 
;        Done one bit, Repeat until all bits in i-row (current byte) mapped
 
         POP    B                ;Unstack current byte
         POP    PSW              ;Unstack column loop count j
         DCR    A
         JM     TXTJ09
         PUSH   PSW              ;Stack j
         JMP    TXTJ02
 
;----------------------------------------------------------------------------+
;        Update x,y coord. for next row of pixels                            +
;----------------------------------------------------------------------------+
 
TXTJ09
         LDA    FLGS             ;Check chgxy flag
         RRC                     ;carry set = 0, 180 rotation
         JNC    TXTIR2
 
;        0, 180 rotation, Move x-coord. for next row of pixels
 
         CALL   MOVEX
 
;        Reset  y-coord. to beginning of row
 
         LHLD   Y1
         SHLD   Y0
         JMP    TXTIR3
 
;        90, 270 rotation, Move y-corrd. for next row of pixels
 
TXTIR2
         CALL   MOVEY
 
;        Reset  x-coord. to beginning of row
 
         LHLD   X1
         SHLD   X0
 
;        Done one row, repeat same row for size
 
TXTIR3
         POP    B                ;Unstack current byte
         POP    PSW              ;Unstack i-repeat count
         DCR    A
         JNZ    TXTIR1
 
;----------------------------------------------------------------------------+
;        Repeat until all bytes in character cell mapped                     +
;----------------------------------------------------------------------------+
 
         POP    D                ;Unstack current byte address pointer
         POP    PSW              ;Unstack i loop count
         DCR    A                ;Done ?
         JM     TXTI09
 
;----------------------------------------------------------------------------+
;        Get next byte from Chracter Buffer                                  +
;----------------------------------------------------------------------------+
 
         XCHG
         INX    H                ;Next row (byte) address pointer
         JMP    TXTI01
 
TXTI09
         RET
 
         PAGE
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  MOVEX : MOVE X-COORD. IN THE DIRECTION OF XDIR                          ;
; ;                                                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Movex (xdir,nbyt,nbit)                                                    ;
;                                                                            ;
;  Function : Move x coordinate pixel by +-1                                 ;
;                                                                            ;
;  Input    :                                                                ;
;             X    - X coordinate                                            ;
;             XDIR - Direction of move (-1,   +1)                            ;
;                                                                            ;
;  Output   :                                                                ;
;             NEWX - Newx = x +/- xdir                                       ;
;                                                                            ;
;  Calls    : NEGHL - Complement HL register pair                            ;
;             ABSHL - Absolute HL                                            ;
;                                                                            ;
;----------------------------------------------------------------------------;
;
;  CALL MOVEX
;    X0 Passed in memory
;  RET
;    Updated X stored in memory
;
MOVEX
 
;        Get Xdir, X
 
         LHLD   X0
 
;        Check XDIR the move direction flag
 
         LDA    XDIR
         ANA    A
         JM     MOVX01           ;Xdir = -1,Decrement X
 
;        If Xdir = 1 then X = X + 1
 
         INX    H                ;X = X + 1
         JMP    MOVX02
 
;        else Xdir = -1
 
MOVX01   DCX    H                ;X = X - 1
 
MOVX02   SHLD   X0               ;Store NEWX
 
         RET
;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  MOVEY : MOVE Y IN THE DIRECTION OF YDIR                                 ;
; ;                                                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Movey (Ydir, Y)                                                           ;
;                                                                            ;
;  Function : Move y coordinate pixel by +-1                                 ;
;                                                                            ;
;  Input    :                                                                ;
;             Y    - Y Coordinate          (byte position : y coordinate)    ;
;             YDIR - Direction of move (-1, 0 +1)                            ;
;                                                                            ;
;  Output   :                                                                ;
;             NEWY - New Y Coordinate                                        ;
;                                                                            ;
;  Calls    : NEGHL - Complement HL register pair                            ;
;                                                                            ;
;----------------------------------------------------------------------------;
 
;  CALL MOVEY
;    ydir, y passed in memory
;  RET
;    newy Stored
 
MOVEY
 
;        Get ydir, y0
 
         LHLD   Y0
 
;        Check YDIR : the move direction flag
 
         LDA    YDIR
         ANA    A
         JM     MOVY01
 
;        If Ydir = 1 then Y = Y + 1
 
         INX    H                ;Y = Y + 1
         JMP    MOVY02
 
;        else Xdir = -1
 
MOVY01   DCX    H                ;Y = Y - 1
 
MOVY02   SHLD   Y0               ;Store NEWY
 
         RET
 
 
; ****************************************************************************
; *                                                                          *
; *  CLIPTX : Filter the Chracter Cell to the current Plot Strip edge        *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : Oct. 29, 1982   File "CLIPTX.ASM"                              *
;                                                                            *
;  Clipit ( y1, y2, Flag, topy, boty)                                        *
;                                                                            *
;  Function :                                                                *
;                                                                            *
;     Clip the endpoints of a line to the current Plot Strip window          *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;     TOPY, BOTY  : Y Coord. of the Top and Bottom edges of current Strip    *
;     X1, Y1      : The endpoints of the Cell to be clipped                  *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;     ZERO Set    : Flag indicating that the Cell lies entirely              *
;                   outside of the plot strip window (REJECTED)              *
;                                                                            *
;  Process  :                                                                *
;                                                                            *
;     FILTER (y1,flag1)       ;Determine the position of the first end point *
;     FILTER (y2,flag2)       ;and the second point relative to the edges    *
;                                                                            *
;     REJECT (flag1,flag2)    ;Test to see if the Char can be trivially      *
;                              rejected                                      *
;     if not rejected                                                        *
;        ACCEPT (flag1,flag2) ;Test to see if the Char can be trivially      *
;                              accepted                                      *
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
 
;  CALL CLIPTX
;      Y1, Y2      TOPY,BOTY passed in meory
;  RET
;     Carry = on, Cell inside strip
;           = off,Cell rejected (lies outside window)
;-----------------------------------------------------------------------------
 
;         PUBLIC CLIPTX
;         EXTRN  NEGHL
;         EXTRN  TOPY, BOTY, FILTER
;         EXTRN  FLGS, X1, Y1, Y2, YSTRT, XDIR, YDIR
;         EXTRN  I0, I7, J0, J7, LOOP0, LOOP7
;         EXTRN  FLG1, FLG2
 
;        Filter y-coordinate of the first endpoint y1 against strip
 
CLIPTX
         LHLD   Y1
 
         CALL   FILTER           ;Returns position flag flg1
         MOV    A,      B        ;flg1 : 0 = boty < y1 < topy
         STA    FLG1             ;      >0 = y1 above or below strip
 
;        Filter second endpoint
 
         LHLD   Y2
         CALL   FILTER           ;flg2 : 0 = boty < y2 < topy
         MOV    A,      B        ;      >0 = y2 above or below strip
         STA    FLG2
 
;        Test : Cell lies entirely outside strip & can be trivially rejected ?
 
         LDA    FLG1             ;reject line if (fg1 .and. flg2) NOT= 0
         ANA    B                ;<b> = flg2, <a> = flg1
 
;        TRIVIALLY REJECT CHARACTER CELL IF RESULT NOT ZERO
 
         JNZ    CTXJ99           ;Zero flag off indicating line rejected
 
         ORA    A                ;Clear carry flag : charcter not rejected
 
CTXJ09   RET                     ;Carry off : indicating Cell not rejected
 
CTXJ99   STC
         RET
 
         END
 
 
 
E 1
