1 WIDTH 240
9 DEF FNCURSOR$(C,R)=CHR$(27)+"Y"+CHR$(31+C)+CHR$(31+R)
10661 PRINT CHR$(27)+"E";FNCURSOR$(3,1)
10662 A$="*              Microcomputer Games presents...... ":GOSUB 10682
10663 PRINT:PRINT:
10664 A$="/----   |                 |             ":GOSUB 10682
10665 A$="|     --+--               |  /          ":GOSUB 10682
10666 A$="\---\   |   /---\  /----  |-<    /----  ":GOSUB 10682
10667 A$="    |   |   |   |  |      |  \   \---\  ":GOSUB 10682
10668 A$="----/   |   \---/  \----  |   |  ----/  ":GOSUB 10682 
10669 A$="                                        ":GOSUB 10682
10670 A$="*                      AND              ":GOSUB 10682
10671 A$="                                        ":GOSUB 10682
10672 A$="                       +---\                     |        ":GOSUB 10682
10673 A$="                       |   |                     |        ":GOSUB 10682
10674 A$="                       +---+\  /---\  +---\  /---+  /---- ":GOSUB 10682
10675 A$="                       |    |  |   |  |   |  |   |  \---\ ":GOSUB 10682
10677 A$="                       +----/  \---/  |   |  \---|  ----/ ":GOSUB 10682
10678 A$="                                                          ":GOSUB 10682  
10679 A$="*Computer Program and Audio-Visual Display Copyrighted 1983. ":GOSUB 10682
10680 A$="*   All Rights Reserved.  The Avalon Hill Game Company ":GOSUB 10682
10681 FOR I=1 TO 2000 : NEXT I :GOTO 10694
10682 IF LEFT$(A$,1)="*" THEN PRINT TAB(10);RIGHT$(A$,LEN(A$)-1):RETURN
10683 E$=CHR$(27):PRINT TAB(10);:FOR I=1 TO LEN(A$):B$=MID$(A$,I,1) 
10684 IF B$<>"" THEN PRINT B$;:GOTO 10693
10693 NEXT I:PRINT:RETURN
10694 RUN "BONDS"
