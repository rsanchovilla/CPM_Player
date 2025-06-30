{----------------------------------------------------------------------------}
{   Programmname    :   2D-APFEL.PAS                                         }
{   Version         :   1.12                                                 }
{   Aufgabe         :   Erstellung von sog. Fractalen in der komplexen Ebene }
{   Sprache         :   Turbo Pascal 3.00A  (GRAPH128.INC als Include-File)  }
{   Computer        :   Commodore 128(D) mit RGBI-Monitor                    }
{   Betriebssystem  :   CP/M 3.0                                             }
{   Autor           :   Ralph Schlichtmeier                                  }
{   Copyright       :   Markt & Technik Verlag AG                            }
{----------------------------------------------------------------------------}

PROGRAM Apfelmaennchen_2D;

{$I GRAPH128.INC}

VAR ch    : CHAR;
    fname : STRING [10];


FUNCTION Farbe (fnummer : BYTE) : color;
  BEGIN
    CASE fnummer OF
      1  : farbe := black;   2  : farbe := white;
      3  : farbe := red;     4  : farbe := cyan;
      5  : farbe := violet;  6  : farbe := green;
      7  : farbe := blue;    8  : farbe := yellow;
      9  : farbe := dk_grey; 10 : farbe := lt_grey;
      11 : farbe := orange;  12 : farbe := grey;
      13 : farbe := pink;    14 : farbe := lt_green;
      15 : farbe := lt_blue; 16 : farbe := brown
    END
  END;


PROCEDURE Menue;
  VAR i : INTEGER;
  BEGIN
    Inline ($F3);  { Disable Interrupt }
    cbreak := FALSE;
    ClrScr;
    BackgroundColor (lt_blue); TextColor (white);
    AltChars (on); CursorFlash (off);
    GotoXY (1, 1); Write ('U');
    FOR i := 2 TO 79 DO BEGIN GotoXY (i, 1); Write ('D') END;
    GotoXY (80, 1); Write ('I');
    FOR i := 2 TO 22 DO
      BEGIN
        GotoXY (1, i); Write ('G'); GotoXY (80, i); Write ('H')
      END;
    GotoXY (1, 23); Write ('J');
    FOR i := 2 TO 79 DO BEGIN GotoXY (i, 23); Write ('F') END;
    GotoXY (80, 23); Write ('K');
    AltChars (off);
    GotoXY (22, 3);
    Reverse (on); TextColor (white);
    Write ('  2 D - A P F E L M A E N N C H E N  ');
    Reverse (off); TextColor (lt_grey);
    GotoXY (28, 6);
    Write ('-1-   Fractals erstellen');
    GotoXY (28, 8);
    Write ('-2-   Fractals betrachten');
    GotoXY (28, 10);
    Write ('-3-   Fractals ausdrucken');
    GotoXY (28, 12);
    Write ('-4-   Programm verlassen');
    GotoXY (32, 18);
    Write ('Ihre Eingabe ? ');
    CursorFlash (no);
    cbreak := TRUE;
    Inline ($FB);  { Enable Interrupt }
  END;


