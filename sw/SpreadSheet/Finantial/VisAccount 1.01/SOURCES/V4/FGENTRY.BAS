     rem This is the Finished Goods Inventory Entry Program
%INCLUDE ALL.BAS
     RESTORE
520 L$="$##,###.###"
525 U$="##########"
530 DIM K$(6,20),n(2,20)
     repeat$="-------------------------------"
     fill$="                               "
     z5$="b:fg"
     z6$="b:fgback":z7$=z5$+"size"
535 FOR Z=1 TO 72:delim$=delim$+"=":NEXT Z
540 K$(6,1)="1 - NEW ENTRY":K$(6,2)="2 - EXAMINE EXISTING ENTRY"
550 K$(6,3)="3 - MODIFY EXISTING ENTRY"
560 K$(6,4)="4 - DELETE EXISTING ENTRY"
570 K$(6,5)="5 - CREATE NEW FILE":K$(6,6)="6 - CLEAR EXISTING FILE"
580 K$(6,7)="7 - BACK-UP AND SORT FILE":K$(6,8)="8 - LIST FILE"
590 K$(6,9)="9 - FINISHED"
     print clear$:print
     for z=1 to 19:read k$(1,z):next z
     for z=1 to 20:read k$(2,z):next z
     for z=1 to 19:read n(1,z):next z
     data Tag,Acct Number,Item #,Part #,Description,Location(shelf-bin)
     data Date of Last Issue,Date of Last Receipt,Vendor Code,Vendor Tag #
     data Unit Cost,Selling Price,Quan on Hand,Quan on Order,Quan Issued M-T-D
     data Quan Issued Q-T-D,Quan Issued Y-T-D,Min Quan (stock),Max Quan (stock)
     data 1 - Tag,2 - Acct Number,3 - Item #,4 - Part #,5 - Description
     data 6 - Loc (shelf-bin),7 - Date of Last Issue,8 - Date Last Receipt
     data 9 - Vendor Code,10- Vendor Tag #,11- Unit Cost,12- Selling Price
     data 13- Quan on hand,14- Quan on Order,15- Quan Issued M-T-D
     data 16- Quan Issued Q-T-D,17- Quan Issued Y-T-D,18- Min Quan (stock)
     data 19- Max Quan (stock),20- None
     data 4,10,7,12,24,24,8,8,10,4,12,12,8,8,10,10,10,10,10
     restore
	print clear$:print

1500	if end #1 then 6000
	if end #2 then 15000
		open z5$ recl 256 as 1
		close 1
		open z7$ as 2
		read #2;z2,z3
		close 2

1600	REM
1620	PRINT CLEAR$
	if z2>z3 then print "*** OUT OF RECORD SPACE ***"
	PRINT "FINISHED GOODS INVENTORY ENTRY PROGRAM"
		PRINT	   "--------------------------------------"
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
1690 FOR Z=1 TO 20:N(2,Z)=0:NEXT Z:N$=""
1700 FOR Z=1 TO 20:K$(3,Z)="":NEXT Z
1702 new$=""
1705 GOTO 1600
2000 IF Z2>Z3 THEN RETURN
2001 PRINT CLEAR$:PRINT
2005 PRINT "RECORD NUMBER";Z2:PRINT
2015 FOR Z=1 TO 2
	PRINT CUR$
2020 PRINT TAB(30);left$(repeat$,n(1,z))
	PRINT UP$;
2025 PRINT K$(1,Z);TAB(30);
2030 INPUT N(2,Z):PRINT chr$(13)
	PRINT CLEAR$
2035 NEXT Z
2036 FOR Z=3 TO 9
	PRINT CUR$
2037 PRINT TAB(30);left$(repeat$,n(1,z))
	PRINT UP$;
2038 PRINT K$(1,Z);TAB(30);
2039 INPUT line K$(3,Z):PRINT chr$(13)
	if len(k$(3,z))>n(1,z) then k$(3,z)=left$(k$(3,z),n(1,z))
2040 I=(N(1,Z)-LEN(K$(3,Z))):K$(3,Z)=K$(3,Z)+left$(fill$,i)
	PRINT CLEAR$
2045 NEXT Z
2065 FOR Z=10 TO 19
	PRINT CUR$
2070 PRINT TAB(30);left$(repeat$,n(1,z))
	PRINT UP$;
2075 PRINT K$(1,Z);TAB(30);
2080 INPUT N(2,Z):PRINT chr$(13)
	PRINT CLEAR$
