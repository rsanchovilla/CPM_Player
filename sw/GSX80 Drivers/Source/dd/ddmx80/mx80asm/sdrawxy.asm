h16168
s 00655/00000/00000
d D 1.1 83/03/17 15:57:55 tes 1 0
c date and time created 83/03/17 15:57:55 by tes
e
u
4
U
t
T
I 1
 
         TITLE  'LINE RASTERIZATION SUPPORTING LINESTYLES'
 
; ****************************************************************************
; *                                                                          *
; *  SCAN-CONVERT LINE USING THE BASIC INCREMENTAL ALGORITHM                 *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : Nov. 10, 1982    File "DRAWXY.ASM"   Version 1.0               *
;                                                                            *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) Check LINE STYLE BIT pattern : LSTYLE   (Call LINETY)              *
;      2) Special Line Style Support :                                       *
;         .Drawit Stores Line Start Point X0, Y0 for Swapping                *
;         .Clipit Returns ABOVE flag : 0=inside, 1=Y2 above, 2=Y1 above      *
;         .Drawxy Swaps Line Endpoints : Line Direction Ymax to Ymin         *
;                 Filters Y0 to TOPY and Sets Y0 inside flag for ADDRXY      *
;                 and SETBIT Rontines to start Setting Bit in BITMAP         *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;  drawxy (x1,x2,y1,y2,cindex)                                               *
;                                                                            *
;  Function : Convert line defined by endpoints x1,y1,x2,y2 into pixel       *
;             values and store into BITMAP for scan output later             *
;                                                                            *
;  Calls & Processes :                                                       *
;       INSIDE = True                                                        *
;       Do until (x=x2 and y=y2)                                             *
;          If SOLID then Skip Filter Y logic, Raster Clipped Line Segment    *
;          ;Standardize Line Direction (Ymax to Ymin)                        *
;          SWAPY (x0, y0, x1, y1, x2, y2)                                    *
;          Initialize INSIDE = false                                         *
;          INITXY (x1,y1,x2,y2)                                              *
;          ;initialze dx, dy, xdir, ydir,... etc.                            *
;          If INSIDE then ADDRXY (x1, y1, cindex)                            *
;                    ;get starting bitmap address pointer for pixel x1,y1    *
;                    else (not INSIDE)                                       *
;                       Filter Y1 to TOPY, If Y1 < TOPY then                 *
;                                                set INSIDE = true           *
;          If INSIDE then                                                    *
;             LINETY ;Check Line Style Pattern returns Set bit Flag          *
;          If Set bit then  SETBIT (nbyt,nbit)                               *
;                     ;set pixel at corresponding bitmap location            *
;                                                                            *
;          PIXEL STEPS X,Y                                                   *
;            if ( abs(dx) > abs(dy) )     ;jump x, maybe jump y              *
;               JUMPX           ;x=x+xdir, f=f+(dy*xdir), update nbit        *
;               if ( abs(f) >= abs(dx/2) ) then JUMPY                        *
;            else   ;jump y, maybe jump x                                    *
;               JUMPY           ;y=y+ydir, f=f+(dx*ydir), update nbyt        *
;               if ( abs(f) >= abs(dy/2) ) then JUMPX                        *
;            endif                                                           *
;                                                                            *
;  Input   :  X1, Y1, X2, Y2 - Endpoint coordinates                          *
;                                                                            *
;  Output  :  None                                                           *
;                                                                            *
;  Line Style Support Variables :                                            *
;                                                                            *
;       X0, Y0, XN, YN - Unclipped Line Endpoints                            *
;       ABOVE - Which Line EndPoint ABOVE Strip Flag                         *
;       INSIDE- Line EndPoints INSIDE Strip Flag                             *
;                                                                            *
;  Raster Variables  :                                                       *
;             X0     - Line start point coord.                               *
;             XN     - Line end point coord.                                 *
;                                                                            *
;  ROUTINES CALLED :                                                         *
;                                                                            *
;    ADDRXY : DETERMINE THE BITMAP ADDRESS FOR PIXEL X,Y                     *
;                                                                            *
;    SETBIT : 'SET' THE BIT AT THE BITMAP BUFFER ADDRESS NBYT,NBIT           *
;                                                                            *
;*****************************************************************************
 
        PUBLIC  DRAWXY
 
        EXTRN   GETADR, ADDRXY, SETBIT, LINETY, SWAPY
 
        EXTRN   ABSHL, NEGHL, CMPDH, CMPS, SUBDH, MIDH, DIDH, IMOD
 
        EXTRN   BITMAP, NBIT, NBYT, MPTY
        EXTRN   XMAX, YMAX
        EXTRN   XW, TOPY, BOTY, BOTTY
        EXTRN   LSTYLE, NDLNTY
	EXTRN	X, X1, Y, Y1, X2, Y2, DX, DY, XDIR, YDIR
 
        EXTRN   X0, Y0, XN, YN, ABOVE, INSIDE
 
