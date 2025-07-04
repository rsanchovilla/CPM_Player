 900 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 901 REM
 902 REM	 DATABASE EXAMPLE    VERSION 2.11   2/26/81
 903 REM
1000 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
1010 REM
1020 REM	 SET-UP DATABASE FIELD & KEY DESCRIPTORS
1030 REM
1040 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
1050 DIM FLD.NAME$(7),FLD.LEN%(7),NEW.FLD$(7),OLD.FLD$(7)
1060 MAX.FIELD%=7:NO.FIELDS%=MAX.FIELD%+1
1070 FLD.NAME$(0)="Customer Number" :FLD.LEN%(0)=4
1080 FLD.NAME$(1)="First Name"      :FLD.LEN%(1)=16
1090 FLD.NAME$(2)="Last Name"       :FLD.LEN%(2)=20
1100 FLD.NAME$(3)="Street Address"  :FLD.LEN%(3)=20
1110 FLD.NAME$(4)="City"            :FLD.LEN%(4)=20
1120 FLD.NAME$(5)="State"           :FLD.LEN%(5)=2
1130 FLD.NAME$(6)="Zipcode"         :FLD.LEN%(6)=9
1140 FLD.NAME$(7)="Customer Status" :FLD.LEN%(7)=36
1150 REM
1200 DIM KEY.NAME$(2),KEY.LEN%(2),KEY.MAP%(2),KEY.TYPE%(2),MAX.KV%(2)
1210 MAX.KEY%=2
1220 KEY.LEN%(0)=10:KEY.TYPE%(0)=0:KEY.MAP%(0)=2 ' KEY 0 = LAST NAME
1230 KEY.LEN%(1)=11:KEY.TYPE%(1)=0:KEY.MAP%(1)=6 ' KEY 1 = ZIPCODE
1240 KEY.LEN%(2)=2 :KEY.TYPE%(2)=1:KEY.MAP%(2)=0 ' KEY 2 = CUSTOMER NUMBER
1245 UNIQ.KEY%=2 'USED IN TEST OF UNIQUENESS
1250 FOR KEY%=0 TO MAX.KEY%
1260	KEY.NAME$(KEY%)=FLD.NAME$(KEY.MAP%(KEY%))
1270 NEXT KEY%
1300 DIM INDEX.NAME$(2)
1310 INDEX.NAME$(0)="NAME.IDX"
1320 INDEX.NAME$(1)="ZIPC.IDX"
1330 INDEX.NAME$(2)="NUMB.IDX"
2000 REM
2010 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
2020 REM
2030 REM 		INITIALIZE INDEX FILES
2040 REM
2050 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
2060 YES%=-1 :NO%=0 
2070 INDEX.KEY$=SPACE$(11)
2080 NO.BUFFERS%=6 :NO.NODE.SECTORS%=2 :NO.HEADER.SECTORS%=2
2090 NO.DATA.FILES%=1 :NO.KEYS%=MAX.KEY%+1
2100 CALL INTREE(NO.BUFFERS%,NO.KEYS%,NO.NODE.SECTORS%, _
			NO.HEADER.SECTORS%,NO.DATA.FILES%)
2110 ERROR.CODE%=1 :CALL SETERR(ERROR.CODE%) 'TRAP USER ERRORS
2120 FOR KEY%=0 TO MAX.KEY%
2130	MAX.KV%(KEY%)=(NO.NODE.SECTORS%*128-8)\(KEY.LEN%(KEY%)+2)
2140	MAX.KV%(KEY%)=MAX.KV%(KEY%)\2*2 'MAKE SURE ITS EVEN
2150	CALL ACCESS(KEY%,INDEX.NAME$(KEY%),KEY.LEN%(KEY%), _
			KEY.TYPE%(KEY%),MAX.KV%(KEY%))
