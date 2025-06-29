
10 REM ****  CPINDEX  **** UNIVERSAL CHAIN/COMMON PROGRAM
20 DIM D1(N), F(N),V1(N),G1(N)
30 T5=0:T6=0:T7=0
40 INPUT"LATEST CONSUMER PRICE INDEX:  ";Z
50 INPUT"DATE OF LATEST CPI:  ";D3$
60 FOR I=1 TO N
70 F(I)=Z/Y(I)
80 V1(I)=F(I)*C(I)
90 D1(I)=V(I)-V1(I)
100 G1(I)=100*D1(I)/V1(I)
110 T5=T5+V1(I)
120 T7=T7+D1(I)
130 T6=100*T7/T5
140 NEXT I
150 PRINT CHR$(12)
160 PRINT"'CPINDEX' INFLATION PERFORMANCE COMPARISON-LATEST CPI: ";D3$;Z
170 PRINT TAB(37)"STOCK PRICES AS OF:  ";D1$
180 PRINT
190 PRINT"                              PURCH   CURRENT         THEO.  %VARIANCE"
200 PRINT"   STOCK      DATE      CPI    COST    VALUE   %GAIN   VALUE  FROM THEO."
210 PRINT
220 FOR I=1 TO N
230 PRINT USING"## \       \ \      \  ###.#  ##### ";I;A$(I);D$(I);Y(I);C(I);
240 PRINT USING"   #####  ####.# ######  ###.#";V(I);G(I);V1(I);G1(I)
250 NEXT I
260 PRINT"------------------------------------------------------------------"
270 PRINT "TOTALS"
280 PRINT TAB(30) USING"######   ######  ";T1;T2;
290 PRINT USING" ###.# ###### ####.#";T4;T5;T6
300 PRINT
310 INPUT "HARD COPY?--YES ENTER 1 (PRINTER ON!)--NO HIT RETURN  ",J
320 IF J=1 THEN 340 ELSE 330
330 END
340 LPRINT"'CPINDEX' Inflation Performance Comparison--Latest CPI: ";D3$;Z
350 LPRINT TAB(37)"Stock prices as of:  ";D1$
360 LPRINT
370 LPRINT"                              Purch   Current         Theo.   %Variance"
380 LPRINT"   Stock      Date      CPI    Cost    Value   %Gain  Value   from Theo."
390 LPRINT"--------------------------------------------------------------------"
395 LPRINT
400 FOR I=1 TO N
410 LPRINT USING"## \         \ \      \  ###.#  ##### ";I;A$(I);D$(I);Y(I);C(I);
420 LPRINT USING"   #####  ####.# ######  ###.#";V(I);G(I);V1(I);G1(I)
430 NEXT I
440 LPRINT"********************************************************************"
450 LPRINT "Totals";
460 LPRINT TAB(30) USING"######   ######  ";T1;T2;
470 LPRINT USING" ###.# ###### ####.#";T4;T5;T6
480 GOTO 330
