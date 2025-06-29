{----------------------------------------------------------------------------}
{   Programmname    :   DEMO128.PAS                                          }
{   Version         :   1.00                                                 }
{   Aufgabe         :   Demoprogramm fuer GRAPH128.INC                       }
{   Sprache         :   Turbo Pascal 3.00A  (GRAPH128.INC als Include-File)  }
{   Computer        :   Commodore 128(D) mit RGBI-Monitor                    }
{   Betriebssystem  :   CP/M 3.0                                             }
{   Autor           :   Ralph Schlichtmeier                                  }
{   Copyright       :   Markt & Technik Verlag AG                            }
{----------------------------------------------------------------------------}

PROGRAM Demo128;

{$I GRAPH128.INC}

VAR i, j : INTEGER;
    farbe : color;

PROCEDURE Schriftdemo;
  BEGIN
    BackgroundColor (black); TextColor (lt_grey);
    ClrScr; InvScr;
    Underline (on);
    LowVideo;
    GotoXY (28, 2);
    WriteLn (' G R A P H 1 2 8 . I N C ');
    HighVideo;
    Underline (off);
    GotoXY (13, 5);
    WriteLn ('das Turbo Pascal Include-File fuer den Commodore 128(D),');
    GotoXY (11, 6);
    WriteLn ('welches die speziellen Hardware-Eigenschaften des Computers');
    GotoXY (17, 7);
    WriteLn ('im Bereich 80-Zeichen Grafik voll unterstuetzt.');
    GotoXY (29, 10);
    WriteLn ('Aber sehen Sie selbst !');
    Bell; ClrScr;
    GotoXY (18, 2);
    WriteLn ('Volle Unterstuetzung der Bildschirmattribute:');
    GotoXY (23, 5);
    Underline (on);
    WriteLn ('Diese Textzeile ist unterstrichen,');
    Underline (off);
    GotoXY (25 ,7);
    Flash (on);
    WriteLn ('wohingegen diese Zeile blinkt.');
    Flash (off);
    GotoXY (17, 9);
    Reverse (on);
    WriteLn ('Hier sehen Sie eine Zeile reverse dargestellt.');
    Reverse (off);
    GotoXY (23, 11);
    Underline (on); Flash (on); Reverse (on);
    WriteLn (' Und nun alle Attribute zusammen. ');
    UnderLine (off);
    Bell; ClrScr;
    GotoXY (18, 2);
    WriteLn ('Aber auch der Sonderzeichensatz fehlt nicht:');
    GotoXY (1, 5);
    WriteLn ('Hier der normale 7-Bit Zeichensatz:');
    FOR i := 33 TO 126 DO
      Write (Chr (i), ' ');
    WriteLn; WriteLn;
    WriteLn ('Und hier der alternative 7-Bit Zeichensatz:');
    AltChars (on);
    FOR i := 33 TO 126 DO
      Write (Chr (i), ' ');
    AltChars (off);
    Bell;
    InvScr;
  END;

PROCEDURE Farbdemo;
  BEGIN
    BackgroundColor (black); TextColor (lt_grey);
    ClrScr;
    GotoXY (9, 2);
    WriteLn ('Natuerlich wurde auch an die farbige Bildschirmausgabe gedacht:');
    GotoXY (20, 5);
    WriteLn ('Hier sind die 16 Zeichenfarben zu sehen:');
    WriteLn;
    FOR farbe := black TO white DO
      BEGIN
        TextColor (farbe);
        Write ('Turbo Pascal auf dem Commodore 128 - ');
        WriteLn ('mit GRAPH128.INC erst richtig interessant')
      END;
    Bell;
    InvScr;
    Bell;
    InvScr;
    TextColor (lt_grey);
    GotoXY (20, 5);
    Write ('Und nun die 16 Hintergrundfarben:'); ClrEOL;
    WriteLn;
      FOR farbe := black TO white DO
        BEGIN
          BackgroundColor (farbe);
          Delay (500)
        END;
    Bell;
    BackgroundColor (black); TextColor (lt_grey);
    ClrScr
  END;

PROCEDURE Punkte;
  VAR x, y : INTEGER;
  BEGIN
    BackgroundColor (lt_grey); HiResColor (blue);
    HiRes;
    HiWrite (32, 1, 'Der PLOT-Befehl');
    Randomize;
    REPEAT
      x := Random (639); y := Random (199);
      Plot (x, y, 1)
    UNTIL KeyPressed;
    BackgroundColor (black);
    TextMode
  END;

