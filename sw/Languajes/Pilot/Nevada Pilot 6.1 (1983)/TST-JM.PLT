CH:
T:TST-JM       Jump according to item in match list (JM:)
*START
T:
T:TYPE ONE, TWO, OR THREE
A:
M:ONE,TWO,THREE
JM:*ONE,*TWO,*THREE
TY:NO MATCH
J:*AGAIN

*ONE T:ONE
  J:*AGAIN
*TWO T:TWO
  J:*AGAIN
*THREE T:THREE

*AGAIN
T:AGAIN? (Y/N)
AS:
M:Y
JY:*START
LOAD:PLTST2

