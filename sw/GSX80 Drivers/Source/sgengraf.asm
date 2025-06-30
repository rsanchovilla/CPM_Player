h39754
s 00657/00000/00000
d D 1.1 83/03/24 13:56:52 lib 1 0
c date and time created 83/03/24 13:56:52 by lib
e
u
4
U
t
T
I 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                        ;
;       This material is confidential and is furnished under a written   ;
;       license agreement. It may not be used, copied or disclosed to    ;
;       others except in accordance with the terms of that agreement.    ;
;                                                                        ;
;       Copyright (c) 1982 Digital Research, Inc.                        ;
;       All rights reserved.                                             ;
;                                                                        ;
;   GENGRAF--
;       Function:                                                        ;
;               Attach "leech" to graphic progam                         ;
;       Input:                                                           ;
;               program name                                             ;
;       Output:                                                          ;
;               program with "leech" attached                            ;
;       Description:                                                     ;
;               Append gsxldr to program, fill in length parameters      ;
;                       for leech, so leech can perform memory check     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;title 'GSXLDR - Load GSX, default driver and execute program'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                        ;
;                                                                        ;
;       Function:                                                        ;
;                                                                        ;
;
;       1) Read ASSIGN.SYS to determine default driver
;       2) Parse all assignment file entries into ASSTBL
;       3) Determine load address for default driver
;       4) Load and relocate default driver
;       5) Determine load address for GSX.SYS
;       6) Load and relocate GSX, alter BDOS address
;       7) Store some parameters in GSX
;               Real Bdos Address
;               Assignment Table
;               Current Driver #  (# of Default driver)
;       8) Put block move program in high memory (with relocation)
;       9) Call block move program to move TPA with real code
;               down to 100H
;       Block move program jumps to 100H at end of move
;
;       Input:                                                           ;
;               NONE                                                     ;
;       Output:                                                          ;
;               Gsx and driver loaded, com file at 100H                  ;
;       Description:                                                     ;
;                                                                        ;
;Leech - Load appropriate files prior to graphic execution
;
;The leech program is appended to the front of a program which
;uses GSX graphics. It initializes the system by reading the
;driver assignment file, reading and relocating the default driver,
;and loading the GSX. Leech patches the BDOS jump vector at absolute
;location 5 to point to the GSX, and it stores certain data in the
;front of the GSX, including the assignment table, real bdos address,
;and default driver number.
;
;The leech first opens the assignment file, and parses the list of
;drivers into the internal format needed by the GSX (described in
;GSX.DOC). The first driver is loaded and relocated using the
;prl loader, and then GSX is loaded. The address of the real BDOS
;is then stored into GSX so that it may forward BDOS calls
;appropriately. The assignment table is then moved into GSX, and
;the address of GSX is stored in the BDOS jump vector at absolute
;location 5. A block move routine is then moved up into high memory
;just below GSX and it is executed with the parameters necessary to
;move the rest of the TPA ( rest of .COM) down to 100H and then
;jump to it.
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
        cseg
Bdos    Equ     5
 
gengrf  jmp     around     ; later patched to jmp leech
 
Quit    Ret                     ; bog Invoke movedn
 
pgmlen  dw      0          ; later patched to length of application
 
leech   lxi     h,100H
        sphl
        Call    FOpen           ; Open ASSIGN.SYS
 
asslp   Call    GetRec          ; Read a record for ASSIGN.SYS
        mvi     a,5     ; max assignments
        Push    Psw             ; Save assignment count on stack
        lxi     h,buff      ; parse the record
        lxi     d,assbuf ; temporary assignment buffer
 
lparse  mov     a,m
        Cpi     01ah            ; ^Z?
        Jz      PDone           ; Quit looking for driver files if so
        cpi     '1'
        jnc     num1
        xra     a
        jmp     byt2
 
num1    sui     '0'         ;conv. to bin
        add     a           ; mult by 10
        mov     b,a
        add     a
        add     a
        add     b
 
