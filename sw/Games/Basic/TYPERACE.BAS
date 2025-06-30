10 DATA ABCDEFGHIJKLMNOPQRSTUVWXYZ
20 DATA abcdefghijklmnopqrstuvwxyz
30 DATA You may change what you need to type by modifying lines 10 to 80.
40 DATA "THIS IS LINE 4?"
50 DATA "THE QUICK BROWN FOX JUMPED OVER THE LAZZY DOG'S BACK"
60 DATA "WHEN PINK PIGS ARE FAT, THEY CAN'T WALK"
70 DATA "I SURE WISH I COULD WIN AT THIS GAME"
80 DATA Use Your imagination or make it (#&$*%**&@^%!$@#$) HARD!!!!
98 REM: The next line must be "DATA LASTLINE"
99 DATA "LASTLINE"
100 '--------------------------------------------------------------------------
110 E$=CHR$(27):'                  Escape Character
120 CLS$=CHR$(26):'                Clear Screen
130 DC$=E$+"=":'                   Direct Cursor Addressing
140 GY$=E$+"g":'                   Graphics On
150 GN$=E$+"G":'                   Graphics Off
160 HO$=E$+CHR$(30):'              Cursor Home
170 EP$=E$+"T":'                   Erase to End of Line
180 DY$=E$+")":'                   DIM Display On
190 DN$=E$+"(":'                   DIM Display Off
200 UY$=E$+"l"'                    Start Underline
210 UN$=E$+"m"'                    End Underline
220 ' Direct cursor addressing
230 ' Location= (CHR$(Line number+32));(CHR$(Column number+32))
240 '--------------------------------------------------------------------------
250 CNTBASE=4           'How many times is keyboard read between time updates?
260 TIMED=1!            'How much time elapes between ME moves?
270 '--------------------------------------------------------------------------
280 PRINT CLS$
281 PRINT "                    WELCOME TO THE TYPING TEST HORSERACE"
282 PRINT "                              by: Donald Hill ":PRINT:PRINT
283 PRINT "                            (c) 1983 Donald Hill"
290 PRINT:PRINT "                  Do you require instructions (Y/N) ?";
300 A$=INKEY$:IF LEN(A$)=0 THEN 300 ' Get keyboard input
310 IF A$="N" OR A$="n" THEN 360
320 IF A$="Y" OR A$="y" THEN 340 ELSE 300
330 '--------------------------------------------------------------------------
340 GOSUB 1340  '                                ***  PRINT INSTRUCTIONS  ***
350 '--------------------------------------------------------------------------
360 PRINT CLS$
370 PRINT HO$;GY$;"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";GN$
380 PRINT ;GY$;"vvvvvvvvvvvvvvv";GN$;DY$;"  WELCOME TO THE TYPING TEST HORSERACE  ";DN$;GY$;"vvvvvvvvvvvvvv";GN$
390 PRINT GY$;"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";GN$
400 PRINT GY$;"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";GN$
410 PRINT GY$;"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";GN$
420 PRINT GY$;"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";GN$
430 X5=10:Y5=3:GOSUB 990:PRINT ;DY$;"    TIME    ";
440 X5=30:Y5=3:GOSUB 990:PRINT      " KEYSTROKES "
450 X5=50:Y5=3:GOSUB 990:PRINT      "   ERRORS   ";DN$;
460 X5=10:Y5=4:GOSUB 990:PRINT      "            "
470 X5=30:Y5=4:GOSUB 990:PRINT      "            "
480 X5=50:Y5=4:GOSUB 990:PRINT      "            ":PRINT
490 PRINT GY$;:FOR I=1 TO 69:PRINT CHR$(123);: NEXT I:PRINT GN$
500 PRINT GY$;"xb";GN$;"|                                                               |  "
510 PRINT      "--|---------------------------------------------------------------|--"
520 PRINT GY$;"xb";GN$;"|                                                               |  "
530 PRINT GY$;:FOR I=1 TO 69:PRINT CHR$(123);: NEXT I:PRINT GN$:PRINT:PRINT
540 TIME=0 : GOOD=0 : BOBO=0 : ME=0 :TIMEB=0 : C1=0
550 '--------------------------------------------------------------------------
560 GOSUB 1020                                      ' Get line to TYPE:
570 X5=1:Y5=15:GOSUB 990:PRINT "READY? (Y/N/ESC)"
580 A$=INKEY$:IF LEN(A$)=0 THEN 580 ' Get keyboard input
590 IF A$="N" OR A$="n" THEN 340
600 IF A$="Y" OR A$="y" THEN 630
610 IF A$=E$ THEN 560
620 GOTO 580
630 X5=1:Y5=15:GOSUB 990:PRINT "                "
640 X5=6:Y5=13:GOSUB 990
650 FOR I=1 TO  10:PRINT CHR$(7);:NEXT I
660 FOR I=1 TO 500:               NEXT I
670 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
680 IF CHRNO>LL THEN GOSUB 1020             'Get next TYPE line if end-of-line
690 TRY$=MID$(L$,CHRNO,1)
700 X5=CHRNO+5:Y5=13:GOSUB 990
710 '---------------------------------------------------------------------
720 V$=INKEY$
730 C1=C1+1
740 IF C1=>CNTBASE THEN C1=0:GOSUB 810              'Change TIME yet?
750 IF TIME-TIMEB=>TIMED THEN GOSUB 860:TIMEB=TIME  'Move ME yet?
760 IF LEN(V$)=0 THEN 700
770 IF V$=TRY$ THEN PRINT V$ :CHRNO=CHRNO+1:GOSUB 830 ELSE PRINT CHR$(7);:GOSUB 840
780 GOSUB 920                                       'Move YOU!
790 GOTO 680
800 '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
810 TIME=TIME+.1: X5=13 : Y5=4 : GOSUB 990 :PRINT USING "###.#";TIME:PRINT:PRINT:PRINT
820 X5=CHRNO+5:Y5=13:GOSUB 990:RETURN                            'Update TIME
830 GOOD=GOOD+1 : X5=33 : Y5=4 : GOSUB 990 : PRINT GOOD;: RETURN 'Update GOOD
840 BOBO=BOBO+1 : X5=53 : Y5=4 : GOSUB 990 : PRINT BOBO;: RETURN 'Update BOBO
850 '--------------------------------------------------------------------------
860 X5=ME : ME=ME+1 : Y5=7
870 IF X5>65 THEN 1100     '  ------------------------------>  ME  WIN?
880 GOSUB 990
890 PRINT " ";:PRINT GY$;"xb";GN$
900 X5=CHRNO+5:Y5=13:GOSUB 990 : RETURN                          'Update ME
910 '--------------------------------------------------------------------------
920 X5=GOOD-BOBO-1:Y5=9
930 IF X5<1 THEN X5=0
940 IF X5>65 THEN 1100     '  ------------------------------>  YOU WIN?
950 GOSUB 990
960 PRINT " ";:PRINT GY$;"xb";GN$;" ";
970 X5=CHRNO+5:Y5=13:GOSUB 990 : RETURN                          'Update YOU
980 '--------------------------------------------------------------------------
990 PRINT DC$+CHR$(32+Y5)+CHR$(32+X5);:RETURN             'Position the courser
1000 '--------------------------------------------------------------------------
1020 READ L$
1040 LL=LEN(L$)
1050 CHRNO=1
1055 IF L$="LASTLINE" THEN RESTORE : GOTO 1020
1060 PRINT:X5=0:Y5=13:GOSUB 990:PRINT EP$
1070 PRINT:X5=0:Y5=13:GOSUB 990:PRINT "TYPE: ";DY$;L$;DN$
1080 RETURN
1090 '--------------------------------------------------------------------------
1100 X5=30                                                 'We have a WINNER!!!
1105 II=0
1110 FOR I=1 TO 10
1120 IF II=0 THEN PRINT CHR$(7);:II=1 ELSE II=0
1130 GOSUB 990:PRINT "WINNER!!"
1140 FOR I2=1 TO 100:NEXT I2
1150 GOSUB 990:PRINT "        "
1160 FOR I2=1 TO 100:NEXT I2
1170 NEXT I
1180 GOSUB 990:PRINT "WINNER!!"
1190 PRINT:PRINT:PRINT:PRINT:PRINT
1200 IF Y5=7 THEN 1260
1220 PRINT:PRINT "                    C O N G R A T U L A T I O N S !!!!"
1230 PRINT:PRINT "                     	YOU BEAT THE COMPUTER!!"
1240 TIMED = TIMED*(ME/65!)
1250 GOTO 1280
1260 PRINT:PRINT
1265 PRINT:PRINT "                     I MUST BE TO FAST FOR YOU"
1270 PRINT:PRINT "                     I'LL BE SLOWER NEXT TIME"
1275 TIMED = TIMED*(2-(GOOD-BOBO)/65!)
1280 PRINT:PRINT:PRINT:PRINT "DO YOU WANT TO PLAY AGAIN? (Y/N) ";
1290 A$=INKEY$:IF LEN(A$)=0 THEN GOTO 1290 ' get keyboard input
1300 IF A$="N" OR A$="n" THEN 1325
1310 IF A$="Y" OR A$="y" THEN 360
1320 GOTO 1290
1325 PRINT:PRINT:PRINT:PRINT:PRINT CLS$:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT "                      THANK YOU FOR PLAYING"
1326 PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT 
1328 END
1329 STOP
1330 '--------------------------------------------------------------------------
1340 PRINT CLS$;
1350 PRINT "                    WELCOME TO THE TYPING TEST HORSERACE"
1360 PRINT "                              by: Donald Hill "
1365 PRINT "                            (c) 1983 Donald Hill":PRINT
1370 PRINT "     The objece of the game is to get your horse (the bottom horse) across the";
1380 PRINT "finish line ";UY$;"before";UN$;
1390 PRINT " the other horse gets across.":PRINT
1400 PRINT "You will be given a sentence to type.":PRINT
1410 PRINT "Every time you type the right letter (or space) your horse will move forward "
1420 PRINT "one space.":PRINT
1430 PRINT "Every time you type the wrong letter (or space) your horse will move backward "
1440 PRINT "one space.":PRINT
1450 PRINT "If you finish the sentence, and your horse has not yet crossed the finish line"
1460 PRINT "you will be given another sentence to type.  Continue typing until your horse"
1470 PRINT "crosses the finish line, unless the other horse wins first.":PRINT
1480 PRINT "If you win and wish to play again, the other horse will get faster."
1490 PRINT "If you lose and wish to play again, the other horse will get slower."
1500 PRINT
1510 PRINT "Hit any key to continue";
1520 A$=INKEY$:IF LEN(A$)=0 THEN GOTO 1520 ' get keyboard input
1530 RETURN
1540 END
