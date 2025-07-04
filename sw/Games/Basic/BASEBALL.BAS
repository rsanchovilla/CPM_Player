                                                                                 100 REM BASEBALL SIMULATION PROGRAM
110 REM WRITTEN BY JOEL LIND & KEN BIRKMAN - NYU - JULY 1973
120 REM STOLEN AND ENHANCED DECEMBER 1973 BY R. D. KURLAND - NYU
130 DIM B(7),P$(9),W$(7),J$(8),K$(4)
140 FOR I=1 TO 7: B(I)=0:NEXT
150 B=0:T9=0:R9=0:S=0:O=0:B1=0:B2=0:T=0
160 Z1=1:Z2=1
170 PRINT "WELCOME TO EBBETT'S FIELD"
180 PRINT "WHAT DO YOU WANT TO CALL YOUR TEAM";
190 INPUT A$
200 FOR I=1 TO 7:READ W$(I):NEXT
210 FOR I=1 TO 9:READ P$(I):NEXT
220 FOR I=1 TO 4:READ K$(I):NEXT
230 FOR I=1 TO 8:READ J$(I):NEXT
240 PRINT "FINE. THE ";A$;" NEED A MANAGER.  WHAT'S YOUR NAME";
250 INPUT B$
260 PRINT "WHAT DO YOU WANT TO CALL MY TEAM, ";B$;
270 INPUT C$
280 PRINT
290 PRINT "OPENING DAY, THE ";A$;" VERSUS THE ";C$
300 PRINT
310 PRINT "LET'S FLIP A COIN. THE WINNER IS THE HOME TEAM."
320 PRINT "HEADS OR TAILS";
330 INPUT D$
340 IF D$<>"HEADS" AND D$<>"TAILS" THEN 320
350 FOR I=1 TO TYM
360 Y=RND(1)
370 NEXT I
380 H=1
390 Y=RND(1)
400 Y$="HEADS"
410 IF Y>.5 THEN Y$="TAILS"
420 IF D$=Y$ THEN 490
430 H=0
440 PRINT "YOU LOST THE TOSS.  THE ";A$;" ARE UP FIRST."
450 PRINT
460 PRINT
470 A=0
480 GOTO 610
490 PRINT "YOU WIN THE TOSS. ";A$;" TAKE THE FIELD, AND ";
500 PRINT C$;" ARE AT BAT."
510 A=1
520 R9=0
530 T=T+1
540 IF T<3 THEN GOSUB 5140
550 IF T<18 THEN 710
560 IF T>18 THEN 590
570 GOSUB 3500
580 GOTO 710
590 GOSUB 3290
600 GOTO 710
610 REM START AN INNING - WE ARE OUT ON THE FIELD
620 T=T+1
630 R9=0
640 IF T<18 THEN 690
650 IF T>18 THEN 680
660 GOSUB 3500
670 GOTO 690
680 GOSUB 3290
690 IF T>2 THEN 710
700 GOSUB 5070
710 S=0:B=0
720 PRINT
730 IF O=0 THEN PRINT "NO OUTS"
740 IF O=1 THEN PRINT "THERE IS 1 OUT"
750 IF O>1 THEN PRINT "THERE ARE";O;"OUTS"
760 P=B(1)+B(2)+B(3)
770 IF P<>3 THEN 800
780 PRINT "BASES LOADED"
790 GOTO 900
800 IF P=0 THEN 900
810 Y$="RUNNER ON "
820 IF P>1 THEN Y$="RUNNERS ON "
830 PRINT Y$;
840 IF B(1)=0 THEN 870
850 PRINT "FIRST";
860 IF P>1 THEN PRINT " AND ";
870 IF B(2)=1 THEN PRINT "SECOND";
880 IF P>1 AND B(1)=0 THEN PRINT " AND ";
890 IF B(3)=1 THEN PRINT "THIRD" ELSE PRINT " "
900 IF A=0 THEN 920
910 GOTO 3030
920 PRINT "BATTER UP"
930 IF B<>3 OR S<>2 THEN 960
940 PRINT "FULL COUNT"
950 GOTO 970
960 IF B>0 OR S>0 THEN PRINT "THE COUNT IS";B;"AND";S
970 PRINT
980 IF A=1 THEN 3030
990 PRINT "WHAT WILL YOUR BATTER DO, ";B$;
1000 INPUT C
1010 IF C>0 AND C<5 THEN 1050
1020 PRINT "HUH?  ";
1030 GOSUB 5070
1040 GOTO 990
1050 Y2=RND(1)
1060 IF Y2<.56 OR Y2>.5625 THEN 1120
1070 PRINT "WILD PITCH!"
1080 N=1
1090 GOSUB 3540
1100 B(1)=0
1110 GOTO 1210
1120 IF Y2>.772 AND Y2<.775 THEN 4880
1130 ON C GOTO 1140,1450,2600,4450,5500
1140 C=1
1150 GOSUB 5240
1160 IF A=0 THEN Z1=Z1+1
1170 Y=RND(1)
1180 IF B<>3 OR S<>0 THEN 1200
1190 IF Y<.7 THEN 1310 ELSE 1210
1200 IF Y<.5 THEN 1310
1210 B=B+1
1220 Y=INT(RND(1)*8+1)
1230 IF Y=9 THEN 1220
1240 PRINT J$(Y);" - BALL";B
1250 IF B<>4 THEN 930
1260 PRINT "WALK"
1270 GOSUB 4950
1280 Y=RND(1)
1290 GOTO 710
1300 PRINT "HIGH POP - FOUL DOWN THE ";Y$;" FIELD LINE"
1310 S=S+1
1320 IF C=2 OR C=5 THEN 1370
1330 Y=INT(RND(1)*4+1)
1340 IF Y=5 THEN 1330
1350 PRINT K$(Y);", CALLED STRIKE";S
1360 GOTO 1380
1370 PRINT "SWINGING STRIKE";S
1380 IF C=5 AND S<>3 THEN 4450
1390 IF S<>3 THEN 930
1400 PRINT "STRUCK OUT"
1410 O=O+1
1420 IF O=3 THEN 2850
1430 IF C=5 THEN 4450
1440 GOTO 710
1450 C=2
1460 Y=INT(RND(1)*10+1)
1470 IF Y=10 THEN 1450
1480 IF A=0 THEN Z2=Z2+1
1490 IF C<>5 THEN GOSUB 5240
1500 IF S<>2 AND Z2/Z1>7 AND A=0 THEN 1520
1510 IF S<>2 OR Z2/Z1<25 THEN 1590
1520 Y=INT(RND(1)*20+1)
1530 IF Y>7 THEN 1550
1540 ON Y GOTO 1610,1310,1310,1310,1310,1680,1610
1550 IF Y>13 THEN 1570
1560 ON Y-7 GOTO 1680,1310,1740,1850,1740,1850
1570 IF Y>18 THEN 1600
1580 ON Y-13 GOTO 1980,1980,2040,2570,1640,2570
1590 IF Y<3 THEN 1310
1600 ON Y-2 GOTO 1610,1680,1740,1850,1980,2040,2570
1610 PRINT "FOULED INTO THE STANDS-OUT OF PLAY"
1620 IF S<>2 THEN S=S+1
1630 GOTO 930
1640 Y=RND(1)
1650 Y$="RIGHT"
1660 IF Y<.5 THEN Y$="LEFT"
1670 GOTO 1620
1680 Y=INT(RND(1)*20+1)
1690 IF Y>18 THEN 1720
1700 PRINT "FOULED BACK INTO THE STANDS"
1710 GOTO 1620
1720 PRINT "POPPED IT UP - CAUGHT BY CATCHER"
1730 GOTO 1410
1740 PRINT "INFIELD GROUNDER"
1750 E2=RND(1)
1760 IF E2<.37 OR E2>.41 THEN 1820
1770 PRINT "1 BASE ERROR!!"
1780 N=1
1790 C=4
1800 GOSUB 3540
1810 GOTO 710
1820 GOSUB 4100
1830 IF O=3 THEN 2850
1840 GOTO 710
1850 PRINT "GROUNDER - COULD BE TROUBLE"
1860 Y=RND(1)
1870 IF Y>.75 THEN 1950
1880 Y$="UP THE MIDDLE"
1890 IF Y<.5 THEN Y$="THROUGH THE HOLE INTO RIGHT FIELD"
1900 IF Y<.25 THEN Y$="THROUGH THE HOLE INTO LEFT FIELD"
1910 PRINT "A SINGLE ";Y$;"!"
1920 N=1
1930 GOSUB 3540
1940 GOTO 710
1950 PRINT "INFIELDER UP WITH IT!"
1960 GOSUB 4800
1970 IF O=3 THEN 2850 ELSE 710
1980 Y=RND(1)
1990 Y$="LEFT"
2000 IF Y<.6 THEN Y$="CENTER"
2010 IF Y<.3 THEN Y$="RIGHT"
2020 PRINT "FLY-OUT TO ";Y$;" FIELD"
2030 GOTO 1410
2040 Z=RND(1)
2050 Y$="CENTER"
2060 IF Z<.6 THEN Y$="RIGHT"
2070 IF Z<.3 THEN Y$="LEFT"
2080 PRINT "LONG FLY TO DEEP ";Y$;" FIELD - LOOKS GOOD!"
2090 Z=RND(1)
2100 IF Z<.9 THEN 2130
2110 PRINT Y$;"FIELDER CAUGHT IT AT THE WALL!"
2120 GOTO 2180
2130 IF Z<.8 THEN 2160
2140 PRINT "A DIVING CATCH!"
2150 GOTO 2180
2160 IF Z<.7 THEN 2290
2170 PRINT Y$;"FIELDER CAUGHT IT ON THE WARNING TRACK!"
2180 O=O+1
2190 IF O=3 THEN 2850
2200 FOR I=3 TO 1 STEP -1
2210 IF B(I)=1 THEN 2240
2220 NEXT I
2230 GOTO 710
2240 B(I+1)=B(I)
2250 B(I)=0
2260 PRINT "LEAD RUNNER TAGS UP - AND ADVANCES 1 BASE!"
2270 GOSUB 3830
2280 GOTO 710
2290 IF Z<.5 THEN 2360
2300 PRINT "BATTER HOLDS WITH A SINGLE."
2310 N=2
2320 GOSUB 3540
2330 B(2)=0
2340 B(1)=1
2350 GOTO 710
2360 IF Z<.15 THEN 2480
2370 PRINT "DOUBLE!"
2380 Y=RND(1)
2390 IF Y>.5 THEN 2430
2400 N=2
2410 GOSUB 3540
2420 GOTO 710
2430 N=3
2440 GOSUB 3540
2450 B(3)=0
2460 B(2)=1
2470 GOTO 710
2480 IF Z<.1 THEN 2530
2490 PRINT "TRIPLE!"
2500 N=3
2510 GOSUB 3540
2520 GOTO 710
2530 PRINT "IT'S OVER THE WALL -- A H*O*M*E R*U*N!!!"
2540 N=4
2550 GOSUB 3540
2560 GOTO 710
2570 Y=INT(RND(1)*7+1)
2580 PRINT "LINED OUT TO ";P$(Y)
2590 GOTO 1410
2600 GOSUB 5240
2610 PRINT "BATTER BUNTS..."
2620 Y=RND(1)
2630 IF Y<.6 THEN 2750
2640 IF B(3)=0 THEN 2660
2650 IF Y<.8 THEN 2830
2660 PRINT "THROWN OUT AT FIRST."
2670 O=O+1
2680 IF O=3 THEN 2850
2690 IF B(1)+B(2)+B(3)=0 THEN 710
2700 PRINT "SACRIFICE - ";
2710 N=1
2720 GOSUB 3540
2730 B(1)=0
2740 GOTO 710
2750 IF Y<.2 THEN 2830
2760 IF Y<.4 THEN 2790
2770 PRINT "BATTER MISSES PITCH"
2780 GOTO 1310
2790 PRINT "BEATS IT OUT! SINGLE!"
2800 N=1
2810 GOSUB 3540
2820 GOTO 710
2830 GOSUB 4100
2840 IF O<>3 THEN 710
2850 PRINT "3 OUTS. THE SIDE IS RETIRED";
2860 I=B(1)+B(2)+B(3)
2870 IF I=0 THEN PRINT "."
2880 IF I=1 THEN PRINT ", LEAVING 1 MAN ON BASE"
2890 IF I>1 THEN PRINT ", LEAVING";I;"MEN ON BASE"
2900 PRINT
2910 PRINT
2920 PRINT "*************"
2930 D=T/2-INT(T/2)
2940 PRINT "AFTER";
2950 IF T>1 THEN PRINT INT(T/2);
2960 IF D>.3 THEN PRINT " 1/2 ";
2970 Y$="INNINGS"
2980 IF T<3 THEN Y$="INNING"
2990 PRINT Y$;" OF PLAY, THE SCORE IS"
3000 GOSUB 3960
3010 O=0:B(1)=0:B(2)=0:B(3)=0
3020 IF A=0 THEN 510 ELSE 470
3030 REM MY TEAM IS AT BAT
3040 Y=RND(1)
3050 IF B(1)+B(2)+B(3)=0 THEN 3140
3060 REM IF O=2 AND S=2 AND B=3 THEN 4850
3070 IF B(3)=1 THEN 3110
3080 IF B(2)=0 THEN 3100
3090 IF .45<Y AND .46>Y THEN 4450
3100 IF .45<Y AND .47>Y THEN 4450
3110 IF O=2 THEN 3140
3120 IF O<2 AND Y<.333 AND B(3)=1 THEN 2600
3130 IF .45<Y AND .55>Y THEN 2600
3140 IF S=0 THEN 3240
3150 IF B<>3 THEN 3180
3160 IF Y<.6 THEN 1450
3170 GOTO 1140
3180 IF Y>.3 THEN 1450
3190 IF S<>2 THEN 1140
3200 IF B=0 AND Y<.1 THEN 1140
3210 IF B=0 THEN 1450
3220 IF Y<.2 THEN 1140
3230 GOTO 1450
3240 IF B=3 THEN 3270
3250 IF Y<.6 THEN 1140
3260 GOTO 1450
3270 IF Y<.9 THEN 1140
3280 GOTO 1450
3290 IF T<>19 THEN 3330
3300 IF R1<>R2 THEN 3340
3310 PRINT
3320 PRINT "*** GOING INTO EXTRA INNINGS ***"
3330 IF R1=R2 THEN RETURN
3340 IF (T-1)/2<>INT(T-1)/2 THEN RETURN
3350 PRINT "THE BALLGAME IS OVER."
3360 PRINT "*************"
3370 PRINT "FINAL SCORE:"
3380 T9=1
3390 GOSUB 3960
3400 IF R1>R2 THEN 3470
3410 PRINT "NICE TRY, ";B$
3420 PRINT "YOU SHOULD KNOW BETTER THAN TO TRY TO"
3430 PRINT "OUT-MANAGE A COMPUTER.  MAYBE BASEBALL"
3440 PRINT "JUST ISN'T YOUR SPORT...WHY DON'T YOU TRY GOLF?"
3450 REM CHAIN GOLF
3460 STOP
3470 PRINT "CONGRATULATIONS, ";B$
3480 PRINT "YOU'VE BEATEN ME, BUT I WILL HAVE MY REVENGE."
3490 STOP
3500 REM 9TH INNING
3510 IF A=0 THEN 3530
3520 IF R2>R1 THEN 3350 ELSE RETURN
3530 IF R1>R2 THEN 3350 ELSE RETURN
3540 REM ADVANCE N BASES (SET N BEFORE GOSUB)
3550 N2=B(1)+B(2)+B(3)
3560 IF C=5 THEN N=N+1
3570 N3=N
3580 IF N2=0 THEN 3650
3590 REM FIND LAST RUNNER: MAKE SURE HE ISN"T TRYING TO ADVANCE
3600 REM PAST HOME PLATE.
3610 FOR I=1 TO 3
3620 IF B(I)=1 THEN 3640
3630 NEXT I
3640 IF 4-I<N THEN N3=4-I
3650 FOR I=3+N TO N+1 STEP -1
3660 B(I)=B(I-N)
3670 NEXT I
3680 B(N)=1
3690 IF N=1 THEN 3740
3700 FOR P=1 TO 3
3710 IF (N-P)>1 THEN B(N-P)=0
3720 IF (N-P)<=1 THEN B(1)=0
3730 NEXT P
3740 FOR P=1 TO 7
3750 IF P=N THEN 3780
3760 NEXT P
3770 GOTO 3830
3780 IF C=4 OR N2=0 THEN 3830
3790 Y$="RUNNERS ADVANCE"
3800 IF N2=1 THEN Y$="RUNNER ADVANCES"
3810 PRINT Y$;N3;
3820 IF N3=1 THEN PRINT "BASE" ELSE PRINT "BASES"
3830 IF B(4)+B(5)+B(6)+B(7)=0 THEN RETURN
3840 REM AT LEAST 1 RUN HAS SCORED.
3850 N2=B(4)+B(5)+B(6)+B(7)
3860 IF A=0 THEN 3890
3870 R2=R2+N2
3880 GOTO 3900
3890 R1=R1+N2
3900 B(4)=0:B(5)=0:B(6)=0:B(7)=0
3910 IF N2=1 THEN PRINT "** 1 RUN SCORED"
3920 IF N2>1 THEN PRINT "**";N2;"RUNS SCORED"
3930 PRINT
3940 PRINT
3950 PRINT "********NEW SCORE:"
3960 IF H=1 THEN 4000
3970 IF LEN(A$)>LEN(C$) THEN PRINT A$;TAB(LEN(A$)+3);R1
3980 IF LEN(A$)<=LEN(C$) THEN PRINT A$;TAB(LEN(C$)+3);R1
3990 IF H=1 THEN 4030
4000 IF LEN(A$)>LEN(C$) THEN PRINT C$;TAB(LEN(A$)+3);R2
4010 IF LEN(A$)<=LEN(C$) THEN PRINT C$;TAB(LEN(C$)+3);R2
4020 IF H=1 THEN 3970
4030 PRINT "*************"
4040 PRINT
4050 PRINT
4060 IF T9=1 THEN 4090
4070 IF A=1 AND T>17 AND INT(T/2)=T/2 AND R2>R1 THEN 3350
4080 IF A=0 AND T>17 AND INT(T/2)=T/2 AND R1>R2 THEN 3350
4090 RETURN
4100 REM LEAD RUNNER OUT (FIELDER"S CHOICE THEN ONE BASE ADVANCE)
4110 N=1
4120 I=4
4130 IF B(4)=0 AND B(3)=1 AND B(2)=1 AND B(1)=1 THEN 4220
4140 I=3
4150 IF B(3)=0 AND B(2)=1 AND B(1)=1 THEN 4220
4160 I=2
4170 IF B(2)=0 AND B(1)=1 THEN 4220
4180 REM NO ONE FORCED
4190 O=O+1
4200 PRINT "BATTER THROWN OUT"
4210 RETURN
4220 B(I-1)=0
4230 F=RND(1)
4240 IF O=2 OR F>.3 THEN 4290
4250 O=O+2
4260 PRINT "DOUBLE PLAY!"
4270 IF O=3 THEN RETURN
4280 GOTO 4910
4290 O=O+1
4300 PRINT "RUNNER ON BASE";I-1;"IS OUT ON FIELDER'S CHOICE"
4310 IF O=3 THEN RETURN
4320 GOSUB 3540
4330 RETURN
4340 REM FORCED RUNNERS ADVANCE 1 BASE, OTHERS HOLD
4350 FOR I=1 TO 3
4360 IF B(I)=0 THEN 4400
4370 NEXT I
4380 N=1
4390 GOTO 3540
4400 REM NO ONE ON BASE I
4410 FOR I2=I TO 1 STEP -1
4420 B(I2)=1
4430 NEXT I2
4440 RETURN
4450 REM LEAD RUNNER STEALS
4460 FOR I=3 TO 1 STEP -1
4470 IF B(I)=1 THEN 4510
4480 NEXT I
4490 PRINT "NO ONE ON BASE, DUMMY!"
4500 GOTO 990
4510 REM I IS LEAD RUNNER"S BASE
4520 IF C<>5 THEN GOSUB 5240
4530 IF RND(1)/I<.3 THEN 4680
4540 IF B(1)+B(2)+B(3)>1 THEN 4570
4550 PRINT "RUNNER STEALS A BASE"
4560 GOTO 4580
4570 PRINT "RUNNERS STEAL A BASE"
4580 N=1
4590 C2=C
4600 C=4
4610 GOSUB 3540
4620 C=C2
4630 B(1)=0
4640 IF C=5 AND S<>3 THEN 930
4650 IF C=5 THEN 710
4660 Y=RND(1)
4670 IF Y>.5 THEN 1210 ELSE 1310
4680 PRINT "RUNNER THROWN OUT STEALING"
4690 O=O+1
4700 B(I)=0
4710 IF O=3 THEN 2850
4720 N=1
4730 GOSUB 3540
4740 B(1)=0
4750 IF C=5 AND S<>3 THEN 930
4760 IF C=5 THEN 710
4770 Y=RND(1)
4780 IF B=3 THEN 1310
4790 IF Y>.5 THEN 1210 ELSE 1310
4800 REM RUNNERS ADVANCE ONE BASE, BATTER THROWN OUT
4810 N=1
4820 IF O=2 THEN 4850
4830 GOSUB 3540
4840 B(1)=0
4850 O=O+1
4860 PRINT "BATTER THROWN OUT"
4870 RETURN
4880 PRINT "HIT BATSMAN (OUCH!)"
4890 GOSUB 4950
4900 GOTO 710
4910 N=1
4920 GOSUB 3540
4930 B(1)=0
4940 RETURN
4950 REM BATTER WALKED
4960 FOR I=1 TO 3
4970 IF B(I)=0 THEN 5010
4980 NEXT I
4990 N=1
5000 GOTO 3540
5010 IF I=1 THEN 5050
5020 FOR I0=I TO 2 STEP -1
5030 B(I0)=B(I0-1)
5040 NEXT I0
5050 B(1)=1
5060 RETURN
5070 PRINT "WHEN YOUR'RE UP:"
5080 PRINT "1-BATTER TAKES PITCH"
5090 PRINT "2-BATTER SWINGS AWAY"
5100 PRINT "3-BATTER BUNTS"
5110 PRINT "4-LEAD RUNNER STEALS"
5120 REM PRINT "5-HIT AND RUN"
5130 RETURN
5140 REM PITCHING ROUTINE
5150 PRINT "YOUR PITCHER MAY THROW:"
5160 PRINT "1-FAST BALL"
5170 PRINT "2-CURVE"
5180 PRINT "3-SLIDER"
5190 PRINT "4-SINKER"
5200 PRINT "5-CHANGE-UP"
5210 PRINT "6-KNUCKLEBALL"
5220 PRINT "7-SCREWBALL"
5230 RETURN
5240 IF A=0 THEN 5370
5250 IF R9=1 THEN 5300
5260 PRINT "WHAT WILL YOUR PITCHER THROW";
5270 INPUT W
5280 IF W<0 THEN R9=1
5290 IF R9=0 THEN 5320 ELSE PRINT "RANDOM PITCHES FOR REST OF INNING"
5300 W=INT(RND(1)*8+1)
5310 IF W=8 THEN 5300
5320 IF W>0 AND W<8 THEN 5470
5330 PRINT "UH-UH, ";B$;".  ";
5340 GOSUB 5150
5350 PRINT
5360 GOTO 5260
5370 REM I MUST SELECT A PITCH
5380 W1=RND(1)
5390 W=1
5400 IF W1<.75 THEN W=2
5410 IF W1<.55 THEN W=3
5420 IF W1<.45 THEN W=4
5430 IF W1<.35 THEN W=5
5440 IF W1<.15 THEN W=6
5450 IF W1<.08 THEN W=7
5460 GOTO 5470
5470 PRINT W$(W);
5480 PRINT "...";
5490 RETURN
5500 REM HIT-AND-RUN
5510 IF B(1)+B(2)+B(3)=0 THEN 4490
5520 GOSUB 5240
5530 PRINT "HIT AND RUN!"
5540 C=5
5550 GOTO 1460
5560 DATA FAST BALL,CURVE BALL,SLIDER,SINKER,CHANGE-UP,KNUCKLEBALL
5570 DATA SCREWBALL
5580 DATA RIGHT,LEFT,CENTER,FIRST,SECOND,THIRD,SHORTSTOP,PITCHER,CATCHER
5590 DATA RIGHT OVER THE PLATE,CAUGHT THE OUTSIDE CORNER
5600 DATA OVER THE INSIDE CORNER,OVER AT THE KNEES
5610 DATA HIGH,LOW,INSIDE,OUTSIDE,HIGH AND TIGHT,LOW AND OUTSIDE
5620 DATA LOW AND INSIDE,HIGH AND OUTSIDE
5630 END
