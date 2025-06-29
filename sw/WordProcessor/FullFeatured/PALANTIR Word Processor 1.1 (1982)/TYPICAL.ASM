;printer driver for typical minimum printer
PRINTDEF equ	1000h

	org	PRINTDEF

VERSION	DB	1

; Printer Name for display -- must be exactly 16 characters
;		'................',0
prname	db	'Typical-minimum ',0

initflag db	0	;Has printer been initialized? (must be 0)


;	The following 2 parameters specify the number of increments per inch
;	that the printer can recognize, horizontally and vertically.  If the
;	printer has only fixed pitch, these should be the actual number of
;	characters and lines per inch that it prints.  If it supports full
;	incremental positioning, these would be actual increments -- typically
;	60 or 120 points horizontally and 24 or 48 vertically.	If the printer
;	can handle discrete pitches but not individual points, say 10 or 12
;	characters per inch but nothing else, the setting for 'incrh' should
;	be a common multiple of the various pitches -- 120, for example.  The
;	controls for HMI and VMI will adapt to the size closest to the pitch
;	required for formatting.  (Some printers may use one method for
;	horizontal pitch and another for vertical).

incrh	dw	10	;Assumes draft printer fixed at 10 characters per inch
incrv	dw	6	;Assumes draft printer fixed at 6 lines per inch


;	The next 2 parameters indicate the maximum width allowable for a
;	single character or line feed.	If more movement is required, the
;	WP generates additional spacing.  If the printer is fully incremental,
;	the values are its specified maximum settings.	If it supports only
;	a single pitch, the value is 1.  If multiple fixed settings are
;	available, use the largest number of increments supported.

maxh	db	1	;Maximum character size supported
maxv	db	1	;Maximum line size supported


;	The following data is established and maintained by the WP.
;	Only the space need be reserved, as shown.


seth	db	1	;Currently set character size
setv	db	1	;Currently set line size

posh	dw	0	;Horizontal position, in increments
posv	dw	0	;Vertical position, in increments

pdir	dw	1	;Current print direction


;	Hardware Implementation Data
; In general, the following attribute blocks have 0, 2,  4 or 080h in the
; first byte. 0 indicates ignore or the WP takes a logical action. 2 means
; that the word or words following point to sequences  to be sent. The 
; sequence is of form nulls, count, string. Nulls is number of timing nulls
; to send first. count is number of bytes which follow. String is a string of 
; count bytes. If the first byte is a 4, then a table of sequences to send is
; used. Each entry is 2-16b words. the first is the argument value, the second
; points to a sequence in the same format as discussed above. The argument 
; values must be in ascending order and the last must be 0ffffh. If the first
; byte is 080h then a custom routine is called whose address is in the next
; word. On exiting the custom routine A should be set to 080h. If A is set to
; 2 or 4, then the WP will consider that HL points to an attribute block and
; will do the action implied by 2 or 4.
;
;	Initialization Logic

dfinit	db	0	;Type of Initialization
	dw	0	;Address of routine or initialization sequence
hdware	db	0	;Initial Hardware Attribute Status


;	Printer Output Logic

dfout	db	0	;Data Output Method
	dw	0	;Address of custom routine or status port or address
	db	0,0	;Status Mask AND and OR
	db	0	;Data Ready Pattern
	dw	0	;Output port or address


;	Printer Status Input Logic

dfinp	db	0	;Printer Input Method, if Applicable
	dw	0	;Address of custom routine or status port or address
	db	0,0	;Status Mask AND and OR
	db	0	;Data Ready Pattern
	dw	0	;Input Port or Address


;	Handshaking Protocol

dfhand	db	0	;Handshaking Method (none if by timing or hardware)
	dw	0	;Address of custom routine or actual codes to send/rcv
	db	0	;Buffer half-size (0 to send at logical eol)

;	Timing Delay Controls

dfnull	db	0	;Method for timing delays (if needed)
	dw	0	;Address of custom rtn or timing constant

;	Horizontal Motion Index

dfhort	db	0	;Method for controlling horizontal pitch
	dw	0	;Address for custom rtn or low and high pitches
	dw	0	;Address of discrete table or leadin sequence
	db	0	;Offset to apply to HMI incremental setting
	db	0	;Format of HMI (FF-binary, 0-5 ascii size)
	dw	0	;Address of suffix, if any

;	Vertical Motion Index

dfvert	db	0	;Method for controlling vertical pitch
	dw	0	;Address for custom rtn or low and high pitches
	dw	0	;Address of discrete table or leadin sequence
	db	0	;Offset to apply to VMI incremental setting
	db	0	;Format of VMI (FF-binary, 0-5 ascii size)
	dw	0	;Address of suffix, if any

;	Page Feed Logic

dfpage	db	2	;Method for advancing new page
	dw	sqpage	;Address of code sequence or timing count

;	Line Feed Logic

dfnewl	db	2	;Method of performing line feed
	dw	sqnewl	;Address of code sequence or timing count
	db	0	;Flag 0 if independent, non-zero if forces C/R

;	End-of-Line Logic

dfeol	db	2	;Method for completing logical line
	dw	sqeol	;Address of code sequence or timing count
	db	0	;Flag 0 if returns pw to home, else non-zero

;	Backspace Logic

dfbksp	db	0	;Method for implementing backspace
	dw	0	;Address of code sequence or timing count

