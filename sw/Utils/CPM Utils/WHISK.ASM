;
;	COPYRIGHT 1987 WALLACE W. COX
;
;
DRIVUSER EQU	0004H		; Default drive and user ID.
;
BDOS	 EQU	0005H		; Define BDOS link pointer
;
CCPFCB1	 EQU	005CH
DMAAREA	 EQU	0080H		; Define CP/M default DMA area
TPA	 EQU	0100H
;
RCCFC	 EQU	01	; Define BDOS read console character code
WCCFC	 EQU	02	; Define BDOS write console character code
WCLFC	 EQU	05	; Define BDOS write LST: character code
DIOFC	 EQU	06	; Define BDOS direct console I/O function code
WCBFC	 EQU	09	; Define BDOS write console buffer code
GETSTRFC EQU	10	; Define BDOS read console buffer function code
RCSFC	 EQU	11	; Define BDOS read console status code
CPMVERFC EQU	12	; Define BDOS get CP/M version code
RSETDSKS EQU	13	; Define BDOS reset disks function code
SETDSKFC EQU	14	; Define BDOS set drive code
OPENFC	 EQU	15	; Define BDOS open disk file function code
READFC	 EQU	20	; Define BDOS read disk sector function code
SETDMAFC EQU	26	; Define BDOS set DMA code
GETDPBFC EQU	31	; Define BDOS get DPB code
;
SYSTMFCB EQU	05CH		; Default system FCB
FCBDRIVE EQU	00		; Disk name displacement
FCBFNAME EQU	01		; File name displacement
FCBFTYPE EQU	09		; File type displacement
FCBEXTNT EQU	12		; File extent displacement
FCBRECNT EQU	15		; Record count displacement
FCBNXTRC EQU	32		; Next record displacement
;
;
;
HEXFF	 EQU	0FFH
;
LF	 EQU	0AH		; Define line-feed byte
CR	 EQU	0DH		; Define carriage-return byte
CONTROLC EQU	'C'-'@'		; Define Ctrl-C byte
CONTROLP EQU	'P'-'@'		; Define Ctrl-P byte
CONTROLS EQU	'S'-'@'		; Define Ctrl-S byte
;
CLEARSCR			; Define Clear screen..
	 EQU	'L'-'@'		;  ..(^L for LSI and Wyse..
;	 EQU	'Z'-'@'		;   ..^Z for Sanyo)
;
FORMFEED EQU	'L'-'@'
;
;
BASETIME EQU	500		; Minimum display loop pacing value
;
ESC	 EQU	1BH	; Define "ESC" code for cursor positioning ESC sequence
CTLFACTR EQU	20H	; Adjustment factor for cursor positioning ESC sequence
;
SGMNTSIZ EQU	16		; Define size of one dump image line (segment)
SECTRSIZ EQU	128		; Define size of one CP/M sector
ASCOFSET EQU	(SGMNTSIZ*3)+2	; Define displacement of ASCII image in dump
;
FIRSTLIN EQU	0
FIRSTCOL EQU	0
;
CURBYLIN EQU	(SECTRSIZ/SGMNTSIZ)+3
CURBYCOL EQU	0
;
SINONLIN EQU	10
SINONCOL EQU	0
;
STATLIN	 EQU	20
STATCOL	 EQU	0
;
FULDRLIN EQU	64/4+2		; Position fulldirectory entry display two..
FULDRCOL EQU	0		;  ..lines beyond a 64 entry directory display
;
MESAGLIN EQU	22
MESAGCOL EQU	0
;
CMANDLIN EQU	23
CMANDCOL EQU	0
;
MAINLINE EQU	CURBYLIN+2
;
DIRMNLIN EQU	MESAGLIN
;
BREAK	 EQU	03H	; ^C
WSRIGHT	 EQU	0DH	; ^D
WSUP	 EQU	0EH	; ^E
BELL	 EQU	07H	; ^G
BAKSPACE EQU	08H	; ^H
LEFT	 EQU	08H	; ^H
TAB	 EQU	09H	; ^I
DOWN	 EQU	0AH	; ^J
UP	 EQU	0BH	; ^K
RIGHT	 EQU	0CH	; ^L
WSLEFT	 EQU	13H	; ^S
PAUSE	 EQU	13H	; ^S
OBLIQUE	 EQU	14H	; ^T
UNDOCMND EQU	15H	; ^U
CTRLW	 EQU	17H	; ^W
WSDOWN	 EQU	18H	; ^X
DEL	 EQU	7FH	; Delete (DEL)
;
;ARROWS     : SET OF CHAR = [^S, ^E, ^D, ^X, LEFT, UP, RIGHT, DOWN, OBLIQUE];
;HEX_ASCII  : ARRAY [FALSE..TRUE] OF STRING [9] = ('hex/ASCII', 'HEX/ascii');
;
UPCASMSK EQU	01011111B	; Define mask to force upper-case
PARTYMSK EQU	01111111B	; Define mask to clear parity bit
;
RETRYCNT EQU	5		; Define disk I/O retry count
LINBYTCT EQU	16		; Define number of bytes per dump line
MAXDRIVE EQU	15		; Define number of legal drives under CP/M
;
FNAMELEN EQU	8
FTYPELEN EQU	3
FSPECLEN EQU	FNAMELEN+FTYPELEN+1
;
;
DIRMEMLN EQU	32		; Define length of directory entry in memory
DIRSCRLN EQU	20		; Define length of directory entry on screen
NAMELEN	 EQU	11		; Define length of File-Name.File-Type string
;
MXDIRLIN EQU	16+CTLFACTR	; Define max directory screen line
MXDIRCOL EQU	(DIRSCRLN*4)+CTLFACTR	; Define max directory screen column
;
;HOMEHEAD EQU	3*08		; Define BIOS home head function
;SELDRIVE EQU	3*09		; Define BIOS drive select function
;SETTRACK EQU	3*10		; Define BIOS set track function
;SETSECTR EQU	3*11		; Define BIOS set sector function
;SETDMA   EQU	3*12		; Define BIOS set DMA function
;READDISK EQU	3*13		; Define BIOS read disk sector function
;WRITDISK EQU	3*14		; Define BIOS write disk sector function
;SECTRAN  EQU	3*16		; Define BIOS sector translate function
;
;
	ORG	100H
;
	JP	START
;
;
SECTRERR:	; Display "SEVERE ERROR" message and query user for action
;			; On Entry:	All values are in memory
;			; On exit:	All values are in memory
;			; A-reg and Flags are scratch
;
	PUSH	DE
	LD	DE,SECERMSG
	CALL	SHOMESAG
	CALL	GETRESP
	CALL	UPCASE
	CP	'C'
	JP	NZ,RESTART
	POP	DE
	RET
;
KBDPOLL:	; Polls keyboard for any keystroke (for "abort" tests, etc.)
;			; On entry:	No values are input
;			; On exit:	A-reg = data byte, or zero if none
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	C,DIOFC
	LD	E,HEXFF
	CALL	BDOS
	OR	A
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
TIMER:		; Loops for delay purposes
;			; On entry:	HL = Delay interval
;			; On exit:	No values are returned
;			; HL-reg, A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
TIMELOOP:
	DJNZ	$
	CALL	KBDPOLL
	JR	NZ,TIMEX
	DEC	L
	JR	NZ,TIMELOOP
	DEC	H
	JR	NZ,TIMELOOP
TIMEX:
	POP	DE
	POP	BC
	RET	
;
;
;
BLKTRACE:	; Build a block allocation table of all "CP/M Blocks"
;			; On Entry:	All values are in memory
;			; On exit:	All values are in memory
;			; A-reg and Flags are scratch
;
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	HL,DMAAREA	; Load DMA address into HL-reg
; NOTE:	This will work ONLY if DMA-Area IS BELOW 100H
	LD	A,4		; Load entries-per-sector count
BLKTRCL1:
	PUSH	AF		; Save entries-per-sector count
	INC	HL		; Set pointer to first byte of file name
	LD	A,(HL)		; Get first byte of file name
	LD	BC,15		; Bump pointer to first..
	ADD	HL,BC		;  ..block-pointer in entry
	CP	0E5H		; If this is NOT an UNUSED entry
	JR	NZ,BLKTRCL2	;  ..Then go to check the blocks for conflicts
	ADD	HL,BC		;  ..Else bump past..
	INC	HL		;   ..this directory entry..
	JR	BLKTRCL3	;    ..and go get next entry
BLKTRCL2:
	LD	A,(BLKPRENT)	; Load blocks-per-directory-entry count..
	LD	B,A		;  ..for DJNZ test
BLKTRCL4:
	LD	A,(BLKPRENT)	; Load blocks-per-entry and use it for the..
	SUB	16		;  .."One Byte per Entry" test
	LD	E,(HL)		; Get the low-order byte of the indicated..
	INC	HL		;  ..block number in E-reg and bump the pointer
	JR	Z,BYTPRENT	; If only 1 Byte/Entry then bypass second byte
	LD	A,(HL)		;  ..Else get high-order byte of indicated..
	INC	HL		;   ..block number and bump the pointer..
BYTPRENT:
	LD	D,A		; A-reg is either 0 OR the high-order byte
	PUSH	HL		; Save the directory entry block pointer
	OR	E		; If the Block # is zero..
	JR	Z,BLKTRCL5	;   ..then bypass that block entry
	LD	HL,(BLKARRAY)	; Get the Block Array starting address
	EX	DE,HL		; Save the Block Array address in DE-reg
	ADD	HL,DE		; Set block array pointer to indicated block..
	INC	(HL)		;  ..entry and increment that entry
	LD	A,(HL)		; Get that entry's new value
	DEC	A		; If this block only claimed by one file..
	JR	Z,BLKTRCL5	;  ..Then don't bump the "Block-Zero" entry..
	EX	DE,HL		;  ..Else restore the Block Array address and..
	INC	(HL)		;   ..add one to the "Block-Zero" entry..
BLKTRCL5:
	POP	HL		; Restore the directory entry block pointer
	DJNZ	BLKTRCL4	; Loop on the blocks-per-entry counter
BLKTRCL3:
	POP	AF		; Restore the entries-per-sector count
	DEC	A		; Loop on the..
	JR	NZ,BLKTRCL1	;  ..entries-per-sector count
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
;Get the directory:
;  Determine the CP/M Blocks for the Directory
;  For I := First Directory Block to Last Directory Block Do
;    Compute Sector Address of first Sector in Block
;    For J := 1 to (Sectors per Block) Do
;      Read Indicated Sector
;      Move Sector into Directory Array [ J ]
;      Check for double allocated blocks
;      Bump to next sector
;
GETDIR:		; Read directory into memory array
;			; On entry:	No values are in memory
;			; On exit:	No values are output
;			; All regs and Flags are scratch
;
	XOR	A
	DEC	A
	LD	(DIRUPDAT),A	; Set Directory-Updated flag to FALSE
;
	LD	HL,(STACKLMT)	; The quantity..
	LD	BC,(DTABLOKS)	;  ..
	XOR	A
	SBC	HL,BC		; (((STACKLMT - DTABLOKS) - DIRARRAY) DIV 100H)
	JP	C,TOOSMALL
	LD	DE,DIRARRAY	;   ..defines the maximum..
	SBC	HL,DE		;    ..bytes of memory..
	JP	C,TOOSMALL	;     ..in integer pages..
	LD	L,0		;      ..which can be..
	LD	(DIRMEMLM),HL	;	..contained in DIRARRAY
;
	LD	HL,(DIROFSET)	; Set directory..
	LD	(CURRTRAK),HL	;  ..starting track
	LD	HL,0		; Set directory..
	LD	(CURRSCTR),HL	;  ..starting sector
	LD	HL,(BLKPERDR)	; Compute..
	EX	DE,HL		;  ..total sectors..
	LD	A,(SECPERBK)	;   ..per directory..
	CALL	MULTIPLY	;    ..in HL-reg
	PUSH	HL		; Save total sectors per directory
;
	LD	D,H		; Divide total sectors per directory by two..
	SRA	D		;  ..to compute the..
	LD	A,L		;   ..total number of..
	RRA			;    ..memory pages needed..
	LD	E,A		;     ..to store the directory
	JR	NC,NOTODD	; If any carry, then increment..
	INC	DE		;  ..page count by 1
NOTODD:
	LD	HL,(DIRMEMLM)	; Restore directory memory byte size
	XOR	A		; Check whether..
	OR	D		;  ..page count > 255 pages!!
	JR	NZ,LIMITDIR	; Yes, so use as much as is available
	PUSH	HL		; Save directory memory byte size
	LD	D,E		; No, so make page count..
	LD	E,A		;  ..into BYTE count
	XOR	A		; Check whether entire directory..
	SBC	HL,DE		;  ..can fit in memory
	POP	HL		; (Restore directory memory byte size)
	JR	C,LIMITDIR	; No, the directory won't fit, use what's there
	EX	DE,HL		; Yes, it will, so swap in total space
;
LIMITDIR:
	LD	IX,DIRARRAY	; Set pointer to start of array
	PUSH	IX		; Compute..
	POP	DE		;  ..next available..
	ADD	HL,DE		;   ..data byte beyond directory array..
	LD	(BLKARRAY),HL	;    ..and save result..
	PUSH	HL		; Move resulting pointer..
	POP	DE		;  ..into DE-reg..
	INC	DE		;   ..and bump by one
	LD	(HL),0		; Set indicated byte to zero
	LD	BC,(MAXBLOKS)	; Load block count into count register
	LDIR			; Propagate the zero thru the rest of the array
	POP	HL		; Restore total sectors in directory to HL-reg
DIRSECLP:		; Sectors remaining is in L-reg
	LD	A,(SECPERTK)	; Load sectors..
	LD	B,A		;  ..per track
	LD	A,L		; If sectors per track..
	SUB	B		;  ..is greater than..
	JR	NC,DIRTRKLP	;   ..remaining sectors, then..
	LD	B,L		;    ..use remaining sectors as loop count
DIRTRKLP:
	PUSH	BC		; Save sector count-down value
	PUSH	HL		; Save total remaining sectors
	PUSH	IX		; Save directory array pointer
	LD	DE,DMAAREA	; Load DMA-area address..
	PUSH	DE		;  ..save it on the stack..
	CALL	SETDMART	;   ..and tell BDOS to use it
	CALL	GETSECTR	; Get the current sector
	CALL	NZ,SECTRERR	; Check for and alert user to SEVERE disk error
	CALL	BLKTRACE	; Check on block conflicts
	POP	HL		; Restore DMA-area address and..
	POP	DE		;  ..directory array pointer
	EX	DE,HL		; Swap current array address into HL-reg
	PUSH	HL		;  ..and save on stack
	LD	BC,(BLKARRAY)	; Check that array is NOT..
	SBC	HL,BC		;  ..overrunning block table
	POP	HL		; Restore current array pointer in case it's OK
	JR	NC,ARRAYFUL	; No, the array IS full
	EX	DE,HL		; Yes, The array is still OK, so..
	LD	BC,128		;  ..move sector image to..
	LDIR			;   ..directory array
	PUSH	DE		; Load next array entry address..
	POP	IX		;  ..into IX-reg
;
ARRAYFUL:
	LD	HL,(CURRSCTR)	; Bump..
	INC	HL		;  ..to next..
	LD	(CURRSCTR),HL	;   ..sector
	POP	HL		; Restore total remaining sectors
	POP	BC		; Restore sector count-down value
	DEC	HL		; Decrement total remaining sectors
;				; Decrement count of sectors remaining in..
	DJNZ	DIRTRKLP	;  ..this track and loop until it goes to zero
;
	PUSH	HL		; Save remaining sector count
	LD	HL,(CURRTRAK)	; Bump..
	INC	HL		;  ..to next..
	LD	(CURRTRAK),HL	;   ..track
	LD	HL,0		; Zero the..
	LD	(CURRSCTR),HL	;  ..current sector
	POP	HL		; Restore remaining sector count
	LD	A,L		; If remaining sector count..
	OR	A		;  ..has NOT been reduced..
	JR	NZ,DIRSECLP	;   ..to zero, then go get next track..
;
	RET			;    ..otherwise, return to caller
;
;
;
;  CheckForConflict
;    FOR L := 0 TO BlockCount DO
;      IF Block [K, L] = SearchBlock
;        THEN
;          BlockConflict := TRUE;
;          Display FileSpec [K] as a conflicting file;
;
CHCNFLCT:	; Scans directory entry block table, searching for matching..
;		;  ..block #.  On a match, the directry entry is displayed
;			; On Entry:	IX = Search Argument Block #
;			;		HL = Indicated Directory Entry
;			; On exit:	HL = Next Directory Entry
;			; All regs and Flags are scratch
;
	PUSH	IX		; Move Search Argument..
	POP	DE		;  ..Block # into DE-reg
	PUSH	HL		; Save indicated directory entry address
	LD	BC,16		; Bump HL-reg to First Block # in..
 	ADD	HL,BC		;  ..indicated Directory Entry
	LD	A,(BLKPRENT)	; Load Number of Blocks per Directory Entry..
	LD	B,A		;  ..into loop counter
CHCNFLUP:
	LD	C,0
	LD	A,(BLKPRENT)	; Load Number of Blocks per Directory Entry..
	SUB	8		;  ..and set up for ONE byte per block-table
	JR	NZ,NOTLARGE	; 
	INC	C		; Set up for TWO bytes per block-table
