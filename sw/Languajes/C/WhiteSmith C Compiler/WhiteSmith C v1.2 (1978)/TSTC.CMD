pp -x -o echo.tm1 echo.c
p1 -o echo.tm2 echo.tm1
era echo.tm1
p2 -o echo.8 echo.tm2
era echo.tm2
