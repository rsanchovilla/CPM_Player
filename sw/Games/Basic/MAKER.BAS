5 GOSUB 1270
10 OPTION BASE 1:DIM SC$(20,50),LD(19)
20 PRINT CHR$(26)CHR$(27)CHR$(46)CHR$(48)CHR$(27)CHR$(97)
30 FOR X=1 TO 20:FOR Y=1 TO 50:SC$(X,Y)=" ":NEXT Y:NEXT X
40 PRINT SPC(12);:FOR X=1 TO 52:PRINT"C";:NEXT X:PRINT
50 FOR X=1 TO 20:PRINT SPC(12)"C"SPC(50)"C":NEXT X
60 PRINT SPC(12);:FOR X=1 TO 52:PRINT"C";:NEXT X:PRINT CHR$(30)
70 FOR X=4 TO 19 STEP 3:LD(X)=0:NEXT X:DI(1)=6:DI(2)=6
80 Y(1)=20:Y(2)=45:M(1,1)=20:M(1,2)=5:M(2,1)=20:M(2,2)=3:PTS=PTS+100*LV:LV=LV+1
90 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M":GOSUB 1000
100 PRINT CHR$(27)CHR$(65)
110 PRINT CHR$(27)"="CHR$(46)CHR$(32)"LEVEL":PRINT LV
120 PRINT CHR$(27)"="CHR$(40)CHR$(32)"TIME":TM=0:TML=2100-100*LV
130 PRINT CHR$(27)"="CHR$(43)CHR$(32)"POINTS"
140 PRINT CHR$(27)CHR$(97):GH=0:IF LV>10 THEN HG=0 ELSE HG=10-LV
150 A$=INKEY$
160 IF Y(1)=N(1) AND Y(2)=N(2) THEN A$=CHR$(27)
170 IF Y(1)=N(3) AND Y(2)=N(4) THEN A$=CHR$(27)
180 PRINT CHR$(27)CHR$(65)CHR$(27)"="CHR$(44)CHR$(32)PTS
190 PRINT CHR$(27)"="CHR$(41)CHR$(32)TML-TM;CHR$(27)CHR$(97):TM=TM+1
200 IF TML-TM=0 THEN A$=CHR$(27)
210 IF SC$(Y(1),Y(2))="S" THEN 1030
220 IF A$="B" THEN 610
230 IF A$=" " THEN 440
240 IF A$=CHR$(11) AND SC$(Y(1),Y(2))="H" THEN 850
250 IF A$=CHR$(8) AND Y(2)>1 THEN C$="4":GOTO 310
260 IF A$=CHR$(10) AND Y(1)<20 THEN IF SC$(Y(1)+1,Y(2))="H" THEN 900
270 IF A$=CHR$(12) AND Y(2)<50 THEN C$="6":GOTO 390
280 IF A$=CHR$(27) THEN PRINT CHR$(26)CHR$(27)CHR$(46)CHR$(50):GOTO 1200
290 GH=GH+1:IF GH=HG THEN GH=0:GOTO 1050
300 IF B$<>"" THEN B$="":GOTO 160 ELSE 150
310 IF SC$(Y(1),Y(2)-1)="R" THEN 280
320 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
330 Y(2)=Y(2)-1
340 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
350 REM
360 IF Y(1)=20 THEN 280
370 IF SC$(Y(1)+1,Y(2))=" " THEN 940
380 GOTO 280
390 IF SC$(Y(1),Y(2)+1)="R" THEN 280
400 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
410 Y(2)=Y(2)+1
420 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
430 GOTO 350
440 IF C$="6" THEN 530
450 IF Y(2)<3 THEN 280
460 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
470 Y(1)=Y(1)-1:Y(2)=Y(2)-1
480 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
490 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
500 Y(1)=Y(1)+1:Y(2)=Y(2)-1
510 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
520 GOTO 350
530 IF Y(2)>48 THEN 280
540 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
550 Y(1)=Y(1)-1:Y(2)=Y(2)+1
560 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
570 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
580 Y(1)=Y(1)+1:Y(2)=Y(2)+1
590 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
600 GOTO 350
610 IF (Y(1)+1)/3=INT((Y(1)+1)/3) AND Y(1)>4 THEN 790
620 IF Y(1)/3<>INT(Y(1)/3) THEN 280
630 IF LD(Y(1)+1)<2 THEN 280
640 SC$(Y(1),Y(2))="H":PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"H"
650 G=Y(1)+1
660 FOR X=1 TO 50:IF SC$(G,X)="H" THEN I=I+1:H(I)=X:IF H(I)=Y(2) AND I>1 THEN H=H(I-1):I=0:X=50 ELSE IF H(I)>Y(2) THEN H=H(I):I=0:X=50
670 NEXT X:IF H<Y(2) THEN 740
680 IF SC$(Y(1),H-1)="R" THEN 730
685 IF SC$(Y(1)+1,H-1)="H" THEN 730
690 FOR X=Y(2)+1 TO H-1
700 SC$(Y(1),X)="R":PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+X)"R"
710 NEXT X:SC$(Y(1),H)="H":PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+H)"H"
720 PTS=PTS+(ABS(Y(1)-LEV)*10):LEV=Y(1):GOTO 590
730 SC$(Y(1),H)="H":PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+H)"H":GOTO 590
740 IF SC$(Y(1),H+1)="R" THEN 1250
745 IF SC$(Y(1)+1,H+1)="H" THEN 730
750 FOR X=H+1 TO Y(2)-1
760 SC$(Y(1),X)="R":PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+X)"R"
770 NEXT X:SC$(Y(1),H)="H":PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+H)"H"
780 GOTO 720
790 IF SC$(Y(1),Y(2))="H" THEN 280
800 IF LD(Y(1)-1)>4 THEN 280
810 IF Y(2)<5 OR Y(2)>45 THEN 280
820 LD(Y(1)-1)=LD(Y(1)-1)+1:SC$(Y(1),Y(2))="H":SC$(Y(1)-1,Y(2))="H"
830 PRINT CHR$(27)"="CHR$(32+Y(1))CHR$(44+Y(2))"H"
840 PTS=PTS+10:GOTO 280
850 IF SC$(Y(1),Y(2))<>"H" THEN 280
860 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
870 Y(1)=Y(1)-1
880 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
890 GOTO 280
900 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
910 Y(1)=Y(1)+1
920 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
930 GOTO 280
940 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))SC$(Y(1),Y(2))
950 Y(1)=Y(1)+1
960 PRINT CHR$(27)"="CHR$(33+Y(1))CHR$(44+Y(2))"M"
970 IF Y(1)=20 THEN PTS=PTS-K*10:K=0:GOTO 280
980 IF SC$(Y(1)+1,Y(2))<>" " THEN PTS=PTS-K*10:K=0:GOTO 280
990 K=K+1:GOTO 940
1000 FOR X=2 TO 20 STEP 3
1010 Z=INT(RND*40+5):SC$(X,Z)="S":PRINT CHR$(27)"="CHR$(33+X)CHR$(44+Z)"S"
1020 NEXT X:RETURN
1030 SC$(Y(1),Y(2))=" ":PTS=PTS+50:TH=TH+1
1040 IF TH=7 THEN TH=0:LEV=1:GOTO 20 ELSE 220
1050 IF N(1)=0 THEN N(1)=1:N(2)=5:N(3)=1:N(4)=45
1060 PRINT CHR$(27)"="CHR$(33+N(1))CHR$(44+N(2))SC$(N(1),N(2))
1070 IF LV>3 THEN PRINT CHR$(27)"="CHR$(33+N(3))CHR$(44+N(4))SC$(N(3),N(4))
1080 IF N(2)=50 THEN N(2)=1
1090 IF N(4)=1 THEN N(4)=50
1100 N(2)=N(2)+1:IF Y(1)>N(1) THEN N(1)=N(1)+1
1105 B$=INKEY$:IF B$<>"" THEN A$=B$
1110 IF Y(1)<N(1) THEN N(1)=N(1)-1
1120 IF LV>3 THEN N(4)=N(4)-1:IF Y(1)>N(3) THEN N(3)=N(3)+1
1130 IF LV>3 AND Y(1)<N(3) THEN N(3)=N(3)-1
1140 PRINT CHR$(27)"="CHR$(33+N(1))CHR$(44+N(2))"Q"
1150 IF LV>3 THEN PRINT CHR$(27)"="CHR$(33+N(3))CHR$(44+N(4))"Q"
1160 IF N(1)=Y(1) AND N(2)=Y(2) THEN X=2:A$=CHR$(27)
1170 IF N(3)=Y(1) AND N(4)=Y(2) THEN A$=CHR$(27):X=2
1180 IF A$=CHR$(27) THEN 280
1190 GOTO 300
1200 PRINT CHR$(27)CHR$(65)
1210 PRINT:PRINT:PRINT"YOU HAD"PTS"POINTS!!"
1220 PRINT"DO YOU WANT TO PLAY AGAIN? (Y/N) ";:A$=INPUT$(1)
1230 IF A$="Y" THEN RUN ELSE IF A$="N" THEN RUN"HELPER"
1240 PRINT CHR$(7)CHR$(30):PRINT:GOTO 1210
1250 FOR X=Y(2)+1 TO 50:IF SC$(Y(1)+1,X)="H" THEN H=X:ZZ=1:X=50
1260 NEXT X:IF ZZ=1 THEN ZZ=0:GOTO 680 ELSE 730
1270 FOR X=1 TO 48:PRINT:NEXT:PRINT CHR$(27)CHR$(97)
1280 PRINT"CC    CC  CCCCCCC      CC    CC   CCCCCC   CC    CC  CCCCCCCC  CCCCCCC"
1290 PRINT"CCC  CCC  CC    CC     CCC  CCC  CC    CC  CC   CC   CC        CC    CC"
1300 PRINT"CC CC CC  CC    CC     CC CC CC  CC    CC  CC CCC    CC        CC    CC"
1310 PRINT"CC CC CC  CCCCCCC      CC CC CC  CCCCCCCC  CCCC      CCCCCC    CCCCCCC"
1320 PRINT"CC CC CC  CC  CC       CC CC CC  CC    CC  CC CCC    CC        CC  CC"
1330 PRINT"CC    CC  CC   CC      CC    CC  CC    CC  CC   CC   CC        CC   CC"
1340 PRINT"CC    CC  CC    CC     CC    CC  CC    CC  CC    CC  CCCCCCCC  CC    CC"
1345 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT
1350 PRINT CHR$(27)CHR$(65)SPC(20)CHR$(147)" 1985  by John Pursey"
1360 FOR X=1 TO 2000:NEXT:FOR X=1 TO 24:PRINT:NEXT:RETURN