;----------------------------------------------------------------------------+
;        LINE DRAWING (RASTERIZE VECTOR TO PIXEL) VARIABLES                  +
;----------------------------------------------------------------------------+
 
ABSDX    DS      02
ABSDY    DS      02
ABSD2    DS      02              ;if dx>dy then absd2 = absdx div 2
                                 ;         else absd2 = absdy div 2
DOXY     DS      01              ;if dx>dy then doxy = 1 else doxy = 0
DF       DS      02              ;Error term maintained for raster algorithm
CHGPT    DB      0
 
;----------------------------------------------------------------------------+
;  CALL DRAWXY                                                               +
;    X0, Y0, XN, YN, X1, X2, Y1, Y2 stored in memory                         +
;  RET                                                                       +
;    All registers used                                                      +
;----------------------------------------------------------------------------+
 
DRAWXY
;        Initialize INSIDE = False
 
         XRA     A
         STA     INSIDE
         STA     CHGPT
 
;        Do until (x=x2 and y=y2)
 
REPIT1
;        Check is Linestyle SOLID ?
 
         LDA     NDLNTY          ;0 = SOLID
         ORA     A
         JNZ     DRWJ02
 
;        SOLID LINE
 
         LDA     INSIDE
         ORA     A
         JNZ     DRWJ07         ;NOT FIRST BIT, SKIP ADDRESS CALCULATION
 
         INR     A
         STA     INSIDE         ;SET INSIDE FLAG
 
         CALL    INITXY         ;COMPUTE PIXEL ADDRESS FOR FIRST POINT
         LHLD    Y1
         XCHG
         LHLD    X1
         CALL    GETADR
         JMP     DRWJ07         ;Alway SETBIT
 
;        Check is Line Swapped to Proper Direction : Ymax to Ymin
 
DRWJ02
         LDA     CHGPT
         ORA     A
         JM      DRWJ04          ;Already swapped
 
;        SWAPY (x0, y0, x1, y1, x2, y2)
;                      and LEAVE INSIDE set to false
 
         CALL    SWAPY
         MVI     A,     0FFH
         STA     CHGPT           ; Clear above flag so line don't get
                                 ; swapped again
 
;        Initialize raster parameters for the line (x1,y1,x2,y2)
 
DRWJ03                           ;initialze dx, dy, xdir, ydir,... etc.
         CALL   INITXY           ;Initialize line generation variables
 
;        Check INSIDE flag : If INSIDE, Bitmap Address Computed
 
DRWJ04
         LDA     INSIDE
         ORA     A
         JNZ     DRWJ06          ;Address already Computed, Skip ADDRXY call
 
;        (not INSIDE)
;             Filter Y1 to TOPY and Set INSIDE Flag once Y1 < TOPY
 
         LHLD    TOPY            ;Top of Current Plot Strip
         XCHG
         LHLD    Y               ;Current Y Pixle Position
         CALL    CMPDH           ;carry set = topy < y
                                 ;carry off = topy > y
         JC      DRWJ06
 
;        Line is now inside Plot Strip
;        set inside flag and go  Compute the Bitmap address of X,Y
 
         MVI     A,    1
         STA     INSIDE
 
;        Check INSIDE flag
;        If INSIDE then ADDRXY (x1, y1, cindex)
;                       get starting bitmap address pointer for pixel x1,y
 
DRWJ05
         LHLD   Y1               ;Get Starting pixel coordinates
         XCHG                    ;<de> = y
         LHLD   X1               ;<hl> = x
 
         CALL   GETADR           ;Returns <hl> = nbyt
                                 ;        <b>  = nbit
                                 ;nbyt, nbit also are stored byt GETADR
 
