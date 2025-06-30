C	MASTER HOROSCOPE CASTING
	INTEGER D,M,Y,TBH,TBM,TBS,MD(12),YLAST
	CHARACTER*4 WEEK(7),IPT(8),MONTH(12)
      INTEGER MARK(5),RET,SPACE                                         
	REAL LONGDE,LATDEG
      DIMENSION ZA(2),ZB(2),ZC(2),ZD(2) ,         IMARK(10)   
      DIMENSION KDEG(8),KMIN(8),MDP(12),TSECD(10),TNLSEC(10)     
      DIMENSION KSEC(8)                                                 
      COMMON/BLKTT/TT                                                   
      COMMON/BLK4/ISTH,ISTM,ISTS                                        
      COMMON/BLKT/T                                                     
      COMMON/BLK0/RAD,RADSEC                                            
      COMMON/BLK1/TBSEC,DT                                              
      COMMON/BLK6/G,XR                                                  
      COMMON/BLK9/SML,SEC                                               
	COMMON /BLK3/STSEC,LONDEG,LATDEG
	COMMON/BLKTSE/TSEC(10)
      COMMON/BLKOE/OE                                                   
      COMMON/BLK8/EC,SUNSEC                                             
      COMMON/BLKERV/ERV                                                 
	DATA IPT/'SUN ','MOON','MARS','MERC','JUPR','VNUS','SATN','RAHU'/
      DATA MDP/31,28,31,30,31,30,31,31,30,31,30,31/                     
	DATA WEEK/'SU  ','MO  ','TU  ','WE  ','TH  ','FR  ','SA  '/
      DATA MD/0,31,59,90,120,151,181,212,243,273,304,334/               
      DATA RET/' R  '/ ,SPACE/'    '/                                   
      DATA MONTH /'JAN ','FEB ','MAR ','APR ','MAY ','JUN ','JUL ',     
     1'AUG ','SEP ','OCT ','NOV ','DEC '/
  91  CONTINUE                                                          
      WRITE (4,90)                                                      
   90 FORMAT (1H1 )                                                     
	D=1;M=1;Y=1958;YLAST=1959;LGD=80;LGM=15;LTD=13;LTM=4
C  READ (1,10 ) D,M,Y,YLAST,LGD,LGM,LTD,LTM                          
  10  FORMAT(8I4)                                                      
      TBH=5                                                             
      TBM= 30                                                           
      TBS = 0                                                           
      RAD=0.0174532925199430                                            
      RADSEC=206264.8062470964                                          
 201  CONTINUE                                                          
      IF(Y.GE.YLAST) S T O P                                            
      IY1=Y-1900                                                        
      ID1=IY1*365                                                       
	ID2=(IY1-1)/4
	ID3=MD(M)
      DT=ID1+ID2+ID3+D                                                  
      IF (IY1-4*ID2 .EQ. 4 .AND. ID3 .GE. 59) DT=DT+1                   
	NDT=DT/7
      MDT=(DT-NDT*7)+1                                                  
20	LONGDE=LGD+LGM/60
	LATDEG=LTD+LTM/60
	TBSEC=TBH*3600.+TBM*60.+TBS
      GMT=TBSEC-19800.                                                  
	TBDAYS=GMT/86400.
	DTB=DT+TBDAYS
	TT=(DTB-0.5)/36525.
	BCORR=28.696286-0.8971143*IY1+0.022485714*IY1**2
      IF(Y.GT.1920)BCORR= 5.2566637+0.82075454*IY1-0.0026385976*IY1**2  
      DELTAT=24.349+72.318*TT+29.95*TT**2-BCORR                         
      TBSEC1=TBSEC+DELTAT                                               
      GMT=TBSEC1-19800.                                                 
	TBDAYS=GMT/86400.
	DTB=DT+TBDAYS
	ZA(1)=DTB/36525.
	ZA(2)=ZA(1)+1./(12.*36525.)
	ZB(1)=(DTB-0.5)/36525.
	ZB(2)=ZB(1)+1./(12.*36525.)
	CALL SIDERA
      T=ZA(1)                                                           
      OE=84428.26-46.845*T-0.0060*T**2  + 0.00183 *T**3                 
	OE=OE/RADSEC
	DO 300 J=1,2
      T=ZA(J)                                                           
      G=1288738.960+129596579.10*T-0.5410*T**2                          
	CALL CONVER(G)
	ZC(J)=G/RADSEC
	XR=933155.110-6962911.230*T+7.480*T**2
	CALL CONVER(XR)
      ZD(J)=XR                                                          
  300 CONTINUE                                                          
	TSEC(9)=ZD(1)
      T=ZA(2)                                                           
      TT=ZB(2)                                                          
      G=ZC(2)                                                           
      XR=ZD(2)                                                          
      CALL SUN                                                          
      DO 310 J=2,2                                                      
  310 TSECD(J)=TSEC(J+2)                                                
      T=ZA(1)                                                           
      TT=ZB(1)                                                          
      G=ZC(1)                                                           
      XR=ZD(1)                                                          
      CALL SUN                                                          
      DO 320 J=2,2                                                      
      MARK(J-1)=SPACE                                                   
      IF(TSECD(J).LT.TSEC(J+2)) MARK(J-1)=RET                           
  320 CONTINUE                                                          
	AYANAM=80857.650+5025.750*TT+1.11*TT**2
	CALL DEGMIN(AYANAM,ICPAD,ICPAM,ICPAS)
      IF(D.EQ.1) WRITE(4,90)                                            
      IF(D.EQ.1) WRITE(4,215) ICPAD,ICPAM,ICPAS,MONTH(M),Y,IPT(2)       
  215 FORMAT(1H,24HCHITRA PAKSHA AYANAM =     ,I3,1HD,I3,1HM,I3,1HS,  
     15H FOR ,A4,I8/22X,A4/)                                            
      DO 100 I=2,2                                                      
	TNLSEC(I)=TSEC(I)-AYANAM
	CALL CONVER(TNLSEC(I))
	CALL DEGMIN(TNLSEC(I),NDEG,NMIN,NSEC)
      IMARK(I) = SPACE                                                  
