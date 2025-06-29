;* * *  Small-C/Plus  Version 1.00  * * *
;       Cain, Van Zandt, Hendrix, Yorston
;       25th February 1988
;
	LD HL,(6)
	LD SP,HL
	CALL ccgo
	CALL qmain
	CALL qexit

; --- End of Compilation ---
