{$U+}
{.P8}
{GRAFIKS-TOOL-BOX FOR KC}
TYPE
         PARATYPE         = STRING [2] ;
         BLOCKTYPE        = ARRAY [0..255] OF BYTE ;
         HEXSTRING        = STRING [254] ;
         FILENAME         = STRING [ 10] ;
         FIELD            = ARRAY [ 0..255] OF ARRAY [0..1] OF REAL ;
VAR         II,JJ : INTEGER;
            BLOCK4 : BOOLEAN ;
      ZEITZEICHEN  : STRING [9] ;
      ZEITOLD      : STRING [9] ;
      KEY          : CHAR ;
CONST
         MEMANF           =$FFAE ;
         SYSCONTR         =$FFB6 ;
PROCEDURE WZB ( X : REAL; VAR XCHR : PARATYPE ) ;
{ CHANGE 2 BYTE IN CHAR }
VAR      Z                   :INTEGER ;
         XL,XH               :CHAR ;
  BEGIN
    Z:=ROUND (X) ;
    XL:=CHR(LO(Z));
    XH:=CHR(HI(Z));
    XCHR:=CONCAT(XL,XH) ;
  END;
PROCEDURE ADRCHAR ( X : INTEGER ; VAR XCHR : PARATYPE ) ;
{ WANDELT INTEGERWERT IN 2 BYTE CHARACTER }
VAR      XL,XH               :CHAR ;
  BEGIN
   XL:=CHR (LO(X)) ;
   XH:=CHR (HI(X)) ;
   XCHR:=CONCAT (XL,XH) ;
  END;

PROCEDURE WEB ( Y : REAL ; VAR  YCHR: CHAR ) ;
{ CHANGE 1 BYTE IN CHAR }
  BEGIN
    YCHR:=CHR(TRUNC(Y));
  END;

PROCEDURE ESC ( ACHR : CHAR ) ;
VAR       ESCAPE    :CHAR ;
{ OUTPUT 'ESCAPE','CHARACTER' TO TERMINAL }
  BEGIN
    ESCAPE:=CHR (27) ;
    WRITE ( ESCAPE ,ACHR ) ;
  END ;

PROCEDURE WEBWRITE ( T1,V1,T2,V2,L : INTEGER ) ;
{ CHANGE PARAMETERLIST AND SEND TO TERMINAL }
VAR           YCHR        : CHAR ;
  BEGIN
    WEB ( T1, YCHR ) ;
    WRITE ( YCHR ) ;
    WEB ( V1, YCHR ) ;
    WRITE ( YCHR) ;
    WEB ( T2 , YCHR) ;
    WRITE (YCHR) ;
    WEB ( V2 , YCHR ) ;
    WRITE ( YCHR ) ;
    WEB ( L , YCHR ) ;
    WRITE ( YCHR ) ;
  END ;

{ GRUNDROUTINEN ZUR TERMINALSTEUERUNG }

PROCEDURE PSET ( X,Y : REAL ) ;
VAR       XCHR          : PARATYPE ;
          YCHR          : CHAR ;
{ SET POINT ON TERMINAL }
  BEGIN
    ESC ('A');
    WZB (X,XCHR) ;
    WEB (Y,YCHR) ;
    WRITE ( XCHR,YCHR) ;
  END ;

PROCEDURE PRES (X,Y : REAL) ;
VAR      XCHR            : PARATYPE ;
         YCHR            : CHAR ;
{ DELETE POINT ON TERMINAL }
  BEGIN
    ESC ('B') ;
    WZB (X,XCHR) ;
    WEB (Y,YCHR) ;
    WRITE ( XCHR,YCHR ) ;
  END ;

PROCEDURE GFARB (F: BYTE) ;
{ SET GRAPHIK COLOR }
VAR     YCHR             : CHAR ;
BEGIN
  ESC ('C') ;
  WEB ( F,YCHR) ;
  WRITE (YCHR) ;
END ;