100	CONTINUE
      WRITE(1,205) D,WEEK(MDT),ISTH,ISTM,ISTS, NDEG,NMIN,NSEC ,IMARK(2) 
 205  FORMAT(2X,I2,2X,A4,3I3,2X,1X,1X,I3,1X,I3,1X,I3,A4)                        
      D= D+1                                                            
      IF(D.GT.(MDP(M)+KDM)) GO TO 500                                   
      GO TO 201                                                         
 500  D= 1                                                              
      M=M+1                                                             
      IF(M.GT.12) GO TO 502                                             
      GO TO 201                                                         
502	Y=Y+1
      M= 1                                                              
      STOP                                                              
      END                                                               
      SUBROUTINE SUN                                                    
      COMMON /BLK1/ TBSEC,DT                                            
      COMMON /BLK6/ G,XR                                                
      COMMON /BLK8/ EC,SUNSEC                                           
      COMMON /BLK0/ RAD,RADSEC                                          
      COMMON /BLK9/ SML,SEC                                             
      COMMON /BLKTT/TT                                                  
      COMMON /BLKT/ T                                                   
      COMMON /BLKERV/ ERV                                               
      COMMON /BLKTSE/ TSEC(10)                                         
      SL=1005133.880+129602768.130*T+ 1.0890*T**2                       
      CALL CONVER (SL)                                              
      SML=SL                                                            
      EE=0.016751040-0.00004181*TT-0.0000001260*TT**2                   
      CALL EQCENT (EE,G,SEC)                                          
      CALL RADIUS  (1.000000230,EE,G,ERV)                         
      SLPT=6.40*SIN(231.19*RAD+20.20*RAD*T)+(1.8820-0.0160*T)*SIN(57.240
     1*RAD+150.27*RAD*T)+0.2260*SIN(31.80*RAD+119.0*RAD*T)+0.2020*      
     2SIN(315.60*RAD+893.30*RAD*T)                                      
      SL=SL+SLPT                                                        
      SSN=-1.270*SIN(2.*SL*RAD/3600.)+0.130*SIN(G)-0.050*SIN(3.*SL*     
     1RAD/3600.+79.0*RAD)                                               
      SLN=-17.230*SIN(XR*RAD/3600.)+0.21*SIN(2.*XR*RAD/3600.)           
      SA=-20.500-0.34*COS(G)                                            
      SUNSEC=SL+SEC                                                     
      CV=225943.61+81066394.75*T+0.0258*T**2                            
      Q=CV-648000.                                                      
      CALL CONVER (Q)                                               
      Q=Q/RADSEC                                                        
      PERTV=4.84*SIN(Q)-5.53*SIN(2.*Q)-0.67*SIN(3.*Q)-0.21*SIN(4.*Q)    
     1-0.12*SIN(2.*Q+G)-2.50*SIN(G+12.*RAD-2.*Q)-1.56*SIN(G+12.*RAD-3.*Q
     2)+0.14*SIN(G+12.*RAD-4.*Q)-1.02*SIN(2.*G+40.*RAD-3.*Q)            
     3-0.15*SIN(2.*G+40.*RAD-4.*Q)+0.12*SIN(2.*G+40.*RAD-5.*Q)          
     4-0.15*SIN(3.*G+56.*RAD-5.*Q)                                      
      CJ=148306.19+118672080.98*T+(-0.116*T**2)                         
      CALL CONVER (CJ)                                              
      Q=648000.-CJ                                                      
      CALL CONVER (Q)                                               
      Q=Q/RADSEC                                                        
      PERTJ=7.21*SIN(Q-3900./RADSEC)-2.73*SIN(2.*Q-900./RADSEC)         
     1-0.16*SIN(3.*Q+17460./RADSEC)+2.60*SIN(Q+G-305160./RADSEC)        
     2-1.61*SIN(2.*Q+G-22.6*RAD)-0.56*SIN(3.*Q+G+87.2*RAD)              
     3-0.16*SIN(G-Q+20.1*RAD)-0.21*SIN(3.*Q+2.*G+77.*RAD)               
      XM=1051491.46+68910117.33*TT+1.1148*TT**2                         
      CALL CONVER (XM)                                              
      Q=XM-SML+648000.                                                  
      CALL CONVER (Q)                                               
      Q=Q/RADSEC                                                        
      PERTM=2.04*SIN(2.*Q+0.25*RAD)+0.27*SIN(Q-0.6*RAD)-1.77*SIN(2.*Q+G-
     136.2667*RAD)-0.58*SIN(4.*Q+2.*G+84.*RAD)-0.50*SIN(4.*Q+G-47.*RAD) 
     2-0.43*SIN(3.*Q+G-47.7*RAD)                                        
      XMA=1065976.59+1717915856.79*TT+33.09*TT**2+0.0518*TT**3          
      CALL CONVER (XMA)                                             
      DD=1262654.95+1602961611.18*TT-5.17*TT**2+0.0068*TT**3            
      CALL CONVER (DD)                                              
      DD=DD/RADSEC                                                      
      PERTL=6.44*SIN(DD)-0.42*SIN(DD-XMA/RADSEC)                        
      SUNSEC=SUNSEC+PERTV+PERTJ+PERTM+PERTL                             
      CALL CONVER (SUNSEC)                                          
      TSEC(2)=SUNSEC+SSN+SLN+SA                                         
      RETURN                                                            
      END                                                               
        SUBROUTINE SIDERA                                          
      INTEGER D,M,Y,TBH,TBM,TBS                                         
      REAL LONGDE,LATDEG                                               
      COMMON /BLK1/ TBSEC,DT                                            
      COMMON /BLK4/ ISTH,ISTM,ISTS                                      
      COMMON /BLK3/ STSEC,LONGDE,LATDEG                                
      T=DT/36525.                                                       
      DSTSEC=23807.5580+8640184.5420*T+0.0929*T**2                      
      CM=LONGDE*9.8565/15.                                             
      CL=(LONGDE-82.5)*3600./15.                                       
      CI=9.8565*(TBSEC+CL)/3600.                                        
      STSEC=DSTSEC+TBSEC-CM+CI+CL                                       
      ISD=STSEC/86400.                                                  
      STSEC=STSEC-ISD*86400.                                            
      ISTMIN=STSEC/60.                                                  
      STMIN=ISTMIN                                                      
      ISTS=STSEC-STMIN*60.                                              
      ISTH=STMIN/60.                                                    
      ISTM=STMIN-ISTH*60.                                               
      RETURN                                                            
      END                                                               
      SUBROUTINE EQCENT (PE,PA,PEC)                                   
      COMMON /BLK0/ RAD,RADSEC                                          
      PEC=(2.*PE-0.25*PE**3)*SIN(PA)+(1.25*PE**2-11./24.*PE**4)*        
     1SIN(2.*PA)+13./12.*PE**3*SIN(3.*PA)+103./96.*PE**4*SIN(4.*PA)     
      PEC=PEC*RADSEC                                                    
      RETURN                                                            
      END                                                               
      SUBROUTINE RADIUS  (A,PE,PA,PRV)                            
      PRV=A*(1.+PE**2/2.-(PE-3./8.*PE**3)*COS(PA)-(0.5*PE**2-1./3.*PE**4
     1)*COS(2.*PA)-3./8.*PE**3*COS(3.*PA)-1./3.*PE**4*COS(4.*PA))       
      RETURN                                                            
      END                                                               
      SUBROUTINE CONVER(X)                                          
      IX=X/1296000.                                                     
      X=X-IX*1296000.                                                   
      IF (X .LT. 0.) X=X+1296000.                                       
      RETURN                                                            
      END                                                               
      SUBROUTINE DEGMIN(SECOND,IDEG,IMIN,ISEC)                      
      IMIN=(SECOND+0.5)/60.                                            
      IF (SECOND .LT. 0.) SECOND=SECOND+1296000.                     
      ISEC=SECOND-IMIN*60.                                             
      IDEG=IMIN/60.                                                     
      IMIN=IMIN-IDEG*60.                                                
      RETURN                                                            
      END                                                               
