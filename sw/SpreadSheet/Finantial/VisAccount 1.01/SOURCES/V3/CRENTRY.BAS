     rem This is the Customer Information Entry Program
%INCLUDE ALL.BAS
     dim n(2,20),k$(6,20)
     z5$="b:cr":z6$=z5$+"back":z7$=z5$+"size"
     repeat$="--------------------------------"
     fill$="                                "
     delim$="":for z=1 to 72:delim$=delim$+"=":delim1$=delim1$+"*":next z
     l$="##,###,###.##"
     RESTORE
540 K$(6,1)="1 - NEW ENTRY":K$(6,2)="2 - EXAMINE EXISTING ENTRY"
550 K$(6,3)="3 - MODIFY EXISTING ENTRY"
560 K$(6,4)="4 - DELETE EXISTING ENTRY"
570 K$(6,5)="5 - CREATE NEW FILE":K$(6,6)="6 - CLEAR EXISTING FILE"
580 K$(6,7)="7 - BACK-UP AND SORT FILE":K$(6,8)="8 - LIST FILE"
590 K$(6,9)="9 - FINISHED"
     print clear$:print
1100 K$(1,1)="TAG":K$(1,2)="ACCOUNT NUMBER":K$(1,3)="NAME (ATTENTION)"
1105 K$(1,4)="COMPANY":K$(1,5)="ADDRESS":K$(1,6)="CITY":K$(1,7)="STATE"
1110 K$(1,8)="ZIP CODE":K$(1,9)="PHONE (AAA) NNN NNNN"
1130 K$(1,10)="NAME (ATTENTION)":K$(1,11)="COMPANY":K$(1,12)="ADDRESS"
1135 K$(1,13)="CITY":K$(1,14)="STATE":K$(1,15)="ZIP CODE"
1140 K$(1,16)="PHONE (AAA) NNN NNNN"
1145 K$(1,17)="DATE OF LAST PMNT MM/DD/YY"
1150 K$(2,1)="AMOUNT OF LAST PAYMENT":K$(2,2)="TOTAL Y-TO-D PAYMENTS"
1155 K$(2,3)="CURRENT CHARGES":K$(2,4)="30-60 DAY CHARGES"
1160 K$(2,5)="61-90 DAY CHARGES":K$(2,6)="OVER 90 DAY CHARGES"
1165 K$(3,1)=" 1 - TAG":K$(3,2)=" 2 - ACCOUNT NO.":K$(3,3)=" 3 - NAME"
1170 K$(3,4)=" 4 - COMP":K$(3,5)=" 5 - ADDR":K$(3,6)=" 6 - CITY"
1175 K$(3,7)=" 7 - STA":K$(3,8)=" 8 - ZIP"
1180 K$(3,9)=" 9 - PHO"
1185 K$(3,10)="10 - NAME":K$(3,11)="11 - COMP":K$(3,12)="12 - ADDR"
1190 K$(3,13)="13 - CITY":K$(3,14)="14 - STA":K$(3,15)="15 - ZIP"
1195 K$(3,16)="16 - PHO"
1200 K$(3,17)="17 - DATE OF LAST PMNT"
1205 K$(4,1)="18 - AMOUNT OF LAST PAYMENT"
1210 K$(4,2)="19 - TOTAL Y-TO-D PAYMENTS"
1215 K$(4,3)="20 - CURRENT CHARGES":K$(4,4)="21 - 30-60 DAY CHARGES"
1220 K$(4,5)="22 - 61-90 DAY CHARGES":K$(4,6)="23 - OVER 90 DAY CHARGES"
1300 N(0,1)=4:N(0,2)=10:N(0,3)=24:N(0,4)=24:N(0,5)=24:N(0,6)=17
1305 N(0,7)=2:N(0,8)=5:N(0,9)=14:N(0,10)=24:N(0,11)=24:N(0,12)=24
1310 N(0,13)=17:N(0,14)=2:N(0,15)=5:N(0,16)=14:N(0,17)=8
1315 N(1,1)=12:N(1,2)=12:N(1,3)=12:N(1,4)=12:N(1,5)=12:N(1,6)=12
	print clear$:print

