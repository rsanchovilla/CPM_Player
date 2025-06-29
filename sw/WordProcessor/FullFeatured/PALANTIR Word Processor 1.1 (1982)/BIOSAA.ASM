;	Stored on:	BIOS64.ASM	(64K CP/M BIOS FOR D100QU)
;	Author:		Paul Mennen
;	Copyright:	1983, Decmation
;
; MODIFIED 26-NOV-82 TO FIX READ EOF
; MODIFIED 11-DEC-82 TO ADD ENBIOS: MARKER
; MODIFIED 11-DEC-82 TO ADD 16 BYTE BUFFER CONOUT
; MODIFIED 8-FEB-83 TO WARM BOOT TO DEFAULT DISK
; MODIFIED 9-FEB-83 TO DELETE CHECKSUM COMPUTATIONS
; MODIFIED 15-FEB-83 TO ADD BIOS CALLS FOR MODEM FUNCTIONS
; modified 31-may-83 to increase character buffer to 64 bytes
; MODIFIED 12-JUNE-83 TO CHANGE MODEM CALLS
; NOTE: CLOSE TO SECTOR BOUNDRAY FBFF CALLING FOR CONTROL PGM CHANGE
CCP	EQU	03400h+0B000h	; Adr. of Console Command Processor
BDOS	EQU	CCP + 806h	; Adr. of Basic Disk Operating System
BIOS	EQU	CCP + 1600h	; Adr. of Basic I/O System
DEFDK	EQU	04h		; Adr. of last CP/M default disk number
JUMP	EQU	0C3h		; Z80 opcode for JUMP
B$STORE	EQU	43EDh		; Z80 opcode for store of B,C to external adr.


	ORG	BIOS		;		***** BIOS JUMP TABLE *****
;
	JMP	Boot		; Cold boot
wbootj	JMP	Wboot		; Warm boot
constj	JMP	Const		; Console status
coninj	JMP	Conin		; Console input
conouj	JMP	Conout		; Console out
	JMP	List		; Printer output
	JMP	Punch		; Ascii output
	JMP	Reader		; Ascii input
	JMP	Home		; Home drive
	JMP	Seldsk		; Select disk
	JMP	Settrk		; Set disk track number
	JMP	Setsec		; Set disk sector number
	JMP	Setdma		; Set dma address
	JMP	Read		; Read sector of selected disk
	JMP	Write		; Write sector of selected disk
	JMP	Listst		; Lister status
	JMP	Sectran		; Perform sector translation

	JMP	Home		; Leave room for future CP/M BIOS calls
	JMP	Home		; Leave room for future CP/M BIOS calls
;
;	These are DECMATION nonstandard BIOS calls
;
	JMP	Rdrt		; Read RT-11 file sector
	JMP	Wrrt		; Write RT-11 file sector
	JMP	Close		; Close RT-11 Output file
	JMP	Savdsk		; Return Disk Table pointer in HL
	JMP	Mdmout		; Output to Modem
	JMP	Mdmin		; Input from Modem
;
	JMP	Home		; Leave room for future Decmation BIOS calls
	JMP	Home		; Leave room for future Decmation BIOS calls
	JMP	Home		; Leave room for future Decmation BIOS calls
	JMP	Home		; Leave room for future Decmation BIOS calls
;
;	***** PDP-11 COMMUNICATION AREA *****

FUNC	DB	0	; Selects desired PDP-11 action (1 thru 16)
BUFFER	DB	0	; I/O Buffer
EOF	DB	0	; End of file flag
BOOTD	DB	0	; Disk number for CPM cold & warm boot
DISKNO	DB	0	; Disk number
SECTOR	DB	0	; Disk Sector number
TRACK	DW	0	; Disk Track number
DMA$ADR	DW	0	; Disk Read/Write buffer
;following word subject to modification by 11
cnbuf	DB	15	; mask for console out buffer
IALLOC	DB	0	; Type of Disk Write (0,1,2)
MDMCTB	DB	0	; MODEM CONTROL BYTE, ADDRESS OFFSET
SPARE3	DB	0
CONRDY	DB	0	; 0-NOT READY, FF-READY (ENTIRELY SET BY 11)
LSTRDY	DB	0

