
[mbasic.symbol_len.diff] 
==== 8< ==== 
--- BINTRP.MAC 
+++ BINTRP.MAC 
@@ -2490,17 +2490,17 @@ 
  NOTFN2:        PUSH        PSW                        ;SAVE CHAR TO BE SAVE D IN KRUNCH BUFFER 
          LXI        B,NOTRS2                ;WHERE TO GO IF NOT LINE NUMBER RESWRD 
          PUSH        B                        ;SAVE LABEL ADDRESS ON STACK 
-        CPI        $RESTOR                        ;RESTORE CAN HAVE FOLLOWING LINE NUMBER 
+        CPI        $RESTO                        ;RESTORE CAN HAVE FOLLOWING LINE NUMBER 
          RZ         
          CPI        $AUTO                        ;AUTO COMMAND 
          RZ                                ;SCAN LINE RANGE &CRUNCH 
          CPI        $RENUM                        ;RENUMBER? 
          RZ         
-        CPI        $DELETE                        ;DELETE? 
+        CPI        $DELET                        ;DELETE? 
          RZ                                ;IF SO, CRUNCH FOLLOWING LINE # 
          CPI        $EDIT                        ;EDIT? 
          RZ         
-        CPI        $RESUME                        ;RESUME? 
+        CPI        $RESUM                        ;RESUME? 
          RZ                                ;CRUNCH FOLLOWING LINE NUMBER 
          CPI        $ERL                        ;ERROR LINE 
          RZ                                ;CRUNCH FOLLOWING LINE NUMBER 
@@ -4591,7 +4591,7 @@ 
          POP        H                        ;RESTORE TEXT POINTER 
          RET                                ;RETURN 
  NTERL: 
-        CPI        $VARPTR                        ;VARPTR CALL? 
+        CPI        $VARPT                        ;VARPTR CALL? 
          JNZ        NTVARP                        ;NO 
          CALL        CHRGTR                        ;EAT CHAR AFTER 
          CALL        SYNCHR 
@@ -4627,7 +4627,7 @@ 
          EXTRN        INKEY 
          CPI        $INKEY                        ;INKEY$ FUNCTION? 
          JZ        INKEY                        ;GO DO IT 
-        CPI        $STRING                        ;STRING FUNCTION? 
+        CPI        $STRIN                        ;STRING FUNCTION? 
          JZ        STRNG$                        ;YES, GO DO IT 
          EXTRN        FIXINP 
          CPI        $INPUT                        ;FIXED LENGTH INPUT? 
@@ -5401,7 +5401,7 @@ 
  ; ARG MUST BE .GT. 15 AND .LT. 255 

  WIDTH: 
-        CPI        $LPRINT                        ;WIDTH LPRINT? 
+        CPI        $LPRIN                        ;WIDTH LPRINT? 
          JNZ        NOTWLP                        ;NO 
          CALL        CHRGTR                        ;FETCH NEXT CHAR 
          CALL        GETBYT                        ;GET WIDTH 
--- DCPM.MAC 
+++ DCPM.MAC 
@@ -359,7 +359,7 @@ 
  ;        ((SP)) points to File Data Block 

          CALL        SETBUF                        ;SET DMA ADDRESS 
-        MVI        C,C.CLOSE                ;THE CLOSE 
+        MVI        C,C.CLOS                ;THE CLOSE 
          CALL        CPMENT                        ;CALL CPM 
  ;*****        NO CHECK FOR ERRORS 

==== 8< ==== 


[mbasic.messages.diff] 
==== 8< ==== 
--- BINTRP.MAC 
+++ BINTRP.MAC 
@@ -1819,8 +1819,7 @@ 
  INTXT:        DB        ' in ' 
          DB        0 
  REDDY: 
-        DB        10 
-        DB        'Ready' 
+        DB        'Ok' 
          DB        13 
          DB        10 
          DB        0 
--- INIT.MAC 
+++ INIT.MAC 
@@ -136,6 +136,9 @@ 

          MVI        C,12                        ;Version Test 
          CALL        CPMENT 
+ 
+        NOP 
+ 
          STA        CPMVRN                        ;[A] = Version Number (0 = 1.x) 
          ORA        A                        ;Test version number 
          LXI        H,21*256+20+0                ;1.x Read / Write 
@@ -394,22 +397,22 @@ 
          DB        0 


-WORDS:        DB        ' Bytes Free' 
+WORDS:        DB        ' Bytes free' 
          DB        0 
  HEDING: 
-        DB        26 
-        DB        'BASIC 5.2' 
+        DB        'BASIC-80 Rev. 5.2' 
          DB        13 
          DB        10 