;=============================================================================
;  call  getadr                                                              =
;                                                                            =
;        CALL   ADDRXY           ;Get bitmap address pointer for x,y         =
;                                                                            =
;        CALL   CORADR           ;Get base address of the corresponding      =
;                                ;color bitmap buffer for this Color         =
;        LXI    D,     BITMAP    ;Get bitmap buffer base address             =
;        DAD    D                ;Add base to byte pointer <hl> = nbyt       =
;        SHLD   NBYT                                                         =
;        MOV    A,     B                                                     =
;        STA    NBIT                                                         =
;                                                                            =
;        <hl> = nbyt, <b> = nbit                                             =
;        CALL   PIXEL            ;Set the bit in corresponding bitmap for    =
;                                ;pixel x,y                                  =
;                                                                            =
;=============================================================================
 
;        Check LINE STYLE
DRWJ06
         CALL   LINETY          ;Returns Carry set : SET BIT
 
         JNC    DRWJ08
 
;        Check INSIDE flag indicating Pixel Position inside Plot Strip
 
         LDA    INSIDE
         ORA    A
         JZ     DRWJ08
 
;----------------------------------------------------------------------------+
;        Set this bit                                                        +
;----------------------------------------------------------------------------+
 
DRWJ07
         LHLD   NBYT
         LDA    NBIT
         MOV    B,     A
         CALL   SETBIT           ;<hl> = Byte position
                                 ;<b>  = bit position in Nbyt to be set
DRWJ08
         LDA    DOXY
         ORA    A
         XCHG                    ;Put nbyt in <DE>
         JZ     DRWJ01
 
;----------------------------------------------------------------------------+
;        doxy = 1, (ie. abs(dx) > abs(dy))                                   +
;        Always jump x, may be jump y                                        +
;----------------------------------------------------------------------------+
 
         LHLD   X                ;<hl> = x
         CALL   JUMPX            ;Returns <hl> = abs(df), <de> = nbyt,
                                 ;         <b> = nbit, new x, df stored
;        Test may be jump y
 
         PUSH   D                ;Save nbyt
         XCHG                    ;<de> = df
         LHLD   ABSD2            ;<hl> = abs(dx/2)
         XCHG                    ;<de> = abs(dx/2), <hl> = df
         CALL   CMPDH            ;abs(df) >= abs(dx/2) ?
 
         POP    D                ;Returns carry set if abs(dx/2) < df
         JNC    DRWL01           ;Don't Move Y
         LHLD   Y                ;Move Y coordinate by +- 1
         CALL   JUMPY            ;Returns <hl> = abs(df), <de> = nbyt,
                                 ;         <b> = nbit, new y, df stored
 
         JMP    DRWL01
 
;----------------------------------------------------------------------------+
;doxy = 0, always 'jump y', may be jump x  (ie. abs(dx) <= abs(dy) )         +
;----------------------------------------------------------------------------+
 
DRWJ01   LHLD   Y                ;<hl> = y
         CALL   JUMPY            ;Returns <hl> = abs(df), <de> = nbyt
                                 ;         new y, df stored
;        Test and may be jump x, if abs(df) >= abs(dy/2)
 
         PUSH   D                ;Save nbyt
         XCHG                    ;Put abs(df) in <de>
         LHLD   ABSD2            ;<hl> = abs(dy/2)
         XCHG                    ;<de> = dy/2, <hl> = df
         CALL   CMPDH            ;abs(df) >= abs(dy/2) ?
                                 ;Returns carry set if <de> < <hl>
         POP    D
         JNC    DRWL01
         LHLD   X                ;Move x
         CALL   JUMPX            ;Returns <hl> = abs(df), <de> = nbyt,
                                 ;         <b> = nbit, new x,df stored
 
DRWL01   PUSH   D                ;Save nbyt
 
;----------------------------------------------------------------------------+
;        Test end of do until loop                                           +
;        x = x2 ?                                                            +
;----------------------------------------------------------------------------+
 
         LHLD   X
         XCHG                    ;<de> = x
         LHLD   X2               ;<hl> = x2
         CALL   CMPDH
         JNZ    UNTIL1           ;Not zero  : x <> x2
 
;----------------------------------------------------------------------------+
;        and y = y2 ?                                                        +
;----------------------------------------------------------------------------+
 
         LHLD   Y
         XCHG                    ;<de> = y
         LHLD   Y2               ;<hl> = y2
         CALL   CMPDH
         JNZ    UNTIL1           ;Not zero : Y <> y2
 