PROCEDURE Linien;
  VAR x1, y1, x2, y2 : INTEGER;
  BEGIN
    BackgroundColor (lt_grey); HiResColor (violet);
    HiRes;
    HiWrite (32, 1, 'Der DRAW-Befehl');
    Randomize;
    REPEAT
      x1 := Random (639); y1 := Random (199);
      x2 := Random (639); y2 := Random (199);
      Draw (x1, y1, x2, y2, 1)
    UNTIL KeyPressed;
    BackgroundColor (black);
    TextMode
  END;

PROCEDURE Rechtecke;
  VAR x1, y1, x2, y2 : INTEGER;
      modus          : BYTE;
  BEGIN
    BackgroundColor (lt_grey); HiResColor (brown);
    HiRes;
    HiWrite (32, 1, 'Der BOX-Befehl');
    Randomize;
    REPEAT
      x1 := Random (639); y1 := Random (199);
      x2 := x1 + Random (319); y2 := y1 + Random (99);
      Box (x1, y1, x2, y2, 1)
    UNTIL KeyPressed;
    WriteLn;
    BackgroundColor (lt_grey); HiResColor (yellow);
    REPEAT
      x1 := Random (639); y1 := Random (199);
      x2 := x1 + Random (199); y2 := y1 + Random (49);
      Box (x1, y1, x2, y2, 3)
    UNTIL KeyPressed;
    BackgroundColor (black);
    TextMode
  END;

PROCEDURE Kreise;
  VAR mx, my, r : INTEGER;
      modus     : BYTE;
  BEGIN
    BackgroundColor (lt_grey); HiResColor (red);
    HiRes;
    HiWrite (31, 1, 'Der CIRCLE-Befehl');
    Randomize;
    REPEAT
      mx := Random (639); my := Random (199);
      r := Random (49) + 5;
      Circle (mx, my, r, 1)
    UNTIL KeyPressed;
    WriteLn;
    BackgroundColor (lt_grey); HiResColor (pink);
    REPEAT
      mx := Random (639); my := Random (199);
      r := Random (24) + 5;
      Circle (mx, my, r, 3)
    UNTIL KeyPressed;
    BackgroundColor (black);
    TextMode
  END;

PROCEDURE Ellipsen;
  VAR mx, my, a, b : INTEGER;
      modus        : BYTE;
  BEGIN
    BackgroundColor (lt_grey); HiResColor (lt_blue);
    HiRes;
    HiWrite (30, 1, 'Der ELLIPSE-Befehl');
    Randomize;
    REPEAT
      mx := Random (639); my := Random (199);
      a := Random (49) + 3; b := Random (49) + 3;
      Ellipse (mx, my, a, b, 1)
    UNTIL KeyPressed;
    WriteLn;
    BackgroundColor (lt_grey); HiResColor (orange);
    REPEAT
      mx := Random (639); my := Random (199);
      a := Random (24) + 3; b := Random (24) + 3;
      Ellipse (mx, my, a, b, 3)
    UNTIL KeyPressed;
    BackgroundColor (black);
    TextMode
  END;

PROCEDURE Grafikschrift;
  VAR a, b, i, x, y : INTEGER;
  BEGIN
    BackgroundColor (green); HiResColor (white);
    HiRes;
    Box (0, 0, 639, 199, 1);
    a := -320;
    b := 0;
    REPEAT
      Draw (a, 199, b, 50, 1);
      a := a + 32;
      b := b + 16;
    UNTIL a > 960;
    y := 50;
    i := 0;
    REPEAT
      Draw (0, y, 640, y, 1);
      i := i + 2;
      y := y + 5 + i;
    UNTIL y > 200;
    x := 3;
    FOR y := 0 TO 24 DO
      BEGIN
        x := x + 2;
        HiWrite (x, y, 'CP/M Plus und Grafik')
      END;
    Box (391, 12, 536, 28, 3);
    HiWrite (50, 2, 'mit GRAPH128.INC');
    Bell;
    BackgroundColor (black);
    TextMode
  END;

BEGIN
  CursorFlash (off);
  Schriftdemo;
  Farbdemo;
  InvScr;
  Punkte;
  Linien;
  Rechtecke;
  Kreise;
  Ellipsen;
  InvScr;
  Grafikschrift;
  CursorFlash (fast)
END.