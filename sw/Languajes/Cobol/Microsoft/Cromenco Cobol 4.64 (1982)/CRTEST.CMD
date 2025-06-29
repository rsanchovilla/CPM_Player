Rem	This Batch file will compile a program to test a COBOL CRT driver
Rem	First, the input COBOL source file is typed:
Type Crtest.cob
Rem	Next, the source file is compiled, producing a REL object file:
Cobol Crtest,TTY:=Crtest
Rem	This is linked with Coblbx.rel, producing an executable file:
Link Crtest,Coblbx/s,Crtest/N/E
Rem	Finally, the compiled and linked program is executed:
Crtest
