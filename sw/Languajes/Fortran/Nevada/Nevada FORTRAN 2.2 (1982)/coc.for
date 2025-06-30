100   read(0,1000) i
1000    FORMAT(I3)
       if (i.EQ. 9) GOTO 200
       write (1,2000) i
2000    FORMAT(A1)
       goto 100
200    continue
       STOP
       END