2085 NEXT Z
2090 N$=""
2095 FOR Z=3 TO 9:N$=N$+K$(3,Z):NEXT Z
2100 Z1=Z2
2105 PRINT clear$;
2110 PRINT "RECORD NUMBER";Z1;TAB(31);"FINISHED GOODS ENTRY"
2115 FOR Z=1 TO 2
2116 PRINT K$(2,Z);TAB(30);:print using u$;n(2,z)
2118 NEXT Z
2120 FOR Z=3 TO 9
2122 PRINT K$(2,Z);TAB(30);K$(3,Z)
2124 NEXT Z
2126 Z=10:PRINT K$(2,Z);TAB(30);:print using u$;n(2,z)
2128 FOR Z=11 TO 12
2130 PRINT K$(2,Z);TAB(30);:print using l$;n(2,z)
2132 NEXT Z
2134 FOR Z=13 TO 19
2136 PRINT K$(2,Z);TAB(30);:print using u$;n(2,z)
2138 NEXT Z
2140 PRINT K$(2,20)
2163 PRINT"TO MAKE A CHANGE, TYPE THE APPROPRIATE #."
2164 INPUT Z
2165 IF Z>19 THEN 2216
2170 IF Z<1 THEN 2105
2175 IF Z>2 AND Z<10 THEN 2200
	CL=10:CC=50:GOSUB 50:PRINT CUR2$;
2180 PRINT left$(repeat$,n(1,z))
	CL=12:GOSUB 50:PRINT CUR2$;
2185 PRINT K$(1,Z)
	CL=10:CC=48:GOSUB 50:PRINT CUR2$;
2190 INPUT N(2,Z)
2195 GOTO 2225
2200 CL=10:CC=50:GOSUB 50:PRINT CUR2$; :PRINT left$(repeat$,n(1,z))
	CL=12:GOSUB 50:PRINT CUR2$;
2205 PRINT K$(1,Z)
	CL=10:CC=48:GOSUB 50:PRINT CUR2$;
2210 INPUT line K$(3,Z)
	if len(k$(3,z))>n(1,z) then k$(3,z)=left$(k$(3,z),n(1,z))
2215 I=(N(1,Z)-LEN(K$(3,Z))):K$(3,Z)=K$(3,Z)+left$(fill$,i)
2216 N$=""
2220 FOR Z=3 TO 9:N$=N$+K$(3,Z):NEXT Z
2225 CL=14:CC=50:GOSUB 50:PRINT CUR2$;
	INPUT "ANY MORE CHANGES";line temp$
2230 IF left$(temp$,1)="y" OR left$(temp$,1)="Y" THEN 2105
2235	PRINT CUR2$;
2240 INPUT "IS RECORD TO BE ENTERED";line temp$
2245 PRINT
2250 IF left$(temp$,1)="y" OR left$(temp$,1)="Y" THEN 2280
2255 IF left$(temp$,1)<>"n" AND left$(temp$,1)<>"N" THEN 2235
2260 PRINT clear$:PRINT
2270 PRINT "*** RECORD NOT ENTERED ***":PRINT:PRINT
2275 FOR Z=1 TO 200:NEXT Z:RETURN
2280 open z5$ recl 256 as 1
     print #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
     close 1
2295 IF new$="N" THEN Z2=Z2+1:open z7$ as 1:print #1;z2,z3:close 1
2300 RETURN
3000 PRINT clear$:PRINT
3005 INPUT "RECORD NUMBER";Z1
3010 IF Z1>=Z2 THEN 3000
3012 IF Z1<1 THEN RETURN
3015 open z5$ recl 256 as 1
     read #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
3022 Z9=1:FOR Z=3 TO 9:K$(3,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):next z
3025 close 1
3105 GOSUB 11000
3170 PRINT"FOR A NEW RECORD, TYPE N - TYPE F IF FINISHED.":INPUT line temp$
3190 IF ucase$(temp$)="N" THEN 3000
3195 RETURN
4000 PRINT clear$:PRINT
4005 N$=""
4010 INPUT "RECORD NUMBER";Z1
4015 IF Z1<1 THEN PRINT "*** NO SUCH RECORD ***":GOTO 1620
4020 IF Z1>Z3 THEN PRINT "*** OUT OF RANGE ***":GOTO 1620
4025 IF Z1>=Z2 THEN PRINT "NO RECORD NUMBER";Z1:GOTO 1620
4030 open z5$ recl 256 as 1
     read #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
4036 Z9=1:FOR Z=3 TO 9:K$(3,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):NEXT Z
4040 close 1
4045 IF N(2,1)=0 THEN PRINT "*** DELETED RECORD ***":GOTO 1620
4075 GOTO 2105
5000 PRINT clear$:PRINT
5010 INPUT "RECORD NUMBER";Z1
5015 IF Z1<1 THEN PRINT "*** NO SUCH RECORD ***":GOTO 1620
5020 IF Z1>Z3 THEN PRINT "*** OUT OF RANGE ***":GOTO 1620
5025 IF Z1>=Z2 THEN PRINT "NO RECORD NUMBER";Z1:GOTO 1620
5030 open z5$ recl 256 as 1
     read #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
5036 Z9=1:FOR Z=3 TO 9:K$(3,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):NEXT Z
5040 close 1
5105 GOSUB 11000
5200 INPUT "IS RECORD TO BE DELETED (MUST BE YES TO DELETE)";line temp$
5205 IF left$(temp$,1)="n" OR left$(temp$,1)="N" THEN RETURN
5210 IF ucase$(temp$)<>"YES" THEN 5200
5215 N(2,1)=0
5220 open z5$ recl 256 as 1
     print #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
