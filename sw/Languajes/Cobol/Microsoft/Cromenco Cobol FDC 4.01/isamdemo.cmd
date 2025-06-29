Rem	This Batch file will compile and run a sample COBOL program using ISAM
Rem	First, the input COBOL source file is typed:
Type Isamdemo.cob
Rem	Next, the source file is compiled, producing a REL object file:
Cobol Isamdemo,TTY:=Isamdemo
Rem	This is linked with Coblib.rel, producing an executable file:
Link Isamdemo,Isamdemo/N/E
Rem	Finally, the compiled and linked program is executed:
Isamdemo