byt2    mov     b,a
        inx     h      ; hl-> second digit
        mov     a,m
        sui     '0'
        add     b       ; now low digit
        stax    d
        xra     a
        inx     d       ; only store 1 byte for now
        stax    d
        inx     d       ; now the drive
        inx     h       ; skip space
        inx     h       ; now point to dr:fname
        Call    GUpC            ; Fetch and upcase a character
        sui     '@'
        stax    d       ; store drive
        inx     d
        inx     h       ; bypass :
        mvi     c,8
 
lpfn    Call    GUpC            ; Fetch and upcase a character
        cpi     ';'     ; comment in file follows ?
        jz      fillit  ; fill rest of devtab with spaces
        cpi     13      ; cr ?
        jnz     nofill  ; nope, keep scanning
 
fillit  mvi     a,' '
        Dcx     H               ; Decrement so Cr or ";" will be refetched
 
nofill  stax    d
        inx     d
        dcr     c
        jnz     lpfn
        mvi     a,10    ; line feed
 
scnlp   cmp     m       ; is this it ?
        inx     h
        jnz     scnlp   ; no lf yet
        Pop     Psw             ; Get assignment count
        Dcr     A               ; Decrement assignment count
        Push    Psw             ; Save assignment count back in case loop
        Jnz     LParse          ; Jump if more drivers to parse
 
PDone   Pop     Psw             ; Trash stacked assignment count
        Call    FClose          ; Close ASSIGN.SYS
        lhld    6       ; current top of TPA
        shld    tpatop
        Lxi     D,AssBuf+2      ; Point to drive & filename to move
        Lxi     H,Fcb           ; Point to place to put it
        Mvi     C,9             ; Drive & filename are 9 bytes long
        Call    MovByts         ; Move drive & filename to Fcb
        mvi     m,'P'
        inx     h
        mvi     m,'R'
        inx     h
        mvi     m,'L'
        call    prload  ; ******* whip it in !;********
; now hl has address of driver
        lhld    dest    ; new top of tpa (below driver)
        shld    tpatop
        Lxi     D,GsxFcb        ; load gsx name into fcb
        Lxi     H,Fcb
        Mvi     C,12            ; Move 12 bytes of drive, name, ext
        Call    MovByts         ;  to PrLoad's Fcb
        call    prload  ; ******* load 'em up (GSX) move 'em in  ***
; Dest contains base address of GSX.SYS
 
; Set up GSX:
;  Jmp at GSX+3 is to real Bdos
;  Dw at GSX+6 is current Device Id
;  Table at GSX+8 is 55-byte Assignment Table
        Lhld    Dest            ; Address of base of GSX
        Push    H               ; Save address of base of GSX
        Lxi     B,4             ; Jump to real Bdos at GSX+3
        Dad     B               ; Point to address in Jmp at GSX+3
        Lxi     D,6             ; Move old Bdos vector
        Mvi     C,2             ;  to
        Call    MovByts         ;  Jmp at GSX+3
        Lxi     D,AssBuf        ; Move current Device Id
        Mvi     C,2             ;  to
        Call    MovByts         ;  Dw at GSX+6
        Dcx     D               ; Point back to AssBuf
        Dcx     D
        Mvi     C,55            ; 11 bytes * 5 entries
        Call    MovByts         ; Move 55-byte assignment table to GSX
 
	Xchg			; DE <- ptr to beyond GSX's assignment table
	Inx	D		; Skip stopper Device Id
	Inx	D
	Mvi	C,9		; Bdos "Print String" opcode
	Call	Bdos		; Show GSX signon
 
        LHLD    PgmLen          ; Get -(1st addr beyond leech+appl+MovDn)
        Pop     D               ; Get back base addr of GSX
        Dad     D               ; GSX base - 1st free addr above appl
        Jnc     TooBig          ; Jump if GSX or MovDn crashed end of appl
 
        Xchg                    ; Base address of GSX into H
        SHLD    6               ; Size is ok -- crash real Bdos vector to GSX
 
        mvi     c,1AH
        lxi     d,80H   ;restore default dma
        call    Bdos
 
        Lxi     D,MovDn         ; Move MovDn routine to just below GSX
        LHLD    Dest            ; Base addr of GSX
        Lxi     B,-MvLen        ; Length of MovDn routine
        Dad     B               ; HL <- where MovDn will go
        Push    H               ; Save address of moved MovDn
        SHLD    MvAddr+1        ; Patch loop jump in MovDn
        Mvi     C,MvLen         ; Length of MovDn
        Call    MovByts         ; Move MovDn routine to just below GSX
        Lxi     H,((LodEnd-GenGrf+0017fh) and 0ff80h)   ; Address of appl
        Pop     D               ; Get address of MovDn
        Push    D               ; Save it back for Ret to get to MovDn
        Mov     A,E             ; BC <- MovDn-appl
        Sub     L
        Mov     C,A
        Mov     A,D
        Sbb     H
        Mov     B,A             ; BC now has the number of bytes to move
        lxi     d,100H  ; destination of move
        Jmp     Quit             ; bog Jmp to Ret to MoveDn
        Page
 
