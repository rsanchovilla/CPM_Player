1 PRINT CHR$(26)
10 PRINT"MATH"
20 PRINT
30 PRINT
40 PRINT"YOU WILL BE COUNTING THE NUMBER OF PICTURES"
50 PRINT
60 PRINT"             ON THE SCREEN"
65 PRINT
68 PRINT"PRESS 1 & RETURN IF YOU WANT TO BEGIN AT THE"
69 PRINT"               BEGINNING."
70 PRINT
72 PRINT"PRESS 2 & RETURN IF YOU WANT TO BEGIN TOWARD"
80 PRINT"                THE END."
85 PRINT:PRINT
90 INPUT "Enter 1 or 2:";CHAR$
100 IF CHAR$<>"1" THEN GOTO 10000
110 PRINT CHR$(26)
120 PRINT"THE BEGINNING"
130 PRINT
140 PRINT
150 PRINT
160 PRINT
170 PRINT"ANSWER THE QUESTIONS BY TYPING IN"
180 PRINT"THE CORRECT NUMBER OF FIGURES DISPLAYED"
190 PRINT"ON THE SCREEN.  BE SURE AND PRESS RETURN"
200 PRINT"AFTER YOU ENTER YOUR ANSWER."
210 PRINT
220 PRINT
230 PRINT:INPUT"Press RETURN to continue";X$:PRINT CHR$(26)
240 PRINT 
250 PRINT
260 PRINT"              <*>              <*>"
261 PRINT
262 PRINT
270 PRINT
280 PRINT
290 PRINT
300 INPUT"ENTER THE NUMBER OF <*>:";CHAR$
310 IF CHAR$<>"2" THEN GOTO 330
320 IF CHAR$="2" THEN GOTO 1000
330 PRINT
340 PRINT
350 PRINT
360 PRINT
370 PRINT"NO, THAT'S NOT RIGHT."
380 PRINT
390 PRINT"TRY ANOTHER ONE:"
400 PRINT
410 PRINT
420 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
430 PRINT
440 PRINT
450 PRINT"HOW MANY CATS?"
460 PRINT
470 PRINT
480 PRINT
490 PRINT"             ^   ^"
500 PRINT"              - -"
510 PRINT"               +"
520 PRINT"           /       /"
530 PRINT"          /       /"
540 PRINT"          _       _"
550 PRINT
560 PRINT
570 PRINT     
580 INPUT"Enter here:";CHAR$
589 IF CHAR$<>"1" THEN GOTO 600
590 IF CHAR$="1" THEN GOTO 1000
600 PRINT"NO, THAT'S NOT RIGHT."
610 PRINT
620 PRINT
630 PRINT
640 PRINT:INPUT"Press RETURN to try another one.",X$:PRINT CHR$(26)
650 GOTO 240
660 END
1000 PRINT"THAT'S RIGHT."
1010 PRINT"TRY ANOTHER:"
1020 PRINT
1030 PRINT
1040 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
1050 PRINT
1060 PRINT
1070 PRINT"         *  *        *  *"
1080 PRINT"        * ** *      * ** *"
1090 PRINT"        * ** *      * ** *"
1100 PRINT"         .  .        .  ."
1110 PRINT"        =    =      =    ="
1120 PRINT"          \/          \/"
1130 PRINT"         *  *        *  *"
1140 PRINT"        *    *      *    *"
1150 PRINT"      *      *    *      *"
1160 PRINT"     * *     *   * *     *"
1170 PRINT"      *  = =*        = =*"
1180 PRINT
1190 PRINT
1200 INPUT"HOW MANY RABBITS:";CHAR$
1210 IF CHAR$<>"2" THEN GOTO 1255
1220 PRINT
1230 PRINT"THAT'S RIGHT."
1240 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
1250 GOTO 1260
1255 PRINT
1256 PRINT"NO, THAT'S NOT RIGHT."
1257 PRINT
1258 PRINT:INPUT"Press RETURN and try again.",X$:PRINT CHR$(26)
1259 GOTO 430
1260 PRINT
1270 PRINT
1280 PRINT
1290 PRINT
1300 PRINT"YOU ARE DOING VERY WELL."
1310 PRINT
1320 PRINT"TRY SOME MORE:"
1330 PRINT
1340 PRINT
1350 PRINT
1360 PRINT"                               /\"                       
1370 PRINT"                              /  \"            
1380 PRINT"			     /    \"
1390 PRINT"         	 	     \    /"
1400 PRINT"		              \  /"
1410 PRINT"			       \/"
1420 PRINT
1430 INPUT"HOW MANY DIAMONDS:";CHAR$
1440 IF CHAR$<>"1" THEN GOTO 1480
1450 PRINT"YES, RIGHT AGAIN."
1460 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
1470 GOTO 1520
1480 PRINT"NO, THAT'S NOT RIGHT."
1490 PRINT"LET'S TRY THAT ONE AGAIN."
1500 PRINT:INPUT"Press RETURN.",X$:PRINT CHR$(26)
1510 GOTO 1330
1520 PRINT"HOW ABOUT THIS ONE:"
1530 PRINT
1540 PRINT
1550 PRINT
1560 PRINT"             /\              /\"                    
1570 PRINT"            /  \            /  \"
1580 PRINT"           /    \          /    \"
1590 PRINT"           \    /          \    /"
1600 PRINT"            \  /            \  /"                                
1610 PRINT"             \/              \/"
1620 PRINT
1630 PRINT
1640 INPUT"HOW MANY THIS TIME:";CHAR$
1650 IF CHAR$="2" THEN GOTO 1700
1660 PRINT"NO, THAT'S NOT RIGHT."
1670 PRINT"TRY SOME MORE DIAMONDS."
1680 PRINT:INPUT"Press RETURN.",X$:PRINT CHR$(26)
1690 GOTO 1330
1700 PRINT
1710 PRINT"THAT'S RIGHT."
1720 PRINT
1730 PRINT:INPUT"Press RETURN for another go at the diamonds.",X$:PRINT CHR$(26)
1740 PRINT
1750 PRINT
1760 PRINT"       /\        /\        /\"
1770 PRINT"      /  \      /  \      /  \"
1780 PRINT"      \  /      \  /      \  /"
1790 PRINT"       \/        \/        \/"
1800 PRINT
1810 PRINT
1820 PRINT"THESE ARE SMALLER DIAMONDS."
1830 PRINT"ARE THEY HARDER TO COUNT?"
1840 PRINT
1850 INPUT"Enter the number of diamonds on the screen:";CHAR$
1860 IF CHAR$="3" THEN GOTO 9997
1870 PRINT 
1880 PRINT"NO, THAT'S NOT RIGHT.  THERE ARE 3 DIAMONDS."
1890 PRINT:INPUT"Press RETURN and you can try some more.",X$:PRINT CHR$(26)
1900 PRINT"COUNTING WITH LETTERS:"
1910 PRINT
1920 PRINT
1930 PRINT"How many of the letter M are on the screen below?"
1940 PRINT
1950 PRINT
1960 PRINT"            M"
1970 PRINT
1980 PRINT"                      M"
1990 PRINT
2000 PRINT
2010 INPUT"Enter your answer:";CHAR$
2020 IF CHAR$<>"2" THEN GOTO 2060
2030 PRINT"THAT'S RIGHT."
2040 PRINT:INPUT"Press RETURN for more.",X$:PRINT CHR$(26)
2050 GOTO 2080
2060 PRINT"YOU MUST HAVE MISCOUNTED.  YOUR ANSWER IS NOT RIGHT."
2070 PRINT:INPUT"Press RETURN and try again.",X$:PRINT CHR$(26)
2080 PRINT"How many of the letter S are below?"
2090 PRINT
3000 PRINT
3010 PRINT
3020 PRINT
3030 PRINT"                                S"
3040 PRINT 
3050 PRINT
3060 PRINT
3070 INPUT"Enter your answer:";CHAR$
3080 IF CHAR$="1" THEN GOTO 4000
3090 PRINT"NO, THAT'S NOT RIGHT."
4000 PRINT"THERE IS ONLY 1 S ON THE SCREEN TO BE COUNTED."
4005 IF CHAR$="1" THEN PRINT"YOU ARE RIGHT."
4010 PRINT
4020 PRINT:INPUT"Press RETURN and try another letter.",X$:PRINT CHR$(26)
4030 PRINT"How many:"
4040 PRINT"                 R"
4050 PRINT
4060 INPUT"Enter your answer:";CHAR$
4070 IF CHAR$="1" THEN GOTO 5000
4080 PRINT"NO, THAT'S NOT RIGHT."
4090 PRINT"TRY ANOTHER ONE."
4095 GOTO 5010
5000 PRINT"THAT'S RIGHT.  TRY ANOTHER ONE."
5010 PRINT
5020 PRINT"How many:"
5030 PRINT"             F            F"
5040 PRINT
5050 INPUT"Enter your answer:";CHAR$
5060 IF CHAR$="2" THEN GOTO 5080
5070 PRINT"NO, THERE ARE 2 Fs TO BE COUNTED."
5075 GOTO 5090
5080 PRINT
5085 PRINT"RIGHT."
5090 PRINT"TRY A THIRD ONE.  HOW MANY:"
6000 PRINT"                                     K"
6010 PRINT
6020 INPUT"Enter your answer:";CHAR$
6030 IF CHAR$<>"1" THEN GOTO 6070
6040 PRINT"YES, THAT IS RIGHT. NOW LET'S MOVE ON."
6050 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
6060 GOTO 6090
6070 PRINT"NO, THAT IS NOT RIGHT. LET'S GO BACK & TRY AGAIN."
6080 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
6085 GOTO 1930
6090 PRINT"ONLY COUNT THE J's ON THE SCREEN BELOW:"
7000 PRINT
7010 PRINT
7020 PRINT
7040 PRINT"        J"
7050 PRINT"           J"
7060 PRINT"              M"
7070 PRINT"                 J"
7080 PRINT
7090 PRINT
8000 INPUT"Enter the number of J's on the screen:";CHAR$
8010 PRINT"THAT WAS A TRICKY ONE."
8020 IF CHAR$<>"3" THEN GOTO 8070
8030 PRINT"IF YOU ENTERED `3' YOU WERE RIGHT.  YOU'RE READY FOR"
8040 PRINT"LEVEL TWO.  PRESS THE RETURN KEY IF YOU WISH TO"
8050 PRINT:INPUT"TO CONTINUE.",X$:PRINT CHR$(26)
8060 GOTO 30120
8070 PRINT"The trick was that there were 4 letters, but 1 of"
8080 PRINT"them was an M.  There were only 3 J's."
8090 PRINT"THE ANSWER WAS 3."
9000 PRINT
9010 PRINT:INPUT"|Press RETURN to continue.",X$:PRINT CHR$(26)
9020 PRINT"How many Q:"
9030 PRINT"               Q"
9040 INPUT"Enter your answer:";CHAR$
9042 IF CHAR$="1" THEN PRINT"RIGHT."
9044 IF CHAR$<>"1" THEN PRINT"NO, THAT IS NOT RIGHT."
9045 PRINT
9046 PRINT
9047 PRINT"How many Q now:"
9048 PRINT"                 Q"
9049 INPUT"Enter your answer:";CHAR$
9050 IF CHAR$="1" THEN GOTO 9070
9055 PRINT"NO, THE ANSWER TO BOTH IS `1'"
9057 PRINT:PRINT"ALTHOUGH, THEY DO ADD UP TO `2'"
9061 PRINT:PRINT"MAYBE YOU NEED MORE REVIEW."
9062 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
9063 GOTO 230
9070 PRINT"RIGHT.  BOTH HAVE 1 `Q'."
9071 PRINT
9072 PRINT"How many Q now:"
9073 PRINT"                    Q      T      Q"
9074 INPUT"Enter:";CHAR$
9075 IF CHAR$<>"2" THEN GOTO 9087
9076 PRINT"RIGHT.  Try one more."
9077 PRINT
9078 PRINT"How many T:"
9079 PRINT"              T      Y      T"
9080 INPUT"Enter:";CHAR$
9081 IF CHAR$<>"2" THEN GOTO 9087
9082 PRINT"RIGHT AGAIN.  LET'S TRY ONE YOU MISSED ON BEFORE."
9083 PRINT"IF YOU CAN GET IT RIGHT, YOU CAN TRY THE HARDER ONES."
9084 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
9085 GOTO 6090
9087 PRINT"NO, THAT'S NOT RIGHT."
9088 PRINT"There are 2 T's and 1 Y.  The answer for T was 2."
9089 PRINT
9090 PRINT:INPUT"Press RETURN and let's try some more.",X$:PRINT CHR$(26)
9091 GOTO 30160
9997 PRINT"Very well done."
9998 PRINT"You may be ready for the to reach the castle..."
9999 PRINT:INPUT"If you would like to go on, press RETURN.",X$:PRINT CHR$(26)
10000 PRINT CHR$(26)
10002 GOTO 9020
30000 PRINT CHR$(26)
30001 PRINT"THIS IS THE WAY TO THE CASTLE.  WELCOME."     
30020 PRINT
30030 PRINT
30040 PRINT"THIS LEVEL IS MUCH LIKE THE BEGINNING,"
30050 PRINT"ONLY USING BIGGER NUMBERS (up to 3)."
30060 PRINT
30070 PRINT"ENTER YOUR NUMBER AND PRESS RETURN"
30080 PRINT"TO SEE IF YOU ARE CORRECT."
30082 PRINT
30084 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
30090 PRINT"HOW MANY?"
30091 PRINT
30092 PRINT
30093 PRINT"            ^         ^           ^"
30094 PRINT"           / \       / \         / \"
30095 PRINT"          // \\     // \\       // \\"
30096 PRINT"            |         |           |"
30097 PRINT"            -         -           -"
30098 PRINT
30099 PRINT
30100 INPUT"Enter the number of pine trees:";CHAR$
30101 IF CHAR$="3" THEN GOTO 30941
30103 PRINT"NO, THAT'S NOT RIGHT."
30106 PRINT"LET'S GO BACK TO LEVEL ONE AND REVIEW."
30109 PRINT:INPUT"Press RETURN to continue.",X$:PRINT CHR$(26)
30112 GOTO 450
30120 PRINT
30130 PRINT
30160 PRINT
30170 PRINT"             ^   ^"
30180 PRINT"              - -"
30190 PRINT"               +"
30200 PRINT"           /       /"
30210 PRINT"          /       /     *"
30220 PRINT"          _       _ * *"
30230 PRINT
30232 PRINT
30240 PRINT
30250 PRINT
30260 PRINT"             ^   ^"
30270 PRINT"              - -"
30280 PRINT"               +"
30290 PRINT"           /       /"
30300 PRINT"          /       /     *"
30310 PRINT"          _       _ * *"
30320 PRINT
30330 PRINT"                            How many CATS are"
30340 INPUT"                            on the screen:";CHAR$ 
30350 IF CHAR$<>"2" THEN GOTO 30380
30360 PRINT:INPUT"RIGHT. Now press RETURN.",X$:PRINT CHR$(26)
30370 GOTO 30400
30380 PRINT"NO, THAT IS NOT RIGHT."
30390 PRINT:INPUT"Press RETURN and try some more.",X$:PRINT CHR$(26)
30400 PRINT"         *  *        *  *"
30410 PRINT"        * ** *      * ** *"
30420 PRINT"        * ** *      * ** *"
30430 PRINT"         .  .        .  ."
30440 PRINT"        =    =      =    ="
30450 PRINT"          \/          \/"
30460 PRINT"         *  *        *  *"
30470 PRINT"        *    *      *    *"
30480 PRINT"      *      *    *      *"
30490 PRINT"     * *     *   * *     *"
30500 PRINT"      *  = =*        = =*"
30510 PRINT"             *  *"
30520 PRINT"            * ** *"
30530 PRINT"            * ** *"
30540 PRINT"             .  ."
30550 PRINT"            =    ="
30560 PRINT"              \/"
30570 PRINT"             *  *"
30580 PRINT"            *    *"
30590 PRINT"           *      *"
30600 PRINT"          * *     *"
30610 PRINT"             = =*"
30620 INPUT"Enter how many rabbits:";CHAR$
30630 PRINT
30640 PRINT"There are 3 rabbits.  And now 2 of them"
30650 PRINT"are getting there poor little ears cut off."
30660 PRINT"If you press RETURN they will disappear altogether,"
30680 PRINT:INPUT"even without a magic wand.",X$:PRINT CHR$(26)
30690 PRINT"OOPS."
30700 PRINT"They didn't all disappear yet."
30710 PRINT
30720 PRINT"How many are left?"
30730 PRINT
30740 PRINT"             *  *"
30750 PRINT"            * ** *"
30760 PRINT"            * ** *"
30770 PRINT"             .  ."
30780 PRINT"            =    ="
30790 PRINT"              \/"
30800 PRINT"             *  *"
30810 PRINT"           **    *"
30820 PRINT"         * *      *"
30830 PRINT"          * *=  = *"
30840 PRINT
30850 INPUT"                               Enter:";CHAR$
30860 IF CHAR$="1" THEN GOTO 30910
30870 PRINT"NO, There is only 1 rabbit left."
30880 PRINT"And if you press RETURN there will be"
30890 PRINT:INPUT"no rabbits left.",X$:PRINT CHR$(26)
30900 GOTO 230
30910 PRINT"YES, only one rabbit left."
30920 PRINT"But press RETURN to see if"
30930 PRINT:INPUT"the magic will work this time.",X$:PRINT CHR$(26)
30940 GOTO 31000 
30941 PRINT"RIGHT."
30942 PRINT
30943 PRINT"You have been rewarded a trip to THE CASTLE"
30944 PRINT"for your success in counting."
30945 PRINT
30946 PRINT"Merely press RETURN and the Osborne will help"
30948 PRINT" take you there..."
30949 PRINT:INPUT" ",X$:PRINT CHR$(26)
30950 RUN "B:PICTURE.BAS"
30951 REM be sure and ask if they want to answer wrong just to see what might happen
31000 PRINT"IF YOU GET THIS ONE RIGHT"
31003 PRINT"YOU WILL GO DIRECTLY TO THE LAST FRAME"
31006 PRINT"WITHOUT ANY DELAY."
31009 PRINT
31012 PRINT"BUT IF YOU GET IT WRONG..."
31013 PRINT
31014 PRINT
31015 PRINT"    /\!       /\!       /\!"
31016 PRINT"   /  \      /  \      /  \"
31017 PRINT"   |__|      |__|      |__|"
31018 PRINT
31019 PRINT 
31020 INPUT"Enter the number of houses:";CHAR$
31025 IF CHAR$<>"3" THEN PRINT"SORRY.  THERE ARE 3 HOUSES."
31027 IF CHAR$<>"3" THEN PRINT:INPUT"Press RETURN.",X$:PRINT CHR$(26)
31030 IF CHAR$<>"3" THEN GOTO 1360
31040 IF CHAR$="3" THEN GOTO 30000
"3" THEN PRINT:INPUT"Press RETURN.",X$:PRINT CHR$(26)
31030 IF CH