     rem This is the Payroll Check Tab Entry Program
%INCLUDE ALL.BAS
     dim n(2,20),k$(6,30)
     z5$="b:ept":z6$=z5$+"back"
     repeat$="--------------------------------"
     fill$="                                 "
     RESTORE
540 K$(0,1)="1 - ENTER TABS":K$(0,2)="2 - EXAMINE TABS"
550 K$(0,3)="3 - MODIFY TABS"
570 K$(0,4)="4 - CREATE NEW FILE":K$(0,5)="5 - CLEAR EXISTING FILE"
590 K$(0,6)="6 - FINISHED"
     print clear$:print
1100 K$(1,1)="LS TO DATE LINE":K$(1,2)="TAB TO DATE"
1105 K$(1,3)="LS TO AMOUNT LINE"
1110 K$(1,4)="TAB TO AMOUNT":K$(1,5)="TAB TO $"
1115 K$(1,6)="LS TO PAY TO LINE"
1120 K$(1,7)="TAB TO PAY TO"
1125 K$(1,8)="LS TO SUMMARY LINE"
1130 K$(1,9)="DATE TAB"
1135 K$(1,10)="NAME TAB"
1140 K$(1,11)="SOC SEC TAB"
1145 K$(1,12)="GROSS TAB"
1150 K$(1,13)="DEDUCTION TAB"
1155 K$(1,14)="NET TAB"
1160 K$(1,15)="LS TO CURRENT BREAKDOWN"
1165 K$(1,16)="LS TO Y-T-D BREAKDOWN"
1170 K$(1,17)="DATE TAB"
1172 K$(1,18)="HOURS TAB":K$(1,19)="RATE TAB":K$(1,20)="1ST GROSS TAB"
1174 K$(1,21)="2ND GROSS TAB":K$(1,22)="FICA TAB":K$(1,23)="FIT TAB"
1176 K$(1,24)="SIT TAB":K$(1,25)="SDI TAB":K$(1,26)="MISC TAB"
1178 K$(1,27)="NET TAB"
1180 K$(1,28)="LS TO NEXT CHECK"
1200 K$(2,1)="1 - LS TO DATE LINE":K$(2,2)="2 - TAB TO DATE"
1205 K$(2,3)="3 - LS TO AMOUNT LINE"
1210 K$(2,4)="4 - TAB TO AMOUNT":K$(2,5)="5 - TAB TO $"
1215 K$(2,6)="6 - LS TO PAY TO LINE"
1220 K$(2,7)="7 - TAB TO PAY TO"
1225 K$(2,8)="8 - LS TO SUMMARY LINE"
1230 K$(2,9)="9 - DATE TAB"
1235 K$(2,10)="10- NAME TAB"
1240 K$(2,11)="11- SOC SEC TAB"
1245 K$(2,12)="12- GROSS TAB"
1250 K$(2,13)="13- DEDUCTION TAB"
1255 K$(2,14)="14- NET TAB"
1260 K$(2,15)="15- LS TO CURRENT BREAKDOWN"
1265 K$(2,16)="16- LS TO Y-T-D BREAKDOWN"
1270 K$(2,17)="17- DATE TAB"
1272 K$(2,18)="18- HOURS TAB":K$(2,19)="19- RATE TAB"
1273 K$(2,20)="20- 1ST GROSS TAB"
1274 K$(2,21)="21- 2ND GROSS TAB":K$(2,22)="22- FICA TAB"
1275 K$(2,23)="23- FIT TAB"
1276 K$(2,24)="24- SIT TAB":K$(2,25)="25- SDI TAB":K$(2,26)="26- MISC TAB"
1278 K$(2,27)="27- NET TAB":K$(2,28)="28- LS TO NEXT CHECK"
1279 K$(2,29)="29- NONE"
1300 FOR Z=1 TO 30:N(1,Z)=3:NEXT Z
     if end #1 then 6000
