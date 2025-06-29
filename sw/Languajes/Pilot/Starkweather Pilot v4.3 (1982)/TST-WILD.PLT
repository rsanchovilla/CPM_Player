CH:
T:TST-WILD     Ambiguous (wild) strings * and ?
T:
T:LOOK FOR A<anything>BC
A:
M:A*BC
U:*ANS

T:LOOK FOR A*BC
A:
M:A\*BC
U:*ANS

T:LOOK FOR *
A:
M:\*
U:*ANS

T:LOOK FOR A<any-one>BC
A:
M:A?BC
U:*ANS

T:LOOK FOR A?BC
A:
M:A\?BC
U:*ANS

T:LOOK FOR ?
A:
M:\?
U:*ANS

T:LOOK FOR A\BC
A:
M:A\BC
U:*ANS

LOAD:PLTST2

*ANS
 Y:MATCH
 N:NO MATCH
 A:
 E:
