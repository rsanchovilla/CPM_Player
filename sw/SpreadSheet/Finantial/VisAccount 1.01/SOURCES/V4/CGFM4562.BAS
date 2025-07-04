     rem This is the IRS Form 4652 - Depreciation Printer
%INCLUDE ALL.BAS
     dim n(2,20),k$(3,20)
     z5$="b:cg"
     RESTORE
1008 DIM H(9),S(9),T(4,9)
1009 PRINT clear$:PRINT
1090 U$="##,###,###"
1095 FOR Z=1 TO 104:A$=A$+"-":NEXT Z
1100 REM GET DATES ROUTINE
1145 Z9=0
1200 REM READ TAB VALUES ROUTINE
3000 REM READ NAME FILE SUBROUTINE
3005 a5=T%(12)
     for z=3 to 11:read n(1,z):next z
     data 24,24,24,17,2,5,14,20,20
3085 Z9=1:FOR Z=3 TO 11:K$(0,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):NEXT Z
3090 N$="":FOR Z=1 TO 20:N(1,Z)=0:NEXT Z
3125 REM ROUTINE TO ELIMINATE TRAILING BLANKS
     l8=1
3130 for I=3 TO 6
     l9=len(k$(0,i))
3140 FOR Z=l9 to l8 step -1
3150 IF MID$(K$(0,I),Z,1)<>" " THEN 3170
3160 NEXT Z
3170 Z$=""
3180 FOR Z0=1 TO Z
3190 Z$=Z$+MID$(K$(0,I),Z0,1)
3200 NEXT Z0
3210 K$(0,I)="":K$(0,I)=Z$
3220 NEXT I
6000 REM PROGRAM TO PRINT DEPRECIATION REPORT
6005 PRINT clear$:PRINT
6010 PRINT "PRINTING DEPRECIATION REPORT"
6030 T1=0:T2=0:T3=0:T4=0:P0=1
6035 X=1
6040 for z=4 to 8:read n(1,z):next z
     data 24,24,1,8,2
6200 open z5$ recl 256 as 1
6205 z3=(size(z5$)*block.size)/256
6210 FOR Z2=1 TO Z3
6215 read #1,z2;n(2,1),n(2,2),n(2,3),n$
6220 IF N(2,2)=0 THEN 6230
6225 NEXT Z2
6230 close 1
6235 Z2=Z2-1
6240 PRINT:PRINT "RECORDS TO BE PRINTED ";Z2
6245 PRINT:INPUT "TO PRINT REPORT, TYPE RETURN.";line temp$
     lprinter:P9=0
6300 open z5$ recl 256 as 1
6310 FOR Z1=1 TO Z2
6320 read #1,z1;N(2,1),N(2,2),N(2,3),N$,D1,D2,D3,D4,D5,D6,D7,D8,D9
6330 Z9=1:FOR Z=4 TO 8:K$(3,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):NEXT Z
6340 IF RIGHT$(K$(3,7),2)=RIGHT$(D$(6),2) AND D3>D8 THEN T3=T3+D3-D8
6350 NEXT Z1
6360 print TAB(7);K$(0,4);TAB(61);K$(0,10):P9=P9+1
6370 FOR Z=1 TO 5:print:NEXT Z:P9=P9+5
6380 print TAB(67);:print using u$;t3:P9=P9+1
     console
6390 PRINT clear$:PRINT
6395 PRINT "ENTER DEPRECIATION FROM ANY FORM 4832 (CLADR)."
6400 INPUT T9
     lprinter
6405 print TAB(67);:print using u$;t9:P9=P9+1
6410 FOR Z=1 TO 6:print:NEXT Z:P9=P9+6:T3=T3+T9
6500 FOR Z1=1 TO Z2
6510 read #1,z1;N(2,1),N(2,2),N(2,3),N$,D1,D2,D3,D4,D5,D6,D7,D8,D9
6520 Z9=1:FOR Z=4 TO 8:K$(3,Z)=MID$(N$,Z9,N(1,Z)):Z9=Z9+N(1,Z):NEXT Z
6530 print TAB(7);LEFT$(K$(3,4),15);TAB(24);K$(3,7);TAB(33);
6540 print using u$;d1;tab(44);d3;tab(56);:print k$(3,8);tab(61);
6550 print using "####";d4;tab(67);:print using u$;d8
6560 T1=T1+D1:T2=T2+D8:P9=P9+1
     console
6570 IF P9>38 THEN PRINT "INSERT ANOTHER SHEET AND ADVANCE TO FIRST DESC LINE"
6575 IF P9>38 THEN INPUT "TYPE RETURN TO CONTINUE ";line temp$
     lprinter
6580 NEXT Z1
6590 FOR Z=P9 TO 39:print:NEXT Z
6600 print using u$;tab(33);t1;tab(67);t2+t3
6995 GOTO 20000
20000 REM ROUTINE TO CLOSE FILES AND RETURN TO master16
     print chr$(12)
20005 close 1
20040 console
20050 CHAIN "master16"
 REM ROUTINE TO CLOSE FILES AND RETURN TO master16
     print chr$(12)
20005 close 1
20040 console
20050 C