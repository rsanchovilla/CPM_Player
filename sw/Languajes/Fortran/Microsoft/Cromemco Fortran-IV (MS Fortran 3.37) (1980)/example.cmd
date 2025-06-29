Rem	This Batch file will compile, link, and run a FORTRAN program
Rem	First, type the input FORTRAN source file:
Type Example.for
Rem	Next, compile the program, producing a REL object file:
Fortran Example,TTY:=Example
Rem	Then link the program and produce the executable file Example.COM:
Link Example,Forlib/S,Example/N/M/E
Rem	Finally, execute the compiled and linked program:
Example
