C
C********************************************************
C*							*
C*	PROGRAM DISK FILE NAME:		"OTHELLO.FOR"	*
C*							*
C*	THIS PROGRAM WAS TAKEN FROM THE PUBLIC DOMAIN	*
C*	AND ALL CONSOLE I/O WAS TAKEN OUT AND REPLACED	*
C*	WITH ROUTINES IN THE FILE "BOARD.MAC".		*
C*							*
C********************************************************
C
      PROGRAM OTHELLO
C
      INTEGER B(10,10),DIR(30,8)
      INTEGER MOVEI,MOVEJ 
C
      DIMENSION IAA(8),JAA(8),MOVESI(30)
     1,MOVESJ(30),LC(30),NFLIP(30)
C
      COMMON /BLK1/ OC
C
      DATA IAA/-1,-1,-1,0,1,1,1,0/
      DATA JAA/-1,0,1,1,1,0,-1,-1/
C
C********************************************************
C*							*
C*	INITIALIZE THE VARIABLES			*
C*							*
C********************************************************
C
      JFLAG=0
  250 DO 260 I=1,10
      DO 260 J=1,10
      B(I,J)=0
      IF(I.EQ.1.OR.I.EQ.10)B(I,J)=100 
  260 IF(J.EQ.1.OR.J.EQ.10)B(I,J)=100 
      B(5,5)=1
      B(5,6)=-1 
      B(6,5)=-1 
      B(6,6)=1
C
  265 CALL MES01
      CALL GETRES(IRESP)
      OC=1
      IF(IRESP.EQ.78)GOTO 310
      CALL HANDIC(OC,B,NHD)
      NM=NHD
      CALL BOARDP(B,NM,NHD) 
  270 IF(NM.EQ.60)GOTO 350 
      CALL MOVEG(B,-OC,NM,MOVESI,MOVESJ,DIR,LC,JAA,IAA,IM,NOMVE,NFLIP) 
      IF(IM.EQ.0)GOTO 320
      CALL MES02
      IF(JFLAG.GT.0)GOTO 280
      JFLAG=1.
  280 CALL GETMOV(MOVEI,MOVEJ)
      MOVEI=MOVEI+1
      MOVEJ=MOVEJ+1 
      DO 290 I=1,IM 
  290 IF(MOVESI(I).EQ.MOVEI.AND.MOVESJ(I).EQ.MOVEJ)GOTO 300
      CALL MES04
      GOTO 280 
  300 NM=NM+1 
      CALL BOARDC(MOVESI,MOVESJ,I,IAA,JAA,B,-OC,DIR,LC) 
      CALL BOARDP(B,NM,NHD) 
      GOTO 330
  310 OC=-1 
      CALL HANDIC(OC,B,NHD)
      B(5,7)=1
      B(5,6)=1
      NM=NHD+1
      CALL BOARDP(B,NM,NHD) 
      GOTO 270
  320 CALL MES05
  330 IF(NM.EQ.60)GOTO 350
      CALL MES06
      CALL MOVEG(B,OC,NM,MOVESI,MOVESJ,DIR,LC,JAA,IAA,IM,NOMVE,NFLIP) 
      IF(IM.EQ.0)GOTO 340
      CALL MOVEE(B,OC,NM,MOVESI,MOVESJ,NFLIP,DIR,LC,IM,IF,IAA,JAA)
      MOVEI=MOVESI(IF)-2+1HA
      MOVEJ=MOVESJ(IF)-1
      CALL MES12(MOVEI,MOVEJ)
      CALL BOARDC(MOVESI,MOVESJ,IF,IAA,JAA,B,OC,DIR,LC) 
      NM=NM+1 
      CALL BOARDP(B,NM,NHD) 
      GOTO 270
  340 CALL MES07
      CALL GETRES(IRESP)
      IF(IRESP.EQ.89)GOTO 270 
      IF(IM.NE.0)GOTO 330 
  350 CALL COUNT(B,OC,NOC)
      CALL COUNT(B,-OC,NC)
      IF(NOC.LE.NC)GOTO 360 
      CALL MES08
      GOTO 380
  360 IF(NOC.EQ.NC)GOTO 370 
      CALL MES09
      GOTO 380
  370 CALL MES10
  380 CALL MES11
      CALL GETRES(IRESP)
      IF(IRESP.EQ.89)GOTO 250
  400 CALL MES13
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SUBROUTINE MOVEG(B,OC,NM,MOVESI,MOVESJ,DIR,LC,JAA,IAA,IM
     1,NOMVE,NFLIP) 
