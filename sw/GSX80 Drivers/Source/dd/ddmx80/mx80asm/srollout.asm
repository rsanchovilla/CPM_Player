h05571
s 00479/00000/00000
d D 1.1 83/03/17 15:58:43 tes 1 0
c date and time created 83/03/17 15:58:43 by tes
e
u
4
U
t
T
I 1
 
 
 
         TITLE 'ROLLOUT - OBJLST LIST BUFFER OVERFLOW SUPPORT'
 
; ****************************************************************************
; *                                                                          *
; *      ROLLOUT : Put Next Byte into OBJECT LIST BUFFER                     *
; *                Get Next Byte from OBJECT LIST BUFFER                     *
; *                Manages ROLL OUT to a DISK FILE for the Calling routine   *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : NOV. 19, 1982      File "ROLLOUT.ASM"   version 1.0            *
;                                                                            ;
;***** MODE NOTES :  *********************************************************
;                                                                            *
;  1)  Maximum No. of Bytes Accessable to/from OBJLST is 64K bytes, because  *
;      a 16 bits word is used to ADDRESS the byte in the OBJLST buffer       *
;  2)  Bytes in OBJLST buffer area is always resident never Rolled Out       *
;      to the Disk Roll Out File                                             *
;  3)  Driver Dies On a File R/W Error **** Return Error Status to Caller ****
;                                      **** If Caller Checks Error Return ****
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;                                                                            *
;  GETNXT : Get the next byte from OBJLST buffer and returns it in <a>       *
;  GETBYT : Get the byte at location BYTNDX from OBJLST and returns in <a>   *
;  GETXY  : Get an x,y coordinate pair from OBJLST (next 4 bytes)            *
;  PUTPT  : Put pt. coord. into OBJLST buffer (2 bytes)                      *
;  PUTBYT : Put 1 byte into OBJLST buffer (next Byte location)               *
;  DOFLOW : Initialize Roll Out area and Buffer Pointers                     *
;  DOEND  : Reset Buffer Pointers and Delete Roll Out File if Created        *
;  FERROR : File Read/Write Error, Stop Execution                            *
;                                                                            *
;*****************************************************************************
 
         PUBLIC GETNXT, GETBYT, PUTBYT, PUTPT, GETXY
         PUBLIC DOFLOW, DOEND, FERROR
         PUBLIC OBJLST, BYTNDX, RBASE, RSTAT, NOFILE, DOROLL
         public bnext
         EXTRN  ABSHL, NEGHL, CMPDH, CMPS, SUBDH, MIDH, DIDH, IMOD
 
;----------------------------------------------------------------------------+
;        BODS FUNCTIONS                                                      +
;----------------------------------------------------------------------------+
 
BDOS     EQU    0005H            ;BDOS Entry point
CONOS    EQU    09               ;Console String Output
FDELET   EQU    19               ;Delete File
WRSEQ    EQU    21               ;Write Sequential
FCREAT   EQU    22               ;Create File
RDRAN    EQU    33               ;Read Random
SETDMA   EQU    26               ;Set DMA Address (File Record Buffer)
 
OUTFCB   ;Define Roll Out File FCB
 
         DB     0                ;Roll Out File to Default Drive
         DB     'ROLLOUT TMP'    ;Roll out File Name
         DB     0,0,0,0
         DS     16               ;System Reserved bytes
         DB     0                ;Current Record No. to R/W
RRRNR    DB     0,0,0            ;Random Record No. to R/W
 
RSTAT    DB     0                ;Roll Out File Used Flag, 0 = No File
 
         page
 
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;        DOFLOW - 1) Flush the record in the roll out area to disk (last     +
;                    record in roll out file)                                +
;                 2) Read the First Record back from roll out file into      +
;                    roll out area, Setting up for Getbyt, Getnxt routines   +
;                 3) Initialize Bytes Index and Buffer Pointers              +
;                                                                            +
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
;        Check was Rollout File Created ?
 
DOFLOW
         LDA    RSTAT
         ANA    A                ;RSTAT = 0, No Roll Out File
         JZ     NOFILE
 
;        File was Created, Flush out the Last record to roll out file
 
         LXI    D,     BROLL     ;Base address of roll out area
         MVI    C,     SETDMA    ;Make Current DMA area point to RollOut area
         CALL   BDOS
 
         LXI    D,     OUTFCB    ;Roll Out File FCB
         MVI    C,     WRSEQ     ;Write record to File
         CALL   BDOS
 
