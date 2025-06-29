1 REM MODIFICATION OF ORIGINAL MONSTER PROGRAM OF KELLY SMITH AS 
2 REM PUBLISHED IN THE FIRST ISSUE OF THE PORTABLE COMPANION.
3 REM MODIFICATIONS BY JIM MCHUTCHION OF DETROIT FIRST OSBORNE GROUP
5 RANDOMIZE
10 PRINT CHR$(26)
20 PRINT"                        Smurf Adventure      "
30 PRINT"                                       "
32 PRINT:INPUT"Are you a Smurf(M) or a Smurfette(F)?";S$
33 IF LEFT$(S$,1)="F" THEN S$="Smurfette": GOTO 49
34 IF LEFT$(S$,1)<>"M" THEN S$="Papa Smurf":GOTO 49
35 I=INT(RND(1)*4+1):ON I GOTO 36,37,38,39,40
36 S$="Jokey Smurf":GOTO 49
37 S$="Brainy Smurf":GOTO 49
38 S$="Clumsy Smurf":GOTO 49
39 S$="Hefty Smurf":GOTO 49
40 S$="Astro Smurf":GOTO 49    
49 PRINT :PRINT"Hi ";S$:INPUT"Would you like instructions (Y,N)";X$
50 IF LEFT$(X$,1)="N" THEN GOTO 890        
60 PRINT:PRINT"In  the game of 'Smurf' you try to gather"             
70 PRINT"treasure from various crafty, wily enemies and leave"
80 PRINT"the  forest  with  as much treasure  as  possible  - "
90 PRINT"without getting captured in  the  process!   At  the "
100 PRINT"beginning,  you  are  placed  at a  randomly  chosen "
110 PRINT"location in a forest with a certain number of magic"
120 PRINT"strength  points.   As you move through the  forest, "
130 PRINT"you will encounter your enemies guarding various"
140 PRINT"tempting treasures."
150 INPUT"Press RETURN to continue",X$:PRINT CHR$(26)
160 PRINT"At  each meeting you are given a choice of  fighting "
170 PRINT"the enemy, running from it, or bribing it.  If you "
180 PRINT"wish  to fight you will be asked to enter the number "
190 PRINT"of magical points you wish to use. Enter any number "
200 PRINT"smaller  than your present strength. Each  enemy"
210 PRINT"has its own magical strength.  These are as follows:"
220 PRINT
230 PRINT" 10 - Purple Fly"
240 PRINT" 20 - Pink Mouse"
250 PRINT" 30 - Green Smoof"
260 PRINT" 40 - Cave Troll"
270 PRINT" 50 - Mischevious little boy"
280 PRINT" 60 - Gargamel's Mother"
290 PRINT" 70 - polka dot dog"
300 PRINT" 80 - Azreal"
310 PRINT" 90 - Big Mouth"
320 PRINT"100 - Gargamel"
330 INPUT"Press RETURN to continue",X$:PRINT CHR$(26)
340 PRINT"If you enter a number equal to the enemies"
350 PRINT"strength,  you  have a 50-50 chance of defeating it.  "
360 PRINT"Entering  a higher number increases your chances  of "
370 PRINT"winning, while entering a smaller number lowers that "
380 PRINT"chance.   No matter how much strength you use, there "
390 PRINT"is a 1 in 1000 chance that the enemy may capture you "
400 PRINT"anyway!   Also, the more treasure you have, the more "
410 PRINT"strength  you need to use to achieve the  same  odds "
420 PRINT"against  the  enemy in combat.   If you choose  to "
430 PRINT"run,  your  chances of getting away from  an  enemy "
440 PRINT"successively decrease as each new enemies's strength "
450 PRINT"increases.   Thus  you  are more likely to get  away "
460 PRINT"from a Purple Fly than from Gargamel. "
470 INPUT"Press RETURN to continue",X$:PRINT CHR$(26)  
480 PRINT"If you succeed in running away,  you are placed in a "
490 PRINT"new  randomly selected square.   Not  getting  away "
500 PRINT"usually results in a battle.   Occaisionally,  while "
510 PRINT"you are running, the enemy will catch you - one of "
520 PRINT"the  risks of smurfing out.   Of course trying  to "
530 PRINT"bribe  your foe is an age old alternative to running "
540 PRINT"or fighting.   For this,  you must use the  treasure "
550 PRINT"you have won.  Whether or not you succeed depends on "
560 PRINT"the  value of the treasure the enemy is  guarding.  "
570 PRINT"The  more  its  value,  the  more you  must  pay  to "
580 PRINT"successfully  bribe your adversary.   If  the  bribe "
590 PRINT"fails, prepare to fight."
600 INPUT"Press RETURN to continue",X$:PRINT CHR$(26)
610 PRINT"Treasure values are:"
620 PRINT
630 PRINT" 10 - Ten Smurfy Spoons"
640 PRINT" 30 - Jeweled Rod"  
650 PRINT" 50 - Jar of Diamonds"
660 PRINT" 50 - Vial of Papa Smurf Potion"
670 PRINT" 75 - Basket of Smurf-berries"
680 PRINT"100 - One Hundred Smurf Pies"
690 PRINT"200 - Treasure Chest"
700 INPUT"Press RETURN to continue",X$:PRINT CHR$(26)
710 PRINT"Movement through the forest is easy:  just enter the "
720 PRINT"direction you wish to go - N for North, SE for South "
730 PRINT"East,  etc.   The  option  to reset the  display  is "
740 PRINT"included  (  press 1 ) in case the previous play  of "
750 PRINT"the game caused too many lines of text to be printed "
760 PRINT"below  the map.   The map will be reprinted and  the "
770 PRINT"display cleared.  Your position will be displayed on "
780 PRINT"the  map,  as well as the location of trees  in  the "
790 PRINT"forest.   You  must go around the trees.   To leave, "
800 PRINT"simply  move to any blank area adjacent to the  edge "
810 PRINT"of  the  map.   Scores of 500 to  700  are  average.  "
820 PRINT"Anything  above 1000 is excellent.   As is common to "
830 PRINT"games  of this type,   I have left out a  number  of "
840 PRINT"things  that you will have to find out for  yourself "
850 PRINT"(Papa Smurf has to have  some  fun,  after "
860 PRINT"all).  Good luck and good hunting!"
870 INPUT"Press RETURN to continue",X$:PRINT CHR$(26)
890 PRINT CHR$(26)
910 ' OSBORNE I TERMINAL COMMANDS
920 E$=CHR$(27):'        ESCAPE CHARACTER
930 CLS$=CHR$(26):'      CLEAR SCREEN
940 DC$=E$+"=":'         DIRECT CURSOR ADDRESSING
950 GY$=E$+"g":'         Graphics On
960 GN$=E$+"G":'         GRAPHICS OFF
970 HO$=E$+CHR$(1):'     CURSOR HOME
980 EP$=E$+"T":'         ERASE TO END OF LINE
990 DY$=E$+")":'         DIM DISPLAY ON
1000 DN$=E$+"(":'        DIM DISPLAY OFF
1010 UY$=E$+"l":'        START UNDERLINING
1020 UN$=E$+"m":'        END UNDERLINING
1060 CH$(0)=DY$+CHR$(13)+CHR$(13)+DN$:' FIELD CHARACTER (BORDER)
1070 CH$(1)=DY$+CHR$(13)+CHR$(13)+DN$:' FIELD CHARACTER (FIELD)
1080 CH$(2)=CHR$(10)+CHR$(8):'  TREE
1085 CH$(3)=CHR$(6)+CHR$(6):'   YOUR TRAIL
1090 CH$(5)=CHR$(4)+CHR$(1):'   YOUR POSITION
1100 FOR I=1 TO 9:FOR J=1 TO 9:A(I,J)=1:IF RND(1)>.75 THEN A(I,J)=2 
1110 NEXT J,I
1120 X=INT(RND(1)*6+2):Y=INT(RND(1)*6+2)
1130 A(X,Y)=5:C=INT(RND(1)*1501+500)
1140 GOSUB 2080
1150 PRINT "Your strength is ";UY$;C;UN$:GOSUB 1390:IF I>11 THEN 1150
1160 IF M=0 THEN PRINT "You get the treasure free!":GOTO 1630
1170 IF M=100 AND N=1 THEN 2070
1180 PRINT GN$;"Do you want to (F)ight, (R)un, or (B)ribe? "
1190 Z9$=INPUT$(1):IF Z9$<>"F"AND Z9$<>"R" AND Z9$<>"B" GOTO 1190
1200 IF Z9$="F" GOTO 1210 ELSE IF Z9$="R" GOTO 1300 ELSE IF Z9$="B" GOTO 1770 ELSE GOTO 1180
1210 INPUT "How much magic do you wish to use";K
1215 IF K=0 THEN GOTO 10
1220  IF K>C THEN GOSUB 1760:PRINT UY$;C;UN$;"magic points":GOTO 
1230 I=INT(RND(1)*1001):L=2:C=C-K:K=K-.01*Q
1240 FOR H=1000 TO 0 STEP-50:IF L*M<=K AND H>=I THEN 1610
1250 L=L-.1:NEXT
1260 PRINT "The enemy captured you, and you lose everything."
1270 PRINT "Do you want to try again ";S$;"?";
1280 Z$=INPUT$(1):PRINT CHR$(26):IF Z$="Y" THEN RANDOMIZE C:C=0:Q=0:GOTO 1080
1290 PRINT:PRINT "So long for now. Better luck next time!":END
1300 PRINT CHR$(26):I=INT(RND(1)*12):IF I=11 THEN 1260
1310 FOR H=0 TO 10:IF H*10>M AND H<=I THEN 1330
1320 NEXT:GOTO 1840
1330 A=X:B=Y
1340 X=INT(RND(1)*3-1)+A:Y=INT(RND(1)*3-1)+B
1350 IF A(X,Y)>1 THEN 1340
1360 IF A(X,Y)=0 THEN 2130
1370 A(A,B)=3:A(X,Y)=5:IF I<>12 THEN 1140
1380 RETURN
1390 I=INT(RND(1)*18+1):M=I*10
1400 ON I GOTO 1410,1420,1430,1440,1450,1460,1470,1480,1490,1500,1510,1920,1850,2110,2150,2150,2150,2150
1410 PRINT "A purple fly";:GOTO 1520
1420 PRINT "A pink mouse";:GOTO 1520
1430 PRINT "A green Smoof";:GOTO 1520
1440 PRINT "A cave troll";:GOTO 1520
1450 PRINT "A mischevious little boy";:GOTO 1520
1460 PRINT "Gargamel's mother";:GOTO 1520
1470 PRINT "A polka dot dog";:GOTO 1520
1480 PRINT "Azreal";:GOTO 1520
1490 PRINT "Big Mouth";:GOTO 1520
1500 PRINT "Gargamel";:GOTO 1520
1510 PRINT "Nothing";:M=0
1520 PRINT " is guarding ":I=INT(RND(1)*7+1)
1530 ON I GOTO 1540,1550,1560,1570,1580,1590,1600
1540 PRINT "ten Smurfy spoons":P=10:RETURN
1550 PRINT "a jeweled rod":P=30:RETURN
1560 PRINT "a jar of diamonds":P=50:RETURN
1570 PRINT "a treasure chest":P=200:RETURN
1580 PRINT "vial of Papa Smurf potion":P=50:RETURN
1590 PRINT "100 Smurfy pies":P=100:RETURN
1600 PRINT "a basket of Smurf-berries":P=75:RETURN
1610 PRINT "You outwitted the enemy!"
1620 S=S+1
1630 Q=Q+P
1640 IF P=30 THEN GOSUB 1970
1650 IF P=200 THEN GOSUB 2000:GOSUB 2040
1660 PRINT "You have ";UY$;Q;UN$;" treasure points"
1670 X$="":A=X:B=Y:INPUT"What direction (Hit '1' to re-display)";X$:PRINT CHR$(26):IF X$="" GOTO 1670
1680 IF X$="1" THEN PRINT CLS$:GOSUB 2080:GOTO 1670
1690 IF RIGHT$(X$,1)="W" THEN X=X-1
1700 IF RIGHT$(X$,1)="E" THEN X=X+1
1710 IF LEFT$(X$,1)="N" THEN Y=Y-1
1720 IF LEFT$(X$,1)="S" THEN Y=Y+1
1730 IF A(X,Y)=0 THEN 2130
1740 IF A(X,Y)=2 THEN PRINT CHR$(7);"Oops...You ran into a tree!":X=A:Y=B:GOTO 1670
1745 IF A(X,Y)=3 THEN PRINT CHR$(7);"Havn't we been here before?":X=A:Y=B:GOTO 1670
1750 A(A,B)=3:A(X,Y)=5:GOTO 1140
1760 PRINT "You only have";:RETURN
1770 INPUT"How much do you want to pay";K
1775 IF K=0 THEN GOTO 1830
1780 IF K>Q THEN GOSUB 1760:PRINT UY$;Q;UN$;" treasure points":GOTO 1770
1790 I=INT(RND(1)*22):L=0:IF I=21 OR K<1 THEN 1260
1800 FOR H=0 TO 20:IF K<=L*P AND I>=H THEN 1830
1810 L=L+.1:NEXT
1820 PRINT"Your bribe was accepted.";:Q=Q-K:GOTO 1660
1830 PRINT"Your bribe was rejected.";
1840 PRINT"You must fight":GOTO 1210
1850 PRINT CHR$(7)
1860 PRINT"The GUARDIAN of the forest captured you, took half"
1870 PRINT"your treasure, and then took you to a new location"
1880 PRINT"in the forest...tough luck!"
1890 Q=Q/2:A=X:B=Y:FOR I9=1 TO 4000:NEXT
1900 X=INT(RND(1)*7+2):Y=INT(RND(1)*7+2):IF A(X,Y)<>1 THEN 1900
1910 A(A,B)=1:A(X,Y)=5:PRINT CHR$(26):GOSUB 2080:I=13:RETURN
1920 J=INT(RND(1)*20+1):C=C-J
1930 PRINT "You fell into a pit and used ";UY$;J;UN$;   
1940 PRINT "magic points to climb out..."
1950 IF C<0 THEN PRINT "...but you were captured while climbing out!":GOTO 1270 
1960 GOTO 1670
1970 IF RND(1)<.5 OR C>3000 THEN RETURN 
1980 PRINT "The rod was enchanted and doubles your strength!"
1990 C=C*2:RETURN 
2000 I=INT(RND(1)*10):IF I <> 7 THEN RETURN
2010 PRINT "Sorry, but the chest was a trap...."
2020 PRINT "You were captured when you opened it!"
2030 GOTO 1270
2040 PRINT CHR$(27);"L"
2050 PRINT "A mirror was in the chest..."
2060 PRINT "It will scare Gargamel if you meet him":N=1:RETURN
2070 PRINT "Your mirror scared Gargamel and he ran away":GOTO 1620
2080 GOSUB 2170:PRINT HO$:FOR I=0 TO 10:PRINT TAB(15);:FOR J=0 TO 10
2090 PRINT GY$;CH$(A(J,I));
2100 NEXT J:PRINT GN$:NEXT I:PRINT EP$;GN$:RETURN
2110 IF S<5 THEN 1390
2120 PRINT "A giant eagle carried you to safety"
2130 PRINT:PRINT "You survived the forest"
2135 PRINT "You miserable ";S$;"! I'll get you one day!"
2140 PRINT "You won a treasure total of ";UY$;Q;UN$:PRINT "Congratulations":PRINT "Would you like to play again? ";:GOTO 1280
2150 PRINT "How much farther, Papa Smurf?":GOTO 1660
2160 END
2170 PRINT CLS$,DC$;" '";GY$;CH$(5);GN$;" = Your location";
2180 PRINT DC$;CHR$(34);"'";GY$;CH$(2);GN$;" = Tree";
2190 PRINT DC$;"$'";GY$;CH$(0);GN$;" = field"
2200 PRINT DC$;CHR$(34);"5";"NW N NE"
2210 PRINT DC$;"#7";DY$;GY$;CHR$(25);CHR$(13);CHR$(21);GN$;DN$;
2220 PRINT DC$;"$5";"W ";DY$;GY$;CHR$(13);CHR$(13);CHR$(13);GN$;DN$;" E";
2230 PRINT DC$;"%7";DY$;GY$;CHR$(8);CHR$(13);CHR$(10);GN$;DN$
2240 PRINT DC$;"&5";"SW S SE";
2250 RETURN