2160	IF ERROR.CODE%<>0 THEN ERROR.TYPE%=1:GOTO 9000
2170 NEXT KEY%
3000 REM
3010 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
3020 REM
3030 REM 		INITIALIZE DATA FILE
3040 REM
3050 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
3060 FILE.NO%=0 :RECORD.SECTORS%=1 ' 128 BYTE DATA FILE RECORD LENGTH
3070 FILE.NAME$="CUSTOMER.DAT"
3080 CALL OPEND(FILE.NO%,FILE.NAME$,RECORD.SECTORS%)
3090 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=2:GOTO 9000
3100 REM	IN ORDER TO ESTABLISH A BUFFER AREA FOR THIS FILE,
3110 REM	WE WILL OPEN A 'DUMMY' MBASIC FILE.
3120 OPEN "R",1,"DUMMY.$$$",RECORD.SECTORS%*128
3130 BUFFER.PTR%=VARPTR(#1)
3140 FIELD #1,1 AS DEL.FLAG$,2 AS CUST.NO$,FLD.LEN%(1) AS F.NAME$, _
	FLD.LEN%(2) AS L.NAME$,FLD.LEN%(3) AS ADDRESS$,FLD.LEN%(4) AS CITY$
3150 DUMMY%=3+FLD.LEN%(1)+FLD.LEN%(2)+FLD.LEN%(3)+FLD.LEN%(4)
3160 FIELD #1,DUMMY% AS DUMMY$,FLD.LEN%(5) AS STATE$,FLD.LEN%(6) AS ZIPCODE$,_
	FLD.LEN%(7) AS STATUS$
4000 REM
4010 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
4020 REM
4030 REM 		BEGIN DATABASE OPERATION
4040 REM
4050 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
4060 GOSUB 10000 'CLEAR SCREEN
4070 GOSUB 11000 'PRINT MAIN MENU & GET CHOICE
4080 ON CHOICE% GOTO 5100,5300,5500,5700,5900,6100
5100 REM
5102 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5104 REM
5106 REM 		ENTER NEW CUSTOMERS
5108 REM 
5110 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5115 ENTER.MODE$="NEW" :GOSUB 12000 'DATA ENTRY ROUTINE
5120 IF ACTION$="SAVE" THEN _
		DATA.RECORD%=0 : _ 'SIGNAL NEED FOR A NEW DATA RECORD
		GOSUB 13000    : _ 'UPDATE INDICES & DATA FILE  
		GOTO 5115
5125 GOTO 4060 'RETURN TO MENU
5300 REM
5302 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5304 REM
5306 REM 		SCAN/UPDATE/DELETE CUSTOMERS
5308 REM
5310 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5315 GOSUB 14000 'DETERMINE SEARCH KEY
5320 KEY%=CHOICE% :PRINT
5325 PRINT "Enter target value for ";KEY.NAME$(KEY%);","
5330 LINE INPUT "     or press 'RETURN' to see main menu>>",TARGET$
5335 IF TARGET$="" THEN 4060
5340 GOSUB 15000 'CONVERT TARGET TO KEY FORMAT
5345 CALL SEARCH(KEY%,CONV.TARGET$,DRN%,INDEX.KEY$)
5350 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=3:GOTO 9000
5355 CONTINUE%=YES%
5360 WHILE CONTINUE% AND DRN%<>0
5365	GOSUB 16000 'READ CUSTOMER RECORD # DRN%
5370	ENTER.MODE$="OLD" :GOSUB 12000 'DATA ENTRY ROUTINE
5372	DATA.RECORD%=DRN% : SAVE.KEY%=KEY%
5375	IF ACTION$="SAVE" THEN GOSUB 13000 'UPDATE INDICES & DATA FILE
5380	IF ACTION$="DELT" THEN GOSUB 17000 'DELETE ENTRY
5385	IF ACTION$="SAVE" OR ACTION$="DELT" THEN _ 'RE-ESTABLISH INTERNAL PTR
		CONV.TARGET$=INDEX.KEY$ : _ 'SET TARGET TO CURRENT KEY VALUE
		KEY%=SAVE.KEY% : _ 'RESET SEARCH KEY
		CALL SEARCH(KEY%,CONV.TARGET$,DRN%,INDEX.KEY$) : _
		IF ERROR.CODE%<>0 THEN ERROR.TYPE%=13:GOTO 9000
5390	IF ACTION$="CONT" THEN CALL SUCESR(KEY%,DRN%,INDEX.KEY$)
5395	IF ACTION$="BACK" THEN CALL PRDESR(KEY%,DRN%,INDEX.KEY$)
5400	IF ACTION$="STOP" THEN CONTINUE%=NO%
5405 WEND
5410 PRINT
5415 PRINT "SCAN ENDED"
5420 GOSUB 18000 'PAUSE
5425 GOTO 4060 'RETURN TO MAIN MENU
5500 REM
5502 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5504 REM
5506 REM 			LIST CUSTOMERS
5508 REM
5510 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5515 GOSUB 14000 'DETERMINE SEARCH KEY
5520 KEY%=CHOICE%
5525 PRINT
5530 LINE INPUT "Do you want listing routed to printer (Y/N)>>",ROUTE$
5535 IF ROUTE$="y" THEN ROUTE$="Y"
5540 PRINT
5545 PRINT "Enter lower and upper limits for ";KEY.NAME$(KEY%);" listing;"
5550 INPUT "     separate values with a comma >>", _
		L.VALUE$,U.VALUE$
5555 TARGET$=L.VALUE$:GOSUB 15000:L.VALUE$=CONV.TARGET$ 'CONVERT TO KEY FORMAT
5560 TARGET$=U.VALUE$:GOSUB 15000:U.VALUE$=CONV.TARGET$
5565 CALL SEARCH(KEY%,L.VALUE$,DRN%,INDEX.KEY$)
5570 NO.LISTED%=0 
5575 IF DRN%<>0 THEN GOSUB 19000 'COMPARE INDEX.KEY&U.VALUE. RETURNS COMPARE%.
5580 WHILE DRN%<>0 AND COMPARE%<=0
5585	GOSUB 16000 'READ CUSTOMER RECORD # DRN%
5590	GOSUB 25000 'PRINT RECORD
5595	NO.LISTED%=NO.LISTED%+1
5600	CALL SUCESR(KEY%,DRN%,INDEX.KEY$)
5605	IF DRN%<>0 THEN GOSUB 19000
5610 WEND
5615 PRINT
5620 PRINT TAB(5);NO.LISTED%;" records listed."
5625 GOSUB 18000 'PAUSE
5630 GOTO 4060 'RETURN TO MAIN MENU
5700 REM
5702 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5704 REM
5706 REM 		DATABASE STATISTICS
5708 REM
5710 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5715 CALL DATAFS(FILE.NO%,FILE.SIZE%)
5720 CALL DATAFU(FILE.NO%,FILE.UTIL%)
5725 GOSUB 10000 'CLEAR SCREEN
5730 PRINT TAB(5);FILE.NAME$;" has ";FILE.SIZE%;" records; currently, ";
5735 PRINT FILE.UTIL%;" of them are in use."
5740 PRINT :PRINT :PRINT :PRINT
5745 PRINT TAB(5);"INDEX";TAB(30);"ENTRIES"
5750 PRINT TAB(5);"-----------------";TAB(30);"-------"
5755 FOR KEY%=0 TO MAX.KEY%
5760	CALL NMENTR(KEY%,NO.ENTRIES%)
5765	PRINT TAB(5);KEY.NAME$(KEY%);TAB(32);NO.ENTRIES%
5770 NEXT KEY%
5775 PRINT :PRINT :PRINT :PRINT
5780 GOSUB 18000 'PAUSE
5785 GOTO 4060 'RETURN TO MAIN MENU
5900 REM
5902 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5904 REM
5906 REM 		SAVE DATABASE UPDATES & RESTART
5908 REM
5910 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
5912 RESTART%=YES%
5915 CALL CLOSED(FILE.NO%)
5920 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=4:GOTO 9000
5925 FOR KEY%=0 TO MAX.KEY%
5930	CALL RSTRCT(KEY%)
5935	IF ERROR.CODE%<>0 THEN ERROR.TYPE%=5:GOTO 9000
5940 NEXT KEY%
5945 CLOSE 1 'CLOSE DUMMY FILE
5950 KILL "DUMMY.$$$"
5955 IF RESTART% THEN GOTO 2000 
6000 PRINT
6005 PRINT "*** SUCCESSFUL TERMINATION ***"
6010 STOP
6100 REM
6102 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
6104 REM
6106 REM 		SAVE DATABASE UPDATES & TERMINATE
6108 REM
6110 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
6115 RESTART%=NO%
6120 GOTO 5915
9000 REM
9010 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
9020 REM
9030 REM 		ERROR HANDLING
9040 REM
9050 REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
9100 PRINT
9110 PRINT "User Error #";ERROR.CODE%;" occurred while trying to ";
9120 ON ERROR.TYPE% GOTO 9210,9220,9230,9240,9250,9260,9270,9280,9290, _
	9300,9310,9320,9330
9210 PRINT "access ";INDEX.NAME$(KEY%) : GOTO 9700
9220 PRINT "open ";FILE.NAME$ : GOTO 9700
9230 PRINT "search ";KEY.NAME$(KEY%);" Index File" : GOTO 9500 'CLOSE FILES
9240 PRINT "close ";FILE.NAME$ : GOTO 9700
9250 PRINT "restrict ";INDEX.NAME$ : GOTO 9600 'TRY TO CLOSE REMAINING FILES
9260 PRINT "get a new data record" : GOTO 9700
9270 PRINT "read data record #";DRN% : GOTO 9700
9280 PRINT "delete data record #";DATA.RECORD% : GOTO 9700
9290 PRINT "remove old key from ";INDEX.NAME$(KEY%) : GOTO 9500
9300 PRINT "enter key into ";INDEX.NAME$(KEY%) :GOTO 9500
9310 PRINT "write data record #";DRN% : GOTO 9700
9320 PRINT "delete key from ";INDEX.NAME$(KEY%) :GOTO 9500
9330 PRINT "re-establish position"
9332 PRINT "    in ";INDEX.NAME$(KEY%);" after update.": GOTO 9500
9500 CALL CLOSED(FILE.NO%)
9510 FOR T.KEY%=0 TO MAX.KEY%
9520	IF T.KEY%<>KEY% THEN CALL RSTRCT(T.KEY%)
9530 NEXT T.KEY%
9540 GOTO 9700 'STOP ERROR MESSAGE
9600 T.KEY%=KEY%+1
9610 IF T.KEY%>MAX.KEY% THEN STOP
9620 FOR KEY%=T.KEY% TO MAX.KEY%
9630	CALL RSTRCT(KEY%)
9640 NEXT KEY%
9700 PRINT
9710 PRINT "DEMONSTRATION TERMINATING WITH ERROR CODE #";ERROR.CODE%
9720 STOP
9900 PRINT
9910 PRINT "WARNING...Return Code #";RET.CODE%;" occurred while trying to ";
9920 ON ERROR.TYPE% GOTO 9930,9940,9950
9930 PRINT "remove old key from ";INDEX.NAME$(KEY%):GOSUB 18000:RETURN
9940 PRINT "enter key into ";INDEX.NAME$(KEY%):GOSUB 18000:RETURN
9950 PRINT "delete key from ";INDEX.NAME$(KEY%):GOSUB 18000:RETURN
10000 REM
10010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
10020 REM
10030 REM 		CLEAR SCREEN SUBROUTINE
10040 REM
10050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
10060 FOR DUMMY%=1 TO 24
10070	PRINT
10080 NEXT DUMMY%
10090 RETURN
11000 REM
11010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
11020 REM
11030 REM 		MAIN MENU SUBROUTINE
11040 REM
11050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
11060 PRINT TAB(21);"MICRO B+(tm) DEMONSTRATION" :PRINT
11070 PRINT TAB(20);"Customer Database Operations"
11080 PRINT TAB(20);"****************************":PRINT :PRINT
11090 PRINT TAB(5);"1. Enter New Customers"
11100 PRINT TAB(5);"2. Scan/Update/Delete Customer Records"
11110 PRINT TAB(5);"3. List Customer Records"
11120 PRINT TAB(5);"4. Database Statistics"
11130 PRINT TAB(5);"5. Save All Files & Restart Operations"
11140 PRINT TAB(5);"6. Terminate Operations":PRINT :PRINT
11150 INPUT "Enter desired operation number>>",CHOICE%
11160 IF CHOICE%<1 OR CHOICE%>6 THEN PRINT :PRINT :GOTO 11090 ELSE RETURN
12000 REM
12010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
12020 REM
12030 REM 		DATA ENTRY SUBROUTINE
12040 REM
12050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
12060 IF ENTER.MODE$="NEW" THEN _
	FOR FLD%=0 TO MAX.FIELD%  : _
		OLD.FLD$(FLD%)="" : _
	NEXT FLD%
12070 IF ENTER.MODE$="OLD" THEN _
	FOR FLD%=0 TO MAX.FIELD%  	      : _
		NEW.FLD$(FLD%)=OLD.FLD$(FLD%) : _
	NEXT FLD%
12080 GOSUB 10000 'CLEAR SCREEN
12090 WHILE ENTER.MODE$="NEW"
12095	PRINT TAB(20);"Enter New Customer Information"
12096	PRINT TAB(20);"******************************":PRINT :PRINT
12097	PRINT TAB(5);"[A zero customer number will terminate input.]":PRINT
12100	FOR FLD%=0 TO MAX.FIELD%
12110		FLD.NO%=FLD%+1
12120		PRINT TAB(4);FLD.NO%;"- ";FLD.NAME$(FLD%);TAB(30);"("; _
			FLD.LEN%(FLD%);")";TAB(38);
12130		LINE INPUT ">>",NEW.FLD$(FLD%)
12132		IF FLD%=0 AND VAL(NEW.FLD$(FLD%))=0 THEN _
			ACTION$="STOP" : _
			RETURN
12135		NEW.FLD$(FLD%)=LEFT$(NEW.FLD$(FLD%),FLD.LEN%(FLD%))
12140		IF FLD%=0 THEN _
			GOSUB 20000 : _
			IF NOT UNIQUE% THEN GOTO 12120
12150	NEXT FLD%
12160	ENTER.MODE$="NEWMOD"
12170 WEND
12200 PRINT :PRINT :PRINT
12210 PRINT TAB(20);"Current customer information" : PRINT
12220 FOR FLD%=0 TO MAX.FIELD%
12230	FLD.NO%=FLD%+1
12240	PRINT TAB(4);FLD.NO%;"- ";FLD.NAME$(FLD%);TAB(30);NEW.FLD$(FLD%)
12250 NEXT FLD%
12260 IF ENTER.MODE$="NEWMOD" THEN 12500 'NEW DATA HAS FEWER OPTIONS
12300 PRINT :PRINT
12310 PRINT "Press 'RETURN' to continue scan, enter Field # to change data,"
12320 PRINT "S to save changes, D to delete data, B for back scan, or E"; _ 
	" to end scan";
12330 LINE INPUT ">>",OP$
12340 IF OP$="" THEN ACTION$="CONT":RETURN
12350 IF OP$="S" OR OP$="s" THEN ACTION$="SAVE":RETURN
12360 IF OP$="D" OR OP$="d" THEN ACTION$="DELT":RETURN
12370 IF OP$="B" OR OP$="b" THEN ACTION$="BACK":RETURN
12380 IF OP$="E" OR OP$="e" THEN ACTION$="STOP":RETURN
12390 OP%=VAL(OP$)
12400 IF OP%<1 OR OP%>NO.FIELDS% THEN 12300
12410 GOSUB 21000 'UPDATE DATA
12420 GOTO 12200
12500 PRINT :PRINT
12510 PRINT "Press 'RETURN' to save data, enter Field # to change data,"
12520 LINE INPUT "D to delete data, or E to end input>>",OP$
12530 IF OP$="" OR OP$="S" OR OP$="s" THEN ACTION$="SAVE":RETURN
12540 IF OP$="D" OR OP$="d" THEN ACTION$="DELT":RETURN
12550 IF OP$="E" OR OP$="e" THEN ACTION$="STOP":RETURN
12560 OP%=VAL(OP$)
12570 IF OP%<1 OR OP%>NO.FIELDS% THEN 12500
12580 GOSUB 21000 'UPDATE DATA
12590 GOTO 12200
13000 REM
13010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
13020 REM
13030 REM 		UPDATE INDICES & DATA FILE SUBROUTINE
13040 REM
13050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
13060 IF DATA.RECORD%=0 THEN CALL NEWDAT(FILE.NO%,DATA.RECORD%)
13070 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=6:GOTO 9000
13080 DRN%=DATA.RECORD%
13090 FOR KEY%=0 TO MAX.KEY%
13100	FLD%=KEY.MAP%(KEY%)
13110	IF OLD.FLD$(FLD%)<>NEW.FLD$(FLD%) THEN GOSUB 22000 'ADD NEW KEY VALUE
13120 NEXT KEY%
13130 FOR FLD%=0 TO MAX.FIELD%
13140	IF OLD.FLD$(FLD%)<>NEW.FLD$(FLD%) THEN _
		GOSUB 23000: RETURN ' WRITE UPDATED RECORD
13150 NEXT FLD%
13160 RETURN
14000 REM
14010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
14020 REM
14030 REM 		SELECT SEARCH KEY SUBROUTINE
14040 REM
14050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
14060 GOSUB 10000 'CLEAR SCREEN
14070 PRINT TAB(25);"Customer Database Search Keys":PRINT :PRINT
14080 FOR KEY%=0 TO MAX.KEY%
14090	KEY.NO%=KEY%+1
14100	PRINT TAB(5);KEY.NO%;"- ";KEY.NAME$(KEY%)
14110 NEXT KEY%
14120 PRINT :PRINT
14130 INPUT "Enter desired key number>>",CHOICE%
14140 IF CHOICE%<1 OR CHOICE%>NO.KEYS% THEN 14120
14150 CHOICE%=CHOICE%-1
14160 RETURN
15000 REM
15010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
15020 REM
15030 REM 	CONVERT TARGET VALUE TO KEY FORMAT SUBROUTINE
15040 REM
15050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
15060 IF KEY.TYPE%(KEY%)=1 THEN _
	CONV.TARGET$=MKI$(VAL(TARGET$)) : _
	RETURN
15070 KL%=KEY.LEN%(KEY%)
15080 CONV.TARGET$=LEFT$(TARGET$+SPACE$(KL%),KL%-2)+MKI$(0)
15090 RETURN
16000 REM
16010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
16020 REM
16030 REM 		READ DATA RECORD SUBROUTINE
16040 REM
16050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
16060 CALL READD(FILE.NO%,DRN%,BUFFER.PTR%)
16070 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=7:GOTO 9000
16080 OLD.FLD$(0)=MID$(STR$(CVI(CUST.NO$)),2) 'CONVERT CUSTOMER # TO STRING
16090 OLD.FLD$(1)=F.NAME$: OLD.FLD$(2)=L.NAME$: OLD.FLD$(3)=ADDRESS$
16100 OLD.FLD$(4)=CITY$: OLD.FLD$(5)=STATE$: OLD.FLD$(6)=ZIPCODE$
16110 OLD.FLD$(7)=STATUS$
16120 GOSUB 26000 'STRIP TRAILING BLANKS FROM OLD.FLD'S
16130 RETURN
17000 REM
17010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
17020 REM
17030 REM 		DELETE INDEX & DATA FILE ENTRY SUBROUTINE
17040 REM
17050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
17060 FOR KEY%=0 TO MAX.KEY%
17070	FLD%=KEY.MAP%(KEY%)
17080	IF OLD.FLD$(FLD%)<>"" THEN GOSUB 24000 'DELETE KEY VALUE
17090 NEXT KEY%
17100 CALL RETDAT(FILE.NO%,DATA.RECORD%) 'RETURN DATA RECORD
17110 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=8:GOTO 9000
17120 RETURN
18000 REM
18010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
18020 REM
18030 REM 		PAUSE SUBROUTINE
18040 REM
18050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
18060 PRINT
18070 LINE INPUT "Press 'RETURN' to continue ---",PAUSE$
18080 RETURN
19000 REM
19010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
19020 REM
19030 REM 		COMPARE INDEX.KEY & U.VALUE SUBROUTINE
19040 REM
19050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
19060 IF KEY.TYPE%(KEY%)=1 THEN GOTO 19200 'GOTO NUMERIC COMPARE
19070 KL%=KEY.LEN%(KEY%)-2 'ADJUST FOR LAST TWO BYTES (DATA REC #)
19080 C1$=LEFT$(INDEX.KEY$+SPACE$(KL%),KL%)
19090 C2$=LEFT$(U.VALUE$+SPACE$(KL%),KL%)
19100 IF C1$<C2$ THEN _
	COMPARE%=-1 _
      ELSE IF C1$>C2$ THEN _
	COMPARE%=1 _
      ELSE _
	COMPARE%=0
19110 RETURN
19200 C1%=CVI(INDEX.KEY$)
19210 C2%=CVI(U.VALUE$)
19220 IF C1%<C2% THEN _
	COMPARE%=-1 _
      ELSE IF C1%>C2% THEN _
	COMPARE%=1 _
      ELSE _
	COMPARE%=0
19230 RETURN
20000 REM
20010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
20020 REM
20030 REM 		CUST # UNIQUENESS TEST SUBROUTINE
20040 REM
20050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
20060 TEST$=MKI$(VAL(NEW.FLD$(0))) 'CONVERT CUST # TO INTERNAL FORMAT
20070 CALL RTRIEV(UNIQ.KEY%,TEST$,TEST%)
20080 IF TEST%=0 THEN _
	UNIQUE%=YES% _
      ELSE _
	UNIQUE%=NO% : _
	PRINT : _
	PRINT "*** Already Assigned ***" : _
	PRINT
20090 RETURN
21000 REM
21010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
21020 REM
21030 REM 		UPDATE DATA FIELD SUBROUTINE
21040 REM
21050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
21055 OP%=OP%-1 'ADJUST FIELD # ORIGIN
21060 PRINT
21070 PRINT "Input new ";FLD.NAME$(OP%);
21080 LINE INPUT ">>",NEW.FLD$(OP%)
21090 NEW.FLD$(OP%)=LEFT$(NEW.FLD$(OP%),FLD.LEN%(OP%))
21100 IF OP%<>0 OR NEW.FLD$(OP%)=OLD.FLD$(OP%) THEN RETURN
21110 GOSUB 20000 'TEST FOR UNIQUE CUST #
21120 IF NOT UNIQUE% THEN _
	GOTO 21060 _
      ELSE _
	RETURN
22000 REM
22010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
22020 REM
22030 REM 		ADD NEW KEY VALUE SUBROUTINE
22040 REM
22050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
22055 K.FLD%=KEY.MAP%(KEY%): KL%=KEY.LEN%(KEY%) 'SETUP PARAMETERS
22060 IF KEY%=UNIQ.KEY% THEN 22200 'TRANSFORM TO NUMERIC KEY
22070 SUFFIX$=MKI$(DRN%) 'APPENDED TO NON-NUMERIC KEYS TO MAKE UNIQUE
22080 IF OLD.FLD$(K.FLD%)="" THEN _
	OLD.KEY$="" _
      ELSE _
	OLD.KEY$=LEFT$(OLD.FLD$(K.FLD%)+SPACE$(KL%),KL%-2)+SUFFIX$
22090 IF NEW.FLD$(K.FLD%)="" THEN _
	NEW.KEY$="" _
      ELSE _
	NEW.KEY$=LEFT$(NEW.FLD$(K.FLD%)+SPACE$(KL%),KL%-2)+SUFFIX$
22100 GOTO 22300 'SKIP NUMERIC TRANSFORMATION
22200 IF OLD.FLD$(K.FLD%)="" THEN _
	OLD.KEY$="" _
      ELSE _
	OLD.KEY$=MKI$(VAL(OLD.FLD$(K.FLD%)))
22210 NEW.KEY$=MKI$(VAL(NEW.FLD$(K.FLD%)))
22300 CALL REMOVE(KEY%,OLD.KEY$,DRN%,RET.CODE%) 'REMOVE OLD KEY VALUE
22310 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=9:GOTO 9000
22320 IF RET.CODE%<>1 THEN ERROR.TYPE%=1:GOSUB 9900 'PRINT WARNING
22330 CALL ENTER(KEY%,NEW.KEY$,DRN%,RET.CODE%) 'ADD NEW KEY VALUE
22340 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=10:GOTO 9000
22350 IF RET.CODE%<>1 THEN ERROR.TYPE%=2:GOSUB 9900 'PRINT WARNING
22360 RETURN
23000 REM
23010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
23020 REM
23030 REM 		WRITE NEW DATA RECORD SUBROUTINE
23040 REM
23050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
23060 LSET CUST.NO$=MKI$(VAL(NEW.FLD$(0)))
23070 LSET F.NAME$=NEW.FLD$(1)
23080 LSET L.NAME$=NEW.FLD$(2)
23090 LSET ADDRESS$=NEW.FLD$(3)
23100 LSET CITY$=NEW.FLD$(4)
23110 LSET STATE$=NEW.FLD$(5)
23120 LSET ZIPCODE$=NEW.FLD$(6)
23130 LSET STATUS$=NEW.FLD$(7)
23140 CALL WRITED(FILE.NO%,DRN%,BUFFER.PTR%)
23150 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=11:GOTO 9000
23160 RETURN
24000 REM
24010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
24020 REM
24030 REM 		DELETE KEY VALUE FROM INDEX SUBROUTINE
24040 REM
24050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
24060 K.FLD%=KEY.MAP%(KEY%): KL%=KEY.LEN%(KEY%) 'SETUP PARAMETERS
24070 IF KEY%=UNIQ.KEY% THEN 24200 'TRANSFORM NUMERIC KEY
24080 SUFFIX$=MKI$(DRN%) 'UNIQUE FIELD ADDED TO END OF NON-NUMERIC KEYS
24090 IF OLD.FLD$(K.FLD%)="" THEN _
	OLD.KEY$="" _
      ELSE _
	OLD.KEY$=LEFT$(OLD.FLD$(K.FLD%)+SPACE$(KL%),KL%-2)+SUFFIX$
24100 GOTO 24300 'SKIP NUMERIC TRANSFORMATION
24200 IF OLD.FLD$(K.FLD%)="" THEN _
	OLD.KEY$="" _
      ELSE _
	OLD.KEY$=MKI$(VAL(OLD.FLD$(K.FLD%)))
24300 CALL REMOVE(KEY%,OLD.KEY$,DRN%,RET.CODE%)
24310 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=12:GOTO 9000
24320 IF RET.CODE%<>1 THEN ERROR.TYPE%=3:GOSUB 9900 'PRINT WARNING
24330 RETURN
25000 REM
25010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
25020 REM
25030 REM 		LIST CUSTOMER RECORD SUBROUTINE
25040 REM
25050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
25060 IF ROUTE$="Y" THEN 25200 'SKIP TO LINE PRINTER ROUTINE
25100 PRINT
25105 PRINT TAB(5);OLD.FLD$(0);TAB(15);OLD.FLD$(7)
25110 PRINT TAB(25);OLD.FLD$(1);" ";OLD.FLD$(2)
25120 PRINT TAB(25);OLD.FLD$(3)
25130 PRINT TAB(25);OLD.FLD$(4);", ";OLD.FLD$(5);"    ";OLD.FLD$(6)
25150 PRINT
25160 RETURN
25200 LPRINT
25205 LPRINT TAB(5);OLD.FLD$(0);TAB(15);OLD.FLD$(7)
25210 LPRINT TAB(25);OLD.FLD$(1);" ";OLD.FLD$(2)
25220 LPRINT TAB(25);OLD.FLD$(3)
25230 LPRINT TAB(25);OLD.FLD$(4);", ";OLD.FLD$(5);"    ";OLD.FLD$(6)
25250 LPRINT
25260 RETURN
26000 REM
26010 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
26020 REM
26030 REM 		STRIP TRAILING BLANKS SUBROUTINE
26040 REM
26050 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
26060 FOR FLD%=0 TO MAX.FIELD%
26070	FOR TEST%=FLD.LEN%(FLD%) TO 1 STEP -1
26090		IF MID$(OLD.FLD$(FLD%),TEST%,1)<>" " THEN 26200
26100	NEXT TEST%
26110	OLD.FLD$(FLD%)="" 'ALL BLANKS
26120	GOTO 26300
26200	OLD.FLD$(FLD%)=LEFT$(OLD.FLD$(FLD%),TEST%)
26300 NEXT FLD%
26310 RETURN


