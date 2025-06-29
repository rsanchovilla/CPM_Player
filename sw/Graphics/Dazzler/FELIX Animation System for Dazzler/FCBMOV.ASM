	ORG	5520H
* THIS ROUTINE COPIES THE FCB POINTED TO BY HL TO THE ONE POINTED TO
* BY DE
FCBMOV:	PUSH	B ! PUSH D ! PUSH H
	MVI	B,33	;33 BYTES/FCB
FMLOOP:	MOV	A,M	;GET BYTE
	STAX	D	;COPY IT
	INX	H ! INX D
	DCR	B
	JNZ	FMLOOP	;JUMP IF MORE BYTES TO COPY
	POP	H ! POP D ! POP B
	RET