1500	if end #1 then 6000
	if end #2 then 15000
		open z5$ recl 384 as 1
		close 1
		open z7$ as 2
		read #2;z2,z3
		close 2

1600	REM
1620	PRINT CLEAR$
	if z2>z3 then print "*** OUT OF RECORD SPACE ***"
	PRINT "CUSTOMER INFORMATION ENTRY PROGRAM"
		PRINT	   "----------------------------------"
	PRINT:PRINT "THERE ARE ";Z3;" AVAILABLE RECORDS"
	PRINT "OF THESE THERE ARE:";TAB(30);(Z3-Z2)+1;" RECORDS OPEN"
	PRINT			   ;TAB(30);Z2-1;" RECORDS USED"
	PRINT

1650 PRINT "THIS IS A LIST OF OPERATIONS."
1655 PRINT
1660 FOR Z=1 TO 9:PRINT K$(6,Z):NEXT Z:PRINT
1665 PRINT "INDICATE WHAT YOU WOULD LIKE TO DO BY TYPING"
1670 PRINT "THE CORRESPONDING NUMBER."
1675 PRINT
1680 INPUT Z
	IF Z<1 OR Z>9 then 1620
1682 IF Z=1 THEN new$="N"
1685 ON Z GOSUB 2000,3000,4000,5000,6000,7000,8000,9000,10000
1690 FOR Z=1 TO 20:N(2,Z)=0:NEXT Z
1695 N$="":new$=""
1700 FOR Z=1 TO 20:K$(5,Z)="":NEXT Z
1705 GOTO 1600
2000 IF Z2>Z3 THEN RETURN
2001 PRINT CLEAR$:PRINT
2005 PRINT "RECORD NUMBER";z2:PRINT
2015 FOR Z=1 TO 2
	PRINT CUR$
2020 PRINT TAB(30);left$(repeat$,n(0,z))
	PRINT UP$;
2025 PRINT K$(1,Z);TAB(30);
2030 INPUT N(2,Z):PRINT chr$(13)
	PRINT CLEAR$
2035 NEXT Z
2040 FOR Z=3 TO 17
	PRINT CUR$
2045 PRINT TAB(30);left$(repeat$,n(0,z))
	PRINT UP$;
2050 PRINT K$(1,Z);TAB(30);
2055 INPUT line K$(5,Z):PRINT chr$(13)
	if len(k$(5,z))>n(0,z) then k$(5,z)=left$(k$(5,z),n(0,z))
2060 I=(N(0,Z)-LEN(K$(5,Z))):K$(5,Z)=K$(5,Z)+left$(fill$,i)
	PRINT CLEAR$
2065 NEXT Z
2066 N$=""
2070 FOR Z=3 TO 17:N$=N$+K$(5,Z):NEXT Z
2100 Z1=Z2
2105 PRINT clear$;
2110 PRINT "RECORD NUMBER";z1
2115 PRINT K$(3,1);TAB(11);N(2,1);TAB(40);K$(3,2);TAB(60);N(2,2)
2124 PRINT "SOLD TO";TAB(40);"SHIP TO"
2126 PRINT delim$
2128 FOR Z=3 TO 9
2130 PRINT K$(3,Z);TAB(11);K$(5,Z);TAB(40);K$(3,Z+7);TAB(50);K$(5,Z+7)
2132 NEXT Z
2134 Z=17:PRINT delim$
2136 PRINT K$(3,Z);TAB(40);K$(5,Z)
2141 FOR Z=18 TO 23:PRINT K$(4,Z-17);TAB(30);:print using l$;n(2,z-15):NEXT Z
2142 PRINT "24 - NONE"
2145 PRINT
2150 INPUT "IF AN ITEM IS TO BE CHANGED, TYPE THE NUMBER ";Z
2165 IF Z>23 THEN 2216
2170 IF Z<1 THEN 2105
2175 IF Z>2 AND Z<18 THEN 2200
2176 IF Z>17 THEN 2220
	CL=20:CC=50:GOSUB 50:PRINT CUR2$;
