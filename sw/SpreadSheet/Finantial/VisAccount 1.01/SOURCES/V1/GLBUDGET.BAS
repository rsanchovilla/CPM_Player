     rem This is the General Ledger Budget Analysis Printer
%INCLUDE ALL.BAS
     dim n(2,12),K$(2,10),h(9),s(9),t(4,9)
     RESTORE
1010 L$="##,###,###":U$="###.##"
1050 PRINT clear$:PRINT
1075 Q$="E X P E N S E  B U D G E T  A N A L Y S I S"
3000 REM READ NAME FILE SUBROUTINE
3005 a5=t%(12)
3080 Z=24:Z9=1
3090 FOR Z0=1 TO 4
3100 K$(0,Z0)=MID$(N$,Z9,Z)
3110 Z9=Z9+Z
3120 NEXT Z0
3125 REM ROUTINE TO ELIMINATE TRAILING BLANKS
     l8=1
3130 FOR I=1 TO 4
     l9=len(k$(0,i))
3140 for z=l9 to l8 step -1
3150 IF MID$(K$(0,I),Z,1)<>" " THEN 3170
3160 NEXT Z
3170 Z$=""
3180 FOR Z0=1 TO Z
3190 Z$=Z$+MID$(K$(0,I),Z0,1)
3200 NEXT Z0
3210 K$(0,I)="":K$(0,I)=Z$
3220 NEXT I
6000 REM PRINT EXPENSE BUDGET ANALYSIS
6005 PRINT clear$:PRINT
6010 PRINT "PRINTING EXPENSE BUDGET ANALYSIS"
6012 LPRINTER 
6015 FOR Z=0 TO 9
6020 H(Z)=0:S(Z)=0:T(0,Z)=0:T(1,Z)=0:T(2,Z)=0:T(3,Z)=0:A(Z)=0
6025 NEXT Z
6030 T1=0:T2=0:T3=0:T4=0
6105 open "b:gl" recl 138 as 1
	N(2,2)=10
6200 GOSUB 9600
6255 IF N(2,2)=0 THEN 6404
6350 GOSUB 15000
6404 IF N(2,2)=0 THEN FOR Z=1 TO 56-P9:print:NEXT Z:GOSUB 9800
6405 IF N(2,2)=0 THEN 20000
6980 IF P9>56 THEN GOSUB 9700
6995 GOTO 6255
9600 REM PRINT PAGE HEADING SUBROUTINE
9605	P0=P0+1
9610 print :P9=P9+1
9615 print:P9=P9+1
9616 print TAB((t%(1)-LEN(Q$))/2);Q$:P9=P9+1
9617 print:P9=P9+1
9620 FOR Z=2 TO 4
9625 print TAB((t%(1)-LEN(K$(0,Z)))/2);K$(0,Z):P9=P9+1
9630 NEXT Z
9635 print:P9=P9+1
9640 print TAB(t%(10));"FOR PERIOD ENDING ";D$(2);TAB(t%(11));"PAGE #";P0
9642 P9=P9+1
9645 print :P9=P9+1
9650 print:print TAB(36);"ACTUAL";TAB(46);"BUDGETED";TAB(56);
9655 print "DIFFERENCE";TAB(69);"PERCENTAGE":print:P9=P9+3
9670 RETURN
9700 REM REPORT CONTINUED SUBROUTINE
9705 print 
9710 print "REPORT CONTINUED ON NEXT PAGE"
9715 print 
9720 print CHR$(12):P9=0
9725	GOSUB 9600
9740 RETURN
9800 REM END OF REPORT ROUTINE
9810 print 
9820 print "END OF REPORT"
9830 print 
9840 print CHR$(12)
9845 FOR Z=1 TO 100:NEXT Z:print CHR$(12)
9850 RETURN
15000 REM GET ACCOUNTS IN SUBHEAD RANGE AND PRINT
15005 a(9)=a(9)+1
15006 if p9>51 then gosub 9700
15010 read #1,a(9);n(2,1),n(2,2),K$(1,3),n(2,4),n(2,5),n(2,6),\
	   n(2,7),n(2,8),n(2,9),n(2,10)
15105 IF N(2,2)=0 THEN 15800
15110 IF N(2,10)=0 THEN 15005
15115 print K$(1,3);TAB(32);:print using L$;n(2,4);TAB(44);
      print using L$;n(2,10);
15120 print TAB(56);:print using L$;n(2,4)-n(2,10);TAB(72);
15125 print using U$;(n(2,4)/n(2,10))*100;
	print "%":P9=P9+1
15130 T1=T1+N(2,4):T2=T2+N(2,10)
15135 GOTO 15005
15800 print:print:
15801 IF T1=0 AND T2=0 THEN PRINT "NO BUDGET INFORMATION ON FILE"
15802 IF T1=0 AND T2=0 THEN 15995
15805 print "TOTALS";TAB(32);:print using L$;T1;TAB(44);
      :print using L$;T2;TAB(56);
15810 print using L$;T2-T1;TAB(72);:print using U$;((T1/T2)*100);
	print "%"
15815 P9=P9+3
15995 RETURN
20000 REM ROUTINE TO CLOSE FILES AND RETURN TO MASTER1
20005 close 1
20010 CONSOLE  
20050 chain "master1"

15995 RETURN
20000 REM ROUTINE TO CLOSE FILES AND RETURN TO MASTER1