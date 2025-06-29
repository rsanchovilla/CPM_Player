Rem	This Batch file will compile and run a sample Ratfor program
Rem	Insert the Fortran disk supplied with this package in drive B
Rem	First, the Ratfor source file is typed:
Type Echo.rfr
Rem	Next, the Ratfor preprocessor is called to translate it into Fortran:
Ratfor Echo,TTY:=Echo
Rem	Then the Fortran compiler produces a REL object file:
B:Fortran Echo,TTY:=Echo/N
Rem	The program is linked, producing the executable file Echo.COM:
B:Link Echo,B:Forlib/S,Echo/N/M/E
Rem	Finally, the preprocessed, compiled, and linked program is executed:
Echo
