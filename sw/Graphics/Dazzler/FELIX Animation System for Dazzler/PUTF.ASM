HSIZE	EQU	64
VSIZE	EQU	64
LONYB	EQU	0FH
HINYB	EQU	0F0H
* THIS ROUTINE TAKES A GIVEN COLOR (IN REG D) AND PUTS IT IN
* A PIXEL LOCATED AT CO-ORDINATES (B,C) ON THE SCREEN IN 64 BY 64
* DAZZLER MODE.  IF THE CO-ORDINATE PAIR LOCATES OUT OF THE SCREEN
* AREA, WE RETURN WITH THE CARRY SET TO INDICATE AN ERROR.
* IT IS ASSUMED THAT THE HIGH-ORDER NYBBLE OF D IS CLEAR.
	ORG	050A0H
ONBUF	EQU	5090H	;POINTER TO CURRENT WORKING BUFFER (OFF)
PUTF:	MOV	A,B	;GET X CO-ORDINATE
	CPI	HSIZE	;IS IT TOO LARGE?
	CMC
	RC	;YES--RETURN WITH ERROR
	MOV	A,C	;GET Y CO-ORDINATE
	CPI	VSIZE	;IS IT TOO LARGE?
	CMC
	RC	;YES--RETURN WITH ERROR
	PUSH	H
	PUSH	D
	LHLD	ONBUF	;GET START @ OF BUFFER INTO HL
* SET UP Y CO-ORDINATE PART OF ADDRESS (FROM REG C)
* REMEMBER--Y CO-ORDINATE IS ALREADY IN A
	CMA		;CHANGE FROM SCREEN TO DAZZLER CO-ORDS
	RAL		;SET THE CARRY IF WE WILL BE
	RAL		;IN ONE OF THE LOWER TWO DAZZLER 
	RAL		;QUADRANTS
	JNC	$+3+4	;UPPER HEMISPHERE REQUIRES NO @ ADJUSTMENT
	INR	H	;HOWEVER, THE LOWER HEMISPHERE REQUIRES
	INR	H	;BIT 3 OF H SET
	INR	H
	INR	H
	RAL		;SET BIT 0 OF H IF THE FIFTH (I.E. BIT 4) BIT
	JNC	$+3+1	;OF Y IS SET
	INR	H
	ANI	HINYB	;THE TOP NYB OF A IS NOW PROPERLY SET AS
	MOV	L,A	;THE TOP NYB OF THE LO-BYTE OF THE ADDRESS
* SET UP X CO-ORDINATE PART OF ADDRESS (FROM REG B)
	MOV	A,B	;GET X CO-ORDINATE
	RAL		;ARE WE IN THE RIGHT OR LEFT QUADRANT OF
	RAL		;OUR GIVEN HEMISPHERE.  SET THE CARRY TO
	RAL		;FIND OUT
	JNC	$+3+2	;JUMP IF LEFT QUAD
	INR	H	;ELSE ADJUST REG H
	INR	H
	RRC		;MOVE ZEROS TO HI-NYBBLE OF A AND SET
	RRC		;CARRY ACCORDING TO WHETHER THE
	RRC		;COLOR IS TO BE STORED IN THE HI OR LO-
	RAR		;ORDER NYBBLE
* PUT THE COLOR IN D IN MEMORY.  REMEMBER, A STILL HOLDS THE
* LO-NYBBLE OF THE ADDRESS
	JNC	LOSEC	;IF CY IS NOT SET, PUT IN LO-NYB
	ORA	L	;PUT LO-NYB OF @ INTO L
	MOV	L,A
	MOV	A,D	;GET COLOR INTO HI-NYBBLE OF D
	RRC
	RRC
	RRC
	RRC
	MOV	D,A
	MOV	A,M	;GET MEMORY BYTE
	ANI	LONYB	;(JUST LO-NYBBLE)
	JMP	JOINM	;& PUT COLOR IN PLACE
LOSEC:	ORA	L	;PUT LO-NYB OF @ INTO L
	MOV	L,A
	MOV	A,M	;GET MEMORY BYTE
	ANI	HINYB	;(JUST HI-NYBBLE)
JOINM:	ORA	D	;FORM NEW MEMORY BYTE
	MOV	M,A	;AND STORE IT IN CURRENT BUFFER
	POP	D
	POP	H
	RET