; This routine moves the application program down to 100h.  It is relocated
;  to just below GSX.SYS.
movdn   mov     a,m
        stax    d
        inx     h
        inx     d
        dcx     b
        mov     a,b
        ora     c
 
mvaddr  jnz     0       ; this jump gets relocated after the loop is moved
        jmp     100H
 
MvLen   Equ     $-MovDn
        Page
 
; Get character at HL and upcase it.  Increment HL.
GUpC    Mov     A,M             ; Get a character
        Inx     H               ; Point to next
        Cpi     'a'             ; Lower case?
        Rc                      ; Return if not
        Cpi     'z'+1           ; Lower case alphabetic?
        Rnc                     ; Return if not
        Sui     'a'-'A'         ; Make upper case
        Ret                     ;  & return
 
; Move C bytes at DE to HL, left to right
MovByts Ldax    D               ; Get a byte
        Mov     M,A             ; Put it here
        Inx     D               ; Increment pointers
        Inx     H
        Dcr     C               ; Decrement byte count
        Jnz     MovByts         ; Loop until exhausted
        Ret                     ;  & then return
        Page
 
TooBig  Lxi     D,BigStr        ; Point to "not enough memory"
        Jmp     Abort           ; Log error and quit
 
BigStr  Db      'Not enough memory$'
 
gsxfcb  db      0,'GSX     SYS'
 
AssBuf  Dw      -1
        Db      0,'        '
        Dw      -1
        Db      0,'        '
        Dw      -1
        Db      0,'        '
        Dw      -1
        Db      0,'        '
        Dw      -1
        Db      0,'        '
        Page
 
; Load the .PRL program at Fcb at the highest page possible under TpaTop.
; Return its base address in Dest.
PRLOAD  Call    FOpen           ; Open file & check for errors
        Call    GetRec          ; Read record into Buff
        lhld    buff+1  ; get the length
        Push    H               ; Save length for reloc
        xchg
        lhld    tpatop  ; old bdos
        mov     a,l
        sub     e
        mov     a,h
        sbb     d
        mov     h,a
        Mvi     L,0             ; Base page address in HL
        SHLD    Dest            ; Base page address in Dest
        Push    H               ;  & Tos
        Push    H               ;   twice
        Push    D               ; Length now on Tos
        Call    GetRec          ; Read second (trash) record into Buff
        Pop     B               ; Number of bytes to load in BC
        Pop     H               ; Place to load in HL
 
RdLp    Call    GetCh           ; Get a byte of .PRL file into A
        Mov     M,A             ; Load one byte
        Inx     H               ; Point to next byte to load into
        Dcx     B               ; Decrement byte count
        Mov     A,C             ; Done loading?
        Ora     B               ; Zero if so
        Jnz     RdLp            ; Loop until .PRL file loaded
 
        Pop     H               ; Base address of prog in HL
        Mov     B,H             ; Relocation offset
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
        Call    FClose          ; Close the .PRL file
        Ret                     ;  & return to caller with Dest being base
 
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
; DE preserved.  Others crashed.
FOpen   Lxi     D,Fcb           ; Point to Fcb for file to open
 
