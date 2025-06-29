			MEMORY USAGE

Address Range	Description
(hexadecimal)

0000 - 00FF	Unused, available space for your stuff.
0100 - 04FF	Standard Input/Output Routines (Listing Included).
0500 - 0502	A jump instruction into TARBELL BASIC.
0503 - 0504	CHANL - Contains the address of the Channel Table.
0505 - 0506	TRMNL - Contains the address of the Terminal Table.
0507 - 0508	SSSS - Defines the end of useable memory.  If zero,
		causes BASIC to use all available memory.
0509 - 050A	CNVRA - Defines the number of digits that will be printed
		in normal (as opposed to scientific) notation.
050B - 050C	FPRAA+6 - Contains the address of a location which contains
		the address of a user routine accessed by the USR function.
050D - 050E	MODES - Contains the address of the MODES Table.
050F - 0510	FSRC - Address of pointer to start of source.
0511 - 0512	ESRC - Address of pointer to end of source.
0513 - 0514	ERROR - Pointer to error routine.
0515 - 0516	TSCN - Points to token just scanned.
0517 - 0518	NSCN - Points to token to be scanned next.
0519 - 051A	CHCK - Points to checksum routine.
051B - 051C	INFL - Integer to Floating, (HL) to (DE).
051D - 051E	FLIN - Floating to Integer, (HL) to (DE).
051F - 0520	STNM - String at (HL) to number at (DE).
0521 - 0522	NMST - Number at (HL) to string at (DE).
0523 - 0524	CMPR - Zero and carry set as for (HL)-(DE).
0525 - 0526	SINE - Sine(HL) to (DE).
0527 - 0528	SICO - Cosine(HL) to (DE).
0529 - 052A	TANG - tangent(HL) to (DE).
052B - 052C	ATAN - Arctangent(HL) to (DE).
052D - 052E	BCDB - Number at (HL) to binary in HL.
052F - 0530	BBCD - Binary number in HL to number at (DE).
0531 - 0532	ETOX - E to the (HL) power to (DE).
0533 - 0534	LOGX - Log base E (HL) to (DE).
0535 - 0536	SQUR - (HL) to 1/2 to (DE).
0537 - 0538	PWRS - (HL) to the (DE) power to (BC).
0539 - 053A	ADDER - (HL)+(DE) to (BC)
053B - 053C	SUBER - (HL)-(DE) to (BC)
053D - 053E	MULER - (HL)*(DE) to (BC)
053F - 0540	DIVER - (HL)/(DE) to (BC)
0541 - 53C5	The TARBELL BASIC interpreter, which may be in ROM.
		Note that these addresses may change with versions.
53C6 - XXXX	Interpreter Workspace, must be in RAM. (fixed length)
XXXX - XXXX	Program Source, in internal form. Fixed at RUN time.
XXXX - XXXX	Variables and Array Pointers.  Fixed at RUN time.
XXXX - XXXX	FOR/NEXT and local variable stack.  Dynamic.
XXXX - XXXX	Input Line Space.  Dynamic.
XXXX - XXXX	Array and String Space.  Dynamic.
XXXX - XXXX	Symbol Directory.  Fixed at RUN time.
XXXX - XXXX	Symbol Table.  Fixed at RUN time.
		End of Specified Memory.

Allocation Notes:
Before runtime, will consist only of moving the symbol directory
as the symbol table grows.  At runtime, variable and array pointers
fished out of symbol directory and space assigned.  As local variables
are encountered, they are assigned on the stack.  Arrays and strings
are assigned by sequential assignment-random release- clean up garbage
when full.

			    C







