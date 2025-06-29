Rem	This Batch file will compile a FORTRAN square roots program
Rem	First, type the input FORTRAN source file:
Type Roots.for
Rem	Next, compile the program, producing a REL object file:
Fortran Roots,TTY:=Roots
Rem	Then link the program and produce the executable file Roots.COM:
Link Roots,Forlib/S,Roots/N/M/E
Rem	Finally, execute the compiled and linked program:
Roots
