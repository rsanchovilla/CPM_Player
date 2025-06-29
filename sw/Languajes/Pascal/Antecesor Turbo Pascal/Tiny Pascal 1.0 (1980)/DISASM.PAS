CONST

  INT=22;JMP=24;JPC0=26;JPC1=28;
  RET0=46;
  OUTSTR=102;


  BCALL=%28;BMW=%22;BINP=%6A;BPLOT=%6E;BABS=%72;BMOVE=%76;
  BMEM=%20;BINKEY=%68;BOUTP=%6C; BPOINT=%70;BSQRT=%74;

  LIT0=30;LIT=0;LOD=2;
  INCT=42;DECT=44;
  LODX=6;NOT0=78;
  MUL0=54;DIV0=56;AND0=76;MOD0=60;SHL0=80;SHR0=82;
  NEG0=48;ADD0=50;SUB0=52; OR0 =74;
  EQU0=62;NEQ0=64;LT0 =66;GEQ0=68;GT0 =70;LEQ0=72;
  CPY0=88;
  CAL=18;
  STO=10;STOX=14;
  OUTHEX=100;OUTCH=92;OUTNUM=96;
  INNUM=94;INHEX=98;INCH=90;
  INC0=84;DEC0=86;
  
  
  ODD0=58;
  

VAR MADDR,KADDR,
    OP,P1,M1:INTEGER;
   
   
PROC WRTB(B);
VAR C: INTEGER;
BEGIN
   C := B SHR 4;
   IF C < 10 THEN C:=C+'0' ELSE C:=C+'A'-10;
   WRITE(C);
   C:= B AND 15; 
   IF C < 10 THEN C:=C+'0' ELSE C:=C+'A'-10;
   WRITE(C);
END;   
    
FUNC GETP;    
BEGIN
   GETP := MEMW(MADDR); MADDR:=MADDR+2;
END;

FUNC GETB;    
BEGIN
   GETB := MEM(MADDR); MADDR:=MADDR+1;
END;

PROC WRP1(P1);
BEGIN
   WRITE(' ');
   WRTB(P1 AND 255);
   WRITE(' ');
   WRTB(P1 SHR 8);
   WRITE(' ');
END;

PROC DIS;
BEGIN
   OP := GETB;
   WRITE('*> ',MADDR-KADDR%, ': '); WRTB(OP);
   CASE OP OF
     BCALL: WRITE('        ; Predef CALL');
      BMW:  WRITE('        ; Predef MEMW');
      BINP: WRITE('        ; Predef INP');
     BPLOT: WRITE('        ; Predef PLOT');
      BABS: WRITE('        ; Predef ABS');
     BMOVE: WRITE('        ; Predef MOVE');
      BMEM: WRITE('        ; Predef MEM');
    BINKEY: WRITE('        ; Predef INKEY');
     BOUTP: WRITE('        ; Predef OUTP');
    BPOINT: WRITE('        ; Predef POINT');
     BSQRT: WRITE('        ; Predef SQRT');

      RET0: WRITE('        ; RET0');
      INCT: WRITE('        ; INCT');
      DECT: WRITE('        ; DECT');
      NOT0: WRITE('        ; NOT0');
      MUL0: WRITE('        ; MUL0');
      DIV0: WRITE('        ; DIV0');
      AND0: WRITE('        ; AND0');
      MOD0: WRITE('        ; MOD0');
      SHL0: WRITE('        ; SHL0');
      SHR0: WRITE('        ; SHR0');
      NEG0: WRITE('        ; NEG0');
      ADD0: WRITE('        ; ADD0');
      SUB0: WRITE('        ; SUB0');
      OR0 : WRITE('        ; OR0');
      EQU0: WRITE('        ; EQU0');
      NEQ0: WRITE('        ; NEQ0');
      LT0 : WRITE('        ; LT0');
      GEQ0: WRITE('        ; GEQ0');
      GT0 : WRITE('        ; GT0');
      LEQ0: WRITE('        ; LEQ0');
      LIT0: WRITE('        ; LIT0');
      INC0: WRITE('        ; INC0');
      DEC0: WRITE('        ; DEC0');
      CPY0: WRITE('        ; CPY0');
    OUTHEX: WRITE('        ; OUTHEX');
     OUTCH: WRITE('        ; OUTCH');
    OUTNUM: WRITE('        ; OUTNUM');
     INHEX: WRITE('        ; INHEX');
      INCH: WRITE('        ; INCH');
     INNUM: WRITE('        ; INNUM');
      12: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; STO2 ADDR ', P1%);
         END; 
      CAL: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; CAL ADDR ', P1%);
         END; 
      JPC0: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; JPC0 ADDR ', P1%);
         END; 
      JPC1: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; JPC1 ADDR ', P1%);
         END; 
      JMP: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; JMP ADDR ', P1%);
         END; 
      INT: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; INT ', P1#);
         END; 
      LIT: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; LIT ', P1#,' (', P1%,')');
         END; 
      LOD: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; LOD ', P1#);
         END; 
      LODX: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; LODX ', P1#);
         END; 
      STO: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; STO ', P1#);
         END; 
      STOX: BEGIN
         P1 :=GETP; WRP1(P1); WRITE(' ; STOX ', P1#);
         END; 
      OUTSTR: BEGIN
         M1:=MADDR;
         REPEAT
            P1 :=GETB; 
            WRITE(P1%, ' '); 
         UNTIL P1 = 0;
         MADDR := M1;
         WRITE('; OUTSTR "');
         REPEAT
            P1 :=GETB; 
            IF P1 <> 0 THEN WRITE(P1); 
         UNTIL P1 = 0;
         WRITE('"');
         END
   END;   
   WRITE(13);
END;

BEGIN
   MADDR:=%5FC0;
   KADDR:=MADDR;
   REPEAT
      DIS;
   UNTIL MEM(MADDR)=255;
     
END.