NOTLARGE:
	LD	A,(HL)		; If Search Argument Block # = 0
	OR	C		;  (one byte block #)
	JR	Z,CHCNFLX4	; ..Then go to end of block scan loop
	LD	A,(HL)		;  (two byte block #)
	INC	HL
	OR	(HL)
	JR	Z,CHCNFLX4	; ..Then go to end of block scan loop
	DEC	HL
	LD	A,(HL)		; If Search Argument Block # low-order byte..
	SUB	E		;  ..NOT equal to Indicated..
	INC	HL		;   ..Directory Block # Entry low-order byte..
	JR	NZ,CHCNFLX1	; ..Then go to test end of block scan loop
;
;	LD	A,E		; If Search Argument Block # low-order byte..
;	SUB	(HL)		;  ..NOT equal to Indicated..
;	INC	HL		;   ..Directory Block # Entry low-order byte..
;	JR	NZ,CHCNFLX1	; ..Then go to test end of block scan loop
;
	ADD	A,C		; If one byte per entry..
	JR	Z,CHCNFLX3	;  ..Then it's a hit, so go display full entry
	LD	A,D		; If Search Argument Block # high-order byte..
	SUB	(HL)		;  ..NOT equal to Indicated Directory Block..
	INC	HL		;    ..high-order byte..
	JR	NZ,CHCNFLX2	; ..Then go to test end of block scan loop..
CHCNFLX3:
	LD	(BLKCONSW),A	; ..Else set BlockConflict Switch and..
	POP	HL		; ..restore directory entry address..
	CALL	SHOFULDR	;  ..and display the file claiming the block..
;				;   ..(which also increments HL-reg to next
	RET			;    ..directory entry) and exit back to caller
;
CHCNFLX1:
	DEC	C		; If one byte per entry..
	JR	NZ,CHCNFLX2	;  ..Then don't bump HL-reg
	INC	HL		;  ..Else bump HL past high-order byte of entry
CHCNFLX2:
	DJNZ	CHCNFLUP	; If NOT all entries checked, then loop..
CHCNFLX4:
	POP	HL		;  ..Else restore directory entry address and..
CHCNFLP1:
	LD	BC,DIRMEMLN	;   ..bump HL-reg to..
 	ADD	HL,BC		;    ..next Directory Entry
	RET
;
;
;  ScanForConflict;
;    SearchBlock := Block [DirectoryPointer, J]
;    FOR K := 0 TO EntriesPerDirectory DO
;      IF K <> DirectoryPointer
;        THEN
;          CheckForConflict;
;
CONFLICT:	; Scans all directory entries for files claiming the..
;		;  ..indicated block
;			; On Entry:	HL = Search Argument Block #
;			; On exit:	HL = Validated block #
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL		; Save Search Argument Block # on stack..
	PUSH	HL		;  ..and copy..
	POP	IX		;   ..into IX-reg
;	LD	DE,FULDRCLR	; Position cursor below alloc array..
;	CALL	SHOMESAG	;  ..and clear next 6 lines
	LD	HL,(DIRNTRYS)	; Load number of directory entries..
	EX	DE,HL		;  ..into DE-reg (as loop-counter)
	LD	HL,DIRARRAY	; Load directory array memory addr. into HL-reg
CONFLOOP:
	PUSH	DE		; Save Directory entries count
	LD	DE,(POINTSAV)	; If Directory Pointer = HL-reg..
	LD	A,D		;  ..Then..
	SUB	H		;   ..BYPASS the check for block conflict..
	JR	NZ,CHCNCALL	;    ..because HL-reg points to the entry..
	LD	A,E		;     ..we are searching for conflicts WITH
	SUB	L
CHCNCALL:			;  ..Else..
	CALL	NZ,CHCNFLCT	;   ..DO call the Check-for-block-conflict 
	POP	DE		; Restore Directory entries count
	DEC	DE		; Decrement loop-counter
	LD	A,D		; Check for..
	OR	E		;  ..end-of-array
	JR	NZ,CONFLOOP	; If not end-of-array, then loop till it IS..
	POP	HL		; Restore Search Argument Block #
	POP	DE
	POP	BC
	RET
;
;
SHOTRPOS:	; Decodes Block # into Cursor co-ordinates within screen..
;		;  ..array, and validates and adjusts updated Block #
;			; On entry:	HL = Block # to be de-coded
;			; On exit:	HL = Validated block #
;			; All regs and Flags are scratch
	LD	DE,TRACEPOS	; Set cursor on screen at..
	CALL	SHOMESAG	;  ..start of alloc table
	EX	DE,HL
	LD	HL,(DTABLOKS)	; Set block counter
	EX	DE,HL
	XOR	A
	SBC	HL,DE
	JR	C,SHOTRMOV
	EX	DE,HL
	LD	(BLKPOINT),HL
;	
SHOTRMOV:
	DEC	A		; Make A-reg = all ones (Logical "False")
	LD	(BLKCONSW),A	; Set BlockConflict Switch OFF
	LD	HL,(BLKPOINT)
	LD	A,L
	CALL	SHOW2HEX
	LD	BC,32
	CALL	DIVIDE
	LD	A,L
	ADD	A,CTLFACTR
	LD	(DRSCRLIN),A
	LD	A,E
	ADD	A,A		; Double it, since each screen entry is 2 bytes
	ADD	A,CTLFACTR
	LD	(DRSCRCOL),A
	LD	DE,DRSCRPOS
	CALL	SHOMESAG
	LD	HL,(BLKPOINT)
	RET
;
;
;
;Process trace table (to identify conflicts):
;
;  Home cursor and display legend
;  Initialize block pointer
;  Repeat
;    Get and display files claiming indicated block
;    Poll keyboard
;    If input is cursor command
;      Then reposition cursor and Block pointer
;      Else process command
;  Until "Quit-Code" entered
;
SHOTRACE:	; Process directory block allocation conflicts
;			; On entry:	No values are in memory
;			; On exit:	No values are output
;			; All regs and Flags are scratch
	LD	HL,0		; Insure that Directory Pointer..
	LD	(DIRPOINT),HL	;   ..will not equal any DIRARRAY address
;
TRACEHOM:
	LD	HL,(BLKPERDR)	; Load starting Block # value
SHOTRCL1:
	LD	BC,0		; Load zero adjustment for "home" position
;
SHOTRCLP:
	ADD	HL,BC
	LD	A,H
	OR	L
	JR	Z,TRACEHOM
	LD	(BLKPOINT),HL
	CALL	SHOTRPOS
	LD	DE,FULDRCLR	; Position cursor below alloc array..
	CALL	SHOMESAG	;  ..and clear next 6 lines
	CALL	CONFLICT
	LD	DE,DRSCRPOS	; Re-position cursor..
	CALL	SHOMESAG	;  ..into block matrix
	CALL	GETRESP
	CP	ESC
	JR	Z,SHOTRXIT
;	LD	HL,CASETBL5
;	JP	C,CASE
;	LD	HL,CASETBL6
;	SUB	'?'
;	JR	C,SHOTRERR
;	CP	'?'-'!'
;	JP	C,CASE
	CP	'A'-'@'
	JR	Z,TRACEHOM
	CP	'D'-'@'
	JR	Z,SHOTRCRT
	CP	'E'-'@'
	JR	Z,SHOTRCUP
	CP	'F'-'@'
	JR	Z,SHOTRCRT
	CP	'H'-'@'
	JR	Z,SHOTRCLF
	CP	'J'-'@'
	JR	Z,SHOTRCDN
	CP	'K'-'@'
	JR	Z,SHOTRCUP
	CP	'L'-'@'
	JR	Z,SHOTRCRT
	CP	'S'-'@'
	JR	Z,SHOTRCLF
	CP	'T'-'@'
	JR	Z,TRACEHOM
	CP	'X'-'@'
	JR	Z,SHOTRCDN
	CP	'U'-'@'
	JR	Z,SHOTRCLF
	CP	'Z'-'@'
	JR	Z,SHOTRCUP
;
SHOTRERR:
	LD	DE,CMDERMSG
	CALL	SHOMESAG
	JR	SHOTRCL1	; Do NOT adjust HL-reg pointer!!
;
SHOTRCLF:
	LD	BC,-1
	JR	SHOTRCLP
;
SHOTRCRT:
	LD	BC,1
	JR	SHOTRCLP
;
SHOTRCUP:
	LD	BC,-32
	JR	SHOTRCLP
;
SHOTRCDN:
	LD	BC,32
	JR	SHOTRCLP
;
;
SHOTRXIT:
	RET
;
;
;
;Display the Directory:
;  Clear screen
;  Display column headers
;  If Directory Entries > Max Entries Per Screen
;    then
;      Screen Directory Entries := Max Entries Per Screen
;    else
;      Screen Directory Entries := Directory Entries
;  For I := 1 to Screen Directory Entries Do
;    Display Directory Entry Line [ I ] at Screen Line [ I + Offset ]
;
SHOBLOKS:	; Display all the Blocks Claimed by a directory entry
;			; On entry:	HL = Pointer to Block # in entry array
;			; On exit:	HL = Pointer to next Directory Entry
;			; All regs and Flags are scratch
	LD	A,(BLKPRENT)
	LD	B,A
	SUB	16
	LD	C,A
SHOBLKLP:
	LD	E,(HL)
	INC	HL
	LD	A,C
	OR	A
	JR	Z,SHOSMALL
	LD	A,(HL)
	INC	HL
SHOSMALL:
	LD	D,A
	EX	DE,HL
	LD	A,L
	CALL	NZ,SHOW4HEX	; If zero flag NOT set, SHOW4HEX WILL..
	CALL	Z,SHOW2HEX	;  ..NOT cause it to BE set, so only ONE..
;				;   ..routine will be called
	EX	DE,HL
	LD	A,' '
	CALL	SHOWBYTE
	DJNZ	SHOBLKLP
	RET
;
;
SHORECCT:	; Displays the Record Count value from a directory entry
;			; On entry:	HL = Pointer to Record Count in entry
;			; On exit:	No values are output
;			; All regs and Flags are scratch
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	E,(HL)
	EX	DE,HL
	LD	A,3
	CALL	SHOWDEC
	EX	DE,HL
	RET
;
SHOXTNTS:	; Displays the File Extent from a directory entry
;			; On entry:	HL = Pointer to File Extent in entry
;			; On exit:	No values are output
;			; All regs and Flags are scratch
	LD	DE,0
	LD	E,(HL)
	INC	HL
	EX	DE,HL
	LD	A,2
	CALL	SHOWDEC
	EX	DE,HL
	RET
;
SHOERAST:	; Displays "* " if a file is flagged as erased
;			; On entry:	HL = Pointer to Directory Entry
;			; On exit:	No values are output
;			; A-reg and Flags are scratch
	LD	A,(HL)
	CP	0E5H
	LD	A,' '
	JR	NZ,NOTERAST
	LD	A,'*'
NOTERAST:
	CALL	SHOWBYTE
	RET
;
SHOW1DIR:	; Display file name, extent, and record-count
;			; On entry:	HL = Pointer to File Name in Entry
;			; On exit:	No values are output
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	INC	HL
	LD	DE,OUTAREA
;				; Strip high-order bit from file name bytes..
;				;  ..and move them to an output area
	PUSH	DE
	LD	B,NAMELEN
SHO1LOOP:
	LD	A,(HL)
	AND	01111111B
	LD	(DE),A
	INC	DE
	INC	HL
	DJNZ	SHO1LOOP
;
	XOR	A		; Plug in a zero byte..
	LD	(DE),A		;  ..to stop the output
	POP	DE		; Restore the I/O area address..
	CALL	SHOMESAG	;  ..and call display routine
	LD	A,' '
	CALL	SHOWBYTE
	CALL	SHOXTNTS
	LD	A,' '
	CALL	SHOWBYTE
	CALL	SHORECCT
	LD	A,':'
	CALL	SHOWBYTE
	POP	HL
	POP	DE
	POP	BC
	RET
;
SHOWDIR:	; Display entire directory (or first 64 entries) from memory
;			; On entry:	All values are in memory
;			; On exit:	No values are output
;			; All regs and Flags are scratch
	LD	HL,(DIRNTRYS)	; Load total number of directory entries
	XOR	A
	LD	D,A
	ADD	A,H
	LD	A,64		; Load maximum # to be displayed
	JR	NZ,USEAVALU
	CP	L		; 
	JR	C,USEAVALU
	LD	A,L
USEAVALU:
	LD	E,A
	LD	HL,DIRARRAY	; Set pointer to start of array
SHODIRLP:
	CALL	SHOERAST
	CALL	SHOW1DIR
	LD	BC,DIRMEMLN
	ADD	HL,BC
	DEC	DE
	LD	A,E
	OR	D
	JR	NZ,SHODIRLP
	RET
;
SHOWUSER:	; Display the User-ID of the indicated file (or "* " if erased)
;			; On entry:	HL = Pointer to Directory Entry
;			; On exit:	No values are output
;			; All regs and Flags are scratch (except HL-reg)
	PUSH	HL
	LD	DE,ERASEMSG
	LD	A,(HL)
	CP	0E5H
	JR	Z,ERASED
	CALL	SHOW2HEX
	INC	DE
	INC	DE
ERASED:
	CALL	SHOMESAG
	POP	HL
	RET
;
SHOFULDR:	; Display full directory entry, including Allocated Blocks
;			; On entry:	HL = Pointer to Directory Entry
;			; On exit:	HL = Pointer to next Directory Entry
;			; All regs and Flags are scratch
;
	CALL	SHOWUSER
	CALL	SHOW1DIR
	LD	A,' '
	CALL	SHOWBYTE
	LD	BC,DIRMEMLN/2
	ADD	HL,BC
	CALL	SHOBLOKS
	CALL	SENDCRLF
	LD	DE,CLEAREOL
	CALL	SHOMESAG
	RET
;
;
;Process the Directory:
;  If any Directory sectors have been written
;    then
;      Get the directory
;  Display the Directory
;  Display the directory edit menu
;  Set Entry Pointer to First Entry
;  Repeat
;    Set cursor to Indicated Screen Entry
;    Get InChar
;    If InChar NOT a valid response
;      then
;        Ring the bell
;      else
;        If InChar a Cursor Move Character
;          then
;            Adjust Entry Pointer
;          else
;            Determine and Perform Desired Action
;  Until InChar = ESC
;  Set up to display "Directory NOT Modified!" Message
;  If Directory has been modified
;    then
;      Ask if directory is to be re-written
;      If response is "Y"
;        then
;          Re-Write Directory
;          Set up to display "Directory Modified!" Message
;  Display Indicated Message
;
SHODRMNU:	; Display Directory Functions Menu
;			; On entry:	HL = Pointer to Directory Entry
;			; On exit:	No values are output
;			; DE-reg, A-reg and Flags are scratch
;
	LD	DE,DIRMENU
	CALL	SHOMESAG
	RET
;
DIRHOME:	; Set cursor position values and Directory Array address
;			; On entry:	No values are input
;			; On exit:	HL = Start of Directory Array
;			; A-reg and Flags are scratch
;
	LD	A,BELL
	CALL	SHOWBYTE
	LD	A,CTLFACTR	; Set screen pointers..
	LD	(DRSCRCOL),A	;  ..to first column..
	INC	A
	LD	(DRSCRLIN),A	;   ..and line
	LD	HL,DIRARRAY	; Load directory memory array pointer to start
	RET
;
SHODIRHD:	; Display directory header line
;			; On entry:	No values are input
;			; On exit:	No values are output
;			; DE-reg, A-reg and Flags are scratch
;
	LD	A,CLEARSCR	; Clear..
	CALL	SHOWBYTE	;  ..screen..
	CALL	SHODRMSG
	CALL	SHODRMSG
	CALL	SHODRMSG
SHODRMSG:
	LD	DE,DIRHEAD
	CALL	SHOMESAG
	RET
;
;
SHOALLOC:	; Display Block Allocation Trace Table
;			; On entry:	HL = Pointer to Block Trace Table
;			; On exit:	Carry flag ON if alloc review requested
;			; All regs and Flags are scratch
;
	LD	DE,TRACLGND
	CALL	SHOMESAG
	EX	DE,HL
	LD	HL,(DTABLOKS)
	INC	HL
	EX	DE,HL
SHOALCL1:
	LD	B,32
SHOALCL2:
	LD	A,(HL)
	INC	HL
	CALL	SHOW2HEX
	DEC	DE
	LD	A,D
	OR	E
	SCF
	RET	Z
	DJNZ	SHOALCL2
	CALL	SENDCRLF
	JR	SHOALCL1
;
;
CHKTRACE:	; Check if any block allocation conflicts were found, and..
;		;  ..if so, ask user if (s)he wants to review the alloc table
;			; On entry:	No values are input
;			; On exit:	Carry flag ON if alloc review requested
;			; All regs and Flags are scratch
;
	LD	A,CLEARSCR	; Clear..
	CALL	SHOWBYTE	;  ..screen..
	LD	HL,(BLKARRAY)
	LD	A,(HL)
	OR	A
	RET	Z
	LD	DE,TRACEQRY
	CALL	SHOMESAG
	CALL	GETRESP
	AND	UPCASMSK
	CP	'Y'
;	SCF
;	CCF
	CALL	Z,SHOALLOC
	RET
;
;
XTNTSCAN:	; For every block in this directory entry..
;		;  ..scan all blocks in entire directory for conflict..
;		;  ..with indicated block
;			; On entry:	HL = Pointer to Directory Entry
;			; On exit:	No values returned
;			; A-reg and Flags are scratch
;
;        FOR J := 0 TO BlockCount DO
;          ScanForConflict;
;
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	(POINTSAV),HL	; Prevent reporting conflict with self
	LD	BC,16
	ADD	HL,BC
;
	LD	A,(BLKPRENT)
	LD	B,A
	SUB	16
	LD	C,A
XTNTBLKL:
	LD	E,(HL)
	INC	HL
	LD	A,C
	OR	A
	JR	Z,XTNTSMAL
	LD	A,(HL)
	INC	HL
XTNTSMAL:
	LD	D,A		; If block..
	OR	E		;  ..number = 0..
	JR	Z,XTNTLEND	;   ..then exit conflict check loop
	EX	DE,HL
	CALL	CONFLICT
	EX	DE,HL
	DJNZ	XTNTBLKL
XTNTLEND:
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
;
UNERIDER:
	LD	DE,UNEUSRER
	CALL	SHOMESAG
;
UNERASE:	; Unerase the Directory entry indicated by cursor
;
;    Determine what User-ID to unerase into;
;
	LD	DE,UNEUSRPR	; Display Unerase..
	CALL	SHOMESAG	;  ..User-ID prompt:
	CALL	GETDEC		; Get User-ID
	LD	A,H		; Make sure it is valid
	OR	A
	JR	NZ,UNERIDER
	LD	A,L
	CP	16
	JR	NC,UNERIDER	; Not valid, Request Re-entry
;
;    ExtentSub := 0;
;    DirectoryPointer := 0;
;    ExtentArray := 0;		; { Clear ALL extent array entries to zero. }
;
	LD	(FILESPEC),A	; Valid User-ID, so..
	XOR	A		;  ..save it and..
	LD	(EXTNTSUB),A	;   ..set Extent Subscript to zero
	LD	HL,EXTNTARY
	PUSH	HL
	POP	DE
	INC	DE
	LD	(HL),A
	LD	BC,XTNTARLN-1
	LDIR
	LD	HL,DIRARRAY	; Initialize directory..
	LD	(DIRENTRY),HL	;  ..entry pointer
;
;    CurrentFileSpec := ArrayFileSpec [CurrentPointer]
;
	LD	HL,(DIRPOINT)	; Set HL-reg to indicated directory entry
	INC	HL		; Bump past User-ID byte
	LD	DE,FILESPEC+1	; Move indicated file-spec..
	LD	BC,FSPECLEN-1	;  ..to..
	LDIR			;   ..work area
;
	LD	A,CLEARSCR	; Clear..
	CALL	SHOWBYTE	;  ..screen..
;
;    WHILE DirectoryPointer <= EntriesPerDirectory DO
;
DOWHILE1:
	LD	DE,(DIRNTRYS)
	LD	A,DIRMEMLN
	CALL	MULTIPLY
	LD	DE,DIRARRAY
	ADD	HL,DE
	EX	DE,HL
	LD	HL,(DIRENTRY)
	XOR	A
	SBC	HL,DE
	JR	NC,ENDWHIL1
;
;      IF (FileSpec [DirectoryPointer] = is an ERASED file)
;        AND (FileSpec [DirectoryPointer] = CurrentFileSpec)
;
	LD	HL,(DIRENTRY)
	LD	A,(HL)
	CP	0E5H
	JR	NZ,ENDIF1
	INC	HL
	LD	DE,FILENAME
	LD	B,FSPECLEN-1	; Compare all bytes of entry except userid
STARTIF1:
	LD	A,(DE)
	CP	(HL)
	JR	NZ,ENDIF1
	INC	DE
	INC	HL
	DJNZ	STARTIF1
;
;        THEN
;          IF ExtentSub < Extent [DirectoryPointer]
;
	LD	E,(HL)
	LD	D,0
	LD	A,(EXTNTSUB)
	CP	E
	JR	NC,ENDIF2
;            THEN
;              ExtentSub := Extent [DirectoryPointer];
;
	LD	A,E
	LD	(EXTNTSUB),A
;
ENDIF2:
;
;          ExtentArray [Extent [DirectoryPointer]] := DirectoryPointer;
	LD	HL,EXTNTARY
	ADD	HL,DE
	ADD	HL,DE
	LD	DE,(DIRENTRY)
	LD	(HL),E
	INC	HL
	LD	(HL),D
;
	EX	DE,HL
	CALL	SHOFULDR
;	
ENDIF1:
;
;      DirectoryPointer := DirectoryPointer + 1;
	LD	HL,(DIRENTRY)
	LD	DE,DIRMEMLN
	ADD	HL,DE
	LD	(DIRENTRY),HL
	JR	DOWHILE1
;
ENDWHIL1:
;
;    FOR I := 0 TO ExtentSub DO
;      DirectoryPointer := ExtentArray [ I ];
;
	LD	DE,0
UNERALP2:
	LD	HL,EXTNTARY
	ADD	HL,DE
	ADD	HL,DE
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
;
;      IF ExtentArray [ I ] <> 0
;	 THEN
;	   ScanAllBlocksForConflict;
;
	OR	H
	CALL	NZ,XTNTSCAN
;
	LD	A,(EXTNTSUB)
	INC	DE
	SUB	E
	JR	NC,UNERALP2
;
;    IF NOT BlockConflict
;
	LD	A,(BLKCONSW)
	OR	A
	RET	NZ
;
;      THEN
;        FOR I := 0 TO ExtentSub DO
;          User-ID [ExtentArray [ExtentSub]] := User-ID;
;
FORDO1:
	LD	DE,0
	LD	A,(USERID)
	LD	C,A
UNERALP1:
	LD	HL,EXTNTARY
	ADD	HL,DE
	ADD	HL,DE
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	OR	H
	JR	Z,MSNGXTNT	; Missing extent in extent array
	LD	(HL),C
MSNGXTNT:
	LD	A,(EXTNTSUB)
	INC	DE
	SUB	E
	JR	NC,UNERALP1
;
	LD	(DIRUPDAT),A	; Set Directory-Updated flag to TRUE (0)
	CALL	REPAINT
REPAINT:
	RET
;
;
FORCTRAC:	; Display block allocation map on user request
;			; On entry:	No values are input
;			; On exit:	No values are output
;			; All regs and Flags are scratch
;
	LD	HL,(BLKARRAY)
	CALL	SHOALLOC
	CALL	SHOTRACE
	JR	FORCTRAX	; Re-enter Process Directory loop
;
;
PROCSDIR:	; Process the directory display and edit functions
;			; On entry:	No values are input
;			; On exit:	No values are output
;			; All regs and Flags are scratch
;
	CALL	GETDIR		; Build an array of directory entries in memory
	CALL	CHKTRACE	; Check if any multiply allocated blocks found
FORCTRAX:	; Re-entry point for forcing trace display
	CALL	C,SHOTRACE	; If so, display alloc map if user wishes it
	CALL	SHODIRHD	; Display directory header line
	CALL	SHOWDIR		; Display one screen of directory entries
	CALL	SHODRMNU	; Display the directory edit menu
	CALL	DIRHOME		; Initialize cursor position
DIRLOOP:
	LD	(DIRPOINT),HL
	LD	(POINTSAV),HL
	LD	DE,FULDRCLR
	CALL	SHOMESAG
;	LD	DE,DRTRCMNU
;	CALL	SHOMESAG
	LD	DE,FULDRPOS
	CALL	SHOMESAG
	CALL	SHOFULDR
DIRERENT:	; Re-entry point for invalid directory function error
	LD	DE,DRSCRPOS
	CALL	SHOMESAG
;
DIRPOLL:
	CALL	KBDPOLL
	JR	Z,DIRPOLL
;=;	CP	DEL			; Test for..
;=;	JR	Z,UNDOEDIT		;  ..Un-Do command
;=;	CP	UNDOCMND		; Test for alternate (WS style)..
;=;	JR	Z,UNDOEDIT		;  ..Un-Do command
;=;	LD	(UNDOFLAG),A		; Set value of un-do FLAG
	LD	HL,CASETBL4		; Set up for..
	CP	'0'
	SCF				; Set Carry for forcing trace display
	JR	Z,FORCTRAC
	CP	'1'
	JP	Z,UNERASE
	CP	ESC			;  ..control character command
	JR	Z,UPDATDIR		; <ESC> is the EXIT command
	JR	NC,DIRCMDER		; Anything > <ESC> is invalid
; CP	'Z'-'@'+1		; In fact, RIGHT NOW..
; JR	NC,DIRCMDER		;  ..anything > ^Z is invalid
	CALL	CASE			; Input is a cursor move command
	LD	HL,0
	LD	A,(DRSCRCOL)
	SUB	CTLFACTR
	JR	Z,CALCLINE
	LD	L,A
	LD	BC,DIRSCRLN
	CALL	DIVIDE
CALCLINE:
	EX	DE,HL
	LD	HL,0
	LD	A,(DRSCRLIN)
	SUB	1+CTLFACTR
	JR	Z,CALCCOLM
	LD	L,A
	ADD	HL,HL
	ADD	HL,HL
CALCCOLM:
	ADD	HL,DE
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	EX	DE,HL
	LD	HL,DIRARRAY	; Recover directory memory array..
	ADD	HL,DE		;  ..pointer and add adjustment factor
	JR	DIRLOOP		; Go to get and process next input
;
UPDATDIR:
	LD	A,CLEARSCR
	CALL	SHOWBYTE
	CALL	HOMEADDR	; Reset Track/Sector address to Directory
	CALL	SHOWMENU
	RET
;
;
DIRCMDER:	; Invalid command in Directory Edit Mode
	
	EX	(SP),HL		; Strip last item off of stack..
	POP	HL		;  ..without losing anything
	LD	DE,CMDERMSG	; Alert user..
	CALL	SHOMESAG	;  ..to goof-up
	JR	DIRERENT	; Go to continue polling user
;
;
BUMPLINE:
	LD	A,(DRSCRLIN)
	INC	A
	CP	MXDIRLIN+1
	JR	C,NOWRAPDN
	LD	A,BELL
	CALL	SHOWBYTE
	LD	A,1+CTLFACTR
NOWRAPDN:
	LD	(DRSCRLIN),A	; Save updated directory screen line
	RET
;
;
DROPLINE:
	LD	A,(DRSCRLIN)	; Get current directory screen line
	DEC	A		; Back up to previous line
	CP	1+CTLFACTR	; If too far back..
	JR	NC,NOWRAPUP
	LD	A,BELL
	CALL	SHOWBYTE
	LD	A,16+CTLFACTR
NOWRAPUP:
	LD	(DRSCRLIN),A	; Save updated directory screen line
	RET
;
;
BUMPNTRY:
	LD	A,(DRSCRCOL)
	ADD	A,DIRSCRLN
	CP	MXDIRCOL
	JR	C,NOWRAPFO
	LD	A,0+CTLFACTR
NOWRAPFO:
	LD	(DRSCRCOL),A	; Save updated directory screen column
	CALL	NC,BUMPLINE
	RET
;
;
DROPNTRY:
	LD	A,(DRSCRCOL)
	SUB	DIRSCRLN
	CP	CTLFACTR
	JR	NC,NOWRAPBK
	LD	A,MXDIRCOL-DIRSCRLN
NOWRAPBK:
	LD	(DRSCRCOL),A	; Save updated directory screen column
	CALL	C,DROPLINE
	RET
;
;
;=====================================================================;
TRACE:
	EX	(SP),HL
	PUSH	AF
	CALL	SHOWWORD
	PUSH	HL
	LD	HL,1000
	CALL	TIMER
	POP	HL
	POP	AF
	EX	(SP),HL
	RET
;
;
SETDMART:	; Sets the DMA area
;			; On entry:	DE = New DMA area address
;			; On exit:	Zero flag set if everything was OK
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	C,SETDMAFC
	CALL	BDOS
	POP	HL
	POP	DE
	POP	BC
	RET	
;
;
CPMVER:		; Obtains the CP/M version from BDOS
;			; On entry:	No values are input
;			; On exit:	No values are returned
;			; A-reg and Flags are scratch
;
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	C,CPMVERFC
	CALL	BDOS
	POP	HL
	POP	DE
	POP	BC
	RET	
;
;
CHEKDRIV:	; Checks for a valid drive ID.
;			; On entry:	A = Drive ID (as a letter)
;			; On exit:	HL = DPB address OR 0 if drive invalid
;			;		C = Drive ID (in binary)
;			; All regs and Flags are scratch
; CALL TRACE
	AND	UPCASMSK		; Force to upper-case.
	SUB	'A'			; Convert drive letter to number and..
	RET	C			;  ..abort if not "A".."?"
	LD	C,A			; Save drive # in C-reg.
	LD	A,MAXDRIVE		; Syntax error..
	CP	C			;  ..if not "A".."P"
	RET	C
	PUSH	BC
	CALL	SELDRIVE		; Call BIOS select drive routine
	LD	A,L			; If HL-reg = 0..
	OR	H			;  ..Then..
	SCF				;   ..drive is invalid..
	POP	BC			;    ..so return with..
	RET	Z			;      ..carry flag SET..
	CCF				;  ..Else
	RET				;   ..return with carry flag RESET
;
;
DIVIDE:		; Divides 16-bit dividend by 16-bit divisor, giving..
;		;  ..16-bit quotient
;			; On entry:	HL = Dividend, BC = Divisor
;			; On exit:	HL = Qoutient, DE = Remainder..
;			; If carry is clear, then zero-divide was attempted
;			; All regs and and Flags are scratch
	LD	A,C		; Test for division by zero..
 	RRA			;  ..or 1, return with carry..
 	OR	B		;   ..clear on zero-divide..
 	RET	Z		;    ..error, carry set if anything else
	SCF			; Force "zero divide" flag to OFF
	LD	DE,0		; Set quotient/remainder value to zero
	LD	A,L		; If dividend is zero..
	OR	H		;  ..then return a quotient of zero..
	RET	Z		;   ..and a remainder of zero 
	XOR	A
DIVIDLUP:
	SBC	HL,BC		; Subtract one divisor value
	INC	DE		; Bump quotient by one
	JR	NC,DIVIDLUP	; Loop until remainder goes  negative
	ADD	HL,BC		; Back up remainder by one divisor value
	DEC	DE		; Back up quotient by one
	EX	DE,HL		; Swap remainder and quotient
	SCF			; Reset "zero divide" flag to OFF
	RET
;
;
MULTIPLY:	; Multiply a 16-bit multiplicand by an 8-bit multiplier
;			; On Entry:	DE = Multiplicand, A = Multiplier
;			; On Exit:	HL = Product
;			; A-reg & Flags are scratch
	PUSH	BC
	LD	B,8
	LD	HL,0
MULTLOOP:
	ADD	HL,HL
	ADD	A,A
	JR	NC,PASCOUNT
	ADD	HL,DE
PASCOUNT:
	DJNZ	MULTLOOP
	POP	BC
	RET
;
;
DECODEIT:		
	CP	CONTROLC		; Abort??
	SCF				;   (Set carry flag, just in case)
	RET	Z			;   Yes - exit with ABORT flag set
	CP	'9'+1			;   Scroll speed or pause (1-9 or 0)?
	RET	NC			;   > 9, so exit back to caller
	SUB	'0'			; Convert digit to binary
	CCF				;   Invert carry flag
	RET	NC			;   < 0, so exit back to caller
	JR	NZ,SETTIMER		;   1..9, so go set new delay value
PAUSELUP:
	CALL	KBDPOLL			;   It is a pause (input=0), so..
	JR	Z,PAUSELUP		;    ..test for..
	JR	DECODEIT		;     ..restart
;
SETTIMER:				; Set scroll speed
	LD	DE,BASETIME		; Set multiplier
	CALL	MULTIPLY		; Multiply user digit by multiplier
	LD	(DUMPDLAY),HL		; Set new dump delay value
	RET				; Exit back to caller
;
;
BLANKSCR:	; Clears screen; also forces form-feed if LST: echo is on
;			; On entry:	No values are input
;			; On exit:	No values are returned
;			; A-reg and Flags are scratch
	
	PUSH	BC
	PUSH	DE
	LD	E,CLEARSCR
	LD	C,WCCFC
	CALL	BDOS
	LD	A,(PRNTTOGL)
	OR	A
	JR	Z,NOOVRFLO
	LD	E,FORMFEED
	LD	C,WCLFC
	CALL	BDOS
NOOVRFLO:
	POP	DE
	POP	BC
	RET
;
;
SHOWBYTE:	; Displays a byte to screen
;			; On entry:	A = Input byte
;			; On exit:	No values are returned
;			; All regs and Flags are SAVED
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	E,A
	LD	C,WCCFC
	CALL	BDOS
	POP	HL
	POP	DE
	POP	BC
	POP	AF
	RET	
;
;
SENDCRLF:	; Displays a carriage-return/line-feed to screen
;			; On entry:	No values are input
;			; On exit:	No values are returned
;			; A-reg is scratch
	LD	A,CR		; Send..
	CALL	PRNTCHAR	;  ..CR,..
	LD	A,LF		;   .. LF..
PRNTCHAR:	; Displays a byte to screen (And to printer, if PRNTTOGL is on)
;			; On entry:	A = Input byte
;			; On exit:	No values are returned
;			; All regs and Flags are SAVED
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	CALL	SHOWBYTE
	LD	E,A		; Save data byte for Printer Echo
	LD	A,(PRNTTOGL)	; Test print toggle
	OR	A		; If print-echo NOT on..
	JR	Z,DONTECHO	;  ..then bypass print echo..
	LD	C,WCLFC		;  ..else echo data to printer..
	CALL	BDOS		;   ..as well as screen
DONTECHO:
	POP	HL
	POP	DE
	POP	BC
	POP	AF
;
NULLRUTN:	; Dummy routine (just an EXIT)
	RET	
;
;
TOGLPRNT:	; Toggle the LST: echo switch
;			; On entry:	No values are input
;			; On exit:	Zero-flag set
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	A,(PRNTTOGL)	; Get the LST: toggle value
	CPL			; Reset to new value
	OR	A		; Are we turning it off?
	JR	Z,DONTRING	; Yes, so don't warn the user
	PUSH	AF		; No, we're turning it on, so..
	LD	A,BELL		;  ..warn the..
	CALL	PRNTCHAR	;   ..user
	POP	AF		; Restore the LST: toggle value
DONTRING:
	LD	(PRNTTOGL),A	; Set LST: echo to new value
	XOR	A		; Force zero flag
	POP	HL
	POP	DE
	POP	BC
	RET	
;
;
GETRESP:	; Polls keyboard until any keystroke, then reads it
;			; On entry:	No values are input
;			; On exit:	A-reg = data byte
;			; Flags are scratch
	CALL	KBDPOLL		; Loop on Keyboard..
	JR	Z,GETRESP	;  ..until user types a byte
	AND	PARTYMSK	; Clear any possible parity bit
	CP	' '		; If input is displayable..
	CALL	NC,SHOWBYTE	;  ..then echo it to the screen
	RET	
;
;
GETINPUT:	; Polls keyboard until any keystroke, then reads it
;			; On entry:	No values are input
;			; On exit:	A-reg = data byte
;			; Flags are scratch
	CALL	KBDPOLL		; Loop on Keyboard..
	JR	Z,GETINPUT	;  ..until user types a byte
	CP	CONTROLP	; Is user setting or resetting LST: echo?
	CALL	Z,TOGLPRNT	; Yes, so call the LST: echo toggle routine
	RET	
;
;
DSPLYRTN:	; Displays a string (terminated by a zero byte) to screen
;			; On entry:	DE = Address of string to be displayed
;			; On exit:	Zero flag set if I/O was OK
;			; DE-reg, A-reg and Flags are scratch
DSPLYLUP:
	LD	A,(DE)
	INC	DE
	OR	A
	CALL	NZ,PRNTCHAR
	JR	NZ,DSPLYLUP
	RET	
;
;
SHOMESAG:	; Displays an error message to the screen (as a buffer string)
;			; On entry:	DE = Address of string to be displayed
;			; On exit:	No values returned
;			; DE-reg, A-reg and Flags are scratch
	LD	A,(PRNTTOGL)	; Save print-echo..
	PUSH	AF		;  ..toggle, then
	XOR	A		;   ..force print-echo OFF..
	LD	(PRNTTOGL),A	;    ..temporarily
	CALL	DSPLYRTN	; Display message
	POP	AF		; Restore..
	LD	(PRNTTOGL),A	; ..print-echo toggle
	RET
;
;
CLEARMSG:	; Clears any previous error message from the screen
;			; On entry:	No values passed
;			; On exit:	Zero flag set if I/O was OK
;			; DE-reg is scratch; A-reg and Flags are SAVED
	PUSH	AF
	LD	DE,BLANKMSG
	CALL	SHOMESAG
	LD	DE,BLANKLIN
	CALL	SHOMESAG
	POP	AF
	RET
;
;
;
BUILDDEC:	; Builds the decimal value of a word, as: "01234"
;			; On entry:	HL = Input word
;			; On exit:	Decimal value is in (NUMWORK)
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	EX	DE,HL
	LD	HL,NUMWORK
	LD	(INDEXSAV),HL
	EX	DE,HL
	LD	B,0
	LD	DE,-10000
	CALL	SUBTR
	LD	DE,-1000
	CALL	SUBTR
	LD	DE,-100
	CALL	SUBTR
	LD	DE,-10
	CALL	SUBTR
	LD	A,L
	ADD	A,'0'
	LD	HL,(INDEXSAV)
	LD	(HL),A
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
SUBTR:		; Computes the one digit decimal quotient (expressed as..
;		;  ..an ASCII character) of a 16-bit binary dividend divided..
;		;   ..by a 16-bit binary divisor representing some power of 10
;			; On entry:	HL = Dividend, DE = Power of 10 value
;			; On exit:	C-reg = ASCII quotient
;			; DE-reg, C-reg, A-reg and Flags are scratch
;			; Also saves digit in (NUMWORK) and bumps (INDEXSAV)
	LD	C,'0'-1
SUBTR2:
	INC	C
	ADD	HL,DE
	JR	C,SUBTR2
	SBC	HL,DE
	EX	DE,HL
	LD	HL,(INDEXSAV)
	LD	(HL),C
	INC	HL
	LD	(INDEXSAV),HL
	EX	DE,HL
	RET
;
;
SHOWDEC:	; Displays a word in decimal, as: "01234"
;			; On entry:	HL = Input word, A = Field width
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	B,A		; Save field width
	CALL	BUILDDEC
	LD	DE,NUMWORK
	LD	HL,0
	XOR	A
	SUB	B
	JR	Z,ZEROSUPP
	ADD	A,6
	LD	L,A
	JR	CALCSHFT
;
ZEROSUPP:
	LD	A,(DE)
	CP	'0'
	INC	DE
	JR	Z,ZEROSUPP
	OR	A
	JR	NZ,CALCSHFT
	DEC	DE
;
CALCSHFT:
	DEC	HL
	ADD	HL,DE
	EX	DE,HL
	CALL	DSPLYRTN
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
SHOW2HEX:	; Displays a byte in hex, as: "D2"
;			; On entry:	A = Input byte
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	AF			; Save input byte
	RRA
	RRA
	RRA
	RRA
	CALL	SHOW1HEX
	POP	AF			; Restore input byte
SHOW1HEX:	; Displays a nibble in hex, as: "D"
;			; On entry:	A = Input byte
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	AND	0FH
	CP	10
	JR	C,HEX2
	ADD	A,'A'-('9'+1)
HEX2:
	ADD	A,'0'
	CALL	PRNTCHAR
	RET
;
SHOW4HEX:	; Displays a word in hex, as: "04D2" (High order byte first!)
;			; On entry:	HL = Input word
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	LD	A,H
	CALL	SHOW2HEX
	LD	A,L
	CALL	SHOW2HEX
	RET
;
SHOWWORD:	; Displays a word in hex, as: "(04D2)"
;			; On entry:	HL = Input word
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	LD	A,'('
	CALL	PRNTCHAR
	CALL	SHOW4HEX
	LD	A,')'
	CALL	PRNTCHAR
	RET
;
SHOWDCHX:	; Displays a word in both decimal and hex, as: "01234 (04D2)"
;			; On entry:	HL = Input word, A = Field width
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	CALL	SHOWDEC
	LD	A,' '
	CALL	PRNTCHAR
	CALL	SHOWWORD
	RET
;
;
SHOWBIN:	; Displays a data byte in binary, as "10101100"
;			; On entry:	A = data byte
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	LD	C,A
	LD	B,8
BIT2:
	LD	A,C
	ADD	A,A
	LD	C,A
	LD	A,'0'/2
	ADC	A,A
	CALL	PRNTCHAR
	DJNZ	BIT2
	POP	BC
	RET
;
;
GETDEC:		; Reads a decimal number from console and stores it in memory
;			; On entry:	No values input
;			; On exit:	HL = Binary value of decimal input
;			; All Regs and Flags are scratch
	LD	HL,0		; Initialize counter
	LD	B,L		; Zero high-order half of BC-reg pair
GETDECLP:
	CALL	KBDPOLL		; Get..
	JR	Z,GETDECLP	;  ..data byte
	CP	CR		; Is it end of input?
	RET	Z		; Yes, return counter value to caller in HL
	CALL	SHOWBYTE	; Echo input byte to screen
	SUB	'0'		; No, make data byte relative to binary 0
	RET	C		; If any error, then..
	CP	10		;  ..return to caller..
	CCF			;   ..with carry flag..
	RET	C		;    ..set
	LD	C,A		; Move binary value to BC-reg
	ADD	HL,HL		; Multiply binary counter value by 10
	PUSH	HL		;  ..
	POP	DE		;   ..
	ADD	HL,HL		;    ..
	ADD	HL,HL		;     ..
	ADD	HL,DE		;      ..
	ADD	HL,BC		; Add in new units digit
	JR	GETDECLP
;
;
SHOWBLOK:	; Displays current CP/M Block # (for status line & headers)
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	DE,BLOKLGND
	CALL	DSPLYRTN
	LD	HL,(DIROFSET)	; Subtract..
	EX	DE,HL		;  ..Directory-offset
	LD	HL,(CURRTRAK)	;   ..from current track..
	XOR	A		;    ..giving..
	SBC	HL,DE		;     ..track # relative to first data track
	LD	BC,SYSLEGND	; If result is negative, then
	JR	C,SHOWLGND	;  ..address is within the system tracks
	EX	DE,HL		; Move result into DE-reg..
	PUSH	DE		;  ..and save on the stack
	LD	A,(SECPERTK+1)	; Multiply by high-order byte..
	CALL	MULTIPLY	;  ..of Sectors-Per-Track
	LD	B,L		; Save that result..
	LD	C,0		;  ..in high-order byte of BC-reg
	POP	DE		; Restore Original Multiplicand
	LD	A,(SECPERTK)	; Multiply by low-order byte..
	CALL	MULTIPLY	;  ..of Sectors-Per-Track
	ADD	HL,BC		; Combine results, giving Relative data sector
;
	LD	DE,(CURRSCTR)	; Add in the current Sector
	ADD	HL,DE
	LD	BC,(SECPERBK)	; Divide result by sectors per block,
	CALL	DIVIDE		;  ..giving the current block
	LD	(CURRBLOK),HL	; Save computed current CP/M block
	LD	DE,(BLKPERDR)	; Subtract..
	XOR	A		;  ..the # of blocks..
	SBC	HL,DE		;   ..per directory
	LD	BC,DIRLEGND	; If result is negative, then
	JR	C,SHOWLGND	;  ..address is within the directory tracks
	ADD	HL,DE		; If not negative, then restore it, it's OK.
	LD	A,4
	CALL	SHOWDEC		; Display the computed value
	LD	BC,NOLEGND
SHOWLGND:
	PUSH	BC		; Move legend..
	POP	DE		;  ..address to DE-reg
	CALL	DSPLYRTN
	POP	HL
	POP	DE
	POP	BC
	RET
;
SHOWSTAT:	; Displays current Drive, Track, Sector, and CP/M Block
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	DE,TRAKLGND
	CALL	DSPLYRTN
	LD	HL,(CURRTRAK)
	LD	A,4			; Set field width
	CALL	SHOWDEC
	LD	DE,SCTRLGND
	CALL	DSPLYRTN
	LD	HL,(CURRSCTR)
	LD	A,3			; Set field width
	CALL	SHOWDEC
	CALL	SHOWBLOK
	POP	HL
	POP	DE
	POP	BC
	RET
;
SHOFSTAT:	; Displays fully qualified filename..
;		;  ..Relative Sector, and Relative Block
;			; On entry:	BC = Relative Sector Number within file
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	DE,DUMPDRIV+1	; Insure there is a ":" in File-Dump..
	LD	A,':'		;  ..Header file-name
	LD	(DE),A
	LD	DE,FSTATLG1
	CALL	DSPLYRTN
	PUSH	BC
	POP	HL
	LD	A,4
	CALL	SHOWDEC
	LD	DE,FSTATLG2
	CALL	DSPLYRTN
	LD	A,4
	CALL	SHOWDEC
	LD	DE,FSTATLG3
	CALL	DSPLYRTN
	POP	HL
	POP	DE
	POP	BC
	RET
;
SHOSTLIN:	; Displays current Drive/Track/Sector/Block on status line
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	DE
	LD	A,(PRNTTOGL)	; Get the current LST: toggle value
	PUSH	AF		; Save it
	XOR	A		; Turn it..
	LD	(PRNTTOGL),A	;  ..off (temporarily)
	LD	DE,STATLGND
	CALL	DSPLYRTN
	CALL	SHOWSTAT
	LD	DE,BUMPLGND
	CALL	DSPLYRTN
	POP	AF		; Restore the LST: echo toggle..
	LD	(PRNTTOGL),A	;  ..to its original value
	POP	DE
	RET
;
;
SHOWMENU:	; Displays the main command menu
;			; On entry:	No values passed
;			; On exit:	No values returned
;			; A-reg and Flags are scratch
	PUSH	DE
	LD	DE,MAINMENU		; Display Main..
	CALL	SHOMESAG		;  ..Menu
	CALL	SHOSTLIN		; Display status line
	POP	DE
	RET
;
;
HOMEADDR:	; Resets current track to first directory track, current..
;		;  ..sector to 1, re-displays current Drive, Track, Sector..
;		;   ..and CP/M Block
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	HL
	LD	HL,(DIROFSET)
	LD	(CURRTRAK),HL
	LD	HL,0
	LD	(CURRSCTR),HL
	CALL	SHOSTLIN
	POP	HL
	RET
;
BUMPTRAK:	; Increments current track 1, checks for disk wrap, then..
;		;  ..re-displays current Drive, Track, Sector, and CP/M Block
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	DE
	PUSH	HL
	LD	DE,(CURRTRAK)
	LD	HL,(MAXTRACK)
	XOR	A
	SBC	HL,DE
	JR	Z,WRAPTRAK
	INC	DE
	EX	DE,HL
WRAPTRAK:
	LD	(CURRTRAK),HL
	CALL	SHOSTLIN
	POP	HL
	POP	DE
	RET
;
DROPTRAK:	; Decrements current track by 1, checks for disk wrap, then..
;		;  ..re-displays current Drive, Track, Sector, and CP/M Block
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	HL
	LD	HL,(CURRTRAK)
	LD	A,L
	OR	H
	DEC	HL
	JR	NZ,NOTWRAPD
	LD	HL,(MAXTRACK)
NOTWRAPD:
	LD	(CURRTRAK),HL
	CALL	SHOSTLIN
	POP	HL
	RET
;
BUMPSCTR:	; Increments current sector by 1, checks for track wrap, then..
;		;  ..re-displays current Drive, Track, Sector, and CP/M Block
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	DE
	PUSH	HL
	LD	DE,(CURRSCTR)
	LD	HL,(SECPERTK)
	INC	DE
	XOR	A
	SBC	HL,DE
	JR	NZ,STORSECB
	EX	DE,HL
STORSECB:
	LD	(CURRSCTR),DE
	PUSH	AF			; Save flags in case we need to call..
	CALL	Z,BUMPTRAK		;  ..BUMPTRAK on a track wrap, then..
	POP	AF			;   ..restore FLAGS, but don't show..
	CALL	NZ,SHOSTLIN		;    ..status if DROPTRAK was called
	POP	HL
	POP	DE
	RET
;
DROPSCTR:	; Decrements current sector by 1, checks for track wrap, then..
;		;  ..re-displays current Drive, Track, Sector, and CP/M Block
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	HL
	LD	HL,(CURRSCTR)
	LD	A,H
	OR	L
	JR	NZ,STORSECD
	LD	HL,(SECPERTK)	
STORSECD:
	DEC	HL
	LD	(CURRSCTR),HL
	PUSH	AF			; Save flags in case we need to..
	CALL	Z,DROPTRAK		;  ..call DROPTRAK on a track wrap..
	POP	AF			;   ..then restore FLAGS, but don't..
	CALL	NZ,SHOSTLIN		;    ..show status if DROPTRAK called
	POP	HL
	RET
;
;
HOMEHEAD CALL	DISPATCH	; Define BIOS home head function (#8)
;				; On Entry:	All Parameters in memory
;
SELDRIVE CALL	DISPATCH	; Define BIOS drive select function (#9)
;				; On Entry:	C = Drive I.D. (A: = 0)
;
SETTRACK CALL	DISPATCH	; Define BIOS set track function (#10)
;				; On Entry:	C = Track #
;
SETSECTR CALL	DISPATCH	; Define BIOS set sector function (#11)
;				; On Entry:	C = Sector #
;
SETDMA   CALL	DISPATCH	; Define BIOS set DMA function (#12)
;
READDISK CALL	DISPATCH	; Define BIOS read disk sector function (#13)
;				; On Entry:	All Parameters in memory
;				; On Exit:	A = 0: All O.K.
;				; 		A = 1: Unrecoverable Error
;
WRITDISK CALL	DISPATCH	; Define BIOS write disk sector function (#14)
;				; On Entry:	All Parameters in memory
;				; On Exit:	A = 0: All O.K.
;				; 		A = 1: Unrecoverable Error
;
LSTSTAT	 JP	ERROR		; Define BIOS list status function (#15)
;				; Entered only by error in this program
;
SECTRAN  CALL	DISPATCH	; Define BIOS sector translate function (#16)
;				; On Entry:	BC = Logical Sector #
;				; 		DE = Translation Table Address
;				; On Exit:	HL = Physical Sector #
;
DISPATCH:		; Routine to pass control on to BIOS Disk Routines
;				; On Entry:	(SP) = Dispatch - BIOS offset
;				;		Regs per function conventions
;				; On Exit:	Per function conventions
;
	EX	(SP),HL		; Save HL-reg value, load (SP) value
	PUSH	DE		; Save DE-reg value
	LD	DE,0-(DISPATCH-(3*15))	; Compute dispatch vector by..
	ADD	HL,DE		;  ..subtracting call table - (14*3) from..
	EX	DE,HL		;   ..the current dispatch entry address
	LD	HL,(1)		; Load address of BIOS Warm-Boot routine
	ADD	HL,DE		; Add dispatch vector value
	POP	DE		; Restore DE-reg Value
	EX	(SP),HL		; Restore HL-reg Value, set dispatch address
	RET			; Pop dispatch address from Stack into PC-reg
;
;
ERROR:
	POP	HL
	CALL	SHOWDCHX
	LD	DE,DSPCHERR
	JP	FATALERR
;
;
VALIDATE:	; Check current sector and track for validity
;			; On entry:	All values are in memory
;			; On exit:	Zero flag RESET if Sector Not Read
;			; A-reg and Flags are scratch
	LD	HL,(SECPERTK)	; If sectors per track..
	EX	DE,HL		;  ..is NOT greater than..
	LD	HL,(CURRSCTR)	;   ..Current Sector..
	XOR	A
	LD	B,A
	SBC	HL,DE
	RET	NC		; ..Then return to caller with Error Flag set
;
	LD	HL,(MAXTRACK)	; If tracks per disk..
	INC	HL		;  ..(relative to one)..
	EX	DE,HL		;   ..is NOT greater than..
	LD	HL,(CURRTRAK)	;    ..Current Track..
	XOR	A
	LD	B,A		; Insure that B-reg is 0 so decrement will..
;				;  ..set error flag
	SBC	HL,DE
	RET	NC		; ..Then return to caller with Error Flag set
	RET
;
RECALIB:
	PUSH	BC
	PUSH	BC
	POP	HL
	LD	DE,RECALMSG
	CALL	SHOMESAG
	XOR	A
	CALL	SHOWDEC
	CALL	HOMEHEAD
	POP	BC
	RET
;
;
SETPHYS:	; Routine to translate & set physical sector
;			; On entry:	All values are in memory
;			; On exit:	Zero flag RESET if Sector Not Read
;			; A-reg and Flags are scratch
;
	LD	HL,(CURRTRAK)
	LD	B,H
	LD	C,L
	CALL	SETTRACK
	LD	HL,(CURRSCTR)
	LD	B,H
	LD	C,L
	LD	HL,(CURRTRAN)
	CALL	SECTRAN
	LD	B,H
	LD	C,L
	CALL	SETSECTR
	RET
;
;
GETSECTR:	; Gets 128-byte CP/M sector from current drive/track/sector
;			; On entry:	All values are in memory
;			; On exit:	Zero flag RESET if Sector Not Read
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	CALL	VALIDATE	; Make sure the current sector and track are OK
	JR	NC,GETSECER	; ..Then return to caller with Error Flag set
	LD	B,10		; Set up for ten retrys
GETRETRY:
	PUSH	BC
	CALL	SETPHYS		; Routine to translate & set physical sector
	CALL	READDISK
	POP	BC
	OR	A
	JR	Z,GETEXIT
	DJNZ	GRECALIB
GETSECER:
	DEC	B			; Set Non-zero Error Code in Flags
GETEXIT:
	POP	HL
	POP	DE
	POP	BC
	RET
;
GRECALIB:
	CALL	RECALIB
	JR	GETRETRY
;
;
PUTSECTR:	; Gets 128-byte CP/M sector from current drive/track/sector
;			; On entry:	All values are in memory
;			; On exit:	Zero flag RESET if Sector Not Written
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	CALL	VALIDATE	; Make sure the current sector and track are OK
	JR	NC,PUTSECER	; ..Then return to caller with Error Flag set
	LD	B,10
PUTRETRY:
	PUSH	BC
	CALL	SETPHYS		; Routine to translate & set physical sector
	CALL	WRITDISK
	POP	BC
	OR	A
	JR	Z,PUTEXIT
	DJNZ	PRECALIB
PUTSECER:
	DEC	B			; Set Non-zero Error Code in Flags
PUTEXIT:
	POP	HL
	POP	DE
	POP	BC
	RET
;
PRECALIB:
	CALL	RECALIB
	JR	PUTRETRY
;
;
SHOWASCI:	; Display an ASCII data byte (or a dot if byte unprintable)
;			; On entry:	A=data byte
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	CP	' '
	JR	C,SHOWDOT
	CP	DEL
	JR	C,NODOT
SHOWDOT:
	LD	A,'.'
NODOT:
	CALL	PRNTCHAR
	RET
;
SHOWSGMT:	; Displays one 16-byte segment (one screen line) of sector dump
;			; On entry:	B= 8-segment #, HL = data address
;			; On exit:	HL incremented to next segment address
;			; DE, A-reg and Flags are scratch
	PUSH	BC
	PUSH	HL
	EX	DE,HL
	LD	A,8
	SUB	B
	RLA
	RLA
	RLA
	RLA
	LD	L,A
	LD	H,0
	LD	A,4			; Set field width
	CALL	SHOWDCHX
	LD	A,' '
	CALL	PRNTCHAR
	CALL	PRNTCHAR
	LD	B,16
HEXLOOP:
	LD	A,(DE)
	CALL	SHOW2HEX
	INC	DE
	LD	A,' '
	CALL	PRNTCHAR
	DJNZ	HEXLOOP
	CALL	PRNTCHAR
	CALL	PRNTCHAR
	LD	B,16
	POP	HL
ASCILOOP:
	LD	A,(HL)
	INC	HL
	CALL	SHOWASCI
	DJNZ	ASCILOOP
	CALL	SENDCRLF
	POP	BC
	RET
;
SHOABSHD:	; Displays heading legend line for ABSOLUTE sector dump
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	DE
	LD	DE,DCHXLGND
	CALL	DSPLYRTN
	CALL	SHOWSTAT
	LD	DE,SCALE
	CALL	DSPLYRTN
	POP	DE
	RET
;
SHOFILHD:	; Displays heading legend line for FILE sector dump
;			; On entry:	BC = Relative Sector Number within file
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	DE
	LD	DE,DCHXLGND
	CALL	DSPLYRTN
	CALL	SHOFSTAT
	LD	DE,SCALE
	CALL	DSPLYRTN
	POP	DE
	RET
;
;
SHOWSCTR:	; Displays an entire 128-byte CP/M sector in hex and ASCII
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	HL,DMAAREA
	LD	B,8
SHOSGLUP:
	CALL	SHOWSGMT
	DJNZ	SHOSGLUP
	LD	HL,128			; Display ending offset values
	LD	A,4			; Set field width
	CALL	SHOWDCHX
	CALL	SENDCRLF
	CALL	SENDCRLF
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
SHOASCTR:	; Displays ABSOLUTE header line and sector image
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	CALL	SHOABSHD
	CALL	SHOWSCTR
	RET
;
;
SHOFSCTR:	; Displays FILE header line and sector image
;			; On entry:	BC = Relative Sector Number within file
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	CALL	SHOFILHD
	CALL	SHOWSCTR
	RET
;
;
DUMPSCTR:	; Gets from disk one entire 128-byte CP/M sector..
;		;  ..and displays it in hex and ASCII on a cleared screen
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	CALL	BLANKSCR		; Clear the screen
	CALL	GETSECTR		; Get and..
	CALL	NZ,SECTRERR	; Check for and alert user to SEVERE disk error
	CALL	SHOASCTR		;  ..display one sector
	CALL	SHOWMENU		; Re-display the main menu and..
;					;  ..the status line
	RET
;
;
DUMPTRAK:	; Displays an entire track of 128-byte CP/M sectors
;			; On entry:	All values are in memory
;			; On exit:	Current Track is incremented in memory
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	HL,0			; Reset current sector..
	LD	(CURRSCTR),HL		;  ..to start of track
	LD	A,(SECPERTK)		; Load..
	LD	B,A			;  ..sector loop counter
SHOTKLUP:
	LD	DE,DLAYLGND		; Display scroll pause and..
	CALL	SHOMESAG		;  ..speed change instructions
	CALL	GETSECTR		; Get and..
	CALL	NZ,SECTRERR	; Check for and alert user to SEVERE disk error
	CALL	SHOASCTR		;  ..display one sector
	LD	HL,(CURRSCTR)		; Bump..
	INC	HL			;  ..current..
	LD	(CURRSCTR),HL		;   ..sector
	LD	HL,(DUMPDLAY)		; Load dump delay value
	CALL	TIMER			; Call timer routine
	CALL	NZ,DECODEIT		; If any user intervention, check it..
	JR	C,ABORTDMP		;  ..out.  If ^C, then abort dump..
	DJNZ	SHOTKLUP		;   ..Otherwise test for end of track
	LD	HL,0			; Reset current sector to..
	LD	(CURRSCTR),HL		;  ..start of next track
ABORTDMP:
	PUSH	AF			; Save flags in case of abort
	LD	DE,FORCEUP		; Force last sector displayed..
	CALL	DSPLYRTN		;  ..to the top of screen
	POP	AF			; Restore flags and test for abort
	CALL	NC,BUMPTRAK		; If Carry OFF, then bump to next track
	CALL	SHOWMENU		; Re-display the main menu and..
;					;  ..the status line
	POP	HL
	POP	DE
	POP	BC
	RET
;
EDITHOME:	; Reset edit cursor position to first byte of sector
;			; On entry:	C=Current value of position index
;			; On exit:	A=New value of position index
;			; All regs and Flags are scratch
	XOR	A
	JR	MODULO			; Go to update screen indicator
;
BUMPBYTE:	; Increment cursor pointer by one column
;			; On entry:	C=Current value of position index
;			; On exit:	A=New value of position index
;			; All regs and Flags are scratch
	LD	A,C
	INC	A
	JR	MODULO			; Go to update screen indicator
;
DROPBYTE:	; Decrement cursor pointer by one column
;			; On entry:	C=Current value of position index
;			; On exit:	A=New value of position index
;			; All regs and Flags are scratch
	LD	A,C
	DEC	A
	JR	MODULO			; Go to update screen indicator
;
BUMPSGMT:	; Increment cursor pointer by one 16-byte segment (screen line)
;			; On entry:	C=Current value of position index
;			; On exit:	A=New value of position index
;			; All regs and Flags are scratch
 	LD	A,SGMNTSIZ
	ADD	A,C
	JR	MODULO			; Go to update screen indicator
;
DROPSGMT:	; Decrement cursor pointer by one 16-byte segment (screen line)
;			; On entry:	C=Current value of position index
;			; On exit:	A=New value of position index
;			; All regs and Flags are scratch
	LD	A,C
	SUB	SGMNTSIZ
;
; Fall into MODULO routine, return to caller thru there
;
MODULO:		; Adjust cursor pointer in case of wrap-around, update..
;		;  ..screen position indicator
;			; On entry:	A=Updated value of position index
;			; On exit:	C=Adjusted value of position index
;			; All regs and Flags are scratch
	AND	SECTRSIZ-1		; If pointer went over sector..
;					;  ..size, then adjust it back
	LD	C,A			; Restore pointer into C-reg
	LD	L,A			; Move byte..
	LD	H,0			;  ..pointer into HL-reg
	LD	DE,CURBYPOS		; Set cursor to current byte..
	CALL	SHOMESAG		;  ..position indicator on screen
	LD	A,4			; Set field width
	CALL	SHOWDCHX		; Update indicator value on screen
	RET
;
;
SHOWMODE:	; Show current editing mode (input in hex or input in ASCII)
;			; On entry:	A = Current value of mode toggle
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	DE,HXASCLEN		; Display..
	CALL	MULTIPLY
	LD	DE,HXASCPOS
	CALL	SHOMESAG
	LD	DE,HEXASCII
	ADD	HL,DE
	EX	DE,HL
	CALL	SHOMESAG		;  ..editing mode
	POP	HL
	POP	DE
	POP	BC
	RET
;
TOGLMODE:	; Toggle edit mode (hex/ASCII)
;			; On entry:	No value is entered
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	LD	A,(MODETOGL)		; Toggle..
	XOR	1			;  ..hex/ASCII..
	LD	(MODETOGL),A		;   ..mode
	CALL	SHOWMODE		; Display current mode
	RET
;
EDTCMDER:	; Invalid command in Sector Edit Mode
; procedure currently dummied!!!!!!!!!!!
	RET
;
SETCURSR:	; Positions cursor within sector image in editing display
;			; On entry:	B = Mode Toggle, C = byte offset
;			; On exit:	No value is returned
;			; All regs and Flags are scratch EXCEPT BC-regs
;					; Determine correct..
	LD	A,C			;  ..cursor position
	RRA				; Compute..
	RRA				;  ..16-byte..
	RRA				;   ..segment.
	RRA				;    ..offset..
	AND	(SECTRSIZ/SGMNTSIZ)-1	;     ..value
	INC	A			; Bump past the header line
	ADD	A,CTLFACTR		; Add in escape-sequence adjustment
	LD	(EDITLINE),A		; Set into escape-sequence string
	LD	A,B			; Get mode toggle
	RRA				; Stick it..
	RRA				;  ..into high-order
	LD	H,A			;   ..bit of HL-reg
	LD	A,C			; Compute offset..
	AND	SGMNTSIZ-1		;  ..within the 16-byte segment
	LD	L,A			; If doubling HL causes a carry, then..
	ADD	HL,HL			;  ..mode bit was set to HEX,  so..
	JR	C,ADDOFSET		;   ..use byte offset * 3. If NOT set..
	LD	L,ASCOFSET		;    ..use byte offset + ASCII offset
ADDOFSET:
	ADD	A,L
	ADD	A,CTLFACTR+DCHLLNTH	; Add in escape-sequence and leadin
	LD	(EDITCOL),A
	LD	DE,EDTESCSQ		; Set pointer to edit escape sequence
	CALL	SHOMESAG		; Write cursor positioning sequence
	RET
;
;
REWRITE:	; Rewrite changed sector to disk
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	DE
	XOR	A		; Reset..
	LD	(UPDATFLG),A	;  .."file changed" flag
	CALL	PUTSECTR
	CALL	CLEARMSG
	LD	DE,DIDUPDAT
	CALL	SHOMESAG
	POP	DE
	RET
;
CHEKNIBL:	; Check one input byte for valid hex value
;			; On entry:	A=data byte
;			; On exit:	L=Hex value, OR A=zero on error
;			; A-reg and Flags are scratch
	SUB	'0'
	CP	10
	JR	C,NIBBLEOK
	SUB	'A'-'9'-1
NIBBLEOK:
	LD	L,A
	AND	0F0H
	RET	Z
	LD	A,BELL			; Alert user..
	CALL	PRNTCHAR		;  ..to error
	RET
;
CHECKHEX:	; Check input in HEX mode for valid hex values
;			; On entry:	H=First nibble
;			; On exit:	H=Data byte value, A=zero on error
;			; HL-reg, A-reg and Flags are scratch
	LD	A,H			; Recover first nibble
	CALL	CHEKNIBL		; Check that it's OK
	RET	NZ
	LD	A,L			; Recover..
	RLA				;  ..the high-order..
	RLA				;   ..nibble..
	RLA				;    ..shift it..
	RLA				;     ..into high order..
	LD	H,A			;      ..half of H-reg
	CALL	GETINPUT		; Get second nibble
	CALL	CHEKNIBL		; Check that it's OK
	RET	NZ			; Return with error set if not
	LD	A,H			; Recover high-order nibble
	ADD	A,L			; Combine with low-order
	LD	H,A			; Place resulting byte into H-reg
	XOR	A			; Force zero flag to signal data OK
	RET
;
;
SAVRSTOR:	; Save or restore the current sector image
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; All regs and Flags are scratch
	LD	BC,128			; Save or (or restore)..
	LD	DE,SAVEAREA		;  ..original..
	LD	HL,DMAAREA		;   ..sector image:
	JR	C,DONTSWAP		; Depending on state of "carry flag"..
	EX	DE,HL			;  ..carry set = Save; reset = restore
DONTSWAP:
	LDIR				;    ..image (This also ZEROS BC-regs)
	RET
;
;
UNDOEDIT:	; Resets sector image to original value
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; All regs and Flags are scratch
	LD	A,(UNDOFLAG)		; Was last input..
	CP	ESC			;  ..a cursor move?
	JR	C,CANTUNDO		; Yes - clear the message line & exit
	XOR	A			; No - so set..
	LD	(UNDOFLAG),A		;  .."don't undo" flag
	LD	DE,UNDOQURY
	CALL	SHOMESAG
	CALL	GETRESP
	CALL	CLEARMSG
	AND	UPCASMSK
	CP	'Y'
	JR	NZ,CANTUNDO
	LD	DE,DIDUNDO
	CALL	SHOMESAG
	XOR	A			; Set carry flag off (restore)
	CALL	SAVRSTOR		; Call the Save/Restore routine
	LD	DE,CURSRHOM		; Home the...
	CALL	SHOMESAG		;  ..cursor
	CALL	SHOASCTR		; Re-display it
	LD	A,(MODETOGL)		; Load mode..
	LD	B,A			;  ..toggle (C-reg zeroed by LDIR)
	JR	EDITLOOP
;
CANTUNDO:
	LD	DE,DINTUNDO
	CALL	SHOMESAG
	JR	EDITLOOP
;
;	I know it's dumb to jump to the next instruction, but humor me!!!
;
EDITPROC:	; Process sector edit commands and cursor moves
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; All regs and Flags are scratch
EDITLOOP:
	CALL	SETCURSR		; Position cursor in sector image
	CALL	GETINPUT		; Get edit command or data byte
	PUSH	AF			; Clear any..
	CALL	CLEARMSG		;  ..previous..
	POP	AF			;   ..messages
	CP	DEL			; Test for..
	JR	Z,UNDOEDIT		;  ..Un-Do command
	CP	UNDOCMND		; Test for alternate (WS style)..
	JR	Z,UNDOEDIT		;  ..Un-Do command
	LD	(UNDOFLAG),A		; Set value of un-do FLAG
	LD	HL,CASETBL3		; Set up for..
	CP	ESC			;  ..control character command
	JR	Z,UPDATEDT		; Input is an EXIT command
	JR	NC,INSERTIT		; Input is a data byte
	CALL	CASE			; Input is a cursor move command
	LD	A,(MODETOGL)		; Re-load..
	LD	B,A			;  ..mode toggle
	JR	EDITLOOP		; Go to get and process next input
;
INSERTIT:
	LD	H,A			; Save data byte
	LD	A,B			; Test for..
	OR	A			;  ..hex mode
	CALL	NZ,CHECKHEX		; Is so, go to validate byte; If zero..
	JR	NZ,EDITLOOP		;  ..flag still off on return, data bad
	INC	A			; Set..
	LD	(UPDATFLG),A		;  .."sector modified" flag
	LD	A,(UNDOFLAG)		; Is this the first..
	CP	ESC			;  ..change since last cursor move
	JR	NC,DONTSAVE		; No - don't save again
	CALL	SAVRSTOR		; Yes - save the sector image for UN-DO
DONTSAVE:
	LD	A,H			; Restore data byte
	LD	B,0			; Set mode to ASCII (temporarily)
	LD	HL,DMAAREA		; Set pointer to data area
	ADD	HL,BC			; Add offset into sector image
	LD	(HL),A			; Insert data byte into sector image
	PUSH	AF			; Save data byte
	CALL	SETCURSR		; Position cursor in ASCII image
	POP	AF			; Restore data byte
	PUSH	AF			; Save data byte
	CALL	SHOWASCI		; Dump data byte in ASCII (or '.')
	POP	AF			; Restore data byte
	INC	B			; Set mode to hex (temporarily)
	PUSH	AF			; Save data byte
	CALL	SETCURSR		; Position cursor in HEX image
	POP	AF			; Restore data byte
	CALL	SHOW2HEX		; Display the data byte in HEX image
	LD	A,(MODETOGL)		; Recover original..
	LD	B,A			;  ..mode toggle value
	CALL	BUMPBYTE		; Bump data pointer
	JR	EDITLOOP		; Go get and process next input
;
UPDATEDT:
	LD	A,(UPDATFLG)
	OR	A
	RET	Z
	LD	DE,UPDATQRY
	CALL	SHOMESAG
	CALL	GETRESP
	CALL	CLEARMSG
	LD	DE,NOUPDATE
	AND	UPCASMSK
	CP	'Y'
	JR	NZ,DONTUPDT
	CALL	REWRITE
	LD	DE,DIDUPDAT
DONTUPDT:
	CALL	SHOMESAG
	LD	DE,EDXITQRY
	CALL	SHOMESAG
	CALL	GETRESP
	AND	UPCASMSK
	CP	'Y'
;	JR	NZ,EDITLOOP
	JP	NZ,EDITLOOP
	RET
;
;
EDITSCTR:	; Displays an entire 128-byte CP/M sector in hex and ASCII..
;		;  ..and allows on screen editing in hex or ASCII mode
;			; On entry:	All values are in memory
;			; On exit:	No value is returned
;			; A-reg and Flags are scratch
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	A,(PRNTTOGL)		; Get the LST: toggle value
	OR	A			; Is it set to ECHO mode?
	JR	Z,DONTBEEP		; No, so don't bother the user
	XOR	A			; Set LST: echo toggle OFF..
	LD	(PRNTTOGL),A		;  ..(Can't dump an EDIT to LST:)
	LD	A,BELL			; Yes, so beep at the..
	CALL	PRNTCHAR		;  ..user to warn him
DONTBEEP:
	CALL	BLANKSCR		; Clear the screen
	CALL	GETSECTR		; Get and..
	CALL	NZ,SECTRERR	; Check for and alert user to SEVERE disk error
	CALL	SHOASCTR		;  ..display the sector
	LD	DE,EDITMENU		; Show editing..
	CALL	SHOMESAG		;  ..menu
	LD	A,(MODETOGL)		; Load current editing..
	LD	B,A			;  ..mode, and save it
	CALL	SHOWMODE
	XOR	A			; Reset the..
	LD	(UPDATFLG),A		;  ..update flag..
	LD	(UNDOFLAG),A		;   ..and the UN-DO flag
	LD	C,A			; Reset cursor position pointer
	CALL	EDITPROC		; Call procedure to edit the sector
	CALL	SHOWMENU		; Re-display the main menu and..
;					;  ..the status line
	POP	HL
	POP	DE
	POP	BC
	RET
;
;
;
UPCASE:		; Force lower-case letters to upper-case
;			; On entry:	A=data byte
;			; On exit:	A=updated byte
;			; Flags are scratch
	CP	'A'
	RET	C
	AND	UPCASMSK
	RET
;
;
PREPFCB:	; Clears an FCB file-spec to blanks, zeros..
;		;  ..the drive-id and the extents and next record fields
;			; On Entry:	HL=FCB address
;			; On Exit:	Name and type start addr. are in memory
;			; All regs and flags are scratch
	PUSH	HL
	POP	IX
	XOR	A
	LD	(IX+FCBEXTNT),A		; Clear the extent..
	LD	(IX+FCBRECNT),A		;  ..record count..
	LD	(IX+FCBNXTRC),A		;   ..and next record flags
	LD	(HL),A			; Initialize Drive-ID
	INC	HL		; Bump pointer
	LD	(NAMSTART),HL	; Save pointer to first byte of file name
	LD	DE,DUMPDRIV+2	; Load start of File-Dump Header File-name
	LD	A,' '		; Load a blank
	LD	B,FNAMELEN	; Load the maximum file-name length
NAMFILUP:
	LD	(HL),A		; Plug in a space
	INC	HL		; Bump pointer
	LD	(DE),A		; Store data byte into File-Dump Header
	INC	DE		; Bump File-Dump Header pointer
	DJNZ	NAMFILUP	; Loop until name is all blank
;
	LD	(TYPSTART),HL	; Save pointer to first byte of file type
	LD	B,FTYPELEN	; Load the maximum file-type length
TYPFILUP:
	LD	(HL),A		; Plug in a space
	INC	HL		; Bump pointer
	LD	(DE),A		; Store data byte into File-Dump Header
	INC	DE		; Bump File-Dump Header pointer
	DJNZ	TYPFILUP	; Loop until type is all blank
	LD	(DE),A		; Store data byte into File-Dump Header
;
	RET
;
;
BUILDFCB:	; Opens a file for sequential input
;			; On Entry:	HL=FCB address
;			; On Exit:	Carry flag indicates file not found
;			; All regs and flags are scratch
	LD	(FCBPNTR),HL	; Save the FCB address
	LD	DE,FNAMPRMT
RETRYNAM:
	CALL	SHOMESAG
	LD	HL,(FCBPNTR)	; Restore the FCB address
	CALL	PREPFCB		; Call routine to clear name to spaces, etc.
	LD	IX,NAMEBUFR	; Set pointer to raw name input buffer
	PUSH	IX		; Move it to BDOS..
	POP	DE		;  ..parm register
	LD	C,GETSTRFC	; Call BDOS for..
	CALL	BDOS		;  ..an input string
	LD	A,(IX+1)	; Get the data length
	OR	A		; Was input string NULL?
	CCF			; Just in case, set "null input" flag
	RET	Z		; Yes it was, so return with flag set
;
	PUSH	IX		; Set a zero..
	POP	HL
	INC	A
	INC	A
	LD	C,A
	XOR	A
	LD	B,A
	ADD	HL,BC
	LD	(HL),A		;  ..at end of input string
;
	LD	A,(DRIVEID)	; Move default drive-ID to..
	LD	(DUMPDRIV),A	;  ..File-Dump Header drive-ID
	LD	HL,(NAMSTART)	; Load start of the file-name in the FCB
	LD	DE,DUMPDRIV+2	; Load start of File-Dump Header File-name
	LD	B,FNAMELEN	; Set maximum "drive-ID:fname.ftype" size
	LD	A,(IX+3)	; Get the (possible) ":" character
	CP	':'		; Is the drive-ID explicitly given?
	LD	A,(IX+2)	; Sneak the Drive-ID itself into A-reg
	JR	NZ,DONAME	; Drive-ID not explicit, so data byte is name
	CALL	UPCASE		; Make sure Drive-ID is in upper-case
	LD	(DUMPDRIV),A	; Save drive in File-Dump Header drive-ID
	SUB	'A'-1		; Drive-ID IS explicit, data byte is drive-ID
	JR	C,BADNAMER	; But it's a bad one, so tell user
	CP	MAXDRIVE+1	; Well, maybe not; try too BIG
	JR	NC,BADNAMER	; Yep, it's definitely bad, so tell user
	INC	IX		; Increment name string pointer
	DEC	HL		; Back FCB pointer up to Drive-ID
	DEC	DE		; Back File-Dump Header pointer up to ":"
DONAME:
	CALL	UPCASE		; Make sure file-name is in upper-case
	LD	(HL),A		; Store data byte into FCB
	LD	(DE),A		; Store data byte into File-Dump Header
	INC	DE		; Increment File-Dump Header file name pointer
	INC	HL		; Increment FCB pointer
	INC	IX		; Increment name string pointer
	LD	A,(IX+2)	; Load in next string byte
	OR	A		; Is it the "null" at the..
	RET	Z		;  ..end of the string, if so, we're done
	CP	'.'		; If not, the test for the "type" separator
	JR	Z,DOTYPE	; If dot found, go to process file type
	DJNZ	DONAME		; If not dot, check for too many bytes
;
BADNAMER:
	LD	DE,BADNAMMS	; Set up for error message
	JR	RETRYNAM	; Go back to top, which will display message
;
DOTYPE:
	LD	(DE),A		; Store "dot" into File-Dump Header file-name
	INC	DE		; Increment File-Dump Header file name pointer
	LD	B,FTYPELEN+1	; Initialize type byte count
	LD	HL,(TYPSTART)	; Set pointer to file type in FCB
TYPELOOP:
	INC	IX		; Bump input string pointer
	LD	A,(IX+2)	; Load in next string byte
	OR	A		; Is it the "null" at the..
	RET	Z		;  ..end of the string, if so, we're done
	CALL	UPCASE		; Make sure file-type is in upper-case
	LD	(HL),A		; Store data byte into FCB
	LD	(DE),A		; Store data byte into File-Dump Header
	INC	DE		; Increment File-Dump Header file name pointer
	INC	HL		; Increment FCB pointer
	DJNZ	TYPELOOP	; Loop if more permitted
	JR	BADNAMER	; Too long, so tell user
;
;
OPENFCB:	; Open a disk file
;			; On Entry:	DE=Address of file's FCB
;			; On Exit:	A=hex FF if file found
;			; A-reg and Flags are scratch
	PUSH	BC		;
	PUSH	DE		;
	PUSH	HL		;
	LD	C,OPENFC	;
	CALL	BDOS		;
	POP	HL		;
	POP	DE		;
	POP	BC		;
	RET
;
OPENFILE:	; Opens a file for sequential input
;			; On Entry:	HL=FCB address
;			; On Exit:	Carry flag indicates file not found
;			; All regs and flags are scratch
	EX	DE,HL
	CALL	OPENFCB		; Call low level open routine
	ADD	A,A
	RET	NC
	LD	DE,NOFILEMS
	CALL	SHOMESAG
	SCF
	RET
;
;
READNXTS:	; Reads next CP/M sector from file
;			; On Entry:	DE=Address of file's FCB
;			; On Exit:	A=Error Code
;			; A-reg and Flags are scratch
	PUSH	BC		;
	PUSH	DE		;
	PUSH	HL		;
	LD	C,READFC	;
	CALL	BDOS		;
	POP	HL		;
	POP	DE		;
	POP	BC		;
	RET
;
;
GETNXTFS:	; Get next sector in sequence from file
;			; On Entry:	DE=Address of file's FCB
;			; On Exit:	Carry Set = End-of-File
;			; A-reg and Flags are scratch
	PUSH	DE		; Get the..
	LD	DE,(FCBPNTR)	;  ..next..
	CALL	READNXTS	;   ..sector
	POP	DE		;
	CP	1		; Are we at physical E-O-F?
	JR	Z,GETNEXIT	; Yes, go to E-O-F exit where carry will be set
	SCF			; Clear..
GETNEXIT:			;  ..or..
	CCF			;   ..set E-O-F flag
	RET
;
;
DUMPRECS:	; Dump named file's sectors
;			; On entry:	BC = Relative Sector Number within file
;			; On exit:	BC = Updated Relative Sector Number
;			; All regs and Flags are scratch
	CALL	GETNXTFS		; Get a file sector and test for E-O-F
	RET	C			; If carry set then exit
	INC	BC			; Bump Relative Sector Number
	LD	DE,DLAYLGND		; Display scroll pause and..
	CALL	SHOMESAG		;  ..speed change instructions
	CALL	SHOFSCTR		; Display one sector
	LD	HL,(DUMPDLAY)		; Load dump delay value
	CALL	TIMER			; Call timer routine and test for any..
;					;  ..user intervention
	JR	Z,DUMPRECS		; None, so go get the next sector
	CALL	DECODEIT		; Yes - What kind of intervention?
	RET	C			; Abort on Carry Set..
	JR	DUMPRECS		;  ..else go get next sector
;
;
;
DUMPFILE:	; Dump an entire named file to screen (and maybe printer)
;			; On entry:	No values passed
;			; On exit:	No values returned
;			; All regs and Flags are scratch
	LD	HL,INPUTFCB
	PUSH	HL
	CALL	BUILDFCB
	POP	HL
	CALL	NC,OPENFILE
	JR	C,DUMPFXIT
	LD	BC,0
	CALL	DUMPRECS
	LD	DE,FORCEUP		; Force last sector displayed..
	CALL	DSPLYRTN		;  ..to the top of screen
DUMPFXIT:
	CALL	SHOWMENU		; Re-display the main menu and..
;					;  ..the status line
	RET
;
;
;
GETATRIB:	; Get the drive attributes
;			; On entry:	No values passed
;			; On exit:	No values returned
;			; All regs and Flags are scratch
;	LD	C,GETDPBFC		; Get pointer to the..
;	CALL	BDOS			;  ..Disk Parameter Block
;	LD	(DPBSAVE),HL		; Save it
;	LD	A,L			; If any..
;	OR	H			;  ..errors, then..
;	RET	Z			;   ..return with error (zero flag)
; CALL TRACE
	LD	A,(DRIVEID)		; Compute physical..
	SUB	'A'			;  ..Drive-ID
	LD	C,A			; Get pointer to the..
	CALL	SELDRIVE		;  ..Disk Parameter Header
	LD	(DPHSAVE),HL		; Save it
	LD	A,L			; If any..
	OR	H			;  ..errors, then..
	RET	Z			;   ..return with error (zero flag)
	PUSH	HL			; Set pointer to DPH..
	POP	IX			;  ..into IX-reg
	LD	L,(IX+0)		; Get pointer..
	LD	H,(IX+1)		;  ..to Skew (sector translate) Table
	LD	(CURRTRAN),HL		; Save Skew-table pointer
	LD	L,(IX+10)		; Get pointer to the..
	LD	H,(IX+11)		;  ..Disk Parameter Block
	LD	(DPBSAVE),HL		; Save it
	LD	A,L			; If any..
	OR	H			;  ..errors, then..
	RET	Z			;   ..return with error (zero flag)
	LD	DE,DPARMWRK		; Copy the DPB..
	LD	BC,DPARMLEN		;  ..to local..
	LDIR				;   ..memory
	LD	HL,(DIRNTRYS)		; Load number of directory entries..
	INC	HL			;  ..relative to zero
	XOR	A			; Divide by 4..
	LD	A,H
	RRCA
	LD	H,A
	LD	A,L
	RRCA
	LD	L,A
	SRA	H
	LD	A,L
	RRCA
	LD	L,A
	LD	(SECPERDR),HL		;  ..giving directory size in sectors
	LD	HL,(DIRALMSK)		; Load directory allocation mask
	LD	A,H			; Swap..
	LD	H,L			;  ..the..
	LD	L,A			;   ..two..
	LD	(DIRALMSK),HL		;    ..bytes
	XOR	A			; Set counter..
	DEC	A			;  ..to -1
BITCTLUP:
	ADD	HL,HL			; Count the bits..
	INC	A			;  ..in the..
	JR	C,BITCTLUP		;   ..allocation mask..
;					;    ..(number of blocks in directory)
	LD	L,A			; Save the..
	LD	H,0			;  ..number of blocks..
	LD	(BLKPERDR),HL		;   ..per directory
	EX	DE,HL			; Subtract the number of..
	LD	HL,(MAXBLOKS)		;  ..blocks per directory from the..
	SBC	HL,DE			;   ..total blocks per disk and..
	INC	HL			;    ..make relative to one, giving..
	LD	(DTABLOKS),HL		;     ..the net data blocks
	LD	A,8			; Load number of Blocks per Directory..
	INC	H			;  ..Entry (for LARGE disks) and..
	DEC	H			;   ..test if this is a LARGE disk
	JR	NZ,LARGEDSK		; If it is NOT a LARGE disk, then..
	ADD	A,A			;  ..double the number of blocks/entry
LARGEDSK:
	LD	(BLKPRENT),A		; Save # of Blocks per Directory Entry
;
	LD	A,(BLM)			; Load "block mask"..
	INC	A			;  ..(sectors per block - 1)
	LD	L,A			; Make relative..
	LD	H,0			;  ..to 1 and..
	LD	(SECPERBK),HL		;   ..store
	XOR	A			; Divide by 8..
	LD	A,H
	RRCA
	LD	H,A
	LD	A,L
	RRCA
	LD	L,A
	LD	A,H
	SRA	A
	LD	H,A
	LD	A,L
	RRCA
	LD	L,A
	LD	A,H
	SRA	A
	LD	H,A
	LD	A,L
	RRCA
	LD	L,A			;  ..giving CP/M "block size" in bytes
	LD	(BLOKSIZE),HL		; Save CP/M "block size"
	LD	DE,(DTABLOKS)		; Multiply..
	CALL	MULTIPLY		;  ..by total blocks per disk
	LD	(DISKSIZE),HL		;   ..giving total data bytes per disk
;	LD	HL,(MAXBLOKS)		; Multiply total blocks..
;	EX	DE,HL
;	INC	DE			;  ..(relative to one)..
	LD	A,(SECPERBK)		;   ..by sectors per block, giving..
	CALL	MULTIPLY
	LD	(DTASCTRS),HL		;    ..total usable sectors per disk
	LD	BC,(SECPERTK)		; Divide result by sectors per track,
	CALL	DIVIDE			;  ..giving total tracks per disk
	LD	A,E			;  If remainder is..
	OR	D			;   ..non-zero, then don't decrement..
	JR	NZ,GDPHEXIT		;    ..to make relative to zero cause..
	DEC	HL			;     ..there is a partial last track
GDPHEXIT:
	LD	(DTATRAKS),HL		; Save total DATA tracks
	EX	DE,HL
	LD	HL,(DIROFSET)		; Add in the..
	ADD	HL,DE			;  ..directory offset..
	LD	(MAXTRACK),HL		;   ..giving the maximum track address
;
	LD	HL,(SECPERTK)		; Divide sectors per track..
	LD	BC,(SECPERBK)		;  ..by sectors..
	CALL	DIVIDE			;   ..per block, giving..
	LD	(BLKPERTK),HL		;    ..blocks per track
;
	XOR	A			; Force A-reg and..
	DEC	A			;  ..zero-flag to non zero
	RET
;
;
;
SHOWATTR:	; Show disk attributes
;			; On entry:	All values in memory
;			; On exit:	No values returned
;			; All regs and Flags are scratch
;
; CALL TRACE
	CALL	BLANKSCR		; Clear the screen and force new page
;
	LD	DE,NUMBLKMS
	CALL	DSPLYRTN
	LD	HL,(MAXBLOKS)
	INC	HL
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDCHX
;
	LD	DE,SECBLKMS
	CALL	DSPLYRTN
	LD	HL,(SECPERBK)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDCHX
;
	LD	DE,SECDSKMS
	CALL	DSPLYRTN
	LD	HL,(DTASCTRS)
	LD	A,0		; Set field width = 0 (suppress left zeros)
 	CALL	SHOWDCHX
;
	LD	DE,SECTRKMS
	CALL	DSPLYRTN
	LD	HL,(SECPERTK)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDCHX
;
	LD	DE,MAXTRKMS
	CALL	DSPLYRTN
	LD	HL,(MAXTRACK)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDCHX
;
	LD	DE,TRKOFFMS
	CALL	DSPLYRTN
	LD	HL,(DIROFSET)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDCHX
;
	LD	DE,BLKSIZMS
	CALL	DSPLYRTN
	LD	HL,(BLOKSIZE)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDEC
;
	LD	DE,KBYTESMS
	CALL	DSPLYRTN
;
	LD	DE,DSKSIZMS
	CALL	DSPLYRTN
	LD	HL,(DISKSIZE)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDEC
;
	LD	DE,KBYTESMS
	CALL	DSPLYRTN
;
	LD	DE,DIRBLKMS
	CALL	DSPLYRTN
	LD	HL,(BLKPERDR)
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDEC
;
	LD	DE,MAXDIRMS
	CALL	DSPLYRTN
	LD	HL,(DIRNTRYS)
	INC	HL
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDCHX
;
	LD	DE,EXTNTSMS
	CALL	DSPLYRTN
	LD	A,(EMASK)
	INC	A
	LD	L,A
	LD	H,0
	LD	A,0		; Set field width = 0 (suppress left zeros)
	CALL	SHOWDEC
;
	LD	DE,SKEWMSG
	CALL	DSPLYRTN
	XOR	A			; Zero the sector counter and the..
	LD	D,A			;  ..high order byte of Physical Sector
	LD	HL,(CURRTRAN)		; Load the address of the..
;					;  ..current translate table
 PUSH AF
 XOR A
 CALL	SHOWDCHX
 POP AF
GETNXSEC:
	LD	E,(HL)			; Load the indicated Physical Sector #
	INC	A			; Bump the Sector Counter
	INC	HL			; Bump the Physical Sector Pointer
	CP	E			; Is Sector Counter = Physical Sector?
	JR	Z,GETNXSEC
 LD L,A
 LD H,0
 XOR	A
 CALL	SHOWDCHX
	EX	DE,HL			; Make it relative to zero
	XOR	A
	CALL	SHOWDCHX
;
	CALL	SENDCRLF
	RET
;
;
;
SHOWDRIV:	; Compute and display a new drive's attributes
;			; On entry:	All inputs in memory
;			; On exit:	No values output
;			; All regs and Flags are scratch
;
; CALL TRACE
	LD	A,(DRIVEID)		; Load..
	SUB	'A'			;  ..current..
	LD	E,A			;   ..drive ID.
	LD	C,SETDSKFC		; Select new drive (FC=14)
	CALL	BDOS
	CALL	GETATRIB		; Get the disk's attributes
	JR	Z,DPBERROR		; Abort on error!!
	CALL	SHOWATTR		; Display the disk's attributes
	CALL	HOMEADDR		; Set track/sector to first directory..
	CALL	SHOSTLIN		;  ..block and display the status line
	RET
;
DPBERROR:		; Report DPB error.
	LD	DE,DPBERMSG		
	CALL	SHOMESAG
	RET
;
;
DISKRSET:		; Convert drive ID to letter form and reset the disks
;			; On entry:	A=Drive ID (relative to 0)
;			; On exit:	Drive ID set in memory
;			; All regs and Flags are scratch
; CALL TRACE
	ADD	A,'A'-1			; Convert to alphabetic
	LD	(DRIVEID),A		; Save in dump header line
	LD	C,RSETDSKS		; Call BDOS to..
	CALL	BDOS			;  ..do a disk reset
	CALL	SHOWDRIV
	RET
;
;
SETDRIVE:	; Get new drive ID, Validate it, and display attributes
;			; On entry:	No values passed
;			; On exit:	No values returned
;			; All regs and Flags are scratch
	LD	DE,DRVPROMT
	CALL	SHOMESAG
	CALL	GETRESP
	CP	ESC		; Abort Command?
	RET	Z		; Yes - return to caller
; CALL TRACE
	CALL	CHEKDRIV	; Check if it is a valid..
	JR	NC,SETDRVOK	;  ..drive ID (A:..O:)
;				; Report invalid drive error.
	LD	A,'A'		; Reset drive to 'A'
	CALL	CHEKDRIV	; Tell BIOS about it
	LD	DE,DRIVEBAD	; Tell user about it
	CALL	SHOMESAG
	LD	HL,1500
	CALL	TIMER
SETDRVOK:
	LD	A,C
	INC	A
	CALL	DISKRSET	; Call BDOS to reset disks and get and..
;				;  ..display new disk attributes
	CALL	SHOWMENU	; Re-display the main menu and..
;				;  ..the status line
	RET
;
;
;
BADTRACK:
	CALL	CLEARMSG
	LD	DE,BADINPUT
	CALL	SHOMESAG
;
SETTRAK:	; Set new current Track (and corresponding block)
;			; On entry:	No values passed
;			; On exit:	New values in memory
;			; All regs and Flags are scratch
	LD	DE,TRKPROMT	; Set cursor..
	CALL	SHOMESAG	;  ..position
	CALL	GETDEC		; Get a new value for Track
	JR	C,BADTRACK	; If error, display message and retry
	LD	(CURRTRAK),HL	; Save it in memory..
	LD	BC,(MAXTRACK)	; Check..
	INC	BC		;  ..for..
	XOR	A		;   ..invalid..
	SBC	HL,BC		;    ..input
	JR	NC,BADTRACK	; If error, display message and retry
	CALL	SHOSTLIN	; If no error, display new values
	CALL	CLEARMSG
	RET
;
BADSCTR:
	CALL	CLEARMSG
	LD	DE,BADINPUT
	CALL	SHOMESAG
;
SETSCTR:	; Set new current Sector (and corresponding track & block)
;			; On entry:	No values passed
;			; On exit:	New values in memory
;			; All regs and Flags are scratch
	LD	DE,SECPROMT	; Set cursor..
	CALL	SHOMESAG	;  ..position
	CALL	GETDEC		; Get a new value for Sector
	JR	C,BADSCTR	; If error, display message and retry
	LD	(CURRSCTR),HL	; Save it in memory..
	LD	BC,(SECPERTK)	; Check for..
	XOR	A		;  ..invalid..
	SBC	HL,BC		;   ..input
	JR	NC,BADSCTR	; If error, display message and retry
	CALL	SHOSTLIN	; If no error, display new values
	CALL	CLEARMSG
	RET
;
;
;
BADBLOCK:
	CALL	CLEARMSG
	LD	DE,BADINPUT
	CALL	SHOMESAG
;
SETBLOK:	; Set new current CP/M block (and corresponding track & sector)
;			; On entry:	No values passed
;			; On exit:	New values in memory
;			; All regs and Flags are scratch
	LD	DE,BLKPROMT	; Set cursor..
	CALL	SHOMESAG	;  ..position
	CALL	GETDEC		; Get a new value for CP/M block
	JR	C,BADBLOCK	; If error, display message and retry
	LD	(CURRBLOK),HL	; Save it in memory..
	PUSH	HL		;  ..and transfer..
	POP	DE		;   ..to DE-reg
	LD	BC,(DTABLOKS)	; Check for..
	XOR	A		;  ..invalid..
	SBC	HL,BC		;   ..input
	JR	NC,BADBLOCK	; If error, display message and retry
	EX	DE,HL		; Restore new block value
	LD	BC,(BLKPERTK)	; Compute  Track := 
	CALL	DIVIDE		;	..
	LD	BC,(DIROFSET)	;	 ..  (Block DIV (Blocks per Track))
	ADD	HL,BC		;	  ..
	LD	(CURRTRAK),HL	;	   ..	+ Directory Offset
	LD	A,(SECPERBK)	; Compute Sector :=
	CALL	MULTIPLY	;	..	(Block MOD (Blk/Trk))
	LD	(CURRSCTR),HL	;	 ..	  * (Sectors per Track)
	CALL	SHOSTLIN	; If no error, display new values
	CALL	CLEARMSG
	RET
;
;
;
TOOSMALL:	; Report Insufficient memory error (FATAL!!).
	LD	DE,SMALLMSG
	JR	FATALERR
;
VERERROR:	; Report CP/M version error (FATAL!!).
	LD	DE,VERERRMS
FATALERR:
	CALL	DSPLYRTN		; FATAL ERROR!!
;
;	Fall into DONE and exit to CP/M
;
DONE:			; EXIT to CP/M
	JP	0000H
;
;
START:			; Main program entry point
	LD	HL,(0006)		; Load local stack pointer from..
	LD	L,0			;  ..BDOS vector and..
	LD	SP,HL			;   ..round down to start of page
	LD	(NEWSTACK),HL		; Save top-of-stack address
	DEC	H			; Compute stack limit (1 page) and..
	LD	(STACKLMT),HL		;  ..store it for future reference
;
	LD	HL,RESTART		; Ensure that restart address..
	PUSH	HL			;  ..is at top of stack!!
	CALL	CPMVER			; Get the CP/M version #
	CP	20H			; If less than 2.0..
	JR	C,VERERROR		;   ..then ABORT!!
	LD	DE,DMAAREA		; Set..
	CALL	SETDMART		;  ..DMA
	LD	A,(CCPFCB1)		; Was a drive..
	OR	A			;  ..specified on startup?
	JR	NZ,MAKELETR		; Yes - go to make it a letter
	LD	DE,STARTMSG		; No - so first display startup..
	CALL	SHOMESAG		;  ..message and copyright notice
	LD	HL,BASETIME*8		; Set timer..
	CALL	TIMER			;  ..delay value
;					; Then set drive to current default:
	LD	A,(DRIVUSER)		; Load the default..
	AND	0FH			;  ..drive ID.
	INC	A			; Make relative to 1
;
MAKELETR:
	CALL	DISKRSET		; Convert the drive ID to letter form..
;					;  ..and reset the CP/M disk system
	LD	DE,MAINMENU		; Display..
	CALL	SHOMESAG		;  ..main menu
RESTART:
;	LD	SP,RETURNAD		; Ensure that restart address..
;					;  ..is at top of stack!!
	LD	SP,(NEWSTACK)		; Restore top-of-stack address
	LD	HL,RESTART		; Ensure that restart address..
	PUSH	HL			;  ..is at top of stack!!
	LD	DE,DMPPRMPT		; Display main command..
	CALL	SHOMESAG		;  ..prompt
	CALL	GETRESP			; Get user command
	PUSH	AF			; Save input byte
	CALL	CLEARMSG		; Clear any previous error message
	POP	AF			; Restore input byte
	LD	HL,CASETBL1		; Set up for..
	CP	ESC+1			;  ..control character command
	JR	C,CASE
	CP	'0'
	JR	C,CMANDERR
	LD	HL,CASETBL2-('0'*2)	; Set up for..
	CP	'9'+1			;  ..numeric command
	JR	NC,CMANDERR
CASE:		; Decodes menu command byte and goes to indicated rtn.
;			; On entry:	A  = Command byte (relative to 0)
;			;		HL = Appropriate routine address table
;			; On exit:	PC = Indicated routine
;			; All registers and flags are scratch
	ADD	A,A
	LD	E,A
	LD	D,0
	ADD	HL,DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	JP	(HL)			; Return address already on stack
;
;
;
;
CMANDERR:	; Displays an error message to the screen (as a buffer string)
;			; On entry:	No values passed
;			; On exit:	Zero flag set if I/O was OK
;			; DE-reg, A-reg and Flags are scratch
	LD	DE,CMDERMSG
	CALL	SHOMESAG
	JR	RESTART
;
;
;
CASETBL1:
	DW	NULLRUTN	;		00H	; ^@
	DW	HOMEADDR	;HOME	(WYSE)	01H	; ^A
	DW	CMANDERR	;		02H	; ^B
	DW	CMANDERR	;BREAK		03H	; ^C
	DW	BUMPSCTR	;WSRIGHT	04H	; ^D
	DW	DROPTRAK	;WSUP		05H	; ^E
	DW	BUMPSCTR	;RIGHT	(WYSE)	06H	; ^F
	DW	CMANDERR	;BELL		07H	; ^G
	DW	DROPSCTR	;LEFT	(BOTH)	08H	; ^H
	DW	CMANDERR	;TAB		09H	; ^I
	DW	BUMPTRAK	;DOWN	(BOTH)	0AH	; ^J
	DW	DROPTRAK	;UP	(SANYO)	0BH	; ^K
	DW	BUMPSCTR	;RIGHT	(SANYO)	0CH	; ^L
	DW	SHOWMENU	;<RETURN>	0DH	; ^M
	DW	CMANDERR	;		0EH	; ^N
	DW	CMANDERR	;		0FH	; ^O
	DW	CMANDERR	;		10H	; ^P
	DW	CMANDERR	;		11H	; ^Q
	DW	CMANDERR	;		12H	; ^R
	DW	DROPSCTR	;WSLEFT		13H	; ^S
	DW	HOMEADDR	;HOME	(SANYO)	14H	; ^T
	DW	DROPSCTR	;LEFT	(WYSE)	15H	; ^U
	DW	CMANDERR	;		16H	; ^V
	DW	CMANDERR	;CTRLW		17H	; ^W
	DW	BUMPTRAK	;WSDOWN		18H	; ^X
	DW	CMANDERR	;		19H	; ^Y
	DW	DROPTRAK	;UP	(WYSE)	1AH	; ^Z
	DW	DONE		;<ESCAPE>	1BH	; ^[
;
CASETBL2:
	DW	SETDRIVE	; Set New Drive	 30H	; '0'
	DW	SETTRAK		; Set New Track	 31H	; '1'
	DW	SETSCTR		; Set New Sector 32H	; '2'
	DW	SETBLOK		; Set New Block	 33H	; '3'
	DW	DUMPTRAK	; Dump Track	 34H	; '4'
	DW	DUMPSCTR	; Dump Sector	 35H	; '5'
	DW	EDITSCTR	; Edit Sector	 36H	; '6'
	DW	DUMPFILE	; Dump File	 37H	; '7'
	DW	CMANDERR	;		 38H	; '8'
	DW	PROCSDIR	; Process Dir.	 39H	; '9'
;
CASETBL3:
	DW	EDTCMDER	;		00H	; ^@
	DW	EDITHOME	;HOME	(WYSE)	01H	; ^A
	DW	EDTCMDER	;		02H	; ^B
	DW	EDTCMDER	;		03H	; ^C
	DW	BUMPBYTE	;WSRIGHT	04H	; ^D
	DW	DROPSGMT	;WSUP		05H	; ^E
	DW	BUMPBYTE	;RIGHT	(WYSE)	06H	; ^F
	DW	EDTCMDER	;		07H	; ^G
	DW	DROPBYTE	;LEFT	(BOTH)	08H	; ^H
	DW	TOGLMODE	;TAB		09H	; ^I
	DW	BUMPSGMT	;DOWN	(BOTH)	0AH	; ^J
	DW	DROPSGMT	;UP	(SANYO)	0BH	; ^K
	DW	BUMPBYTE	;RIGHT	(SANYO)	0CH	; ^L
	DW	EDTCMDER	;<RETURN>	0DH	; ^M
	DW	EDTCMDER	;		0EH	; ^N
	DW	EDTCMDER	;		0FH	; ^O
	DW	NULLRUTN	;		10H	; ^P
	DW	EDTCMDER	;		11H	; ^Q
	DW	EDTCMDER	;		12H	; ^R
	DW	DROPBYTE	;WSLEFT		13H	; ^S
	DW	EDITHOME	;HOME	(SANYO)	14H	; ^T
	DW	DROPBYTE	;LEFT	(WYSE)	15H	; ^U
	DW	EDTCMDER	;		16H	; ^V
	DW	EDTCMDER	;CTRLW		17H	; ^W
	DW	BUMPSGMT	;WSDOWN		18H	; ^X
	DW	EDTCMDER	;		19H	; ^Y
	DW	DROPSGMT	;UP	(WYSE)	1AH	; ^Z
;
CASETBL4:
	DW	DIRCMDER	;		00H	; ^@
	DW	DIRHOME		;HOME	(WYSE)	01H	; ^A
	DW	DIRCMDER	;		02H	; ^B
	DW	DIRCMDER	;		03H	; ^C
	DW	BUMPNTRY	;WSRIGHT	04H	; ^D
	DW	DROPLINE	;WSUP		05H	; ^E
	DW	BUMPNTRY	;RIGHT	(WYSE)	06H	; ^F
	DW	DIRCMDER	;		07H	; ^G
	DW	DROPNTRY	;LEFT	(BOTH)	08H	; ^H
	DW	DIRCMDER	;TAB		09H	; ^I
	DW	BUMPLINE	;DOWN	(BOTH)	0AH	; ^J
	DW	DROPLINE	;UP	(SANYO)	0BH	; ^K
	DW	BUMPNTRY	;RIGHT	(SANYO)	0CH	; ^L
	DW	DIRCMDER	;<RETURN>	0DH	; ^M
	DW	DIRCMDER	;		0EH	; ^N
	DW	DIRCMDER	;		0FH	; ^O
	DW	DIRCMDER	;		10H	; ^P
	DW	DIRCMDER	;		11H	; ^Q
	DW	DIRCMDER	;		12H	; ^R
	DW	DROPNTRY	;WSLEFT		13H	; ^S
	DW	DIRHOME		;HOME	(SANYO)	14H	; ^T
	DW	DROPNTRY	;LEFT	(WYSE)	15H	; ^U
	DW	DIRCMDER	;		16H	; ^V
	DW	DIRCMDER	;CTRLW		17H	; ^W
	DW	BUMPLINE	;WSDOWN		18H	; ^X
	DW	DIRCMDER	;		19H	; ^Y
	DW	DROPLINE	;UP	(WYSE)	1AH	; ^Z
;
;
;CASETBL5:
;	DW	SHOTRERR	;		00H	; ^@
;	DW	TRACEHOM	;HOME	(WYSE)	01H	; ^A
;	DW	SHOTRERR	;		02H	; ^B
;	DW	SHOTRERR	;		03H	; ^C
;	DW	SHOTRCRT	;WSRIGHT	04H	; ^D
;	DW	SHOTRCUP	;WSUP		05H	; ^E
;	DW	SHOTRCRT	;RIGHT	(WYSE)	06H	; ^F
;	DW	SHOTRERR	;		07H	; ^G
;	DW	SHOTRCLF	;LEFT	(BOTH)	08H	; ^H
;	DW	SHOTRERR	;TAB		09H	; ^I
;	DW	SHOTRCDN	;DOWN	(BOTH)	0AH	; ^J
;	DW	SHOTRCUP	;UP	(SANYO)	0BH	; ^K
;	DW	SHOTRCRT	;RIGHT	(SANYO)	0CH	; ^L
;	DW	SHOTRERR	;<RETURN>	0DH	; ^M
;	DW	SHOTRERR	;		0EH	; ^N
;	DW	SHOTRERR	;		0FH	; ^O
;	DW	SHOTRERR	;		10H	; ^P
;	DW	SHOTRERR	;		11H	; ^Q
;	DW	SHOTRERR	;		12H	; ^R
;	DW	SHOTRCLF	;WSLEFT		13H	; ^S
;	DW	DIRHOME		;HOME	(SANYO)	14H	; ^T
;	DW	SHOTRCLF	;LEFT	(WYSE)	15H	; ^U
;	DW	SHOTRERR	;		16H	; ^V
;	DW	SHOTRERR	;CTRLW		17H	; ^W
;	DW	SHOTRCDN	;WSDOWN		18H	; ^X
;	DW	SHOTRERR	;		19H	; ^Y
;	DW	SHOTRCUP	;UP	(WYSE)	1AH	; ^Z
;
;
EDTESCSQ DB	ESC,'='		; Editing cursor position escape-sequence
EDITLINE DB	0		; Editing cursor line
EDITCOL	 DB	0		; Editing cursor column
	 DB	0
;
STARTMSG DB	CLEARSCR,ESC,'=',SINONLIN+CTLFACTR,SINONCOL+CTLFACTR
	 DB	'                       WHISK CP/M Disk Sector Editor'
	 DB	CR,LF,LF
	 DB	'                     COPYRIGHT (C) 1987 WALLACE W. COX'
	 DB	CR,LF,LF,LF,LF,LF,LF
	 DB	'                     PRESS ANY KEY TO ABORT TIMER LOOP'
	 DB	0
;
EDITMENU DB	'0000 (0000) '
	 DB	'<==Current data byte offset within sector image.',CR,LF,LF
;
TABLEGND DB	'The TAB key toggles '	; These four lines..
HXASCCOL EQU	$-TABLEGND		;  ..must be kept..
HXASCLIN EQU	CURBYLIN+2		;   ..in this..
	 DB	'hex/ASCII'		;    ..order
	 DB	' Editing mode;  '
	 DB	'^P Printer Echo disabled in EDIT!',CR,LF,LF
;
	 DB	'DEL (OR ^U) will UN-DO any changes '
	 DB	'SINCE THE LAST CURSOR MOVE!!',CR,LF
;
	 DB	'ESC terminates the sector edit, '
	 DB	'with a final chance to ABORT any changes.',CR,LF
;
	 DB	'Cursor arrows or (WS-diamond) move the cursor'
	 DB	0
;
;
DIRMENU	 DB	ESC,'=',DIRMNLIN+CTLFACTR,0+CTLFACTR
	 DB	'ESC terminates the directory edit, '
	 DB	'with a final chance to ABORT any changes.',CR,LF
;
	 DB	'Cursor arrows or (WS-diamond) move the cursor.  '
	 DB	'0=Block Map'
	 DB	0
;
;
DRSCRPOS DB	ESC,'='
DRSCRLIN DB	0	; Cursor screen line during directory editing
DRSCRCOL DB	0	; Cursor screen column during directory editing
	 DB	0
;
TRACEPOS DB	ESC,'=',FIRSTLIN+CTLFACTR,FIRSTCOL+CTLFACTR,0
;
CURBYPOS DB	ESC,'=',CURBYLIN+CTLFACTR,CURBYCOL+CTLFACTR,0
;
HXASCPOS DB	ESC,'=',HXASCLIN+CTLFACTR,HXASCCOL+CTLFACTR,0
;
HEXASCII DB	'hex/ASCII',0,'HEX/ascii',0
HXASCLEN EQU	($-HEXASCII)/2
;
FULDRCLR DB	ESC,'=',FULDRLIN+CTLFACTR,FULDRCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	CR,LF
FULDRPOS DB	ESC,'=',FULDRLIN+CTLFACTR,FULDRCOL+CTLFACTR
	 DB	0
;
ERASEMSG DB	'*  '
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	0
;
;
MAINMENU DB	ESC,'=',MAINLINE+CTLFACTR,CURBYCOL+CTLFACTR
	 DB	'          '
	 DB	'WHISK Disk "Clean-Up" and Data Recovery Utility - MAIN MENU'
	 DB	'         '
	 DB	CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'   Disk, Track and Sector Operations:        | '
	 DB	'   File Operations:             ',CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'0 = Set new drive    4 = Dump current track  | '
	 DB	'7 = Dump selected file          ',CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'1 = Set new track    5 = Dump current sector | '
	 DB	'                                ',CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'2 = Set new sector   6 = EDIT current sector | '
	 DB	'9 = Process directory           ',CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'3 = Set new Block                              '
	 DB	'                                '
	 DB	0
;
;
CURSRHOM DB	ESC,'=',FIRSTLIN+CTLFACTR,FIRSTCOL+CTLFACTR,0
;
STATLGND DB	ESC,'=',STATLIN+CTLFACTR,STATCOL+CTLFACTR,0
;
TRACLGND DB	CLEARSCR,0
;
BUMPLGND DB	CR,LF,'Use cursor arrows (or WS-diamond) '
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'to adjust track/sector',0
;
DRTRCMNU DB	CR,LF,'DIRECTORY TRACE MENU'
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Cursor arrows or (WS-diamond) move the cursor.  ',0
;
DLAYLGND DB	CR,LF,'^C ABORTS dump, 0 PAUSES scrolling, '
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'1-9 restarts and/or sets scroll speed',CR,LF,0
;
DRVPROMT DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Enter New Drive, or Type <ESC> to Abort the Command: ',0
;
DMPPRMPT DB	ESC,'=',CMANDLIN+CTLFACTR,CMANDCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Enter Menu Selection  (^P echoes output to Printer): ',0
;
TRKPROMT DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Enter new Track: ',0
;
SECPROMT DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Enter new Sector: ',0
;
BLKPROMT DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Enter new CP/M block: ',0
;
UNEUSRER DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Invalid User-ID, Re-',0
;
UNEUSRPR DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	'Enter user-ID into which you wish to unerase: '
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	0
;
;
FNAMPRMT DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Enter file name: ',0
;
;
FSTATLG1 DB	' File-Name='
DUMPDRIV DB     'A:'		; Reserve area for dump-file Drive-ID
	 DS	FSPECLEN
	 DB	' Sec.=',0
FSTATLG2 DB	', Block=',0
FSTATLG3 DB	'  ',0
;
;
TRAKLGND DB	'Drive='
DRIVEID	 DB	'?, Track=',0
SCTRLGND DB	', Sector=',0
BLOKLGND DB	', Block=',0
SYSLEGND DB	'System    ',0
DIRLEGND DB	'Directory ',0
NOLEGND	 DB	    '      ',0
DCHXLGND DB	'dec. (hex)  ',0
DCHLLNTH EQU	$-DCHXLGND
SCALE	 DB	'  0___4___8___C___',CR,LF,0
;
DIRHEAD	 DB	'* File Name  # Recs:',0
;
FORCEUP	 DB	CR,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,LF,0
;
;
VERERRMS DB	CLEARSCR,'Must be Version 2.x of CP/M!!  Job aborted!',BELL,0
;
SMALLMSG DB	CLEARSCR,'Insufficient memory available!!  Job aborted!',BELL,0
;
EDXITQRY DB	ESC,'=',CMANDLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Do you wish to exit back to main menu? (Y/N): ',0
;
UPDATQRY DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Sector has been modified, do you wish to rewrite to disk?'
	 DB	' (Y/N): ',0
;
UNDOQURY DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Sector has been modified, do you wish to UN-DO the changes?'
	 DB	' (Y/N): ',0
;
TRACEQRY DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Some blocks are allocated to more than one file! '
	 DB	'Display conflict map? (Y/N):',0
;
DRIVEBAD DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Drive Invalid, Drive reset to "A:"',0
;
CMDERMSG DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Unidentified command, Re-enter: ',0
;
DSPCHERR DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Dispatch error!',BELL,BELL,BELL,0
;
SECERMSG DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'UN-RECOVERABLE DISK ERROR!  Continue or Restart? (C/R): ',0
;
RECALMSG DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Disk error, re-calibrating: ',0
;
DPBERMSG DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Disk Parameter Block (DPB) Error!!',0
;
BADINPUT DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Bad input, re-enter: ',0
;
NOFILEMS DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Requested file not found!',0
;
BADNAMMS DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Invalid file name, re-enter: ',0
;
DIDUPDAT DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Updated sector RE-WRITTEN to disk!!!',CR,LF,0
;
NOUPDATE DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Updated sector NOT RE-WRITTEN to disk!!!',CR,LF,0
;
DIDUNDO	 DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Sector restored to state before last cursor move!!',CR,LF,0
;
DINTUNDO DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR,BELL
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	'Sector NOT restored!! '
	 DB	'Unchanged since last cursor move!!',CR,LF
	 DB	ESC,'T'		; Clear to E-O-L
	 DB	0
;
;
BLANKMSG DB	ESC,'=',MESAGLIN+CTLFACTR,MESAGCOL+CTLFACTR
BLANKLIN:
CLEAREOL:
	 DB	ESC,'T',0
;	 DB	'                                       '	; 39 Spaces
;	 DB	'                                       '	; 39 Spaces
;	 DB	0
;
;
NUMBLKMS DB	CR,CR,'Total Data Blocks per Disk:  ',0
SECBLKMS DB	CR,LF,'Sectors per block:           ',0
SECDSKMS DB	CR,LF,'Total Data Sectors per Disk: ',0
SECTRKMS DB	CR,LF,'Sectors per track:           ',0
BLKSIZMS DB	CR,LF,'CP/M Allocation Block size:  ',0
DSKSIZMS DB	CR,LF,'Total Data Bytes per Disk:   ',0
MAXTRKMS DB	CR,LF,'Maximum Addressable Track:   ',0
TRKOFFMS DB	CR,LF,'Directory Track Offset:      ',0
DIRBLKMS DB	CR,LF,'Directory blocks:            ',0
MAXDIRMS DB	CR,LF,'Max directory entries:       ',0
EXTNTSMS DB	CR,LF,'Extents per entry:           ',0
SKEWMSG	 DB	CR,LF,'Sector Skew Factor:          ',0
;
KBYTESMS DB	'K bytes',0
;
NUMWORK	 DB	'00000',0
INDEXSAV DW	0
	 DW	0	; PAD WORD, JUST IN CASE!!!!!!!
;
;
CURRTRAN DW	0
;
CURRBLOK DW	0
CURRTRAK DW	0
CURRSCTR DW	0
;
DUMPDLAY DW	 BASETIME	; Scroll speed timer value for track dump
;
EDTOFSET DW	0		; Cursor offset in sector during editing
;
BLKPERTK DW	0		; Blocks per track
SECPERBK DW	0		; Sectors per Block
SECPERDR DW	0		; Sectors per Directory
BLKPERDR DW	0		; Blocks per Directory
DTABLOKS DW	0		; Blocks useable for DATA (includes directory)
DTASCTRS DW	0		; Sectors useable for DATA (includes directory)
DTATRAKS DW	0		; Tracks useable for DATA (includes directory)
MAXTRACK DW	0	; Maximum addressable track
;
;
BLOKSIZE DW	0	; CP/M Allocation-Block Size (in K-bytes)
;
DISKSIZE DW	0	; Disk size in K-bytes, excluding system tracks
;
DPHSAVE	 DW	0	; Save area for confirmed DPH pointer
;
DPBSAVE	 DW	0	; Save area for confirmed DPB pointer
;
BLKPOINT DW	0	; Save area for Block Matrix memory array pointer
;
BLKARRAY DW	0	; Save area for Block Matrix memory array start address
;
DIRMEMLM DW	0	; Defines the maximum number of memory pages..
;			;  ..which can be stored in DIRARRAY memory array
;
DIRPOINT DW	0	; Pointer to entry in directory array
;
POINTSAV DW	0	; Pointer to entry in directory array
;
DIRENTRY DW	0	; Pointer to entry in directory array
;
;
TYPSTART DW	0
NAMSTART DW	0
FCBPNTR	 DW	0
;
NEWSTACK DW	0
STACKLMT DW	0
;
;
BLKPRENT DB	0	; Number of CP/M block pointers per Directory Entry
;
PRNTTOGL DB	0	; LST: echo to printer toggle: 00=off, FF=on
;
MODETOGL DB	0	; Editing mode toggle: 0=ASCII, 1=Hex
;
UPDATFLG DB	0	; Editing "sector modified" flag (ZERO = NOT CHANGED)
;
UNDOFLAG DB	0	; Editing "sector modified since last cursor move"..
;			;  ..flag (set if > ESC)
;
BLKCONSW DB	0	; Switch indicating a block conflict (0s) or NOT (1s)
;
EXTNTSUB DB	0
;
DIRUPDAT DB	-1
;
USERID	 DB	0
;
;
EXTNTARY DS	16*2
XTNTARLN EQU	$-EXTNTARY
;
;
;
DPARMWRK:		; Save area for copy of current DPH
SECPERTK DW	0		; Define number of sectors per track
BSHIFT	 DB	0
BLM	 DB	0
EMASK	 DB	0
MAXBLOKS DW	0
DIRNTRYS DW	0
DIRALMSK:
AL0	 DB	0
AL1	 DB	0
CKS	 DW	0
DIROFSET DW	0
SECSIZ	 DB	0
DPARMLEN EQU	$-DPARMWRK
;
;
;
NAMEBUFR DB	FSPECLEN+3
FILESPEC DB	0
FILENAME DS	FSPECLEN+1
;
FILEFCB	 DS	64
INPUTFCB DS	64
;
SAVEAREA EQU	$	; Define save area for original sector in case of undo
;
OUTAREA	 DS	128	; Directory display work area (overlaps savearea)
INAREA	 DS	128
DIRARRAY EQU	$
;
	END

;==================================================================
WCC:		;
	PUSH	BC		;
	PUSH	DE		;
	PUSH	HL		;
	LD	C,WCCFC		;
	LD	E,A		;
	CALL	BDOS		;
	POP	HL		;
	POP	DE		;
	POP	BC		;
	RET		;
;
;
