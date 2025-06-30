100 PRINT CHR$(26)
150 PRINT "----------------------------------------------------"
200 PRINT "|                                                  |"
300 PRINT "|   --------------------------------------------   |"
400 PRINT "|   |                                          |   |"
500 PRINT "|   |                                          |   |"
600 PRINT "|   |                                          |   |"
800 PRINT "|   |                                          |   |"
900 PRINT "|   |                                          |   |"
1000 PRINT "|   |                                          |   |"
1100 PRINT "|   |                                          |   |"
1200 PRINT "|   |           A N D Y  5 0 0  ! ! !          |   |"
1300 PRINT "|   |                                          |   |"
1400 PRINT "|   |                                          |   |"
1500 PRINT "|   |                                          |   |"
1600 PRINT "|   |                                          |   |"
1700 PRINT "|   |                                          |   |"
1800 PRINT "|   |                                          |   |"
1900 PRINT "|   |                                          |   |"
2000 PRINT "|   |                                          |   |"
2100 PRINT "|   |                                          |   |"
2200 PRINT "|   --------------------------------------------   |"
2300 PRINT "|                                                  |"
2400 PRINT "----------------------------------------------------"
2500 FOR I=1 TO 2000:NEXT I
2550 PRINT CHR$(26)
2600 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT
2700 PRINT TAB(17);"CREATED BY:"
2800 PRINT TAB(17);"           "
2900 PRINT TAB(17);"         A N D Y"
3000 PRINT TAB(17);"                "
3100 PRINT TAB(17);"             W O O L L E Y"
3200 FOR I=1 TO 1500:NEXT I
3250 PRINT CHR$(26)
3950 PRINT CHR$(26)
4000 PRINT "WOULD YOU LIKE INSTRUCTIONS ?"
4050 INPUT A$ 
4100 IF A$="YES" THEN 4300 
4200 IF A$="NO" THEN 4900
4250 PRINT CHR$(26)
4300 PRINT "THE OBJECT OF ANDY 500 IS TO COMPLETE YOUR TRIP"
4400 PRINT "FROM LOS ANGELES, TO SAN FRANCISCO IN THE LEAST"
4500 PRINT "POSSIBLE TIME. TO START YOUR ENGINE, PUSH THE"
4600 PRINT "LETTER 'G'. TO TURN LEFT, PUSH THE LEFT ARROW."
4650 PRINT "TO TURN RIGHT, PUSH THE RIGHT ARROW."
4660 PRINT "TO BRAKE, PUSH THE UP ARROW. TO ACCELERATE, "
4670 PRINT "PUSH THE UP ARROW."
4850 FOR I=1 TO 9000:NEXT I
4900 PRINT CHR$(26)
5000 RANDOMIZE
5010 DEFINT A-Z
5100 DIM TRACK(24):TRACK$="*"
5200 SLOW=10:ROW=1:CAR=26:CAR$="V"      
5300 STALL=100:OFF.TRACK=0
5400 CLR$=CHR$(26)  
5500 LEFT=21:WIDE=7:EDGE=52:BOTTOM=23
5600 RIGHT=LEFT+WIDE
5700 TOP$=CHR$(27)+"="+CHR$(32)
5800 BOTTOM$=CHR$(27)+"="+CHR$(31+BOTTOM)+CHR$(32)
5900 ALEFT$=CHR$(8):ARIGHT$=CHR$(12):SLOW$=CHR$(11):FAST$=CHR$(10)
6000 PRINT CLR$;TAB(LEFT);TRACK$;
6100 PRINT TAB(CAR);CAR$;TAB(RIGHT);TRACK$
6200 RANDOM!=RND:CURVE=0
6300 IF RANDOM!<.33 THEN CURVE=-1
6400 IF RANDOM!>.67 THEN CURVE=+1
6500 LEFT=LEFT+CURVE
6600 IF LEFT<1 THEN LEFT=1
6700 RIGHT=LEFT+WIDE
6800 IF RIGHT>EDGE THEN LEFT=EDGE-WIDE:RIGHT=EDGE
6890 ROW=ROW+1
6900 IF ROW>BOTTOM THEN 7300
7000 TRACK(ROW)=LEFT
7100 PRINT TAB(LEFT);TRACK$;TAB(RIGHT);TRACK$
7150 CAR=26:GOTO 7900
7300 FOR I=2 TO BOTTOM:TRACK(I-1)=TRACK(I):NEXT I
7400 TRACK(BOTTOM)=LEFT
7500 PRINT TAB(LEFT);TRACK$;TAB(RIGHT);TRACK$
7600 PRINT TOP$;CHR$(31+CAR);CAR$;BOTTOM$
7700 IF CAR>TRACK(1) AND CAR<TRACK(1)+WIDE THEN 7900
7800 PRINT CHR$(7);:OFF.TRACK=OFF.TRACK+1
7900 STEER=0
8000 FOR I=1 TO SLOW
8100 ACTION$=INKEY$
8200 IF ACTION$=SLOW$ THEN SLOW=SLOW+1
8300 IF ACTION$=FAST$ THEN SLOW=SLOW-1
8400 IF ACTION$=ARIGHT$ THEN STEER=+1
8500 IF ACTION$=ALEFT$ THEN STEER=-1
8600 NEXT I
8610 IF ROW>200 THEN PRINT CLR$;"THE RACE IS OVER.":GOTO 9200
8700 CAR=CAR+STEER
8800 IF SLOW<1 THEN SLOW=1
8900 IF SLOW<STALL THEN 6200
9000 PRINT CLR$
9100 PRINT "YOUR CAR HAS STALLED!"
9200 PRINT "YOU LEFT THE TRACK";OFF.TRACK;"TIMES!"
9300 INPUT "DO YOU WANT TO TRY AGAIN(Y/N)";ANSWER$
9400 IF ANSWER$="Y" OR ANSWER$="y" THEN 5200
9450 IF ANSWER$="N" OR ANSWER$="n" THEN 9455
9455 PRINT "C        H        I        C        K        E        N"
9500 END