2180 PRINT left$(repeat$,n(0,z))
	CL=20:CC=50:GOSUB 50:PRINT CUR2$;
2185 PRINT K$(1,Z)
	CL=20:CC=48:GOSUB 50:PRINT CUR2$;
2190 INPUT N(2,Z)
2195 GOTO 2225
2200 CL=20:CC=50:GOSUB 50:PRINT CUR2$; :PRINT left$(repeat$,n(0,z))
	CL=20:CC=50:GOSUB 50:PRINT CUR2$;
2205 PRINT K$(1,Z)
	CL=20:CC=48:GOSUB 50:PRINT CUR2$;
2210 INPUT line K$(5,Z)
	if len(k$(5,z))>n(0,z) then k$(5,z)=left$(k$(5,z),n(0,z))
2215 I=(N(0,Z)-LEN(K$(5,Z))):K$(5,Z)=K$(5,Z)+left$(fill$,i)
2216 N$=""
2217 FOR I=3 TO 17:N$=N$+K$(5,I):NEXT I
2218 GOTO 2225
2220 CL=20:CC=50:GOSUB 50:PRINT CUR2$;
	PRINT left$(repeat$,n(1,z-17))
	CL=20:CC=50:GOSUB 50:PRINT CUR2$;
2221 PRINT K$(4,Z-17)
	CL=20:CC=48:GOSUB 50:PRINT CUR2$;
2222 INPUT N(2,Z-15)
2225 CL=22:CC=50:GOSUB 50:PRINT CUR2$;
	INPUT "ANY MORE CHANGES";line temp$
2230 IF left$(temp$,1)="y" OR left$(temp$,1)="Y" THEN 2105
2235	PRINT CUR2$;
2240 INPUT "IS RECORD TO BE ENTERED";line temp$
2245	REM
2250 IF left$(temp$,1)="y" OR left$(temp$,1)="Y" THEN 2280
2255 IF left$(temp$,1)<>"n" AND left$(temp$,1)<>"N" THEN 2235
2260 PRINT clear$:PRINT
2270 PRINT "*** RECORD NOT ENTERED ***":PRINT:PRINT
2275 FOR Z=1 TO 200:NEXT Z:RETURN
2280 open z5$ recl 384 as 1
     print #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
     close 1
2295 IF new$="N" THEN Z2=Z2+1:open z7$ as 1:print #1;z2,z3:close 1
2300 RETURN
3000 PRINT clear$:PRINT
3005 INPUT "RECORD NUMBER";Z1
3010 IF Z1>=Z2 THEN 3000
3012 IF Z1<1 THEN RETURN
3020 open z5$ recl 384 as 1
     read #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
     close 1
3022 Z9=1:FOR Z=3 TO 17:K$(5,Z)=MID$(N$,Z9,N(0,Z)):Z9=Z9+N(0,Z):NEXT Z
3030 PRINT MID$(K$(3,1),6,30);TAB(11);N(2,1);TAB(40);MID$(K$(3,2),6,30);
3032 PRINT TAB(55);N(2,2)
3034 PRINT "SOLD TO";TAB(40);"SHIP TO"
3036 PRINT delim$
3038 FOR Z=3 TO 9
3040 PRINT MID$(K$(3,Z),6,30);TAB(11);K$(5,Z);TAB(40);MID$(K$(3,Z+7),6,30);
3042 PRINT TAB(50);K$(5,Z+7)
3044 NEXT Z
3046 Z=17:PRINT delim$
3048 PRINT MID$(K$(3,Z),6,30);TAB(40);K$(5,Z)
3050 FOR Z=18 TO 23:PRINT MID$(K$(4,Z-17),6,30);TAB(30);
3052 print using l$;n(2,z-15):NEXT Z
3054 PRINT
3075 PRINT "FOR NEW RECORD, TYPE N-RETURN , OTHERWISE F-RETURN"
3085 INPUT line temp$
3090 IF ucase$(temp$)="N" THEN 3000
3095 RETURN
4000 PRINT clear$:PRINT
4005 N$=""
4010 INPUT "RECORD NUMBER";Z1
4015 IF Z1<1 THEN PRINT "*** NO SUCH RECORD ***":GOSUB 4100:GOTO 1620
4020 IF Z1>Z3 THEN PRINT "*** OUT OF RANGE ***":GOSUB 4100:GOTO 1620
4025 IF Z1>=Z2 THEN PRINT "NO RECORD NUMBER";z1:GOSUB 4100:GOTO 1620
4030 open z5$ recl 384 as 1
     read #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
     close 1
