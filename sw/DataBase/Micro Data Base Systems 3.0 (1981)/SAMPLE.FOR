C	   This is a sample program designed to demonstrate
C	the techinque of interfacing MDBS 3 to a host language.
C	It is in no way intended as an applications program and
C	no claims are made for it's fitness for use.
C
C	   The following implicit statement must be included so that
C	the compiler knows to type all the DMS function calls as integer.
C	Remember that this will require you to explicitly type all of
C	your real variables.  If this is not acceptable, you may omit
C	the implicit statement in your programs and explicitly declare
C	each DMS function as integer.
C
	IMPLICIT INTEGER (A-Z)
C
C	Declare/dimension variables
C
	INTEGER S1,S2,S3,S4,S5
	INTEGER PAGES,VOLUMS
	REAL COST,RATING
	LOGICAL PBF(4000),XA,XB,XK,XS,XL,XQ,BLANK,OPT
	LOGICAL LA,LB,LK,LL,LS,LQ
	LOGICAL DBU(16),DBP(12),DBO(4),DBF(14)
	LOGICAL BTITLE(30),AUTHOR(60),PURDT(10),RTIME(9),KEYW(16)
C
        DATA XA,XB,XK,XL,XS,XQ/'A','B','K','L','S','Q'/,
     1	     LA,LB,LK,LL,LS,LQ/'a','b','k','l','s','q'/,
     2       BLANK/' '/
C
C		Display banner
C
	WRITE(1,1)
1	FORMAT('         ** MDBS Books/Keyword sample program **'/)
C
C		Set page buffer
C
        IER=SETPBF(PBF,4000)
	IF (IER.NE.0) GO TO 90000
C
C		Define open block
C
	IER=DEFINE('OPEN.',4,DBU,DBP,DBO,DBF)
	IF (IER.NE.0) GO TO 90000
C
C		Open data base
C
	ENCODE(DBU,11)
11	FORMAT('TESTUSER        ')
	ENCODE(DBP,12)
12	FORMAT('PASSWORD    ')
	ENCODE(DBO,13)
13	FORMAT('M   ')
	ENCODE(DBF,14)
14	FORMAT('SAMPLE.DB     ')

	IER=DBOPN('OPEN.')
	IF (IER.NE.0) GO TO 90000
C
C		Define book block
C
	IER=DEFINE('BOOK.',4,BTITLE,AUTHOR,PURDT,PAGES)
	IF (IER.NE.0) GO TO 90000
	IER=EXTEND('BOOK.',4,VOLUMS,RTIME,COST,RATING)
	IF (IER.NE.0) GO TO 90000
C
C		Define book title block
C
	IER=DEFINE('BOOKT.',1,BTITLE)
	IF (IER.NE.0) GO TO 90000
C
C		Define Keyword block
C
	IER=DEFINE('KEYW.',1,KEYW)
	IF (IER.NE.0) GO TO 90000
C
C		Define Stat block
C
	IER=DEFINE('STAT.',5,S1,S2,S3,S4,S5)
	IF (IER.NE.0) GO TO 90000
C
C		Alter end of set error code
C	We recommend using ALTEOS as it simplifies error checking
C	on commands that could return an end of set error.
C
	IER=ALTEOS(0)
	IF (IER.NE.0) GO TO 90000
C
C		*** Main Program ***
C
100	WRITE(1,9000)
9000	FORMAT(//' A) Add new book/add keywords to book'/
     1		 ' K) List keywords for given book'/
     2		 ' B) List books for given keyword'/
     3		 ' L) List entire data base'/
     4		 ' S) Data base stats'/
     5		 ' Q) Quit'/)
110	WRITE(1,9010)
9010	FORMAT(/' Your option? ')
	READ(1,9020) OPT
