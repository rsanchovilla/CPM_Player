     rem This is the General Ledger Chart of Accounts Printer
%INCLUDE ALL.BAS
     dim n(2,12),k$(2,10),h(9),s(9),t(4,9)
     RESTORE
1025 PRINT clear$:PRINT
1045 Q$="G E N E R A L  L E D G E R  C H A R T  O F  A C C O U N T S"
3005 a5=t%(12)
3080 Z=24:Z9=1
3090 FOR Z0=1 TO 4
3100 K$(0,Z0)=MID$(N$,Z9,Z)
3110 Z9=Z9+Z
3120 NEXT Z0
3125 rem ROUTINE TO ELIMINATE TRAILING BLANKS
     l8=1
3130 FOR I=1 TO 4
     l9=len(k$(0,i))
3140 FOR Z=l9 TO l8 STEP -1
3150 IF MID$(K$(0,I),Z,1)<>" " THEN 3170
3160 NEXT Z
3170 Z$=""
3180 FOR Z0=1 TO Z
3190 Z$=Z$+MID$(K$(0,I),Z0,1)
3200 NEXT Z0
3210 K$(0,I)="":K$(0,I)=Z$
3220 NEXT I
6000 rem PRINT CHART OF ACCOUNTS
6005 PRINT clear$:PRINT
6010 PRINT "PRINTING CHART OF ACCOUNTS"
6015 FOR Z=0 TO 9
6020 H(Z)=0:S(Z)=0:T(0,Z)=0:T(1,Z)=0:T(2,Z)=0:T(3,Z)=0:A(Z)=0
6025 NEXT Z
     lprinter
     open "b:gl" recl 138 as 1
     open "b:glh" recl 150 as 2
     open "b:gls" recl 150 as 3
     p9=0
6200 GOSUB 9600
6250 GOSUB 10000
6300 GOSUB 11000
6350 GOSUB 15000
6400 rem DO PARTIAL TOTALS OR TOTALS AND TEST
6410 print TAB(t%(6));"TOTAL "+mid$(s$,3,28):P9=P9+1
6415 IF P9>51 THEN GOSUB 9700
6420 IF S(1)< H(1) THEN 6300
6430 IF S(1)=H(1) THEN GOSUB 12000
6435 IF N(2,2)=0 THEN FOR Z=1 TO 51-P9:print:next z:GOSUB 9800 
6440 IF N(2,2)=0 THEN 20000
6450 GOTO 6250
9600 rem PRINT PAGE HEADING SUBROUTINE
9605 P0=1
9610 print
9615 print:P9=P9+2
9616 print TAB((t%(1)-LEN(Q$))/2);Q$:print:P9=P9+2
9620 FOR Z=2 TO 3
9625 print TAB((t%(1)-LEN(K$(0,Z)))/2);K$(0,Z):P9=P9+1
9630 NEXT Z
9631 PRINT TAB((T%(1)-LEN(K$(0,4)))/2);LEFT$(K$(0,4),17);
9632 PRINT MID$(K$(0,4),18,2);"  ";MID$(K$(0,4),20,5)
9635 print:P9=P9+1
9640 print TAB(t%(10));D$(1);TAB(t%(11));"PAGE #";P0:P9=P9+1
9645 print
9650 print:P9=P9+2
9655 RETURN
9700 rem REPORT CONTINUED SUBROUTINE
     print
     print "report continues on next page"
     print
9720 print chr$(12):P9=0
9725 P0=P0+1
9730 FOR Z=1 TO 3:print:P9=P9+1:next z:print TAB(t%(11));"PAGE #";P0:P9=P9+1
9735 print:P9=P9+1
9740 RETURN
9800 rem END OF REPORT ROUTINE
     print
     print "end of report"
     print
9840 print chr$(12)
9845 FOR Z=1 TO 100:NEXT Z:print chr$(12)
9850 RETURN
10000 rem GET HEADING LINE AND PRINT
10005 H(9)=H(9)+1
10006 IF P9>51 THEN GOSUB 9700
     read #2,h(9);n(2,1),n(2,2),h$,h(0),h(1),h(2),h(3),\
	  h(4),h(5),h(6),h(7)
10015 print TAB(t%(4));mid$(h$,3,28):P9=P9+1
10995 RETURN
11000 rem GET SUBHEADING LINE AND PRINT
11005 S(9)=S(9)+1
11006 IF P9>51 THEN GOSUB 9700
      read #3,s(9);n(2,1),n(2,2),s$,s(0),s(1),s(2),s(3),\
	   s(4),s(5),s(6),s(7)
11015 print TAB(t%(5));mid$(s$,3,28):P9=P9+1
11995 RETURN
12000 rem PRINT FINAL TOTAL LINE
12010 print:P9=P9+1
12020 print TAB(t%(8));"TOTAL "+mid$(h$,3,28):P9=P9+1
12025 IF P9>51 THEN GOSUB 9700
12030 print :P9=P9+1
12040 RETURN
15000 rem GET ACCOUNTS IN SUBHEAD RANGE AND PRINT
15005 A(9)=A(9)+1
15010 IF P9>51 THEN GOSUB 9700
      read #1,a(9);n(2,1),n(2,2),k$(0,3),n(2,4),n(2,5),n(2,6),\
	   n(2,7),n(2,8),n(2,9),n(2,10)
15105 IF N(2,2)=0 THEN 15995
15106 IF N(2,2)<=S(1) THEN 15110  
15107 A(9)=A(9)-1 
15108 GOTO 15995 
15110 print A(9);TAB(6);N(2,2);K$(0,3):P9=P9+1
15111 GOTO 15005
15995 RETURN
20000 rem ROUTINE TO CLOSE FILES AND RETURN TO BIZMII
20010 CLOSE 1
20015 CLOSE 2
20040 CLOSE 3
     console
20050 chain "master1"
ROUTINE TO CLOSE FILES AND RETURN TO BIZMII
20010 CLOSE 1
20