4045 IF N(2,1)=0 THEN PRINT "*** DELETED RECORD ***":GOTO 1620
4050 Z9=1
4055 FOR Z=3 TO 17
4060 K$(5,Z)=MID$(N$,Z9,N(0,Z))
4065 Z9=Z9+N(0,Z)
4070 NEXT Z
4075 GOTO 2105
4100	FOR AAA=1 TO 200 :NEXT AAA :RETURN
5000 PRINT clear$:PRINT
5010 INPUT "RECORD NUMBER";Z1
5015 IF Z1<1 THEN PRINT "*** NO SUCH RECORD ***":GOSUB 4100:GOTO 1620
5020 IF Z1>Z3 THEN PRINT "*** OUT OF RANGE ***":GOSUB 4100:GOTO 1620
5025 IF Z1>=Z2 THEN PRINT "NO RECORD NUMBER";z1:GOSUB 4100:GOTO 1620
5030 open z5$ recl 384 as 1
     read #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
     close 1
5045 PRINT "RECORD NUMBER";z1
5048 Z9=1:FOR Z=3 TO 17:K$(5,Z)=MID$(N$,Z9,N(0,Z)):Z9=Z9+N(0,Z):NEXT Z
5050 PRINT MID$(K$(3,1),6,30);TAB(11);N(2,1);TAB(40);MID$(K$(3,2),6,30);
5052 PRINT TAB(55);N(2,2)
5054 PRINT "SOLD TO";TAB(40);"SHIP TO"
5056 PRINT delim$
5058 FOR Z=3 TO 9
5060 PRINT MID$(K$(3,Z),6,30);TAB(11);K$(5,Z);TAB(40);MID$(K$(3,Z+7),6,30);
5062 PRINT TAB(50);K$(5,Z+7)
5064 NEXT Z
5066 Z=17:PRINT delim$
5068 PRINT MID$(K$(3,Z),6,30);TAB(40);K$(5,Z)
5070 FOR Z=18 TO 23:PRINT MID$(K$(4,Z-17),6,30);TAB(30);
5072 PRINT :print using l$;n(2,z-15):NEXT Z
5074 PRINT
5100 INPUT "IS RECORD TO BE DELETED (MUST BE YES TO DELETE)";line temp$
5105 IF left$(temp$,1)="n" OR left$(temp$,1)="N" THEN RETURN
5110 IF left$(temp$,1)<>"YES" THEN 5100
5115 N(2,1)=0
5120 open z5$ recl 384 as 1
     print #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
     close 1
5135 RETURN
6000 PRINT clear$:PRINT
6005 PRINT "IF YOU HAVE ARRIVED HERE, AND HAVE A CUSTOMER FILE"
6010 PRINT "ALREADY ON A DISK, YOU SHOULD INSTALL THAT DISK THEN"
6015 PRINT "TYPE THE LETTER C FOLLOWED BY A RETURN TO CONTINUE."
6020 PRINT
6025 PRINT "IF YOU WISH TO CREATE A NEW FILE, TYPE THE LETTER N"
6030 PRINT "FOLLOWED BY RETURN.":PRINT
6035 INPUT line temp$
6040 IF ucase$(temp$)="C" THEN initialize:GOTO 1500
6045 PRINT clear$:PRINT
6050 INPUT "NUMBER OF RECORDS DESIRED";z3
6055 PRINT
6060 n$="":for z=1 to 228:n$=n$+" ":next z:for i=1 to 20:n(2,i)=0:next i
6055 create z5$ recl 384 as 1
6070 FOR Z1=1 TO z3+2
     print #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
