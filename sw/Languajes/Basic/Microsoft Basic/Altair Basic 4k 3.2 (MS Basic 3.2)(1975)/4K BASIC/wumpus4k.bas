
1 REM WUMPUS 1/28/77
2 REM MODIFIED FOR ALTAIR 4K BASIC 10/01
3 REM RECODED -> CHARACTERS, COMPUTED GOTOS, "OR" STATEMENTS, 2-D ARRAY
4 REM            COMPUTED LOGICAL STATEMENTS
10 PRINT"WMP23-HUNT THE WUMPUS"
15 PRINT
20 PRINT "INSTRUCTIONS(1=YES OR 0=NO)";
30 INPUT I
35 REM RANDOMIZE
40 IF I<>1 THEN 70
50 GOSUB 7000
70 REM SET UP CAVE
75 DIM M(8)
77 REM DIM S(20,3) - S() CONVERTED TO 1-D AND PROGRAM MODIFIED
80 DIM S(60)
90 FOR J=1 TO 60
100 READ S(J)
120 NEXT J
130 DATA 2,5,8,1,3,10,2,4,12,3,5,14,1,4,6
140 DATA 5,7,15,6,8,17,1,7,9,8,10,18,2,9,11
150 DATA 10,12,19,3,11,13,12,14,20,4,13,15,6,14,16
160 DATA 15,17,20,7,16,18,9,17,19,11,18,20,13,16,19
200 REM LOCATE M(J) ARRAY ITEMS
210 REM 1,YOU 2,WUMPUS 3&4,PITS 5&6,BATS 7,BLOCKAGE8,EXIT
240 LET W=0
245 LET M1=W
246 LET F=M1
250 FOR J=1 TO 7
260 LET M(J)=INT(1+RND(1)*20)
270 NEXT J
279 REM CHECK FOR CROSSOVERS (IE M(1)=M(2)ETC)
280 FOR J=1 TO 7
290 FOR K=J TO 7
300 IF J=K THEN 330
320 IF M(J)=M(K) THEN 240
330 NEXT K
340 NEXT J
350 LET A=5
360 LET M(8)=M(1)
370 PRINT
380 PRINT "ENTRANCE IS IN CAVE ";M(8)
389 REM MAIN LOOP
390 IF RND(1)<=0.4 THEN 485
400 GOSUB 3370
485 IF RND(1)>=0.08 THEN 2000
490 GOSUB 5000
1999 REM PRINT LOCATION AND HAZARD WARNINGS
2000 PRINT
2010 FOR K=1 TO 3
2020 FOR J=2 TO 6
2025 S0=M(1)+20*(K-1)
2030 IF S(S0) <>M(J) THEN 2110
2050 REM ON J-1 GOTO  2060,2080,2080,2100,2100,2060
2051 J0=J-1
2052 IF J0=1 THEN 2060
2053 IF J0=2 THEN 2080
2054 IF J0=3 THEN 2080
2055 IF J0=4 THEN 2100
2056 IF J0=5 THEN 2100
2057 IF J0=6 THEN 2060
2060 PRINT"I SMELL A WUMPUS"
2070 GOTO 2110
2080 PRINT"I FEEL A DRAFT"
2090 GOTO 2110
2100 PRINT"BATS NEARBY"
2110 NEXT J
2120 NEXT K
2130 PRINT"YOU ARE IN CAVE ";M(1)
2139 REM RINGER SUBROUTINES
2140 LET J=INT(RND(1)*40)
2145 IF J=0 THEN 2440
2146 IF J>7 THEN 2440
2150 REM ON J GOTO 2200,2200,2210,2220,2220,2230,2240,2250
2151 IF J=1 THEN 2200
2152 IF J=2 THEN 2200
2153 IF J=3 THEN 2210
2154 IF J=4 THEN 2220
2155 IF J=5 THEN 2220
2156 IF J=6 THEN 2230
2157 IF J=7 THEN 2240
2158 IF J=8 THEN 2250
2160 GOTO 2440
2200 PRINT"AHA!.WUMPUS TRACKS"
2205 GOTO 2440
2210 PRINT"AHA!..FOUND OLD ARROW, LUCKY YOU"
2213 LET A=A+1
2215 GOTO 2440
2220 PRINT"OOPS, SLIPPED ON SOME LOOSE GRAVEL"
2225 GOSUB 5900
2227 GOTO 2440
2230 PRINT"OOPS, YOU JUST FELL INTO AN UNDERGROUND POOL"
2235 GOSUB 5900
2237 GOTO 2440
2240 PRINT"THIS LOOKS LIKE A NICE CAVE,WHY NOT STOP FOR LUNCH"
2245 GOTO 2440
2250 PRINT"TAKE CARE WITH THAT FLASHLIGHT"
2255 GOTO  2440
2440 PRINT "TUNNELS LEAD TO CAVES ";S(M(1));S(M(1)+20);S(M(1)+40)
2445 PRINT
2449 REM FEARLESS FREDDY STRIKES HERE
2450 IF J<>38 THEN 2500
2460 LET L=M(5)
2470 GOTO 4260
2499 REM CHOOSE OPTION
2500 LET M1=M1+1
2510 PRINT"DO SOMETHING (1=MOVE 2=SHOOT 3=CHECK ARROWS 4=EXIT 5=HELP)";
2520 INPUT I
2530 IF I=2 THEN 3000
2550 IF I=3 THEN 3220
2560 IF I=1 THEN 4000
2570 REM IF (I$="E")*(M(1)=M(8))=1 THEN 8800
2571 IF I<>4 THEN 2580
2572 IF M(1)=M(8) THEN 8800
2580 IF I=5 THEN 2595
2590 GOTO 2500
2595 GOSUB 7600
2597 GOTO 2000
2999 REM ARROW ROUTINE
3000 IF A>=1 THEN 3010
3003 PRINT"WHAT WITH?  DUMMY"
3005 GOTO 390
3010 PRINT "CAVE #";
3012 INPUT L
3015 FOR K=1 TO 3
3016 S0=M(1)+20*(K-1)
3018 IF S(S0)=L THEN 3130
3020 NEXT K
3025 PRINT"NOT POSSIBLE"
3027 GOTO 3010
3129 REM SHOOT ARROW
3130 LET A=A-1
3132 IF A>=0 THEN 3135
3133 LET A=0
3134 GOTO 3220
3135 IF L=M(2) THEN 3140
3137 PRINT "MISSED"
3138 GOTO 3215
3140 IF RND(1)>=0.8 THEN 3150
3142 PRINT "YOU GOT THE WUMPUS"
3144 LET F=F+1
3146 LET M(2)=0
3148 GOTO 4400
3150 PRINT"YOU WOUNDED THE WUMPUS"
3215 GOSUB 3370
3220 PRINT A;"ARROWS LEFT"
3230 GOTO 390
3369 REM MOVE WUMPUS ROUTINE
3370 IF W<>1 THEN 3380
3373 LET M(2)=0
3375 RETURN
3380 REM LET M(2)=S(M(2),(INT(3*RND+1)))
3381 S0=M(2)+20*(INT(3*RND(1)))
3382 M(2)=S(S0)
3385 REM IF (M(1)=M(2))+(L=M(2))+(M(2)=M(7))<>0 THEN 3380
3386 IF M(1)=M(2) THEN 3380
3387 IF L=M(2) THEN 3380
3388 IF M(2)=M(7) THEN 3380
3425 RETURN
3999 REM MOVE ROUTINE
4000 PRINT "WHERE TO";
4010 INPUT L
4020 FOR K=1 TO 3
4025 S0=M(1)+20*(K-1)
4030 IF S(S0)=L THEN 4120
4080 NEXT K
4090 IF L=M(1) THEN 4120
4100 PRINT "NOT POSSIBLE"
4110 GOTO 4000
4119 REM CHECK FOR HAZARDS
4120 IF L<>M(2) THEN 4210
4130 PRINT "OOPS! BUMPED A WUMPUS!"
4140 GOTO 4500
4210 REM IF (L=M(3))+(L=M(4))=0 THEN 4220
4211 IF L=M(3) THEN 4214
4212 IF L=M(4) THEN 4214
4213 GOTO 4220
4214 PRINT"YYYIIIIEEEE...FELL IN PIT"
4216 GOTO 4520
4220 IF L<>M(7) THEN 4257
4230 PRINT "CAVE ENTRANCE IS BLOCKED"
4240 GOSUB 5900
4250 GOTO 390
4256 REM IF (L=M(5))+(L=M(6))=0 THEN 4265
4257 IF L=M(5) THEN 4261
4258 IF L=M(6) THEN 4261
4259 GOTO 4265
4261 PRINT "ZAP..SUPERBAT SNATCH!"
4263 GOTO 4280
4265 IF L<>M(8) THEN 4270
4267 PRINT "EXIT NEARBY"
4270 LET M(1)=L
4275 GOTO 390
4280 LET L=INT(1+RND(1)*20)
4285 REM IF (L=M(1))+(L=M(6))+(L=M(7))<>0 THEN 4280
4286 IF L=M(1) THEN 4280
4287 IF L=M(6) THEN 4280
4288 IF L=M(7) THEN 4280
4290 GOSUB 5900
4300 GOTO 4120
4400 IF RND(1)>=.75 THEN 4410
4402 PRINT "BEWARE OF ITS MATE"
4404 LET J=2
4406 GOSUB 6100
4408 GOTO 3220
4410 LET W=1
4420 PRINT "HEE HEE HEE--THE WUMPUS'L GET YOU NEXT TIME"
4430 GOTO 390
4499 REM EATEN SUBROUTINE
4500 IF RND(1)>=.75 THEN 4510
4502 GOSUB 3370
4504 GOSUB 5900
4506 GOTO 4270
4510 PRINT"TSK TSK TSK--THE WUMPUS GOT YOU"
4520 PRINT "HA HA HA--YOU LOSE!"
4530 GOTO 8810
4999 REM MOVE EVERYTHING
5000 PRINT"**EARTHQUAKE**"
5001 FOR J=3 TO 7
5002 GOSUB 6100
5003 NEXT J
5004 GOSUB 5900
5005 LET M(2)=INT(RND(1)*20+1)
5006 REM IF (M(1)=M(2))+(M(2)=M(7))<>0 THEN 5005
5007 IF M(1)=M(2) THEN 5005
5008 IF M(2)=M(7) THEN 5005
5009 REM MOVE CAVE ENTRANCE
5010 IF RND(1)<=.1 THEN 5020
5015 RETURN
5020 LET M(8)=INT(RND(1)*20+1)
5025 FOR J=3 TO 7
5030 IF M(8)<>M(J) THEN 5040
5033 LET M(8)=INT(RND(1)*20+1)
5036 GOTO 5030
5040 NEXT J
5050 RETURN
5899 REM DROPPED ARROWS SUBROUTINE
5900 LET J=INT(RND(1)*10)
5901 REM IF (J>A)+(A=0)=0 THEN 5910
5902 IF J>A THEN 5905
5903 IF A=0 THEN 5905
5904 GOTO 5910
5905 RETURN
5910 PRINT "DROPPED ARROWS"
5915 IF J<>0 THEN 5930
5920 PRINT "ALL ARROWS FOUND"
5925 RETURN
5930 LET A=A-J
5940 PRINT J;"ARROWS LOST";TAB(20);A;"ARROWS LEFT"
5950 RETURN
6099 REM RANDOM CAVE REARRANGEMENT SUBROUTINE
6100 LET M(J)=INT(RND(1)*20)+1
6110 REM IF (M(J)=M(1))+(M(J)=M(8))<>0 THEN 6100
6111 IF M(J)=M(1) THEN 6100
6112 IF M(J)=M(8) THEN 6100
6200 RETURN
6999 REM INSTRUCTIONS
7000 PRINT "WELCOME TO HUNT THE WUMPUS"
7005 PRINT
7010 PRINT "THE WUMPUS COLONY INHABIT A BURROW OF 20 CAVES"
7020 PRINT "EACH CAVE HAS THREE TUNNELS LEADING TO OTHER CAVES."
7030 PRINT "THE OBJECTIVE IS TO DESCEND INTO THE BURROW AND HUNT WUMPI.
7040 PRINT "AFTER YOU HAVE KILLED AT LEAST ONE, YOU MUST RETURN TO THE"
7050 PRINT"EXIT AND LEAVE THE BURROW. NOTE THAT THERE MAY BE MORE THAN"
7060 PRINT "ONE WUMPUS IN THE BURROW. "
7061 PRINT "YOU HAVE 5 ARROWS."
7062 PRINT"UNDER CONDITIONS OF STRESS, YOU MAY DROP YOUR ARROWS."
7065 PRINT"YOUR RATING IS A FUNCTION OF THE NUMBER OF WUMPI SHOT & THE"
7067 PRINT "TIME SPENT IN THE BURROW"
7070 PRINT
7072 GOSUB 7990
7074 PRINT"HAZARDS"
7076 PRINT
7080 PRINT"1---BOTTOMLESS PITS"
7090 PRINT"TWO ROOMS CONTAIN BOTTOMLESS PITS. IF YOU FALL IN A PIT"
7100 PRINT"YOU LOSE."
7110 PRINT
7112 PRINT
7114 PRINT"2---SUPERBATS"
7120 PRINT "TWO ROOMS CONTAIN NESTS OF SUPERBATS. THEY ARE PEACEFUL"
7130 PRINT"CREATURES WHEN LEFT ALONE. SHOULD YOU INADVERTENTLY"
7140 PRINT"STUMBLE ACROSS THEIR NEST YOU WILL BE PICKED UP AND"
7150 PRINT "BE DEPOSITED IN ANOTHER CAVE AT RANDOM."
7160 PRINT "TOO BAD IF IT CONTAINS ANOTHER HAZARD."
7162 PRINT
7164 GOSUB 7990
7170 PRINT
7175 PRINT"3---**EARTHQUAKES**"
7180 PRINT"EARTHQUAKES ARE A COMMON OCCURRENCE. SHOULD ONE OCCUR, THE"
7185 PRINT "BURROW ENTRANCE MAY BE BLOCKED AND A NEW ONE OPEN UP. THE"
7190 PRINT"GEOGRAPHY OF THE CAVES WILL BE CHANGED. THE PITS MAY FILL"
7200 PRINT "UP AND A CAVE MAY BE BLOCKED BY A ROCKFALL. THE BATS WILL"
7210 PRINT "BE DISTURBED AND MAY SEEK OUT A NEW CAVE. THE WUMPUS"
7220 PRINT "WILL ALSO BECOME ALARMED AND MAY MOVE TO A NEW CAVE."
7230 PRINT
7235 PRINT"4---WUMPUS"
7240 PRINT "THE WUMPUS IS NOT BOTHERED BY ANY HAZARDS (IT HAS SUCKERS"
7250 PRINT "ON ITS FEET AND IS TOO BIG FOR A BAT TO LIFT)."
7260 PRINT "THE WUMPUS IS MOVING IN THE CAVES LOOKING FOR FOOD. IT"
7270 PRINT "NORMALLY EATS A SPECIES OF MUSHROOM, BUT MAY EAT YOU SHOULD
7280 PRINT "YOU ENTER THE CAVE IN WHICH IT IS FEEDING"
7290 PRINT
7300 GOSUB 7990
7600 PRINT
7605 PRINT "EACH TURN YOU MAY:"
7610 PRINT " (1) MOVE TO AN ADJACENT CAVE THROUGH A CONNECTING TUNNEL"
7620 PRINT " (2) SHOOT AN ARROW THROUGH A TUNNEL TO TRY HIT THE WUMPUS"
7630 PRINT "     IT IS BIG ENOUGH SO THAT AN ARROW ENTERING THE CAVE"
7640 PRINT "     THAT IT IS OCCUPYING, WILL HIT IT."
7645 PRINT " (3) CHECK ON NUMBER OF ARROWS LEFT"
7650 PRINT " (4) EXIT FROM THE CAVES IF YOU ARE IN THE ENTRANCE CAVE"
7660 PRINT " (5) ASK FOR INSTRUCTIONS"
7662 PRINT
7664 GOSUB 7990
7666 PRINT "WARNINGS"
7670 PRINT "WHEN YOU ARE ONE CAVE AWAY FROM A HAZARD YOU WILL BE WARNED
7680 PRINT "AS FOLLOWS:"
7685 PRINT
7690 PRINT " WUMPUS.....I SMELL A WUMPUS"
7700 PRINT " BATS.....BATS NEARBY"
7710 PRINT " PIT.....I FEEL A DRAFT"
7715 PRINT
7720 PRINT "IF YOU TRY TO ENTER A CAVE BLOCKED BY A FALL OR IF YOU"
7730 PRINT "RETURN TO THE ENTRANCE CAVE, YOU WILL BE NOTIFIED"
7740 PRINT
7750 RETURN
7990 PRINT "TO CONTINUE, ENTER ANY NUMBER"
7992 INPUT I
7994 PRINT
7996 PRINT
7998 RETURN
8799 REM END GAME
8800 PRINT "OUT OF THE CAVES"
8801 IF F<=0 THEN 8805
8803 PRINT "GOOD HUNTING"
8805 LET W=INT((F*1000)/M1)
8807 PRINT "YOUR RATING IS ";W
8810 IF F<>0 THEN 8830
8820 PRINT"BETTER LUCK NEXT TIME"
8830 PRINT
8840 PRINT "WANT TO TRY AGAIN, IN SPITE OF YOUR INABILITY (1=YES 0=NO)"
8850 INPUT I
8860 IF I=1 THEN 240
9000 END