PROCEDURE LINE ( X1,Y1,X2,Y2 : REAL ) ;
VAR         XCHR,XCHR1        :PARATYPE;
            YCHR1,YCHR        : CHAR ;
{ LINE FOR TERMINAL }
  BEGIN
    ESC ('D');
    WZB (X1,XCHR) ;
    WZB (X2,XCHR1) ;
    WEB (Y1,YCHR) ;
    WEB (Y2,YCHR1) ;
    WRITE (XCHR,YCHR,XCHR1,YCHR1) ;
  END ;

PROCEDURE CIRCL ( X,Y,R : REAL ) ;
VAR         XCHR                   : PARATYPE ;
            YCHR,RCHR              : CHAR ;
{ CIRCLE FOR TERMINAL }
  BEGIN
    ESC ('E') ;
    WZB (X,XCHR) ;
    WEB (Y,YCHR) ;
    WEB (R,RCHR) ;
    WRITE ( XCHR,YCHR,RCHR ) ;
  END ;

PROCEDURE WINDOW ( N : INTEGER ) ;
{ CALL WINDOW NR N }
  BEGIN
    ESC ('F') ;
    WRITE (CHR (N) ) ;
  END ;

PROCEDURE SOUND ( T1,V1,T2,V2,L,Z : INTEGER ) ;
VAR       YCHR                      : CHAR ;
  BEGIN
    ESC ('G') ;
    WEBWRITE ( T1,V1,T2,V2,L ) ;
    WEB ( Z, YCHR ) ;
    WRITE ( YCHR ) ;
  END ;

PROCEDURE COLORZ ( F,B : BYTE ) ;
{ TEXTCOLOR }
  BEGIN
    ESC ('H') ;
    WRITE ( CHR(F),CHR(B) ) ;
  END ;

PROCEDURE WININ ( N,X1,Y1,X2,Y2 : INTEGER ) ;
VAR       YCHR                  : PARATYPE ;
  BEGIN
   ESC ('L') ;
   WEBWRITE ( N,X1,Y1,X2,Y2 ) ;
  END ;

PROCEDURE CLSG ;
{ CLEAR GRAFIK SCREN }
  BEGIN
    ESC ('M') ;
  END ;

PROCEDURE INK ( F:BYTE ) ;
VAR     FCHR        : CHAR ;
  BEGIN
    ESC ('N') ;
    WEB (F,FCHR) ;
    WRITE (FCHR) ;
  END ;

PROCEDURE PAPER ( F:BYTE ) ;
VAR     FCHR       : CHAR ;
  BEGIN
    ESC ('O') ;
    WEB (F,FCHR) ;
    WRITE (FCHR) ;
  END ;

PROCEDURE BSMODE ;
{ SWITCH SCREEN 40/80 }
  BEGIN
    ESC ('P') ;
  END ;

PROCEDURE READ1 ( X: INTEGER ; VAR N : BYTE ) ;
{READ 1 BYTE FROM KC }
VAR      XCHR             :PARATYPE ;
  BEGIN
  ESC ('Q') ;
  MEM [MEMANF] := 1 ;
  ADRCHAR (X,XCHR) ;
  WRITE (XCHR) ;
  WHILE NOT (MEM [MEMANF] = 0) DO
   BEGIN
   END ;
  N:=MEM [$FE00] ;
  END ;

PROCEDURE READN ( X:INTEGER ;VAR K : BLOCKTYPE ) ;
{ LIEST 256 BYTE AUS KC }
VAR      XCHR              :PARATYPE ;
         I                 :INTEGER ;
CONST    ADR               = $FE00 ;
  BEGIN
  ESC ('R') ;
  MEM [MEMANF] := 1 ;
  ADRCHAR (X,XCHR) ;
  WRITE (XCHR) ;
  WHILE NOT (MEM [MEMANF] = 0) DO
   BEGIN
   END ;
  FOR I:=0 TO 255 DO
   BEGIN
   K [I] :=MEM [ADR+I] ;
   END ;
  END ;

PROCEDURE WRIT1 (X : INTEGER ; N : BYTE ) ;
VAR      XCHR           : PARATYPE ;
  BEGIN
  ESC ('S') ;
  ADRCHAR (X,XCHR) ;
  WRITE (XCHR) ;
  WRITE ( CHR(N) ) ;
  END ;

