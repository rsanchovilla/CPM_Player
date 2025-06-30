h65418
s 00619/00000/00000
d D 1.1 83/03/24 13:57:01 lib 1 0
c date and time created 83/03/24 13:57:01 by lib
e
u
4
U
t
T
I 1
        title   'GSX - BDOS trap routine'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                        ;
;       This material is confidential and is furnished under a written   ;
;       license agreement. It may not be used, copied or disclosed to    ;
;       others except in accordance with the terms of that agreement.    ;
;                                                                        ;
;       Copyright (c) 1982 Digital Research, Inc.                        ;
;       All rights reserved.                                             ;
;                                                                        ;
;       Function:                                                        ;
;
;       BDOS Graphic trap and driver swap routine
;
;       Input:                                                           ;
;
; GSX - Entered through the BDOS
;       DE points to parameter block
;       C has BDOS call # 115 is trapped here, others are
;       passed to the real bdos through the third byte of
;       this routine
;
;
;                                                                        ;
;       Output:                                                          ;
;                                                                        ;
;       Description:                                                     ;
;
; The GSX program is loaded by the "leech" before the main program runs,
; and after the default device driver is loaded. After loading GSX, the
; "leech" fills in appropriate parameter values which are used in the
; normal operation of GSX. The first item that is supplied at "leech"-time
; is the address of the real BDOS. This is supplied so that the trap
; routine may pass along non-GSX calls to the BDOS. After the real BDOS
; address is the current device driver number, and then the assignment
; table. The assignment table is currently 55 bytes long, with room for
; five eleven-byte entries. Each entry consists of a two-byte driver
; number which is the number which signifies the GKS workstation ID.
; The next nine bytes are the first nine bytes of an FCB which will
; load the driver. These bytes are defined in the BDOS description
; and they consist of a drive code, followed by a file name. The
; FCB's that are created for these files will assume a file type of
; ".PRL".
;
; The GSX has two main functions:
;  (1) Trap BDOS calls and intercept #115.
;  (2) Switch device drivers if requested workstation id
;      is not equal to the current driver #.
;
; The first part of GSX traps the BDOS call. If the call is not #115
; then it jumps immediately to the real BDOS. Otherwise, the first
; parameter, ctl(1), is checked. If it is equal to 1, then this is
; an "open workstation" call and intin(1) points to the workstation
; ID. This is checked against the current driver #. If the requested
; workstation ID is the current driver #, then no load is performed.
; If they are not equal, the assignment table is searched for a
; matching driver #. If no match is found, no load is performed.
; If a driver # is found, its associated drive and name are moved
; to "fn" where the prl loader will put it into an FCB. The prl
; loader is called, and then the "no load" code is joined. At
; this point, the parameters are loaded from the parameter block
; into registers HL,DE, and BC respectively. This conforms to the
; calling sequence for a fortran driver. The address of the
; driver is computed to be the next page boundary after the
; GSX, it is stored into DDPAGE, and a jump is executed to that
; address.
;                                                                        ;
;       The program accesses the driver at the page boundary
;       which immediately follows it. It is computed just
;       before branching by finding the page after the
;       label "LODEND".
;
;       PRLOAD is the prl file loader described in "PRLOAD.DOC"
;
; Notes on transforms (bog 12 Oct 82)
;
;       The 32k space to pixel space transform must map 32767 to
;       the last pixel so it cannot round.  Therefore it truncates.
;
;       The pixel to 32k space inverse transform maps a pixel to the
;       NEAREST 32k space point.  An exception is made at the high end on
;       devices with high resolution; the inverse transform will never
;       return a coordinate greater than 32767.
;
;       Note also that the number of pixels in each axis can never exceed
;       65535.  In particular, it CANNOT be 65536, so that the address of
;       the last pixel, returned by OPEN_WORKSTATION, cannot be greater than
;       65534.
 
        CSeg
MAXPTS  Equ     75              ; Maximum number of points TempXY can hold
 
GksTrp  Jmp     Trap            ; Entry for interceptor
 
RealBd  Jmp     $-$             ; When GSX is loaded, this is to actual Bdos
Bdos    Equ     RealBd
 
Current Dw      -1              ; When GSX is loaded, this is default device
 
Assign  Ds      55              ; When GSX is loaded, this is assignment table
        Dw      -1              ; Stopper Device Id
 
