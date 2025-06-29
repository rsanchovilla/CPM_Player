;-------------------------------------------------------------
;PATCH AREA
;This is an adaptation of Qterm.pat, a patch area for
; Qterm.com v. 4.2 by David Goodenough.  It is designed so
; that any Qterm patches can be used with the game program.
;If you are going to modify this to suit your terminal type,
; please note that the game program uses only a limited
; part of the patch area, and hence only the sequences and
; routines that are used by the game is represented here.
; You can be as liberal as you can with the space usage,
; but bear in mind that this version of the patch CANNOT
; be used with any other programs that use Qterm patches.
;
;You may use any patching program you prefer (DDT, MLOAD,
; etc.) to patch this onto the game program.  If you are
; using SAVE, 20 (14h) would be a good number to use.
;-------------------------------------------------------------
;Routine assignements - DO NOT TOUCH THIS AREA!!!
	ORG	0100h
	JP	0506h
	JP	0006h
	JP	0009h
	JP	000Ch
	JP	0500h
;-------------------------------------------------------------
;Speed of the Z-80 CPU in MHz, rounded up.  If a faster or
; slower equivalent processor is used (like a 180, 280, etc.)
; translate it into Z-80 time.  Only 4 LSB are honored.  If
; you set this to 0, the game will be hell.  If you set it to
; 15, that's cheating.
	ORG	01CEh
	DB	04h
;-------------------------------------------------------------
;Sign-on message.  This is to tell the player which terminal
; configuration is being used.  MUST BE TERMINATED WITH 00h!!!
	ORG	01D0h
	DB	'Epson QX-10, ANSI emulation...'
	DB	00h
;-------------------------------------------------------------
;Clear-screen character sequence.  All the necessary codes
; to clear the screen completely and move the cursor to
; the top left hand corner.  MUST BE TERMINATED WITH 00h!!!
	ORG	01F0h
	DB	1Bh,'[;H',1Bh,'[J'
	DB	00h
;-------------------------------------------------------------
;Cursor movement ROUTINE.  H contains row (y), and L contains
; column (x).  (0,0) or 0000h points to the top left hand
; corner.
;NOTE: this is not a list of sequence, but a routine.
;ALSO NOTE: CALL 0109h will cause the content of the register
; C to be sent to the device output (the terminal)
;         : CALL 010Ch will cause the content of the register
; L to be printed at the device output in decimal.  Use this
; routine for ANSI-type terminals and other terminals that
; use decimal character output to position the cursor.  ONLY
; THE 6 LSB ARE HONORED FOR THE SAKE OF SPEED.
	ORG	0200h
	PUSH	HL
	LD	C,1Bh
	CALL	0109h
	LD	C,'['
	CALL	0109h
	POP	HL
	PUSH 	HL
	LD	L,H
	INC	L	;to adjust for bias
	CALL	010Ch	;print H (row) in decimal
	LD	C,';'
	CALL	0109h
	POP	HL
	INC	L
	CALL	010Ch	;print L (column) in decimal
	LD	C,'H'
	CALL	0109h
	RET

;That's all, folks!
