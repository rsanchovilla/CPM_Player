
10 REM ****  "PORTVAL"  revised 29 Jan 81 for double chain
20 CLEAR
30 N=5
40 IF N<=10 GOTO 60
50 DIM A$(N),D$(N),S(N),C(N),P(N),P1(N),V(N),D(N),G(N),Y(I)
60 RESTORE
70 FOR I=1 TO N
80 READ A$(I),D$(I),S(I),C(I),Y(I)
90 NEXT I
100 DATA Carlisle, 29Sep80,160,9991,251.7
110 DATA Crown Cork,18Mar71,100,2231,119.8
120 DATA Humana," 7Mar77",900,4900,178.2
130 DATA Kysor,18Dec69,200,2758,112.9
140 DATA Travelers," 2Dec68",100,3511,106.4
150 FOR I=1 TO N
160 READ P(I)
170 NEXT I
180 READ D1$    'date of "new" prices--type w/o commas as item n+1
190 FOR I=1 TO N
200 READ P1(I)       'To update, input new prices just ABOVE line 230;
210 NEXT I           'keep old prices on 230,delete 240,then RENUM
220 READ D2$    'date of "old" prices
230 DATA 85,32,74.8,10.4,39.3,21 Jan 81
240 DATA 84.0,28.4,71.4,10.6,38.9,30 Dec 80
250 FOR I=1 TO N
260 V(I)=S(I)*P(I)
270 D(I)=V(I)-C(I)
280 G(I)=100*D(I)/C(I)
290 T1=T1+C(I)
300 T2=T2+V(I)
310 T3=T3+D(I)
320 T4=100*T3/T1
330 NEXT I
340 PRINT "Complete this run before chaining TIMEGAIN or CPINDEX"
350 INPUT"To run TIMEGAIN enter 1; CPINDEX enter 2; NEITHER hit RETURN  ";W
360 IF W=1 THEN 370 ELSE 380
370 CHAIN "TIMEGAIN",20,ALL
380 IF W=2 THEN 390 ELSE 400
390 CHAIN "CPINDEX",20,ALL
400 PRINT CHR$(12)       'clear screen
410 PRINT"'PORTVAL'        Portfolio Valuation      prices as of ";D1$
420 PRINT
430 PRINT"    Stock        Date  Shares Cost  Price Value    Diff   %Gain"
440 PRINT
450 FOR I=1 TO N
460 PRINT USING"##  ";I;
470 PRINT USING"\        \ ";A$(I);
480 PRINT USING"\     \  ";D$(I);
490 PRINT USING"###  ";S(I);
500 PRINT USING"#####  ";C(I);
510 PRINT USING"##.#   ";P(I);
520 PRINT USING"#####   ";V(I);
530 PRINT USING"#####  ";D(I);
540 PRINT USING"####.#";G(I)
550 NEXT I
560 PRINT"****************************************************************"
570 PRINT "Totals";
580 PRINT TAB(28)USING"######        ######   ";T1;T2;
590 PRINT USING"#####   ###.#";T3;T4
600 PRINT
610 INPUT "Hard copy?--YES enter 1 (printer on!)--NO hit RETURN  ";J
620 IF J=1 THEN 650 ELSE 640
630 GOTO 650
640 END
650 LPRINT "'PORTVAL'      Portfolio Valuation       prices as of ";D1$
660 LPRINT
670 LPRINT"   Stock         Date  Shares Cost  Price  Value    Diff   %Gain"
680 LPRINT"----------------------------------------------------------------"
685 LPRINT
690 FOR I=1 TO N
700 LPRINT USING"## ";I;
710 LPRINT USING"\        \  ";A$(I);
720 LPRINT USING"\     \  ";D$(I);
730 LPRINT USING"###  ";S(I);
740 LPRINT USING"#####  ";C(I);
750 LPRINT USING"##.#   ";P(I);
760 LPRINT USING"#####   ";V(I);
770 LPRINT USING"#####  ";D(I);
780 LPRINT USING"####.#";G(I)
790 NEXT I
800 LPRINT"****************************************************************"
810 LPRINT"Totals";
820 LPRINT TAB(28)USING"######        ######  ";T1;T2;
830 LPRINT USING" #####   ###.#";T3;T4
840 GOTO 640
LPRINT"Totals";
820 LPRINT TAB(28