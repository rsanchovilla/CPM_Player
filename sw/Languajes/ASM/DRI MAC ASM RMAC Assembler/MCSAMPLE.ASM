	ORG	100H	;TRANSIENT PROGRAM AREA
BDOS	EQU	0005H	;BDOS ENTRY POINT
WCHAR	EQU	2	;WRITE CHARACTER FUNCTION
;	ENTER WITH CCP'S RETURN ADDRESS IN THE STACK
;	WRITE A SINGLE CHARACTER (?) AND RETURN
	MVI	C,WCHAR	;WRITE CHARACTER FUNCTION
	MVI	E,'?'	;CHARACTER TO WRITE
	CALL	BDOS	;WRITE THE CHARACTER
	RET		;RETURN TO THE CCP
	END	100H	;START ADDRESS IS 100H
