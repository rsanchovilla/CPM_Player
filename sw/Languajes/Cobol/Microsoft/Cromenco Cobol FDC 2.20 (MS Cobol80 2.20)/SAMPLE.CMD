*** This Batch file will compile and run a COBOL program with subprogram ***
TYPE B:ROOT.COB
COBOL ROOT,TTY:=B:ROOT
TYPE B:CALLROOT.COB
COBOL CALLROOT,TTY:=B:CALLROOT
LINK CALLROOT,ROOT,B:COBLIB/S,B:CALLROOT/N/M/E
B:CALLROOT