1500 open z5$ as 1
     close 1
1510 Z1=1:Z2=1
1600 PRINT clear$
1605 PRINT
1650 PRINT "THIS IS A LIST OF OPERATIONS."
1655 PRINT
1660 FOR Z=1 TO 6:PRINT K$(0,Z):NEXT Z:PRINT
1665 PRINT "INDICATE WHAT YOU WOULD LIKE TO DO BY TYPING"
1670 PRINT "THE CORRESPONDING NUMBER."
1675 PRINT
1680 INPUT Z
	IF Z<1 OR Z>6 then 1600
1685 ON Z GOSUB 2000,3000,4000,6000,7000,10000
1690 FOR Z=1 TO 30:T%(Z)=0:NEXT Z:N$=""
1705 GOTO 1600
2000 PRINT clear$:PRINT
2005 PRINT "TABS ARE USED IN ALL PAYROLL CHECK PRINTOUTS. A"
2010 PRINT "TEST SHOULD BE MADE BY RUNNING PAYROLL CHECKS TO"
2015 PRINT "ENSURE THAT TABS ARE CORRECTLY SET."
2025 PRINT
2040 FOR Z=1 TO 28
	PRINT CUR$
2045 PRINT TAB(30);left$(repeat$,n(1,z))
	PRINT UP$;
2050 PRINT K$(1,Z);TAB(30);
2055 INPUT T%(Z):PRINT chr$(13)
	PRINT CLEAR$
2060 NEXT Z
2105 PRINT clear$:PRINT
2110 T$="###"
2115 FOR Z=1 TO 14
2120 PRINT K$(2,Z);TAB(30);:print using t$;t%(z)
2125 NEXT Z
2126 PRINT:INPUT "TO EXAMINE REMAINING TAB SETTINGS - PRESS RETURN ";line temp$
2130 FOR Z=15 TO 29
2135 PRINT K$(2,Z);TAB(30);:print using t$;t%(z)
2140 NEXT Z
2145 PRINT
2150 PRINT "IF AN ITEM IS TO BE CHANGED, TYPE THE APPROPRIATE NUMBER."
2155 PRINT:INPUT Z
2160 PRINT
2165 IF Z>28 THEN 2225
2170 IF Z<1 THEN 2105
2180 PRINT TAB(30);left$(repeat$,n(1,z))
	PRINT UP$;
2185 PRINT K$(1,Z);TAB(30);
2190 INPUT T%(Z)
2225 INPUT "ANY MORE CHANGES";line temp$
2230 IF left$(temp$,1)="y" OR left$(temp$,1)="Y" THEN 2105
2235 PRINT
2240 INPUT "IS RECORD TO BE ENTERED";line temp$
2245 PRINT
2250 IF left$(temp$,1)="y" OR left$(temp$,1)="Y" THEN 2280
2255 IF left$(temp$,1)<>"n" AND left$(temp$,1)<>"N" THEN 2235
2260 PRINT clear$:PRINT
2270 PRINT "*** RECORD NOT ENTERED ***":PRINT:PRINT
2275 FOR Z=1 TO 200:NEXT Z:RETURN
2280 open z5$ as 1
     print #1;t%(1),t%(2),t%(3),t%(4),t%(5),t%(6),t%(7),t%(8),\
	  t%(9),t%(10),t%(11),t%(12),t%(13),t%(14),t%(15),t%(16),\
	  t%(17),t%(18),t%(19),t%(20),t%(21),t%(22),t%(23),t%(24),\
	  t%(25),t%(26),t%(27),t%(28)
     close 1
2300 RETURN
3000 PRINT clear$:PRINT
3010 open z5$ as 1
     read #1;t%(1),t%(2),t%(3),t%(4),t%(5),t%(6),t%(7),t%(8),\
	  t%(9),t%(10),t%(11),t%(12),t%(13),t%(14),t%(15),t%(16),\
	  t%(17),t%(18),t%(19),t%(20),t%(21),t%(22),t%(23),t%(24),\
	  t%(25),t%(26),t%(27),t%(28)
     close 1
