                                        100 REM  THIS PROGRAM WAS WRITTEN BY JAMES MCGILL
110 DIM C(1,20) 
120 LET C(1,5)=5
130 LET C(1,10)=5   
140 LET C(1,15)=5   
150 LET C(1,20)=5
160 DIM A(35,35)
170 FOR C=0 TO 4
180 FOR B=5*C+1 TO 5*C+4
190 LET A(B,B+1)=1  
200 IF C=4 GOTO 220
210 LET A(B,B+5)=1  
220 NEXT B   
230 NEXT C  
240 FOR K=1 TO 4 
250 LET A(5*K,5*K+5)=1  
260 NEXT K  
270 LET R=0 
280 LET M=0 
290 LET N=0  
300  LET S=0
310 LET W=0 
320 LET X=0 
330 LET Y=0 
340 LETZ=0  
350 LET U=0 
360 LET V=0 
370 DIM B$(81)  
380 FOR A=1 TO 73 STEP 18   
390 FOR B=A TO (A+8) STEP 2 
400 LET B$(B)= "*"  
410 NEXT B  
420 NEXT A  
430 FOR A=2 TO 74 STEP 18   
440 FOR B=A TO (A+6) STEP 2 
450 LET B$(B)=" "   
460 NEXT B  
470 NEXT A  
480 FOR A=10 TO  64 STEP 18 
490 FOR B=A TO A+8  
500 LET B$(B)=" "   
510 NEXT B  
520 NEXT A  
530 PRINT"DO YOU KNOW HOW TO PLAY"; 
540 INPUT B$
550 IF B$="YES" GOTO 700   
560 PRINT"THIS IS THE GAME OF DOTS.WE WILL USE A 5 BY 5"
570 PRINT"ARRAY OF DOTS.YOU MAKE YOUR MOVE BY MAKING A" 
580 PRINT"HORIZONTAL OR VERTICAL LINE BETWEEN TWO"  
590 PRINT"CONSECUTIVE DOTS.EACH DOT HAS A PAIR OF"  
600 PRINT"COORDINATES.THE TOP LEFT DOT IS 1,1.THE LOWER"
610 PRINT"LEFT DOT IS 5,1.THE UPPER RIGHT DOT IS 1,5"
620 PRINT"AND THE LOWER RIGHT DOT IS 5,5.YOU MOVE BY"   
630 PRINT"TYPING IN THE COORDINATES OF THE TWO DOTS"
640 PRINT"TO BE CONNECTED.THEREFORE,YOU WILL ALWAYS"
650 PRINT "TYPE IN FOUR NUMBERS OF THE FORM W,X,Y,Z."   
660 PRINT"ALWAYS TYPE IN THE COORDINATES OF THE UPPER"  
670 PRINT"OR LEFTMOST DOT FIRST.THE GAME BOARD LOOKS"   
680 PRINT"LIKE THIS."   
690 GOSUB 3150  
700 PRINT "WHAT ARE YOUR VALUES OF W,X,Y,Z.";   
710 INPUT W,X,Y,Z   
720 GOSUB 1200  
730 LET N=N+S   
740 IF S=0 GOTO 830
750 IF R>=40 GOTO 1050 
760 LET S=0 
770 PRINT"YOU SCORED!!!"
780 PRINT"THE SCORE IS" 
790 PRINT"YOU...";N 
800 PRINT"ME....";M 
810 GOSUB 3150  
820 GOTO 970   
830 PRINT"YOU DID NOT SCORE.MY TURN"
840 GOSUB 2240  
850 LET M=M+S   
860 IF S=0 GOTO 990   
870 IF R>=40 GOTO 1050 
880 LET S=0 
890 PRINT"MY MOVE IS";W;X;Y;Z   
900 PRINT"I SCORED!!!"  
910 GOSUB 3150  
920 PRINT"THE SCORE IS" 
930 PRINT"YOU....";N
940 PRINT"ME.....";M
950 PRINT"I GET ANOTHER TURN"   
960 GOTO 840   
970 PRINT"YOU GET ANOTHER TURN" 
980 GOTO 710   
990 IF R>=40 GOTO 1050
1000 PRINT"MY MOVE IS";W;X;Y;Z  
1010 GOSUB 3150 
1020 PRINT"I DID NOT SCORE" 
1030 PRINT"YOUR TURN"   
1040 GOTO 710  
1050 PRINT"ALL MOVES HAVE BEEN MADE.THE GAME IS OVER"   
1060 PRINT"THE FINAL SCORE IS"  
1070 PRINT"YOU...";N
1080 PRINT"ME....";M
1090 IF M<N GOTO 1130  
1100 IF M=N GOTO 1150  
1110 PRINT"AS USUAL,I AM VICTORIOUS"
1120 GOTO  1160
1130 PRINT"DON'T ASK ME HOW, BUT YOU WON"   
1140 GOTO 1160 
1150 PRINT"WELL, IT LOOKS LIKE A TIE GAME"  
1160 PRINT"DO YOU WANT TO PLAY ANOTHER GAME";   
1170 INPUT A$   
1180 IF A$="YES" GOTO 700  
1190 STOP   
1200 IF W>Y GOTO 1320  
1210 IF X>Z GOTO 1320  
1220 IF W=Y GOTO 1260  
1230 IF X<>Z GOTO 1370 
1240 IF Y <>W+1 GOTO 1400  
1250 GOTO 1270 
1260 IF Z<>X+1 GOTO 1400   
1270 IF(ABS(W))/(INT(W))<>1 GOTO 1290  
1280 GOTO 1430 
1290 PRINT"ILLEGAL MOVE.PLEASE USE POSITIVE INTEGERS LESS THAN 6"   
1300 GOTO 1340 
1310 GOTO 1430 
1320 PRINT"ILLEGAL MOVE.PLEASE TYPE IN  THE COORDINATES OF "
1330 PRINT"THE UPPERMOST OR LEFTMOST DOT FIRST" 
1340 PRINT"TRY AGAIN. WHAT ARE YOUR VALUES FOR W,X,Y,Z";
1350 INPUT W,X,Y,Z  
1360 GOTO 1200 
1370 PRINT"ILLEGAL MOVE.ONLY HORIZONTAL AND VERTICAL MOVES" 
1380 PRINT"ARE ALLOWED" 
1390 GOTO 1340 
1400 PRINT"ILLEGAL MOVE.YOU MAY ONLY CONNECT CONSECUTIVE DOTS"  
1410 PRINT"NO SKIPPING OVER DOTS"   
1420 GOTO 1340 
1430 LET U=(W-1)*5+X
1440 LET V=(Y-1)*5+Z
1450 IF A(U,V) =1 GOTO 1480
1460 PRINT"ILLEGAL MOVE.THAT MOVE HAS ALREADY BEEN USED"
1470 GOTO 1340 
1480 PRINT"LEGAL MOVE"  
1490 GOSUB 1510 
1500 RETURN 
1510 IF X=Z GOTO 1730  
1520 IF V/5>1 GOTO 1570
1530 LET C(1,U)=C(1,U)+1
1540 IF C(1,U)<>4 GOTO 1560
1550 LET S=S+1  
1560 GOTO 1950 
1570 IF V/5<4.1 GOTO 1630  
1580 LET P=U-5  
1590 LET C(1,P)=C(1,P)+1
1600 IF C(1,P)<>4 GOTO 1620 
1610 LET S=S+1  
1620 GOTO 1950 
1630 LET C(1,U)=C(1,U)+1
1640 LET P=U-5  
1650 LET C(1,P)=C(1,P)+1
1660 IF C(1,U)<> 4 GOTO 1700   
1670 IF C(1,P)<>4 GOTO 1710
1680 LET S=S+2  
1690 GOTO 1950 
1700 IF C(1,P)<>4 GOTO 1720
1710 LET S=S+1  
1720 GOTO 1950 
1730 LET Q=V-1  
1740 IF (INT(Q/5))*5<>Q GOTO 1790  
1750 LET C(1,U)=C(1,U)+1
1760 IF C(1,U)<>4 GOTO 1780
1770 LET S=S+1  
1780 GOTO 1990 
1790 IF (INT(V/5))*5<>V GOTO 1850   
1800 LET T=U-1  
1810 LET C(1,T)=C(1,T)+1
1820 IF C(1,T)<>4 GOTO 1840
1830 LET S=S+1  
1840 GOTO 1990 
1850 LET T =U-1 
1860 LET C(1,U)=C(1,U)+1
1870 LET C(1,T)=C(1,T)+1
1880 IF C(1,U)<>4 GOTO 1920
1890 IF C(1,T)<> 4 GOTO 1930   
1900 LET S=S+2  
1910 GOTO 1990 
1920 IF C(1,T)<>4 GOTO 1990
1930 LET S=S+1  
1940 GOTO 1990 
1950 LET F=2*W-1
1960 LET G=2*X  
1970 GOSUB 3220 
1980 GOTO 2020 
1990 LET H= 2*W 
2000 LET J=2*X-1
2010 GOSUB 3250 
2020 LET A(U,V)=0   
2030 LET R=R+1  
2040 LET U=0
2050 LET V=0
2060 LET P=0
2070 LET Q=0
2080 LET T=0
2090 LET F=0
2100 LET G=0
2110 LET H=0
2120 LET J=0
2130 RETURN 
2140 IF A(24,25)=1 GOTO 2160   
2150 GOTO 2210 
2160 LET W=5
2170 LET X=4
2180 LET Y=5
2190 LET Z=5
2200 GOTO 3070 
2210 FOR I=19 TO 1 STEP -1  
2220 IF C(1,I)<4 GOTO 2670 
2230 NEXT I 
2240 FOR I=1 TO 20  
2250 IF C(1,I)=3 GOTO 2670 
2260 NEXT I 
2270 GOTO 2320 
2280 IF A(I+1,I+6)=1 GOTO 2690 
2290 GOTO 2460 
2300 IF A(I+5,I+6)=1 GOTO 2680 
2310 GOTO 2490 
2320 FOR I=1 TO 20  
2330 IF C(1,I)=0 GOTO 2400 
2340 GOTO 2490 
2350 IF I<2 GOTO 2400  
2360 IF C(1,I-1)=0 GOTO2390
2370 IF C(1,I-1)=1 GOTO 2390   
2380 GOTO 2400 
2390 IF A(I,I+5)=1 GOTO 2710   
2400 IF I<6 GOTO 2430  
2410 IF C(1,I-5)=0 GOTO 2430
2420 IF C(1,I-5)<>1 GOTO 2440  
2430 IF A(I,I+1)=1 GOTO 2700
2440 IF C(1,I+1)=0 GOTO 2280   
2450 IF C(1,I+1)=1 GOTO 2280   
2460 IF I>15 GOTO 2490 
2470 IF C(1,I+5)=0 GOTO 2300   
2480 IF C(1,I+5)=1 GOTO 2300   
2490 NEXT I 
2500 FOR I=1 TO 20  
2510 IF C(1,I)=1 GOTO 2530 
2520 GOTO 2630 
2530 IF I<2 GOTO 2590  
2540 IF C(1,I-1)=1 GOTO 2560
2550 GOTO 2570 
2560 IF A(I,I+5)=1 GOTO 2710   
2570 IF I<6 GOTO 2590  
2580 IF C(1,I-5)<> 1 GOTO 2600 
2590 IF A(I,I+1)=1 GOTO 2700
2600 IF C(1,I+1)=1 GOTO 2280
2610 IF I>15 GOTO 2630 
2620 IF C(1,I+5)=1 GOTO 2300
2630 NEXT I 
2640 IF A(1,2)=1 GOTO 2730 
2650 IF A(1,6)=1 GOTO 2760 
2660 IF A(2,7)=1 GOTO 2790 
2670 IF I=20  GOTO 2700
2680 IF A(I+5,I+6)=1 GOTO 2880 
2690 IF A(I+1,I+6)=1 GOTO 2920 
2700 IF A(I,I+1)=1 GOTO 2820   
2710 IF A(I,I+5)=1 GOTO 2960   
2720 GOTO 2140 
2730 LET W=1
2740 LET X=1
2750 GOTO 3020 
2760 LET W=1
2770 LET X=1
2780 GOTO 3050 
2790 LET W=1
2800 LET X=2
2810 GOTO 3050 
2820 LET W=INT((I+4)/5) 
2830 LET X=I-(5*(W-1))  
2840 GOTO 3020 
2850 LET W=INT((I+3)/5) 
2860 LET X=I-(5*(W-1))  
2870 GOTO 3020 
2880 LET I=I+5  
2890 LET W= INT((I+4)/5)
2900 LET X=I-(5*(W-1))  
2910 GOTO 3020 
2920 LET I=I+1  
2930 LET W=INT((I+4)/5) 
2940 LET X=I-(5*(W-1))  
2950 GOTO 3050 
2960 LET W=INT((I+4)/5)  
2970 LET X=I-(5*(W-1))  
2980 GOTO 3050 
2990 LET W=INT((I-1)/5) 
3000 LET X=I-(5*(W-1))  
3010 GOTO 3050 
3020 LET Y=W
3030 LET Z=X+1  
3040 GOTO 3070 
3050 LET Y=W+1  
3060 LET Z=X
3070 LET U=(W-1)*5+X
3080 LET V=(Y-1)*5+Z
3090 LET A=W 
3100 LET B=X
3110 LET C=Y
3120 LET D=Z 
3130 GOSUB 1510 
3140 RETURN 
3150 FOR I=1 TO 81 STEP 9   
3160 FOR J=I TO (I+8)   
3170 PRINT B$(J);   
3180 NEXT J 
3190 PRINT  
3200 NEXT I 
3210 RETURN 
3220 LET U1=(F-1)*9+G   
3230 LET B$(U1)="-" 
3240 GOTO 3270 
3250 LET U2=(H-1)*9+J   
3260 LET B$(U2)="I" 
3270 RETURN 
3280 END 
