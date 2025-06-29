	title	'PALANTIR Font Definition File -- 03/25/82'

*****************************************************************
*								*
*		Standard 10-pitch Font				*
*								*
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

	page
;	Control/Extended Range

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
	db	0,29
	db	0,30
	db	0,31

	page
;	Standard Ascii Character Set

	db	std,' ' 	;Blank
	db	std,'!' 	;Exclamation Point
	db	std,'"' 	;Double Quotes
	db	std,'#' 	;Pound (Number) Sign
	db	std,'$' 	;Dollar Sign
	db	std,'%' 	;Percent Sign
	db	std,'&'		;Ampersand
	db	std,''''	;Single Quote
	db	std,'(' 	;Left Parenthesis
	db	std,')' 	;Right Parenthesis
	db	std,'*' 	;Asterisk
	db	std,'+' 	;Plus Sign
	db	std,',' 	;Comma
	db	std,'-' 	;Hyphen (Minus Sign)
	db	std,'.' 	;Period
	db	std,'/' 	;Slash
	db	std,'0' 	;Digit Zero
	db	std,'1' 	;Digit One
	db	std,'2' 	;Digit Two
	db	std,'3' 	;Digit Three
	db	std,'4' 	;Digit Four
	db	std,'5' 	;Digit Five
	db	std,'6' 	;Digit Six
	db	std,'7' 	;Digit Seven
	db	std,'8' 	;Digit Eight
	db	std,'9' 	;Digit Nine
	db	std,':' 	;Colon
	db	std,';' 	;Semicolon
	db	std,'<' 	;Less Than
	db	std,'=' 	;Equal Sign
	db	std,'>' 	;Greater Than
	db	std,'?' 	;Question Mark
	db	std,'@' 	;At-Sign
	db	std,'A' 	;Capital A
	db	std,'B' 	;Capital B
	db	std,'C' 	;Capital C
	db	std,'D' 	;Capital D
	db	std,'E' 	;Capital E
	db	std,'F' 	;Capital F
	db	std,'G' 	;Capital G
	db	std,'H' 	;Capital H
	db	std,'I' 	;Capital I
	db	std,'J' 	;Capital J
	db	std,'K' 	;Capital K
	db	std,'L' 	;Capital L
	db	std,'M' 	;Capital M
	db	std,'N' 	;Capital N
	db	std,'O' 	;Capital O
	db	std,'P' 	;Capital P
	db	std,'Q' 	;Capital Q
	db	std,'R' 	;Capital R
	db	std,'S' 	;Capital S
	db	std,'T' 	;Capital T
	db	std,'U' 	;Capital U
	db	std,'V' 	;Capital V
	db	std,'W' 	;Capital W
	db	std,'X' 	;Capital X
	db	std,'Y' 	;Capital Y
	db	std,'Z' 	;Capital Z
	page
	db	std,'[' 	;Left Square Bracket (Open)
	db	std,'\' 	;Backslash
	db	std,']' 	;Right Square Bracket (Close)
	db	std,'^' 	;Carat
	db	std,'_' 	;Underscore
	db	std,60h 	;Accent
	db	std,'a' 	;Lowercase a
	db	std,'b' 	;Lowercase b
	db	std,'c' 	;Lowercase c
	db	std,'d' 	;Lowercase d
	db	std,'e' 	;Lowercase e
	db	std,'f' 	;Lowercase f
	db	std,'g' 	;Lowercase g
	db	std,'h' 	;Lowercase h
	db	std,'i' 	;Lowercase i
	db	std,'j' 	;Lowercase j
	db	std,'k' 	;Lowercase k
	db	std,'l' 	;Lowercase l
	db	std,'m' 	;Lowercase m
	db	std,'n' 	;Lowercase n
	db	std,'o' 	;Lowercase o
	db	std,'p' 	;Lowercase p
	db	std,'q' 	;Lowercase q
	db	std,'r' 	;Lowercase r
	db	std,'s' 	;Lowercase s
	db	std,'t' 	;Lowercase t
	db	std,'u' 	;Lowercase u
	db	std,'v' 	;Lowercase v
	db	std,'w' 	;Lowercase w
	db	std,'x' 	;Lowercase x
	db	std,'y' 	;Lowercase y
	db	std,'z' 	;Lowercase z
	db	std,'{' 	;Left Curly Brace (Open)
	db	std,'|' 	;Vertical Bar
	db	std,'}' 	;Right Curly Brace (Close)
	db	std,'~' 	;Tilde
	db	0,0		;Delete Code (Not Used)

	end
d,'|' 	;Vertical Bar
	db	std,'}' 	;Right Curly Brace (Close)
	db	std,'~' 	;Tilde
	db	0,0		;Delete 