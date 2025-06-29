	extrn	.begin,.chl,.swt
	extrn	csave,cret,.move
	PUBLIC main_
main_:	lxi d,.2
	call csave
	LXI H,.1+0
	PUSH H
	CALL printf_
	POP D
	RET
.2 EQU 0
.1:
	DB 72,111,108,97,10,0
	extrn	printf_
	END