; VECTORS TO DEFINE CPM SIZE
; THESE CHANGED BY 11 FOR 20K BIOS
; FOR 20K BIOS 11 MOVES COPY OF JUMP TABLE DOWN

CCPVEC	JMP	CCP	; START CCP
WBVEC	DW	BIOS+3
BDVEC	DW	BDOS	; BDOS ADDRESS FOR LOC 5
ENBIOS:	DW	NDISK	; MARKS END OF BIOS, START OF TABLES
INPTR:	DB	0	; INPUT CHAR PTR PTS TO EMPTY LOC
OUTPTR:	DB	0	; LOC FOR 11 TO PICK UP NEXT CHAR
BBASE:	DW	0,0,0,0	; 64 byte CHARACTER FIFO
	DW	0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0
;
;	***** PDP-11 FUNCTION CODES *****

F$DISKWRITE	EQU	3
F$DISKREAD	EQU	4
F$WBOOT		EQU	5
F$SPARE		EQU	6	; SPARE FUNCTION CODE
F$CONIN		EQU	7
F$CONOUT	EQU	8
F$LIST		EQU	9
F$PUNCH		EQU	10
F$READER	EQU	11
F$RDRT		EQU	12	; READ SECTOR FROM RT FILE
F$WRRT		EQU	13	; WRITE SECTOR TO RT FILE
F$CLOSE		EQU	14	; CLOSE RT WRITE FILE
F$MDMOUT	EQU	15	; MODEM OUTPUT FUNCTION
F$MDMIN		EQU	16	; MODEM INPUT FUNCTION
;
WBOOT	CALL	WAIT
	MVI	M,F$WBOOT	; Request Warm Boot Function
	LDA	DEFDK		; Get last CP/M default disk number
	STA	BOOTD		; Save it
WB1	MOV	A,M		; Wait for Warm Boot complete
	ORA	A		; Is function byte zero ?
	JNZ	WB1		; Wait if not (Cant use CALL WAIT1)

BOOT	MVI	A,JUMP		; jump opcode
	STA	0
	STA	5
	LHLD	WBVEC		; HL points to Warm Boot vector
	SHLD	1		; Store warm boot jump vector
	LHLD	BDVEC		; Pointer to BDOS
	SHLD	6		; Store BDOS vector
;
	LDA	BOOTD		; Get Disk # to boot from
	MOV	C,A		; Store it in C
	JMP	CCPVEC		; Start Console Command Processor

WAIT	LXI	H,FUNC		; Point to function byte
WAIT1	MOV	A,M		; Get function byte
	ORA	A		; Is it zero ?
	JNZ	WAIT1		; Wait if not
	RET

PUTC	CALL	WAIT		; Wait for 11 ready
	MOV	A,C
	STA	BUFFER		; Send byte to 11
	RET
;
; INPTR 0-15 CIRCULAR POINTER TO NEXT EMPTY LOCATION
; OUTPTR 0-15 CIRCULAR POINTER TO NEXT LOCATION FOR 11 TO REMOVE BYTE
; BBASE IS START OF BUFFER 16 BYTES
;
CONOUT	lda	cnbuf		;save mask in b
	mov	b,a
	LXI	H,INPTR
	MOV	A,M		; INPTR IN A
	INR	A		; IF INPTR+1=OUTPTR, BUFFER FULL
	ana	b	;mask modulo
	INX	H		; STEP TO OUTPTR
	CMP	M		; INPTR+1=OUTPTR??
	JZ	CONOUT		; LOOP FOREVER TILL 11 CHANGES OUTPTR