PROCEDURE Erstellen;
  VAR symmetrie      : BOOLEAN;
      hf, zf, af     : BYTE;
      hfarbe, zfarbe : color;
      is             : INTEGER;
      re, im, ho, ve : REAL;

  PROCEDURE Iteration (iterationen : INTEGER);
    VAR h_aufloesung, v_aufloesung, zeile, spalte, k, a, b : INTEGER;
        zeileneinheit, spalteneinheit, re_teil_const, im_teil_const,
        re_teil, im_teil, sqr_re_teil, sqr_im_teil : REAL;
    BEGIN
      HiRes; BackgroundColor (hfarbe); HiResColor (zfarbe);
      h_aufloesung := 639 DIV (1 SHL af);
      v_aufloesung := 199;
      zeileneinheit := ho / h_aufloesung;
      spalteneinheit := ve / v_aufloesung;
      IF symmetrie THEN v_aufloesung := 99;
      im_teil_const := im;
      FOR zeile := 0 TO v_aufloesung DO
        BEGIN
          re_teil_const := re;
          FOR spalte := 0 TO h_aufloesung DO
            BEGIN
              re_teil := 0; im_teil := 0;
              k := 0;
              Inline ($F3);  { Disable Interrupt }
              REPEAT
                sqr_re_teil := sqr (re_teil);
                sqr_im_teil := sqr (im_teil);
                im_teil := 2 * re_teil * im_teil + im_teil_const;
                re_teil := sqr_re_teil - sqr_im_teil + re_teil_const;
                k := Succ (k)
              UNTIL ((sqr_re_teil + sqr_im_teil) > 4) OR (k = iterationen);
              Inline ($FB);  { Enable Interrupt }
              Draw (spalte SHL af, zeile, spalte SHL af + 1 SHL af - 1, zeile, Ord (Odd (k)));
              re_teil_const := re_teil_const + zeileneinheit;
            END;
          im_teil_const := im_teil_const + spalteneinheit;
          IF KeyPressed THEN BEGIN PutPic (fname); TextMode; Menue; Exit END
        END;
      IF symmetrie THEN
        BEGIN
          Inline ($F3);  { Disable Interrupt }
          FOR zeile := 0 TO 99 DO
            BEGIN
              a := zeile * 80;
              b := 15920 - a;
              FOR spalte := 0 to 79 DO
                VDCmemWr (b + spalte, VDCmemRd (a + spalte))
            END;
          Inline ($FB)  { Enable Interrupt }
        END;
      PutPic (fname); TextMode; Menue
    END;

  BEGIN
    cbreak := FALSE;
    ClrScr;
    GotoXY (21, 3);
    Reverse (on); TextColor (white);
    Write ('  F R A C T A L S   B E R E C H N E N  ');
    Reverse (off); TextColor (lt_grey);
    GotoXY (24, 5);
    Write ('Hintergrundfarbe  (1 bis 16).... 1');
    GotoXY (57, 5);
    hf := 1; BufLen := 2; ReadLn (hf);
    IF (hf < 1) OR (hf > 16) THEN hf := 1;
    hfarbe := farbe (hf);
    GotoXY (24, 7);
    Write ('Zeichenfarbe  (1 bis 16)........ 2');
    GotoXY (57, 7);
    zf := 2; BufLen := 2; ReadLn (zf);
    IF (zf < 1) OR (zf > 16) THEN zf := 2;
    zfarbe := farbe (zf);
    GotoXY (24, 9);
    Write ('Iterationen  (4 bis 999)........ 25');
    GotoXY (57, 9);
    is := 25; BufLen := 3; ReadLn (is);
    IF Odd (is) THEN is := Pred (is);
    GotoXY (24, 11);
    Write ('Realteil der komplexen Zahl..... -2');
    GotoXY (57, 11);
    re := -2.0; BufLen := 10; ReadLn (re);
    GotoXY (24, 13);
    Write ('Imaginaerteil der komplexen Zahl -1.25');
    GotoXY (57, 13);
    im := -1.25; BufLen := 10; ReadLn (im);
    GotoXY (24, 15);
    Write ('Horizontale des Gebiets......... 4');
    GotoXY (57, 15);
    ho := 4.0; BufLen := 10; ReadLn (ho);
    GotoXY (24, 17);
    Write ('Vertikale des Gebiets........... 2.5');
    GotoXY (57, 17);
    ve := 2.5; BufLen := 10; ReadLn (ve);
    IF 2 * Abs (im) = ve THEN symmetrie := TRUE ELSE symmetrie := FALSE;
    GotoXY (24, 19);
    Write ('Filename des Fractals........... ');
    fname := ''; BufLen := 10; ReadLn (fname);
    IF fname = '' THEN BEGIN Menue; Exit END;
    GotoXY (24, 21);
    Write ('Aufloesung  (0 bis 2)........... 2');
    GotoXY (23, 22);
    Write ('( 0=640*200  1=320*200  2=160*200 )');
    GotoXY (57,21);
    af := 2; BufLen := 1; ReadLn (af);
    IF (af < 0) OR (af > 2) THEN af := 2;
    CursorFlash (off);
    GotoXY (23, 24);
    Write ('(K)orrigieren   (A)bbruch  (W)eiter ');
    Read (KBD, ch);
    CursorFlash (no);
    cbreak := TRUE;
    CASE ch OF
      'k', 'K' : Erstellen;
      'a', 'A' : Menue
    ELSE Iteration (is)
    END
  END;