;	Bidirectional Print Logic

dfbidi	db	0	;Method for implementing reverse print
	dw	0	;Address of code sequence to reverse print
	dw	0	;Address of code sequence to restore print forward
	db	0	;Reserved

;	Attribute: Boldface

dfbold	db	0	;Method for implementing boldface
	dw	0	;Address of Boldface-On sequence
	dw	0	;Address of Boldface-Off sequence
	db	0	;Flag - nonzero if shadow print supported

;	Attribute: Underscore

dfunder db	0	;Method for implementing underscore
	dw	0	;Address for Underscore-On sequence
	dw	0	;Address for Underscore-Off sequence
	db	0	;Reserved

;	Attribute: Doublescore

dfdbls	db	0	;Method for implementing doublescore
	dw	0	;Address for Doublescore On sequence
	dw	0	;Address for Doublescore Off sequence
	db	0	;Flag 1, 2, or 4 for size multiplier if special print
			;     '=' or '_' to indicate method of true doublescore

;	Attribute: Strikethrough
dfthru	db	0	;Method for implementing strikethru
	dw	0	;Address for Sequence-On
	dw	0	;Address for Sequence Off
	db	0	;Reserved


;	Attribute: Ribbon Shift

dfribn	db	0	;Method for implementing ribbon shift
	dw	0	;Address for Sequence-On
	dw	0	;Address for Sequence-Off
	db	0	;Reserved

;	Attribute: Extended Character Set

dfext	db	0	;Method for implementing extended character set
	dw	0	;Address for Sequence-On
	dw	0	;Address of Sequence-Off
	db	0	;Reserved

;	Attribute: Alternate Font

dffont	db	0	;Method for implementing special fonts
	dw	0	;Address for sequence-on
	dw	0	;Address for sequence-off
	db	0	;Font-switching control byte

;	CONTROL BLOCK: CARRIAGE SHIFT SEQUENCE

DFSHFT	DB	0			; METHOD FOR IMPLEMENTATION
	DW	0			; ADDRESS FOR SEQUENCE ON
	DW	0			; ADDRESS FOR SEQWUENCE OFF
	DB	0			; FLAG BYTE FOR SHIFT STATUS

;	CONTROL BLOCK: PROPORTIONAL PRINT CONTROL

DFPROP	DB	0			; METHOD FOR IMPLEMENTATION
	DW	0			; ADDRESS FOR SEQUENCE ON
	DW	0			; ADDRESS FOR SEQUENCE OFF
	DB	0			; FLAG BYTE
	DB	0,0,0,0			; OPEN
; send ctrl-z at end of document for ending file, Decmation system
dfdoc	db	2
	dw	eofs	;send ctrl z at eof
	dw	0
	db	01	; send after form feed is sent
;
;
;	CONTROL BLOCK: RESERVED FOR EXPANSION

DFXTRA	DS	12


*******************************************************************************
*									      *
*	USER COMMUNICATIONS AREA FOR CUSTOM ROUTINE IMPLEMENTATION	      *
*									      *
*******************************************************************************
*									      *
DOCUPTR	DS	2			; POINT TO DOCUMENT HEADER AREA	      *
FORMPTR	DS	2			; POINT TO FORMAT HEADER AREA	      *
TEXTPTR	DS	2			; POINT TO EXPANDED TEXT ARRAY	      *
ATTRPTR	DS	2			; POINT TO ATTRIBUTE ARRAY	      *
SIZEPTR	DS	2			; POINT TO CHARACTER WIDTH ARRAY      *
FONTPTR	DS	2			; POINT TO FONT DEFINITION TABLE      *
	DS	2			; REESERVED POINTER		      *
	DS	2			; REESERVED POINTER		      *
	DS	2			; REESERVED POINTER		      *
	DS	2			; REESERVED POINTER		      *
INDX	DS	2			; CURRENT VALUE OF ARRAY OFFSET	      *
*									      *
CHAR	DS	1			; CURRENT PRINTABLE CHARACTER (INPUT) *
ATTR	DS	1			; ATTRIBUTES FOR THIS CHARACTER	      *
WDTH	DS	1			; CHARACTER WIDTH (HMI & HAMMER INTS) *
OPCHAR	DS	1			; CURRENT PRINTABLE CHARACTER (OUTPT) *
OPWDTH	DS	1			; HMI SETTING FOR OUTPUT CHARACTER    *
BKMASK	DS	1			; REPRINT REQ'D MASK BITS	      *
BKCHAR	DS	1			; CHARACTER TO OVERPRINT AFTER BKSP   *
UNDR	DS	1  			; UNDERSCORE CHAR FOR THIS POSITION   *
OVER	DS	1			; OVERSTRIKE CHAR FOR THIS POSITION   *
TYPE	DS	1			; LINE TYPE (SUPER,BASE,SUB)	      *
*									      *
*									      *
*		END OF COMMUNICATIONS AREA				      *
*									      *
*******************************************************************************


;	CODE SEQUENCES AND CUSTOM ROUTINES SHOULD FOLLOW HERE



sqpage	db	0,1,12	;Standard formfeed code

sqnewl	db	0,1,10	;Standard linefeed code

sqeol	db	0,1,13	;Standard carriage return

eofs	db	0,1,26	;ctrl z at eof
VED POINTER		      *
 10BE           	DS	2			; REESERVED POINTER		   