;  PUT CHAR IN BUFFER
	DCX	H		; BACK TO INPTR
	MOV	A,M		; INPTR EMPTY LOC
	MOV	L,A
	MVI	H,0
	LXI	D,BBASE
	DAD	D		; POINTS TO EMPTY BUF LOC (HL)
	MOV	M,C		; PUT AWAY CHAR
	LXI	H,INPTR
	MOV	A,M
	INR	A
	ana	b		; MODULO n
	MOV	M,A		; PUT INPTR+1 IN INPTR
	RET			; CHAR IN OUT BUF, RET

;

CONIN	CALL	WAIT
	MVI	M,F$CONIN	; Request Console Input function
GETA	MOV	A,M		; Wait for 11 to clear function byte
	ORA	A		; Is it zero ?
	JNZ	GETA		; If no, test it again
	LDA	BUFFER		; If yes, put byte from 11 into reg. A
	RET

;

CONST	LDA	CONRDY
	RET

;
;
; Patch to BIOS64.ASM so that output to the printer
; is sent instead to the terminal and then to the
; printer port of the terminal. For the Ann Arbor
; Ambassador terminal.
; The Ambassador uses the escape sequence: ESC [ 1 v
; to cause the next character to be redirected to the
; printer port.
; This patch causes 5 characters to be sent out throught
; the terminal port for each printer character. The printer ready
; test routine is also patched. It returns ready if at least
; space for 5 terminal characters exist in the terminal output
; circular buffer.
; To make the patch substitute this code for LIST AND LISTST
; routines in the existing BIOS64.ASM and call the new routine
; BIOSAA.ASM. To install:
;
; A>ASM BIOSAA
; A>GENSYS ; A		(Get system from A:)
; (return)	(Leave system in memory)
; A>SAVE 34 CPM64.COM	(Put in .COM file)
; A>DDT CPM64.COM
; -iBIOSAA.HEX
; -R2580
; -G0
; A>GENSYS  (Save system with new BIOS)
; (return)	(Take system from memory)
; B		(put new system on disk B, then use B: as A: to test.)
;
;
; Note: On older releases of the control program if the BIOS is too large
; it will not all be loaded into memory. The solution is to get the new
; release if this happens.
;
prev0:	db	0	;record of previous characters printed
prev1:	db	0
prev2:	db	0
;
;
list:	lda	prev1
	sta	prev2
	lda	prev0
	sta	prev1
	mov	a,c	;current char
	sta	prev0	;record of previous chars sent
	cpi	01ah	;see if current is ctrl-z
; if no escape previously, this is eof character
	jnz	list4
	lda	prev1
	cpi	27	;escape?
	jz	list4	;if yes, send char
	lda	prev2
	cpi	27
	rnz		;ignore all if ctrl-z without prev esc
list4:	mov	a,c
	push	b	;save char in c
	mvi	c,27	;esc
	call	conout
	mvi	c,'['
	call	conout
	mvi	c,'1'
	call	conout
	mvi	c,'v'	;end of escape sequence
	call	conout
	pop	b	;get char back in c
	jmp	conout	;and exit
; listst routine, checks of their is space for 5 bytes in output
; fifo. If so, it returns FF (ready) in A. Else zero returned.
listst:	lda	cnbuf	;get fifo address mask (15 or 63)
	mov	e,a	;stash in e
	lda	outptr	;output pointer for fifo
	mov	d,a	;put in d
	mvi	b,6	;count for test
	lda	inptr	;fifo input pointer
; if inptr+1 equals output ptr, then fifo is full
listt1:	inr	a
	ana	e	;mask
	cmp	d	;if inptr+1=outptr no room
	jz	listno
	dcr	b
	jnz	listt1
	mvi	a,0ffh	;yes, list ready
	ret
listno:	xra	a
	ret


PUNCH	CALL	PUTC
	MVI	M,F$PUNCH	; Request Punch Ouptut function
	RET
; OUT BYTE TO DLV11, BYTE IN C, CODE (OFFSET) IN B
MDMOUT	CALL	PUTC
	MOV	A,B	;CONTROL CODE
	STA	MDMCTB	;TO MODEM CONTROL BYTE
	MVI	M,F$MDMOUT	; Request Modem Output fuction
	RET
;
READER	CALL	WAIT
	MVI	M,F$READER	; Request a reader character
	JMP	GETA		; return with character in reg. A
; INPUT A BYTE FROM DLV11, CODE IN B, BYTE RETURNED IN A
MDMIN	CALL	WAIT
	MOV	A,B	;CONTROL CODE TO
	STA	MDMCTB	;MODEM CONTROL BYTE
	MVI	M,F$MDMIN	; Request a character from the Modem
	JMP	GETA		; return with character in reg. A

;

READ	CALL	WAIT
	MVI	M,F$DISKREAD	; Request Disk Read function
	JMP	WAIT1		; Return with A=0 (No error)

WRITE	CALL	WAIT
	MOV	A,C		; Get write type
	STA	IALLOC		; Save in 11 communication area
	MVI	M,F$DISKWRITE	; Request Disk Write function
	JMP	WAIT1		; Return with A=0 (No error)

;	Disk Read/Write of RT-11 files
;
; THE CPM PROGRAM MUST SAVE AND RESTORE THE DISK TABLES
; SO THAT CPM WON'T BECOME CONFUSED
;
RDRT	CALL	WAIT
	XRA	A		; Zero the EOF flag
	STA	EOF
	MVI	M,F$RDRT	; Request Read RT-11 function
	CALL	WAIT1		; Wait for completion
	LXI	H,EOF		; Point to End Of File flag
	MOV	C,M		; Return EOF flag in reg C
	RET

WRRT	CALL	WAIT
	MVI	M,F$WRRT	; Request Write RT-11 function
	JMP	WAIT1		; Return with A=0

CLOSE	CALL	WAIT
	MVI	M,F$CLOSE	; Request output close function
	RET
;
SETTRK	DW	B$STORE,TRACK	; Store Disk Track number
	RET

SETDMA	DW	B$STORE,DMA$ADR	; Store Disk buffer address
	RET

SETSEC	LXI	H,SECTOR	; Store Disk Sector number
	MOV	M,C		; Only use least sig. byte
	RET

SELDSK	LXI	H,NDISK		; WORD CONTAINING NUM OF DISKS
	MOV	A,C		; GET DISK NO REQUESTED
	CMP	M		; COMPARE TO NO AVAIL
	JZ	SELDE
	JNC	SELDE
	STA	DISKNO		; SET DISK NUMBER FOR 11
	ADD	A		; *2
	ADD	A		; *4
	ADD	A		; *8
	ADD	A		; *16
	MVI	H,0		; ZERO H
	MOV	L,A		; DISK NO *16 IN LOWER PART
	LXI	D,DPHES		; BASE OF TABLE
	DAD	D		; ADD BASE TO HL
	RET			; EXIT WITH HL

SELDE	LXI	H,0		; ERROR INDICATOR

HOME	RET			; Home function not implemented

; Performs the logical to physical sector mapping.
; Enter with logical sector number in "BC"
; Exit with physical sector number in "HL"

SECTRAN	MVI	H,0		; ZERO H
	MOV	L,C		; MOVE C TO LOWER
	RET			; Only use least significant byte

;

; RETURNS POINTER IN HL SO CPM PROGRAM CAN SAVE AND RESTORE
; THE DISK PARAMETERS. THE PARAMETERS CAN BE USED TEMPORARILY
; FOR RT TRANSFERS

SAVDSK	CALL	WAIT		; 11 MUST FINISH WITH TABLES
	LXI	H,DISKNO	; PTR TO TABLES
	RET

; BEGINNING OF DISK TABLES, FILLED IN BY 11

NDISK	DB	0		; NUMBER OF ENTRIES
DPHES	DB	0		; START OF DPH'S

	END
EEN 
                
 0F48 00        CLSSELECT   