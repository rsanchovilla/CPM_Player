*** This Batch file will compile and run a COBOL program with subprogram ***
*** Run this example from drive A, with an unprotected disk in drive B   ***
TYPE ROOT.COB
COBOL B:ROOT,TTY:=ROOT
TYPE CALLROOT.COB
COBOL B:CALLROOT,TTY:=CALLROOT
LINK B:CALLROOT,B:ROOT,COBLIB/S,B:CALLROOT/N/M/E
B:CALLROOT
