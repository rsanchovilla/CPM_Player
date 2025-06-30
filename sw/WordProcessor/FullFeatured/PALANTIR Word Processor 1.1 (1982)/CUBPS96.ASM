;	title	'PALANTIR Font Definition File -- 03/25/82'

*****************************************************************
*								*
*		Font for Diablo 630 proportional space	*
*		For Diablo 96 character metal print wheel.*     
*	The definition table must be assembled to produce	*
*	a HEX file, which should then be LOADed or SAVEd	*
*	(e.g., SAVE 1 name.WPF) from DDT to create the		*
*	font definition file expected by the PALANTIR.		*
*								*
*	The table consists of 128 2-byte entries for the	*
*	character set from Ascii 0-127.  The first byte of	*
*	each entry is the character size in increments.  The	*
*	second byte is the code to be sent to the printer,	*
*	which for some print wheels is different from the	*
*	original Ascii character.  If the high-order bit of	*
*	the second byte is on, the DFSHFT (Shift) logic in	*
*	the print driver is invoked at printout.		*
*								*
*	For mono-spaced wheels, the first byte will be the	*
*	same throughout.  For wheels that use the normal	*
*	character arrangement, the second byte of each entry	*
*	will contain the next higher binary value.  The first	*
*	32 entries of the table are not normally used, unless	*
*	by the Extended Character Set option for printers	*
*	with more than 96 characters per wheel. 		*
*								*
*****************************************************************

	org	100h

std	 equ	 12	 ;Character size for 10-pitch (at 120 increments)
S8	EQU	8
S6	EQU	6
S10	EQU	10
S12	EQU	12
S14	EQU	14
S16	EQU	16
;
;	page
;	Control/Extended Range
; The postions in the table normally used by control characters is
; used for printing characters which need different print hammer
; energy then standard. First byte gives spoke position, except for
; spokes 0 and 95 for which esc Y and esc X are used (sign bit indicates
; prefix with escape). Second byte gives ribbon advance 0-16 and hammerforce
; 16,32,48,64 for 1-4. Ribbon advance set to half width of character.
; Entry in main table is pointer to secondary table with sign bit set 
; to flag use of secondary table.
;
; This table for Diablo wheel CUBIC PS 96 P/N 311901-01
; This wheel has the complete ASCII set of characters
; The cents sign and accent sign at hex 20, 7f not implemented

	db	0,0
	db	0,1
	db	0,2
	db	0,3
	db	0,4
	db	0,5
	db	0,6
	db	0,7
	db	0,8
	db	0,9
	db	0,10
	db	0,11
	db	0,12
	db	0,13
	db	0,14
	db	0,15
	db	0,16
	db	0,17
	db	0,18
	db	0,19
	db	0,20
	db	0,21
	db	0,22
	db	0,23
	db	0,24
	db	0,25
	db	0,26
	db	0,27
	db	0,28
	db	S12,' '  ;soft spaces
	db	S8,'-'   ; soft hyphen
	db	S12,' '

;	page
;	Standard Ascii Character Set

	db	S12,' ' 	;Blank
	db	S6,'!'	;Exclamation Point
	db	S8,'"' 	;Double Quotes
	db	S12,'#' 	;Pound (Number) Sign
	db	S10,'$' 	;Dollar Sign
	db	S16,'%' 	;Percent Sign
	db	S14,'&'		;Ampersand
	db	4,''''	;Single Quote
	db	S6,'(' 	;Left Parenthesis
	db	S6,')' 	;Right Parenthesis
	db	S10,'*' 	;Asterisk
	db	S10,'+' 	;Plus Sign
	db	S6,',' 	;Comma
	db	S8,'-' 	;Hyphen (Minus Sign)
	db	S6,'.' 	;Period
	db	S8,'/' 	;Slash
	db	S10,'0' 	;Digit Zero
	db	S10,'1' 	;Digit One
	db	S10,'2' 	;Digit Two
	db	S10,'3' 	;Digit Three
	db	S10,'4' 	;Digit Four
	db	S10,'5' 	;Digit Five
	db	S10,'6' 	;Digit Six
	db	S10,'7' 	;Digit Seven
	db	S10,'8'		;Digit Eight
	db	S10,'9' 	;Digit Nine
	db	S6,':' 	;Colon
	db	S6,';' 	;Semicolon
	db	S10,'<' 	;Less Than 
	db	S10,'=' 	;Equal Sign
	db	S10,'>'		;Greater Than
	db	S10,'?' 	;Question Mark
	db	S16,'@'  	;At-Sign 
	db	S14,'A' 	;Capital A
	db	S12,'B' 	;Capital B
	db	S14,'C' 	;Capital C
	db	S14,'D' 	;Capital D
	db	S12,'E' 	;Capital E
	db	S12,'F' 	;Capital F
	db	S14,'G' 	;Capital G
	db	S14,'H' 	;Capital H
	db	S6,'I' 	;Capital I
	db	S10,'J' 	;Capital J
	db	S14,'K' 	;Capital K
	db	S12,'L' 	;Capital L
	db	S16,'M' 	;Capital M
	db	S14,'N' 	;Capital N
	db	S14,'O' 	;Capital O
	db	S12,'P' 	;Capital P
	db	S14,'Q' 	;Capital Q
	db	S14,'R' 	;Capital R
	db	S10,'S' 	;Capital S
	db	S12,'T' 	;Capital T
	db	S14,'U' 	;Capital U
	db	S12,'V' 	;Capital V
	db	S16,'W' 	;Capital W
	db	S14,'X' 	;Capital X
	db	S14,'Y' 	;Capital Y
	db	S12,'Z' 	;Capital Z
;	page
	db	S6,'[' 		;Left Square Bracket (Open) 
	db	S10,'\'		;Backslash  
	db	S6,']'		;Right Square Bracket 
	db	S10,'^'		;Carat  
	db	S10,'_' 	;Underscore
	db	S10,060h 	;Accent 
	db	S10,'a' 	;Lowercase a
	db	S10,'b' 	;Lowercase b
	db	S10,'c' 	;Lowercase c
	db	S10,'d' 	;Lowercase d
	db	S10,'e' 	;Lowercase e
	db	S8,'f' 	;Lowercase f
	db	S10,'g' 	;Lowercase g
	db	S10,'h' 	;Lowercase h
	db	S6,'i' 	;Lowercase i
	db	S6,'j' 	;Lowercase j
	db	S10,'k' 	;Lowercase k
	db	S6,'l' 	;Lowercase l
	db	S16,'m' 	;Lowercase m
	db	S10,'n' 	;Lowercase n
	db	S10,'o' 	;Lowercase o
	db	S10,'p' 	;Lowercase p
	db	S10,'q' 	;Lowercase q
	db	S8,'r' 	;Lowercase r
	db	S8,'s' 	;Lowercase s
	db	S8,'t' 	;Lowercase t
	db	S10,'u' 	;Lowercase u
	db	S10,'v' 	;Lowercase v
	db	S14,'w' 	;Lowercase w
	db	S10,'x' 	;Lowercase x
	db	S10,'y' 	;Lowercase y
	db	S10,'z' 	;Lowercase z
	db	S6,'{'		;Left Curly Brace (Open)   
	db	S6,'|'		;Vertical Bar  
	db	S6,'}'		;Right Curly Brace (Close)  
	db	S10,'~'		;Tilde 
	db	0,0		;Delete Code (Not Used)

	end