5230 close 1
5235 RETURN
6000 PRINT clear$:PRINT
6005 PRINT "IF YOU HAVE ARRIVED HERE, AND HAVE A FINISHED GOODS FILE"
6010 PRINT "ALREADY ON A DISK, YOU SHOULD INSTALL THAT DISK THEN"
6015 PRINT "TYPE THE LETTER C FOLLOWED BY A RETURN TO CONTINUE."
6020 PRINT
6025 PRINT "IF YOU WISH TO CREATE A NEW FILE, TYPE THE LETTER N"
6030 PRINT "FOLLOWED BY RETURN.":PRINT
6035 INPUT temp$
6040 IF ucase$(temp$)="C" THEN initialize:GOTO 1500
6045 PRINT clear$:PRINT
6050 INPUT "NUMBER OF RECORDS DESIRED";z3
6055 PRINT
6060 n$="":for z=1 to 80:n$=n$+" ":next z:FOR Z=1 TO 20:N(2,Z)=0:NEXT Z
6065 create z5$ recl 256 as 1
6070 FOR Z1=1 TO z3+2
     print #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
6085 NEXT Z1
6090 close 1
6095 PRINT clear$:PRINT
6100 PRINT "FINISHED GOODS FILE CREATED AND CLEARED.":PRINT
6105 PRINT z3;"RECORDS CREATED.":PRINT
6110 PRINT "TO CONTINUE, TYPE RETURN.":INPUT line temp$
	Z2=1
	create z7$ as 1:print #1;Z2,Z3:close 1
6115 GOTO 1500
7000 z2=z3:n$="":for z=1 to 80:n$=n$+" ":next z:FOR Z=1 TO 20:N(2,Z)=0:NEXT Z
7006 INPUT "ARE YOU SURE !!! (YES OR NO)";line temp$
7007 IF ucase$(temp$)<>"YES" THEN RETURN
     open z5$ recl 256 as 1
7010 FOR Z1=1 TO z3+2
     print #1,z1;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
7025 NEXT Z1
7030 close 1
7035 PRINT clear$:PRINT
7040 PRINT "FINISHED GOODS FILE CLEARED!":PRINT
7045 PRINT "TO CONTINUE, TYPE RETURN."
7050 INPUT line temp$
	Z2=1
	open z7$ as 1:print #1;Z2,Z3:close 1
7060 RETURN
8000 chain "fgsort"
9000 lprinter
9005 PRINT clear$:PRINT
9010 open z5$ recl 256 as 1
9015 FOR I=1 TO Z2-1
     read #1,i;n(2,1),n(2,2),n$,n(2,10),n(2,11),n(2,12),\
	  n(2,13),n(2,14),n(2,15),n(2,16),n(2,17),n(2,18),n(2,19)
9035 Z9=1:FOR Z=3 TO 9:K$(3,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):NEXT Z
9110 print "RECORD NUMBER";i;TAB(31);"FINISHED GOODS ENTRY"
9115 FOR Z=1 TO 2
9116 print K$(2,Z);TAB(30);:print using u$;n(2,z)
9118 NEXT Z
9120 FOR Z=3 TO 9
9122 print K$(2,Z);TAB(30);K$(3,Z)
9124 NEXT Z
9126 Z=10:print K$(2,Z);TAB(30);:print using u$;n(2,z)
9128 FOR Z=11 TO 12
9130 print K$(2,Z);TAB(30);:print using l$;n(2,z)
9132 NEXT Z
9134 FOR Z=13 TO 19
9136 print K$(2,Z);TAB(30);:print using u$;n(2,z)
9138 NEXT Z
9145 print chr$(12)
9150 NEXT I
     print chr$(12):for z=1 to 100:next z:print chr$(12)
9155 console
     close 1
9900 RETURN
10000 CHAIN "master4"
11000 PRINT clear$:PRINT
11110 PRINT "RECORD NUMBER";Z1;TAB(31);"FINISHED GOODS ENTRY"
11115 FOR Z=1 TO 2
11116 PRINT K$(2,Z);TAB(30);:print using u$;n(2,z)
11118 NEXT Z
11120 FOR Z=3 TO 9
11122 PRINT K$(2,Z);TAB(30);K$(3,Z)
11124 NEXT Z
11126 Z=10:PRINT K$(2,Z);TAB(30);:print using u$;n(2,z)
11128 FOR Z=11 TO 12
11130 PRINT K$(2,Z);TAB(30);:print using l$;n(2,z)
11132 NEXT Z
11134 FOR Z=13 TO 19
11136 PRINT K$(2,Z);TAB(30);:print using u$;n(2,z)
11138 NEXT Z
11140 RETURN
15000	print clear$:print:print "CHECKING FILE LENGTH"
	PRINT:PRINT "*** PLEASE WAIT ***"
	open z5$ recl 256 as 1
	z3=(size(z5$)*block.size)/256
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
,2)
	if n(2,2)=0 then 15300
	next z2
15300	z3=i