Buff	Equ	$		; Buffer for PrLoad
 
TempXY	Db	'---------------------------------------------------',13,10
	Db	'GSX-80 1.0  15 Nov 82    Serial No G001-0000-654321',13,10
	Db	'Copyright (C) 1982                                 ',13,10
	Db	'Digital Research, Inc.          All Rights Reserved',13,10
 
Fcb	Db	'---------------------------------------------------',13,10
	Db	'$'
 
BufPtr  Dw      0               ; Offset from Buff
 
	Ds	(4*MAXPTS)-($-Buff); Local pixel-space PtsIn
 
Trap	Mov     A,C             ; Bdos/Gdos opcode to A
        Cpi     115             ; Gdos opcode?
        Jnz     RealBd          ; Real Bdos if not Gdos
 
; DE points to  a parameter block:
;  @DE          ^Contrl array
;  @DE+2        ^IntIn array
;  @DE+4        ^PtsIn array
;  @DE+6        ^IntOut array
;  @DE+8        ^PtsOut array
 
        Lxi     H,Contrl        ; Point to local parameter block
        Mvi     C,10            ; Move 10 bytes
        Call    MovByts         ; Move caller's parameter block to local area
        LHLD    Contrl          ; Get pointer to Contrl array
        Mov     A,M             ; Load
        Inx     H               ;  Contrl(1)
        Mov     H,M             ;  into
        Mov     L,A             ;  HL
        Dcx     H               ; Open workstation?
        Mov     A,H             ; Opcode for open workstation is 1
        Ora     L               ; Decremented, look for zero
        Jz      OpenWk          ; Jump if Open Workstation opcode
        Call    CnvtIn          ; Convert input points to temp if necessary
        Call    DrivGo          ; Invoke the driver
 
GdQuit	Jmp	CvtOut          ; Convert output points if necessary
        Page
 
OpenWk  LHLD    IntIn           ; IntIn(1) is Device Id
        Mov     E,M             ; Load
        Inx     H               ;  IntIn(1)
        Mov     D,M             ;  into DE
        LHLD    Current         ; Is driver already loaded?
        Call    ISub            ; Subtract requested Device Id from current
        Jz      NFDev           ; Zero if requested driver already in
 
; DE still has requested Device Id
        Lxi     H,Assign        ; Point to first assign table entry
 
FinDev  Push    H               ; Save pointer to current assign table entry
        Mov     A,M             ; Get low byte of Device Id
        Inx     H               ; Point to high byte
        Mov     H,M             ; Get high byte
        Mov     L,A             ; HL <- assign table Device Id
 
	Ana	H		; See if HL is -1
	Inr	A		; A -1 only if HL -1
	Pop	B		; No ptr to entry on stack if not found
	Jz	NFDev		; Jump if requested Device Id not found
	Push	B		; Put ptr to entry back on stack
 
        Call    ISub            ; Compare with requested Device Id
        Pop     H               ; Restore pointer to assign table entry
        Jz      GotDev          ; Jump if requested Device Id found
	Lxi	B,11		; Bump by 11 bytes per entry
        Dad     B               ; Point to next table entry
        Jmp     FinDev          ; Loop until requested Device Id found
 
GotDev  Inx     H               ; Point to
        Inx     H               ;  drive, filename
        Xchg                    ; Into source pointer register
        SHLD    Current         ; Make new Device Id current
        Lxi     H,Fcb           ; Move drive, filename to PrLoad's Fcb
        Mvi     C,9             ; 9 bytes in drive, filename
        Call    MovByts         ; Set up PrLoad's Fcb
        Call    PrLoad          ; Load new driver
 
; If requested driver not found, continue to use current driver
; Note that Open Workstation can have NO points in to convert
NFDev	Call    DrivGo          ; Invoke the driver
        LHLD    IntOut          ; Point to IntOut array
        Mov     A,M             ; Load
        Inx     H               ;  IntOut(2)
        Push    H               ;   Save pointer to high IntOut(1)
        Mov     H,M             ;  into
        Mov     L,A             ;  HL
        Inx     H               ; Make it number of pixels in X
        SHLD    XPix            ; Save for possible NDC<>pixel conversion
        Pop     H               ; Get back pointer to high IntOut(1)
        Inx     H               ; Point to low IntOut(2)
        Mov     A,M             ; Load
        Inx     H               ;  IntOut(2)
        Mov     H,M             ;  into
        Mov     L,A             ;  HL
        Inx     H               ; Make it actual number of pixels
        SHLD    YPix            ; Save for possible NDC<>pixel conversion
        Jmp     GdQuit          ; Go convert possible output points & quit
        Page
 
