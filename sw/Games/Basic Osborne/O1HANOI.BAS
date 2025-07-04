1000 REM tower of hanoi puzzle
1010 REM copyright 1981  Michael M Rubenstein
1020 REM
1030 DEFINT A-Z
1040 WIDTH 255
1050 REM
1060 REM elements in the problem array are
1070 REM interpreted as asking for the solution of
1080 REM move prob(i,0) disks from peg prob(i,1)
1090 REM to peg prob(i,2) using peg(i,3)
1100 DIM PROB(64,3),PEGS(3,7), PEGCOL(3)
1110 REM
1120 GOSUB 2120: GOSUB 2150: REM print title
1130 GOSUB 2210: REM ask how many disks
1140 IF DISKS=0 THEN WIDTH 72: END
1150 GOSUB 2150
1160 REM
1170 REM set up pins
1180 GOSUB 2090
1190 ROW=13: COL=0: GOSUB 2020
1200 FOR I=1 TO 51: PRINT CHR$(&H16);: NEXT I
1210 PEGCOL(1)=8: PEGCOL(2)=24: PEGCOL(3)=40
1220 PEGS(1,0)=DISKS: PEGS(2,0)=0: PEGS(3,0)=0
1230 FOR ROW=13-DISKS TO 12
1240   FOR J=1 TO 3
1250     COL=PEGCOL(J): GOSUB 2020: PRINT CHR$(&HB);
1260   NEXT J
1270 NEXT ROW
1280 DCHAR$=CHR$(&H17): DCOL=PEGCOL(1)
1290 FOR I=1 TO DISKS
1300   DROW=13-I
1310   DSIZE=DISKS+1-I
1320   PEGS(1,I)=DSIZE
1330   GOSUB 2310
1340 NEXT I
1350 GOSUB 2120
1360 REM
1370 REM set up problem
1380 PROBPT=0
1390 PROB(0,0)=DISKS: PROB(0,1)=1: PROB(0,2)=2: PROB(0,3)=3
1400 MOVES=0
1410 REM
1420 REM blank out how many question
1430 ROW=19: COL=0: GOSUB 2020
1440 PRINT "                    ";
1450 REM
1460 REM solve the puzzle
1470 GOSUB 2380
1480 IF PROBPT<0 THEN 1130
1490 IF PROB(PROBPT,0)=1 THEN 1680
1500 REM reduce to three easier problems
1510 I=PROBPT+2
1520 PROB(I,0)=PROB(PROBPT,0)-1
1530 PROB(I,1)=PROB(PROBPT,1)
1540 PROB(I,2)=PROB(PROBPT,3)
1550 PROB(I,3)=PROB(PROBPT,2)
1560 I=I-1
1570 PROB(I,0)=1
1580 PROB(I,1)=PROB(PROBPT,1)
1590 PROB(I,2)=PROB(PROBPT,2)
1600 PROB(I,3)=PROB(PROBPT,3)
1610 PROB(PROBPT,0)=PROB(PROBPT,0)-1
1620 PROB(PROBPT,1)=PROB(PROBPT,3)
1630 PROB(PROBPT,3)=PROB(I,1)
1640 PROBPT=PROBPT+2
1650 GOTO 1490
1660 REM
1670 REM easy case -- move one disk
1680 F=PROB(PROBPT,1): T=PROB(PROBPT,2)
1690 DCOL=PEGCOL(F): DSIZE=PEGS(F,PEGS(F,0))
1700 FOR I=13-PEGS(F,0) TO 13-DISKS STEP -1
1710   DROW=I-1: DCHAR$=CHR$(&H17): GOSUB 2310
1720   DROW=I: DCHAR$=" ": GOSUB 2310
1730 NEXT I
1740 IF F<T THEN INC=1: LEAD=1
1750 IF F>T THEN INC=-1: LEAD=0
1760 ROW=DROW-1: COL=PEGCOL(F): GOSUB 2060: DCH=&H17
1770 FOR I=1 TO ABS(PEGCOL(T)-PEGCOL(F))
1780   SPT=SPT+INC
1790   IF LEAD THEN POKE SPT-DSIZE-1,&H20
1800   FOR J=SPT-DSIZE TO SPT-1: POKE J,DCH: NEXT J
1810   POKE SPT,&H20
1820   FOR J=SPT+1 TO SPT+DSIZE: POKE J,DCH: NEXT J
1830   IF NOT LEAD THEN POKE SPT+DSIZE+1,&H20
1840 NEXT I
1850 DCOL=PEGCOL(T)
1860 FOR I=12-DISKS TO 13-PEGS(T,0)-2
1870   DROW=I+1: DCHAR$=CHR$(&H17): GOSUB 2310
1880   DROW=I: DCHAR$=" ": GOSUB 2310
1890 NEXT I
1900 PEGS(F,0)=PEGS(F,0)-1
1910 PEGS(T,0)=PEGS(T,0)+1
1920 PEGS(T,PEGS(T,0))=DSIZE
1930 MOVES=MOVES+1
1940 PROBPT=PROBPT-1
1950 GOTO 1470
1960 REM
1970 REM clear screen
1980 PRINT CHR$(&H1B);"S";CHR$(0);CHR$(32);CHR$(&H1A);
1990 RETURN
2000 REM
2010 REM set cursor position
2020 PRINT CHR$(&H1B);"=";CHR$(ROW+32);CHR$(COL+32);
2030 RETURN
2040 REM
2050 REM set cursor position for poke
2060 SPT=&HF000+128*ROW+COL: RETURN
2070 REM
2080 REM enter graphics mode
2090 PRINT CHR$(&H1B);"#";CHR$(&H1B);"g";: RETURN
2100 REM
2110 REM leave graphics mode
2120 PRINT CHR$(&H1B);"G";CHR$(&H1B);CHR$(&H22);: RETURN
2130 REM
2140 REM print title
2150 GOSUB 1980
2160 PRINT "Towers of Hanoi Puzzle"
2170 PRINT "Copyright 1981  Michael M Rubenstein
2180 RETURN
2190 REM
2200 REM ask how many disks (1-7)
2210 ROW=19: COL=0: GOSUB 2020
2220 PRINT "How many disks (q to quit)? ";
2230 C$=INKEY$: IF C$="" THEN 2230
2240 IF C$="q" OR C$="Q" THEN DISKS=0: RETURN
2250 IF C$<"1" OR C$>"7" THEN 2230
2260 PRINT C$;
2270 DISKS=VAL(C$)
2280 RETURN
2290 REM
2300 REM print disk
2310 ROW=DROW: COL=DCOL: GOSUB 2060
2320 DCH=ASC(DCHAR$)
2330 FOR IPDSK=SPT-DSIZE TO SPT-1: POKE IPDSK,DCH: NEXT IPDSK
2340 FOR IPDSK=SPT+1 TO SPT+DSIZE: POKE IPDSK,DCH: NEXT IPDSK
2350 RETURN
2360 REM
2370 REM print move counter
2380 ROW=17: COL=0: GOSUB 2020
2390 PRINT USING "& ###";"Moves:";MOVES;
2400 RETURN
