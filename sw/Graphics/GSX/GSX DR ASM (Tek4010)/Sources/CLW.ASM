;
;	GSX-80 ASSEMBLER PROGRAM TO CLEAR WORKSTATION
;
;	TEKTRONIX TERMINALS HAVE A STORAGE TUBE THAT
;	KEEPS THE DISPLAY. THIS PROGRAM CAN BE USED
;	TO CLEAR THE WORKSTATION.
;
;	OCTOBER 2014, UDO MUNK
;
;	BUILD WITH:
;	    ASM CLW
;	    LOAD CLW
;	    GENGRAF CLW
;
WBOOT	EQU	0
BDOS	EQU	5
GSX	EQU	115			;GSX BDOS function

	ORG	0100H

	MVI	C,GSX			;BDOS function for GSX
	LXI	D,PBLOCK1		;pointer to parameter block
	CALL	BDOS			;open workstation

	MVI	C,GSX			;BDOS function for GSX
	LXI	D,PBLOCK2		;pointer to parameter block
	CALL	BDOS			;clear workstation

	MVI	C,GSX			;BDOS function GSX
	LXI	D,PBLOCK3		;pointer to parameter block
	CALL	BDOS			;close workstation

	JMP	WBOOT

;
;	parameter block 1: Open Workstation
;
PBLOCK1:DW	CNTRL1			;pointer to cntrl
	DW	INTIN1			;pointer to intin
	DW	PTSIN			;pointer to ptsin
	DW	INTOUT			;pointer to intout
	DW	PTSOUT			;pointer to ptsout

CNTRL1:	DW	1			;GDOS function 1, Open Workstation
	DW	0
	DW	0
	DW	10			;size of intin
	DW	0

INTIN1:	DW	1			;device number 1
	DW	1			;initial defaults
	DW	1
	DW	1
	DW	1
	DW	1
	DW	1
	DW	1
	DW	1
	DW	1

;
;	parameter block 2: Clear Workstation
;
PBLOCK2:DW	CNTRL2			;pointer to cntrl
	DW	INTIN2			;pointer to intin
	DW	PTSIN			;pointer to ptsin
	DW	INTOUT			;pointer to intout
	DW	PTSOUT			;pointer to ptsout

CNTRL2:	DW	3			;GDOS function 3, Clear Workstation
	DW	0
	DW	0
	DW	0
	DW	0

INTIN2:	DW	0

;
;	parameter block 3: Close Workstation
;
PBLOCK3:DW	CNTRL3			;pointer to cntrl
	DW	INTIN3			;pointer to intin
	DW	PTSIN			;pointer to ptsin
	DW	INTOUT			;pointer to intout
	DW	PTSOUT			;pointer to ptsout

CNTRL3:	DW	2			;GDOS function 2, Close Workstation
	DW	0
	DW	0
	DW	0
	DW	0

INTIN3:	DW	0

;
;	keep the large uninitialized arrays at the end of the program
;	makes the executable smaller
;
PTSIN:	DS	100
INTOUT:	DS	100
PTSOUT:	DS	100

	END
