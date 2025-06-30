;****************************************
;					*
;		PWRESET			*
;					*
;      DISK RESET patch for PW.COM	*
;					*
;	 Original idea from an		*
;	  anonymous hacker in		*
;	   Portland, Oregon		*
;					*
;	 This implementation by:	*
; 	    Peter Brawley		*
; 	    16 Hazel Ave.,		*
; 	    Toronto M4E 1C5,		*
; 	    Canada			*
;	    (416) 699 8757		*
;					*
;****************************************

; Last update 15 Aug 84.

; Redefines the Perfect Writer command 
; <ctrl-x s>, which called (im)Perfect Speller, 
; as a DISK RESET call, to allow disk changes
; while editing.  You can now write or rewrite
; all or part of your text to files of any name
; on as many disks as you like, so long as you hit
; <ctrl-x s> BEFORE each disk change.

; For Perfect Writer version 1.20.

; When this patch is installed, the command
; <ctrl-x s> or <ctrl-x S> sets all on-line disks 
; to read/write status, and the current disk
; (the disk from which PW.COM was originally called)
; is re-selected.  The message "Reset" is printed 
; on the bottom line of the screen.
; The keyboard click is also turned off (but it
; will be turned on again by the first error bleep
; sent you way by Perfect Writer).

; To write all or part of a file to a new disk:
; change disks, then hit <ctrl-x s>,
; then write the whole file with
; <ctrl-x ctrl-s> or <ctrl-x ctrl-w>,
; or write a marked block with <ctrl-x r>.

; As before, you MUST prefix a filename with a disk
; letter and colon to force writing to a disk other
; than the current disk.

; There are slow and quick ways of installing this
; patch:
;
; 			S L O W
;
;	Get DDT.COM, PWRESET.HEX and PW.COM on one disk,
;	hit ctrl-C, then do these commands:
;		ddt
;		f100,9000,0
;		ipw.com
;		r
;		f5ec9,5fc4,0
;		ipwreset.hex
;		r
;		g0			;g zero not g oscar
;		save 137 pw.com
;	Be sure to test your patch before you copy
;	PW.COM back to your Perfect Writer disk.

;			Q U I C K

;	Place a ZCPR SYSTEM disk in A:, and boot it.

;	Either A: or B: must have DDT.COM, I.COM, and
;	EX.COM

;	In B: place a disk holding a copy of PW.COM, 
;	PWRESET.HEX, and PWRESET.SUB

;	From B:, simply type EX PWRESET, sit back 
; 	and watch your machine dance ... and you're done !


; 	RE-ASSEMBLY OF THIS FILE REQUIRES MAC.COM and 
;	CPMMAC.LIB. If you don't have MAC, recode the 
;	PRINT command for ASM, remove the <maclib cpmmac> 
;	directive and the flag settings, and assemble 
;	with ASM or LASM.

; Configured for KAYPRO computers.
; Will work as is on any ADM-3A terminal.
; For other terminals, the line-24-positioning
; sequence <esc,'=7 '> and the <weol> equate
; must be changed.

false	equ	0
true	equ	not false
weol	equ	18h		; wipe line

prflag	set	false
coflag	set	false
	
	maclib	cpmmac

	org	5ec9h		; <call PS> address in PW

	push	b		; save registers used
	push	psw
	PRINT	<esc,'=7 ',weol,'Reset'>
	lxi	b,25		; get current disk, save it
	call	bdos
	sta	disk
	lxi	b,13		; BDOS disk reset
	call	bdos
	lda	disk		; re-select current disk
	mov	e,a
	mvi	d,0
	lxi	b,14
	call	bdos
	mvi	a,8		; turn off the click
	out	5
	pop	psw		; restore registers
	pop	b
	ret
disk:	db	00
X PWRESET, sit back 
; 	and watch your machine dance ... and you're done !


; 	RE-ASSE