CnvtIn  LHLD    Contrl          ; Point at Contrl(1)
        Inx     H               ; Point at Contrl(2)
        Inx     H
        Mov     E,M             ; Load
        Inx     H               ;  Contrl(2)
        Mov     D,M             ;  into DE
 
	Mov	A,E		; Any
	Ora	D		;  points to convert?
        Rz                      ; Return if none to convert
 
	Lxi	H,-MAXPTS	; Test actual number of points against max
	Dad	D		; HL <- actual-MAXPTS
	Jnc	CvInMx		; Jump if actual less than max
 
        Mvi     E,MAXPTS        ; Maximum of MAXPTS will be converted
 
; In the input conversion loop:
;  HL points to caller's PtsIn
;  BC points to TempXY
;  Tos counts down the number of pairs
CvINMx	Lhld	PtsIn		; Get ptr to PtsIn
	Push	H		; Save it
	Lxi	H,TempXY	; Point to converted place
	Shld	PtsIn		; Driver should see converted pts
	Push	H		; BC should
	Pop	B		;  point to TempXY
	Pop	H		; HL <- Ptr to PtsIn
 
CvInLp	Push	D		; Save number of points
        Xchg                    ; DE <- ptr to PtsIn
        LHLD    XPix            ; HL <- number of pixels in X
        Call    CvIPx           ; Convert input 32k to pixel space:  X
        Xchg                    ; DE <- ptr to Y PtsIn
        LHLD    YPix            ; HL <- number of pixels in Y
        Call    CvIPx           ; Convert input 32k space to pixels
 
	Pop	D		; Get number of points back
        Dcr     E               ; Done converting points?
        Jnz     CvInLp          ; Loop until all points converted
 
        Ret                     ;  & return
        Page
 
; Convert 32k space point ^HL to pixel space in DE using number of pixels in DE
; HL returned pointing at next input point; C preserved; others crashed
CvIPx	Xchg			; HL <- ptr to PtsIn
	Mov     A,M             ; Get low byte of input coordinate
        Inx     H               ; Point to high byte
        Push    H               ; Save pointer to high byte
        Mov     H,M             ; Get high byte
	Push	B		; Save ptr to TempXY
        Mov     L,A             ; HL <- input point; DE has number of pixels
        Mvi     C,15            ; 15 iterations to get effect of div 32768
        Push    D               ; Save second operand:  number of pixels
        Xchg                    ; DE <- input coordinate:  < 32768
        Lxi     H,0             ; Mult accum starts at 0
 
CvIPxL  Mov     A,D             ; Shift next DE bit into carry
        Rar                     ; Since DE is tested only
        Mov     D,A             ;  it doesn't matter what
        Mov     A,E             ;  is shifted in
        Rar                     ;
        Mov     E,A             ; Carry now holds next DE bit
        Jnc     CvIPxN          ; Jump if bit was not set
 
        Mov     A,C             ; Save iteration count in A
        Pop     B               ; Get second operand:  number of pixels
        Push    B               ;  & save it back
        Dad     B               ; Accumulate when DE bit set
        Mov     C,A             ; Restore iteration count
 
CvIPxN  Mov     A,H             ; Shift developing product right once
        Rar                     ; Note that carry was clear from Jnc or Dad
        Mov     H,A
        Mov     A,L
        Rar
        Mov     L,A             ; HL <- shifted developing product
        Dcr     C               ; Decrement iteration count
        Jnz     CvIPxL          ; Loop through 15 iterations
 
        Pop     B               ; Trash 2nd operand
 
	Pop	B		; Restore ptr to TempXY
	Mov	A,L		; Stuff transformed low
	Stax	B
	Inx	B
	Mov	A,H		;  & high
	Stax	B
	Inx	B
 
        Pop     H               ; Restore pointer to high byte of input point
        Inx     H               ; Point to next input point
 
        Ret                     ;  & return
        Page
 
