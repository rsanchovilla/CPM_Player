 900 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 901 REM
 902 REM	RECREATE UTILITY    VERSION 2.11    2/26/81
 903 REM
 904 REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::	
1000 DIM INDEX.NAME$(9),KEY.LENGTH%(9),KEY.TYPE%(9),MAX.KV%(9)
1010 DIM REC.SUFFIX$(9),KEY.POSITION%(9),KEY.VALUE$(9)
1100 INPUT "Enter OLD Data File Name:",CUR.DAT.FILE$
1110 INPUT "Enter NEW Data File Name:",REP.DAT.FILE$
1120 INPUT "Enter the number of 128 byte sectors per data file record:", _
		REC.SECTORS%
1130 INPUT "Enter beginning data record number (e.g.,1 or 2):",BEG.REC%
1140 INPUT "Do you want to eliminate records beginning with ffH (Y/N):",DEL.FF$
1150 IF DEL.FF$="y" THEN DEL.FF$="Y"
1160 PRINT
1200 INPUT "Enter the number of Key Fields:",NO.KEYS%
1210 INPUT "Enter the number of Node Sectors & Header Sectors:", _
	NODE.SECTORS%,HEADER.SECTORS%
1220 INPUT "Enter the number of Index File Buffers:",NO.BUFFERS%
1230 REQ.BUFFER%=(NO.KEYS%+2)*36+NO.BUFFERS%*(NODE.SECTORS%*128+50)
1240 IF REQ.BUFFER% > 8192 THEN _
	PRINT :PRINT "NOT ENOUGH BUFFER SPACE": _
	GOTO 1160 _
     ELSE _
	PRINT :PRINT TAB(5);REQ.BUFFER%;" bytes of buffer space utilized."
1250 NO.DAT.FILES%=2
1260 CALL INTREE(NO.BUFFERS%,NO.KEYS%,NODE.SECTORS%,HEADER.SECTORS%, _
	NO.DAT.FILES%)
1270 ERROR.CODE%=1
1280 CALL SETERR(ERROR.CODE%)
1300 CUR.DAT.FILE%=0
1310 REP.DAT.FILE%=1
1315 REM  Note how OPENR has been used to open a potentially cor-
1316 REM  rupted data file.
1320 CALL OPENR(CUR.DAT.FILE%,CUR.DAT.FILE$,REC.SECTORS%)
1330 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=1:GOTO 9000
1340 CALL OPEND(REP.DAT.FILE%,REP.DAT.FILE$,REC.SECTORS%)
1350 IF ERROR.CODE%<>0 THEN ERROR.TYPE%=2:GOTO 9000
1360 PRINT
1370 PRINT "Enter Index Name,Length,Type(0/1),MaxKV per Node,Auto Suffix"; _
	" (Y/N),Key Position"
1380 PRINT
1390 FOR KEY.NO%=0 TO NO.KEYS%-1
1400 REM  Auto Suffix will add a two-byte representation of the data
1401 REM  record number to the end of a key (to ensure uniqueness).
1402 REM
1403 REM  Key Position specifies the starting column of the key field.
1404 REM  For example, if a key occupies the 5th through 10th bytes of
1405 REM  the data record, enter a "5" for the Key Position.
1406 REM
1407 REM  IF zero (0) is entered for MaxKV/Node, then the largest value
1408 REM  will be automatically calculated.
1410	PRINT TAB(6);"For Key";KEY.NO%;">>";
1411 REM
1412 REM  Based on the information in Lines 1220-1240 & 3140-3160 of the
1413 REM  DATABASE.BAS example, the following responses can be used to
1414 REM  rebuild the DATABASE files:
1415 REM  >>NEWNAME.IDX,10,0,0,Y,20
1416 REM  >>NEWZIPC.IDX,11,0,0,Y,82
1417 REM  >>NEWNUMB.IDX,2,1,0,N,2
1418 REM
1420	INPUT " ",INDEX.NAME$(KEY.NO%),KEY.LENGTH%(KEY.NO%),KEY.TYPE%(_
		KEY.NO%),MAX.KV%(KEY.NO%),REC.SUFFIX$(KEY.NO%),KEY.POSITION%(_
		KEY.NO%)
1425	IF REC.SUFFIX$(KEY.NO%)="y" THEN REC.SUFFIX$(KEY.NO%)="Y"
1427	IF MAX.KV%(KEY.NO%)=0 THEN _
		MAXKV%=(NODE.SECTORS%*128-8)\(KEY.LENGTH%(KEY.NO%)+2) :_
		MAX.KV%(KEY.NO%)=MAXKV%\2*2 'MAKE SURE ITS EVEN
1430	CALL ACCESS(KEY.NO%,INDEX.NAME$(KEY.NO%),KEY.LENGTH%(KEY.NO%),_
		KEY.TYPE%(KEY.NO%),MAX.KV%(KEY.NO%))
