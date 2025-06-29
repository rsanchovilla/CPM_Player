     rem This is the Check Number Sequencing Entry Program
     if end #1 then 2000
     open "b:chk" as 1
     read #1;n
     close 1
1030 PRINT "CURRENT CHECK NUMBER IS ";N
1040 PRINT:PRINT "PLEASE TYPE IN THE NEW CHECK SEQUENCE"
1050 PRINT "STARTING NUMBER."
1060 PRINT:PRINT "A ZERO VALUE WILL ALLOW THE MANUAL ENTRY OF"
1070 PRINT "NON-SEQUENTIAL CHECK NUMBERS."
1080 PRINT:INPUT N
1090 open "b:chk" as 1
     print #1;n
     close 1
     stop
2000 create "b:chk" as 1
     close 1
     goto 1040