; Convert any output points
CvtOut  LHLD    Contrl          ; Point at Contrl array
        Lxi     D,4             ; Contrl(3) is offset of 4
        Dad     D               ; Point at Contrl(3), number of output points
        Mov     C,M             ; Load
        Inx     H               ;  Contrl(3)
        Mov     B,M             ;  into BC
	Lhld	PtsOut		; Point HL to PtsOut array
 
;hl points to coords (pixel), c has count
CvOPxL	Mov	A,C		; While PtsOut not empty
	Ora	B
	Rz			;  convert points
 
	Push	B		; Save count
 
	Xchg			; DE <- ptr to PtsOut item
	Lhld	XPix		; HL <- number of pixels in X
	Call	CvOPx		; Convert a Y pixel
 
	Xchg			; DE <- ptr to PtsOut item
	Lhld	YPix		; HL <- number of pixels in Y
	Call	CvOPx		; Convert a Y pixel
 
	Pop	B		; Get count back
	Dcx	B		; Decrement it
 
	Jmp	CvOPxL		; Loop until done
	Page
 
CvOPx	Mov	B,H		; BC gets number of pixels
	Mov	C,L
 
	Xchg			; HL <- ptr to PtsOut item
 
	Mov	E,M		; DE <- PtsOut item
	Push	H		; Save pointer to PtsOut item
        inx     h
        mov     d,m
 
	Xchg			; HL <- PtsOut item
 
	mvi     a,16    ; hl/bc => de, 0..65535
                        ; bc=op2, hl=op1, de=temp
        lxi     d,0     ; temp=0
 
divlp   push    psw     ; bog Save count
        xchg
        dad     h       ; temp=temp*2
        xchg
        dad     h       ; op1= op1*2
        mov     a,l
        sub     c       ; if op1 > op2 then
        mov     l,a     ;               op1 = op1 - op2
        mov     a,h     ;               temp = temp+1
        sbb     b
        mov     h,a
        jnc     gezero  ; op1-op2 >= 0
        dad     b       ; Restore; it was a compare, not a subtract
        dcx     d       ; bog Undo following inx
gezero  inx     d
        pop     psw
        dcr     a       ; i=i-1
        jnz     divlp   ; if i>0 then goto divlp
; DE now contains 0..65535 fraction pixel/#pixels.  Shift and round to
;  0..32767.  Note that the shift/round can NEVER result in 32768.  The
;  closest it could ever get is fffe0000/ffff, which is fffe, which
;  shift/rounds to 3fff.
        Ana     A       ; And to reset carry
        Mov     A,D     ; High byte to accum
        Rar             ; Shift right into carry, zero into high bit
        Mov     D,A     ; Back to result register
        Mov     A,E     ; Low byte to accum
        Rar             ; Shift low bit of high byte into high bit of low
        Mov     E,A     ; Result in DE; carry holds rounding bit
	Jnc	DvNear	; Jump if already at nearest point
        Inx     D       ; Round to nearest 32k space point
 
DvNear	Pop	H		; HL <- ptr to PtsOut item
 
	Mov	M,E		; Store converted point
	Inx	H
        mov     m,d
        inx     h       ; 1...2...cha,cha,cha (point to y coord)
	Ret
 
        Page
; Move C bytes from ^DE to ^HL
MovByts Ldax    D               ; Get a byte
        Mov     M,A             ; Put it here
        Inx     H               ; Bump source, dest
        Inx     D
        Dcr     C               ; Decrement count
        Jnz     MovByts         ; Loop until all moved
        Ret                     ;  & then return
 
; Subtract DE from HL; set Z flag on result
ISub    Mov     A,L
        Sub     E
        Mov     L,A
        Mov     A,H
        Sbb     D
        Mov     H,A
        Ora     L               ; Set Z on result
        Ret                     ;  & return
 
contrl  ds      2
intin   ds      2
ptsin   ds      2
intout  ds      2
ptsout  ds      2
 
XPIX    ds      2       ; bog Actual number of pixels across screen
YPIX    ds      2       ; bog Actual number of pixels up/down screen
        Page
 
; Load the .PRL program at Fcb at Driver.  Check length against real BDOS.
 
;PRLOAD - PRL file loader/relocater for GSX, LEECH
 
