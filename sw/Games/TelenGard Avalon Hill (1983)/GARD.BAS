105 DC$=CHR$(27)+"Y":CO=32:CL$=CHR$(27)+"E":CH$=CHR$(27)+"H": REM ESC Y = cursor pos, ESC E = cls, ESC H = home
106 CW$=CHR$(27)+") "+CHR$(27)+"(": REM ESC ) ESC ( = set/reset reverse video VT52
107 HD$="-":VD$="|":CD$=CHR$(27)+"B":CB$=CHR$(8):GOTO 1000: REM ESC B = cursor down, chr(8)= cursor back
200 PRINT CHR$(13);DC$;CHR$(CO+Y);CHR$(CO+X);:RETURN
1000 I=0:J=0:L=0:K=0:C=0:DS=-1:DS=0
1002 REM randomize
1005 DEF FNUP(H)=H AND 3
1007 DEF FNLF(H)=INT(H/4) AND 3
1008 DEF FNR(H)=INT(RND(1)*H+1)
1009 DEF FNS(H)=INT(H/256)
1010 DEF FNRD(I)=I-INT(I/10)*10+1
1015 S$="STRENGTH    INTELLIGENCEWISDOM      CONSTITUTIONDEXTERITY   CHRISMA     "
1020 MO$="GNOLL   KOBOLD  SKELETONHOBBIT  ZOMBIE  ORC     FIGHTER MUMMY   ELF     GHOUL   DWARF   TROLL   WRAITH  OGRE    MINOTAURGIANT   SPECTER VAMPIRE DEMON   DRAGON  "
1035 T$="REFUSESILVERGOLD  GEMS  JEWELS"
1040 CM$="WXADSHQPC82465H"+CHR$(20)+" ."+CHR$(19)+CHR$(18)+CHR$(8)+CHR$(16):C1$="FCE&"
1100 DIM P(3,3),ST(5),SF(11),MI$(10),MA$(10),I(10),SP$(36),B(4)
1103 DIM FM(20),FL(20),FH(20):XO=1.6915:YO=1.4278:ZO=1.2462:W0=4694
1104 DIM IN$(10,3)
1105 MI$(1)="SWORD":MA$(1)=MI$(1)
1110 MI$(2)="ARMOR":MA$(2)=MI$(2)
1115 MI$(3)="SHIELD":MA$(3)=MI$(3)
1120 MI$(4)="ELVEN CLOAK":MA$(4)="ELVN CLK"
1125 MI$(5)="ELVEN BOOTS":MA$(5)="ELVN BTS"
1130 MI$(6)="RING OF REGENERATION":MA$(6)="RING REG"
1135 MI$(7)="RING OF PROTECTION":MA$(7)="RING PROT"
1140 MI$(8)="SCROLL OF RESCUE":MA$(8)="SCRL RESC"
1145 MI$(9)="POTION OF HEALING":MA$(9)="POT HEAL"
1150 MI$(10)="POTION OF STRENGTH":MA$(10)="POT STRG"
1155 B$="RED   YELLOWGREEN BLUE"
1160 FOR I=1 TO 36:READ SP$(I):NEXT I:FOR I=1 TO 20:FM(I)=0:NEXT I
1161 FOR I=1 TO 3:FOR K=1 TO 10:READ IN$(K,I):NEXT K,I
1162 DATA MAGIC MISSILE,SLEEP,CURE LIGHT WOUNDS,LIGHT,TURN UNDEAD,PROTECTION FROM EVIL
1164 DATA WEB,LEVITATE,CAUSE LIGHT WOUNDS,DETECT TRAPS,CHARM,STRENGTH
1166 DATA LIGHTNING BOLT,CURE SERIOUS WOUNDS,CONTINUAL LIGHT,INVISIBILITY
1167 DATA HOLD MONSTER,PHANTASMAL FORCES
1168 DATA PASS WALL,FIREBALL,CAUSE SERIOUS WOUND,FLESH TO STONE,FEAR
1169 DATA FINGER OF DEATH
1170 DATA TELEPORT,ASTRAL WALK,POWER WORD KILL,ICE STORM,WALL OF FIRE,PLAGUE
1171 DATA TIME STOP,RAISE DEAD,HOLY SYMBOL,WORD OF RECALL,RESTORATION
1172 DATA PRISMATIC WALL
1173 DATA SALTY,BOLD,LOUD,OLD,GOODLY,WORTHY,LOFTY,FINE,ROCKY,AGED
1174 DATA ROAD,EYE,TOOTH,DRAGON,MUG,DEMON,WHARF,BRIDGE,MEADE,ALE
1175 DATA TAVERN,ALEHOUSE,CELLAR,CLUB,INN,HOUSE,INN,LODGE,MEADHALL,RESTHOUSE
1190 GOSUB  32000:REM IF DS THEN SYS31754
1212 PRINT
1213 PRINT"  WOULD YOU LIKE TO:":PRINT"   (S)TART A NEW CHARACTER OR"
1214 PRINT"   (R)EAD IN AN OLD ONE?";
1215 GOSUB 16000:IF C$="&" THEN 1215
1216 IF C$<>"R" THEN PRINT"START";:GOSUB 19000:GOTO 1400
1217 PRINT"READ";:PRINT CHR$(27)+"E":LINE INPUT "YOUR NAME NOBLE SIR? ";NM$:ON ERROR GOTO 1300:OPEN"I",#1,NM$+".PLR":INPUT#1,NM$:PRINT NM$" FOUND"
1218 INPUT#1,VS:IF VS<4.12 THEN PRINT"INCORECT VERSION CHARACTER":GOSUB 19000:CLOSE 1:GOTO 1191
1220 FOR I=0 TO 5:INPUT#1,ST(I):NEXT I
1230 INPUT#1,LV:INPUT#1,GD:INPUT#1,TG:INPUT#1,EX:INPUT#1,CH:INPUT#1,HP
1240 INPUT#1,CX:INPUT#1,CY:INPUT#1,CZ:INPUT#1,SU:INPUT#1,CS
1250 FOR I=1 TO 10:INPUT#1,I(I):INPUT#1,SF(I):NEXT I:IF VS>4.13 THEN INPUT#1,SF(11)
1260 FOR I=1 TO 20:INPUT#1,FM(I):INPUT#1,FL(I):INPUT#1,FH(I):NEXT I
1265 GOSUB 19800:IF VS>4.14 THEN FOR Q=1 TO 4:INPUT#1,B(Q):NEXT Q
1285 IF CZ=0 THEN CZ=1
1286 IF CZ<0 THEN PRINT"THIS CHARACTER IS NOT IN THE DUNGEON!":GOSUB 19000:CLOSE 1:GOTO 1191
1290 PRINT NM$;" READ":CLOSE 1
1291 IF LEFT$(NM$,2)<>"SV" THEN KILL NM$+".PLR"
1292 ON ERROR GOTO 0: IF DS THEN REM SYS31754
1295 GOSUB 19000:PRINT CL$;:GOSUB 20300:GOSUB 30025:SY=1:GOTO 2000
1300 RESUME 1305
1305 ON ERROR GOTO 0:PRINT"Cannot read that character":GOSUB 19000:CLOSE 1:GOTO 1191
1400 PRINT CL$;"<RET> TO USE STATS"
1500 FOR I=0 TO 5:Q=0:FOR Q1=1 TO 3:Q=Q+INT(RND(1)*6+1):NEXT Q1:ST(I)=Q
1510 PRINT MID$(S$,I*12+1,12),STR$(ST(I));"  ":NEXT I
1515 GOSUB 16000:IF C$<>CHR$(13) THEN 1400
1520 HP=ST(3):CH=HP:GD=0:TG=0:CZ=1:LV=1:FOR I=1 TO 10:I(I)=0:SF(I)=0:NEXT I:SF(11)=0
1525 GOSUB 19800
1600 CX=25:CY=13:EX=0:SU=1:CS=1:PRINT CL$;"YOUR NAME, NOBLE SIRE? ";
1602 GOSUB 16200:NM$=D$
1610 PRINT"YOU ARE NOW DESCENDING INTO THE"
1620 PRINT"DEPTHS OF THE TELENGARD DUNGEON...":PRINT :PRINT :PRINT :PRINT"BEWARE.... ";
1630 GOSUB 19000:GOSUB 19000:PRINT CL$;:L=1:GOSUB 20300:GOSUB 15000:GOSUB 30200:SY=1:GOTO 3000
2000 FOR I=1 TO 11:SF(I)=SF(I)-1:NEXT I
2005 L=CZ:GOSUB 17000:IF SY=1 THEN GOSUB 15000
2010 SY=1:IF I(6)=0 OR CH=HP THEN 3000
2015 CH=CH+I(6):IF CH>HP THEN CH=HP
2020 GOSUB 20300
3000 IF RND(1)>.3 THEN 4000
3001 IF SF(6)>0 AND RND(1)>.2 THEN 4000
3005 X=11:Y=8:GOSUB 200:PRINT"#":M=INT(RND(1)*20+1):IF SF(7)>0 AND M<5 THEN 3005
3006 IF INT(RND(1)*20+1)<=I(4) THEN 20900
3007 ML=INT((RND(1)^1.5)*(CZ*2+2)+1):GOSUB 20700
3008 IF SF(3)>0 AND UN=1 AND RND(1)>.8 THEN 3005
3010 GOSUB 16500:GOSUB 19700:PRINT"YOU HAVE ENCOUNTERED A LVL"ML;M$
3011 IF SF(9)>0 AND M<16 AND M<>11 THEN GOSUB 17500:GOTO 4000
3012 X=23:Y=19:GOSUB 200
3013 PRINT CHR$(27)+")LVL"STR$(ML)" "M$;CHR$(27)+"(";:X=0:Y=21:GOSUB 200
3015 MH=INT((RND(1)^.5)*ML*M+1):L=ML
3017 IF RND(1)>.95 THEN ON INT(RND(1)*3+1)GOTO 3030,3045,3072
3020 IF M<>9 THEN 3040
3025 IF RND(1)>.04*ST(5) THEN 3040
3030 PRINT"THE "M$" LIKES YOUR BODY":PRINT"HE HEALS YOU TO FULL STRENGTH";:CH=HP
3037 GOSUB 20300:GOSUB 19000:GOSUB 20600:X=11:Y=8:GOSUB 200:PRINT" ":GOTO 4000
3040 IF M<>4 OR RND(1)<.05*ST(5) THEN 3070
3045 PRINT"THE "M$" MAKES A QUICK MOVE":GOSUB 19000
3050 FOR I=1 TO 10:IF I(I)>0 THEN 3054
3052 NEXT I:PRINT"YOU HAVE NOTHING HE WANTS TO STEAL!";:GOTO 3037
3054 I=INT(RND(1)*10+1):IF I(I)<1 THEN 3054
3056 PRINT"HE STEALS ";:IF I<8 THEN PRINT"YOUR "MI$(I);:I(I)=0:GOTO 3037
3060 PRINT"A "MI$(I);:I(I)=I(I)-1:GOTO 3037
3070 IF M<>20 OR RND(1)*30>ST(3) THEN 3090
3072 I=INT(RND(1)*7+1):IF I(I)>=ML THEN 3090
3074 C=ML-I(I):C=INT(RND(1)*C+1):I(I)=I(I)+C
3076 PRINT"THE "M$" LIKES YOU!":GOSUB 17500
3078 PRINT"HE GIVES YOU A "MI$(I)" +"I(I);:GOSUB 20300:GOSUB 17500
3080 X=11:Y=8:GOSUB 200:PRINT" ":GOSUB 20600:GOTO 4000
3090 IF RND(1)>.5+ST(4)*.02 THEN 3300
3100 PRINT"(F)IGHT, (C)AST, OR (E)VADE:";:GOSUB 16000
3102 IF C$="&" THEN PRINT"WAIT":GOTO 3300
3105 FOR I=1 TO 7:IF MID$(C1$,I,1)=C$ THEN 3115
3110 NEXT I:PRINT :PRINT"THE "M$" IS NOT AMUSED":GOSUB 17500:GOTO 3100
3115 ON I GOTO 3200,3400,3700,3200,3400,3700,3300
3200 I=INT(RND(1)*20)+LV+I(1)+ST(0)/2:PRINT"FIGHT"
3202 IF SF(1)>0 THEN I=I+4
3204 IF I<10 THEN PRINT"YOU MISSED...":GOTO 3300
3205 I=INT(RND(1)*8+RND(1)*LV*2+I(1)+1):IF SF(1)>0 THEN I=I+5
3207 PRINT"YOU DO"I"POINTS DAMAGE"
3210 MH=MH-I:IF MH>0 THEN 3300
3220 PRINT"IT DIED...";
3223 X=11:Y=8:GOSUB 200:PRINT" ":E=ML*M*10:EX=EX+E:GOSUB 17500
3225 GOSUB 20600:GOSUB 17000:PRINT"YOU GAIN"E"EXPERIENCE POINTS";:GOSUB 20300:GOSUB 18000
3230 GOSUB 17500:GOTO 3900
3300 DB=1:PA=0:DR=0:MB=0:GOTO 3330
3305 I=INT(RND(1)*20)+ML-I(2)-I(3)+MB
3306 IF M>16  AND  M<20 AND SF(4)>0 THEN I=I-6
3310 IF I<10 THEN PRINT"IT MISSED...";:GOSUB 17500:GOTO 3100
3315 I=INT((RND(1)*8+RND(1)*ML*2+1)*DB):PRINT"IT DOES"I"POINTS DAMAGE";
3320 CH=CH-I:GOSUB 20260:IF CH<1 THEN 9000
3321 GOSUB 19000:IF RND(1)>DR OR SF(4)>0 THEN 3326
3322 GOSUB 17000:PRINT"IT DRAINS A LEVEL!!!";:EX=INT(EX/2)
3323 GOSUB 17000:IF LV=1 THEN EX=-1
3324 GOSUB 18000:GOSUB 17000:GOTO 3100
3326 IF RND(1)>PA THEN GOSUB 17500:GOTO 3100
3327 GOSUB 17000:PRINT"YOU'RE PARALIZED!!!!";:GOSUB 17500:GOTO 3300
3330 IF M=13 THEN DR=.1:GOTO 3305
3335 IF M=17 THEN DR=.2:GOTO 3305
3340 IF M=18 THEN DR=.3:PA=.3:GOTO 3305
3345 IF M=10 THEN PA=.5:GOTO 3305
3350 IF M<>19 THEN 3365
3352 GOSUB 17500
3355 IF RND(1)>.6 THEN PRINT"IT USES IT'S SWORD!!!":MB=4:DB=3:GOTO 3305
3360 PRINT"IT USES IT'S WHIP!!":MB=2:DB=2:GOTO 3305
3365 IF M<>20 THEN 3305
3370 IF RND(1)>.3 THEN MB=5:DB=2:GOTO 3305
3375 GOSUB 17500:PRINT"THE DRAGON BREATHS FIRE!!!";:GOSUB 17500
3378 I=INT(RND(1)*20*ML+1):IF RND(1)<.05*ST(3) THEN 3382
3380 PRINT"YOU PARTIALLY DODGE IT":I=INT(I/2+.5)
3382 PRINT"YOU BURN FOR "I"POINTS DAMAGE";:GOTO 3320
3400 D=1:GOTO 21000
3700 Q=INT(RND(1)*18+1):PRINT"EVADE"
3705 IF Q<ST(4)+I(5) THEN 3710
3707 PRINT"YOU'RE ROOTED TO THE SPOT":GOSUB 17500:GOSUB 16500:GOTO 3300
3710 IF SF(8)>0 THEN C=FNR(4):GOTO 3795
3715 ON FNR(4) GOTO 3720,3730,3740,3750
3720 C=1:IF FNUP(L%)<3 THEN 3795
3730 C=2:IF FNUP(P(2,1))<3 THEN 3795
3740 C=3:IF FNLF(L%)<3 THEN 3795
3750 C=4:IF FNLF(P(1,2))<3 THEN 3795
3760 C=1:IF FNUP(L%)<3 THEN 3795
3770 C=2:IF FNUP(P(2,1))<3 THEN 3795
3780 C=3:IF FNLF(L%)<3 THEN 3795
3790 GOTO 3707
3795 GOSUB 20600:GOSUB 17000:GOTO 8120
3900 IF RND(1)>.5 THEN 4002
4000 IF RND(1)>.2 THEN 6000
4002 T=0:IF RND(1)>.85 THEN T=1
4005 X=11:Y=8:GOSUB 200:PRINT"$":GOSUB 16500:C=0:IF RND(1)>.7 THEN 4100
4007 PRINT"YOU SEE SOME ";:I=INT(RND(1)*5)
4010 PRINT MID$(T$,I*6+1,6):PRINT"<RET> TO PICK UP:";
4011 IF T=1 THEN IF SF(2)>0 AND RND(1)>.1 THEN PRINT :PRINT"YOU DETECT TRAPS!";
4012 GOSUB 16000:IF C$=CHR$(13) THEN 4020
4015 PRINT"LEAVE IT":GOSUB 17500:GOTO 6000
4020 PRINT"SNARF IT":IF T=0 THEN 4040
4025 Q=INT(RND(1)*3*L+1):GOSUB 17000
4030 PRINT"IT'S TRAPPED!":PRINT"YOU SUFFER"Q"POINTS DAMAGE"
4035 CH=CH-Q:GOSUB 20260:GOSUB 17500:IF CH<1 THEN 9000
4040 J=INT(RND(1)*I*L*200+1):PRINT"IT'S WORTH"J"GOLD";
4045 GD=GD+J:IF I=0 AND RND(1)>.8 THEN GOSUB 20300:GOSUB 17000:GOTO 4200
4050 GOSUB 20300:GOTO 4900
4100 IF RND(1)>.5 THEN 4200
4105 PRINT"YOU HAVE FOUND A TREASURE CHEST!!"
4110 PRINT"<RET> TO OPEN IT:";
4115 IF T=1 THEN IF SF(2)>0 AND RND(1)>.1 THEN PRINT :PRINT"YOU DETECT TRAPS!";
4120 GOSUB 16000:IF C$<>CHR$(13) THEN PRINT"IGNORE IT":GOTO 6000
4125 PRINT"OPEN IT":IF T=0 THEN 4140
4130 GOSUB 17500:PRINT"CHEST EXPLODES!!!!!":I=INT(RND(1)*10*CZ+1):CH=CH-I
4135 PRINT"YOU SUFFER"I"POINTS DAMAGE":GOSUB 20260:IF CH<1 THEN 9000
4140 GOSUB 17500:I=INT(RND(1)*1000*L^2+1)
4145 IF RND(1)>.9 THEN PRINT"INSIDE, THERE IS ONLY COBWEBS...":GOTO 4900
4150 PRINT"INSIDE IS"I"GOLD PIECES!":GD=GD+I:GOSUB 20300:IF RND(1)>.5 THEN 4900
4155 C=1:GOSUB 17500
4200 I=INT(RND(1)*10+1):PRINT"YOU SEE A ";
4205 J=INT(RND(1)^.5*(L+1)+1):IF I>7 THEN PRINT MI$(I):GOTO 4215
4210 PRINT MI$(I)" +"J
4215 PRINT"<RET> TO PICK IT UP:";:GOSUB 16000:IF C$=CHR$(13) THEN 4225
4220 PRINT"LEAVE IT":GOTO 4240
4225 IF I<>1 OR T<>1 THEN 4235
4230 PRINT :PRINT"IT'S A HOSTILE SWORD!!";:GOSUB 17500:I=INT(RND(1)*I*5+1)
4232 PRINT"YOU SUFFER"I"DAMAGE POINTS";:CH=CH-I:GOSUB 20300:IF CH<1 THEN 9000
4234 GOTO 4900
4235 PRINT"IT'S YOURS!":I(I)=I(I)+1:IF I<8 THEN I(I)=J
4237 GOSUB 20300
4240 IF C=1 AND RND(1)>.5 THEN GOSUB 17500:GOTO 4200
4900 X=11:Y=8:GOSUB 200:PRINT" ":GOSUB 17500
4910 IF RND(1)>.5 THEN GOSUB 30000:IF M<>0 THEN 3010
6000 X=CX:Y=CY:Z=CZ-1:GOSUB 10010
6002 J=FNS(H%):I=FNS(L%)
6005 IF CZ=1 THEN J=0
6010 IF I>9 THEN I=I-9:GOTO 6010
6012 IF J>9 THEN J=J-9:GOTO 6012
6013 IF CZ=50 AND I=4 THEN I=0
6014 IF I=0 AND J<>4 THEN 8000
6015 IF J=4 THEN 6500
6020 ON I GOTO 6100,6300,6400,6500,6600,6700,6800,6900,7100
6100 IF CZ<>1 THEN 6200
6102 J=4:GOTO 6500
6103 M$=IN$(FNRD(CX*CY),1)+" "
6104 M$=M$+IN$(FNRD(CX+CY),2)+" "+IN$(FNRD(CX*3+CY*7),3)+" "
6105 GOSUB 17900:GOSUB 17000:GOSUB 19000:X=0:Y=3:GOSUB 200:PRINT :PRINT"            /\":PRINT"           /  \":PRINT"          /    \":PRINT"          |----|":PRINT"          |INN |":PRINT"          | X  |":PRINT"          ------":PRINT :PRINT 
6108 PRINT"   "IN$(FNRD(CX*CY),1):PRINT"    "IN$(FNRD(CX+CY),2)
6109 PRINT"     "IN$(FNRD(CX*3+CY*7),3)
6110 GOSUB 16500:PRINT"YOU HAVE FOUND THE ";LEFT$(M$,20)
6111 PRINT"THEY CASH IN YOUR GOLD":EX=EX+GD:TG=TG+GD:GD=0:GOSUB 20300
6115 GOSUB 18000:GOSUB 30200:GOSUB 17000:CH=HP:PRINT"YOU HAVE"TG"IN THE SAFE"
6116 FOR I=0 TO 11:SF(I)=0:NEXT I
6119 CS=SU:PRINT"YOU SPEND THE NIGHT":GOSUB 19000
6120 PRINT"YOU FEEL BETTER";:GOSUB 20300:GOSUB 17000
6125 PRINT"PRESS <RET> TO RETURN TO DUNGEON,"
6130 PRINT"<^S> SAVE CHARACTER ON DISK:";
6135 GOSUB 16000:IF C$="&" THEN 6135
6140 IF C$=CHR$(19) AND NM$<>"DEMO" THEN PRINT :GOTO 8600
6142 IF C$<>CHR$(13) THEN PRINT"???":GOSUB 17500:GOTO 6125
6145 PRINT"REENTER":GOSUB 17500:CZ=1:GOTO 2000
6200 GOSUB 16600:PRINT"ELV";:GOSUB 16500:PRINT"YOU FEEL HEAVY FOR A MOMENT"
6210 GOSUB 19000:CZ=CZ-1:GOTO 2000
6300 IF CZ=50 THEN 6200
6302 GOSUB 16600:PRINT"PIT";:GOSUB 16500:PRINT"YOU SEE A PIT"
6303 IF SF(5)>0 THEN PRINT"YOU ARE HOVERING ABOVE A PIT":GOTO 6310
6305 IF INT(RND(1)*20)>ST(4)+I(5) THEN 6330
6310 PRINT"DO YOU WANT TO DESCEND?";:GOSUB 16000:IF C$="Y" THEN 6320
6315 PRINT"NO":GOSUB 17500:GOTO 8000
6320 PRINT"YES":GOTO 6335
6330 PRINT"YOU FALL IN!!":L=3:GOSUB 17500:GOSUB 20000
6335 CZ=CZ+1:GOTO 2000
6400 GOSUB 16600:PRINT"TPT":GOSUB 16500
6403 PRINT"ZZAP!! YOU'VE BEEN TELEPORTED...":GOSUB 30200
6405 IF ((CX+CY) AND 1)=0 THEN CZ=CZ-1:IF ((CX+CY) AND 2)=2 THEN CZ=CZ+2
6410 CX=CX+CZ*8+CY*13:CY=CY+CZ*6+CX*17
6415 IF CX>200 THEN CX=CX-200:GOTO 6415
6420 IF CY>200 THEN CY=CY-200:GOTO 6420
6425 IF CZ=0 THEN CZ=1
6430 IF CZ>50 THEN CZ=50
6435 IF RND(1)>.8 THEN 6405
6440 GOTO 2000
6500 GOSUB 16600:IF J=4 THEN PRINT"/";
6505 IF I=4 THEN PRINT"\";
6510 GOSUB 17000:PRINT"YOU HAVE FOUND A CIRCULAR STAIRWAY"
6512 IF J=4 AND CZ=1 THEN PRINT"YOU SEE LIGHT ABOVE"
6515 PRINT"DO YOU WANT TO ";
6520 IF J=4 THEN PRINT"GO (U)P, ";
6525 IF I=4 THEN PRINT"GO (D)OWN, ";
6530 PRINT :PRINT"OR (S)TAY ON THE SAME LEVEL?";:GOSUB 16000
6532 IF C$="&" THEN C$="S"
6535 IF (I<>4 AND (C$="D" OR C$="1")) OR (J<>4 AND (C$="U" OR C$="7")) THEN 6550
6540 IF C$="U" OR C$="7" THEN PRINT"UP";:CZ=CZ-1:IF CZ>0 THEN 2000
6542 IF CZ<=0 THEN 6103
6545 IF C$="D" OR C$="1" THEN PRINT"DOWN";:CZ=CZ+1:GOTO 2000
6547 IF C$="S" OR C$="5" THEN PRINT"STAY";:GOSUB 17000:GOTO 8000
6550 PRINT"???";:GOTO 6510
6600 GOSUB 16600:PRINT"ALT":GOSUB 17000:PRINT"YOU HAVE FOUND A HOLY ALTAR"
6605 PRINT"PRESS <RET> TO WORSHIP";:GOSUB 16000:IF C$=CHR$(13) THEN 6630
6610 IF RND(1)>.7 THEN GOTO 8000 ELSE PRINT
6615 PRINT"DIRTY PAGAN TRASH!";:GOSUB 16600:PRINT"#  ";
6620 M=INT(RND(1)*20+1):GOSUB 20700:IF UN=0 THEN 6620
6625 GOSUB 17500:GOTO 3007
6630 PRINT :PRINT"PRESS <RET> TO DONATE MONEY";:GOSUB 16000
6632 IF C$<>CHR$(13) THEN 6610
6634 GOSUB 17000:PRINT"HOW MUCH GOLD?";:GOSUB 20800:GOSUB 17000
6636 IF C>GD THEN PRINT"YOU DON'T HAVE THAT MUCH!";:GOTO 6615
6640 IF C<50*CZ THEN 6615
6645 GD=GD-C:GOSUB 20300:GOSUB 17500
6650 IF RND(1)<C/(GD+C) THEN 6660
6655 PRINT"THANK YOU FOR YOUR DONATION":GOSUB 17500:GOTO 8000
6660 I=INT(RND(1)*7+1):IF SF(I)<0 THEN SF(I)=0
6665 SF(I)=SF(I)+INT(RND(1)*100*C/(GD+C)+1)
6680 PRINT"YOU'VE BEEN HEARD":GOSUB 17500:GOTO 8000
6700 GOSUB 16600:PRINT"FNT":GOSUB 17000:PRINT"YOU HAVE FOUND A FOUNTAIN"
6701 C=INT(RND(1)*5+1)
6702 PRINT"WITH RUNNING "MID$("WHITEGREENCLEARRED  BLACK",C*5-4,5)" WATER"
6705 PRINT"<RET> TO DRINK SOME:";:GOSUB 16000:IF C$=CHR$(13) THEN 6715
6710 GOSUB 17000:GOTO 8000
6715 GOSUB 17000:IF RND(1)>.6 THEN 6750
6717 IF RND(1)>1-C*.15 THEN 6730
6720 PRINT"YOU FEEL BETTER":GOSUB 19000:I=INT(RND(1)*3*CZ+1)
6725 PRINT"YOU HEAL"I"POINTS":CH=CH+I:IF CH>HP THEN CH=HP
6727 GOSUB 20260:GOSUB 17500:GOTO 8000
6730 IF RND(1)>.15*C THEN 6745
6735 PRINT"IT'S POISON!!!":I=INT(RND(1)*3*CZ+1):PRINT"YOU LOSE"I"HIT POINTS"
6740 CH=CH-I:GOSUB 20260:IF CH<1 THEN 9000
6742 GOSUB 17500:GOTO 8000
6745 GOSUB 20100:GOSUB 20300:GOSUB 17500:GOTO 8000
6750 IF RND(1)>.4 THEN PRINT"YOU FEEL REFRESHED!":GOSUB 17500:GOTO 8000
6752 IF RND(1)>.5 THEN 6780
6755 IF RND(1)>.5 THEN 6770
6760 PRINT"MAGICAL POWER SURGES THROUGH YOUR BODY":CS=CS+INT(RND(1)*4*CZ+1)
6765 PRINT"YOU NOW HAVE"CS" SPELLS":GOSUB 20250:GOSUB 17500:GOTO 8000
6770 PRINT"YOU HAVE BEEN DISPOSESSED!!";:FOR I=1 TO 10:I(I)=0:NEXT I:GOSUB 19000
6775 PRINT CL$:GOSUB 20300:GOSUB 15000:GOSUB 30025:GOTO 8000
6780 PRINT"YOU FEEL REFRESHED!":GOSUB 17500:PRINT"ACTUALLY YOU'RE DRUNK!!"
6785 IF SF(11)<0 THEN SF(11)=0
6786 SF(11)=SF(11)+INT(RND(1)*16+1):GOSUB 15000:GOSUB 17000:GOTO 8000
6800 GOSUB 16600:PRINT"GCB":GOSUB 17000:PRINT"YOU SEE A LARGE GRAY MISTY CUBE"
6805 PRINT"<RET> TO WALK IN:";:GOSUB 16000:IF CHR$(13)<>C$ THEN 8000
6810 IF RND(1)>.2 THEN 6815
6812 CZ=INT(RND(1)*50+1):GOTO 6820
6815 PRINT :PRINT"A NUMBER FROM 1 TO 50:";:GOSUB 20800:IF C$="&" THEN 6812
6817 IF C<1 OR C>50 THEN PRINT"NO YOU FOOL!!";:GOSUB 17500:GOTO 6810
6818 CZ=C
6820 GOSUB 17900:PRINT CH$:PRINT :PRINT :PRINT"    YOU FLOAT":PRINT :PRINT"       IN SPACE....";:GOTO 2000
6900 GOSUB 16600:PRINT"THR";:GOSUB 17000:PRINT"YOU SEE A JEWEL ENCRUSTED THRONE":GOSUB 17500
6905 PRINT"DO YOU WANT TO (P)RY SOME JEWELS,"
6910 PRINT"(S)IT DOWN, (R)EAD THE RUNES,":PRINT"OR (I)GNORE IT:";
6915 GOSUB 16000:IF C$="I" OR C$="&" THEN PRINT"IGNORE";:GOSUB 17500:GOTO 8000
6920 IF C$<>"P" THEN 6950
6925 PRINT"PRY";:GOSUB 17500:IF RND(1)>.7 THEN 7030
6930 IF RND(1)>.4 THEN 7025
6935 PRINT"THEY POP INTO YOUR GREEDY HANDS!!":I=INT(RND(1)*1000*CZ+1)
6940 PRINT"THEY ARE WORTH"I"GOLD":GD=GD+I:GOSUB 20300:GOSUB 17500:GOTO 8000
6950 IF C$<>"S" THEN 6985
6955 PRINT"SIT";:GOSUB 17500:IF RND(1)>.7 THEN 7030
6960 IF RND(1)>.6 THEN 7025
6965 IF RND(1)>.4 THEN 6403
6970 PRINT"A LOUD GONG SOUNDS!";:GOSUB 17500:IF RND(1)<.5 THEN 6975
6973 EX=INT(EX/2):IF LV=1 THEN EX=-1
6974 GOSUB 18000:GOTO 8000
6975 IF LV>CZ THEN PRINT"NOTHING HAPPENS...";:GOTO 7010
6980 EX=1000*2^LV:GOSUB 18000:GOTO 8000
6985 IF C$<>"R" THEN 7015
6990 PRINT"READ";:GOSUB 17500
6992 IF RND(1)>.7 THEN 7030
6995 IF RND(1)<ST(1)*.05 THEN 7005
7000 PRINT :PRINT"YOU DON'T UNDERSTAND THEM...";:GOTO 7010
7005 PRINT :PRINT"A MYSTERIOUS MAGIC GRIPS YOU..":GOSUB 20200
7010 GOSUB 17500:GOTO 8000
7015 PRINT"???";:GOSUB 17500:GOTO 6900
7025 PRINT"NOTHING HAPPENS...";:GOTO 7010
7030 M=INT(RND(1)*20+1):GOSUB 19700
7032 PRINT"THE "M$" KING RETURNS!!":GOSUB 17500:GOSUB 16600:GOSUB 20700
7035 PRINT"   ";:X=11:Y=8:GOSUB 200:PRINT"#":ML=INT(RND(1)*CZ*5)+5:UN=0:GOTO 3010
7100 GOSUB 16600:PRINT"SAF":GOSUB 17000
7105 PRINT"YOU SEE A SMALL BOX WITH FOUR COLORED"
7110 PRINT"LIGHTS. (P)USH BUTTONS OR (I)GNORE:";:GOSUB 16000
7115 IF C$<>"P" THEN PRINT"IGNORE":GOSUB 17500:GOTO 8000
7120 PRINT"PUSH":GOSUB 17500:CB=1
7125 PRINT"PUSH (R)ED, (G)REEN, (Y)ELLOW, (B)LUE":PRINT"OR (S)TOP:";
7130 GOSUB 16000:IF C$="S" OR C$="&" THEN PRINT"STOP";:GOSUB 17500:GOTO 8000
7135 FOR C=1 TO 4:IF C$=MID$(B$,C*6-5,1) THEN M$=MID$(B$,C*6-5,6):GOTO 7145
7140 NEXT C:PRINT"???":GOSUB 17500:GOTO 7125
7145 GOSUB 19705:PRINT M$:IF B(CB)<>C THEN 7170
7150 CB=CB+1:IF CB<5 THEN GOSUB 17500:GOTO 7125
7155 PRINT"IT OPENS!!!!  ";:GOSUB 17500:PRINT"INSIDE YOU FIND JEWELS WORTH"
7160 GOSUB 19800:I=INT(RND(1)*20000*CZ^2+1):PRINT I"IN GOLD!!":GD=GD+I:GOSUB 20300
7165 GOSUB 17000:GOTO 8000
7170 I=INT(RND(1)*2*CZ+1):PRINT"AN ELECTRIC BOLT SHOOTS THROUGH YOU!!"
7175 GOSUB 17500:PRINT"YOU SUFFER"I"POINTS DAMAGE":CH=CH-I:GOSUB 20260
7180 IF CH<1 THEN 9000
7185 GOSUB 17500:GOTO 8000
8000 REM *COMMAND*
8010 M=0:GOSUB 16500:GOSUB 17000:PRINT"->";
8020 GOSUB 16000:IF C$="&" THEN C$="S"
8100 FOR C=1 TO 22:IF MID$(CM$,C,1)=C$ THEN 8117
8110 NEXT C
8115 PRINT CB$;CB$;"NO";:FOR I=1 TO 200:NEXT I:GOTO 8000
8117 IF C>9 THEN C=C-9
8118 IF SF(11)>0 AND C<6 THEN PRINT"YOU'RE CONFUSED ->";:C=FNR(5)
8120 ON C GOTO 8150,8200,8250,8300,8350,8800,8700,8900,8970,8600,8910,8925,8945
8150 IF FNUP(L%)>2 AND SF(8)<1 OR CY=1 THEN 8115
8155 PRINT"NORTH";:CY=CY-1:GOSUB 30100:GOTO 2000
8200 IF FNUP(P(2,1))>2 AND SF(8)<1 OR CY=200 THEN 8115
8205 PRINT"SOUTH";:CY=CY+1:GOSUB 30100:GOTO 2000
8250 IF FNLF(L%)>2 AND SF(8)<1 OR CX=1 THEN 8115
8255 PRINT"WEST";:CX=CX-1:GOSUB 30100:GOTO 2000
8300 IF FNLF(P(1,2))>2 AND SF(8)<1 OR CX=200 THEN 8115
8305 PRINT"EAST";:CX=CX+1:GOSUB 30100:GOTO 2000
8350 PRINT"STAY":X=11:Y=8:GOSUB 200:PRINT"   ":GOSUB 30000:IF M<>0 THEN 3010
8355 SY=0:GOTO 2000
8600 PRINT"STORE ";NM$", ";:IF NM$<>"DEMO" THEN 8610
8605 PRINT :PRINT"CANNOT STORE DEMONSTRATION CHARACTER!";:GOSUB 17500:GOTO 8000
8610 ON ERROR GOTO 8612:OPEN "I",#1,NM$+".PLR":CLOSE 1:ON ERROR GOTO 0:GOSUB 17000:PRINT "A CHARACTER OF THAT NAME ALREADY EXISTS":LINE INPUT "YOUR NAME NOBLE SIRE? ";NM$:GOSUB 17500:GOTO 8600
8612 RESUME 8613
8613 ON ERROR GOTO 0:CLOSE 1
8615 IF DS THEN REM SYS31765
8620 ON ERROR GOTO 8692:OPEN "O",#1,NM$+".PLR"
8625 PRINT #1,NM$:PRINT #1,4.15:FOR I=0 TO 5:PRINT #1,ST(I):NEXT I
8630 PRINT #1,LV:PRINT #1,GD:PRINT #1,TG:PRINT #1,EX:PRINT #1,CH:PRINT #1,HP
8635 PRINT #1,CX:PRINT #1,CY:PRINT #1,CZ:PRINT #1,SU:PRINT #1,CS
8640 FOR I=1 TO 10:PRINT #1,I(I):PRINT #1,SF(I):NEXT I:PRINT #1,SF(11)
8645 FOR I=1 TO 20:PRINT #1,FM(I):PRINT #1,FL(I):PRINT #1,FH(I):NEXT I
8650 FOR I=1 TO 4:PRINT #1,B(I):NEXT I
8690 CLOSE 1:PRINT NM$" STORED":ON ERROR GOTO 0:GOTO 1191
8692 PRINT :PRINT"Cannot store ";NM$:PRINT"   Disk missing or full?";:
8694 ON ERROR GOTO 0
8696 GOSUB 17500:IF CZ=0 THEN 6125 ELSE 8000
8700 PRINT"QUIT":PRINT"ARE YOU SURE?";:GOSUB 16000
8702 IF C$<>"Y" THEN PRINT"NO":GOSUB 17500:GOTO 8000
8710 PRINT"YES":PRINT"GOOD BYE CRUEL WORLD!!":GOSUB 19000:GOTO 9000
8800 PRINT "HELP"
8802 GOSUB 19000:PRINT CL$
8805 PRINT "COMMANDS ARE:"
8810 PRINT " W - NORTH    Q     -  QUIT"
8815 PRINT " A - WEST              (FALL ON YOUR SWORD)"
8820 PRINT " D - EAST     P     -  RE-PLOT SCREEN"
8825 PRINT " X - SOUTH    ^S    -  SAVE CHARACTER"
8830 PRINT " F - FIGHT    ^P    -  USE POTION OF STRENGTH"
8835 PRINT " C - CAST     ^H    -  USE HEALING POTION"
8840 PRINT " E - EVADE    ^R    -  READ SCROLL OF RESCUE"
8850 PRINT "   [ ^S MEANS THE CONTROL KEY AND S TOGETHER]"
8896 GOSUB 17000:PRINT"HIT ANY KEY TO CONTINUE...";:GOSUB 16000:GOSUB 17500
8898 PRINT CL$:GOSUB 20300:GOSUB 15000:GOTO 8000
8900 PRINT"RE-PLOT":GOSUB 19000:PRINT CL$:GOSUB 20300:GOSUB 15000
8905 GOSUB 30025:GOTO 8000
8910 PRINT"USE SCROLL OF RESCUE"
8915 IF I(8)<1 THEN 8920
8917 I(8)=I(8)-1:CX=25:CY=13:CZ=1:PRINT"***ZAP!!***":GOSUB 19000:GOSUB 30200
8918 GD=0:GOSUB 20300:GOTO 2000
8920 PRINT"YOU DON'T HAVE ONE!!"
8922 GOSUB 17500:GOTO 8000
8925 PRINT"DRINK HEALING POTION":IF I(9)<1 THEN 8920
8935 I(9)=I(9)-1:CH=CH+FNR(20):IF CH>HP THEN CH=HP
8940 PRINT"YOU FEEL BETTER!":GOSUB 20300:GOTO 8922
8945 PRINT"DRINK STRENGTH POTION":IF I(10)<1 THEN 8920
8950 IF SF(1)<0 THEN SF(1)=0
8955 SF(1)=SF(1)+10+INT(RND(1)*20):PRINT"STRENGTH FLOWS THROUGH YOUR BODY"
8960 I(10)=I(10)-1:GOSUB 20300:GOTO 8922
8970 D=0:GOTO 21000
9000 GOSUB 19000:GOSUB 17000:PRINT"YOU DIED!!":GOSUB 17500
9001 IF SF(10)>0 THEN 27205
9002 PRINT CL$:PRINT :PRINT :PRINT"      ANOTHER ";:IF LV<4 THEN PRINT"NOT SO ";
9005 PRINT"MIGHTY ADVENTURER BITES THE DUST":PRINT :PRINT :PRINT 
9010 PRINT"DO YOU WANT TO TRY AGAIN?";
9012 GOSUB 16000:IF C$="N" OR C$="9" THEN 9020
9013 IF C$="&" THEN 9012
9015 PRINT"YES":GOTO 1212
9020 PRINT"NO":PRINT :PRINT :PRINT"SO LONG.....":GOTO 32767
10010 Q=X*XO+Y*YO+Z*ZO+(X+XO)*(Y+YO)*(Z+ZO)
10020 H%=(Q-INT(Q))*W0:IF FNS(H%)>5 THEN H%=H% AND 255
10025 IF INT(H%/256)>0 THEN H%=(INT((Q*10-INT(Q*10))*15+1)*256) OR (H% AND 255)
10030 IF X=1 OR X=201 THEN H%=H% OR 12
10035 IF Y=1 OR Y=201 THEN H%=H% OR 3
10040 RETURN
10050 IF W<2 THEN RETURN
10055 Y=INT(L%/40):X=L%-Y*40-1:GOSUB 200:PRINT CW$;CW$;
10057 IF W>2 THEN PRINT CW$;CW$;CW$; ELSE PRINT HD$;HD$;HD$;
10060 PRINT CW$;CW$:RETURN
10075 IF W<2 THEN RETURN
10080 Y=INT(L%/40):X=L%-Y*40-1:GOSUB 200:PRINT CW$;CD$;CB$;CW$;CD$;CB$;
10082 IF W>2 THEN PRINT CW$;CD$;CB$;CW$;CD$;CB$;CW$;CD$;CB$; ELSE PRINT VD$;CD$;CB$;VD$;CD$;CB$;VD$;CD$;CB$;
10085 PRINT CW$;CD$;CB$;CW$:RETURN
15000 Z=CZ:FOR Q2=0 TO 3:Y=CY+Q2-1:FOR Q1=0 TO 3:X=CX+Q1-1:GOSUB 10010
15005 P(Q2,Q1)=H%:NEXT Q1:NEXT Q2
15006 GOSUB 17900:X=65:Y=10:GOSUB 200
15007 FOR I=1 TO 11:PRINT"             ":NEXT I:GOSUB 200
15008 FOR I=1 TO 11:IF SF(I)<1 THEN 15011
15010 PRINT MID$("Strength     Detect traps Light        Prot frm EvilLevitate     Invisibility Fear         Astral walk  Time stop    Raise dead   Potion active",I*13-12,13):Y=Y+1:GOSUB 200
15011 NEXT I:IF FNUP(P(1,1))>1 OR FNLF(P(0,1))>1 THEN 15015
15012 L%=4:W=FNUP(P(0,0)):GOSUB 10050
15015 IF FNUP(P(1,0))>1 OR FNLF(P(1,1))>1 THEN 15025
15020 L%=4:W=FNLF(P(0,0)):GOSUB 10075
15025 IF FNUP(P(1,1))>1 THEN 15040
15030 L%=10:W=FNUP(P(0,1)):GOSUB 10050:W=FNLF(P(0,1)):GOSUB 10075
15035 L%=16:W=FNLF(P(0,2)):GOSUB 10075
15040 IF FNUP(P(1,1))>1 OR FNLF(P(0,2))>1 THEN 15045
15042 L%=16:W=FNUP(P(0,2)):GOSUB 10050
15045 IF FNLF(P(1,2))>1 OR FNUP(P(1,2))>1 THEN 15055
15050 L%=22:W=FNLF(P(0,3)):GOSUB 10075
15055 IF FNLF(P(1,2))>1 THEN 15080
15060 L%=256:W=FNUP(P(1,2)):GOSUB 10050:L%=262:W=FNLF(P(1,3)):GOSUB 10075
15070 L%=496:W=FNUP(P(2,2)):GOSUB 10050
15080 IF FNUP(P(2,1))>1 OR FNLF(P(2,2))>1 THEN 15085
15082 L%=736:W=FNUP(P(3,2)):GOSUB 10050
15085 IF FNLF(P(1,2))>1 OR FNUP(P(2,2))>1 THEN 15100
15090 L%=502:W=FNLF(P(2,3)):GOSUB 10075
15100 IF FNUP(P(2,1))>1 THEN 15120
15105 L%=496:W=FNLF(P(2,2)):GOSUB 10075
15110 L%=730:W=FNUP(P(3,1)):GOSUB 10050:L%=490:W=FNLF(P(2,1)):GOSUB 10075
15120 IF FNUP(P(2,1))>1 OR FNLF(P(2,1))>1 THEN 15125
15122 L%=724:W=FNUP(P(3,0)):GOSUB 10050
15125 IF FNLF(P(1,1))>1 OR FNUP(P(2,0))>1 THEN 15140
15130 L%=484:W=FNLF(P(2,0)):GOSUB 10075
15140 IF FNLF(P(1,1))>1 THEN 15155
15145 L%=484:W=FNUP(P(2,0)):GOSUB 10050
15150 L%=244:W=FNLF(P(1,0)):GOSUB 10075:W=FNUP(P(1,0)):GOSUB 10050
15155 L%=250:W=FNLF(P(1,1)):GOSUB 10075:W=FNUP(P(1,1)):GOSUB 10050
15160 L%=256:W=FNLF(P(1,2)):GOSUB 10075:L%=490:W=FNUP(P(2,1)):GOSUB 10050
15200 X=12:Y=9:GOSUB 200:PRINT"X"::L%=P(1,1):IF SF(3)<=0 THEN RETURN
15300 IF FNS(P(0,0))=0 THEN 15320
15305 IF FNUP(P(1,0))<2 AND FNLF(P(1,1))<2 THEN 15315
15310 IF FNUP(P(1,1))>1 OR FNLF(P(0,1))>1 THEN 15320
15315 X=32894!:GOSUB 15500
15320 IF FNS(P(0,1))<>0 AND FNUP(P(1,1))<2 THEN X=32900!:GOSUB 15500
15340 IF FNS(P(0,2))=0 THEN 15360
15345 IF FNUP(P(1,1))<2 AND FNLF(P(0,2))<2 THEN 15355
15350 IF FNUP(P(1,2))>1 OR FNLF(P(1,2))>1 THEN 15360
15355 X=32906!:GOSUB 15500
15360 IF FNS(P(1,2))<>0 AND FNLF(P(1,2))<2 THEN X=33146!:GOSUB 15500
15380 IF FNS(P(2,2))=0 THEN 15400
15385 IF FNUP(P(2,2))<2 AND FNLF(P(1,2))<2 THEN 15395
15390 IF FNUP(P(2,1))>1 OR FNLF(P(2,2))>1 THEN 15400
15395 X=33386!:GOSUB 15500
15400 IF FNS(P(2,1))<>0 AND FNUP(P(2,1))<2 THEN X=33380!:GOSUB 15500
15420 IF FNS(P(2,0))=0 THEN 15440
15425 IF FNUP(P(2,0))<2 AND FNLF(P(1,1))<2 THEN 15435
15430 IF FNUP(P(2,1))>1 OR FNLF(P(2,1))>1 THEN 15440
15435 X=33374!:GOSUB 15500
15440 IF FNS(P(1,0))<>0 AND FNLF(P(1,1))<2 THEN X=33134!:GOSUB 15500
15499 RETURN
15500 X=X-32768!:Y=INT(X/40):X=X-Y*40:GOSUB 200:PRINT"*":RETURN
16000 FOR Q=1 TO 100*3:C$=INKEY$:IF C$="" THEN 16010
16001 IF ASC(C$)>96 THEN C$=CHR$(ASC(C$)-32)
16005 IF C$<>CHR$(3) THEN RETURN
16006 PRINT" NO R/S      ";:FOR I=1 TO 500:NEXT I:PRINT"             ";:GOTO 16000
16010 NEXT Q:IF NM$="DEMO" THEN 16000
16015 C$="&":RETURN
16200 LINE INPUT "";D$:RETURN
16500 X=0:Y=19:GOSUB 200:KL=20:PRINT :RETURN
16600 X=11:Y=8:GOSUB 200:RETURN
17000 X=0:Y=20:GOSUB 200:FOR QQ=1 TO 4:PRINT"                                                      ";:IF QQ<4 THEN PRINT 
17005 NEXT QQ:GOSUB 16500:RETURN
17500 GOSUB 19000:GOTO 17000
17900 PRINT CH$;:FOR Q=1 TO 20:PRINT"                      ":NEXT Q:RETURN
18000 IF EX<1000*2^LV THEN 18040
18010 GOSUB 17000:PRINT"YOU WENT UP A LEVEL!";:LV=LV+1:J=INT(RND(1)*ST(3)+1)
18015 CH=CH+J:HP=HP+J:IF EX>1000*2^LV THEN EX=1000*2^LV-1
18017 CS=CS+LV:SU=SU+LV
18020 GOSUB 20300:GOSUB 17500:PRINT"YOU GAIN"J"HIT POINTS":RETURN
18040 IF LV=1 AND EX>=0 THEN RETURN
18050 IF EX>=1000*2^(LV-1) THEN RETURN
18055 CS=CS-LV:SU=SU-LV:IF CS<0 THEN CS=0
18060 PRINT"YOU GO DOWN A LEVEL!";:LV=LV-1:J=INT(RND(1)*ST(3)+1)
18065 CH=CH-J:HP=HP-J
18070 GOSUB 20300:GOSUB 17500:PRINT"YOU LOSE"J"HIT POINTS"
18075 IF CH>0 AND LV>0 THEN RETURN
18080 GOSUB 19000:GOTO 9000
19000 FOR Q=1 TO 600*2:NEXT Q:RETURN
19500 FOR Q=1 TO 100*2:NEXT Q:RETURN
19700 M$=MID$(MO$,M*8-7,8)
19705 IF RIGHT$(M$,1)=" " THEN M$=LEFT$(M$,LEN(M$)-1):GOTO 19705
19710 RETURN
19800 FOR Q=1 TO 4:B(Q)=INT(RND(1)*4+1):NEXT Q:RETURN
20000 D=INT(RND(1)*L*6+1):PRINT"YOU SUFFER"D"HIT POINTS":CH=CH-D
20005 IF CH>0 THEN GOSUB 20260:RETURN
20010 PRINT"YOUR LIFE HAS BEEN TERMINATED";:GOSUB 20300:GOSUB 17500:GOTO 9000
20100 I=INT(RND(1)*500*CZ+1):PRINT"YOU JUST ";
20110 IF RND(1)>.5 THEN PRINT"LOST";:I=-I:GOTO 20120
20115 PRINT"GAINED";
20120 PRINT ABS(I);"EXPERIENCE POINTS":EX=EX+I:GOSUB 18000:RETURN
20200 I=INT(RND(1)*6):IF RND(1)>.5 THEN 20220
20210 IF ST(I)=18 THEN 20200
20215 PRINT"YOUR ";MID$(S$,I*3+1,3);" GOES UP";:ST(I)=ST(I)+1:GOTO 20240
20220 IF ST(I)=3 THEN 20200
20225 PRINT"YOUR ";MID$(S$,I*3+1,3);" GOES DOWN";:ST(I)=ST(I)-1
20240 PRINT" BY 1":GOSUB 20300:GOSUB 19000:RETURN
20250 K=5:EN=2:GOTO 20322
20260 K=4:EN=3:GOTO 20320
20300 EN=1:K=0:PRINT HC$
20301 GOSUB 20399:PRINT CHR$(27)+")";LEFT$(NM$,7);CHR$(27)+"(";:GOSUB 20398:PRINT "LEVEL"STR$(LV)" "
20302 GOSUB 20399:PRINT"STRENGTH"STR$(ST(0));:GOSUB 20398:PRINT "CONSTITUTION"STR$(ST(3))
20305 GOSUB 20399:PRINT"INTELLIGENCE"STR$(ST(1));:GOSUB 20398:PRINT "DEXTERITY"STR$(ST(4))
20310 GOSUB 20399:PRINT"WISDOM"STR$(ST(2));:GOSUB 20398:PRINT "CHARISMA"STR$(ST(5))
20320 GOSUB 20399:PRINT"HIT POINTS"STR$(CH)"/"MID$(STR$(HP),2)"  "
20321 IF EN=3 THEN 20396
20322 GOSUB 20399:PRINT"SPELL UNITS"STR$(CS)"/"MID$(STR$(SU),2)"  "
20323 IF EN=2 THEN 20396
20325 C$=LEFT$(STR$(EX),14):GOSUB 20399:PRINT"EXPERINCE PTS";C$;LEFT$("          ",14-LEN(C$))
20330 C$=LEFT$(STR$(GD),14):GOSUB 20399:PRINT"GOLD";C$;LEFT$("          ",14-LEN(C$))
20335 FOR I=1 TO 10:IF I<4 THEN IF I(I)>=0 THEN 20345
20340 IF I(I)<1 THEN 20380
20345 GOSUB 20399:PRINT" ";:IF I>7 THEN 20365
20350 PRINT MA$(I);:IF I(I)>0 THEN PRINT" +"MID$(STR$(I(I)),2);" ";:GOTO 20355
20352 PRINT"    ";
20355 PRINT :GOTO 20380
20365 PRINT STR$(I(I))" "MA$(I)
20380 NEXT I
20390 GOSUB 20399:PRINT"                ";
20396 RETURN
20398 X=60:GOSUB 200:RETURN
20399 X=35:Y=K:K=K+1:GOSUB 200:RETURN
20400 IF POS(0)<8 THEN PRINT" ";:GOTO 20400
20410 RETURN
20600 X=23:Y=19:GOSUB 200:PRINT"               "
20605 GOSUB 17000:X=11:Y=8:GOSUB 200:PRINT" ":RETURN
20700 UN=0:IF M=3 OR M=5 OR M=8 OR M=10 OR M=13 OR M=17 OR M=18 THEN UN=1
20705 RETURN
20800 C=0:INPUT C:RETURN
20900 GOSUB 16500:PRINT"YOU HAVE NOT BEEN NOTICED..."
20905 PRINT"<RET> TO APPROACH:";:GOSUB 16000
20910 IF C$=CHR$(13) THEN GOSUB 17000:GOTO 3007
20915 X=11:Y=8:GOSUB 200:PRINT" ":GOSUB 17000:GOTO 4000
21000 PRINT"CAST":PRINT"SPELL LEVEL:";:GOSUB 16000:C=VAL(C$):PRINT C$
21002 IF C>0 AND C<=INT(LV/3)+1 AND C<7 THEN 21010
21004 IF C=0 THEN 21910
21005 PRINT"YOU DON'T HAVE THAT LEVEL SPELLS!";:GOSUB 19000:GOTO 21910
21010 IF C>CS THEN PRINT"YOU DON'T HAVE ENOUGH SPELL UNITS!";:GOTO 21900
21020 PRINT"SPELL( = TO LIST):";:GOSUB 16000:IF C$=CHR$(13) OR C$="&" THEN 21910
21025 IF C$<"1" OR C$>"6" THEN C$="="
21030 IF C$="=" THEN 21040
21035 CS=CS-C:GOSUB 20250:GOSUB 17000:PRINT TAB(18);:GOTO 21050
21040 GOSUB 17000:FOR I=1 TO 3:PRINT I;LEFT$(SP$(I+6*(C-1)),29);
21045 PRINT TAB(30);I+3;LEFT$(SP$(I+3+6*(C-1)),29) :NEXT I
21046 PRINT"PRESS ANY KEY TO CONTINUE...";:GOSUB 16000:GOSUB 17000
21047 IF C$<"1" OR C$>"6" THEN 21020
21048 GOTO 21035
21050 S=VAL(C$):ON C GOTO 22000,23000,24000,25000,26000,27000
21700 MH=MH-I:PRINT"IT SUFFERS"I"HIT POINTS":IF MH>0 THEN 21900
21705 GOTO 3220
21750 PRINT"NOT IN MELEE!!":GOSUB 17500:GOTO 3300
21800 PRINT"YOU JUST WASTED A COMBAT SPELL!"
21900 GOSUB 17500:IF D=1 THEN 3300
21905 GOTO 8000
21910 GOSUB 17000:IF D=1 THEN 3100
21915 GOTO 8000
21920 GOSUB 17500:GOSUB 20600:GOTO 4000
21930 PRINT"UNDEAD ARE ALREADY DEAD!!":GOTO 21900
22000 ON S GOTO 22100,22200,22300,22400,22500,22600
22100 PRINT SP$(1):GOSUB 17500:IF D=0 THEN 21800
22105 I=INT(RND(1)*8+5):GOTO 21700
22200 PRINT SP$(2):GOSUB 17500:IF D=0 THEN 21800
22202 IF UN=1 THEN PRINT"UNDEAD DON'T SLEEP!":GOTO 3300
22205 IF INT(RND(1)*20+1)>ST(1) THEN PRINT"THE "M$" ISN'T SLEEPY!":GOTO 3300
22210 PRINT"THE "M$" IS SLEEPING":PRINT"PRESS <RET> TO KILL:";:GOSUB 16000
22215 IF C$<>CHR$(13) THEN GOSUB 17000:GOTO 3710
22220 IF RND(1)>.2 THEN 3220
22225 PRINT"IT WOKE UP!!":GOSUB 19000:GOTO 3300
22300 PRINT SP$(3):I=INT(RND(1)*8+1):PRINT"YOU FEEL BETTER":CH=CH+I
22305 IF CH>HP THEN CH=HP
22310 GOSUB 20260:GOTO 21900
22400 S=4:T=3:U=11
22402 PRINT SP$(S):IF SF(T)<0 THEN SF(T)=0
22405 SF(T)=SF(T)+INT(RND(1)*U+5):GOTO 21900
22500 PRINT SP$(5):GOSUB 17500:IF D=0 THEN 21800
22505 IF UN=1 THEN 22515
22510 PRINT"THE "M$" IS INSULTED":PRINT"AT BEING CALLED UNDEAD":GOTO 21900
22515 IF RND(1)<.05*ST(2)+.05*LV-.05*ML THEN 22525
22520 PRINT"THE "M$" LISTENS WITH DEAF EARS":GOTO 21900
22525 ML=INT((ML/2)+.5):PRINT"IT RUNS IN FEAR!!":GOTO 3223
22600 S=6:T=4:U=11:GOTO 22402
23000 ON S GOTO 23100,23200,23300,23400,23500,23600
23100 PRINT SP$(7):GOSUB 17500:IF D=0 THEN 21800
23105 IF INT(RND(1)^2*20+ML)>ST(1) THEN PRINT"THE "M$" DODGES ASIDE!":GOTO 3300
23110 PRINT"THE "M$" IS WEBBED!":PRINT"PRESS <RET> TO KILL:";:GOSUB 16000
23115 IF C$<>CHR$(13) THEN GOSUB 17000:GOTO 3710
23120 IF RND(1)-ML/20>.2 THEN 3220
23125 PRINT"IT BROKE FREE!!":GOSUB 19000:GOTO 3300
23200 S=8:T=5:U=21:GOTO 22402
23300 PRINT SP$(9):GOSUB 17500:IF D=0 THEN 21800
23305 I=INT(RND(1)*12+3):GOTO 21700
23400 S=10:T=2:U=21:GOTO 22402
23500 PRINT SP$(11):GOSUB 17000:IF D=0 THEN 21800
23502 IF UN=1 THEN PRINT"THE UNDEAD IGNORE YOUR WILES!":GOTO 3300
23505 IF INT((RND(1)^2)*20+1)>ST(5) THEN PRINT"THE "M$" RESISTS YOU!":GOTO 3300
23510 PRINT"THE "M$" IS CHARMED":PRINT"PRESS <RET> TO KILL:";:GOSUB 16000
23515 GOTO 23115
23600 S=12:T=1:U=21:GOTO 22402
24000 ON S GOTO 24100,24200,24300,24400,24500,24600
24100 PRINT SP$(13):PRINT"ZZZZAAAAPP!!!":IF D=0 THEN 21800
24105 GOSUB 19000:I=INT(RND(1)*6*LV+15):GOTO 21700
24200 PRINT SP$(14):I=INT(RND(1)*24+1):PRINT"YOU FEEL BETTER":CH=CH+I
24205 IF CH>HP THEN CH=HP
24210 GOSUB 20260:GOTO 21900
24300 S=15:T=3:U=31:GOTO 22402
24400 S=16:T=6:U=21:GOTO 22402
24500 PRINT SP$(17):GOSUB 17500:IF D=0 THEN 21800
24505 IF INT(RND(1)*20+ML)>ST(1) THEN PRINT"THE "M$" IGNORES YOU!":GOTO 3300
24510 PRINT"THE "M$" IS HELD!":PRINT"PRESS <RET> TO KILL:";:GOSUB 16000
24515 IF C$<>CHR$(13) THEN GOSUB 17000:GOTO 3710
24520 IF RND(1)>.2+ML*.03 THEN 3220
24525 PRINT"IT BROKE FREE!!":GOSUB 19000:GOTO 3300
24600 PRINT SP$(18):GOSUB 17500:IF D=0 THEN 21800
24605 IF INT(RND(1)*22+ML)<ST(1) THEN 24615
24610 PRINT"THE "M$" DOESN'T BELEIVE!":GOTO 3300
24615 PRINT"IT BELIEVES!....ARRGH...":GOTO 3220
25000 ON S GOTO 25100,25200,25300,25400,25500,25600
25100 PRINT SP$(19):GOSUB 17500:IF D=1 THEN 21750
25105 PRINT"DIRECTION>";:GOSUB 16000
25110 FOR I=1 TO 9:IF MID$("WXAD8246&",I,1)=C$ THEN 25117
25115 NEXT I:PRINT"???":GOSUB 17000:GOTO 25105
25117 IF I>4 THEN I=I-4
25118 IF I=5 THEN 21900
25120 IF (I=1 AND CY>1) OR (I=2 AND CY<200) OR (I=3 AND CX>1) OR (I=4 AND CX<200) THEN 25125
25122 PRINT"ONLY STONE THERE....":GOTO 21900
25125 GOSUB 30200:PRINT"&&&& POOF &&&&":ON I GOTO 8155,8205,8255,8305
25200 PRINT SP$(20):GOSUB 17000:PRINT"WHOOOOOSHH!!!":IF D=0 THEN 21800
25205 PRINT"THE "M$" IS BURNING!":I=INT(RND(1)*12*LV+15):GOSUB 19000:GOTO 21700
25300 PRINT SP$(21):GOSUB 17500:IF D=0 THEN 21800
25305 I=INT(RND(1)*32+10):GOTO 21700
25400 PRINT SP$(22):GOSUB 17500:IF D=0 THEN 21800
25405 IF RND(1)>.6 THEN PRINT"THE "M$" ISN'T AFFECTED":GOTO 3300
25410 PRINT"ONE STONE STATUE....":GOTO 3220
25500 S=23:T=7:U=30:GOTO 22402
25600 PRINT SP$(24):GOSUB 17500:PRINT" DIE!!!!!!":IF D=0 THEN 21800
25603 IF UN=1 THEN 21930
25605 GOSUB 19000:IF RND(1)>.3+ML*.04-LV*.03 THEN 3220
25610 PRINT"THE "M$" LAUGHS!":GOSUB 17500:GOTO 3300
26000 ON S GOTO 26100,26200,26300,26400,26500,26600
26100 PRINT SP$(25):GOSUB 17500:IF D=1 THEN 21750
26105 PRINT"+NORTH/-SOUTH:";:GOSUB 20800:NY=C:PRINT"+EAST/-WEST:";:GOSUB 20800
26110 NX=C:PRINT"+UP/-DOWN:";:GOSUB 20800:NZ=C:I=SQR(NX^2+NY^2+(NZ*5)^2)-.1
26115 IF I>LV*5 THEN PRINT"TOO FAR...TRY AGAIN";:GOSUB 17500:GOTO 26105
26120 NX=CX+NX:NY=CY-NY:NZ=CZ-NZ
26125 IF NX>0 AND NX<201 AND NY>0 AND NY<201 AND NZ<51 THEN 26135
26130 PRINT"ONLY STONE THERE....THE SPELL FAILS..";:GOTO 21900
26135 IF NZ<1 THEN PRINT"ONLY THIN AIR...THE SPELL FAILS";:GOTO 21900
26140 CX=NX:CY=NY:CZ=NZ:GOSUB 17000:PRINT"***POOF!***":GOSUB 30200:GOTO 2000
26200 S=26:T=8:U=16:GOTO 22402
26300 PRINT SP$(27):GOSUB 17500:IF D=0 THEN 21800
26305 PRINT"QWERTY!!!!":GOSUB 19000:IF RND(1)<.75 THEN 3220
26310 PRINT" THE "M$" DOESN'T HEAR...":GOTO 21900
26400 PRINT SP$(28):GOSUB 17500:IF D=0 THEN 21800
26405 PRINT"BRRRR!!!!":I=60:GOTO 21700
26500 PRINT SP$(29):GOSUB 17500:X=12:Y=9:GOSUB 200:PRINT"*":GOSUB 16500:PRINT"WWHHOOOOOSSHHH!!!"
26505 PRINT"A WALL OF FIRE APPEARS ABOUT YOU":GOSUB 19000:GOSUB 17500
26507 IF D=0 THEN X=11:Y=8:GOSUB 200:PRINT "X":GOTO 21800
26510 X=12:Y=9:GOSUB 200:PRINT"X":GOSUB 17000:IF RND(1)>.4 THEN PRINT"THE "M$" IS GONE":X=11:Y=8:GOSUB 200:PRINT" ":GOTO 21920
26515 PRINT"THE "M$" WALKS THROUGH!!!":I=INT(RND(1)*12+8):GOTO 21700
26600 PRINT SP$(30):GOSUB 17500:IF D=0 THEN 21800
26605 IF UN=1 THEN 21930
26610 PRINT"BLACK DEATH FOR THE "M$
26615 GOSUB 17500:IF RND(1)>ST(2)*.05 THEN PRINT"IT IS IMMUNE!":GOTO 21900
26620 IF RND(1)*2<ST(3)*.03+1 THEN 3220
26625 PRINT"THE SPELL BACKFIRES!!":GOSUB 17500:GOTO 9000
27000 ON S GOTO 27100,27200,27300,27400,27500,27600
27100 PRINT SP$(31):GOSUB 17500
27102 PRINT "TIME IS FROZEN, MONSTERS CANNOT":PRINT"ATTACK YOU"
27105 GOSUB 17500:IF SF(9)<0 THEN SF(9)=0
27110 SF(9)=SF(9)+FNR(20)+4:IF D=1 THEN GOSUB 20600:GOTO 4000
27115 GOTO 21900
27200 S=32:T=10:U=40:GOTO 22402
27205 PRINT SP$(32):GOSUB 17500:ST(3)=ST(3)-1
27207 SF(10)=0:IF RND(1)>ST(3)*.06 THEN 27220
27210 PRINT"IT WORKS!!":CH=HP:GOSUB 20300:GOTO 21900
27220 PRINT"IT DOESN'T WORK!":GOTO 9000
27300 PRINT SP$(33):GOSUB 17500:IF D=0 THEN 21800
27305 X=20:Y=20:FOR U=1 TO 9:GOSUB 200:PRINT MID$(".+*#&?% ",U,1)" ":GOSUB 19500:NEXT U
27307 GOSUB 19000:IF RND(1)<.9 THEN 3220
27310 PRINT"THE "M$" DOESN'T SEE...":GOTO 21900
27400 PRINT SP$(34):GOSUB 17500:IF D=1 THEN 21750
27405 FOR I=0 TO 10:I(I)=0:NEXT I:GD=0:PRINT CL$;:GOSUB 20300:GOSUB 30200
27410 CX=25:CY=13:CZ=1:PRINT"***ZAP!!***":GOSUB 19000:GOTO 2000
27500 PRINT SP$(35):GOSUB 17500:PRINT"YOU FEEL BETTER!":CH=HP:GOSUB 20260
27505 GOTO 21900
27600 PRINT SP$(36):GOSUB 17500:PRINT"A SHIFTING MULTI-COLORED WALL APPEARS"
27605 IF D=0 THEN 21800
27610 X=12:Y=9:FOR J=1 TO 16:GOSUB 200:PRINT"*":GOSUB 19500:GOSUB 200:PRINT "+":GOSUB 19500:NEXT J
27615 X=11:Y=8:GOSUB 200:PRINT" ":X=12:Y=9:GOSUB 200:PRINT"X":GOSUB 17000:PRINT"THE "M$" IS GONE":GOTO 21920
30000 M=0:IF FM(1)=0 THEN 30020
30010 M=FM(1):ML=FL(1):MH=FH(1):GOSUB 20700
30020 FOR I=1 TO 19:FM(I)=FM(I+1):FL(I)=FL(I+1):FH(I)=FH(I+1):NEXT I
30022 FM(20)=0:FL(20)=0:FH(20)=0:IF M<>0 THEN X=11:Y=8:GOSUB 200:PRINT"#"
30025 X=27:FOR Q=1 TO 20:Y=Q-1:GOSUB 200:IF FM(Q)=0 THEN PRINT" " ELSE PRINT CHR$(27)+")#"+CHR$(27)+"("
30040 NEXT Q:RETURN
30100 FOR Q=19 TO 1 STEP -1:FM(Q+1)=FM(Q):FL(Q+1)=FL(Q):FH(Q+1)=FH(Q):NEXT Q
30105 IF M=0 THEN FM(1)=0:FL(1)=0:FH(1)=0:GOTO 30025
30110 FM(1)=M:FL(1)=ML:FH(1)=MH:GOTO 30025
30200 FOR Q=1 TO 20:FM(Q)=0:FL(Q)=0:FH(Q)=0:NEXT Q:GOTO 30025
32000 REM *MACHINE ROUTINE LOAD*
32005 RETURN
32767 GOSUB 19000:END
