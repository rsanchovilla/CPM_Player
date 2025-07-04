; 30 AUG - RELOCATED TO 2F50 TO CLEAR DISTPLUS. JMM.
	ORG	2F50H
;
; RESCALE - AN OP OF A DIFFERENT COLOR, ALMOST A KIND OF 
; OUTPAR, WHICH CALLED WITH 2 PARAMS (IN-DEV,RANGE)
; ADJUSTS (IF THE DEVICE ADMITS ADJUSTING) THE RANGE OF THE
; DEVICE'S VALUES. AT PRESENT ONLY THE ADC'S ALLOW IT.
;
; CALLS: INPAR
;
INPAR	EQU	5030H
RESCALE:CALL	INPAR	;WHICH DEVICE (0-F)?
	PUSH	D
	CALL	INPAR	;WHAT RANGE?
	MOV	A,E
	ANI	07H	;(0-7)
	LXI	H,RANGTABL
	POP	D
	DAD	D	;HL POINTS INTO RANGTABL.
	MOV	M,A
	RET		;STORE RANGE,RETURN.
;
	ORG	2F70H	;'INPARM' MUST BE TOLD WHEN THIS MOVES.

RANGTABL:DB	0,0,0,0,0,0,0,0	;DEFAULTS FOR DEVICES 0-7
	DB	1,1,1,1	;DEFAULTS FOR JS X,Y:+-64
	DB	2,2	;DEFAULTS FOR JS Z: +-32
	DB	0,0	;DEFAULTS FOR SWITCHES:0