9020	FORMAT(A1)
	IF ((OPT.EQ.XA).OR.(OPT.EQ.LA)) GO TO 1000
	IF ((OPT.EQ.XK).OR.(OPT.EQ.LK)) GO TO 2000
	IF ((OPT.EQ.XB).OR.(OPT.EQ.LB)) GO TO 3000
	IF ((OPT.EQ.XL).OR.(OPT.EQ.LL)) GO TO 4000
	IF ((OPT.EQ.XS).OR.(OPT.EQ.LS)) GO TO 5000
	IF ((OPT.EQ.XQ).OR.(OPT.EQ.LQ)) GO TO 91000
	WRITE(1,9030)
9030	FORMAT(/' A, B, K, L, S, or Q only please'/)
	GO TO 110
C
C		Add new book/add keywords to book
C
1000	WRITE(1,9040)
9040	FORMAT(/' Book title? ')
	READ(1,9050) BTITLE
9050	FORMAT(30A1)
	IF (BTITLE(1).EQ.BLANK) GO TO 100
	IER=FMSK('BOOKS,BOOKT.')
	IF (IER.GT.0) GO TO 90000
	IF (IER.EQ.0) GO TO 1010
C		Create new book
	WRITE(1,9060)
9060	FORMAT('+Authors? ')
	READ(1,9065) AUTHOR
9065	FORMAT(60A1)
	WRITE(1,9070)
9070	FORMAT('+Purchase date (mm/dd/yyyy)? ')
	READ(1,9075) PURDT
9075	FORMAT(10A1)
	WRITE(1,9080)
9080	FORMAT('+Number of pages? ')
	READ(1,9085) PAGES
9085	FORMAT(I5)
	WRITE(1,9090)
9090	FORMAT('+How many volumes? ')
	READ(1,9085) VOLUMS
	WRITE(1,9100)
9100	FORMAT('+Reading time (hh:mm:ss)? ')
	READ(1,9105) RTIME
9105	FORMAT(9A1)
	WRITE(1,9110)
9110	FORMAT('+Cost? ')
	READ(1,9115) COST
9115	FORMAT(F10.2)
	WRITE(1,9120)
9120	FORMAT('+Rating (0.0 to 999.99)? ')
	READ(1,9115) RATING
	IER=CRS('BOOK,BOOK.')
	IF ((IER.NE.0).AND.(IER.NE.30).AND.(IER.NE.33)) GO TO 90000
	IF (IER.EQ.0) GO TO 1010
	IF (IER.EQ.30) WRITE(1,9140)
9140	FORMAT('+** Data value out of range **'/)
	IF (IER.EQ.33) WRITE(1,9142)
9142	FORMAT('+** Data conversion error **'/)
	GO TO 1000
C
C	Note: At this point, if you wanted to protect your data base
C	      from a power failure or an untrappable program abort,
C	      you could use the DBSAVE command to flush any unwritten
C	      page buffers thus preventing logical corruption of your
C	      data base.  eg:
C	IER=DBSAVE(0)
C	IF (IER.NE.0) GO TO 90000
C
1010	IER=SOM('LINK,BOOKS.')
	IF (IER.GT.0) GO TO 90000
C		Get keywords
1020	WRITE(1,9150)
9150	FORMAT('+Keyword? ')
	READ(1,9155) KEYW
9155	FORMAT(16A1)
	IF (KEYW(1).EQ.BLANK) GO TO 100
C		look for keyword, if found don't create it
	IER=FMSK('KEYWORDS,KEYW.')
	IF (IER.GT.0) GO TO 90000
	IF (IER.EQ.0) GO TO 1030
	WRITE(1,9160)
9160	FORMAT('+(New Keyword)'/)
	IER=CRS('KEYWORD,KEYW.')
	IF (IER.NE.0) GO TO 90000
C		attribute keyword to book
1030	IER=IMS('LINK.')
	IF ((IER.NE.0).AND.(IER.NE.11)) GO TO 90000
C  Note: You could use DBSAVE here also
	IF (IER.EQ.0) GO TO 1020
	WRITE(1,9170)
9170	FORMAT('+** Keyword already attributed to book **'/)
	GO TO 1020