;----------------------------------------------------------------------------+
;        end of line condition                                               +
;----------------------------------------------------------------------------+
 
         POP    H
         LDA    NDLNTY           ;Check Line Style
         ORA    A
         JZ     DRWRET
         CALL   LINETY
         RNC
DRWRET   CALL   SETBIT
         RET
 
;----------------------------------------------------------------------------+
;        UNTIL LOOP                                                          +
;----------------------------------------------------------------------------+
 
UNTIL1   POP    H                ;Get nbyt into <hl>
         SHLD   NBYT
         MOV    A,     B
         STA    NBIT
         JMP    REPIT1           ;loop until x=x2 and y=y2
 
         page
; ****************************************************************************
; *                                                                          *
; *  INITXY : INITIALIZE VALUES USED BY THE INCREMENTAL ALGORITHM            *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Initxy (x1, x2, y1, y2)                                                   *
;                                                                            *
;  Function : Initialize parameters for the line generation algorithm        *
;               dx = x2 - x1,  xdir = sign(dx)                               *
;               dy = y2 - y1,  ydir = sign(dy)                               *
;               absdx = abs(dx), absdy = abs(dy)                             *
;               if (absdx > absdy ) then                                     *
;                 doxy  = 1                                                  *
 
;                 absd2 = absdx/2                                            *
;               else                                                         *
;                 doxy  = 0                                                  *
;                 absd2 = absdy/2                                            *
;                                                                            *
;  Input    : X1, X2, Y1, Y2                                                 *
;                                                                            *
;  Output   : DX, DY, XDIR, YDIR, ABSDX, ABSDY, ABSD2, DOXY                  *
;                                                                            *
;  Calls    : DELTA  - Compute Delta, Abs(delta) values and set the Dir flag *
;             CMPDH  - Double precision compare (DE >= HL ?)                 *
;             CMPS   - Double Precision compare (signed values DE >= HL ?)   *
;             SUBDH  - Double precision subtract (HL = DE - HL)              *
;             NEGHL  - Double precision negate (HL = 2's complement HL)      *
;                                                                            *
;----------------------------------------------------------------------------*
;
;  CALL INITXY
;    X1, Y1, X2, Y2 stored in memory
;  RET
;    The following variables are stored in memory
;    DX, DY, XDIR, YDIR, ABSDX, ABSDY, ABSD2, DOXY
;
 
INITXY
         LHLD   X2
         XCHG
         LHLD   X1               ;HL=x1, DE=x2
         CALL   DELTA            ;Get dx, xdir
         STA    XDIR             ;A=xdir
         SHLD   DX               ;HL=dx
         CALL   ABSHL            ;Get abs(dx)
         SHLD   ABSDX
         LHLD   Y2
         XCHG
         LHLD   Y1               ;HL=y1, DE=y2
         CALL   DELTA            ;Get dy, ydir
         STA    YDIR             ;A=ydir
         SHLD   DY               ;HL=dy
         CALL   ABSHL            ;Get abs(dy)
         SHLD   ABSDY
         XCHG                    ;Swap DE and HL
         LHLD   ABSDX            ;HL=absdx, DE=absdy
         CALL   CMPDH            ;absdx > absdy ?
         JNC    INIJ01           ;carry off ==> absdx <= absdy
 
;        Line drawing algorithm uses abs(dx/2) if abs(dx) > abs(dy)
 
         XRA    A                ;Clear carry
         MOV    A,      H        ;if absdx > absdy then
         RAR                     ;   absd2 = absdx/2
         MOV    H,      A
         MOV    A,      L
         RAR
         MOV    L,      A
         MVI    A,      01       ;   Set abs(dx) > abs(dy) flag, doxy = 1
 
         JMP    INIJ02
 
INIJ01   ;Line drawing algorithm uses abs(dy/2) if abs(dy) >= abs(dx)
 
         XRA    A                ;Clear carry status
         MOV    A,      D        ;carry off ==> absdy >= absdx
         RAR                     ;if absdy >= absdx then
         MOV    D,      A        ;   absd2 = absdy/2
         MOV    A,      E
         RAR
         MOV    E,      A
         XCHG                    ;HL = absd2
         XRA    A                ;doxy = 0
INIJ02   STA    DOXY
         SHLD   ABSD2
         RET
 
;----------------------------------------------------------------------------+
;                                                                            +
;  delta (x1, x2)                                                            +
;                                                                            +
;  Function : Compute dx=x2-x1, set xdir = -1:x2<x1, 0:x2=x1, 1:x2>x1        +
;                                                                            +
;  CALL DELTA                                                                +
;    <DE> = X2                                                               +
;    <HL> = X1                                                               +
;  RET                                                                       +
;    <A>  = XDIR                                                             +
;    <HL> = DX                                                               +
;                                                                            +
;----------------------------------------------------------------------------+
 
DELTA
         PUSH   H                ;Save x1
         CALL   SUBDH            ;<HL> : dx=x2-x1
         MOV    B,      H        ;Put dx into <BC>
         MOV    C,      L
         POP    H                ;Get x1 from stack
         CALL   CMPS             ;x2 > x1 ?
         JNC    DELJ01           ;carry off : xdir >= 0 (x2>=x1)
         MVI    A,      0FFH     ;carry on : xdir = -1 (x2 < x1)
         JMP    DELJ99
DELJ01   MOV    A,      B        ;dx = 0 ?
         ORA    C
         JZ     DELJ99           ;Yes, xdir = 0 <A>
         MVI    A,      01H      ;No, x2 > x1 : xdir = 1 <A>
DELJ99   MOV    H,      B        ;Move dx back into <HL>
         MOV    L,      C
         RET
 
 
         page
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  JUMPX : INCREMENT X AND UPDATE THE DECISION VARIABLE DF, AND UPDATE     ;
; ;          THE BITMAP ADDRESS POINTER (INCREMENT NBIT)                     ;
f,dy,nbyt,nbit)                                            ;
;                                                                            ;
;  Function : Move x coordinate pixel by +-1                                 ;
;               new x = x + xdir                                             ;
;               update pixel address : nbyt, nbit                            ;
;               df = df - (dy * xdir)                                        ;
;                                                                            ;
;  Input    : X    - Current x coordinate                                    ;
;             NBYT - Pixel address pointer (byte position : y coordinate)    ;
 