;The prl loader is used by the leech to load and relocate the default
;device driver, and then GSX.SYS. The same loader is used in GSX to
;load new device drivers with the difference that in GSX, the size
;of the space available is checked to make sure that the new driver
;will fit into the space reserved by the first driver.
 
;The format and generation of .PRL files is described in the MP/M
;Programmer's Guide (Section 7), and so will just be outlined here.
;A 100H byte header is at the front of the .PRL file, in which
;the second and third bytes contain the length of the code/data area
;needed for the program. This also indicates the address within the
;file of the relocation bit map. The program is present, ORG'd at
;100H, and the bit map indicates which bytes in the program must
;have a page offset added to relocate the program to a page boundary
;other than page 100H.
 
;After loading and relocating, the program returns to the calling routine.
 
PRLOAD  Call    FOpen           ; Open file & check for errors
        Call    GetRec          ; Read record into Buff
        LHLD    RealBd+1        ; Get address of real Bdos
        Lxi     D,Driver        ; Get address of driver
        Call    ISub            ; HL <- Bdos-Driver, i.e. allowed driver length
        Xchg                    ;  into DE
        LHLD    Buff+1          ; Get actual driver length
        Push    H               ; Save length for reloc
        Mov     A,E             ; Subtract actual from allowed
        Sub     L
        Mov     A,D
        Sbb     H               ; Carry set if too big
        Jnc     Not2Big         ; Jump if driver is not too big
 
        Lxi     D,F2Big         ; Point to  " too big to load"
        Jmp     ShowF           ;  & quit
 
Not2Big Call    GetRec          ; Read second (trash) record into Buff
        Pop     B               ; Number of bytes to load in BC
        Push    B               ; Back for reloc
        Lxi     H,Driver        ; Place to load in HL
	Push	H		; Save place to load for reloc
 
RdLp    Call    GetCh           ; Get a byte of .PRL file into A
        Mov     M,A             ; Load one byte
        Inx     H               ; Point to next byte to load into
        Dcx     B               ; Decrement byte count
        Mov     A,C             ; Done loading?
        Ora     B               ; Zero if so
        Jnz     RdLp            ; Loop until .PRL file loaded
 
	Pop	H		; Relocation offset
	Mov	B,H		;  into HL
        Dcr     B               ;  less initial offset of 1 into B
        Pop     D               ; Program length into DE
 
; In the inner loop here:
;  HL is the ptr to byte being relocated
;  C is bit-in-byte counter
;  DE is program length counter
;  B is relocation byte added to bytes being relocated
 
NewRByt Mvi     C,8             ; Bit-in-byte count
        Call    GetCh           ; Get next bitmap byte
 
BitLoop Rlc                     ; Next bitmap bit to carry
        Push    Psw             ; Save bitmap byte
        Jnc     NoReloc         ; Jump if this byte not relocated
        Mov     A,B             ; Get relocation offset
        Add     M               ; Relocate program byte
        Mov     M,A             ;  & stuff it back
 
NoReloc Inx     H               ; Bump prog byte ptr
        Dcx     D               ; Decrement number of bytes to relocate
        Mov     A,D             ; See if done relocating
        Ora     E               ; Zero if so
        Jz      RelDone         ; Jump if done relocating
        Pop     Psw             ; Restore bitmap byte
        Dcr     C               ; Decrement bit-in-byte counter
        Jnz     BitLoop         ; Loop until 8 bits done in this bitmap byte
        Jmp     NewRByt         ; Loop until program is fully relocated
 
RelDone Pop     Psw             ; Trash saved bitmap byte
        Jmp	FClose          ; Close the .PRL file & return
	Page
 
; Get byte at Buff+BufPtr.  Read next record if Buff exhausted.
GetCh   Push    H               ; Save registers
        Push    D
        LHLD    BufPtr          ; Get offset from base of buffer
        Inr     L               ; Point to next character
        Jp      GetChC          ; No need to read another record
        Push    B               ; Save one additional register
        Call    GetRec          ; Get next record
        Pop     B               ; Restore BC
        Lxi     H,0             ; First byte in rec is 0 offset
 
GetChC  SHLD    BufPtr          ; Save for next GetCh
        Lxi     D,Buff          ; Base of record
        Dad     D               ; Point to character to get
        Mov     A,M             ; Get it
        Pop     D               ; Restore registers
        Pop     H
        Ret                     ;  & return
 
