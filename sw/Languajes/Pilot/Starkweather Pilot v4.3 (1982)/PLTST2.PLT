CH:
T:PLTST2       TESTS OF ADVANCED PILOT FEATURES:
T:
T:     C       Concatenation of strings in the C-statement
T:     I       Indirect string reference and forced accept (A:=)
T:     S       Substrings produced by successful matches
T:     A       Ambiguous (wild) strings * and ?
T:     M       Match jump statement (MJ:)
T:     J       Jump according to item in match list (JM:)
T:     V       VNEW:\$ and VNEW:\#
T:     E       EXIT TO COMMAND MODE
T:
T:             Select test with a single letter

*SELECT
CA:12,6
AS:                  (Accepts a single character without RETURN)
   M:C,I,S,A,M,J,V,E
   JM:*CONCAT,*INDIRECT,*SUBSTR,*AMBIG,*MJUMP,*JMATCH,*VNEW,*EX
   J:*SELECT

*CONCAT
LOAD:TST-C

*INDIRECT
LOAD:TST-I

*SUBSTR
LOAD:TST-S

*AMBIG
LOAD:TST-WILD

*MJUMP
LOAD:TST-MJ

*JMATCH
LOAD:TST-JM

*VNEW
LOAD:TST-VN

*EX E:








                                                                                                                       