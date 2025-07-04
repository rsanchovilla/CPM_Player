OBJW	EQU	5009H
	ORG	52DAH
* THIS ROUTINE USES A ROUTINE CALLED "OBALLW" (SEE BELOW) TO MAKE
* ALL THE FELIX OBJECTS NULL.  IN OTHER WORDS, THE COLOR AND ORIENTATION
* ARE ZERO-ED OUT AND FF-80 IS STORED AS THE FIRST X-Y COORDINATE PAIR,
* THUS MARKING THE OBJECT HAS HAVING NO EXISTANCE.
OBJNULL: PUSH	D ! PUSH PSW
	MVI	E,4	;1ST X-COORD TO BE
	MVI	A,0FFH	;SPECIAL CODE MARKER
	CALL	OBALLW	;FOR ALL OBJECTS
	INR	E	;SPECIAL CODE TO BE
	MVI	A,80H	;END-OF-OBJECT
	CALL	OBALLW	;FOR ALL OBJECTS
	XRA	A	;COLOR => BLACK
	MOV	E,A
	CALL	OBALLW
	INR	E	;ZERO ORIENTAITON (NO SPIN)
	CALL	OBALLW	;FOR ALL OBJECTS
	POP	PSW	! POP D
	RET
* THIS ROUTINE PUTS THE DESIRED VALUE (A) INTO THE DESIRED BYTE (E)
* OF EACH OF THE 16 LEGAL OBJECTS (0-15)
OBALLW:	MVI	D,15	;OBJECTS 0-15
OWLOOP:	CALL	OBJW	;WRITE DESIRED BYTE
	DCR	D
	JNC	OWLOOP	;NEXT OBJECT
	RET