;             NBIT - Pixel address pointer (bit position : x mod 8)          ;
;             DY   - Change in DF due to a move in x                         ;
;             XDIR - Direction of move (-1, 0 +1)                            ;
;             DF   - Error term maintained for generating next pixel         ;
;                                                                            ;
;  Output   : X    - New X                                                   ;
;             NBYT - New NBYT                                                ;
;             NBIT - New NBIT                                                ;
;             DF   - New DF                                                  ;
;                                                                            ;
;  Calls    : NEGHL - Complement HL register pair                            ;
;             ABSHL - Absolute HL                                            ;
;                                                                            ;
;----------------------------------------------------------------------------;
;
;  CALL JUMPX
;    <DE> = NBYT
;    <HL> = X
;    <B > = NBIT
;  RET
;    <DE> = NBYT
;    <HL> = ABS(DF)
;    <B > = NBIT
;     NEW X, NEW DF Stored in memory
;
;----------------------------------------------------------------------------+
JUMPX
;        First check XDIR the move direction flag
 
         LDA    XDIR
         ANA    A
         JZ     JPXJ01           ;Xdir = 0, JUMPX = NOP
         JM     JPXJ02           ;Xdir = -1,Decrement X
;----------------------------------------------------------------------------+
;        If Xdir = 1 then X = X + 1, nbit = nbit + 1, df = df - dy           +
;----------------------------------------------------------------------------+
 
         INX    H                ;X = X + 1
 
;        Update the bitmap address pointer for New x
 
         INR    B                ;Nbit = Nbit + 1
         MVI    A,     07H       ;new nbit mod 8
         ANA    B                ;Nbit = 0..7
         JNZ    JPXJ03           ;nbit = 8 ?
         MOV    B,     A         ;Yes, Set nbit = 0
         INX    D                ;Increment nbyt when NBIT = 8
         JMP    JPXJ03
 
;----------------------------------------------------------------------------+
;        else Xdir = -1 do X = X - 1, nbit = nbit -1, df = df + dy           +
;----------------------------------------------------------------------------+
 
JPXJ02   DCX    H                ;X = X - 1
         XRA    A                ;<A> = 0 Indicates xdir = -1
         DCR    B                ;Nbit = nbit - 1
         JP     JPXJ04           ;nbit < 0 ?
         MVI    B,     07H       ;Yes, Reset nbit = 7
         DCX    D                ;Decrement nbyt when NBIT = -1
         JMP    JPXJ04
 
JPXJ03   MVI    A,     1         ;<A> = 1 indicates xdir = 1
 
