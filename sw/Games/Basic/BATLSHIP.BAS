10 ' BATTLESHIP PROGRAM -- SUBMITTED BY CARL WARNER
20 ' SOURCE UNKNOWN -- ORIGINALLY IN H89 FORMAT
30 ' SET UP FOR AN 80 COLUMN OSBORNE 1 SCREEN
40 ' CONVERTED FROM H89 FORMAT TO O1 FORMAT ON 3/24/84
50 CLEAR 2500
60 ES$=CHR$(27):CL$=CHR$(26):GR$=ES$+"g"
70 RG$=ES$+"G":RV$=ES$+")":VR$=ES$+"("
80 VT$=CHR$(11):RT$=CHR$(9):BL$="   ":BE$=CHR$(7)
90 ML$=BL$+VT$+BL$+VT$+BL$+VT$+BL$+VT$+BL$+VT$
100 ML$=ML$+BL$+VT$+BL$+VT$+BL$+VT$+BL$+VT$+BL$+VT$+BL$+VT$
110 NO$="1"+BL$+"2"+BL$+"3"+BL$+"4"+BL$+"5"
120 NO$=NO$+BL$+"6"+BL$+"7"+BL$+"8"+BL$+"9"+BL$+"10"
130 PRINT CL$:FOR I=1 TO 5:PRINT:NEXT:PRINT TAB(34);RV$;"BATTLESHIP";VR$
140 PRINT:PRINT:PRINT TAB(25);"PLEASE SELECT OPTION 1,2 OR 3!"
150 PRINT:PRINT:PRINT TAB(30);"GAME DIRECTIONS  -  1"
160 PRINT:PRINT TAB(30);      "START GAME       -  2"
170 PRINT:PRINT TAB(30);      "END GAME         -  3"
180 T$=INKEY$
190 IF T$="" THEN SEED=SEED+1:GOTO 180
200 U=VAL(T$)
210 IF U<1 OR U>3 THEN PRINT BE$:GOTO 10
220 ON U GOTO 240,450,1750
230 IF T<=0 OR T>=4 THEN PRINT BE$:GOTO 200
240 PRINT CL$;TAB(28);RV$;"BATTLESHIP";VR$:PRINT
250 PRINT"This is a guessing game to locate the hidden ships.  A map will be
260 PRINT"drawn on the screen with numbers over each column and down each row.
270 PRINT"The description of each ship and its symbol will be displayed to
280 PRINT"the right of the map for your information.  The game will start by
290 PRINT"randomly selecting the hidden locations for the ships.  During this
300 PRINT"time, a message will be displayed asking you to wait while the ships
310 PRINT"maneuver. To the left of the screen, you will be asked your selection
320 PRINT"for the columns with the prompt - OVER?. Please answer with a number
330 PRINT"between 1 and 10 and hit the <RETURN> key.  Next you will be asked
340 PRINT"your selection for the rows with the prompt - DOWN?. Please answer 
350 PRINT"with a number between 1 and 10. If you locate a ship one of the
360 PRINT"symbols for the ships will appear at the guessed location and a beep
370 PRINT"will sound. If you miss, an '*' will appear in the location.  If you
380 PRINT"pick a location that was previously chosen, you will see a message
390 PRINT"to TRY AGAIN along with 2 beeps. The shots, hits and misses will be
400 PRINT"displayed for you. There are a possible 100 shots.  You will be rated
410 PRINT"by your score at the end of the game as the map is cleared of '*'s'
420 PRINT"to reveal the ship locations.":PRINT
430 PRINT"= = = = = = = = = = = = = = = = = =>>>";RV$;"To start the game press";VR$;" ANY";RV$;" key";VR$:PRINT
440 A$=INPUT$(1)
450 PRINT CL$:PRINT GR$;TAB(5);RV$;"BATTLESHIP";VR$;TAB(23);NO$;RG$
460 FOR I=1 TO 10:PRINT GR$;TAB(20) STRING$(40,97);RG$
470 PRINT GR$;TAB(12)I;TAB(16)ML$;RG$:NEXT I
480 PRINT GR$;TAB(20) STRING$(40,97);RG$
490 FOR U=302 TO 1102 STEP 80
500 N=U:READ CH$:GOSUB 1180:NEXT U
510 FOR U=241 TO 561 STEP 80
520 N=U:READ CH$:GOSUB 1180:NEXT U
530 DIM A(10,10):DIM K(16)
540 FOR B=1 TO 10:FOR E=1 TO 10
550 READ A(B,E):NEXT E:NEXT B
560 PRINT RV$;BE$
570 N=1262:CH$="SHIPS MANEUVERING":GOSUB 1180
580 N=1342:CH$="PLEASE WAIT":GOSUB 1180
590 RANDOMIZE SEED
600 FOR C=5 TO 1 STEP -1
610 FOR F=1 TO 2
620 W=INT(RND*2):T=INT(RND*11)
630 IF T<1 OR T>10 THEN 620
640 B(F)=T
650 NEXT F
660 G=C:O=B(1):D=B(2):H=1
670 FOR G=G TO 1 STEP -1
680 FOR J=1 TO 15
690 N=A(D,O)
700 IF K(J)<>N THEN 790
710 IF C=4 THEN J=6
720 IF C=3 THEN J=10
730 IF C=2 THEN J=13
740 IF C=1 THEN J=15
750 FOR K=J TO 15
760 K(K)=0
770 NEXT K
780 GOTO 610
790 IF K(J)<>0 THEN 860
800 K(J)=N
810 IF W=0 THEN D=D+H
820 IF W=1 THEN O=O+H
830 IF D=11 THEN D=D-C
840 IF O=11 THEN O=O-C
850 GOTO 870
860 NEXT J
870 NEXT G
880 NEXT C
890 PRINT VR$;BE$
900 T=0:N=1262:CH$="                  ":GOSUB 1180
910 N=1342:GOSUB 1180
920 CH$="OVER":T=0:N=962:GOSUB 1180
930 INPUT O
940 CH$="     ":N=1042:GOSUB 1180
950 IF O>0 AND O<11 THEN 970
960 GOSUB 1040:GOTO 920
970 CH$="DOWN":N=1122:GOSUB 1180
980 INPUT D
990 CH$="     ":N=1202:GOSUB 1180
1000 IF D>0 AND D<11 THEN 1020
1010 GOSUB 1040:GOTO 970
1020 N=A(D,O)
1030 IF N<>0 THEN 1070 ELSE GOTO 960
1040 CH$="TRY AGAIN":N=801::PRINT RV$;BE$:GOSUB 1180
1050 PRINT VR$:FOR X=1000 TO 1 STEP -1:NEXT X:PRINT BE$
1060 CH$="         ":N=801:GOSUB 1180:RETURN
1070 RESTORE 1740
1080 S=1:T=1
1090 FOR J=1 TO 15
1100 READ CH$
1110 IF K(J)=N THEN 1140
1120 NEXT J
1130 CH$="*":S=0
1140 GOSUB 1180
1150 A(D,O)=0
1160 S=0
1170 GOTO 920
1180 X=(N-(INT(N/80)*80)+1):Y=INT(N/80)+1
1190 IF S<>1 THEN 1210
1200 PRINT RV$;BE$
1210 PRINT ES$+"="+CHR$(Y+31)+CHR$(X+30);CH$
1220 IF T=0 THEN RETURN
1230 C(1)=C(1)+S:C(3)=C(3)+1:C(2)=C(3)-C(1)
1240 PRINT RV$
1250 FOR L=321 TO 641 STEP 160
1260 M=(L-161)/160:N=L
1270 GOSUB 1300:NEXT L:PRINT VR$
1280 IF C(1)=15 THEN 1330
1290 RETURN
1300 X=(N-(INT(N/80)*80)+1):Y=INT(N/80)+1
1310 PRINT ES$+"="+CHR$(Y+31)+CHR$(X+30);C(M)
1320 RETURN
1330 RESTORE 1730
1340 T=0:PRINT RV$;BE$:N=1262:CH$="RATING :":GOSUB 1180
1350 FOR T=25 TO 85 STEP 15
1360 READ CH$
1370 IF C(3)<=T THEN 1390
1380 NEXT T
1390 N=1342:T=0:GOSUB 1180
1400 N=1502:CH$="CLEARING MISSES":GOSUB 1180
1410 N=1582:CH$="TO REVEAL PATTERN":GOSUB 1180
1420 PRINT VR$;BE$
1430 RESTORE 1630
1440 T=0:S=3
1450 FOR B=1 TO 10
1460 FOR E=1 TO 10
1470 READ A(B,E)
1480 FOR J=1 TO 15
1490 IF K(J)=A(B,E) THEN 1520
1500 NEXT J
1510 CH$=" ":N=A(B,E):GOSUB 1180
1520 NEXT E
1530 NEXT B
1540 N=1502:CH$="                     ":GOSUB 1180
1550 N=1582:GOSUB 1180
1560 RESTORE 1590
1570 PRINT:PRINT:PRINT TAB(21);RV$;"Press any key to return to main menu. ";VR$;
1580 X$=INPUT$(1):GOTO 10
1590 DATA "CARRIER = CCCCC","BATTLESHIP = BBBB","DESTROYER = DDD"
1600 DATA "SUBMARINE = SS","PT BOAT = P"," ","NO. OF SHOTS = 100"
1610 DATA "MISS = *","HIT = C,B,D,S OR P","SHIPS MAY BE VERT."
1620 DATA "OR HORZ.","HITS"," ","MISSES"," ","SHOTS"
1630 DATA 260,264,268,272,276,280,284,288,292,296
1640 DATA 420,424,428,432,436,440,444,448,452,456
1650 DATA 580,584,588,592,596,600,604,608,612,616
1660 DATA 740,744,748,752,756,760,764,768,772,776
1670 DATA 900,904,908,912,916,920,924,928,932,936
1680 DATA 1060,1064,1068,1072,1076,1080,1084,1088,1092,1096
1690 DATA 1220,1224,1228,1232,1236,1240,1244,1248,1252,1256
1700 DATA 1380,1384,1388,1392,1396,1400,1404,1408,1412,1416
1710 DATA 1540,1544,1548,1552,1556,1560,1564,1568,1572,1576
1720 DATA 1700,1704,1708,1712,1716,1720,1724,1728,1732,1736
1730 DATA "FLEET COMMANDER","ADMIRAL","CAPTAIN","ENSIGN","SWAB"
1740 DATA "C","C","C","C","C","B","B","B","B","D","D","D","S","S","P"
1750 END
