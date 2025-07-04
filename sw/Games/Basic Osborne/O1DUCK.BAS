10 ' WIPE$ homes the cursor and clears the screen
20 ' CUR$ (followed by string X and Y values) puts the
30 ' cursor at X,Y. NOLINE$ erases from the cursor to
40 ' the end of the line. GREY$ begins half-intensity
50 ' display; WHT$ restores full intensity. LEAF$ and
60 ' TRUNK$ each hold a whole line's worth of graphic
70 ' herbiage; DIRT$ holds a line's worth of graphic 
80 ''dirt'(maybe its really grass?)
90 '
100 WIPE$=CHR$(26):CUR$=CHR$(27)+"=":LEAF$="":TRUNK$=""
110 NOLINE$=CHR$(&H1B)+CHR$(&H54):GREY$=CHR$(27)+")"
120 WHT$=CHR$(27)+"("
130 FOR I=1 TO 25:LEAF$=LEAF$+CHR$(141)+" ":NEXT I
140 FOR I=1 TO 25:TRUNK$=TRUNK$+CHR$(139)+" ":NEXT I
150 FOR I=1 TO 50:DIRT$=DIRT$+CHR$(150):NEXT I
160 WALL$=" "+CHR$(150)+CHR$(150)+CHR$(150)+CHR$(150)
170 FEN$=" "+CHR$(128)+CHR$(128)+CHR$(128)+CHR$(128)
180 ROOF$=CHR$(138)+CHR$(136)+CHR$(138)+CHR$(136)
190 PRINT WIPE$
200 PRINT:PRINT:PRINT TAB(25)"DUCK"
210 PRINT:PRINT:PRINT
220 INPUT"        Do you want instructions (Y/N)?  ",I$
230 IF I$="N" OR I$="n" GOTO 440
240 PRINT WIPE$;
250 PRINT"The object of the game is to make the most points"
260 PRINT"shooting ducks without getting divebombed or blown"
270 PRINT"up. Shot ducks score from 10 to 50 points, depen-"
280 PRINT"ding on the angle of the shot. A duck shot directly"
290 PRINT"overhead (key 5) only scores 10 points, but ducks"
300 PRINT"shot on the steepest angles (keys 1 or 9) score 50"
310 PRINT"points. Only four consecutive shots from the same"
320 PRINT"angle are allowed. If you miss, the duck may bomb"
330 PRINT"you or your protecting trees. If more than five"
340 PRINT"trees are lost from either side of your blind,"
350 PRINT"you are liable to be divebombed from that side. You"
360 PRINT"can survive if your ammunition is not hit. The duck"
370 PRINT"can also hit your ammunition with a bomb from di-"
380 PRINT"rectly overhead."
385 PRINT
390 PRINT"Five bonus points are scored for each surviving"
400 PRINT"tree as long as at least one duck was hit.  20"
410 PRINT"points are scored for trees that survive through"
420 PRINT"an entire game, but no bonus points are scored if"
430 PRINT"no ducks were hit."
440 PRINT:PRINT TAB(16);"Press any key to begin."
450 A$=INKEY$:IF A$<>"" THEN GOTO 490
460 ROLL=ROLL+1
470 IF ROLL > 32767 THEN ROLL = -32768!
480 GOTO 450
490 RANDOMIZE ROLL
500 DIM L(22)
510 FOR Y= 1 TO 22:READ L(Y):NEXT Y
520 PRINT WIPE$
530 M=0:N=0:Q=11:Z=11:V=0:P=0:H=0:S=0:T=0:A$="":C2=0
540 D=INT(RND(1)*4)
550 PRINT CUR$;CHR$(55);" ";
560 PRINT GREY$;LEAF$:PRINT TRUNK$:PRINT DIRT$:PRINT DIRT$
570 PRINT WHT$;
580 PRINT CUR$;CHR$(52);CHR$(54);WALL$;
590 PRINT CUR$;CHR$(51);CHR$(54);FEN$;
600 PRINT CUR$;CHR$(50);CHR$(55);ROOF$;
610 PRINT CUR$;" ";CHR$(33);"FIRE AT ANGLE 1 TO 9"
620 X=0
630 FOR Y= 0 TO 52 STEP 1
640 PRINT CUR$;CHR$(33+X);CHR$(32+Y);"  ";
650 PRINT CHR$(152);CHR$(136)
660 IF X<18 GOTO 690
670 IF X=18 AND Y=23 THEN X=0:Y=0:GOTO 630
680 IF X=19 AND Y = 23 GOTO 1420
690 A$=INKEY$:IF VAL(A$)=0 GOTO 870
700 IF VAL(A$)=H THEN C2=C2+1
710 IF VAL(A$)<>H AND VAL(A$)>0 THEN C2=0
720 IF C2>3 GOTO 870
730 H=VAL(A$)
740 V=V+1
750 PRINT CUR$;"  ";100-V;"Bullets remaining  "
760 A=6*VAL(A$)-30
770 S=X:T=Y
780 FOR X=0 TO -16 STEP-1
790 PRINT CUR$;CHR$(49+X);CHR$(57+INT(A*ABS(X)/10));"*"
800 PRINT CUR$;CHR$(49+X);CHR$(57+INT(A*ABS(X)/10));" "
810 IF S<>X+16 GOTO 840
820 IF T=INT(22+A*ABS(X)/10) OR T=INT(23+A*ABS(X)/10) THEN GOTO 1180
830 IF V= 100 GOTO 1430
840 NEXT X
850 GOSUB 1250
860 X=S:Y=T
870 NEXT Y
880 PRINT CUR$;CHR$(33+X);CHR$(86);"  ";
890 X=INT(RND(1)*(15+N))
900 FOR Y=52 TO 0 STEP-1
910 PRINT CUR$;CHR$(33+X);CHR$(32+Y);CHR$(138);CHR$(152);
920 PRINT "  "
930 IF X<18 GOTO 960
940 IF X=18 AND Y=23 THEN X=0:Y=0:GOTO 630
950 IF X=19 AND Y=23 GOTO 1420
960 A$=INKEY$:IF VAL(A$)=0 GOTO 1140
970 IF VAL(A$)=H THEN C2=C2+1
980 IF VAL(A$)<>H AND VAL(A$)>0 THEN C2=0
990 IF C2>3 GOTO 1140
1000 H=VAL(A$)
1010 V=V+1
1020 PRINT CUR$;"  ";100-V;"Bullets remaining  "
1030 A=6*VAL(A$)-30
1040 S=X:T=Y
1050 FOR X=0 TO -16 STEP-1
1060 PRINT CUR$;CHR$(49+X);CHR$(57+INT(A*ABS(X)/10));"*"
1070 PRINT CUR$;CHR$(49+X);CHR$(57+INT(A*ABS(X)/10));" "
1080 IF S<>X+16 GOTO 1110
1090 IF T= INT(25+A*ABS(X)/10) OR T=INT(24+A*ABS(X)/10) THEN GOTO 1180
1100 IF V=100 GOTO 1430
1110 NEXT X
1120 GOSUB 1250
1130 X=S:Y=T
1140 NEXT Y
1150 PRINT CUR$;CHR$(X+33);"    ";
1160 X=INT(RND(1)*(15+C))
1170 GOTO 630
1180 PRINT CHR$(7);
1190 P=P+ABS(VAL(A$)-5)*10+10
1200 PRINT CUR$;" ";CHR$(69);P;"Points";
1210 IF V=100 GOTO 1430
1220 PRINT CUR$;CHR$(33+S);" ";NOLINE$;
1230 X=0:Y=0
1240 GOTO 630
1250 W=INT(RND(1)*3)
1260 IF W=>1 THEN RETURN
1270 FOR M=0 TO 19-S STEP 1
1280 FOR E= 1 TO 20:NEXT E
1290 PRINT CUR$;CHR$(34+M+S);CHR$(34+T);CHR$(141)
1300 PRINT CUR$;CHR$(34+M+S);CHR$(34+T);" "
1310 IF T=D+21 AND M=19-S THEN GOSUB 1420
1320 NEXT M
1330 FOR B= 1 TO 22
1340 IF L(B)= T+2 THEN L(B)=-1:GOTO 1370
1350 NEXT B
1360 GOTO 1410
1370 IF T+2<21 THEN Q=Q-1
1380 IF T+2>27 THEN Z=Z-1
1390 IF Q<7 THEN C=5:PRINT CUR$;" ";CHR$(59);"DUCK ! "
1400 IF Z<7 THEN N=5:PRINT CUR$;" ";CHR$(59);"DUCK !"
1410 RETURN
1420 GOSUB 1590
1430 FOR I=32 TO 49:PRINT CUR$;CHR$(I);" ";NOLINE$:NEXT I
1440 PRINT CHR$(&H1E);
1450 PRINT TAB(23);"GAME OVER"
1460 PRINT:PRINT:PRINT:
1470 IF P=0 THEN 1480 ELSE 1500
1480 PRINT TAB(10)"YOU BOMBED OUT -- NO POINTS SCORED"
1490 GOTO 1550
1500 IF V=100 THEN BONUS=20 ELSE BONUS=5
1510 PRINT TAB(10)" You had";Q+Z;"trees remaining worth"
1520 PRINT:PRINT TAB(17);(Q+Z)*BONUS; "bonus points."
1530 PRINT:PRINT TAB(13);" Your score was";P+(Q+Z)*BONUS;"points."
1540 DATA 0,2,4,6,8,10,12,14,16,18,20,28,30,32,34,36,38,40,42,44,46,48
1550 FOR I=1 TO 4:PRINT:NEXT I
1560 PRINT TAB(12);:INPUT"    Try it again (Y/N)?  ",AGAIN$
1570 IF AGAIN$="Y" THEN A$=INKEY$:RESTORE:GOTO 510
1580 END
1590 FOR G=0 TO 21
1600 PRINT CUR$;CHR$(53);CHR$(54+G);" "
1610 PRINT CUR$;CHR$(53);CHR$(58-G);" "
1620 PRINT CUR$;CHR$(54);CHR$(54+G/2);" "
1630 PRINT CUR$;CHR$(54);CHR$(58-G/2);" "
1640 PRINT CUR$;CHR$(51-G);CHR$(55);"    "
1650 PRINT CUR$;CHR$(50-G);CHR$(55);ROOF$
1660 PRINT CUR$;CHR$(52-G);CHR$(56-G);" "
1670 PRINT CUR$;CHR$(51-G);CHR$(55-G);CHR$(128)
1680 PRINT CUR$;CHR$(52-G);CHR$(56+G);"  "
1690 PRINT CUR$;CHR$(51-G);CHR$(57+G);CHR$(128);CHR$(128)
1700 PRINT CUR$;CHR$(53-G);CHR$(56+G/2);"  "
1710 PRINT CUR$;CHR$(52-G);CHR$(57+G/2);CHR$(150)
1720 PRINT CUR$;CHR$(51);CHR$(58-G);" "
1730 PRINT CUR$;CHR$(52);CHR$(55-G);CHR$(150);" "
1740 PRINT CUR$;CHR$(51);CHR$(51+G);" "
1750 PRINT CUR$;CHR$(52);CHR$(57+G);" ";CHR$(159)
1760 NEXT G
1770 RETURN
50);" "
1740 PRINT CUR$;CHR$(51);CHR$(51+G);" "
1750 PRINT CUR$;CHR$(52);CHR$(57+G);" ";CHR$(159)
1760 