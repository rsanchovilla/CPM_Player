rem	This is a sample program designed to demostrate
rem   the technique of interfaceing MDBS 3 to a host language.
rem	It is in no way intended to be an applications program and
rem   no claims are made for it's fitness for use.

%include fndef.bas

rem		Display banner
	PRINT "** MDBS 3  Books/Keyword sample program **"

rem		Open DB, define data blocks

	DBU$="TESTUSER": DBP$="PASSWORD"
	DBO$="M": DBF$="SAMPLE.DB"
	E0%=DEFINE("OPEN",VARPTR(DBU$),VARPTR(DBP$),VARPTR(DBO$),\
		          VARPTR(DBF$),0,0,0,0,0,0)
	IF E0% THEN 6000

REM		Open data base (note: open block is undefined after open)
	E0%=DBOPN("OPEN")
	IF E0% THEN 6000

rem		Book data block
	E0%=DEFINE("BOOK",VARPTR(TITLE$),VARPTR(AUTHORS$),VARPTR(PURDATE$),\
		          VARPTR(PAGES%),VARPTR(VOLUMES%),VARPTR(READTIME$),\
		          VARPTR(COST),VARPTR(RATING),0,0)
	IF E0% THEN 6000

rem		Keyword/Misc. data block
	E0%=DEFINE("X$",VARPTR(X$),0,0,0,0,0,0,0,0,0)
	IF E0% THEN 6000

rem		Stat data block
	E0%=DEFINE("STAT",VARPTR(S1%),VARPTR(S2%),VARPTR(S3%),VARPTR(S4%),\
		          VARPTR(S5%),0,0,0,0,0)
	IF E0% THEN 6000

rem		Alter end of set
rem	We recommend using this command as it simplifies error checking
rem	on commands that could return end-of-set

	E0%=ALTEOS
	IF E0% THEN 6000

rem		** Main Program **

100	PRINT
	PRINT
	PRINT
	PRINT "A) Add new book/add keywords to book"
	PRINT "B) List all books for given keyword"
	PRINT "K) List all keywords for given book"
	PRINT "L) List entire data base"
	PRINT "S) Data Base stats"
	PRINT "Q) Quit"
110	PRINT
	INPUT "Your option?";LINE O$
	IF O$<>"" THEN O$=UCASE$(O$)
	IF O$="A" THEN 1000
	IF O$="B" THEN 3000
	IF O$="K" THEN 2000
	IF O$="L" THEN 4000
	IF O$="S" THEN 5000
	IF O$="Q" THEN 6500
	PRINT "A, B, K, L, S, or Q only please."
	GOTO 110

rem		Add new book
1000	PRINT
	INPUT "Title? ";LINE X$
	IF X$="" THEN 100
	E0%=FMSK("BOOKS,X$")
	IF E0%>0 THEN 6000
	IF E0%=0 THEN 1050
	TITLE$=X$
	INPUT "Authors? ";AUTHORS$
	INPUT "Purchase date (mm/dd/yyyy)? ";PURDATE$
	INPUT "Number of pages? ";PAGES%
	INPUT "How many volumes? ";VOLUMES%
	INPUT "Reading time (hhh:mm:ss)? ";READTIME$
	INPUT "Cost? ";COST
	INPUT "Rating (0.0 to 999.99)? ";RATING
	E0%=CRS("BOOK,BOOK")
	IF E0%<>0 AND E0%<>30 AND E0%<>33 THEN 6000
	IF E0%=30 THEN PRINT "** Data value out of range **": GOTO 1000
	IF E0%=33 THEN PRINT "** Data conversion error **": GOTO 1000

rem	Note: At this point, if you wanted to protect your data base
rem   from a power failure or an untrappable program abort, you would
rem   use the DBSAVE command which would flush any unwritten buffers
rem   thus preventing logical corruption of your data base.  eg:
rem	E0%=DBSAVE
rem	IF E0% THEN 6000

1050	E0%=SOM("LINK,BOOKS")
	IF E0%>0 THEN 6000
	PRINT
1100	INPUT "Keyword? ";LINE X$
	IF X$="" THEN 100
	E0%=FMSK("KEYWORDS,X$")
	IF E0%>0 THEN 6000
	IF E0%=0 THEN 1200
	PRINT "(New Keyword)"
	E0%=CRS("KEYWORD,X$")
	IF E0% THEN 6000
1200	E0%=IMS("LINK")
	IF E0%<>0 AND E0%<>11 THEN 6000
	IF E0%=11\
	 THEN PRINT "** Keyword already attributed to book **"
rem	Note: you could use DBSAVE here also.
	GOTO 1100

rem		List all keywords for given book

2000	PRINT
	INPUT "Book Title? ";LINE X$
	IF X$="" THEN 100
	E0%=FMSK("BOOKS,X$")
	IF E0%>0 THEN 6000
	IF E0% THEN PRINT "** Book not found **":  GOTO 2000
	E0%=SOM("LINK,BOOKS")
	WHILE E0%=0
	 E0%=GETM("LINK,X$")
	 PRINT X$
	 E0%=FNM("LINK")
	WEND
	PRINT
	GOTO 2000

rem		List all books for given keyword

3000	PRINT
	INPUT "Keyword?";LINE X$
	IF X$="" THEN 100
	E0%=FMSK("KEYWORDS,X$")
	IF E0%>0 THEN 6000
	IF E0% THEN PRINT "** Keyword not found **": GOTO 3000
	E0%=SMM("LINK,KEYWORDS")
	WHILE E0%=0
	 E0%=GFO("TITLE,LINK,X$")
	 IF E0% THEN 6000
	 PRINT X$
	 E0%=FNO("LINK")
	WEND
	PRINT
	GOTO 3000

rem		List entire data base

4000	PRINT
	PRINT "Keywords:"
	E0%=FFM("KEYWORDS")
	IF E0%>0 THEN 6000
	WHILE E0%=0
	 E0%=GETM("KEYWORDS,X$")
	 PRINT " ";X$
	 E0%=FNM("KEYWORDS")
	 IF E0%>0 THEN 6000
	WEND
	PRINT
	PRINT "Books:"
	E0%=FFM("BOOKS")
	IF E0%>0 THEN 6000
	WHILE E0%=0
	 E0%=GETM("BOOKS,BOOK")
	 IF E0% THEN 6000
	 PRINT
	 PRINT " Title: ";TITLE$
	 PRINT " Authors: ";AUTHORS$
	 PRINT " Purchase date: ";PURDATE$
	 PRINT " Pages:";PAGES%
	 PRINT " Volumes:";VOLUMES%
	 PRINT " Reading time: ";READTIME$
	 PRINT " Cost:";COST
	 PRINT " Rating:";RATING
	 E0%=FNM("BOOKS")
	WEND
	GOTO 100

rem		Data Base stats

5000	E0%=DBSTAT("STAT")
	PRINT
	PRINT "Page buffers         ";S1%
	PRINT "Page faults          ";S2%
	PRINT "Reads                ";S3%
	PRINT "Immediate writes     ";S4%
	PRINT "Total writes         ";S5%
	GOTO 100

rem		DMS error routine
6000	PRINT "** DMS error";E0%;" encountered **"

rem		Quit

6500	E0%=DBCLS
	IF E0%<>0 AND E0%<>38 THEN\
	 PRINT "** DMS error";E0%;" during DBCLS **"
END
