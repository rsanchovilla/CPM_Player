
10 REM **** TIMEGAIN ****  use with PORTVAL and CPINDEX
20 DIM C1(N),D1(N),G1(N),R(N)
30 T5=0:T6=0:T7=0:T8=0
40 FOR I=1 TO N
50 C1(I)=S(I)*P1(I)
70 DI(I)=V(I)-C1(I)
80 G1(I)=100*D1(I)/C1(I)
90 T5=T5+C1(I)
110 T7=T7+D1(I)
120 T8=100*T7/T5
130 NEXT I
140 FOR I=1 TO N
150 R(I)=100*V(I)/T2
160 T6=T6+R(I)
170 NEXT I
180 PRINT CHR$(12)
190 PRINT"'TIMEGAIN' Stock Value Change Over Time-New prices as of ";D1$
200 PRINT TAB(42)"Old prices as of ";D2$
210 PRINT
220 PRINT"                     Old   Total   New  Current"
230 PRINT"   Stock     Shares Price   Cost  Price  Value   %Port    Diff   %Gain"
240 PRINT
250 FOR I=1 TO N
260 PRINT USING"## \        \ #### ###.#  ######  ";I;A$(I);S(I);P1(I);C1(I);
270 PRINT USING"###.#  ######  ###.#   ######  ####.#";P(I);V(I);R(I);D1(I);G1(I)
280 NEXT I
290 PRINT"---------------------------------------------------------------------"
300 PRINT "Totals";
310 PRINT TAB(27)USING"######         ######  ";T5;T2;
320 PRINT USING"###.#   ######  ####.#";T6;T7;T8
330 PRINT
340 INPUT "Hard copy?--YES enter 1 (printer on!)--NO hit RETURN  ";J
350 IF J=1 THEN 370 ELSE 360
360 END
370 LPRINT"'TIMEGAIN' Stock Value Change Over Time-New prices as of ";D1$
380 LPRINT TAB(42)"Old prices as of ";D2$
390 LPRINT
400 LPRINT"                     Old   Total   New  Current"
410 LPRINT"   Stock     Shares Price   Cost  Price  Value   %Port    Diff   %Gain"
420 LPRINT
430 FOR I=1 TO N
440 LPRINT USING"## \        \ #### ###.#  ######  ";I;A$(I);S(I);P1(I);C1(I);
450 LPRINT USING"###.#  ######  ###.#   ######  ####.#";P(I);V(I);R(I);D1(I);G1(I)
460 NEXT I
470 LPRINT"*********************************************************************"
480 LPRINT "Totals";
490 LPRINT TAB(27)USING"######         ######  ";T5;T2;
500 LPRINT USING"###.#   ######  ####.#";T6;T7;T8
510 GOTO 360
s";
490 LPRINT TAB(27)USING"######         ######  ";T5;T2