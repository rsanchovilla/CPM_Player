; ===========================================================================
; UC Davis MicroMumps for CP/M - version 4.06
; Rebuilt by Marcelo F. Dantas in February of 2014
; marcelo.f.dantas@gmail.com
; ===========================================================================
;
		org	0100h
; ---------------------------------------------------------------------------
BOOT		equ	0000h
BDOS		equ	0005h
BDOSaddr	equ	0006h
MumpsFCB	equ	005ch
FileReg		equ	MumpsFCB+32
; ---------------------------------------------------------------------------
		ld	hl, 0
		add	hl, sp
		ld	(SaveSP), hl
		ld	hl, DiskBuf
		ld	sp, hl		; Stack goes below the disk buffer
		ld	c, 9		; Output string
		ld	de, Greet
		call	BDOS
rMumpsDR:
		ld	c, 9		; Output string
		ld	de, EnterDrive	; "Enter drive of the MUMPS.COM to change"
		call	BDOS
		call	ReadDR		; Reads drive letter, returns in a
		jp	c, rMumpsDR
		cp	0FFh		; Is it invalid?
		jp	z, rMumpsDR
		ld	e, a
		ld	c, 14		; Select disk
		call	BDOS
		ld	c, 15		; Open file
		ld	de, MumpsFCB
		call	BDOS
		inc	a
		jp	z, rMumpsDR	; Not found
		ld	hl, DiskBuf
		ld	(DiskBufLoc), hl
		xor	a
		ld	(FileReg), a
		ld	b, 4		; Number of sectors to read
ReadSecs:
		push	bc
		ld	c, 26		; Set DMA address
		ld	hl, (DiskBufLoc)
		ex	de, hl
		call	BDOS
		ld	c, 20		; Read next record
		ld	de, MumpsFCB
		call	BDOS
		ld	hl, (DiskBufLoc)
		ld	de, 128
		add	hl, de		; Points to the next 128 bytes sector
		ld	(DiskBufLoc), hl
		pop	bc
		dec	b		; All done?
		jp	nz, ReadSecs	; No.
rPartition:
		ld	c, 9		; Output string
		ld	de, EnterPart1	; "Enter partition size in bytes ("
		call	BDOS
		ld	hl, (PartSize)
		call	HLtoInt
		ld	c, 9		; Output string
		ld	de, EnterPart2	; "): "
		call	BDOS
		ld	c, 10		; Buffered console input
		ld	de, iBUFFER
		call	BDOS
		ld	de, BUFFER
		ld	a, (de)
		cp	6		; how many characters read
		jp	nc, InvPart	; 6 or more
		or	a
		jp	z, ReadGDR
		ld	c, a
		inc	de
		ld	hl, 0
CkPart:
		ld	a, (de)		; Checks if the partsize is correct
		push	de
		cp	30h ; '0'
		jp	c, rPartition	; Less than '0'
		cp	3Ah ; ':'
		jp	nc, rPartition	; Less than ':'
		and	0Fh		; Mask out the high 4 bits
		push	hl
		add	hl, hl
		jp	c, CkPart1
		add	hl, hl
		jp	c, CkPart1
		pop	de
		add	hl, de
		jp	c, CkPart2
		add	hl, hl
		jp	c, CkPart2
		ld	e, a
		ld	d, 0
		add	hl, de
		pop	de
		inc	de
		dec	c
		jp	nz, CkPart
		jp	CkFree
; ---------------------------------------------------------------------------
CkPart1:
		pop	hl
CkPart2:
		pop	hl
InvPart:
		ld	de, InvPartition ; "Invalid partition size"
		ld	c, 9
		call	BDOS
		jp	rPartition
; ---------------------------------------------------------------------------
CkFree:
		ld	(PartSize), hl
		ex	de, hl
		ld	hl, (LastByte)
		add	hl, de
		jp	c, CkFree1
		ex	de, hl
		ld	hl, (BDOSaddr)	; BDOS jump point
		dec	hl
		ld	a, l
		sub	e
		ld	l, a
		ld	a, h
		sbc	a, d
		ld	h, a
		jp	nc, CkRoom