3030 PRINT
	PRINT "Should this be a 'hard-copy' listing (Y or N)?"
	INPUT LINE LIST$
	IF LIST$="y" OR LIST$="Y" THEN LPRINTER
3031 T$="###"
3035 FOR Z=1 TO 14
3040 PRINT K$(1,Z);TAB(30);:print using t$;t%(z)
3045 NEXT Z
	IF LIST$="y" OR LIST$="Y" THEN 3050
3047 PRINT:INPUT "TO EXAMINE REMAINING TABS - PRESS RETURN ";line temp$
3050 FOR Z=15 TO 28
3055 PRINT K$(1,Z);TAB(30);:print using t$;t%(z)
3060 NEXT Z
	PRINT CHR$(13) 
	CONSOLE
3070 PRINT
3080 PRINT "IF FINISHED, TYPE F - RETURN.":PRINT
3085 INPUT line temp$
3095 RETURN
4000 PRINT clear$:PRINT
4010 open z5$ as 1
     read #1;t%(1),t%(2),t%(3),t%(4),t%(5),t%(6),t%(7),t%(8),\
	  t%(9),t%(10),t%(11),t%(12),t%(13),t%(14),t%(15),t%(16),\
	  t%(17),t%(18),t%(19),t%(20),t%(21),t%(22),t%(23),t%(24),\
	  t%(25),t%(26),t%(27),t%(28)
     close 1
4070 GOTO 2105
6000 PRINT clear$:PRINT
6005 PRINT "IF YOU HAVE ARRIVED HERE, AND HAVE A TABS FILE"
6010 PRINT "ALREADY ON A DISK, YOU SHOULD INSTALL THAT DISK THEN"
6015 PRINT "TYPE THE LETTER C FOLLOWED BY A RETURN TO CONTINUE."
6020 PRINT
6025 PRINT "IF YOU WISH TO CREATE A NEW FILE, TYPE THE LETTER N"
6030 PRINT "FOLLOWED BY RETURN.":PRINT
6035 INPUT line temp$
6040 IF temp$="c" OR temp$="C" THEN INITIALIZE:GOTO 1500
6045 PRINT clear$:PRINT
6050 create z5$ as 1
     print #1;t%(1),t%(2),t%(3),t%(4),t%(5),t%(6),t%(7),t%(8),\
	  t%(9),t%(10),t%(11),t%(12),t%(13),t%(14),t%(15),t%(16),\
	  t%(17),t%(18),t%(19),t%(20),t%(21),t%(22),t%(23),t%(24),\
	  t%(25),t%(26),t%(27),t%(28)
     close 1
6095 PRINT clear$:PRINT
6100 PRINT "TABS FILE CREATED AND CLEARED.":PRINT
6110 PRINT "TO CONTINUE, TYPE RETURN.":INPUT line temp$
6115 GOTO 1600
7000 INPUT "ARE YOU SURE !!! (YES OR NO)";line temp$
7007 IF temp$<>"YES" THEN RETURN
7010 open z5$ as 1
     print #1;t%(1),t%(2),t%(3),t%(4),t%(5),t%(6),t%(7),t%(8),\
	  t%(9),t%(10),t%(11),t%(12),t%(13),t%(14),t%(15),t%(16),\
	  t%(17),t%(18),t%(19),t%(20),t%(21),t%(22),t%(23),t%(24),\
	  t%(25),t%(26),t%(27),t%(28)
     close 1
7035 PRINT clear$:PRINT
7040 PRINT "TABS FILE CLEARED!":PRINT
7045 PRINT "TO CONTINUE, TYPE RETURN."
7050 INPUT line temp$
7060 RETURN
10000 CHAIN "MASTER15"