1440	IF ERROR.CODE% <> 0 THEN ERROR.TYPE%=3:GOTO 9000
1450 NEXT KEY.NO%
1500 OPEN "R",1,"DUMMY.$$$",REC.SECTORS%*128
1505 REM  A dummy file provides a buffer area and the ability to
1506 REM  use FIELDed variables.
1510 FIELD 1,1 AS DEL.CHK$
1520 FOR KEY.NO%=0 TO NO.KEYS%-1
1530	FIELD 1,KEY.POSITION%(KEY.NO%)-1 AS DUMMY$,KEY.LENGTH%(KEY.NO%) AS _
		KEY.VALUE$(KEY.NO%)
1540 NEXT KEY.NO%
1550 BUFFER.PTR%=VARPTR(#1)
1560 PRINT
1570 PRINT "=== Please wait while data is processed. ==="
1580 PRINT
2000 CUR.REC.NO%=BEG.REC%:REP.REC.NO%=0
2010 CALL READD(CUR.DAT.FILE%,CUR.REC.NO%,BUFFER.PTR%)
2020 WHILE ERROR.CODE% = 0
2030	IF DEL.CHK$=CHR$(255) AND DEL.FF$="Y" THEN GOTO 2140
2035	CALL NEWDAT(REP.DAT.FILE%,REP.REC.NO%)
2040	REP.REC.NO$=MKI$(REP.REC.NO%)
2050	FOR KEY.NO%=0 TO NO.KEYS%-1
2051	REM
2052	REM  The calls to READD bring the data into the I/O buffer
2053	REM  pointed to by BUFFER.PTR%. This automatically causes
2054	REM  the FIELDed variables "KEY.VALUE$()" to be set to the
2055	REM  data fields described by KEY.POSITION% and KEY.LENGTH%.
2056	REM
2060		KEY$=KEY.VALUE$(KEY.NO%)
2070		IF REC.SUFFIX$(KEY.NO%)="Y" THEN _
			KEY$=LEFT$(KEY$,KEY.LENGTH%(KEY.NO%)-2)+REP.REC.NO$
2080		CALL ENTER(KEY.NO%,KEY$,REP.REC.NO%,RET.CODE%)
2090		IF ERROR.CODE% <> 0 THEN ERROR.TYPE%=4:GOTO 9000
2100		IF RET.CODE% <> 1 THEN _
			PRINT "RETURN CODE,KEY.NO%,OLD REC #,NEW REC#:", _
				RET.CODE%;KEY.NO%,CUR.REC.NO%,REP.REC.NO%
2110	NEXT KEY.NO%
2120	CALL WRITED(REP.DAT.FILE%,REP.REC.NO%,BUFFER.PTR%)
2130	IF ERROR.CODE% <> 0 THEN ERROR.TYPE%=5:GOTO 9000
2140	CUR.REC.NO%=CUR.REC.NO%+1
2150	CALL READD(CUR.DAT.FILE%,CUR.REC.NO%,BUFFER.PTR%)
2160 WEND
2170 FOR KEY.NO%=0 TO NO.KEYS%-1
2180	CALL RSTRCT(KEY.NO%)
2190 NEXT KEY.NO%
2200 CALL CLOSED(REP.DAT.FILE%)
2210 PRINT :PRINT "=== RECREATE TERMINATING ==="
2220 CUR.REC.NO%=CUR.REC.NO%-BEG.REC%
2230 PRINT TAB(10);"AFTER";CUR.REC.NO%;"RECORDS PROCESSED"
2240 PRINT TAB(10);"LAST RECORD IN NEW FILE IS #";REP.REC.NO%
2250 PRINT TAB(10);"TERMINATION CODE IS";ERROR.CODE%
2260 CLOSE 1
2270 KILL "DUMMY.$$$"
2280 STOP
9000 PRINT :PRINT "User Error #";ERROR.CODE%;"occurred while trying to ";
9010 ON ERROR.TYPE% GOTO 9100,9200,9300,9400,9500
9100 PRINT "open file: ";CUR.DAT.FILE$ :STOP
9200 PRINT "open file: ";REP.DAT.FILE$ :STOP
9300 PRINT "ACCESS index: ";INDEX.NAME$(KEY.NO%) :STOP
9400 PRINT "add a key value to: ";INDEX.NAME$(KEY.NO%)
9410 PRINT "The key value came from record #";CUR.REC.NO%;" in ";CUR.DAT.FILE$
9420 STOP
9500 PRINT "write a record to ";REP.DAT.FILE$
9510 PRINT "The data came from old record #";CUR.REC.NO%;" and was to go"
9520 PRINT "in new record #";REP.REC.NO%
9530 STOP

	 