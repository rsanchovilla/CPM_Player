CH:
T:TST-MJ       Match jump statement (MJ:)
*START
T:
T:TYPE "ONE", "TWO", "THREE", OR "FOUR"
A:
MJ:ONE
T:ONE
J:*OUT
MJ:TWO
T:TWO
J:*OUT
MJ:THREE
T:THREE
J:*OUT
M:FOUR
T:FOUR

*OUT T:AGAIN? (Y/N) \
AS:
M:Y
JY:*START
LOAD:PLTST2