JPXJ04   SHLD   X                ;Store new x
         PUSH   B                ;Save nbit
 
;----------------------------------------------------------------------------+
;        Update df to reflect the move in x coordinate                       +
;----------------------------------------------------------------------------+
 
         LHLD   DY               ;Get dy
         ORA    A                ;Check xdir = 1 ?
         CNZ    NEGHL            ;Yes, Negate dy : df = df - dy
         MOV    B,     H         ;Move dy to <BC>
         MOV    C,     L
         LHLD   DF               ;Get df in <HL>
         DAD    B                ;df = df +- dy
         SHLD   DF               ;Store new df
         CALL   ABSHL            ;<hl> = abs(df)
         POP    B                ;<B > = nbit
JPXJ01
         RET
;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  JUMPY : INCREMENT Y, UPDATE THE DECISION VARIABLE DF, AND UPDATE THE    ;
; ;          BITMAP ADDRESS POINTER NBYT                                     ;
; ;                                                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Jumpy (y,ydir,df,dx,nbyt)                                                 ;
;                                                                            ;
;  Function : Move y coordinate pixel by +-1                                 ;
;               new y = y + ydir                                             ;
;               update pixel address : nbyt = nbyt + xw                      ;
;               df = df + (dx * ydir)                                        ;
;                                                                            ;
;  Input    : Y    - Current Y coordinate                                    ;
;             NBYT - Pixel address pointer (byte position : y coordinate)    ;
;             DX   - Change in DF due to a move in Y                         ;
;             YDIR - Direction of move (-1, 0 +1)                            ;
;             DF   - Error term maintained for generating next pixel         ;
;                                                                            ;
;  Output   : Y    - New Y                                                   ;
;             NBYT - New address pointer                                     ;
;             DF   - New DF                                                  ;
;                                                                            ;
;  Calls    : NEGHL - Complement HL register pair                            ;
;             ABSHL - Absolute HL                                            ;
;                                                                            ;
;----------------------------------------------------------------------------;
;
;  CALL JUMPY
;    <HL> = Y
;    <DE> = NBYT
;  RET
;    <HL> = ABS(DF)
;    <DE> = NBYT
;    NEW Y, NEW DF Stored
;    * Uses <A>
;    <BC> Unchanged
 
;
;----------------------------------------------------------------------------+
 
JUMPY
;        First check YDIR : the move direction flag
 
         LDA    YDIR
         ANA    A
         JZ     JPYJ01           ;Ydir = 0, JUMPY = NOP
         JM     JPYJ02           ;Ydir = -1,Decrement Y
 
;----------------------------------------------------------------------------+
;        if Ydir = 1,  then Y = Y + 1, nbyt = nbyt - xw, df = df + dx        +
;----------------------------------------------------------------------------+
 
         INX    H                ;Y = Y + 1
         MVI    A,     01        ;<A> = 1 indicates Ydir = 1
         JMP    JPYJ03
 
;----------------------------------------------------------------------------+
;        else Ydir = -1, do Y = Y - 1, nbyt = nbyt + xw, df = df - dx        +
;----------------------------------------------------------------------------+
 
JPYJ02   DCX    H                ;Y = Y - 1
         XRA    A                ;<A> = 0 indicates Ydir = -1
JPYJ03
         SHLD   Y                ;Store new Y
         PUSH   PSW              ;Save ydir flag
 
;        Update bitmap address pointer for new Y : nbyt = nbyt + (xw*ydir)
 
         LHLD   XW               ;Load xw
         ORA    A                ;Check ydir = 1 ?
         CZ     NEGHL            ;No, Complement XW
         DAD    D                ;nbyt = nbyt +- xw
 
;----------------------------------------------------------------------------+
;        Update DF to reflect the move in Y coordinate                       +
;----------------------------------------------------------------------------+
 
         POP    PSW              ;Restore Ydir flag
         PUSH   H                ;Save nbyt
         LHLD   DX               ;Get dx
         ORA    A                ;Check ydir = -1 ?
         CZ     NEGHL            ;Yes, Negate dx : df = df + (dx*ydir)
         XCHG
         LHLD   DF               ;Get df in <HL>
         DAD    D                ;df = df +- dx
         SHLD   DF               ;Store df
         CALL   ABSHL            ;<hl> =  abs(df)
         POP    D                ;Restore nbyt
JPYJ01
         RET
 
 
         END
E 1
