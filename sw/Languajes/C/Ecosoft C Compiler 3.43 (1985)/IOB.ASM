?IOB::	DEFW	0	;STDIN
	DEFW	0
	DEFW	0
	DEFW	5
	DEFW	0

	DEFW	0	;STDOUT
	DEFW	0
	DEFW	0
	DEFW	6
	DEFW	1

	DEFW	0	;STDERR
	DEFW	0
	DEFW	0
	DEFW	6
	DEFW	2

	DEFW	0	;STDLST
	DEFW	0
	DEFW	0
	DEFW	6
	DEFW	3

	REPT	5*NFCB
	DEFW	0
	ENDM

