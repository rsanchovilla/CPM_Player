Rem	First, assemble the two source files, producing REL object code files:
Asmb Lexamp.@@x
Asmb Lexampv.@@x
Rem	Next, link the files twice, once at 100H and once at 200H absolute:
Link /P:100,Lexampv,Lexamp,Lexamp1/N/E
Link /P:200,Lexampv,Lexamp,Lexamp2/N/E
Rem	Now, use BITMAP & the temporary files to create a relocatable COM file:
Bitmap Lexamp1 Lexamp2 Lexamp
Rem	Erase the temporary files when they are no longer needed:
Era Lexamp1.com
Era Lexamp2.com
Rem	Execute the LISP example program created:
Lexamp