C
      INTEGER B(10,10),DIR(30,8)
C
      DIMENSION MOVESI(30),MOVESJ(30),LC(30),NFLIP(30)
     1,IAA(1),JAA(1)
C
      COMMON /BLK1/ OCA 
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      DO 110 I=1,30 
      LC(I)=0 
  110 NFLIP(I)=0
      IM=0
      DO 150 I=2,9 
      DO 150 J=2,9 
      IF(B(I,J).NE.0)GOTO 150
      IC=0
      DO 140 L=1,8
      IA=IAA(L) 
      JA=JAA(L) 
      IAT=I+IA
      JAT=J+JA
      IF(B(IAT,JAT).NE.OC)GOTO 140
      IV=1
  120 IV=IV+1 
      MVI=I+IV*IA 
      MVJ=J+IV*JA 
      IF(B(MVI,MVJ).EQ.0)GOTO 140 
      IF(B(MVI,MVJ).EQ.100)GOTO 140 
      IF(B(MVI,MVJ).EQ.OC)GOTO 120
      IF(IC.EQ.1)GOTO 130
      IM=IM+1 
      IC=1
  130 NFLIP(IM)=NFLIP(IM)+IV
      LC(IM)=LC(IM)+1 
      LDX=LC(IM)
      DIR(IM,LDX)=L 
  140 CONTINUE
      IF(IC.EQ.0)GOTO 150
      MOVESI(IM)=I
      MOVESJ(IM)=J
  150 CONTINUE
      IF(IM.GT.0)GOTO 160
      IF(OCA.NE.OC)GOTO 160
      CALL MES16
  160 RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*	ROUTINE TO PRINT THE GAME BOARD			*
C*							*
C********************************************************
C
      SUBROUTINE BOARDP(B,NM,NHD) 
C
      DIMENSION OUT(3),POUT(10,10)
C
      INTEGER B(10,1)
C
      COMMON /BLK1/ OCA 
C
      DATA OUT/'O','-','X'/ 
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      NMP=NM-NHD
      TOC=OCA 
      CALL COUNT(B,TOC,NOC) 
      TOC=0-TOC 
      CALL COUNT(B,TOC,NC)
      DO 130 I=2,9
      DO 130 J=2,9
      IS=B(I,J)+2 
      POUT(I,J)=OUT(IS)
      CALL PBRD(POUT(I,J))
  130 CONTINUE
      CALL MES14(NMP,NC,NOC)
      RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SUBROUTINE COUNT(B,OC,NOC)
C
      INTEGER B(10,1) 
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      NOC=0
      DO 100 I=2,9
      DO 100 J=2,9
      IF(B(I,J).NE.OC)GOTO 100
      NOC=NOC+1
  100 CONTINUE
      RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SUBROUTINE BOARDC(MOVESI,MOVESJ,IF,IAA,JAA,B,OC,DIR,LC) 
C
      INTEGER B(10,10),DIR(30,8)
C
      DIMENSION MOVESI(30),MOVESJ(30),IAA(1),JAA(1),LC(30)
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      MI=MOVESI(IF) 
      MJ=MOVESJ(IF) 
      B(MI,MJ)=-OC
      NDIR=LC(IF) 
      DO 110 I=1,NDIR
      L=DIR(IF,I) 
      IA=IAA(L) 
      JA=JAA(L) 
      IV=0
  100 IV=IV+1 
      MVI=MI+IV*IA
      MVJ=MJ+IV*JA
      IF(B(MVI,MVJ).EQ.-OC)GOTO 110
      B(MVI,MVJ)=-OC
      GOTO 100 
  110 CONTINUE
      RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SUBROUTINE MOVEE(B,OC,NM,MOVESI,MOVESJ,NFLIP,DIR,LC 
     1,IM,IF,IAA,JAA) 
C
      INTEGER B(10,1),DIR(30,1),BT(10,10),BTT(10,10),DIRB(20,8) 
     1,BTTS(9,9,20),DIRBB(20,8)
C
      DIMENSION MOVESI(1),MOVESJ(1),LC(1),NFLIP(1),MBI(20),MBJ(20)
     1,LCB(20),NFLIPB(30),IAA(1),JAA(1),IY(24),JY(24) 
     2,IMID(24),JMID(24),ID(24),JD(24),NCORNI(4),NCORNJ(4)
     3,MBBI(20),MBBJ(20),LCBB(20),NFLIB(30) 