FOpenF  Push    D               ; Save address of Fcb
        Lxi     H,12            ; Offset of "ex" field of Fcb
        Dad     D               ; HL <- address of "ex" field
        Mvi     M,0             ; Clear "ex" field
        Inx     H               ; Point to
        Inx     H               ;  "s2" field
        Mvi     M,0             ;  & clear it, too
        Mvi     A,080h          ; Need a negative so
        Sta     BufPtr          ;  first GetCh will force GetRec
        Mvi     C,00fh          ; "Open" Bdos opcode
        Call    Bdos            ; Open file
        Pop     D               ; Get Fcb ptr back
        Lxi     H,32            ; Offset of "cr" field of Fcb
        Dad     D               ; Point to "cr" field of Fcb
        Mvi     M,0             ; Clear "cr" field for sequential read
 
FRet    Ora     A               ; File exists?
        Rp                      ; Return if file was there
        Call    ShowF           ; Show the filename
        Lxi     D,NFound        ; Point to " not found"
        Jmp     Abort           ;  & poop it out, then abort
 
; Close the file at Fcb
FClose  Lxi     D,Fcb           ; Point to the Fcb
        Mvi     C,16            ; Close opcode for Bdos
        Call    Bdos            ; Close the file
        Jmp     FRet            ; Check for close ok & return
 
; Show filename at Fcb pointed to by D
; Registers crashed
ShowF   Xchg                    ; Fcb ptr to HL
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
        Ret                     ;  & return
 
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
GetRec  Lxi     D,Buff          ; Point to my I/O buffer
        Mvi     C,01ah          ; Bdos "Set DMA Address" opcode
        Call    Bdos            ; Set the DMA address
        Lxi     D,Fcb           ; Point to Fcb (for PrLoad)
        Push    D               ; Save ptr to Fcb
        Mvi     C,014h          ; Bdos "read record" opcode
        Call    Bdos            ; Read the record
        Pop     D               ; Restore ptr to Fcb for possible ShowF
        Ora     A               ; Was there a read error (end of file?)
        Rz                      ; Return if Ok
        Call    ShowF           ; Show the file name
        Lxi     D,UEOF          ; Show ":  unexpected EOF"
 
Abort   mvi     c,9             ; "Show string" Bdos opcode
        call    Bdos
        jmp     0
 
UEOF    Db      ':  unexpected EOF$'
 
NFound  Db      ' not found$'
 
fcb     Db      0,'ASSIGN  SYS',0
        Ds      23
 
tpatop  ds      2
 
dest    ds      2
 
BufPtr  Dw      0               ; Offset from Buff
buff    ds      128
 
lodend  equ     $
        Page
 
; main entry for program "GENGRAF", above stuff will be saved into new
; com file
around	Lxi	D,SignOn	; Point to signon message
	Mvi	C,9		; "Print String" Bdos opcode
	Call	Bdos		; Show signon message
 
	lxi     h,65H   ;default file type
        mvi     m,'C'
        inx     h
        mvi     m,'O'
        inx     h
        mvi     m,'M'
 
        lxi     d,5CH   ; default fcb
        mvi     c,35    ; get file size
        call    Bdos
        lhld    7DH     ; # of recs
        Dad     H               ; * 080h is base addr of first rec after appl
        Dad     H
        Dad     H
        Dad     H
        Dad     H
        Dad     H
        Dad     H
        Lxi     D,((LodEnd-GenGrf+0017fh) and 0ff80h)+MvLen
        Dad     D               ; HL <- 1st address after leech+appl+MovDn
        Mov     A,L             ; Complement HL
        Cma                     ;  via A
        Mov     L,A
        Mov     A,H
        Cma
        Mov     H,A
        Inx     H               ; HL is now -(1st addr after leech+appl+MovDn)
        SHLD    PgmLen          ; Save for GSX loader
 
        xra     a
        sta     7CH     ; ready for sequential read
        lxi     h,5CH
        lxi     d,fcbout ; output file
        push    d
        mvi     c,36     ; 36 bytes to move
        call    blkmov
        pop     d
        push    d
        lxi     h,9
        dad     d       ; change file type to $$$
        mvi     m,'$'
        inx     h
        mvi     m,'$'
        inx     h
        mvi     m,'$'
        mvi     c,19    ; delete this if it existed
        call    Bdos
        pop     d
        mvi     c,22    ; now create it
        call    Bdos
        inr     a
        jz      nodir   ; no directory space
        lxi     h,leech
        shld    101H    ; change jump for leech
        lxi     d,100H
