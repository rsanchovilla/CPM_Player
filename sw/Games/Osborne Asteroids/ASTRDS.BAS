5 OUT 0,65
10 VIDEO=49152!:SCNND=52222!
20 SHPLOC=VIDEO+1320:DEF FNL(N)=SHPLOC+5*AD(INT(RND*7))
25 LSTLOC=SHPLOC:WRAP=3072:MISLOC=VIDEO+100
30 DIM D(8),A(8),AD(8),L(8)
40 FOR T=0 TO 7:READ D(T):NEXT T
45 FOR T=0 TO 7:READ AD(T):NEXT T
50 LT$=CHR$(8):RT$=CHR$(12):FWD$=CHR$(27):PRINT CHR$(26)
60 FOR N= 0 TO 7:A(N)=FNL(N):L(N)=A(N):NEXT N
70 PRINT"******* PRESS ESC FOR INSTRUCTIONS *********"
80 K$=INKEY$:IF K$=""THEN 80
90 IF K$=CHR$(27) THEN GOSUB 1000
98 PRINT CHR$(26);
99 REM ****** CHECK KEYBOARD ********
100 K$=INKEY$
110 IF K$=RT$ THEN SV=SV+1:IF SV>7 THEN SV=0
120 IF K$=LT$ THEN SV=SV-1:IF SV<0 THEN SV=7
130 IF MD=0 AND K$=" " THEN MD=D(SV):MISLOC=SHPLOC+D(SV):NT=1:PRINT CHR$(30):PRINT"          "
140 IF D=0 THEN IF K$=FWD$ THEN D=D(SV):GOTO 200
150 IF K$=FWD$ THEN D=0
199 REM ********* MOVE SHIP *********
200 SHPLOC=SHPLOC+D
205 IF MD THEN MD=D(SV)
210 IF SHPLOC>SCNND OR SHPLOC<VIDEO THEN SHPLOC=SHPLOC-SGN(D)*WRAP
220 IF PEEK(SHPLOC) =8 THEN 500
270 POKE LSTLOC,32:POKE SHPLOC,SV
280 LSTLOC=SHPLOC
299 REM ********* MOVE ASTEROID *******
300 N=N+1:IF N>7 THEN N=0
310 A(N)=A(N)+AD(N)
320 IF A(N)<VIDEO OR A(N)>SCNND THEN A(N)=FNL(N)
322 IF PEEK(A(N))=9 THEN 600
325 IF PEEK(A(N)) <8 THEN 500
330 POKE L(N),32:POKE A(N),8
340 L(N)=A(N) 
350 IF NT<>0 THEN MISLOC=MISLOC+MD:NT=NT+1:IF PEEK(MISLOC)<9 THEN 600
355 IF MISLOC <VIDEO OR MISLOC>SCNND THEN NT=31
360 IF NT>30 THEN MISLOC=VIDEO+100:NT=0:MD=0:PRINT CHR$(30):PRINT"TORP READY"
380 POKE LSTMIS,32:POKE MISLOC,9
390 LSTMIS=MISLOC
395 IF N/2=INT(N/2) THEN 100
400 GOTO 300
499 REM ******** EXPLOSION *********
500 FOR T=0 TO 8
510 FOR D=0 TO 7
520 E=SHPLOC+T*D(D)
530 IF E> VIDEO AND E<SCNND THEN POKE E,46
540 NEXT D
550 NEXT T
560 PRINT"******** YOU BLEW IT BUSTER ****** - PRESS (Y) TO PLAY ANOTHER GAME"
570 IF INKEY$="Y" THEN RUN ELSE GOTO 570
600 T=-1:MD=0:PRINT CHR$(30):PRINT"TORP READY"
605 IF MISLOC=SHPLOC THEN 500
620 T=T+1:IF MISLOC=A(T) THEN SCRE=SCRE+100:PRINT CHR$(30);"SCORE=";SCRE:A(T)=FNL(T):NT=0:GOTO 660
630 IF T<8 THEN 620
650 GOTO 100
660 EL=MISLOC:FOR T=0 TO 3:FOR ED=0 TO 7:E=MISLOC+D(ED)
665 POKE EL,32:IF E>VIDEO AND E<SCNND THEN POKE E,42:EL=E
670 NEXT ED:NEXT T:POKE EL,32:MISLOC=VIDEO+100:GOTO 100
1000 PRINT CHR$(26);
1010 PRINT"                            A S T E R O I D S"
1015 PRINT:PRINT"                            by Hamilton Davies"
1020 PRINT:PRINT:PRINT" LT ARROW = rotate left"
1025 PRINT" RT ARROW = rotate right"
1030 PRINT" ESC KEY = start/stop"
1035 PRINT" SPACEBAR = fire torpedo"
1040 PRINT:PRINT:PRINT:PRINT:PRINT"          Blast the asteroids until you're blown to smithereenies!!!"
1050 PRINT:PRINT:PRINT"     *** press any key to begin ***"
1060 IF INKEY$="" THEN 1060
1070 PRINT CHR$(26)
1100 RETURN
9999 REM ******* SHIP DIRECTION DATA *********
10000 DATA 1,129,128,127,-1,-129,-128,-127
10009 REM ****** ASTEROID DIRECTION DATA *****
10010 DATA 126,127,129,130,-126,-127,-129,-130
129,128,127,-1,-129,-128,-127
10009 REM ****** ASTEROID DIRECTION DATA *****
10010 DATA 126,127,129,130,-126,-127,