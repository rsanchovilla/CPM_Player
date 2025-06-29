*** This Batch file will compile and run the COBOL program ACPTSMPL    ***
*** Run this example from drive A, with an unprotected disk in drive B ***
TYPE ACPTSMPL.COB
COBOL B:ACPTSMPL,TTY:=ACPTSMPL
LINK B:ACPTSMPL,B:ACPTSMPL/N/E
B:ACPTSMPL
