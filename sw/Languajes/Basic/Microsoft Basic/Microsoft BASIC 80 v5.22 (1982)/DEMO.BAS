10 REM GRAPHIC DEMONSTRATION PROGRAM FOR P-2000 C COMPACT COMPUTER
20 REM A. BROMBACHER, VIENNA 7-10-'83
30 PRINT CHR$(12)
40 OF%=50
50 J%=6
60 Z%=60
70 ES$=CHR$(27)
80 D=3.14159/180
90 DEF FNMO$(XS%,YS%)=ES$+"m"+CHR$(XS%)+CHR$(YS%)
100 DEF FNMA$(X,Y)=ES$+"m"+CHR$(INT(X))+CHR$(INT(Y))
110 DEF FNDA$(X,Y)=ES$+"M"+CHR$(INT(X))+CHR$(INT(Y))
120 DEF FNDR$(XE%,YE%)=ES$+"M"+CHR$(XE%)+CHR$(YE%)
130 DEF FNMD$(XS%,YS%,XE%,YE%)=FNMA$(XS%/2,YS%+OF%)+FNDA$(XE%/2,YE%+OF%)
140 DEF FNCA$(A%,L%)=CHR$(INT(SIN(D*A%)*L%)+125)+CHR$(INT(COS(D*A%)*L%)+125)
150 DEF FNCI$(A%,L%)=ES$+"m"+FNCA$(A%,L%)
160 DEF FNCL$(A%,L%)=ES$+"v"+FNCA$(A%,L%)
170 DEF FNCM$(A%,L%)=ES$+"M"+FNCA$(A%,L%)
180 PRINT ES$+"c"
190 PRINT CHR$(12):PRINT"Do you want to enter a new system time? (Y) or (N) ";
200 S$=INKEY$
210 IF (S$<>"Y") AND (S$<>"N") THEN 200
220 IF S$="N" THEN 240
230 GOSUB 3600
240 I%=PEEK(&HFFC0):FOR K%=1 TO I%:S$=CHR$(INT(RND)):NEXT
250 DIM MA%(7,4)
260 FOR K%=1 TO J%
270 I%=256-(4*Z%)
280 MA%(K%,1)=INT(RND*I%)+2*Z%:MA%(K%,2)=INT(RND*I%)+2*Z%
290 MA%(K%,3)=INT(12*(RND-.5))
300 MA%(K%,4)=INT(12*(RND-.5))
310 NEXT
320 FOR K%=1 TO 4
330 MA%(J%+1,K%)=MA%(1,K%)
340 NEXT
350 PRINT CHR$(12)
360 PRINT ES$+"5"
370 PRINT ES$+"0"+CHR$(1)
380 PRINT FNMO$(MA%(1,1),MA%(1,2))
390 FOR I%=1 TO 200
400 FOR K%=1 TO J%
410 PRINT FNDR$(MA%(K%+1,1),MA%(K%+1,2))
420 NEXT K%
430 FOR K%=1 TO J%+1
440 MA%(K%,1)=MA%(K%,1)+MA%(K%,3)
450 MA%(K%,2)=MA%(K%,2)+MA%(K%,4)
460 IF (MA%(K%,1)<0 OR MA%(K%,1)>255) THEN 500
470 IF (MA%(K%,2)<0 OR MA%(K%,2)>230) THEN 500
480 NEXT K%
490 NEXT I%
500 PRINT CHR$(12):PRINT"To continue: press any key "
505 S$=""
510 GOSUB 3870
520 IF S$="" THEN 260
530 PRINT CHR$(25)
540 PRINT ES$+"5"
550 PRINT ES$+"0"+CHR$(1)
560 REM P
570 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(20+I%,100,20+I%,170):NEXT
580 FOR I%=1 TO 25 STEP 2:PRINT FNMD$(30+I%,130,30+I%,140):NEXT
590 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(55+I%,130,55+I%,140+I%):NEXT
600 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(60+I%,130+I%,60+I%,170-I%):NEXT
610 FOR I%=1 TO 25 STEP 2:PRINT FNMD$(30+I%,160,30+I%,170):NEXT
620 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(55+I%,160-I%,55+I%,170):NEXT
630 REM 2
640 FOR I%=1 TO 50 STEP 2:PRINT FNMD$(85+I%,100,85+I%,110):NEXT
650 FOR I%=1 TO 15 STEP 2:PRINT FNMD$(85+I%,110,135,160-I%):NEXT
660 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(85+I%,150,85+I%,155+I%):NEXT
670 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(95+I%,150+I%,95+I%,165+I%):NEXT
680 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(100+I%,155+I%,100+I%,170):NEXT
690 FOR I%=1 TO 15 STEP 2:PRINT FNMD$(105+I%,160,105+I%,170):NEXT
700 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(120+I%,160-I%,120+I%,170):NEXT
710 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(125+I%,150+I%,125+I%,170-I%):NEXT
720 REM 000
730 FOR Z%=150 TO 280 STEP 65
740 GOSUB 830 
750 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(Z%+I%+40,100+I%,Z%+I%+40,170-I%):NEXT
760 NEXT Z%
770 FOR I%=1 TO 35 STEP 2:PRINT FNMD$(I%+345,120,I%+345,130):NEXT
780 Z%=395
790 GOSUB 830
800 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(I%+435,100+I%,I%+435,120):NEXT
810 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(I%+435,150,I%+435,170-I%):NEXT
820 GOTO 920 
830 REM SUBR C/0
840 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(Z%+I%,110-I%,Z%+I%,160+I%):NEXT
850 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(Z%+I%+10,100,Z%+I%+10,115-I%):NEXT
860 FOR I%=1 TO 20 STEP 2:PRINT FNMD$(Z%+I%+15,100,Z%+I%+15,110):NEXT
870 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(Z%+I%+35,100,Z%+I%+35,110+I%):NEXT
880 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(Z%+I%+10,155+I%,Z%+I%+10,170):NEXT
890 FOR I%=1 TO 20 STEP 2:PRINT FNMD$(Z%+I%+15,160,Z%+I%+15,170):NEXT
900 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(Z%+I%+35,160-I%,Z%+I%+35,170):NEXT
910 RETURN
920 REM shadow
930  PRINT ES$+"0"+CHR$(64)
940 REM P
950 FOR I%=1 TO 10 :PRINT FNMD$(20+I%,170+I%,60+I%,170+I%):NEXT
960 FOR I%=1 TO 10 :PRINT FNMD$(60+I%,170+I%,70+I%,160+I%):NEXT
970 FOR I%=1 TO 5 :PRINT FNMD$(31+I%,140+I%,54+I%,140+I%):NEXT
980 FOR I%=1 TO 5 :PRINT FNMD$(35+I%,145+I%,59,145+I%):NEXT
990 REM 2
1000 FOR I%=1 TO 10 :PRINT FNMD$(100+I%,170+I%,125+I%,170+I%):NEXT
1010 FOR I%=1 TO 10 :PRINT FNMD$(125+I%,170+I%,135+I%,160+I%):NEXT
1020 FOR I%=1 TO 10:PRINT FNMD$(101+I%,110+I%,135+I%,110+I%):NEXT
1030 REM 000
1040 FOR Z%=150 TO 280 STEP 65
1050 GOSUB 1290
1060 NEXT Z%
1070 FOR I%=1 TO 10 :PRINT FNMD$(346+I%,130+I%,381+I%,130+I%):NEXT
1080 Z%=395
1090 GOSUB 1290
1100 FOR I%=1 TO 10 :PRINT FNMD$(435+I%,120+I%,445+I%,120+I%):NEXT
1110 PRINT ES$+"0"+CHR$(65)
1120 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(31+I%,100+I%,31+I%,129):NEXT
1130 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(31+I%,140+I%,31+I%,159):NEXT
1140 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(70+I%,140+I%,70+I%,160+I%):NEXT
1150 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(135+I%,100+I%,135+I%,110+I%):NEXT
1160 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(135+I%,145+I%,135+I%,160+I%):NEXT
1170 FOR Z%=150 TO 280 STEP 65
1180 GOSUB 1360
1190 NEXT Z%
1200 FOR Z%=150 TO 280 STEP 65
1210 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(Z%+I%+50,110+I%,Z%+I%+50,160+I%):NEXT
1220 NEXT Z%
1230 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(381+I%,120+I%,381+I%,130+I%):NEXT
1240 Z%=395
1250 GOSUB 1360
1260 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(445+I%,110+I%,445+I%,120+I%):NEXT
1270 FOR I%=1 TO 10 STEP 2:PRINT FNMD$(445+I%,150+I%,445+I%,160+I%):NEXT
1280 GOTO 1390
1290 REM C/0
1300 FOR I%=1 TO 10:PRINT FNMD$(Z%+I%+10,170+I%,Z%+I%+40,170+I%):NEXT
1310 FOR I%=1 TO 10:PRINT FNMD$(Z%+I%+40,170+I%,Z%+I%+50,160+I%):NEXT
1320 FOR I%=1 TO 5:PRINT FNMD$(Z%+I%+16,110+I%,Z%+I%+33,110+I%):NEXT
1330 FOR I%=1 TO 5:PRINT FNMD$(Z%+I%+21,115+I%,Z%+39,115+I%):NEXT
1340 FOR I%=1 TO 10:PRINT FNMD$(Z%+I%+10,116+I%,Z%+I%+15,111+I%):NEXT
1350 RETURN
1360 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(Z%+10+I%,115+I%,Z%+10+I%,154+I%):NEXT
1370 FOR I%=1 TO 5 STEP 2:PRINT FNMD$(Z%+15+I%,120+I%,Z%+15+I%,159):NEXT
1380 RETURN
1390 PRINT ES$+"0"+CHR$(1)
1400 FOR I%=1 TO 40 :PRINT FNMD$(100,20+I%,300,20+I%):NEXT
1410 PRINT ES$+"0"+CHR$(64)
1420 FOR I%=1 TO 20 :PRINT FNMD$(100+I%,60+I%,300+I%,60+I%):NEXT
1430 FOR I%=1 TO 30 :PRINT FNMD$(170,25+I%,230,25+I%):NEXT
1440 PRINT ES$+"0"+CHR$(65)
1450 FOR I%=1 TO 20 :PRINT FNMD$(301+I%,20+I%,301+I%,60+I%):NEXT
1460 FOR I%=1 TO 5 :PRINT FNMD$(250+I%,25,250+I%,55):NEXT
1470 FOR I%=1 TO 5 :PRINT FNMD$(265+I%,25,265+I%,55):NEXT
1480  FOR I%=1 TO 3 :PRINT FNMD$(120,25+I%,125,25+I%):NEXT
1490 FOR I%=1 TO 3 :PRINT FNMD$(120,50+I%,125,50+I%):NEXT
1500 PRINT ES$+"0"+CHR$(64)
1510 FOR I%=1 TO 20 :PRINT FNMD$(120+I%,-30+I%,270+I%,-30+I%):NEXT
1520 PRINT ES$+"0"+CHR$(65)
1530 FOR I%=1 TO 5 :PRINT FNMD$(270,-35+I%,290,-15+I%):NEXT
1540 FOR I%=1 TO 15 :PRINT FNMD$(135+I%,-27+I%,210+I%,-27+I%):NEXT
1550 FOR I%=1 TO 15 :PRINT FNMD$(220+I%,-27+I%,235+I%,-27+I%):NEXT
1560 FOR I%=1 TO 15 :PRINT FNMD$(245+I%,-27+I%,260+I%,-27+I%):NEXT
1570 PRINT FNMD$(150,-8,70,10)
1580 PRINT FNMD$(70,10,70,20)
1590 PRINT FNMD$(70,20,80,30)
1600 PRINT FNMD$(80,30,96,35)
1610 PRINT ES$+"0"+CHR$(1)
1620 FOR I%=1 TO 5 :PRINT FNMD$(120,-35+I%,270,-35+I%):NEXT
1630 PRINT FNMD$(150,-10,150,-8)
1640 PRINT FNMD$(96,35,100,35)
1650 FOR I%=1 TO 7:PRINT CHR$(26);:NEXT
1660 PRINT"                      PHILIPS"
1670 GOSUB 3870
1680 PRINT ES$+"5"
1690 PRINT ES$+"0"+CHR$(1)
1700 PRINT FNMO$(20,240)+FNDR$(20,50)+FNDR$(225,50)
1710 K%=5
1720 PRINT ES$+"0"+CHR$(1)
1730 GOSUB 1890
1740 K%=10
1750 PRINT ES$+"0"+CHR$(64)
1760 GOSUB 1890
1770 PRINT ES$+"0"+CHR$(65)
1780 K%=15
1790 GOSUB 1890
1800 PRINT ES$+"0"+CHR$(64)
1810 PRINT CHR$(12):PRINT"          wine production (*1000 L)"
1820 FOR I%=0 TO 4:PRINT:PRINT:PRINT (4-I%)*25:NEXT
1830 PRINT"     1960      1965       1970      1975      1980"
1840 PRINT:PRINT
1850 PRINT"             France      Italy        Germany";
1860 GOSUB 3870
1870 PRINT CHR$(12)
1880 GOTO 1970
1890 FOR Z%=20 TO 180 STEP 40
1900 J%=INT(RND*160)+50:IF J%=50 THEN 1900
1910 FOR I%=1 TO 10
1920 PRINT FNMO$(Z%+I%+K%,51)+FNDR$(Z%+I%+K%,J%)
1930 NEXT
1940 NEXT
1950 FOR I%=1 TO 10:PRINT FNMO$(10*K%+I%,15)+FNDR$(10*K%+I%,25):NEXT
1960 RETURN
1970 PRINT ES$+"5"
1980 DIM M2%(240)
1990 DEF FNY%(X%,Z%)=INT(((SIN(Z%/31)*SIN((X%-Z%)/31)^2))*(70-Z%/7))+Z%+15
2000 FOR Z%=0 TO 100 STEP 5
2010 Y%=FNY%(1,Z%)
2020 IF Y%>M2%(0) THEN M2%(0)=Y%
2030 PRINT FNMO$(1,M2%(0))
2040 FOR X%=2  TO 240 STEP 5
2050 Y%=FNY%(X%,Z%)
2060 IF Y%>M2%(X%) THEN M2%(X%)=Y%
2070 PRINT FNDR$(X%,M2%(X%))
2080 NEXT
2090 NEXT
2100 PRINT CHR$(12):PRINT" Three dimensions"
2110 GOSUB 3870
2120 PRINT ES$+"5"
2130 OF%=0
2140 PRINT ES$+"0"+CHR$(64)
2150 FOR I%=0 TO 250 STEP 10
2160 PRINT FNMD$(0,I%,2*I%,250)
2170 NEXT
2180 FOR I%=0 TO 250 STEP 10
2190 PRINT FNMD$(2*I%,0,500,I%)
2200 NEXT
2210 PRINT FNCI$(0,80)
2220 FOR I%=0 TO 360:PRINT FNCM$(I%,80):NEXT
2230 PRINT FNCI$(0,0)
2240 FOR I%=0 TO 1800 STEP 5:PRINT FNCM$(I%,75)+FNCL$(0,0);
2250 IF I%=720 THEN GOSUB 2290
2260 IF I%=1400 THEN PRINT CHR$(12)
2270 NEXT
2280 GOTO 2350
2290 SO$=CHR$(152)+CHR$(156)+CHR$(148)
2300 SO$="                                         "+SO$
2310 PRINT SO$
2320 FOR J%=1 TO 5:PRINT:NEXT
2330 PRINT CHR$(26);
2340 RETURN
2350 PRINT CHR$(2)
2360 GOSUB 3020
2370 PRINT ES$+"5"
2380 PRINT CHR$(12)
2390 S$=INKEY$:IF S$<>"" THEN 2390
2400 FOR I%=0 TO 160 
2410 PRINT FNMO$(45+I%,250)
2420 PRINT FNDR$(45+I%,125-INT(SQR(160*I%-I%*I%)))
2430 NEXT
2440 PRINT ES$+"0"+CHR$(65)
2450 FOR I%=0 TO 140
2460 PRINT FNMO$(55+I%,125+INT(SQR(140*I%-I%*I%)))
2470 PRINT FNDR$(55+I%,125-INT(SQR(140*I%-I%*I%)))
2480 NEXT
2490 PRINT ES$+"0"+CHR$(64)
2500 FOR I%=115 TO 135 STEP 10
2510 FOR Z%=-1 TO 1
2520 PRINT FNMO$(55,I%+Z%)
2530 PRINT FNDR$(72,Z%+I%+5)
2540 PRINT FNDR$(107,Z%+I%-5)
2550 PRINT FNDR$(142,Z%+I%+5)
2560 PRINT FNDR$(177,Z%+I%-5)
2570 PRINT FNDR$(195,Z%+I%)
2580 NEXT
2590 NEXT
2600 PRINT ES$+"0"+CHR$(1)
2610 Z%=90:K%=155:GOSUB 2670
2620 Z%=110:K%=170:GOSUB 2670
2630 Z%=140:K%=80:GOSUB 2670
2640 Z%=160:K%=95:GOSUB 2670
2650 PRINT ES$+"0"+CHR$(64)
2660 GOTO 2770
2670 REM STAR
2680 FOR I%=-1 TO 1
2690 PRINT FNMO$(Z%-7+I%*I%*2,K%+I%)
2700 PRINT FNDR$(Z%+7-I%*I%*2,K%+I%)
2710 NEXT
2720 FOR I%=-1 TO 1
2730 PRINT FNMO$(Z%+I%,K%-7+2*I%*I%)
2740 PRINT FNDR$(Z%+I%,K%+7-2*I%*I%)
2750 NEXT 
2760 RETURN
2770 PRINT ES$+"0"+CHR$(65)
2780 Z%=55:GOSUB 2910:Z%=60:K%=3:GOSUB 2930:K%=6:GOSUB 2930
2790 FOR I%=1 TO 5:PRINT FNMO$(65+I%,220)+FNDR$(65+I%,240):NEXT
2800 Z%=80:GOSUB 2910:Z%=90:GOSUB 2910:Z%=105:GOSUB 2910:Z%=120:GOSUB 2910
2810 Z%=85:K%=3:GOSUB 2930:Z%=125:K%=0:GOSUB 2930:Z%=130:GOSUB 2930
2820 Z%=140:GOSUB 2910:Z%=155:GOSUB 2910
2830 Z%=160:K%=3:GOSUB 2930:K%=6:GOSUB 2930:Z%=185:GOSUB 2930
2840 K%=3:GOSUB 2930:K%=0: GOSUB 2930:Z%=180:GOSUB 2930:K%=6:Z%=190
2850 GOSUB 2930
2860 FOR I%=1 TO 5:PRINT FNMO$(165+I%,220)+FNDR$(165+I%,240):NEXT
2870 FOR I%=1 TO 5:PRINT FNMO$(180+I%,220)+FNDR$(180+I%,240):NEXT
2880 FOR I%=1 TO 5:PRINT FNMO$(190+I%,205)+FNDR$(190+I%,225):NEXT
2890 GOTO 2950
2900 REM
2910 FOR I%=1 TO 5:PRINT FNMO$(Z%+I%,205)+FNDR$(Z%+I%,240):NEXT
2920 RETURN
2930 FOR I%=1 TO 5:PRINT FNMO$(Z%+I%,K%*5+205)+FNDR$(Z%+I%,K%*5+210):NEXT
2940 RETURN
2950 REM ES$+"5"
2960 S$=INKEY$:IF S$="" THEN 2960
2970 PRINT ES$+"4"
2980 PRINT CHR$(12)
2990 PRINT ES$+"C"
3000 PRINT ES$+"0"+CHR$(64)
3010 END
3020 REM SUBROUTINE CLOCK
3030 PRINT CHR$(12)
3040 PRINT ES$+"5"
3050 S$=INKEY$:IF S$<>"" THEN 3050
3060 FOR I%=1 TO 12:PRINT FNMO$(35,25+I%)+FNDR$(215,I%+25):NEXT
3070 FOR I%=0 TO 180
3080 PRINT FNMO$(35+I%,125+INT(SQR(180*I%-I%*I%)))
3090 PRINT FNDR$(35+I%,125-INT(SQR(180*I%-I%*I%)))
3100 NEXT
3110 PRINT ES$+"0"+CHR$(65)
3120 FOR I%=0 TO 160
3130 PRINT FNMO$(45+I%,125+INT(SQR(160*I%-I%*I%)))
3140 PRINT FNDR$(45+I%,125-INT(SQR(160*I%-I%*I%)))
3150 NEXT
3160 PRINT ES$+"0"+CHR$(1)
3170 PRINT FNCI$(0,80)
3180 FOR I%=0 TO 360 STEP 30
3190 PRINT FNCI$(I%,80)+FNCM$(I%,75)+FNCM$(I%,80)
3200 NEXT
3210 BP%=0
3220 GOSUB 3440
3230 I%=TS%*6:Z%=TM%*6:K%=(TH%*30)+INT(TM%/12)*6
3240 PRINT FNCI$(0,0)+FNCM$(K%,40)
3250 PRINT FNCI$(0,0)+FNCM$(Z%,65)
3260 PRINT FNCI$(0,0)+FNCM$(I%,74)
3270 GOSUB 3440
3280 IF TS%*6=I% THEN 3270
3290 IF (TS%-1)*6=I% OR (TS%+59)*6=I% THEN 3330
3300 IF TS%=0 THEN 3330
3310 I%=TS%*6:Z%=TM%*6:K%=(TH%*30)+INT(TM%/12)*6
3320 GOTO 3270
3330 PRINT ES$+"0"+CHR$(65)
3340 PRINT FNCI$(0,0)
3350 IF TS%=0 THEN PRINT FNCM$(K%,40)+FNCM$(0,0)
3360 IF TS%=0 THEN PRINT FNCM$(Z%,65)+FNCM$(0,0)
3370 PRINT FNCM$(I%,74)+FNCM$(0,0)
3380 PRINT ES$+"0"+CHR$(1)
3390 IF TS%=0 AND TM%=0 THEN BP%=TH%:IF TH%=0 THEN BP%=12
3400 IF BP%>0 THEN PRINT CHR$(7):BP%=BP%-1
3410 S$=INKEY$:IF S$="" THEN 3230
3420 PRINT ES$+"0"+CHR$(64)
3430 RETURN
3440 TI#=(PEEK(&HFFC3)*(16777216#))+(PEEK(&HFFC2)*(65536!))+(PEEK(&HFFC1)*256!)
3450 TI#=TI#+PEEK(&HFFC0)
3460 TI#=INT(TI#/60)
3470 TI#=TI#-(43200!*INT(TI#/43200!))
3480 TS%=TI#-(60*INT(TI#/60))
3490 TI#=TI#-TS%
3500 TM%=TI#-(3600!*INT(TI#/3600!))
3510 TI#=TI#-TM%
3520 TM%=TM%/60
3530 TH%=INT(TI#/3600!)
3540 RETURN
3550 REM END
3560 PRINT ES$+"4"
3570 PRINT CHR$(12)
3580 PRINT ES$+"C"
3590 PRINT ES$+"0"+CHR$(64)
3600 REM SUBROUTINE CLOCKINI
3610 PRINT "Please enter current time (hours,minutes,seconds)  ";
3620 LINE INPUT S$
3630 TU#=VAL(LEFT$(S$,2))
3640 IF TU#>9 THEN TM#=VAL(MID$(S$,4,2)) ELSE TM#=VAL(MID$(S$,3,2))
3650 TS#=VAL(RIGHT$(S$,2))
3660 IF TS#=0 THEN TS#=VAL(RIGHT$(S$,1))
3670 IF LEN(S$)<5 OR LEN(S$)>8 THEN 3610
3680 IF TS#>59 OR TS#<0 OR TM#<0 OR TM#>59 OR TU#>23 OR TU#<0 THEN 3610
3690 IF 12<=TU# THEN:PRINT"For hours only 0..11 allowed ":GOTO 3610
3700 TT#=(TU#*3600!)+(TM#*60!)+TS#
3710 TT#=TT#*60
3720 IF TT#<0 THEN 3610
3730 PRINT"New time: ";TU#;" hours, ";TM#;" min, ";TS#;" sec"
3740 PRINT "OK? Type (Y) to start, type (N) to change time"
3750 S$=INKEY$:IF S$<>"Y" AND S$<>"N" THEN 3750 ELSE IF S$="N" THEN 3600
3760 I%=INT(TT# /16777216#)
3770 POKE &HFFC3,I%
3780 TT#=TT#-(I%*16777216#)
3790 I%=INT(TT# /65536!)
3800 POKE &HFFC2,I%
3810 TT#=TT#-(I%*65536!)
3820 I%=INT(TT#/256!)
3830 POKE &HFFC1,I%
3840 TT#=TT#-(I%*256!)
3850 I%=INT(TT#):POKE &HFFC0,I%
3860 RETURN
3870 REM SUBROUTINE WAIT 4 SEC
3880 I%=PEEK(&HFFC0)
3890 IF I%=PEEK(&HFFC0) THEN 3890
3900 Q$=INKEY$:IF Q$<>"" THEN PRINT CHR$(12):S$=Q$:PRINT" Wait"
3910 IF I%<>PEEK(&HFFC0) THEN 3900
3920 RETURN
) THEN 3890
3900 Q$=INKEY$:IF Q$<>"" THEN PRINT CH