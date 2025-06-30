   
   ORG 100h

WRITESTR EQU 9h 
BDOS     EQU 5h 

   MVI C,WRITESTR 
   LXI D,HELLO 
   CALL BDOS 
   CALL 0 

HELLO: 
   DB 'Hola', 13, 10 
   DB '$' ; EOL for BDOS func 9
    
   END 
   