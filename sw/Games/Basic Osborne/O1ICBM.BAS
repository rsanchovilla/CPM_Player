1 PRINT CHR$(26)
5 OPEN "I", #1, "O1ICBM.HSC":INPUT #1,G1,I1$,HS,HS$,G3,I3$:CLOSE #1
10 RANDOMIZE
20 GOSUB 440
30 GOSUB 160:GOSUB 380
40 A$=INKEY$
50 IF A$=","THEN PL=P:P=P-1
60 IF A$="."THEN PL=P:P=P+1
70 IF P>64433! THEN P=64433!
80 IF P<64386! THEN P=64386!
90 POKE PL,150:POKE P,158
100 IF A$="S"THEN GOSUB 240
110 IF B=1 THEN GOSUB 260
120 POKE T,32:T=T+R
130 IF T>TS+48 THEN GOSUB 160
140 POKE T,CH
150 GOTO 40
160 TS=61441!+INT(RND*20+2)*128:T=TS+1:R=.1*(INT(RND*5)+1)
170 IF HT=0 AND CH=143 THEN EN = EN + 1
180 IF HT=0 AND CH=140 THEN EN = EN + 3
190 IF HT=0 AND CH=141 THEN EN = EN + 5
195 PRINT CHR$(30):PRINT TAB(2);"     SCORE";SC;"  - POINTS";EN;"   HIGH SCORE";HS;:PRINT CHR$(30):POKE 61568!,150
200 HT=0
210 IF EN>30 THEN GOTO 430
220 IF R<.2 THEN CH=141 ELSE IF R>.4 THEN CH=143 ELSE CH=140
230 RETURN
240 IF B=0 THEN B=1:SP=P-128:POKE SP,139
250 RETURN
260 POKE SP,32:SP=SP-128
270 IF SP<61696! THEN B=0:RETURN
280 IF PEEK(SP)<>32 THEN GOSUB 310
290 IF B=1 THEN POKE SP,139
300 RETURN
310 POKE SP,136:FOR TM=1 TO 150:NEXT:POKE SP,138:FOR TM=1 TO 150:NEXT
320 POKE SP,149:FOR TM=1 TO 150:NEXT:POKE SP,153:FOR TM=1 TO 150:NEXT
330 POKE SP,32:POKE SP+128,46:POKE SP-128,46:POKE SP+1,46:POKE SP-1,46
340 FOR TM=1 TO 150:NEXT:POKE SP+128,32:POKE SP-128,32:POKE SP+1,32:POKE SP-1,32
350 B=0:T=TS+49:HT=1
360 IF CH=143 THEN SC=SC+100 ELSE IF CH=140 THEN SC=SC+50 ELSE SC=SC+20
370 PRINT CHR$(30):PRINT TAB(2);"     SCORE";SC;"  - POINTS";EN;"   HIGH SCORE";HS;:PRINT CHR$(30):POKE 61568!,150:RETURN
380 PRINT CHR$(26):FOR SU=61440! TO 61491!:POKE SU,150:NEXT
390 FOR SU=64384! TO 64435!:POKE SU,150:NEXT
400 FOR SU=61440! TO 64384! STEP 128:POKE SU,150:NEXT
410 FOR SU=61491! TO 64435! STEP 128:POKE SU,150:NEXT
420 P=64408!:POKE P,158:RETURN
430 IF SC>HS THEN HS=SC:GOSUB 1000
435 PRINT CHR$(26):PRINT"SCORE";SC;:PRINT"      HIGH SCORE";HS;"  ";HS$
437 PRINT"PLAY AGAIN";:INPUT AN$:IF AN$="Y" THEN 438 ELSE END
438 Z$=INKEY$:EN=0:SC=0:HT=1:PRINT CHR$(26):PRINT"PRESS <S> TO BEGIN"
439 IF INKEY$="S" THEN  30 ELSE 439
440 PRINT CHR$(26):PRINT"                      ICBM"
450 PRINT"THE OBJECT OF THIS GAME IS TO DESTROY THE SOVIET"
460 PRINT"SPY SHIPS PASSING OVER.  YOU ARE IN CONTROL OF THE"
470 PRINT"ICBM BASE.  TO MOVE THE BASE RIGHT OR LEFT PRESS"
480 PRINT"> OR < RESPECTIVELY.  TO FIRE PRESS <S>. SOME SPY"
490 PRINT"SHIPS ARE MORE DANGEROUS AND SO DESTROYING THEM IS"
500 PRINT"WORTH MORE POINTS.  EVERY SHIP WHICH ESCAPES YOUR"
510 PRINT"MISSLES BRINGS YOU CLOSER TO DESTRUCTION.  WHEN"
520 PRINT"A SPY SHIP ESCAPES YOU YOU RECIEVE NEGATIVE POINTS."
530 PRINT"WHEN YOUR NEGATIVE POINTS EXCEED 30 YOU WILL"
540 PRINT"BE REMOVED FROM YOUR COMMAND AND THE GAME WILL END."
550 PRINT:PRINT"                + POINTS     -POINTS"
560 PRINT"                   20           5"
570 PRINT:PRINT"                   50           3"
580 PRINT:PRINT"                  100           1"
590 PRINT:PRINT"GOOD LUCK. YOUR COUNTRY IS DEPENDING ON YOU."
600 POKE 63236!,141:POKE 63492!, 140:POKE 63748!, 143
610 PRINT"PRESS <S> TO BEGIN"
620 IF INKEY$="S" THEN RETURN ELSE 620
1000 PRINT CHR$(26):INPUT"YOU GOT HI SCORE, ENTER YOUR INITIALS";HS$
1010 OPEN "O", #1, "O1ICBM.HSC":WRITE #1,G1,I1$,HS,HS$,G3,I3$:CLOSE #1:RETURN