wrtlp   push    d
        mvi     c,26    ; address to write
        call    Bdos
        lxi     d,fcbout
        mvi     c,21    ; write
        call    Bdos
        pop     d
        lxi     h,80H
        dad     d
        xchg
        lxi     h,lodend
        mov     a,e
        sub     l
        mov     a,d
        sbb     h
        jc      wrtlp   ; leech is not done yet
; leech has been written out, now do application
; use a 16K buffer, 128 logical records
        lxi     d,5CH
        Call    FOpenF          ; Open prog.$$$
 
ordlp   mvi     c,128
        lxi     d,bigbuf
 
irdlp   push    d
        push    b
        mvi     c,26    ;read it here
        call    Bdos
        lxi     d,5CH
        mvi     c,20
        call    Bdos
        sta     eofflg
        ora     a
        pop     b
        pop     d
        jnz     bufful
        dcr     c
        jz      bufful
        lxi     h,80H
        dad     d
        xchg
        jmp     irdlp
bufful  mvi     a,128
        sub     c       ; this is the number to recs to write
        mov     c,a
        lxi     d,bigbuf
wrtlp2  push    b
        push    d
        mvi     c,26
        call    Bdos
        lxi     d,fcbout
        mvi     c,21
        call    Bdos
        ora     a
        pop     d
        pop     b
        jnz     badwrt
        dcr     c
        jz      wrtdun
        lxi     h,80H
        dad     d
        xchg
        jmp     wrtlp2
wrtdun  lda     eofflg
        ora     a
        jz      ordlp   ; not done yet, another buffer
        lxi     d,fcbout
        mvi     c,16
        call    Bdos    ; close em up, move em out
        lxi     d,5CH
        mvi     c,19    ; delete the old guy
        call    Bdos
        lxi     d,fcbout
        lxi     h,16
        dad     d
        mvi     c,16
        xchg
        call    blkmov  ; prepare for rename
        lxi     h,fcbout+25 ; change new filetype
        mvi     m,'C'
        inx     h
        mvi     m,'O'
        inx     h
        mvi     m,'M'
        mvi     c,23    ; do the rename
        lxi     d,fcbout
        call    Bdos
        mvi     c,0
        jmp     Bdos    ; bye now
blkmov  mov     a,m
        stax    d
        inx     h
        inx     d
        dcr     c
        jnz     blkmov
        ret
badwrt  lxi     d,wbad
        jmp     abort
nodir   lxi     d,ndir
        jmp     abort
 
        dseg
 
eofflg  ds      2
fcbout  ds      36
wbad    db      'Write Error.$'
ndir    db      'No Directory Space.$'
bigbuf  equ     $
 
SignOn	Db	'---------------------------------------------------',13,10
	Db	'GENGRAF 1.0  15 Nov 82   Serial No G000-0000-654321',13,10
	Db	'Copyright (C) 1982                                 ',13,10
	Db	'Digital Research, Inc.          All Rights Reserved',13,10
	Db	'---------------------------------------------------',13,10
	Db	'$'
 
        end     gengrf
E 1
