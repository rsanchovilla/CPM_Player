	DOUBLE PRECISION PILOW,SLNGTH,PIUP,FACT
	DOUBLE PRECISION K,SIDES,SUM,SSQ,TERM,TEMP
	WRITE(5,198)
198	FORMAT(/1X,'BOUNDS ON PI - DOUBLE PRECISION BINOMIAL THEOREM VER
     1SION'//'	 N     SIDES	 SIDE LENGTH	 PI - LOWER BOUND   PI-
     2 UPPER BOUND')
	SIDES=4.0
	SUM=2.0
	N=3
1	SIDES=2.0*SIDES
	SSQ=SUM
	SUM=0.0
	TERM=.25*SSQ
	K=1
2	TEMP=TERM+SUM
	IF(TEMP.LE.SUM) GOTO 4
	SUM=TEMP
	FACT=(2.0*K-1.00)/(K+1.0)
	TERM=FACT*SSQ*TERM/8.0
	K=K+1.0
	GOTO 2
4	SLNGTH=DSQRT(SUM)
	PILOW=0.5*SIDES*SLNGTH
	PIUP=SIDES*SLNGTH/(2.0-SLNGTH)
	WRITE(5,200) N,SIDES,SLNGTH,PILOW,PIUP
	IF(N.EQ.20) STOP
	N=N+1
	GOTO 1
200	FORMAT(1X,I3,F9.0,F15.6,2F19.12)
	END
                                                                                                                                