C
      DATA NCORNI,NCORNJ/2,2,9,9,2,9,9,2/ 
      DATA ID,JD/3,4,5,6,7,8,6*9,8,7,6,5,4,3,12*2,3,4,5,6,7,8 
     1,6*9,8,7,6,5,4,3/ 
      DATA IY,JY/5,1,3,8,1,6,9,1,9,9,1,9,6,1,8,3,1,5,2,1,2,2,1,2
     1,2,1,2,2,1,2,5,1,3,8,1,6,9,1,9,9,1,9,6,1,8,3,1,5/ 
      DATA IMID,JMID/4,1,4,7,1,7,9,1,9,9,1,9,7,1,7,4,1,4,2,1,2
     1,2,1,2,2,1,2,2,1,2,4,1,4,7,1,7,9,1,9,9,1,9,7,1,7,4,1,4/ 
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      ICO=0 
      IF=1
      IF(NM.EQ.59)GOTO 390 
      DO 170 I=1,IM
      MI=MOVESI(I)
      MJ=MOVESJ(I)
      IF(MI.NE.3.AND.MI.NE.8)GOTO 100
      IF(MJ.NE.3.AND.MJ.NE.8)GOTO 100
      IF(MI.EQ.3.AND.MJ.EQ.3)IC=1 
      IF(MI.EQ.3.AND.MJ.EQ.8)IC=2 
      IF(MI.EQ.8.AND.MJ.EQ.8)IC=3 
      IF(MI.EQ.8.AND.MJ.EQ.3)IC=4 
      NCI=NCORNI(IC)
      NCJ=NCORNJ(IC)
      IF(B(NCI,NCJ).EQ.0)NFLIP(I)=NFLIP(I)-50 
  100 IF(MI.NE.2.AND.MI.NE.9)GOTO 110
      IF(MJ.NE.2.AND.MJ.NE.9)GOTO 110
      ICO=ICO+1 
      NFLIP(I)=NFLIP(I)+60
  110 IF(MI.LE.3.OR.MI.GE.8)GOTO 120
      IF(MJ.LE.3.OR.MJ.GE.8)GOTO 120
      NFLIP(I)=NFLIP(I)+10
      GOTO 170 
  120 ND=LC(I)
      DO 160 J=1,ND 
      L=DIR(I,J)
      IA=IAA(L) 
      JA=JAA(L) 
      IV=1
  130 IV=IV+1 
      MVI=MI+IV*IA
      MVJ=MJ+IV*JA
      IF(B(MVI,MVJ).EQ.OC)GOTO 130
  140 IV=IV+1 
      MVI=MI+IV*IA
      MVJ=MJ+IV*JA
      IF(B(MVI,MVJ).EQ.OC)GOTO 150
      IF(B(MVI,MVJ).NE.-OC)GOTO 160 
      GOTO 140
  150 MIT=MI-IA 
      MJT=MJ-JA 
      IF(B(MIT,MJT).NE.0)GOTO 160 
      NFLIP(I)=NFLIP(I)-5 
      GOTO 170 
  160 CONTINUE
  170 CONTINUE
      DO 370 I=1,IM
      NSUBO=0 
      MI=MOVESI(I)
      MJ=MOVESJ(I)
      IC=0
      DO 180 K=1,10
      DO 180 J=1,10
  180 BT(K,J)=B(K,J)
      LL=0
      DO 190 J=1,24
      IPP=ID(J) 
      JPP=JD(J) 
      IF(MOVESI(I).NE.IPP.OR.MOVESJ(I).NE.JPP)GOTO 190 
      LL=J
  190 CONTINUE
      CALL BOARDC(MOVESI,MOVESJ,I,IAA,JAA,BT,OC,DIR,LC) 
      CALL MOVEG(BT,-OC,NM,MBI,MBJ,DIRB,LCB,JAA,IAA,IM1 
     1,NOMVE,NFLIPB)
      IF(IM1.NE.0)GOTO 200 
      NFLIP(I)=NFLIP(I)+100 
      GOTO 370 
  200 DO 300 J=1,IM1 
      DO 210 K=1,10
      DO 210 L=1,10
  210 BTT(K,L)=BT(K,L)
      CALL BOARDC(MBI,MBJ,J,IAA,JAA,BTT,-OC,DIRB,LCB) 
      IF(LL.EQ.0)GOTO 230
      IC=1
      IZ=IY(LL) 
      JZ=JY(LL) 
      IF(B(IZ,JZ).NE.-OC)GOTO 220
      MK=JMID(LL) 
      ML=IMID(LL) 
      IF(B(ML,MK).EQ.0)NSUBO=90 
  220 IF(BTT(MI,MJ).NE.OC)GOTO 230 
      NFLIP(I)=NFLIP(I)-40
      IC=2
  230 CONTINUE
      CALL COUNT(BTT,-OC,NOC) 
      IF(NOC.GT.0)GOTO 240 
      NFLIP(I)=NFLIP(I)-200 
      GOTO 370 
  240 DO 250 K1=2,9
      DO 250 K2=2,9
  250 BTTS(K1,K2,J)=BTT(K1,K2)
      DO 270 IL=2,9 
      DO 270 JL=2,9 
      IF(BTT(IL,JL).EQ.0)GOTO 270 
      IF(BTT(IL,JL).EQ.OC)GOTO 270
      DO 270 IZ=1,8
      IV=0
  260 IV=IV+1 
      ILL=IL+IV*IAA(IZ) 
      JLL=JL+IV*JAA(IZ) 
      IF(BTT(ILL,JLL).EQ.0)GOTO 300
      IF(BTT(ILL,JLL).EQ.100)GOTO 300
      IF(BTT(ILL,JLL).NE.OC)GOTO 260 
  270 CONTINUE
      CALL MOVEG(BTT,OC,NM,MBBI,MBBJ,DIRBB,LCBB,JAA,IAA,IM2 
     1,NOMVE,NFLIB) 
      IF(IM2.EQ.0)GOTO 290
      DO 280 IL=1,IM2 
      IF(MBBI(IL).NE.2.OR.MBBI(IL).NE.9)GOTO 280
      IF(MBBJ(IL).NE.2.OR.MBBJ(IL).NE.9)GOTO 280
      GOTO 300 
  280 CONTINUE
  290 NFLIP(I)=NFLIP(I)-190 
  300 CONTINUE
      IF(IC.NE.1)GOTO 330
      DO 320 K=3,24
      IQ=ID(K)
      JQ=JD(K)
      IF(MI.EQ.IQ.AND.MJ.EQ.JQ)GOTO 320
      IF(B(IQ,JQ).NE.-OC)GOTO 320
      DO 310 K1=1,IM1
  310 IF(BTTS(IQ,JQ,K1).EQ.OC)NFLIP(I)=NFLIP(I)-8 
  320 CONTINUE
      NFLIP(I)=NFLIP(I)+25-NSUBO
  330 DO 360 K=1,4 
      KC1=NCORNI(K) 
      KC2=NCORNJ(K) 
      IF(B(KC1,KC2).NE.0)GOTO 360
      DO 340 K1=1,IM1
  340 IF(BTTS(KC1,KC2,K1).EQ.OC)NFLIP(I)=NFLIP(I)-55
      IF(ICO.LE.1)GOTO 360 
      IF(MI.EQ.KC1.AND.MJ.EQ.KC2)GOTO 360
      DO 350 K1=1,IM1
  350 IF(BTTS(KC1,KC2,K1).EQ.OC)NFLIP(I)=NFLIP(I)-20
  360 CONTINUE
  370 CONTINUE
      NFLIPM=-800 
      DO 380 I=1,IM
      IF(NFLIP(I).LT.NFLIPM)GOTO 380 
      NFLIPM=NFLIP(I) 
      IF=I
  380 CONTINUE
  390 RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SUBROUTINE HANDIC(OC,B,NHD)
C
      INTEGER B(10,1) 
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      NHD=0 
  160 CALL MES17
      CALL GETRES(IRESP)
      IF(IRESP.EQ.89)GOTO 190
  170 CALL MES18
      CALL GETRES(IRESP)
      IF(IRESP.EQ.78)GOTO 210
  180 NAH=(-OC)
      GOTO 200
  190 NAH=OC
  200 CALL GETHND(NHD)
      CALL HANDI(B,NHD,NAH,OC)
  210 CALL SETUP
      RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SUBROUTINE HANDI(B,NHD,NAH,OC)
C
      INTEGER B(10,1) 
      INTEGER NCORNI(4),NCORNJ(4) 
C
      DATA NCORNI,NCORNJ/2,2,9,9,2,9,9,2/ 
C
C********************************************************
C*							*
C*
C*							*
C********************************************************
C
      SIGN=-1.0 
      IF(NAH.EQ.OC)SIGN=1.0 
      DO 100 I=1,NHD
      I1=NCORNI(I)
      I2=NCORNJ(I)
  100 B(I1,I2)=SIGN*OC
      RETURN
C
C********************************************************
C*							*
C*	END OF SOURCE CODE LISTING			*
C*							*
C********************************************************
C
	END 