;        Check Write status
 
         ANA    A
         JNZ    DFULL
 
;        Read the first record from Roll Out File into Roll Out Area
 
DOROLL
         LXI    H,     0
         SHLD   RRRNR            ;Set Current Record No. in FCB to zero
         LXI    D,     OUTFCB
         MVI    C,     RDRAN
         CALL   BDOS
         ANA    A
         JNZ    RDERR            ;Check Read Status
 
;        Initialize Byte Index and Buffer Pointers to Beginning of OBJLST
 
NOFILE
         LXI    H,     OBJLST
         SHLD   BNEXT            ;ADDRESS pointer to Next Byte in OBJLST
         LXI    H,     0
         SHLD   BYTNDX           ;Index of Next Byte in OBJLST (start at 0)
         LXI    H,     BSIZ1
         SHLD   RBASE            ;Index of First Byte in ROLL-OUT area
 
         RET
 
 
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;        DOEND : Clean Up Operation                                          +
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
;        Check Roll Out File Flag
 
DOEND
         LXI    H,     RSTAT
         MOV    A,     M
         ORA    A
         JZ     NOFILE           ;0 = No file Used
 
;        Reset Roll Out File Used Flag, DELETE File
 
         MVI    M,     0
         LXI    D,     OUTFCB    ;Roll Out File FCB
         MVI    C,     FDELET
         CALL   BDOS             ;Delete it
 
         JMP    NOFILE
 
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;        FERROR : File Read/Write Error Occured, Stop Execution              +
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
FERROR
         LXI    D,     OUTFCB    ;Roll Out File FCB
         MVI    C,     FDELET
         CALL   BDOS             ;Delete it
         MVI    C,     0
         CALL   BDOS             ;STOP EXECUTION
 
;*****
;        DOQUIT : Will Try to Halt the Execution Gracefully,
;                 Set up Appropriate Error Status Flag and Return to
;                 Caller for All File I/O Error Conditions in The Driver,
;                 When the Error Return Condition is Defined.
;*****
 
DOQUIT
         RET
 
;*****************************************************************************
;                                                                            *
;        GETBYT : Get the Byte at BYTNDX                                     *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  Getbyt (bytndx, byte)                                                     *
;                                                                            *
;  CALL GETBYT                                                               *
;        BYTNDX = Index of the byte to be returned to caller                 *
;  RET                                                                       *
;        <A>  = Byte                                                         *
;        BYTNDX = Index of Next Byte in OBJLST buffer                        *
;                                                                            *
;*****************************************************************************
 
GETBYT
         LHLD   BYTNDX           ;Index of Byte to be Returned
         LDA    RSTAT            ;Get Roll Out Flag
         ANA    A                ;Any Bytes ROLLED OUT to DISK ?
         JZ     GETRDY           ;No, Get Byte DIRECTLY from buffer
         LXI    D,     BSIZ1     ;Yes, Is Byte in OBJLST buffer ?
         CALL   HGTD             ;<DE> = BYTNDX - BSIZ1
         JC     GETRDY           ;Get Directly if BYTNDX <= BSIZ1
 
;        Byte is Not in OBJLST Buffer, it may be in Roll Out Area or
;        need to be read from DISK RollOut File
;
;        XCHG
;        XRA    A                ;Check Record no. of BYTNDX
;        DAD    H                ;Rec. No. = (BYTNDX-BSIZ1) / 128
;        MOV    E,     A
;        ACI    0
;        MOV    D,     A         ;<DE> = Rec. no. needed
;
         MOV    A,     E         ;(bytndx - Bsiz1) / 128 = Roll Out File
         RLC                     ;Record No. for the Byte at BYTNDX
         MOV    A,     D
         RAL
         MOV    E,     A
         MVI    A,     0
         RAL
         MOV    D,     A         ;<DE> = Roll-Out File Record No. of the
                                 ;byte we want to get
 
;        Check Is This Record Already in Roll-Out Area ? (RRRNR)
 
         LHLD   RRRNR            ;Is this Record Currently in My ROLL
         CMP    H                ;OUT area ?
 
         JNZ    RDREC            ;RRRNR = Record No. of Record Currently
         MOV    A,     E         ;in the Roll Out area
         CMP    L
         JNZ    RDREC            ;No, Get Record From Disk
 
;        Byte is in the Roll Out Area, Figure out the where it is and Get it
 
