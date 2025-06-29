Rem	This Batch file will compile a program to test a COBOL CRT driver
%	First, the input COBOL source file is typed:
Type Crtest.cob
%	Next, the source file is compiled, producing a REL object file:
Cobol Crtest,TTY:=Crtest
%	This is linked with Coblib.rel, producing an executable file:
Link Crtest,Crtest/N/E
%	Finally, the compiled and linked program is executed:
Crtest
