	.z80
	aseg
	org	0100h

WRITESTR EQU 9h 
BDOS     EQU 5h 

   LD C,WRITESTR 
   LD DE,HELLO 
   CALL BDOS 
   CALL 0 

HELLO: 
   DB "Hola", 13, 10 
   DB "$" ; EOL for BDOS func 9
    
   END 

