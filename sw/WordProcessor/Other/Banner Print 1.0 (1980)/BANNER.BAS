10 PRINT CHR$(26):C$="X":B$=" "
20 X=1
30 DIM A$(30)
40 PRINT CHR$(26);:FOR X=1 TO 20:PRINT:NEXT:PRINT TAB(35)"BANNER":PRINT:PRINT:PRINT TAB(32)"By:  Nik Haus"
50 FOR X=1 TO 13:PRINT:NEXT:PRINT TAB(15)"type <S> to begin, any other key for instructions"
60 PRINT:PRINT
70 A$=INKEY$:IF A$="S" THEN PRINT CHR$(26);:GOTO 100
80 IF A$>CHR$(0) THEN 1690
90 GOTO 70
100 PRINT CHR$(30)
110 PRINT">";
120 ON ERROR GOTO 1780
130 A$(G)=INKEY$
140 IF A$(G)=CHR$(13) THEN 180
150 IF A$(G)=CHR$(8) THEN G=G-1:PRINT CHR$(8);:GOTO 130
160 IF A$(G)>CHR$(0) THEN PRINT A$(G);:G=G+1
170 GOTO 130
180 PRINT CHR$(30)
190 PRINT"> ";
200 FOR F=1 TO G
210 IF F=1 THEN PRINT A$(1);CHR$(8);:GOTO 230
220 PRINT A$(F-1);A$(F);CHR$(8);
230 IF A$(F)="A" THEN 580
240 IF A$(F)="B" THEN 640
250 IF A$(F)="C" THEN 680
260 IF A$(F)="D" THEN 730
270 IF A$(F)="E" THEN 780
280 IF A$(F)="F" THEN 800
290 IF A$(F)="G" THEN 830
300 IF A$(F)="H" THEN 890
310 IF A$(F)="I" THEN 900
320 IF A$(F)="J" THEN 930
330 IF A$(F)="K" THEN 960
340 IF A$(F)="L" THEN 1000
350 IF A$(F)="M" THEN 1010
360 IF A$(F)="N" THEN 1050
370 IF A$(F)="O" THEN 1070
380 IF A$(F)="P" THEN 1120
390 IF A$(F)="Q" THEN 1150
400 IF A$(F)="R" THEN 1200
410 IF A$(F)="S" THEN 1250
420 IF A$(F)="T" THEN 1310
430 IF A$(F)="U" THEN 1340
440 IF A$(F)="V" THEN 1380
450 IF A$(F)="W" THEN 1450
460 IF A$(F)="X" THEN 1530
470 IF A$(F)="Y" THEN 1580
480 IF A$(F)="Z" THEN 1650
490 IF A$(F)=CHR$(32) THEN 1640
500 RUN
510 FOR T=1 TO 4:FOR X=1 TO 78:LPRINT C$;:NEXT:LPRINT C$:NEXT
520 RETURN
530 FOR T=1 TO 4:FOR X=1 TO 73+T:LPRINT C$;:NEXT:LPRINT C$:NEXT
540 RETURN
550 FOR T=1 TO 4:FOR X=1 TO 78-T:LPRINT C$;:NEXT:LPRINT C$:NEXT
560 RETURN
570  FOR X=1 TO 10:LPRINT:NEXT:NEXT
580 GOSUB 530
590 GOSUB 510
600 FOR T=1 TO 14:FOR X=1 TO 19:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 20:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
610 GOSUB 510
620 GOSUB 550
630 GOTO 570
640 GOSUB 510:GOSUB 510
650 FOR T=1 TO 10:FOR X=1 TO 16:LPRINT C$;:NEXT:FOR X=1 TO 16:LPRINT B$;:NEXT:FOR X=1 TO 16:LPRINT C$;:NEXT:FOR X=1 TO 15:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:LPRINT C$:NEXT
660 GOSUB 510:FOR T=1 TO 4:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 42-(2*T):LPRINT C$;:NEXT:FOR X=1 TO 2*T:LPRINT B$;:NEXT:FOR X=1 TO 37-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
670 GOTO 570
680 FOR T=1 TO 4:FOR X=1 TO 4-T:LPRINT B$;:NEXT:FOR X=1 TO 71+(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT 
690 GOSUB 510:FOR T=1 TO 10:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 39:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
700 FOR T=0 TO 3:FOR X=1 TO 30:LPRINT C$;:NEXT:FOR X=1 TO 19:LPRINT B$;:NEXT:FOR X=1 TO 30:LPRINT C$;:NEXT:LPRINT B$:NEXT
710 FOR T=1 TO 4:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 30-T:LPRINT C$;:NEXT:FOR X=1 TO 19:LPRINT B$;:NEXT:FOR X=1 TO 30-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
720 GOTO 570
730 GOSUB 510:GOSUB 510
740 FOR T=1 TO 11:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 39:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
750 FOR T=1 TO 3:FOR X=1 TO 20+T:LPRINT C$;:NEXT:FOR X=1 TO 39-(2*T):LPRINT B$;:NEXT:FOR X=1 TO 20+T:LPRINT C$;:NEXT:LPRINT B$:NEXT
760 GOSUB 510:FOR T=1 TO 4:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
770 GOTO 570
780 GOSUB 510:GOSUB 510:FOR T=1 TO 14:FOR X=1 TO 17:LPRINT C$;:NEXT:FOR X=1 TO 17:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:FOR X=1 TO 15:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:LPRINT B$:NEXT
790 GOTO 570
800 GOSUB 510:GOSUB 510:FOR T=1 TO 10:FOR X=1 TO 35:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:FOR X=1 TO 15:LPRINT B$;:NEXT:FOR X=1 TO 14:LPRINT C$;:NEXT:LPRINT B$:NEXT
810 FOR T=1 TO 5:FOR X=1 TO 65:LPRINT B$;:NEXT:FOR X=1 TO 14:LPRINT C$;:NEXT:LPRINT B$:NEXT
820 GOTO 570
830 FOR T=4 TO 1 STEP -1:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT:GOSUB 510
840 FOR T=1 TO 5:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 40:LPRINT B$;:NEXT:FOR X=1 TO 19:LPRINT C$;: NEXT: LPRINT B$:NEXT
850 FOR T=1 TO 10:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 10:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:FOR X=1 TO 15:LPRINT B$;:NEXT:FOR X=1 TO 19:LPRINT C$;:NEXT:LPRINT B$:NEXT
860 FOR T=1 TO 4:FOR X=1 TO 45:LPRINT C$;:NEXT:FOR X=1 TO 11:LPRINT B$;:NEXT:FOR X=1 TO 23:LPRINT C$;:NEXT:LPRINT B$:NEXT
870 FOR T=1 TO 4:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 45-(2*T):LPRINT C$;:NEXT:FOR X=1 TO 11+T:LPRINT B$;:NEXT:FOR X=1 TO 23-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
880 GOTO 570
890 GOSUB 510:GOSUB 510:FOR T=1 TO 14:FOR X=1 TO 30:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:LPRINT B$:NEXT:GOSUB 510:GOSUB 510:GOTO 570
900 FOR T=1 TO 4:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 39:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
910 GOSUB 510:GOSUB 510:FOR T=1 TO 4:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 39:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
920 GOTO 570
930 FOR T=4 TO 1 STEP -1:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 25-T:LPRINT C$;:NEXT:LPRINT B$:NEXT:FOR T=1 TO 4:FOR X=1 TO 25:LPRINT C$;:NEXT:FOR X=1 TO 400:NEXT:LPRINT B$:NEXT
940 FOR T=1 TO 8:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 400:NEXT:LPRINT B$:NEXT
950 GOSUB 510:FOR T=1 TO 4:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT:GOTO 570
960 GOSUB 510:GOSUB 510:FOR T=1 TO 8 STEP 2:FOR X=1 TO 20+T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
970 FOR T=1 TO 10 STEP 2:FOR X=1 TO 28-T:LPRINT B$;:NEXT:FOR X=1 TO 20+(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
980 FOR T=1 TO 18 STEP 2:FOR X=1 TO 18-T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO (2*T):LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
990 GOTO 570
1000 GOSUB 510:GOSUB 510:FOR T=1 TO 14:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 400:NEXT:LPRINT B$:NEXT:GOTO 570
1010 GOSUB 510:GOSUB 510
1020 FOR T=1 TO 20 STEP 2:FOR X=1 TO 60-T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1030 FOR T=20 TO 1 STEP -2:FOR X=1 TO 60-T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1040 GOSUB 510:GOSUB 510:GOTO 570
1050 GOSUB 510:GOSUB 510
1060 FOR T=1 TO 30 STEP 2:FOR X=1 TO 60-T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT:GOSUB 510:GOSUB 510:GOTO 570
1070 FOR T=4 TO 1 STEP -1:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1080 GOSUB 510
1090 FOR T=1 TO 14:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 39:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1100 GOSUB 510:FOR T=1 TO 4:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1110 GOTO 570
1120 GOSUB 510:GOSUB 510:FOR T=1 TO 10:FOR X=1 TO 40:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:FOR X=1 TO 9:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:LPRINT B$:NEXT
1130 FOR T=1 TO 4: FOR X=1 TO 40+T:LPRINT B$;:NEXT:FOR X=1 TO 40-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1140 GOTO 570
1150 FOR T=4 TO 1 STEP -1:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1160 GOSUB 510
1170 FOR T=1 TO 8:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 39:LPRINT B$;:NEXT: FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1180 FOR T=1 TO 8 STEP 2:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 8-T:LPRINT B$;:NEXT:FOR X=1 TO 10:LPRINT C$;:NEXT:FOR X=1 TO 21+T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1190 GOSUB 510:GOSUB 550:GOTO 570
1200 GOSUB 510:GOSUB 510
1210 FOR T=1 TO 10:FOR X=1 TO 25-T:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:FOR X=1 TO T-1:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:FOR X=1 TO 10:LPRINT B$;:NEXT:FOR X=1 TO 15:LPRINT C$;:NEXT:LPRINT B$:NEXT
1220 FOR T=1 TO 4:FOR X=1 TO 30-T:LPRINT C$;:NEXT:FOR X=1 TO 9+T:LPRINT B$;:NEXT:FOR X=1 TO 40:LPRINT C$;:NEXT:LPRINT B$:NEXT
1230 FOR T=1 TO 4:FOR X=1 TO 26-T:LPRINT C$;:NEXT:FOR X=1 TO 13+(2*T):LPRINT B$;:NEXT:FOR X=1 TO 40-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1240 GOTO 570
1250 FOR T=4 TO 1 STEP -1:FOR X=1 TO T-1:LPRINT B$;:NEXT:FOR X=1 TO 26-T::LPRINT C$;:NEXT:FOR X=1 TO 3+T:LPRINT B$;:NEXT:FOR X=1 TO 52-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1260 FOR T=1 TO 4:FOR X=1 TO 25:LPRINT C$;:NEXT:FOR X=1 TO 4:LPRINT B$;:NEXT:FOR X=1 TO 50 :LPRINT C$;:NEXT:LPRINT B$:NEXT
1270 FOR T=1 TO 10:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 9:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 10:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1280 FOR T=1 TO 4:FOR X=1 TO 49:LPRINT C$;:NEXT:FOR X=1 TO 5:LPRINT B$;:NEXT:FOR X=1 TO 25:LPRINT C$;:NEXT:LPRINT B$:NEXT
1290 FOR T=1 TO 4:FOR X=1 TO T-1:LPRINT B$;:NEXT:FOR X=1 TO 51-(2*T):LPRINT C$;:NEXT:FOR X=1 TO 4+T:LPRINT B$;:NEXT:FOR X=1 TO 26-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1300 GOTO 570
1310 GOSUB 1320:GOSUB 510:GOSUB 510:GOSUB 1320:GOTO 570
1320 FOR T=1 TO 10:FOR X=1 TO 59:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1330 RETURN
1340 FOR T=3 TO 0 STEP -1:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1350 GOSUB 510
1360 FOR T=1 TO 14:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:FOR X=1 TO 400:NEXT:NEXT
1370 GOSUB 510:FOR T=0 TO 3:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT:GOTO 570
1380 FOR T=70 TO 1 STEP -10:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1390 GOSUB 510
1400 FOR T=70 TO 10 STEP -10:FOR X=1 TO T+9:LPRINT C$;:NEXT:LPRINT B$:NEXT:FOR X=1 TO 400:NEXT
1410 FOR T=10 TO 70 STEP 10:FOR X=1 TO T+9:LPRINT C$;:NEXT:LPRINT B$:NEXT
1420 GOSUB 510
1430 FOR T=0 TO 70 STEP 10:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1440 GOTO 570
1450 FOR T=4 TO 1 STEP -1:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1460 GOSUB 510
1470 FOR T=1 TO 4:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1480 FOR T=1 TO 8:FOR X=1 TO 30:LPRINT C$;:NEXT:LPRINT B$:NEXT
1490 FOR T=1 TO 4:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1500 GOSUB 510
1510 FOR T=1 TO 4 :FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 79-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1520 GOTO 570
1530 FOR T=1 TO 20 STEP 2:FOR X=1 TO T-1:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 38-(2*T):LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1540 FOR T=1 TO 10 STEP 2:FOR X=1 TO 19+T:LPRINT B$;:NEXT:FOR X=1 TO 38-(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1550 FOR T=1 TO 10 STEP 2: FOR X=1 TO 27-T:LPRINT B$;:NEXT:FOR X=1 TO 22+(2*T):LPRINT C$;:NEXT:LPRINT B$:NEXT
1560 FOR T=20 TO 1 STEP -2:FOR X=1 TO T-3:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 42-(2*T):LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:LPRINT B$:NEXT
1570 GOTO 570
1580 FOR T=1 TO 4:FOR X=1 TO 4-T:LPRINT B$;:NEXT:FOR X=1 TO 17+T:LPRINT C$;:NEXT:FOR X=1 TO 23-T:LPRINT B$;:NEXT:FOR X=1 TO 35+T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1590 FOR T=1 TO 4:FOR X=1 TO 21:LPRINT C$;:NEXT:FOR X=1 TO 19:LPRINT B$;:NEXT:FOR X=1 TO 39:LPRINT C$;:NEXT:LPRINT B$:NEXT
1600 FOR T=1 TO 10:FOR X=1 TO 17:LPRINT C$;:NEXT:FOR X=1 TO 23 :LPRINT B$;:NEXT:FOR X=1 TO 16:LPRINT C$;:NEXT:LPRINT B$:FOR X=1 TO 400:NEXT:NEXT
1610 GOSUB 510
1620 FOR T=1 TO 4:FOR X=1 TO T-1:LPRINT B$;:NEXT:FOR X=1 TO 80-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1630 GOTO 570
1640 FOR X=1 TO 20:LPRINT:NEXT:GOTO 570
1650 FOR T=1 TO 10:FOR X=1 TO 30+T:LPRINT C$;:NEXT:FOR X=1 TO 30-T:LPRINT B$;:NEXT:FOR X=1 TO 19:LPRINT C$;:NEXT:LPRINT B$:NEXT
1660 FOR T=1 TO 20:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO T:LPRINT B$;:NEXT:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 20-T:LPRINT B$;:NEXT:FOR X=1 TO 19:LPRINT C$;:NEXT:LPRINT B$:NEXT
1670 FOR T=1 TO 10:FOR X=1 TO 20:LPRINT C$;:NEXT:FOR X=1 TO 20+T:LPRINT B$;:NEXT:FOR X=1 TO 39-T:LPRINT C$;:NEXT:LPRINT B$:NEXT
1680 GOTO 570
1690 PRINT CHR$(26);"BANNER             By: Nik Haus"
1720 PRINT:PRINT"Type a message of up to 30 letters (only CAPITAL letters, no symbols or":PRINT"numbers!) length, with one space at the very start to prepare the computer.":PRINT"If the space is forgotten, so is the first letter of your message!"
1730 PRINT:PRINT"If you make a mistake, hit the [backspace] until the first wrong letter":PRINT"flashes. Then retype your message from that letter."
1740 PRINT:PRINT"keep the [CAPS LOCK] on."
1745 PRINT:PRINT"** WARNING ** Letters are 80 spaces tall and 6";CHR$(34);" wide, so make shure":PRINT"you have enough paper!"
1746 PRINT:PRINT"The flashing letter is the one being printed."
1750 PRINT:PRINT"hit any key to go on";
1760 A$=INKEY$:IF A$>CHR$(0) THEN PRINT CHR$(26);:GOTO 100
1770 GOTO 1760
1780  PRINT"ERROR":FOR X=1 TO 5000:NEXT:RUN
