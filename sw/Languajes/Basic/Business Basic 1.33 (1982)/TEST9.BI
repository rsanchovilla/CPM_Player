� LOCK MERGE   
 1"ERROR PROCESSING TEST"
  'CR'   "TESTING ERROR PROCESSING"
  5001    "WRITING FILES FOR TEST"D  "ERRTF1",4,5,5,0,ERR=23!"loop until other process erases file"  "ERRTF2",5,5,0  1"OPEN DIR FILE FOR TEST"  (1)"ERRTF1" # 1"OPEN IND FILE FOR TEST" ( (2)"ERRTF2" 2 )ERR1000 < "DOM ERROR BRANCH"1 F !(1,ERR=2000,END=2100,DOM=1100,KEY="1111")B$4 P "dom branch not taken -- error not recognized" Z "END BRANCH" d I=1TO6 n !(2,ERR=2000,END=1200)C$ x I  � "end error not recognized" � "ERR BRANCH" � (3,ERR=1300) � "error branch not taken": � "SETERR BRANCH AND MEMORY OVERFLOW ERROR PROCESSING" � )ERR1400 � S(2000)% � "overflow error not recognized") � "ERR BRANCHING FROM BASIC FUNCTION" � X=FPT("e",ERR=1500) � "err branch not taken"
 � 3000( �"seterr branch taken unexpectedly"
 �3000# L1"BRANCH HERE ON DOM ERROR OK" `90# �1"BRANCH HERE ON END ERROR OK"	 �140$ 1"BRANCH HERE ON ERR BRANCH OK"	 (1705 x1"BRANCH HERE FROM SETERR ON MEMORY OVERFLOW OK"	 �200( �1"BRANCH HERE FROM FUNCTION ERR OK"
 �4000 �"unexpected err branch"
 �3000 4"unexpected end branch"
 >3000
 �5000* �"EXITING PROGRAM VIA ESCAPE COMMAND" �
 �5000' �"ERROR PROCESSING TEST COMPLETED" � �'"TEST10"! �"finished regression tests" �+ �"ERASING TEST FILES" �(1,ERR=5011) �(2,ERR=5021) �
"errtf1",ERR=5031 �
"errtf2",ERR=5041 �& '	    �SAVE"TEST9",PSZ,1,1         