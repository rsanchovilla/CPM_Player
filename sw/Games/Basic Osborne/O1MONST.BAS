1 REM  Typed manually by Dan Woolley from the first
2 REM  issue of Portable Companion
10 PRINT CHR$(26)
20 PRINT "             Wizard of OsZ - 'MONSTER'"
30 PRINT "            (c) 1982, by Wizard of OsZ"
40 PRINT:PRINT:INPUT "Do you require instructions (Y or N)";X$
50 IF LEFT$(X$,1)="N" THEN GOTO 890
60 PRINT:PRINT "  In  the  game  of 'Monster',  you attempt to  gain"
70 PRINT "treasure  from  loathsome  creatures and  leave  the"
80 PRINT "forest  with as much treasure as possible  - without"
90 PRINT "getting killed in the process! At the beginning, you"
100 PRINT "are placed at a randomly chosen location in a forest"
110 PRINT "with a certain number of combat strength points.  As"
120 PRINT "you  move  through the forest,  you  will  encounter"
130 PRINT "monsters guarding various tempting treasures."
150 PRINT:INPUT "Press RETURN to continue.",X$:PRINT CHR$(26) 
160 PRINT "  At each meeting you are given a choice of fighting"
170 PRINT "the monster,  running from it, or bribing it. If you"
180 PRINT "wish to fight, you will be asked to enter the number"
190 PRINT "of combat points you wish to use.  Enter any  number"
200 PRINT "smaller than your present strength. Each monster has"
210 PRINT "its own combat strength. These are as follows:"
230 PRINT
240 PRINT "Minotaur - 10"
250 PRINT "Cyclops  - 20"
260 PRINT "Zombie   - 30"
270 PRINT "Giant    - 40"
280 PRINT "Harpy    - 50"
290 PRINT "Griffin  - 60"
300 PRINT "Chimera  - 70"
310 PRINT "Dragon   - 80"
320 PRINT "Wyvern   - 90"
330 PRINT "Baslisk  - 100"
340 PRINT:INPUT "Press RETURN to continue.",X$:PRINT CHR$(26) 
350 PRINT "  If  you  enter  a  number equal  to  the  monsters"
360 PRINT "strength,  you have a 50-50 chance of defeating  it."
370 PRINT "Entering  a higher number increases your chances  of"
380 PRINT "winning, while entering a smaller number lowers that"
390 PRINT "chance.  No matter how much strength you use,  there"
400 PRINT "is a 1 in 1000 chance that the monster will kill you" 
410 PRINT "anyway.  Also,  the more treasure you have, the more"
420 PRINT "strength  you need to achieve the same odds  against"
430 PRINT "the  monster in combat.  If you choose to run,  your"
440 PRINT "chances of getting away from a monster  successively"
450 PRINT "decrease  as each new monster's strength  increases."
460 PRINT "Thus you are more likely to get away from a Minotaur"
470 PRINT "than from a Baslisk."
480 PRINT:INPUT "Press RETURN to continue.",X$:PRINT CHR$(26)
490 PRINT "  If you succeed in running away,  you are placed in"
500 PRINT "a  new  randomly selected square.  Not getting  away"
510 PRINT "usually results in a battle. Occasionally, while you"
520 PRINT "are running, the monster will catch you - one of the"
530 PRINT "risks of chickening out.  Of course trying to  bribe"
540 PRINT "your  foe  is an age old alternative to  running  or"
550 PRINT "fighting.  For  this,  you must use the treasure you"
560 PRINT "have won.  Whether or not you succeed depends on the"
570 PRINT "value of the treasure the monster is  gaurding.  The"
580 PRINT "more its value,  the more you must pay to bribe your"
590 PRINT "adversary. If the bribe fails, prepare to fight."
610 PRINT:INPUT "Press RETURN to continue.",X$:PRINT CHR$(26)
620 PRINT "Treasure values are:"
630 PRINT 
640 PRINT "Ten silver spoons       - 10"
650 PRINT "Jeweled Sword           - 30"
660 PRINT "Jar of Rubies           - 50"
670 PRINT "Fifty Silver Coins      - 50"
680 PRINT "Box of Jewels           - 70"
690 PRINT "One Hundred Gold Pieces - 100"
700 PRINT "Treasure Chest          - 200"
710 PRINT:INPUT "Press RETURN to continue.",X$:PRINT CHR$(26)
720 PRINT "  Movement  through the forest is easy:  just  enter"
730 PRINT "the  direction you wish to go - N for North,  SE for"
740 PRINT "South East,  etc. The option to reset the display is"
750 PRINT "included (press 1) in case the previous play of  the"
760 PRINT "game  caused  to  many lines of text to  be  printed"
770 PRINT "below  the map.  The map will be reprinted  and  the"
780 PRINT "display cleared.  Your position will be displayed on"
790 PRINT "the  map,  as  well as the location of trees in  the"
800 PRINT "forest.  You  must go around the  trees.  To  leave,"
810 PRINT "simply  move to any blank area adjacent to the  edge"
820 PRINT "of the map.  Scores of 500 to 700 are average.  Any-"
830 PRINT "thing above 1000 is excellent. As is common to games"
840 PRINT "of this type, I have left out a number of things you"
850 PRINT "will  have to find out for yourself .  Good luck and"
860 PRINT "good hunting!"
870 PRINT:INPUT "Press RETURN to continue.",X$:PRINT CHR$(26)
890 PRINT CHR$(26)
900 RANDOMIZE
910 ' OSBORNE I TERMINAL COMMANDS
920 E$=CHR$(27):'	ESCAPE CHARACTER
930 CLS$=CHR$(26):'	CLEAR SCREEN
940 DC$=E$+"=":'	DIRECT CURSOR ADDRESSING
950 GY$=E$+"g":'	GRAPHICS ON
960 GN$=E$+"G":'	GRAPHICS OFF
970 HO$=E$+CHR$(1):'	CURSOR HOME
980 EP$=E$+"T":'	ERASE TO END OF LINE
990 DY$=E$+")":'	DIM DISPLAY ON
1000 DN$=E$+"(":'	DIM DISPLAY OFF
1010 UY$=E$+"l":'	START UNDERLINING
1020 UN$=E$+"m":'	END UNDERLINING
1050 DIM A(10,10):PRINT CLS$
1060 CH$(0)=DY$+CHR$(13)+CHR$(13)+DN$:'	FIELD CHARACTER (BORDER)
1070 CH$(1)=DY$+CHR$(13)+CHR$(13)+DN$:'	FIELD CHARACTER (FIELD)
1080 CH$(2)=CHR$(10)+CHR$(8):'		TREE
1090 CH$(5)=CHR$(4)+CHR$(1):'		YOUR POSITION
1100 FOR I=1 TO 9:FOR J=1 TO 9:A(I,J)=1:IF RND(1)>.75 THEN A(I,J)=2
1110 NEXT J,I
1120 X=INT(RND(1)*6+2):Y=INT(RND(1)*6+2)
1130 A(X,Y)=5:C=INT(RND(1)*1501+500)
1140 GOSUB 2080
1150 PRINT "Your strength is ";UY$;C;UN$:GOSUB 1390:IF I>11 THEN 1150
1160 IF M=0 THEN PRINT "***You get the treasure free!***";CHR$(7):GOTO 1630
1170 IF M=100 AND N=1 THEN 2070
1180 PRINT GN$;"Do you want to (F)ight, (R)un, or (B)ribe? "
1190 Z9$=INPUT$(1):IF Z9$<>"F" AND Z9$<>"R" AND Z9$<>"B" THEN 1190
1200 IF Z9$="F" THEN 1210 ELSE IF Z9$="R" THEN 1300 ELSE IF Z9$="B" THEN 1770 ELSE GOTO 1180
1210 INPUT "How many combat points do you wish to use?  ",K
1220 IF K>C THEN GOSUB 1760:PRINT UY$;C;UN$;"Combat points":GOTO 1210
1230 I=INT(RND(1)*1001):L=2:C=C-K:K=K-.01*Q
1240 FOR H=1000 TO 0 STEP -50:IF L*M<=K AND H>=1 THEN 1610
1250 L=L-.1:NEXT
1260 PRINT "***The monster killed you! You lose everything!***"
1270 PRINT:PRINT:PRINT "Do you want to try again?";
1280 Z$=INPUT$(1):PRINT CHR$(26):IF Z$="Y" THEN RANDOMIZE C:C=0:Q=0:GOTO 1080
1290 PRINT:PRINT:PRINT "So long for now. Better luck next time!":END
1300 PRINT CHR$(26):I=INT(RND(1)*12):IF I=11 THEN 1260
1310 FOR H=0 TO 10:IF H*10>M AND H<=I THEN 1330
1320 NEXT:GOTO 1840
1330 A=X:B=Y
1340 X=INT(RND(I)*3-1)+A:Y=INT(RND(I)*3-1)+B
1350 IF A(X,Y)>1 THEN 1340
1360 IF A(X,Y)=0 THEN 2130
1370 A(A,B)=1:A(X,Y)=5:IF I<>12 THEN 1140
1380 RETURN
1390 I=INT(RND(1)*18+1):M=I*10:IF I<11 THEN PRINT "A ";
1400 ON I GOTO 1410,1420,1430,1440,1450,1460,1470,1480,1490,1500,1510,1920,1850,2110,2150,2150,2150,2150
1410 PRINT "Minotaur";:GOTO 1520
1420 PRINT "Cyclops";:GOTO 1520
1430 PRINT "Zombie";:GOTO 1520
1440 PRINT "Giant";:GOTO 1520
1450 PRINT "Harpy";:GOTO 1520
1460 PRINT "Griffin";:GOTO 1520
1470 PRINT "Chimera";:GOTO 1520
1480 PRINT "Dragon";:GOTO 1520
1490 PRINT "Wyvern";:GOTO 1520
1500 PRINT "Baslisk";:GOTO 1520
1510 PRINT "Nothing";:M=0
1520 PRINT " is guarding ";:I=INT(RND(1)*7+1)
1530 ON I GOTO 1540,1550,1560,1570,1580,1590,1600
1540 PRINT "Ten Silver Spoons":P=10:RETURN
1550 PRINT "a Jeweled Sword":P=30:RETURN
1560 PRINT "a Jar of Rubies":P=50:RETURN
1570 PRINT "a Treasure Chest":P=200:RETURN
1580 PRINT "Fifty Silver Coins":P=50:RETURN
1590 PRINT "100 Gold Pieces":P=100:RETURN
1600 PRINT "a Box of Jewels":P=75:RETURN
1610 PRINT:PRINT  "***You beat the monster!***";CHR$(7)       
1620 S=S+1
1630 Q=Q+P
1640 IF P=30 THEN GOSUB 1970
1650 IF P=200 THEN GOSUB 2000:GOSUB 2040
1660 PRINT "You have ";UY$;Q;UN$;" treasure points."
1670 X$="":A=X:B=Y:PRINT:INPUT "What direction ?  (Hit '1' to re-display)  ",X$:PRINT CHR$(26):IF X$="" GOTO 1670
1680 IF X$="1" THEN PRINT CLS$:GOSUB 2080:GOTO 1670
1690 IF RIGHT$(X$,1)="W" THEN X=X-1
1700 IF RIGHT$(X$,1)="E" THEN X=X+1
1710 IF LEFT$(X$,1) ="N" THEN Y=Y-1
1720 IF LEFT$(X$,1) ="S" THEN Y=Y+1
1730 IF A(X,Y)=0 THEN 2130
1740 IF A(X,Y)=2 THEN PRINT "***Oops.....You ran into a tree!***":X=A:Y=B:GOTO 1670
1750 A(A,B)=1:A(X,Y)=5:GOTO 1140
1760 PRINT "You only have";:RETURN
1770 INPUT "How much do you want to pay";K
1780 IF K>Q THEN GOSUB 1760:PRINT UY$;Q;UN$;" treasure points":GOTO 1770
1790 I=INT(RND(1)*22):L=0:IF I=21 OR K<1 THEN 1260
1800 FOR H=0 TO 20:IF K<=L*P AND I>=H THEN 1830
1810 L=L+.1:NEXT
1820 PRINT "***Your bribe was accepted***";:Q=Q-K:GOTO 1660
1830 PRINT "***Your bribe was not accepted***";
1840 PRINT "***You must fight***":GOTO 1210
1850 '             
1860 PRINT "***The guardian of the forest captured you,took half"
1870 PRINT "your treasure,  and the took you to a new location
1880 PRINT "somewhere in the forest.....tough luck!***"
1890 Q=Q/2:A=X:B=Y:FOR I9=1 TO 4000:NEXT
1900 X=INT(RND(1)*7+2):Y=INT(RND(1)*7+2):IF A(X,Y)<>1 THEN 1900
1910 A(A,B)=1:A(X,Y)=5:PRINT CHR$(26):GOSUB 2080:I=13:RETURN
1920 J=INT(RND(1)*20+1):C=C-J
1930 PRINT "***You fell into a pit and used ";UY$;J;UN$
1940 PRINT "combat points to climb out....."
1950 IF C<0 THEN PRINT ".....but you died while climbing out!***":GOTO 1270
1960 GOTO 1330
1970 IF RND(1)<.5 OR C>3000 THEN RETURN
1980 PRINT "***The sword was enchanted and doubles your strength!***"
1990 C=C*2:RETURN
2000 I=INT(RND(1)*10):IF I<>7 THEN RETURN
2010 PRINT "LOOK OUT!!! The chest explodes when you open it!"
2020 PRINT "You fail to survive the massive explosion."
2030 GOTO 1270
2040 PRINT "___________________________________________________"
2050 PRINT "There is a mirror in the chest....."
2060 PRINT "It will kill any Baslisks you meet!":N=1:RETURN
2070 PRINT "Your mirror killed the Basilisk!":GOTO 1620
2080 GOSUB 2170:PRINT HO$:FOR I=0 TO 10:PRINT TAB(15);:FOR J=0 TO 10
2090 PRINT GY$;CH$(A(J,I));
2100 NEXT J:PRINT GN$:NEXT I:PRINT EP$;GN$:RETURN
2110 IF S<5 THEN 1390
2120 PRINT "A giant eagle carried you away to safety!"
2130 PRINT:PRINT "You survived the forest!"
2140 PRINT "You won a treasure total of ";UY$;Q;UN$:PRINT "Congratulations!":PRINT "Would you like to play again?";:GOTO 1280
2150 PRINT "There is nothing to be found here.":GOTO 1660
2160 END
2170 PRINT DC$;" '";GY$;CH$(5);GN$;" = Your location";
2180 PRINT DC$;CHR$(34);"'";GY$;CH$(2);GN$;" = Tree";
2190 PRINT DC$;"$'";GY$;CH$(0);GN$" = Field"
2200 PRINT DC$;CHR$(34);"5";"NW N NE"
2210 PRINT DC$;"#7";DY$;GY$;CHR$(25);CHR$(13);CHR$(21);GN$;DN$;
2220 PRINT DC$;"$5";"W ";DY$;GY$;CHR$(13);CHR$(13);CHR$(13);GN$;DN$;" E";
2230 PRINT DC$;"%7";DY$;GY$;CHR$(8);CHR$(13);CHR$(10);GN$;DN$;
2240 PRINT DC$;"&5";"SW S SE";
2250 RETURN
