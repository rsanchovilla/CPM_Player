10 WIDTH 255
20 CLS$=CHR$(26):HI$=CHR$(2):LO$=CHR$(14):FL$=CHR$(6)
30 PRINT CLS$;TAB(16);"N U C L E A R   P O W E R   P L A N T"
40 REM by s. berggren, creative computing, dec 80
50 PRINT:PRINT "This program simulates the operation of a Nuclear Power Reactor."
60 PRINT "The object is to operate the plant at a maximum average power"
70 PRINT "output without causing a reactor meltdown."
80 PRINT:PRINT "The control rods adjust the amount of heat produced by the"
90 PRINT "reactor.  Primary coolant transfers this heat to the Heat Exchanger."
100 PRINT "Secondary coolant transfers this heat from the Exchanger to the"
110 PRINT "Turbine, where power is produced, and finally to the cooling tower."
120 PRINT "The emergency coolant is used to help shut down the reactor when"
130 PRINT "other systems fail.  Unlike other coolants, emergency coolant is not"
140 PRINT "recycled.":PRINT:PRINT "Please enter a ";:RANDOMIZE:PRINT CLS$
150 PRINT "The controls are operated by entering the desired control rod setting"
160 PRINT "and flow rates.  Use values from 0 to 100.  If no entry is made, the"
170 PRINT "values will not change.  Use the space bar to step to the desired"
180 PRINT "functions.  When the desired entries have been made, press Return"
190 PRINT "to advance to the next day."
200 PRINT "The reactor can be operated until a meltdown occurs or fuel is exhausted."
210 PRINT "The fuel will last for about 100 to 150 days.  When the fuel is"
220 PRINT "exhausted, your performance will be evaluated."
230 PRINT "If you want to repair damage or replace coolant, bring the reactor"
240 PRINT "temperature below 100 and shut off the coolant flows.  This will"
250 PRINT "cause a maintenance shutdown and all coolant will be replenished"
260 PRINT "and repairs made.":PRINT:PRINT "There are no safety devices."
270 PRINT:PRINT "Press any key to continue";INPUT$(1);CLS$
280 GOSUB 1030
290 RH=0
300 RL=0
310 DAY%=0
320 TT=0
330 DMGE%=0
340 A%=0:A1%=0:A2%=0
350 REM *** write report ***
360 DAY%=DAY%+1
370 PRINT CLS$;TAB(10);HI$;"G O N E   F I S S I O N   N U C L E A R   P O W E R   P L A N T";LO$
380 PRINT:PRINT "Status report - Day";DAY%:PRINT
390 PRINT "Warnings:"
400 IF RT%>800 THEN PRINT FL$;"REACTOR OVERHEATED";LO$:RD%=RD%+1-(RT%>850) -2*(RT%>950):PD%=PD%+1:ED%=ED%+1-(RT%>850)
410 IF XT%>500 THEN PRINT FL$;"HEAT EXCHANGER OVERHEATED";LO$:XD%=XD%+1-(XT%>600):PD%=PD%+1:SD%=SD%+1
420 IF GO%>2000 THEN PRINT FL$;"TURBINE OVERLOADED";LO$:TD%=TD%+1-(GO%>2500):SD%=SD%+1
430 IF CT%>300 THEN PRINT "COOLING TOWER OVERHEATED":SD%=SD%+1
440 IF GO%<1000 THEN PRINT "Power Output Low"
450 IF EV%<200 THEN PRINT "Emergency Coolant Low"
460 IF PV%<100 THEN PRINT "Primary Coolant Low":PD%=PD%+1
470 IF SV%<100 THEN PRINT "Secondary Coolant Low":SD%=SD%+1
480 PRINT:PRINT "Damage:"
490 IF RD%>3 THEN PRINT "REACTOR CORE DAMAGED"
500 IF PD%>4 THEN PRINT "PRIMARY COOLANT LEAK - ";PD%;"/Day":PV%=(PV%-PD%)*((PV%-PD%)>0)
510 IF SD%>4 THEN PRINT "SECONDARY COOLANT LEAK - ";SD%;"/Day":SV%=(SV%-SD%)*(-((SV%-SD%)>0))
520 IF ED%>2 THEN PRINT "EMERGENCY COOLANT LEAK - ";2*ED%;"/Day":EV%=(EV%-2*ED%)*(-((EV%-2*ED%)>0))
530 IF PB% THEN PRINT "PRIMARY COOLANT PUMP FAILURE - ";10*PD%*(-(PD%<10))-100*(PD%>=10);"%"
540 IF SB% THEN PRINT "SECONDARY COOLANT PUMP FAILURE - ";10*SD%*(-(SD%<10))-100*(SD%>=10);"%"
550 IF XB% THEN PRINT "HEAT EXCHANGER FAILURE"
560 IF GB% THEN PRINT "TURBINE FAILURE"
570 PRINT:IF RD%>5 THEN PRINT TAB(50);FL$;"M E L T D O W N !";LO$:GOTO 1100
580 PRINT "Indicators:"
590 PRINT "Reactor temperature (max. 800) ";RT%
600 PRINT "Heat Exchanger temperature (max. 500) ";XT%
610 PRINT "Cooling Tower temperature (max. 300) ";CT%
620 PRINT "Power output (max 2000kw) ";GO%;"kW";TAB(40);
630 KW%=TT/DAY%
640 PRINT "Average Power Output ";KW%;"kW/day"
650 PRINT "Control Rods: ";A%
660 PRINT "Coolant Levels:"
670 PRINT "Emergency Level:";EV%;" Flow:";EF%
680 PRINT "Primary   Level:";PV%;" Flow:";PF%
690 PRINT "Secondary Level:";SV%;" Flow:";SF%
700 IF (100-RL)<5 THEN PRINT:PRINT "Reactor fuel exhausted.":GOTO 1210
710 A2%=A1%:A1%=A%
720 LINE INPUT "New control rod setting? ";A$:IF LEN(A$)>0 THEN ZZZ%=VAL(A$):If ZZZ%>=0 AND ZZZ%<100 THEN A%=ZZZ%:ELSE GOTO 720
730 LINE INPUT "New emergency coolant flow? ";A$:IF LEN(A$)>0 Then ZZZ%=VAL(A$):IF ZZZ%>=0 AND ZZZ%<EV% THEN EF%=ZZZ%:ELSE GOTO 730
740 LINE INPUT "New primary coolant flow? ";A$:IF LEN(A$)>0 THEN ZZZ%=VAL(A$):If ZZZ%>=0 AND ZZZ%<PV% THEN PF%=ZZZ%:ELSE GOTO 740
750 LINE INPUT "New secondary coolant flow? ";A$:IF LEN(A$)>0 Then ZZZ%=VAL(A$):IF ZZZ%>=0 AND ZZZ%<SV% THEN SF%=ZZZ%:ELSE GOTO 750
760 IF PF%=0 AND SF%=0 AND RH<1 AND RT%<100 AND A%=0 THEN GOSUB 1030: PRINT CLS$;"Maintenance Shutdown - ";MD%;" days.": FOR ZZZ%=1 TO 10000:NEXT ZZZ%
770 REM *** damage assessment and operation calculations ***
780 EV%=EV%-EF%+2*ED%*(ED%>3)
790 PD%=PD%+(PF%>90)*(RND(1)>.95)
800 SD%=SD%+(SF%>90)*(RND(1)>.92)
810 PB%=PD%>5
820 SB%=SD%>5
830 IF PF%>(100-PD%*10) AND PB% THEN PF%=(100-PD%*10)*(-(100-PD%*10>0))
840 IF SF%>(100-SD%*10) AND SB% THEN SF%=(100-SD%*10)*(-(100-SD%*10>0))
850 RL=RL+RH/50
860 RH=(A%*30+A1%*60+A2%*10)/2500*(100-RL)
870 PH=PF%*(100*(-(PV%>100))+PV%*(-(PV%<=1000)))/350
880 EH=EF%/200*(RT%-25)
890 RT%=RT%+RH-EH-PH+5*(RT%>25)
900 RT%=25-(RT%-25)*(RT%>25)
910 XT%=((RT%-25)*PF%+(CT%-25)*SF%)/(PF%+SF%+1)+25
920 IF XB% THEN XT%=RT%*.8+5
930 SH=SF%*(100*(-(PV%>100))+PV%*(-(PV%<=100)))/350*(XT%-CT%)
940 IF XB% THEN SH=SH*.2
950 GO%=SH/XT%*(XT%-CT%)*2/3
960 IF GO%>2600 THEN GO%=2600
970 IF GB% THEN GO%=0
980 CT%=25+((XT%-25)*(SH-GO%)/(SH+1)*.75)
990 IF CT%<25 THEN CT%=25
1000 IF NOT XB% THEN XB%=(XD%>2) AND (RND(1)>.9)
1010 IF NOT GB% THEN GB%=(GD%>4) AND (RND(1)>.9)
1020 TT=TT+GO%:GOTO 350
1030 REM *** maintenance repair subroutine ***
1040 EV%=300:PV%=120:SV%=120:RT%=25:XT%=25:CT%=25
1050 DMGE%=DMGE%+2*RD%+ED%+PD%+XD%+SD%+GD%
1060 MD%=5+3*(10*(-(RD%>3))-(ED%>3)-(PD%>3)-(SD%>3)-2*PB%-2*SB%-3*XB%-3*GB%)
1070 DAY%=DAY%+MD%
1080 RD%=0:ED%=0:PD%=0:XD%=0:GD%=0:SB%=0:XB%=0:GB%=0:EF%=0:PF%=0:SF%=0:GO%=0
1085 SD%=0
1090 RETURN
1100 REM *** meltdown ending ***
1110 IF RD%>6 THEN 1160
1120 PRINT "The reactor core has been destroyed by uncontrolled thermal runaway."
1130 PRINT "However, the containment building has not ruptured.  Initiate your"
1140 PRINT "evacuation plan."
1150 GOTO 1400
1160 PRINT "The reactor core has melted down and produced a steam explosion.  The"
1170 PRINT "containment building has ruptured; radioactive gases and debris have"
1180 PRINT "escaped.  Initiate evacuation  and radiation cleanup plans; get"
1190 PRINT "medical assistance."
1200 GOTO 1400
1210 REM *** evaluation of results ***
1220 PRINT:PRINT "Over a period of ";DAY%;" days, you have produced an average power"
1230 PRINT "output of ";KW%;"kilowatts per day.  Your average power production"
1240 PRINT "rate is ";:AKW%=1-(KW%>1000)-(KW%>1200)-(KW%>1500)-(KW%>1800)
1250 ON AKW% GOTO 1260,1270,1280,1290,1300
1260 PRINT "Horrible!  Find a less demanding job!":GOTO 1310
1270 PRINT "far below your area's power needs.":GOTO 1310
1280 PRINT "adequate.  You could do better.":GOTO 1310
1290 PRINT "Excellent!  Power costs in your area will remain the same.":GoTo 1310
1300 PRINT "Near the maximum!  Power costs in your area will drop!":GOTO 1310
1310 REM *** damage evaluation ***
1320 PRINT:GOSUB 1030
1330 D%=1-(DMGE%>10)-(DMGE%>20)-(DMGE%>30)
1340 PRINT "The equipment damage sustained during this period was ";
1350 ON D% GOTO 1360,1370,1380,1390
1360 PRINT "very light.":GOTO 1400
1370 PRINT "moderate.":GOTO 1400
1380 PRINT "heavy.":GOTO 1400
1390 PRINT "severe!"
1400 REM *** end ***
1410 INPUT "Would you like to try again";A$:IF A$="Y" OR A$="y" THEN RUN
1420 REM Statement deleted: RUN "I"
1430 END