-        DB        'MAGIC Operating System' 
+        DB        '[CP/M Version]' 
          DB        13 
          DB        10 
-        DB        '    Copyright 1982 (C)' 
+        DB        'Copyright 1977, 78, 79, 80 (C) by Microsoft' 
+        DB        13,10 
+        DB        'Created: 14-Jul-80' 
          DB        13,10 
-        DB        32,32,32,32,32 
          DB        0 
  LASTWR::                                ;LAST WORD OF SYSTEM CODE+1 
          DS        70+300*0+200*0+30*0        ;SPACE FOR TEMP STACK 
==== 8< ==== 


[mbasic.dc_to_db.diff] 
==== 8< ==== 
--- BINTRP.MAC 
+++ BINTRP.MAC 
@@ -1816,15 +1816,15 @@ 
  ; 
  ; NEEDED FOR MESSAGES IN ALL VERSIONS 
  ; 
-INTXT:        DC        ' in ' 
+INTXT:        DB        ' in ' 
          DB        0 
  REDDY: 
          DB        10 
-        DC        'Ready' 
+        DB        'Ready' 
          DB        13 
          DB        10 
          DB        0 
-BRKTXT:        DC        'Break' 
+BRKTXT:        DB        'Break' 
          DB        0 

          PAGE 
@@ -3897,7 +3897,7 @@ 
          MVI        A,3                        ;SET THREE FOR STRING 
          JMP        LETCN2                        ;DO THE ASSIGNMENT 
  TRYAGN: 
-        DC        '?Redo from start' 
+        DB        '?Redo from start' 
          DB        13 
          DB        10 
          DB        0 
@@ -6022,7 +6022,7 @@ 
          DCX        H                        ;BACKUP POINTER 
          JMP        SCNEXT                        ;KEEP SCANNING 

-LINM:        DC        'Undefined line ' 
+LINM:        DB        'Undefined line ' 
          DB        0 

  SCNPT2:        CPI        PTRCON                        ;POINTER 
@@ -6128,7 +6128,7 @@ 
          CALL        RNDMN2 
          POP        H                        ;GET BACK THE TEXT POINTER 
          RET         
-RANMES:        DC        'Random number seed (-32768-  to 32767)' 
+RANMES:        DB        'Random number seed (-32768-  to 32767)' 
          DB        0 

  ; 
--- INIT.MAC 
+++ INIT.MAC 
@@ -388,26 +388,26 @@ 
  AUTTXT:        DB        13 
          DB        10 
          DB        10 
-        DC        'Owned by Microsoft' 
+        DB        'Owned by Microsoft' 
          DB        13 
          DB        10 
          DB        0 


-WORDS:        DC        ' Bytes Free' 
+WORDS:        DB        ' Bytes Free' 
          DB        0 
  HEDING: 
          DB        26 
-        DC        'BASIC 5.2' 
+        DB        'BASIC 5.2' 
          DB        13 
          DB        10 



-        DC        'MAGIC Operating System' 
+        DB        'MAGIC Operating System' 
          DB        13 
          DB        10 
-        DC        '    Copyright 1982 (C)' 
+        DB        '    Copyright 1982 (C)' 
          DB        13,10 
          DB        32,32,32,32,32 
          DB        0 
==== 8< ==== 


Since the whole fun here is making the few changes by hand and 
reassembling, I post these diffs above *only* in this form :-) 


But to make it a little easier, here is the build script. 

[build.sub] 
==== 8< ==== 
xsub 
m80 BIEDIT,BIEDIT=BIEDIT/m 
m80 BIMISC,BIMISC=BIMISC/m 
m80 BINLIN,BINLIN=BINLIN/m 
m80 BINTRP,BINTRP=BINTRP/m 
m80 BIO,BIO=BIO/m 
m80 BIPRTU,BIPRTU=BIPRTU/m 
m80 BIPTRG,BIPTRG=BIPTRG/m 
m80 BISTRS,BISTRS=BISTRS/m 
m80 DCPM,DCPM=DCPM/m 
m80 DSKCOM,DSKCOM=DSKCOM/m 
m80 F4,F4=F4/m 
m80 FIVDSK,FIVDSK=FIVDSK/m 
m80 FIVEO,FIVEO=FIVEO/m 
m80 INIT,INIT=INIT/m 
l80 
/p:100 
BINTRP 
F4 
BIPTRG 
BIEDIT 
BIPRTU 
BIO 
BIMISC 
BISTRS 
BINLIN 
FIVEO 
DSKCOM 
DCPM 
FIVDSK 
INIT 
MBASIC/n 
/y 
/e 
==== 8< ==== 

Success, binary identical !!! 


Merry christmas