PROCEDURE WRITN (X,N : INTEGER ) ;
VAR      XCHR          : PARATYPE ;
  BEGIN
  ESC ('T') ;
  ADRCHAR (X,XCHR) ;
  WRITE (XCHR) ;
  ADRCHAR (N,XCHR) ;
  WRITE (XCHR) ;
  END ;

PROCEDURE KCCALL (X : INTEGER) ;
VAR      XCHR          : PARATYPE ;
  BEGIN
  ESC ('U') ;
  ADRCHAR (X,XCHR) ;
  WRITE (XCHR) ;
  END ;

PROCEDURE DIROUT (N : CHAR );
  BEGIN
  ESC ('V') ;
  WRITE (N) ;
  END ;

PROCEDURE CAOSUP ( N : BYTE ) ;
  BEGIN
  ESC ('[') ;
  WRITE (N) ;
  END ;

PROCEDURE BYE ;
  BEGIN
  ESC ('\') ;
  END ;

PROCEDURE SCRMODE ;
  BEGIN
  ESC ('^') ;
  END ;

PROCEDURE KBDMODE ;
  BEGIN
  ESC ('_') ;
  END ;

{ AUFBAUENDE ROUTINEN }

FUNCTION KBDSTAT : BOOLEAN ;
{ TRUE IF KEYPRESSED }
VAR    X   :BYTE ;
 BEGIN
 READ1 ( 509 ,X ) ;
 IF X= 0 THEN KBDSTAT:=FALSE
 ELSE KBDSTAT:=TRUE ;
 END ;
PROCEDURE DIRSTRING ( STR : HEXSTRING ) ;
{ DIREKTE AUSGABE EINES STRINGS }
VAR          X          : BYTE ;
             T          : CHAR ;
  BEGIN
   FOR X:=1 TO LENGTH (STR) DO
    BEGIN
    T:=COPY (STR,X,1) ;
    DIROUT (T) ;
   END ;
  END ;

PROCEDURE DIRSTRLN (STR : HEXSTRING ) ;
BEGIN
 DIRSTRING ( STR ) ;
 DIROUT (CHR(10)) ;
 DIROUT (CHR(13)) ;
END ;

PROCEDURE SCREEN40 ;
{ SWITCH SCREEN 40}
  BEGIN
    IF (MEM[SYSCONTR] AND 1 =0 )
    THEN ESC ('P') ;
  END ;

PROCEDURE SCREEN80 ;
{ SWITCH SCREEN 80 }
  BEGIN
    IF (MEM[SYSCONTR] AND 1 = 1 )
    THEN ESC ('P') ;
  END ;


PROCEDURE COLOR ( I,P : BYTE ) ;
{ SET COLOR ( INK, PAPER) }
  BEGIN
   INK (I) ;
   PAPER (P) ;
  END ;

PROCEDURE CLS ( I,P : BYTE ) ;
{ CLEAR SCREEN WITH COLOR ( INK, PAPER ) }
 BEGIN
  COLOR (I,P) ;
  CLSG ;
 END ;

PROCEDURE DRAWLINE ( I : INTEGER ; LISTE : FIELD ) ;
{ DRAW I LINES ( POLYGON )}
VAR          X1,X2,Y1,Y2              : REAL ;
             J                        : INTEGER ;
  BEGIN
   IF I > 1 THEN BEGIN
    X1:= LISTE [ 0,0 ] ;
    Y1:= LISTE [ 0,1 ] ;
    FOR J:= 1 TO I DO
      BEGIN
        X2:= LISTE [ J,0 ] ;
        Y2:= LISTE [ J,1 ] ;
        LINE (X1,Y1,X2,Y2) ;
        X1:=X2 ;
        Y1:=Y2 ;
      END ;
    END ;
   END ;

PROCEDURE HEXCODE (HX : HEXSTRING ; CADR : INTEGER ) ;
{ SENDET HEXCODE AUS STRING AN KC- ADRESSE }
VAR         X,Y                      :INTEGER ;
            N,M                      : BYTE ;
            S,T                      : STRING [1] ;
BEGIN
  X:=LENGTH( HX )DIV 2 ;
  WRITN (CADR,X) ;
  FOR Y:=1 TO X DO
  BEGIN
  S:=COPY (HX,2*Y-1,2) ;
  T:=COPY (HX,2*Y,2) ;
  N:=ORD (S) ;
  N:=N-$30 ;
  IF N>9 THEN N:=N-7 ;
  N:=N*16 ;
  M:=ORD (T) ;
  M:=M-$30 ;
  IF M>9 THEN M:=M-7 ;
  N:=N+M ;
  WRITE (CHR(N));
  END ;
END ;

PROCEDURE SETCOL ;
VAR   BACKCOL,INKCOL   :INTEGER;
  BEGIN
    BACKCOL:=7;
    INKCOL:=0;
    INK (INKCOL) ;
    PAPER (BACKCOL) ;
  END ;

PROCEDURE MT01PROGLAD ;
{ LAEDT MASCHINENPROGRAMM FUER MT01 VON DISK IN KC }
CONST          SPEICHER =$1000 ;
VAR       PUFFER     :ARRAY [1..SPEICHER] OF CHAR ;
          MASCHFILE  :FILE ;
          ADR,Z      :INTEGER ;
          FIRSTBYTE  : BYTE ;
BEGIN
 ASSIGN (MASCHFILE,'PF41.OPC') ;
 RESET (MASCHFILE) ;
 BLOCKREAD (MASCHFILE,PUFFER,19) ;
 WRITN ($4000,SPEICHER) ;
 FOR Z:=1 TO SPEICHER DO
  WRITE (PUFFER [ Z ] );
 CLOSE (MASCHFILE) ;
 BLOCK4 :=FALSE ;
 READ1 ($4000,FIRSTBYTE) ;
 IF CHAR (FIRSTBYTE) = PUFFER [1] THEN BLOCK4:=TRUE
 END ;

{ HAUPTPROGRAMM }
VAR           I,J,K,TF           : INTEGER ;
              X,Y,Z,R,T,V        : REAL ;
              SFIELD             : FIELD ;

PROCEDURE DEM4 ;
 { SPIRALE ZEICHNEN AUS FELD }
 BEGIN
 WRITELN (' KOMMUNIKATIONSTEST D004-KC') ;
 GOTOXY(1,1) ;
 FOR I:= 0 TO 60 DO
  BEGIN
  X:=2*I*COS(I*3.1415/4+3.1415/2)+160 ;
  SFIELD[I,0]:=X;
  Y:=2*I*COS(I*3.1415/4)+128 ;
  SFIELD[I,1]:=Y ;
  END ;
  GFARB ( 1 ) ;
  DRAWLINE (60, SFIELD) ;
  DELAY (2500) ;
 END ;

PROCEDURE DISK ;
{ SCHREIBEN/LESEN TESTEN }
VAR      TESTFILE    : FILE OF REAL ;
         A,B,C,D     : REAL ;
         Z           : INTEGER ;
 BEGIN
  {$I-}
  ASSIGN (TESTFILE, 'TESTFILE.DAT');
  REWRITE (TESTFILE) ;
  WRITELN (' UEBERPRUEFEN:') ;
  WRITELN ('    SCHREIBEN/LESEN DER DISKETTE') ;
  WRITELN ;
  WRITELN ('SCHREIBVERSUCH ') ;
  IF IORESULT <> 0 THEN
  BEGIN
   WRITELN ('      DATEIEROEFFNUNGSFEHLER !') ;
   FOR Z:=0 TO 10 DO
    WRITE ( CHR (7) ) ;
   END
   ELSE  BEGIN
  FOR Z:=0 TO 100 DO
   BEGIN
   A:=Z ;
   B:=A*A ;
   C:=A*B ;
   WRITE (TESTFILE , A ,B,C) ;
   END ;
  CLOSE (TESTFILE) ;
  IF IORESULT <> 0 THEN
   WRITELN  ('      SCHREIBFEHLER !')
  ELSE WRITELN ('     SCHREIBEN O.K. ') ;
  END;
 { LESEN }
 ASSIGN (TESTFILE, 'TESTFILE.DAT') ;
 RESET (TESTFILE) ;
 IF IORESULT <>0 THEN
  WRITELN ('      DATEIEROEFFNUNGSFEHLER beim  LESEN')
 ELSE BEGIN
 WRITELN ;
 WRITELN ('LESEN DER DATEI ');
 FOR Z:=0TO 10 DO
 BEGIN
 READ (TESTFILE, B,C,D) ;
 END ;
 IF IORESULT<>0 THEN WRITELN ('      LESEFEHLER')
 ELSE
 WRITELN ('      LESEN O.K.') ;
 {LOESCHEN DER DATEI }
 WRITELN ;
 WRITELN ('LOESCHEN DER DATEI') ;
 ERASE (TESTFILE) ;
 IF IORESULT<>0 THEN WRITELN ('      LOESCHFEHLER')
 ELSE WRITELN ('      LOESCHEN O.K.') ;
 DELAY (3000) ;
 CLRSCR ;
 END;
 END;

 PROCEDURE UHRTEST ;
 VAR      UHRAD,I   : INTEGER ;
          ZEIT      : BYTE ;
 BEGIN
  UHRAD:=$40 ;
  ZEITZEICHEN:='' ;
  FOR I:=0 TO 2 DO
  BEGIN
   ZEIT:=MEM [UHRAD+I] ;
   ZEITZEICHEN:=ZEITZEICHEN + CHR (TRUNC(ZEIT/16)+$30);
   ZEITZEICHEN:=ZEITZEICHEN+ CHR(TRUNC(ZEIT- TRUNC(ZEIT/16)*16)+$30);
   ZEITZEICHEN:=ZEITZEICHEN+' ' ;
  END ;
 END ;

 PROCEDURE ZEIT ;
 VAR K      : INTEGER ;
 BEGIN
  GOTOXY (5,23) ;
  WRITE ('CTC- und Interrupttest') ;
  MEM [$40]:=$11 ;
  MEM [$41]:=$59 ;
  MEM [$42]:=$57 ;
  K:=10 ;
  REPEAT
   GOTOXY (10,24) ;
   UHRTEST ;
   IF ZEITZEICHEN <> ZEITOLD THEN
   BEGIN
    WRITE (ZEITZEICHEN) ;
    ZEITOLD:=ZEITZEICHEN ;
    K:=K-1 ;
   END ;
  UNTIL K=0 ;
 END ;

 PROCEDURE INITMC ;
CONST     MC ='DB88EE20D388C9' ;
 BEGIN
  HEXCODE (MC,$2000) ;
 END ;

{ MAIN }

BEGIN
 INLINE ( $0E/45/$1E/$FE/$CD/05/0 );
 INITMC ;
 SCREEN40 ;
 MT01PROGLAD ;
  WRITE ( CHR($83) ) ;
  CLS (7,0) ;
  GOTOXY (7,7) ;
  COLORZ (6,0) ;
  WRITE ('FUNKTIONSTEST D004') ;
  GOTOXY (7,8) ;
  WRITELN ('==================') ;
  WRITELN ;
  WRITELN ;
  COLORZ (7,0) ;
  DISK ;
  IF BLOCK4 = TRUE THEN
   KCCALL ( $4000 )  { AUFRUF MT01 }
                   ELSE BEGIN
   WRITELN ('KEIN SPEICHER AUF 4000H') ;
   WRITELN ('TEST MIT MT01 UNMOEGLICH !') END ;
  DELAY (12000) ;
  CLRSCR ;
  PAPER (0) ;
  COLORZ (7,0) ;
  DEM4 ;
  ZEIT ;
  CLRSCR ;
  GOTOXY (8,15) ;
  COLORZ (6,2) ;
  WRITELN ('FUNKTIONSTEST BEENDET') ;
  COLORZ (1,7) ;
  GOTOXY (8,16) ;
  WRITELN ('=====================') ;
  GOTOXY (20,28) ;
  COLORZ (7,0) ;
  WRITE ('<ENTER>') ;
  KEY:=' ' ;
  REPEAT
   READ (KBD,KEY) ;
  UNTIL KEY=CHR(13) ;
  COLOR (7,1) ;
  SCREEN80 ;
END .
