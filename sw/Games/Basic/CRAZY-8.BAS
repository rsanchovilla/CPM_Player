1 REM Revised for Osborne 1 by Jim Woolley, FOG Librarian, 7/82
2 RANDOMIZE
100  REM SOURCE UNKNOWN:  REVISED BY D. KURLAND  11/16/75 
110 PRINT "THIS IS THE GAME OF CRAZY EIGHTS" 
120 DIM A(52),D(52),G(52),H(52) 
130 DIM T(52),S(52),V(52)   
140 DIM Z(52),U$(4),C$(13)  
150 READ U$(1),U$(2),U$(3),U$(4)
160 FOR I=1 TO 13   
170 READ C$(I)  
180 NEXT I  
190 FOR I=1 TO 52   
200 READ Z(I)   
210 NEXT I  
220 DATA CLUBS,DIAMONDS,HEARTS,SPADES   
230 DATA "2","3","4","5","6","7","8","9","10",JACK,QUEEN,KING,ACE   
240 DATA 2,3,4,5,6,7,50,9,10,10,10,10,1 
250 DATA 2,3,4,5,6,7,50,9,10,10,10,10,1 
260 DATA 2,3,4,5,6,7,50,9,10,10,10,10,1 
270 DATA 2,3,4,5,6,7,50,9,10,10,10,10,1 
280 PRINT "DO YOU KNOW HOW TO PLAY";
290 INPUT A$
300 IF A$="YES" OR A$="Y" THEN 400  
304 PRINT:PRINT
305 PRINT "YOU MUST FOLLOW SUIT OR MATCH FACE VALUE (EXAMPLE:  9 ON 9)."
310 PRINT "WHEN ASKED WHICH CARD YOU WISH TO PLAY, YOUR ANSWER SHOULD"  
320 PRINT "BE OF THE FORM:  CARD,SUIT  (EXAMPLE:  9,C).  ANY EIGHT MAY BE"
330 PRINT "PLAYED AT ANY TIME REGARDLESS OF SUIT TO CHANGE THE SUIT."   
340 PRINT "IF YOU ARE UNABLE OR UNWILLING TO PLAY, YOU WILL BE GIVEN"   
350 PRINT "ANOTHER CARD FROM THE DRAW STACK.  IF ALL CARDS HAVE BEEN"   
360 PRINT "DRAWN, ANY PERSON WHO IS ABLE TO PLAY MUST DO SO."   
370 PRINT "AT THE END OF THE GAME, THE PERSON HOLDING CARDS HAS POINTS" 
380 PRINT "SCORED AGAINST HIM AS FOLLOWS:  EIGHTS=50, ACE=1, FACE"  
390 PRINT "CARD=10, INDEX VALUE FOR EACH OTHER CARD."   
400 PRINT : PRINT "GAME WILL START SHORTLY..."
410 L=0 : FOR I=1 TO 4
420 FOR J=1 TO 13   
430 L=L+1   
440 S(L)=I  
450 V(L)=J  
460 NEXT J  
470 NEXT I  
480 N1=0
490 N2=0
500 N3=0
510 S1=0
520 S2=0
530 FOR I=1 TO 52   
540 G(I)=0  
550 H(I)=0  
560 A(I)=RND(1) 
570 NEXT I  
580 W1=0
590 B1=0
600 P1=1
610 P2=1
620 J=0 
630 M1=99999!
640 FOR I=1 TO 52   
650 IF A(I)>=M1 THEN 680
660 M1=A(I) 
670 I1=I
680 NEXT I  
690 J=J+1   
700 D(J)=I1 
710 A(I1)=99999! 
720 IF J<52 THEN 630
730 FOR I=1 TO 7
740 G(D(52-2*I+2))=1
750 H(D(52-2*I+1))=1
760 NEXT I  
770 T(1)=D(38)  
780 T1=1
790 P=S(T(1))   
800 H1=7
810 H2=7
820 D1=37   
830 GOSUB 1390  
840 GOSUB 1510  
850 IF W1=1 THEN 910
860 IF B1=1 THEN 910
870 GOSUB 2020  
880 IF W1=1 THEN 910
890 IF B1=1 THEN 910
900 GOTO 830
910 GOSUB 1140  
920 PRINT "YOUR SCORE IS";C1
930 PRINT "MY SCORE IS";C2  
940 IF C2>=C1 THEN 980  
950 PRINT "YOU WON THAT HAND."  
960 N1=N1+1 
970 GOTO 1000
980 PRINT "I WON THAT HAND."
990 N2=N2+1 
1000 PRINT   
1010 N3=N3+1 
1020 PRINT "DO YOU WISH TO PLAY AGAIN";  
1030 INPUT A$
1040 IF A$="YES" OR A$="Y" THEN 530  
1050 PRINT   
1060 PRINT "OUT OF";N3;"HANDS YOU WON";N1
1070 PRINT "YOUR TOTAL SCORE IS";S1;": MINE IS";S2;"."   
1080 IF S1<=S2 THEN 1110   
1090 PRINT "LOOKS LIKE YOU'RE HIGH SCORER."  
1100 GOTO 1120
1110 PRINT "LOOKS LIKE I AM THE HIGH SCORER."
1120 PRINT "BYE."
1130 STOP   
1140 C1=0   
1150 C2=0   
1160 IF H2=0 THEN 1240  
1170 PRINT  
1180 PRINT "CARDS LEFT IN MY HAND"  
1190 FOR I=1 TO 52  
1200 IF H(I)=0 THEN 1230
1210 PRINT C$(V(I));TAB(6);"OF ";U$(S(I))   
1220 C1=C1+Z(I) 
1230 NEXT I 
1240 IF H1=0 THEN 1360  
1250 FOR I=1 TO 52  
1260 IF G(I)=0 THEN 1280
1270 C2=C2+Z(I) 
1280 NEXT I 
1290 IF C1=0 THEN 1360  
1300 IF C1>=C2 THEN 1340
1310 C2=C2-C1   
1320 C1=0   
1330 GOTO 1360  
1340 C1=C1-C2   
1350 C2=0   
1360 S1=S1+C1   
1370 S2=S2+C2   
1380 RETURN 
1390 PRINT  
1400 PRINT "YOUR HAND IS"   
1410 FOR I=1 TO 52  
1420 IF G(I)=0 THEN 1440
1430 PRINT C$(V(I));TAB(6);"OF ";U$(S(I))   
1440 NEXT I 
1450 PRINT  
1460 PRINT "THE LAST CARD PLAYED WAS THE "; 
1470 PRINT C$(V(T(T1)));" OF ";U$(S(T(T1))) 
1480 IF V(T(T1))<>7 THEN 1500   
1490 PRINT "THE SUIT CALLED FOR IS ";U$(P)  
1500 RETURN 
1510 PRINT "DO YOU WISH TO PLAY A CARD";
1520 INPUT A$   
1530 AZ$=LEFT$(A$,1)
1531 IF AZ$<>"Y" AND AZ$<>"N" THEN PRINT "(Y OR N) PLEASE ! "; : GOTO 1520
1532 IF AZ$="Y" THEN 1630
1540 IF D1<>0 THEN 1570 
1550 PRINT "ALL THE CARDS HAVE BEEN DEALT---YOU ARE BLOCKED"
1560 GOTO 1980  
1570 I=D(D1)
1580 D1=D1-1
1590 H1=H1+1
1600 G(I)=1 
1610 PRINT "YOUR NEW CARD IS THE ";C$(V(I));" OF ";U$(S(I)) 
1620 GOTO 1510  
1630 PRINT "WHICH OF YOUR CARDS DO YOU WISH TO PLAY";   
1640 INPUT X$,Y$
1650 GOSUB 2610 
1660 IF V9>0 THEN 1680 ELSE PRINT "UNKNOWN CARD, TRY AGAIN";
1670 GOTO 1640 
1680 GOSUB 2500 
1690 IF S9>0 THEN 1710 ELSE PRINT "UNKNOWN SUIT, TRY AGAIN";
1700 GOTO 1640 
1710 IF V9=7 THEN 1760  
1720 IF S9=P THEN 1760  
1730 IF V9=V(T(T1)) THEN 1760   
1740 PRINT "THAT IS NOT A LEGAL PLAY."  
1750 GOTO 1510  
1760 FOR I=1 TO 52  
1770 IF G(I)=0 THEN 1800
1780 IF V(I)<>V9 THEN 1800  
1790 IF S(I)=S9 THEN 1830   
1800 NEXT I 
1810 PRINT "YOU DO NOT HAVE THAT CARD." 
1820 GOTO 1510  
1830 G(I)=0 
1840 H1=H1-1
1850 T1=T1+1
1860 T(T1)=I
1870 IF V9<>7 THEN 1930 
1880 PRINT "WHAT SUIT DO YOU WISH"; 
1890 INPUT Y$   
1900 GOSUB 2500 
1910 IF S9>0 THEN 1930 ELSE PRINT "UNKNOWN SUIT, TRY AGAIN";
1920 GOTO 1890 
1930 P=S9   
1940 P1=1   
1950 IF H1<>0 THEN 1970 
1960 W1=1   
1970 RETURN 
1980 IF P2<>0 THEN 2000 
1990 B1=1   
2000 P1=0   
2010 RETURN 
2020 I=53   
2030 I=I-1  
2040 IF H(I)=0 THEN 2080
2050 IF V(I)=7 THEN 2080
2060 IF S(I)=P THEN 2220
2070 IF V(I)=V(T(T1)) THEN 2220 
2080 IF I>1 THEN 2030   
2090 FOR I=1 TO 52  
2100 IF V(I)<>7 THEN 2120   
2110 IF H(I)<>0 THEN 2220   
2120 NEXT I 
2130 IF D1=0 THEN 2460  
2140 I=D(D1)
2150 D1=D1-1
2160 IF V(I)=7 THEN 2240
2170 IF S(I)=P THEN 2240
2180 IF V(I)=V(T(T1)) THEN 2240 
2190  H2=H2+1   
2200 H(I)=1 
2210 GOTO 2130  
2220 H(I)=0 
2230 H2=H2-1
2240 T1=T1+1
2250 T(T1)=I
2260 P=S(I) 
2270 IF V(I)<>7 THEN 2420   
2280 FOR J=1 TO 4   
2290 Y(J)=0 
2300 K1=13*(J-1)+1  
2310 K2=13*J
2320 FOR K=K1 TO K2 
2330 IF H(I)=0 THEN 2350
2340 Y(J)=Y(J)+1
2350 NEXT K 
2360 NEXT J 
2370 P=1
2380 FOR J=2 TO 4   
2390 IF Y(J)<=Y(P) THEN 2410
2400 P=J
2410 NEXT J 
2420 P2=1   
2430 IF H2<>0 THEN 2450 
2440 W1=1   
2450 RETURN 
2460 IF P1<>0 THEN 2480 
2470 B1=1   
2480 P2=0   
2490 RETURN 
2500 FOR I0 = 1 TO 4
2510 IF Y$=U$(I0) THEN 2590 
2520 NEXT I0
2530 S9 = 0 
2540 IF Y$="C" THEN S9=1
2550 IF Y$="D" THEN S9=2
2560 IF Y$="H" THEN S9=3
2570 IF Y$="S" THEN S9=4
2580 RETURN 
2590 S9 = I0
2600 RETURN 
2610 FOR I0 = 1 TO 13   
2620 IF X$=C$(I0) THEN 2700 
2630 NEXT I0
2640 V9 = 0 
2650 IF X$="J" THEN V9=10   
2660 IF X$="Q" THEN V9=11   
2670 IF X$="K" THEN V9=12   
2680 IF X$="A" THEN V9=13   
2690 RETURN 
2700 V9 = I0
2710 RETURN 
2720 END
THEN V9=11   
2670 IF X$="K" THEN V9=12   
2680 IF X$="A" THEN V9=13   
2690 RETURN 
2700 V9 = I