     rem This is Master8 the Periodic Maintenance Menu
%INCLUDE ALL.BAS
     RESTORE
1025 PRINT clear$:PRINT
1030 PRINT "*** PERIODIC MAINTENANCE MENU ***":PRINT
2000 PRINT "1 - DO MONTHLY FILE MAINTENANCE"
2010 PRINT
2020 PRINT "2 - DO QUARTERLY FILE MAINTENANCE"
2030 PRINT
2040 PRINT "3 - DO YEARLY FILE MAINTENANCE"
2050 PRINT
2060 PRINT "4 - FINISHED"
3000 PRINT
3010 INPUT Z
3020 IF Z<1 OR Z>4 THEN 1025
4000 ON Z GOTO 9000,9050,9100,9150
9000 CHAIN "MMAINT"
9050 CHAIN "QMAINT"
9100 CHAIN "YMAINT"
9150 print clear$:print:print "Replace disk #5 in drive A"
     print "Type return to continue."
     input line temp$
     initialize
     chain "bizmii"
9800 GOTO 1025
 drive A"
     print "Type return to continue."
     input line t