BFIND
         LHLD   RBASE            ;Index of Byte at the Start of Roll Out
         XCHG
         LHLD   BYTNDX
         CALL   HGTD             ;Offset of byte = BYTNDX - RBASE
         LXI    H,     BROLL     ;BASE ADDRESS OF ROLL OUT AREA
         DAD    D                ;<hl> = Buffer address of byte
         JMP    GETIT            ;Go Get It
 
;*****************************************************************************
;                                                                            *
;       GETNXT : Get the Next Byte from Objlst List Buffer                   *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  Getnxt (bnext, byte)                                                      *
;                                                                            *
;  CALL GETNXT                                                               *
;       BNEXT : Address of Next Byte                                         *
;  RET                                                                       *
;      <A > = The Byte returned                                              *
;      BNEXT  = Points to next Location in Object List                       *
;                                                                            *
;*****************************************************************************
 
;        Get The Next Byte from OBJLST
 
GETNXT
         LHLD   BNEXT            ;Buffer Address of Next Byte in LIST
         LXI    D,     ROLLO     ;ADDRESS of End of RollOut area
         CALL   HGTD             ;Is Byte to get within Buffer Area ?
         JNC    GETBYT           ;No, Get Byte By Byte Index BYTNXT
 
GETIT
         MOV    A,     M         ;Yes, Get Byte from Buffer
         INX    H                ;Points to Next Byte
         SHLD   BNEXT
         LHLD   BYTNDX           ;Increment Byte Index
         INX    H
         SHLD   BYTNDX
 
         ANA    A                ;Clear Carry = Status OK
         RET
 
GETRDY
         LXI    D,     OBJLST    ;Base address of Object List Buffer
         DAD    D                ;<hl> = Byte Index + Base Address,
         JMP    GETIT            ;     = Address of Byte to Get
 
RDREC
         XCHG                    ;<hl> = Record No. to Read
         SHLD   RRRNR            ;Put it in FCB
         LXI    D,     BROLL     ;DMA = Roll Out Area
         MVI    C,     SETDMA
         CALL   BDOS
         LXI    D,     OUTFCB    ;Roll Out File FCB
         MVI    C,     RDRAN     ;Read Record into Roll Out Area
         CALL   BDOS
         ANA    A                ;Check Read Status
         JNZ    RDERR            ;OOPS, I GOOFED !?
 
         LHLD   RRRNR            ;Set Index of First Byte In the Roll
         LXI    D,     128       ;Out Area : Record No. * 128 + BSIZ1
         CALL   MIDH
         LXI    D,     BSIZ1
         DAD    D
         SHLD   RBASE            ;Save for Future Reference
         JMP    BFIND            ;ENUF FOOLING AROUND, GO GET IT !
 
RDERR
         LXI    D,     REMSG     ;Should Never Happed !
         MVI    C,     CONOS
         CALL   BDOS
 
         STC                     ;Set Error Return Status <carry set>
         JMP    FERROR
 
REMSG    DB     'Disk Read Error, Temporary File : ROLLOUT.TMP'
 
 
;        Subtract DE from HL
;        On Return : Carry On if  HL <= DE
;                          off If HL  > DE  (DE = HL - DE)
 
HGTD
         MOV	A,     L
         SUB    E
         MOV    E,     A
         MOV    A,     H
         SBB    D
         MOV    D,     A
         RET
	
 
;*****************************************************************************
;                                                                            *
;       PUTBYT : Store the Byte in <a> in the Object List Buffer             *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  Putbyt (byte, bnext)                                                      *
;                                                                            *
;  CALL PUTBYT                                                               *
;        <A > = The Byte to be stored                                        *
;  RET                                                                       *
;                                                                            *
;*****************************************************************************
 
PUTBYT
         LHLD   BNEXT            ;Get the Object List Buffer Location Pointer
         MOV    M,      A        ;Store the Byte into OBJLST
         INX    H                ;Advance Buffer Pointer
         SHLD   BNEXT            ;Store the New OBJLST location pointer
 
;        Check OBJLST Buffer Over Flow
 
         LXI    D,     ROLLO     ;Force Roll Out Address
         CALL   CMPDH            ;Buffer Pointer > Rollo ?
         JZ     PUTJ01
         ORA    A                ;Set Return Status
         RET                     ;Return If Not
 
;        BUFFER OVERFLOWING, Must Roll Out To Disk File
 
PUTJ01   CALL   OPENR            ;Create File if not Already
 
         LXI    H,     BROLL     ;<HL> = Address of Roll Out Area
 