; Open file; DE points to file's Fcb.  Abort if file doesn't exist.
; Registers crashed.
FOpen	Lxi	D,DefExt	; Point to default extension:  .PRL, "ex", "s2"
	Lxi	H,Fcb+9		; Place to put extension, "ex", "s2"
	Mvi	C,6		; Size in bytes of extension, "ex", "s2"
	Call	MovByts		; Initialize extension, "ex", "s2"
        Lxi	H,080h          ; Set BufPtr so first
        Shld	BufPtr          ;  GetCh will GetRec
	Lxi	D,Fcb		; Point to Fcb for open
        Mvi     C,00fh          ; "Open" Bdos opcode
        Call    Bdos            ; Open file
        Lxi     H,Fcb+32	; Offset of "cr" field of Fcb
        Mvi     M,0             ; Clear "cr" field for sequential read
 
FRet    Ora     A               ; File exists?
        Rp                      ; Return if file was there
 
        Lxi     D,NFound        ; Point to " not found"
        Jmp     ShowF           ;  & poop it out, then abort
 
; Close the file at Fcb
FClose  Lxi     D,Fcb           ; Point to the Fcb
        Mvi     C,16            ; Bdos "close" opcode
        Call    Bdos            ; Close the file
        Jmp     FRet            ; Check for ok & return
 
; Show the character pointed to by HL.  Preserve HL.
PutCh   Push    H               ; Save caller's HL
        Mvi     C,2             ; "ConOut" Bdos opcode
        Call    Bdos            ; Poop out the character
        Pop     H               ; Restore HL
        Ret                     ;  & return
 
; Show A-1 characters at HL.  Crash the registers.
PutChs  Dcr     A               ; Decrement number of characters to poop
        Rz                      ; Return if all done pooping
        Mov     E,M             ; Get char to show
        Inx     H               ; Bump to next character
        Push    Psw             ; Preserve AF
        Call    PutCh           ; Show it
        Pop     Psw             ; Restore character count in AF
        Jmp     PutChs          ;  & loop until A chars shown
 
; Read next record from file @Fcb into Buff.  Check for unexpected EOF.
; Registers crashed.
GetRec  Lxi     D,Buff          ; Tell Bdos where my buffer is
        Mvi     C,01ah          ; Bdos Set DMA address opcode
        Call    Bdos            ; Set the buffer address
        Lxi     D,Fcb           ; Point to Fcb (for PrLoad)
        Mvi     C,014h          ; Bdos "read record" opcode
        Call    Bdos            ; Read the record
        Ora     A               ; Was there a read error (end of file?)
        Rz                      ; Return if Ok
 
        Lxi     D,UEOF          ; Show ":  unexpected EOF"
 
; Show filename at Fcb
; Registers crashed
ShowF	Push	D		; Save pointer to message
	Lxi	H,Fcb		; HL <- ptr to Fcb
        Mov     A,M             ; Get drive number
        Ora     A               ; Default drive?
        Jz      FOpNDrv         ; Jump if yes
        Adi     '@'             ; Make it drive name
        Mov     E,A             ;  to E
        Call    PutCh           ; To console
        Mvi     E,':'           ; Poop out
        Call    PutCh           ;  colon
 
FOpNDrv Inx     H               ; Point to filename
        Mvi     A,9             ; Poop out file name
        Call    PutChs          ;  from Fcb
        Mvi     E,'.'           ; Poop out
        Call    PutCh           ;  dot
        Mvi     A,4             ; Poop out extension
        Call    PutChs          ;  from Fcb
	Pop	D		; Restore fatal message pointer
	mvi     c,9             ; "Show string" Bdos opcode
        call    Bdos
        jmp     0
 
F2Big   Db      ' too big to load$'
UEOF    Db      ':  unexpected EOF$'
 
NFound  Db      ' not found$'
 
DefExt	Db	'PRL',0,0,0	; Default extension, "ex", "s1", "s2"
 
        Ds      (($-GksTrp+000ffh+3) and 0ff00h)-($-GksTrp)-3
DrivGo	Lxi	D,Contrl	; Point DE to parameter block for driver
 
Driver  Equ     $               ; Base of driver
        End
E 1