6085 NEXT Z1
6090 close 1
6092 Z1=Z1+1
6095 PRINT clear$:PRINT
6100 PRINT "CUSTOMER FILE CREATED AND CLEARED.":PRINT
6105 PRINT z3;"RECORDS CREATED.":PRINT
6110 PRINT "TO CONTINUE, TYPE RETURN.":INPUT line temp$
	Z2=1
	create z7$ as 1:print #1;Z2,Z3:close 1
6115 GOTO 1500
7000 INPUT "ARE YOU SURE !!! (YES OR NO)";line temp$
7007 IF ucase$(temp$)<>"YES" THEN RETURN
     n$="":for z=1 to 228:n$=n$+" ":next z:for i=1 to 20:n(2,i)=0:next i
     open z5$ recl 384 as 1
7010 FOR Z1=1 TO z3+2
     print #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
7025 NEXT Z1
7030 close 1
7035 PRINT clear$:PRINT
7040 PRINT "CUSTOMER FILE CLEARED!":PRINT
7045 PRINT "TO CONTINUE, TYPE RETURN."
7050 INPUT line temp$
	Z2=1
	open z7$ as 1:print #1;Z2,Z3:close 1
7060 RETURN
8000 chain "crsort"
9000 PRINT clear$:PRINT
	print "Do you want the entire file (Yes or No)?":input line temp$
	IF ucase$(LEFT$(temp$,1))="Y" then first=1:last=z2-1:GOTO 9005

	IF ucase$(LEFT$(temp$,1))<>"N" then 9000

9001	print clear$:print
		input "Enter first record number to print - ";first
		input "Enter last record to print         - ";last
	IF last>z2-1 then 9001
	IF first>last then 9001
	IF first<1 then 9001
9005 lprinter
     open z5$ recl 384 as 1
9015 FOR Z1=first TO last
     read #1,z1;n(2,1),n(2,2),n$,n(2,3),n(2,4),n(2,5),n(2,6),n(2,7),n(2,8)
9022 Z9=1
9023 FOR Z=3 TO 17:K$(5,Z)=MID$(N$,Z9,N(0,Z)):Z9=Z9+N(0,Z):NEXT Z
9024 print delim1$:print:print "RECORD NO.";z1:print
9025 print MID$(K$(3,1),6,30);TAB(11);N(2,1);TAB(40);MID$(K$(3,2),6,30);
9030 print TAB(55);N(2,2)
9031 print
9035 print "SOLD TO";TAB(40);"SHIP TO"
9040 print delim$
9041 print
9045 FOR Z=3 TO 9
9050 print MID$(K$(3,Z),6,30);TAB(11);K$(5,Z);TAB(40);MID$(K$(3,Z+7),6,30);
9055 print TAB(50);K$(5,Z+7)
9060 NEXT Z
9061 print
9065 Z=17:print delim$
9070 print MID$(K$(3,Z),6,30);TAB(40);K$(5,Z)
9075 FOR Z=18 TO 23:print MID$(K$(4,Z-17),6,30);TAB(30);
9080 print using l$;n(2,z-15):NEXT Z
9085 print
9100 print chr$(12)
9105 NEXT Z1
9110 CLOSE 1
9115 console
9120 RETURN
10000 CHAIN "master2"
15000	print clear$:print:print "CHECKING FILE LENGTH"
	PRINT:PRINT "*** PLEASE WAIT ***"
	open z5$ recl 384 as 1
	z3=(size(z5$)*block.size)/384
	for z2=1 to z3
	read #1,z2;n(2,1),n(2,2)
	if n(2,2)=0 then 15300
	next z2
15300	z3=int(z3)-2
	close 1
	create z7$ as 1
	print #1;z2,z3
	close 1
	GOTO 1500