C
C		List all keywords for a given book
C
2000	WRITE(1,9180)
9180	FORMAT(//' Book title? ')
	READ(1,9050) BTITLE
	IF (BTITLE(1).EQ.BLANK) GO TO 100
	IER=FMSK('BOOKS,BOOKT.')
	IF (IER.GT.0) GO TO 90000
	IF (IER.EQ.0) GO TO 2010
	WRITE(1,9190)
9190	FORMAT('+** Book not found **')
	GO TO 2000
2010	IER=SOM('LINK,BOOKS.')
2020	IF (IER.GT.0) GO TO 90000
	IF (IER.LT.0) GO TO 2000
	IER=GETM('LINK,KEYW.')
	IF (IER.NE.0) GO TO 90000
	WRITE(1,9200) KEYW
9200	FORMAT('+',16A1/)
	IER=FNM('LINK.')
	GO TO 2020
C
C		Display all books for given keyword
C
3000	WRITE(1,9210)
9210	FORMAT(//' Keyword? ')
	READ(1,9155) KEYW
	IF (KEYW(1).EQ.BLANK) GO TO 100
	IER=FMSK('KEYWORDS,KEYW.')
	IF (IER.GT.0) GO TO 90000
	IF (IER.EQ.0) GO TO 3010
	WRITE(1,9220)
9220	FORMAT('+** Keyword not found **')
	GO TO 3000
3010	IER=SMM('LINK,KEYWORDS.')
3020	IF (IER.GT.0) GO TO 90000
	IF (IER.LT.0) GO TO 3000
	IER=GFO('TITLE,LINK,BOOKT.')
	IF (IER.NE.0) GO TO 90000
	WRITE(1,9230) BTITLE
9230	FORMAT('+',30A1/)
	IER=FNO('LINK.')
        GO TO 3020
C
C		List entire data base
C
4000	WRITE(1,9240)
9240	FORMAT(/' Keywords:'/)
	IER=FFM('KEYWORDS.')
4010    IF (IER.GT.0) GO TO 90000
	IF (IER.NE.0) GO TO 4020
	IER=GETM('KEYWORDS,KEYW.')
	IF (IER.NE.0) GO TO 90000
	WRITE(1,9200) KEYW
	IER=FNM('KEYWORDS.')
	GO TO 4010
4020	WRITE(1,9250)
9250	FORMAT(//' Books:'/)
	IER=FFM('BOOKS.')
4030    IF (IER.GT.0) GO TO 90000
	IF (IER.NE.0) GO TO 100
	IER=GETM('BOOKS,BOOK.')
	IF (IER.NE.0) GO TO 90000
	WRITE (1,9260) BTITLE,AUTHOR,PURDT,PAGES,
     1			VOLUMS,RTIME,COST,RATING
9260	FORMAT (/'  Title: ',30A1/
     1		'  Authors: ',60A1/
     2		'  Purchase date: ',10A1/
     3		'  Pages: ',I5/
     4		'  Volumes: ',I5/
     5		'  Reading time: ',9A1/
     6		'  Cost: ',F10.2/
     7		'  Rating: ',F10.2/)
	IER=FNM('BOOKS.')
	GO TO 4030
C
C		Data base stats
C
5000	IER=DBSTAT('STAT.')
	IF (IER.NE.0) GO TO 90000
	WRITE(1,9270) S1,S2,S3,S4,S5
9270	FORMAT(/'  Page buffers            ',I5/
     1		'  Page faults             ',I5/
     2		'  Reads                   ',I5/
     3		'  Immediate writes        ',I5/
     4		'  Total writes            ',I5/)
	GO TO 100
C
C		DMS error trap
C
90000	WRITE(1,9280) IER
9280	FORMAT(/' ** Dms error ',I3,' encountered **'/)
C
C		Quit
C
91000	IER=DBCLS(0)
	IF ((IER.NE.0).AND.(IER.NE.38)) WRITE(1,9290) IER
9290	FORMAT(' ** Dms error ',I3,' encountered during close **'/)
	STOP
	END
