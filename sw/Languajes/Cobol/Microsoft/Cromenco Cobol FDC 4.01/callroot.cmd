Rem	This Batch file will compile and run a sample COBOL program
Rem	First, the input COBOL source files are typed:
Type Root.cob
Type Callroot.cob
Rem	Next, the source files are compiled, producing REL object files:
Cobol Root,TTY:=Root
Cobol Callroot,TTY:=Callroot
Rem	These are then linked, producing the executable file Callroot.com:
Link Callroot,Root,Coblib/S,Callroot/N/M/E
Rem	Finally, the compiled and linked program is executed:
Callroot
