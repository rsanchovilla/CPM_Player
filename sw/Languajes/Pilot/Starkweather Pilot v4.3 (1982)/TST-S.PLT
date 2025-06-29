CH:
T:TST-S        Substrings produced by successful matches
*START
T:
T:TYPE SOMETHING WITH "THIS" IN THE MIDDLE
A:
M:THIS
TN:NO MATCH
Y:$LEFT
Y:$MATCH
Y:$RIGHT
T:
T:AGAIN? (Y/N)
AS:
M:Y
JY:*START
LOAD:PLTST2
