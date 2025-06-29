CH:
T:TST-VN       VNEW:\$ and VNEW:\#
T:
T:Operation:           PILOT Code:           Expected:
T:                     C:N=2
T:                     C:\$NAME=THIS
T:                     T:\#N, \$NAME           2, THIS
C:N=2
C:$NAME=THIS
T:#N, $NAME

T:                     VNEW:\$
T:                     T:\#N, \$NAME           2, \$NAME
VNEW:$
T:#N, $NAME

T:                     C:\$NAME=THIS
T:                     VNEW:\#
T:                     T:\#N, \$NAME           0, THIS
C:$NAME=THIS
VNEW:#
T:#N, $NAME
FOOT:
LOAD:PLTST2
