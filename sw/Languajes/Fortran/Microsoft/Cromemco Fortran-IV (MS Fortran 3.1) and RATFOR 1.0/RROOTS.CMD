Rem	This Batch file will compile and run a sample Ratfor program
Rem	Insert the Fortran disk supplied with this package in drive B
Rem	First, the Ratfor source file is typed:
Type Rroots.rfr
Rem	Next, the Ratfor preprocessor is called to translate it into Fortran:
Ratfor Rroots,TTY:=Rooots
Rem	Then the Fortran compiler produces a REL object file:
B:Fortran Rroots,TTY:=Rooots/N
Rem	The program is linked, producing the executable file Roots.COM:
B:Link Rroots,B:Forlib/S,Rroots/N/M/E
Rem	Finally, the preprocessed, compiled, and linked program is executed:
Rroots
