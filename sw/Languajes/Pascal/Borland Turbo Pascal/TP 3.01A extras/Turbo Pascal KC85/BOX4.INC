{.P8}
{GRAFIKS-TOOL-BOX FOR KC 85/4}
{ STAND : 18.07.1990 }
TYPE
         PARATYPE         = STRING [2] ;
         BLOCKTYPE        = ARRAY [0..255] OF BYTE ;
         HEXSTRING        = STRING [254] ;
         FILENAME         = STRING [ 10] ;
         FIELD            = ARRAY [ 0..255] OF ARRAY [0..1] OF REAL ;
CONST    IRMZEIGER : INTEGER = 8 ;
         MEMANF           =$FFAE ;
         SYSCONTR         =$FFB6 ;
{ HILFSROUTINEN }

PROCEDURE WZB ( X : REAL; VAR XCHR : PARATYPE ) ;
{ CHANGE 2 BYTE IN CHAR }
VAR      H                   :INTEGER ;
         HL,HH               :CHAR ;
  BEGIN
    H:=ROUND (X) ;
    HL:=CHR(LO(H));
    HH:=CHR(HI(H));
    XCHR:=CONCAT(HL,HH) ;
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

PROCEDURE USOUT2 ( N : CHAR ) ;
  BEGIN
  ESC ('W') ;
  WRITE (N) ;
  END ;

PROCEDURE USOUT3 (N : CHAR ) ;
  BEGIN
  ESC ('X') ;
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
PROCEDURE HARDCOPY ;
{ RUFT HARDCOPY DES DRUCKERS AUF }
 BEGIN
  DIROUT ( CHR( 15)) ;
 END ;

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

PROCEDURE AMZSATZ ;
  BEGIN
   IF (MEM [SYSCONTR] AND 2 = 2 )
   THEN ESC (']') ;
   WHILE (MEM[SYSCONTR] AND 2 = 2) DO
   BEGIN
   END ;
 END ;

PROCEDURE DTZSATZ ;
  BEGIN
   IF (MEM [SYSCONTR] AND 2 = 0 ) THEN
  ESC (']') ;
  WHILE (MEM[SYSCONTR] AND 2 = 0) DO
   BEGIN
   END ;

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

PROCEDURE IRMEBENE (ZUGR : BYTE) ;
 BEGIN
  ESC ('`') ;
  WRITE (CHR(ZUGR AND 7))
 END ;


PROCEDURE IRMZUGR ;
{ WECHSELT ZUGRIFF AUF BILD 0/1}
 BEGIN
  IRMZEIGER:=IRMZEIGER XOR 4 ;
  IRMEBENE (IRMZEIGER)
 END ;

PROCEDURE IRMANZ ;
{ WECHSELT ANGEZEIGTES BILD 0/1 }
 BEGIN
  IRMZEIGER:=IRMZEIGER XOR 1 ;
  IRMEBENE (IRMZEIGER)
 END ;

PROCEDURE FARBZUGRIFF ;
{SCHALTET ZWISCHEN FARB UND PIXELZUGRIFF UM }
 BEGIN
  IRMZEIGER:=IRMZEIGER XOR 2 ;
  IRMEBENE (IRMZEIGER)
 END ;

PROCEDURE HOCH ;
 BEGIN
  ESC ('b') ;
 END ;

PROCEDURE NIEDRIG ;
 BEGIN
  ESC ('a');
 END ;

{ RETTEN BILDINHALT AUF DISKETTE
  256 * 256 PIXEL MIT FARBE }
PROCEDURE BILDSAVE ( SNAME : FILENAME ) ;
CONST   SPEICHER   =$800 ;
VAR   ADR,Z,Y,I      : INTEGER ;
      N             : BYTE ;
      PICFILE       : FILE ;
      PUFFER:ARRAY[0..SPEICHER] OF CHAR ;

BEGIN
 ASSIGN (PICFILE,SNAME) ;
 {$I-}   { FEHLER AUS}
 RESET (PICFILE) ;
 {$I+}
 IF IORESULT=0 THEN
 BEGIN
  CLOSE (PICFILE) ;
  ERASE (PICFILE) ;
  ASSIGN (PICFILE,SNAME) ;
 END ;
 REWRITE (PICFILE) ;
 FOR I:=0 TO 1 DO
 BEGIN
  ADR:=$8000 ;
  FOR Z:=0 TO 3 DO
   BEGIN
    FOR Y:=0 TO $7FF DO
    BEGIN
     READ1 ( ADR+Z*2048+Y ,N) ;
     PUFFER[Y]:=CHR ( N) ;
    END ;
    BLOCKWRITE (PICFILE,PUFFER,16) ;
   END ;
   FARBZUGRIFF ;
  END ;
  CLOSE (PICFILE ) ;
 END ;

{ BILDSCHIRMINHALT VON DISKETTE }

PROCEDURE BILD (PFNAME : FILENAME ; PAPER : BYTE ) ;

CONST       SPEICHER =$800 ;
LABEL       EXIT ;

VAR   PUFFER:ARRAY[1..SPEICHER]OF CHAR;
      PICFILE            : FILE ;
      Z,ADRESSE,X,I      :INTEGER ;
BEGIN
 ASSIGN (PICFILE,PFNAME) ;
 {$I-}
 RESET (PICFILE) ;
 {$I+}
 IF IORESULT <> 0 THEN GOTO EXIT ;
 IRMZUGR ;
 CLS (8, PAPER) ;
 FOR I:=0 TO 1 DO
 BEGIN
  ADRESSE:=$8000 ;
  FOR Z:=1 TO 4 DO
   BEGIN
    BLOCKREAD (PICFILE,PUFFER,16) ;
    WRITN (ADRESSE,SPEICHER) ;
    FOR X:=1TO SPEICHER DO
    BEGIN
     WRITE (PUFFER [ X ]) ;
    END ;
    ADRESSE:=ADRESSE+SPEICHER ;
   END ;
  FARBZUGRIFF ;
  END;
  IRMANZ ;
  CLOSE (PICFILE) ;
EXIT: NIEDRIG ;
 END ;