CkFree1:
		ld	de, TooLarge	; "Partition is too large--try again"
CkFree2:
		ld	c, 9		; Output string
		call	BDOS
		jp	rPartition
; ---------------------------------------------------------------------------
CkRoom:
		ld	de, 1058
		ld	a, l
		sub	e
		ld	a, h
		sbc	a, d
		jp	nc, CkLeaves
		ld	de, NoRoom	; "Not enough room for GLOBAL buffers"
		jp	CkFree2
; ---------------------------------------------------------------------------
CkLeaves:
		push	hl
		ld	de, ThatLeaves	; "That leaves "
		ld	c, 9		; Output string
		call	BDOS
		pop	hl
		call	HLtoInt
		ld	de, BytesLeft	; " bytes for ROUTINE and GLOBAL buffers"...
		ld	c, 9		; Output string
		call	BDOS
AskRoom:
		ld	de, Enough	; "Is that enough room? (Y/N) "
		call	YesNo		; Reads Yes or No
		jp	c, AskRoom
		jp	z, ReadGDR
		cp	4Eh ; 'N'
		jp	z, rPartition
ReadGDR:
		ld	hl, GlobalDR
		ld	de, EnterGDR	; Enter default GLOBAL drive ("
		call	ReadDRdef	; Reads drive letter with default
		jp	c, ReadGDR
		jp	z, ReadRDR
		ld	(GlobalDR), a
ReadRDR:
		ld	hl, RoutineDR
		ld	de, EnterRDR	; "Enter default ROUTINE drive ("
		call	ReadDRdef	; Reads drive letter with default
		jp	c, ReadRDR
		jp	z, ReadEDR
		ld	(RoutineDR), a
ReadEDR:
		ld	hl, ErrorDR
		ld	de, EnterEDR	; "Enter default ERROR MESSAGE drive ("
		call	ReadDRdef	; Reads drive letter with default
		jp	c, ReadEDR
		jp	z, ReadMFN
		ld	(ErrorDR), a
ReadMFN:
		ld	de, ErrorFName	; "Enter name for new ERROR MESSAGE file"
		ld	c, 9		; Output string
		call	BDOS
		ld	c, 0Ah		; Buffered console input
		ld	de, iBUFFER
		call	BDOS
		ld	hl, BUFFER
		ld	a, (hl)
		or	a
		jp	z, ReadChAE	; No change
		inc	hl
		ld	c, a
		ld	de, ErrorName
		ld	a, 20h ; ' '
		ld	b, 11
ReadMFN1:
		ld	(de), a		; Fill up with spaces
		inc	de
		dec	b
		jp	nz, ReadMFN1
		ld	de, ErrorName
		ld	b, 8
ReadMFN2:
		ld	a, (hl)
		cp	2Eh ; '.'
		jp	z, ReadMFN4
		cp	61h ; 'a'
		jp	c, ReadMFN3
		cp	7Bh ; '{'
		jp	nc, ReadMFN3
		and	0DFh ; '�'
ReadMFN3:
		ld	(de), a
		inc	de
		inc	hl
		dec	c
		jp	z, ReadChAE
		dec	b
		jp	nz, ReadMFN2
		ld	a, (hl)
		cp	2Eh ; '.'
		jp	nz, ReadChAE
ReadMFN4:
		inc	hl
		dec	c
		push	bc
		ld	c, b
		ld	b, 0
		ex	de, hl
		add	hl, bc
		ex	de, hl
		pop	bc
		ld	b, 3
		jp	ReadMFN2
; ---------------------------------------------------------------------------
ReadChAE:
		ld	de, ChangeAE	; "Do you want to change the auto-exec"
		call	YesNo		; Reads Yes or No
		jp	c, ReadChAE
		jp	z, WriteCHG
		cp	4Eh ; 'N'
		jp	z, WriteCHG	; Don't change
		ld	c, 9		; Output string
		ld	de, AutoExec	; "Enter the mumps commands to auto-exec"
		call	BDOS
		ld	c, 10		; Buffered console input
		ld	de, iAEBUF
		ld	a, 0FFh
		ld	(de), a
		call	BDOS
		ld	de, iAEBUF+1
		ld	a, (de)
		or	a
		jp	z, ReadChAE1	; Nothing typed
		ld	h, 0
		ld	l, a
		add	hl, de
		inc	hl
		ld	(hl), 0Dh
		ld	a, 1
ReadChAE1:
		dec	de
		ld	(de), a
WriteCHG:
		ld	hl, DiskBuf
		ld	(DiskBufLoc), hl
		xor	a
		ld	(FileReg), a
		ld	b, 4		; Number of sectors to write
WriteCHG2:
		push	bc
		ld	c, 26		; Set DMA address
		ld	hl, (DiskBufLoc)
		ex	de, hl
		call	BDOS
		ld	c, 21		; Write next record
		ld	de, MumpsFCB
		call	BDOS
		ld	hl, (DiskBufLoc)
		ld	de, 128
		add	hl, de
		ld	(DiskBufLoc), hl
		pop	bc
		dec	b
		jp	nz, WriteCHG2
		ld	c, 9
		ld	de, Saved	; "The new configuration of MUMPS is saved"
		call	BDOS
		ld	hl, (SaveSP)
		ld	sp, hl
		jp	BOOT
; =============== S U B	R O U T	I N E =======================================
; Reads	drive letter, returns in a
ReadDR:
		ld	c, 0Ah		; Buffered input
		ld	de, iBUFFER
		call	BDOS
		ld	hl, BUFFER
		ld	a, (hl)
		or	a
		jp	z, ReadDR2
		cp	1
		jp	nz, ReadDR1
		inc	hl
		ld	a, (hl)
		and	0DFh ; '�'
		cp	41h ; 'A'
		ret	c
		cp	51h ; 'Q'
		jp	nc, ReadDR1
		sub	41h ; 'A'
		ret
; ---------------------------------------------------------------------------
ReadDR1:
		scf
		ret
; ---------------------------------------------------------------------------
ReadDR2:
		ld	a, 0FFh
		ret
; End of function ReadDR
;
; =============== S U B	R O U T	I N E =======================================
; Reads	drive letter with default
ReadDRdef:
		push	hl
		ld	c, 9		; Output string
		call	BDOS
		pop	hl
		ld	a, (hl)
		add	a, 41h ; 'A'
		ld	e, a
		ld	c, 2		; Console output
		call	BDOS
		ld	c, 9		; Output string
		ld	de, EnterPart2	; "): "
		call	BDOS
		call	ReadDR		; Reads drive letter, returns in a
		ret	c
		cp	0FFh
		jp	nc, ReadDRdef1
		ccf
ReadDRdef1:
		ret
; End of function ReadDRdef
;
; =============== S U B	R O U T	I N E =======================================
; Converts HL to integer string
HLtoInt:
		ld	de, 10000
		ld	bc, 0
ShowPart1:
		ld	a, l
		sub	e
		ld	l, a
		ld	a, h
		sbc	a, d
		ld	h, a
		jp	c, ShowPart2
		inc	b
		jp	ShowPart1
; ---------------------------------------------------------------------------
ShowPart2:
		add	hl, de
		ld	a, b
		or	c
		jp	z, ShowPart3
		ld	a, b
		or	30h ; '0'
		push	hl
		push	de
		push	bc
		ld	e, a
		ld	c, 2		; Console output
		call	BDOS
		pop	bc
		pop	de
		pop	hl
		inc	c
ShowPart3:
		ld	b, 0
		ld	a, e
		cp	10
		jp	z, ShowPart6
		cp	100
		jp	z, ShowPart4
		cp	232
		jp	z, ShowPart5
		ld	de, 1000
		jp	ShowPart1
; ---------------------------------------------------------------------------
ShowPart4:
		ld	de, 10
		jp	ShowPart1
; ---------------------------------------------------------------------------
ShowPart5:
		ld	de, 100
		jp	ShowPart1
; ---------------------------------------------------------------------------
ShowPart6:
		ld	a, l
		or	30h ; '0'
		ld	e, a
		ld	c, 2		; Console output
		call	BDOS
		ret
; End of function HLtoInt
;
; =============== S U B	R O U T	I N E =======================================
; Reads	Yes or No
YesNo:
		ld	c, 9		; Output string
		call	BDOS
		ld	c, 0Ah		; Buffered input
		ld	de, iBUFFER
		call	BDOS
		ld	hl, BUFFER
		ld	a, (hl)
		or	a
		ret	z
		inc	hl
		ld	a, (hl)
		and	0DFh
		cp	4Eh ; 'N'
		jp	z, YesNo1
		cp	59h ; 'Y'
		jp	nz, YesNo2
YesNo1:
		or	a
		ret
; ---------------------------------------------------------------------------
YesNo2:
		scf
		ret
; End of function YesNo
;
; ---------------------------------------------------------------------------
Greet:		db 'SetMumps v4.06 for Z80 Mumps CP/M',0Dh,0Ah
		db 'rebuilt in Feb/2014 by Marcelo Dantas',0Dh,0Ah
		db 'marcelo.f.dantas@gmail.com',0Dh,0Ah,'$'
EnterDrive:	db 0Dh,0Ah
		db 'Enter drive of the MUMPS.COM to change: $'
EnterPart1:	db 0Dh,0Ah
		db 'Enter partition size in bytes ($'
EnterPart2:	db '): $'
ThatLeaves:	db 0Dh,0Ah
		db 'That leaves $'
TooLarge:	db 0Dh,0Ah
		db 'Partition is too large--try again',0Dh,0Ah,'$'
ChangeAE:	db 0Dh,0Ah
		db 'Do you want to change the auto-execute command? (Y/N) $'
AutoExec:	db 0Dh,0Ah
		db 'Enter the mumps commands to auto-execute',0Dh,0Ah,'$'
Saved:		db 0Dh,0Ah
		db 0Ah
		db 'The new configuration of MUMPS is saved',0Dh,0Ah,'$'
EnterGDR:	db 0Dh,0Ah
		db 'Enter default GLOBAL drive ($'
EnterRDR:	db 0Dh,0Ah
		db 'Enter default ROUTINE drive ($'
EnterEDR:	db 0Dh,0Ah
		db 'Enter default ERROR MESSAGE drive ($'
BytesLeft:	db ' bytes for ROUTINE and GLOBAL buffers',0Dh,0Ah,'$'
ErrorFName:	db 0Dh,0Ah
		db 'Enter name for new ERROR MESSAGE file: $'
InvPartition:	db 0Dh,0Ah
		db 'Invalid partition size$'
Enough:		db 0Dh,0Ah
		db 'Is that enough room? (Y/N) $'
NoRoom:		db 0Dh,0Ah
		db 'Not enough room for GLOBAL buffers$'
;MumpsFCB:	db    0
;		db 'MUMPS   COM'
;		ds    20
;FileReg:	ds    4
DiskBufLoc:	dw    0			; Location of the disk buffer
SaveSP:		dw    0			; Save the stack pointer here
		ds    11
iBUFFER:	db    5			; Buffer for reading console input
BUFFER:		ds    40
		ds    20
		db    0
DiskBuf:	db    0			; Start of the disk buffer
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
GlobalDR:	db    0			; Default globals drive
RoutineDR:	db    0			; Default routines drive
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
LastByte:	dw    0			; Program+data size
PartSize:	dw    0			; Partition size
ErrorDR:	db    0			; Default ERRORS.DAT drive
		db    0
ErrorName:	db    0			; Name of error msg file
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
iAEBUF:		db    0			; Buffer for reading the autoexec
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
