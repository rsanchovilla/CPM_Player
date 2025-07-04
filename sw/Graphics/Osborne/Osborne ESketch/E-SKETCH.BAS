1 PRINT CHR$(26):GOSUB 9500:FOR M=1 TO 1000:NEXT M:REM **SETUP ROUTINE**
2 CLEAR :GOTO 18000
3 GOSUB 9100:FOR B=56500! TO 58980!:POKE B,32:NEXT B
45 PRINT CHR$(26)
50 GOSUB 9100
90 GOTO 1800
95 REM                                                 **DRAWING ROUTINE**
100 X$=INKEY$
110 IF X$="4" THEN GOTO 1000
120 IF X$="6" THEN GOTO 1200
130 IF X$="8" THEN GOTO 1400
135 IF X$="5" THEN 1800
137 IF X$="0" THEN PRINT CHR$(26)
140 IF X$="2" THEN GOTO 1600
150 IF X$="" THEN 100
160 IF ASC(X$)=27 THEN GOTO 8000
1000 X=X-1:PRINT FNP$(X,Y);FNG$(I);:GOSUB 9010:GOTO 100
1200 X=X+1: PRINT FNP$(X,Y);FNG$(I);:GOSUB 9010:GOTO 100
1400 Y=Y-1:PRINT FNP$(X,Y);FNG$(I);:GOSUB 9010:GOTO 100
1600 Y=Y+1:PRINT FNP$(X,Y);FNG$(I);:GOSUB 9010:GOTO 100
1800 PRINT FNP$(2,22);"CHARACTER:    ";
1810 Y$=INKEY$:IF Y$="" THEN 1810
1820 I=ASC(Y$):PRINT FNP$(14,22);FNG$(I);" ";
1825 IF I=27 THEN GOTO 18000
1830 PRINT FNP$(22,22);" ";:INPUT "X POSITION:  ",Z$
1835 PRINT FNP$(42,22);" ";:INPUT "Y POSITION:  ",Q$
1836 X=VAL(Z$):Y=VAL(Q$):IF ASC(Z$)=27 OR ASC(Q$)=27 THEN GOTO 18000     
1837 PRINT FNP$(2,22);"                                                              "
1838 PRINT FNP$(X,Y);
1839 GOTO 100
1850 REM                                           **SAVE DRAWING**
1860 REM
8000 PRINT FNP$(5,22);:LINE INPUT "File name (CAPS) to save under: ";FIL$
8100 PRINT FNP$(5,22);"                                                   ";
8180 OPEN "O",1,FIL$+".BAS"
8190 FILE =-1
8200 K=20
8205 IN=1
8210 PRINT #1,"10 PRINT CHR$(26)"
8212 FOR J=49151! TO 52175! STEP 128
8214 FOR I=1 TO 80 
8216 OUT 0,65
8218 Z=PEEK(I+J)
8220 OUT 0,1
8238 IF Z=160 OR Z=32 THEN GOTO 8330
8240 X$=STR$(Z)
8250 A$=STR$(I+J)
8255 L$=STR$(K+1)
8260 K$=STR$(K) : K$=MID$(K$,2,LEN(K$))
8270 P$="POKE":S$=",":O$=":":R$="OUT 0,1":Q$="OUT 0,65"
8280 T$=K$+" "+Q$+O$+P$+A$+S$+X$+O$+R$
8300 IF NOT FILE THEN 8320
8310 PRINT #1,T$
8320 K=K+IN:REM INCREMENT LINE NUMBER
8330 NEXT I
8335 NEXT J
8345 PRINT #1,"5000 CHAIN ";CHR$(34);"E-SKETCH";CHR$(34);",50"
8347 IF NOT FILE THEN END
8350 CLOSE:PRINT:PRINT "FILE CLOSED SUCCESSFULLY"
8355 PRINT FNP$(2,22);"                                   ";
8360 GOTO 50 
9010 J=(100*Y)+X
9020 POKE 56500!+J,I
9030 RETURN
9100 DEF FNP$(X,Y)=CHR$(27)+"="+CHR$(32+Y)+CHR$(32+X)
9150 DEF FNV(X,Y)=(X+(128*Y)+49151!)
9200 DEF FNG$(I)=CHR$(27)+CHR$(103)+CHR$(I)+CHR$(27)+CHR$(71)
9250 WIDTH 255
9300 RETURN
9400 REM                                          **OPENING SCREEN**
9410 REM
9500 GOSUB 9100
9559 FOR Y=21 TO 2 STEP -1:PRINT FNP$(5,Y);FNG$(118);:NEXT Y
9600 FOR X=5 TO 70:PRINT FNP$(X,2);FNG$(118);:NEXT X
9700 FOR Y=2 TO 21:PRINT FNP$(70,Y);FNG$(118);:NEXT Y
9800 FOR X=70 TO 12 STEP -1:PRINT FNP$(X,21);FNG$(118);:NEXT X
9900 FOR Y=21 TO 5 STEP -1:PRINT FNP$(12,Y);FNG$(118);:NEXT Y
9950 FOR X=12 TO 64:PRINT FNP$(X,5);FNG$(118);:NEXT X
9960 FOR Y=6 TO 18:PRINT FNP$(64,Y);FNG$(118);:NEXT Y
9970 FOR X=63 TO 18 STEP -1:PRINT FNP$(X,18);FNG$(118);:NEXT X
9975 FOR Y=17 TO 8 STEP -1:PRINT FNP$(18,Y);FNG$(118);:NEXT Y
9980 FOR X=19 TO 58:PRINT FNP$(X,8);FNG$(118);:NEXT X
9985 FOR Y=8 TO 15:PRINT FNP$(58,Y);FNG$(118);:NEXT Y
9990 FOR X=58 TO 25 STEP -1:PRINT FNP$(X,15);FNG$(118);:NEXT X
9992 PRINT FNP$(27,11);"Electronic Sketching Pad";
9994 PRINT FNP$(28,13);FNG$(115);" 1984  by W. vanRiper";
10000 RETURN
10500 REM                                         **INSTRUCTIONS**
10510 REM
11000 PRINT CHR$(26):PRINT TAB(15);"Instructions for Electronic Sketch Pad"
11010 PRINT TAB(15);"**************************************"
11020 PRINT
11030 PRINT TAB(10);"Basically, this program lets you draw pictures on the screen using"
11040 PRINT TAB(10);"graphic characters:"
11045 PRINT
11050 PRINT TAB(10);"          ";:FOR E=96 TO 122:PRINT FNG$(E);:NEXT E
11055 PRINT:PRINT
11060 PRINT TAB(10);"and the regular characters:"
11065 PRINT
11070 PRINT TAB(10);"          ";:FOR E=33 TO 80:PRINT CHR$(E);:NEXT E
11072 PRINT
11075 PRINT TAB(10);"          ";:FOR E=81 TO 95:PRINT CHR$(E);:NEXT E:FOR E=123 TO 126:PRINT CHR$(E);:NEXT E
11080 PRINT:PRINT
11090 PRINT TAB(10);"After these help screens goes away, you'll go back to the menu"
11095 PRINT TAB(10);"which will allow you to draw, save, or retrieve a drawing from"
11100 PRINT TAB(10);"disk storage.  To draw, use any of the lower case letters on"
11110 PRINT TAB(10);"the keyboard, which become graphics characters on the screen,"
11120 PRINT TAB(10);"or any of the other characters, which stay the same as they always"
11130 PRINT TAB(10);"were.  "
11135 PRINT FNP$(22,22);"HIT ANY KEY TO CONTINUE......";
11137 A$=INKEY$:IF A$="" THEN 11137
11138 PRINT CHR$(26)
11139 PRINT:PRINT
11140 PRINT TAB(10);"       What this means is that you can't use the lower case"
11150 PRINT TAB(10);"letters to draw with.  Select a character at the prompt in the "
11160 PRINT TAB(10);"lower left corner of the screen.  Use the 2,4,6, and 8 keys to"
11170 PRINT TAB(10);"move the letter around.  To change characters, hit the 5 key."
11180 PRINT TAB(10);"Hitting the <ESC> key at the CHARACTER prompt takes you back"
11185 PRINT TAB(10);"to the main menu.  Hitting the <ESC> key from INSIDE THE "
11187 PRINT TAB(10);"DRAWING will (non-destructively!) save that drawing.  This"
11190 PRINT TAB(10);"takes about a minute for most drawings......"
11192 PRINT TAB(10);"     Now, after selecting a character, the program asks for "
11193 PRINT TAB(10);"X-POSITION and Y-POSITION - just fill in the numbers."
11194 PRINT TAB(10);"       What numbers, you ask?  Hit N to see what I mean."
11195 PRINT:PRINT TAB(25);"Hit N.....";
11197 A$=INKEY$:IF A$="" THEN 11197
11198 IF A$="N" OR A$="n" THEN GOSUB 12000 ELSE 11197
11199 GOSUB 13000:PRINT FNP$(20,22);"HIT ANY KEY TO CONTINUE.....";
11200 A$=INKEY$:IF A$="" THEN 11200
11201 PRINT CHR$(26)
11202 PRINT:PRINT:PRINT:PRINT:PRINT TAB(10);"In summary:"
11210 PRINT:PRINT TAB(10);"   5  changes characters at any time and allows you to"
11220 PRINT TAB(10);"      jump the cursor to any place on the screen using:"
11222 PRINT:PRINT TAB(20);"X POSITION:"
11224 PRINT TAB(20);"Y POSITION:"
11230 PRINT:PRINT TAB(10);" <ESC>    takes you back to the menu from CHARACTER:"
11235 PRINT TAB(10);"        or  saves the screen you are working on"
11240 PRINT:PRINT:PRINT TAB(10); "Nothing to it.  Just try it out. Hitting any key takes"
11250 PRINT TAB(10);"you back to the top and another chance to read these"
11252 PRINT TAB(10);"instructions."
11255 PRINT FNP$(22,22);"HIT ANY KEY TO CONTINUE....";
11260 A$=INKEY$:IF A$="" THEN 11260
11265 PRINT CHR$(26)
11270 GOTO 18000
12000 FOR X=10 TO 70 STEP 10:PRINT FNP$(X,1);X:NEXT X
12100 FOR Y=1 TO 22:PRINT FNP$(1,Y);Y;:NEXT Y
12200 RETURN
13000 PRINT FNP$(10,17);"For instance:  X POSITION 40  and  Y POSITION 19  puts the cursor"
13050 PRINT FNP$(34,19);"here: ";FNG$(118);
13100 RETURN
16500 REM                                      **READER SUBROUTINE**
16600 REM
17000 GOSUB 17240
17050 PRINT CHR$(26)
17060 GOSUB 17190
17080 PRINT CHR$(26)
17170 GOTO 100
17190 PRINT FNP$(10,6);"Name of picture to show: ";
17200 LINE INPUT FIL$
17210 PRINT FNP$(10,8);"Loading memory, please relax a moment....."
17220 CHAIN FIL$
17230 RETURN
17240  WIDTH 255
17250 DEF FNP$(X,Y)=CHR$(27)+"="+CHR$(32+Y)+CHR$(32+X)
17260 DEF FNG$(A)=CHR$(27)+CHR$(103)+CHR$(A)+CHR$(27)+CHR$(71)
17270 RETURN
17280 RETURN
17900 REM                                     **MENU**
18000 PRINT CHR$(26):GOSUB 17240:GOSUB 20000
18010 PRINT FNP$(20,5);"Electronic Sketch Pad Menu"
18020 PRINT FNP$(15,8);"1.  Create new drawings"
18030 PRINT FNP$(15,9);"2.  Display and work on an old drawing"
18035 PRINT FNP$(15,10);"3.  Instructions"
18040 PRINT FNP$(15,12);"B.  Exit to Mbasic"
18050 PRINT FNP$(15,13);"C.  Exit to CP/M"
18060 PRINT FNP$(15,18);"Please indicate selection: ";
18070 A$=INKEY$:IF A$="" THEN 18070
18080 IF A$="1" THEN PRINT CHR$(26):GOTO 45
18090 IF A$="2" THEN GOTO 17000
18100 IF A$="B" OR A$="b" THEN PRINT CHR$(26):END
18200 IF A$="C" OR A$="c" THEN PRINT CHR$(26):SYSTEM
18300 IF A$="3" THEN GOTO 11000 ELSE 18060
18400 GOTO 18000
20000 GOSUB 9100
20020 PRINT CHR$(26)
20030 FOR X=7 TO 70
20040 Y=2:C=160:GOSUB 30000
20050 NEXT X
20060 FOR Y=2 TO 20
20070 X=70:C=160:GOSUB 30000
20080 NEXT Y
20090 FOR X=70 TO 7 STEP -1
20100 Y=20:C=160:GOSUB 30000
20110 NEXT X
20120 FOR Y=19 TO 3 STEP -1
20130 X=7:C=160:GOSUB 30000
20140 NEXT Y
20150 RETURN
30000 OUT 0,65
30010 POKE FNV(X,Y),C
30020 OUT 0,1
30030 RETURN