PROCEDURE Betrachten;
  VAR hf, zf         : BYTE;
      hfarbe, zfarbe : color;
  BEGIN
    cbreak := FALSE;
    ClrScr;
    GotoXY (20, 3);
    Reverse (on); TextColor (white);
    Write ('  F R A C T A L S   B E T R A C H T E N  ');
    Reverse (off); TextColor (lt_grey);
    GotoXY (24, 6);
    Write ('Hintergrundfarbe  (1 bis 16).... 1');
    GotoXY (57, 6);
    hf := 1; BufLen := 2; ReadLn (hf);
    IF (hf < 1) OR (hf > 16) THEN hf := 1;
    hfarbe := farbe (hf);
    GotoXY (24, 8);
    Write ('Zeichenfarbe  (1 bis 16)........ 2');
    GotoXY (57, 8);
    zf := 2; BufLen := 2; ReadLn (zf);
    IF (zf < 1) OR (zf > 16) THEN zf := 2;
    zfarbe := farbe (zf);
    GotoXY (18, 10);
    Write ('Namen des Files ohne Extend eingeben: ');
    fname := ''; BufLen := 10; ReadLn (fname);
    IF fname = '' THEN BEGIN Menue; Exit END;
    cbreak := TRUE;
    IF FileExists (fname) THEN
      BEGIN
        HiRes; BackgroundColor (hfarbe); HiResColor (zfarbe);
        GetPic (fname); Bell; Textmode
      END
    ELSE
      BEGIN
        CursorFlash (off);
        GotoXY (30, 22); Write ('File nicht gefunden!'); Bell;
        CursorFlash (no);
        Read (KBD, ch);  { Tastaturpuffer leeren }
        Betrachten; Exit
      END;
    Menue
  END;


PROCEDURE Ausdrucken;
  BEGIN
    cbreak := FALSE;
    ClrScr;
    GotoXY (20, 3);
    Reverse (on); TextColor (white);
    Write ('  F R A C T A L S   A U S D R U C K E N  ');
    Reverse (off); TextColor (lt_grey);
    GotoXY (18, 6);
    Write ('Namen des Files ohne Extend eingeben: ');
    fname := ''; BufLen := 10; ReadLn (fname);
    IF fname = '' THEN BEGIN Menue; Exit END;
    cbreak := TRUE;
    IF FileExists (fname) THEN
      BEGIN
        HiRes; BackgroundColor (black); HiResColor (white);
        GetPic (fname); Hardcopy; Textmode
      END
    ELSE
      BEGIN
        CursorFlash (off);
        GotoXY (30, 22); Write ('File nicht gefunden!'); Bell;
        CursorFlash (no);
        Read (KBD, ch);  { Tastaturpuffer leeren }
        Ausdrucken; Exit
      END;
    Menue
  END;

PROCEDURE Verlassen;
  BEGIN
    cbreak := FALSE;
    ClrScr;
    GotoXY (21, 3);
    Reverse (on); TextColor (white);
    Write ('  P R O G R A M M   V E R L A S S E N  ');
    Reverse (off); TextColor (lt_grey);
    GotoXY (28, 6);
    Write ('Sind Sie sicher (j/n)? ');
    Read (KBD, ch);
    cbreak := TRUE;
    IF (ch = 'j') OR (ch = 'J') THEN
      BEGIN BackgroundColor (black); CursorFlash (fast); Halt END
    ELSE Menue
  END;

BEGIN
  Menue;
  REPEAT
    Read (KBD, ch);
    CASE ch OF
      '1' : Erstellen;
      '2' : Betrachten;
      '3' : Ausdrucken;
      '4' : Verlassen
    END;
  UNTIL ch = #0  { Endlosschleife }
END.