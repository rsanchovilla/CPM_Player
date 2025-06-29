10 REM* * * * * * * * * * * * * * * * * *
20 REM*        STATE CAPITALS
30 REM* * * * * * * * * * * * * * * * * *
40 PRINT CHR$(26)
50 PRINT "                        *"
60 PRINT "                      *   *"
70 PRINT "                     *     *"
80 PRINT "                    *       *"
90 PRINT "                  *           *"
100 PRINT "                *               *"
110 PRINT "              *                   *"
120 PRINT "            *    STATE  CAPITALS    *"
130 PRINT "          *       by Ray Gordon       *"
140 PRINT "         *     COPYRIGHT (C) 1979      *"
150 PRINT "        *                               *"
160 PRINT "       *                                 *"
170 PRINT "      * * * * * * * * * * * * * * * * * * *"
180 PRINT "      *     * *        * *        * *     *"
190 PRINT "      *     * *        * *        * *     *"
200 PRINT "      *     * *        * *        * *     *"
210 PRINT "      *     * *        * *        * *     *"
220 PRINT "      * * * * * * * * * * * * * * * * * * *"
230 PRINT "    *                                       *"
240 PRINT "  *                                           *"
250 PRINT
260 PRINT "              Press SPACE to begin "
270 LET X$=INKEY$
280 IF LEN(X$)=0 THEN Y=Y+1: GOTO 270
290 RANDOMIZE Y
300 REM* * * * * * * * * * * * * * * * * *
310 REM*         MAIN  LOOP
320 REM* * * * * * * * * * * * * * * * * *
330 GOSUB 350
340 GOTO 450
350 PRINT CHR$(26)
360 PRINT "             KNOW THE STATE CAPITALS"
370 PRINT "                  by Ray Gordon
380 PRINT "               COPYRIGHT (C) 1979"
390 PRINT:PRINT:PRINT:PRINT
400 PRINT "        I WILL GIVE YOU THE STATE AND YOU"
410 PRINT "             GIVE ME THE CAPITAL."
420 LET S=INT(RND*50)
430 RESTORE 930
440 RETURN
450 IF T<>0 THEN 500
460 FOR I=1 TO S
470   READ S$
480   READ C$
490 NEXT I
500 PRINT:PRINT
510 PRINT "        WHAT IS THE CAPITAL OF ";S$;"?  "
520 PRINT
530 INPUT "                  ",R$
540 IF C$=R$ THEN 670
550 PRINT : PRINT "             YOU MISSED.  TRY AGAIN. "
560 PRINT:PRINT "                Press SPACE"
570 LET M=M+1
580 LET T=T+1
590 IF T=2 THEN  GOSUB 820
600 IF T=4 THEN GOSUB 870
610 GOSUB 790
620 A$=INPUT$ (1)
630 GOTO 330
640 REM* * * * * * * * * * * * * * * * * *
650 REM        RESPONSE FOR CORRECT ANSWER
660 REM* * * * * * * * * * * * * * * * * *
670 PRINT : PRINT "             CORRECT.  TRY ANOTHER. "
680 PRINT
690 PRINT "                  Press SPACE"
700 PRINT
710 LET K=K+1
720 LET T=0
730 GOSUB 790
740 A$=INPUT$ (1)
750 GOTO 330
760 REM* * * * * * * * * * * * * * * * * * * *
770 REM           DISPLAY SCORE
780 REM* * * * * * * * * * * * * * * * * * * *
790 PRINT
800 PRINT "        SCORE:   RIGHT:";K;"   WRONG";M
810 RETURN
820 PRINT
830 LET F$=LEFT$(C$,1)
840 PRINT "   HERE'S A HINT. THE FIRST LETTER IS '";F$;"'";
850 PRINT
860 RETURN
870 PRINT
880 PRINT "       IT'S TOUGH. THE CAPITAL IS ";C$
890 RETURN
900 REM* * * * * * * * * * * * * * * * * * * * *
910 REM       ENTER DATA STATEMENTS HERE
920 REM* * * * * * * * * * * * * * * * * * * * *
930 DATA "MASSACHUSETTS","BOSTON","MAINE","AUGUSTA"
940 DATA "VERMONT","MONTPELIER","NEVADA","CARSON CITY"
950 DATA "NEW HAMPSHIRE","CONCORD","NEW YORK","ALBANY"
960 DATA "NEW JERSEY","TRENTON","CONNECTICUTT","HARTFORD"
970 DATA "VIRGINIA","RICHMOND","W.VIRGINIA","CHARLESTON"
980 DATA "MARYLAND","ANNAPOLIS","NORTH CAROLINA","RALEIGH"
990 DATA "S.CAROLINA","COLUMBIA","FLORIDA","TALLAHASSEE"
1000 DATA "GEORGIA","ATLANTA","ALABAMA","MONTGOMERY"
1010 DATA "ARKANSAS","LITTLE ROCK","MISSISSIPI","JACKSON"
1020 DATA "WASHINGTON","OLYMPIA"," NEW MEXICO","SANTA FE"
1030 DATA "NORTH DAKOTA","BISMARK","S.DAKOTA","PIERRE"
1040 DATA "IDAHO","BOISE","ILLINOIS","SPRINGFIELD"
1050 DATA "OHIO","COLUMBUS","INDIANA","INDIANAPOLIS"
1060 DATA "IOWA","DES MOINES","KANSAS","TOPEKA"
1070 DATA "MISSOURI","JEFFERSON CITY","OKLAHOMA","OKLAHOMA CITY"
1080 DATA "COLORADO","DENVER","UTAH","SALT LAKE CITY"
1090 DATA "HAWAII","HONOLULU","ALASKA","JUNEAU"
1100 DATA "TEXAS","AUSTIN","LOUISIANA","BATON ROUGE"
1110 DATA "WISCONSIN","MADISON","MINNESOTA","ST. PAUL"
1120 DATA "MICHIGAN","LANSING","KENTUCKY","FRANKFORT"
1130 DATA "TENNESSEE","NASHVILLE","NEBRASKA","LINCOLN"
1140 DATA "MONTANA","HELENA","WYOMING","CHEYENNE"
1150 DATA "DELAWARE","DOVER","CALIFORNIA","SACRAMENTO"
1160 DATA "OREGON","SALEM","ARIZONA","PHOENIX"
,"WYOMING","CHEYENNE"
115