;        Reset Addreaa Pointer of NEXT Byte To Top of ROLL-OUT area
 
         SHLD   BNEXT
         XCHG                    ;<DE> = Start Address of Roll Out Area
         MVI    C,     SETDMA    ;Set DMA = RollOut Area
         CALL   BDOS
 
         LXI    D,     OUTFCB
         MVI    C,     WRSEQ     ;Write Sequential Rollout area to File
         CALL   BDOS
         ANA    A                ;Check Return Status
         RZ
 
;        DISK FULL ERROR
 
DFULL
         LXI    D,     DFMSG     ;Error Message
         MVI    C,     CONOS
         CALL   BDOS
 
         STC                     ;Set Error return
         JMP    FERROR           ;Jump to Quit on Error
 
 
DFMSG    DB     'Disk Full/Write Error, Temporary File : ROLLOUT.TMP'
 
;        Create/Open ROLL-OUT file
 
OPENR
         LDA    RSTAT            ;Roll-out File Status Flag
         ANA    A                ;Is File Open ?
         RNZ                     ;Yes, Return
 
         LXI    D,     OUTFCB    ;Roll-out File FCB
         MVI    C,     FDELET    ;Delete Any Duplication File
         CALL   BDOS
 
         LXI    D,     OUTFCB
         MVI    C,     FCREAT    ;Now Create It
         CALL   BDOS
         INR    A                ;Successful ?
         STA    RSTAT            ;Set File Status
         RNZ                     ;YES
         JMP    DFULL            ;No, ERROR
 
         page
;*****************************************************************************
;                                                                            *
;        PUTPT : Store the Coordinate of a point in the Object List Buffer   *
;                                                                            *
;*****************************************************************************
;                                                                            *
;  Putpt (Coord, bnext)                                                      *
;                                                                            *
;  CALL PUTPT                                                                *
;        <DE> = The Coordinate to be stored                                  *
;  RET                                                                       *
;      BNEXT  = Points to next available location in Object List Buffer      *
;                                                                            *
;*****************************************************************************
 
PUTPT
         MOV    A,      D        ;Put the Byte to be stored in <a>
         PUSH   D
         CALL   PUTBYT           ;Store the FIRST byte into OBJLST
         POP    D
         JC     DOQUIT
         MOV    A,      E
         CALL   PUTBYT           ;Store the SECOND byte into OBJLST
         JC     DOQUIT
         RET
 
;----------------------------------------------------------------------------+
;        GETXY : Get a x,y Coordinate pair from the Object List Buffer       +
;----------------------------------------------------------------------------+
;                                                                            +
;  CALL GETXY                                                                +
;    BNEXT  = Address of next point in the OBJLST Buffer                     +
;                                                                            +
;  RET                                                                       +
;    BNEXT  = Address of next point in the OBJLST Buffer                     +
;    BYTNDX = Index of next Point in the OBJLST buffer                       +
;    <DE> = X coord.                                                         +
;    <BC> = Y coord.                                                         +
;                                                                            +
;----------------------------------------------------------------------------+
 
GETXY
         LXI     H,     X        ;Tmp storage
         MVI     C,     4        ;Get the Next 4 Bytes
L4       PUSH    H
         PUSH    B
         CALL    GETNXT          ;Get the next byte from OBJLST
         POP     B
         POP     H
         JC      DOQUIT          ;Check Error Status
         MOV     M,     A        ;Returns Byte in <A>
         INX     H
         DCR     C
         JNZ     L4
         LHLD    X
         MOV     E,     H
         MOV     D,     L        ;<DE> = X
         LHLD    Y
         MOV     C,     H
         MOV     B,     L        ;<BC> = Y
         RET
 
X        DS      02
Y        DS      02
 
;----------------------------------------------------------------------------+
;        OBJLST BUFFER ADDRESSING VARIABLES                                  +
;----------------------------------------------------------------------------+
 
BSIZ1    EQU    1920             ;OBJLST Buffer Size (bytes)
OSIZ1    EQU    128              ;Disk File Roll Out Area Size (bytes)
 
BNEXT    DS     2                ;ADDRESS of Next Byte in OBJLST
 
BYTNDX   DS     2                ;Index of Next Byte in OBJLST
RBASE    DW     BSIZ1            ;Index of First Byte In Roll Out Area
 
OBJLST   DS     BSIZ1            ;Allocate OBJLST Buffer
BROLL    DS     OSIZ1            ;Allocate ROLL OUT area
ROLLO    EQU    $                ;End of Ram Buffer Address
 
         END
E 1
