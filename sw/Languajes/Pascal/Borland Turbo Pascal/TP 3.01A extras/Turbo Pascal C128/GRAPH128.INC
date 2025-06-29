{----------------------------------------------------------------------------}
{   Programmname    :   GRAPH128.INC                                         }
{   Version         :   1.00                                                 }
{   Aufgabe         :   Include-File zur Unterstuetzung der 640*200 Grafik   }
{   Sprache         :   Turbo Pascal 3.00A                                   }
{   Computer        :   Commodore 128(D) mit RGBI-Monitor                    }
{   Betriebssystem  :   CP/M 3.0                                             }
{   Autor           :   Ralph Schlichtmeier                                  }
{   Copyright       :   Markt & Technik Verlag AG                            }
{----------------------------------------------------------------------------}

TYPE filename  = STRING [14];
     str80     = STRING [80];
     color     = (black, dk_grey, blue, lt_blue, green, lt_green, grey, cyan,
                  red, orange, violet, pink, brown, yellow, lt_grey, white);
     chardef   = ARRAY [32 .. 127, 0 .. 7] OF BYTE;
     switch    = (on, off, slow, fast, no);

VAR  charset1, charset2 : chardef;

{----------------------------------------------------------------------------}

PROCEDURE VDCregWr (reg, wert: BYTE);
  BEGIN
    INLINE ($01/$00/$D6/     {         LD   BC,00D6h  }
            $3A/reg/         {         LD   A,(reg)   }
            $ED/$79/         {         OUT  (C),A     }
            $ED/$78/         { status: IN   A,(C)     }
            $17/             {         RLA            }
            $D2/*-5/         {         JR   NC,status }
            $0C/             {         INC  C         }
            $3A/wert/        {         LD   A,(wert)  }
            $ED/$79)         {         OUT  (C),A     }
  END;

{----------------------------------------------------------------------------}

FUNCTION VDCregRd (reg: BYTE): BYTE;
  BEGIN
    INLINE ($01/$00/$D6/     {         LD   BC,00D6h  }
            $3A/reg/         {         LD   A,(reg)   }
            $ED/$79/         {         OUT  (C),A     }
            $ED/$78/         { status: IN   A,(C)     }
            $17/             {         RLA            }
            $D2/*-5/         {         JR   NC,status }
            $0C/             {         INC  C         }
            $ED/$68/         {         IN   L,(C)     }
            $26/$00/         {         LD   H,00h     }
            $C9)             {         RET            }
  END;

{----------------------------------------------------------------------------}

PROCEDURE VDCmemWr (adr : INTEGER; wert : BYTE);
  BEGIN
    VDCregWr (18, Hi (adr)); VDCregWr (19, Lo (adr)); VDCregWr (31, wert)
    { RAM-Adresse HighByte } { RAM-Adresse LowByte }  { Datenregister }
  END;

{----------------------------------------------------------------------------}

FUNCTION VDCmemRd (adr : INTEGER) : BYTE;
  BEGIN
    VDCregWr (18, Hi (adr)); VDCregWr (19, Lo (adr)); VDCmemRd := VDCregRd (31)
    { RAM-Adresse HighByte } { RAM-Adresse LowByte }  { Datenregister }
  END;

{----------------------------------------------------------------------------}

PROCEDURE VDCadrWr (adr : INTEGER);
  BEGIN
    VDCregWr (18, Hi (adr)); VDCregWr (19, Lo (adr));
    { RAM-Adresse HighByte } { RAM-Adresse LowByte }
  END;

{----------------------------------------------------------------------------}

PROCEDURE CursorFlash (cf : switch);
  VAR mode : BYTE;
  BEGIN
    CASE cf OF
      off  : mode := VDCregRd (10) AND 191 OR 32;
      slow : mode := VDCregRd (10) OR 96;
      fast : mode := VDCregRd (10) AND 223 OR 64;
      no   : mode := VDCregRd (10) AND 159
    ELSE
      mode := VDCregRd (10)
    END;
    VDCregWr (10, mode)
  END;

{----------------------------------------------------------------------------}

PROCEDURE AltChars (sw : switch);
  VAR mode : STRING [3];
  BEGIN
    IF sw = on THEN mode := 'G1' ELSE mode := 'G0';
    Write (CON, #27, mode)
  END;

{----------------------------------------------------------------------------}

PROCEDURE Flash (sw : switch);
  VAR mode : STRING [3];
  BEGIN
    IF sw = on THEN mode := 'G2' ELSE mode := 'G0';
    Write (CON, #27, mode)
  END;

{----------------------------------------------------------------------------}

PROCEDURE Underline (sw : switch);
  VAR mode : STRING [3];
  BEGIN
    IF sw = on THEN mode := 'G3' ELSE mode := 'G0';
    Write (CON, #27, mode)
  END;
{----------------------------------------------------------------------------}

PROCEDURE Reverse (sw : switch);
  VAR mode : STRING [3];
  BEGIN
    IF sw = on THEN mode := 'G4' ELSE mode := 'G0';
    Write (CON, #27, mode)
  END;
{----------------------------------------------------------------------------}

PROCEDURE InvScr;
  BEGIN
    VDCregWr (24, VDCregRd (24) XOR 64)
  END;

{----------------------------------------------------------------------------}

PROCEDURE Bell;
  BEGIN
    REPEAT
      Write (#7); Delay (500)
    UNTIL KeyPressed
  END;

{----------------------------------------------------------------------------}

PROCEDURE TextColor (txtcolor : color);
  CONST colorcode : ARRAY [0 .. 15] OF BYTE = (0, 12, 6, 14, 5, 13, 11, 3,
                                               2, 10, 8, 4, 9, 7, 15, 1);
  VAR txt : BYTE;
  BEGIN
    txt := 32 OR (colorcode [Ord (txtcolor)]);
    Write (CON, #27#27#27, Chr(txt))
  END;

{----------------------------------------------------------------------------}

PROCEDURE BackgroundColor (bgrcolor : color);
  VAR bgr : BYTE;
  BEGIN
    bgr := (VDCregRd (26) AND 240) OR Ord (bgrcolor);
    VDCregWr (26, bgr)
    { Farbregister unteres Nibble, Farbe aus Reg. 26 }
  END;

{----------------------------------------------------------------------------}

PROCEDURE HiResColor (hircolor : color);
  VAR hir : BYTE;
  BEGIN
    hir := (VDCregRd (26) AND 15) OR (Ord (hircolor) SHL 4);
    VDCregWr (26, hir)
    { Farbregister oberes Nibble, Farbe aus Attribut-RAM }
  END;

{----------------------------------------------------------------------------}

PROCEDURE ClrHiRes;
  VAR i : INTEGER;
  BEGIN
    VDCadrWr (0);
    VDCregWr (24, VDCregRd (24) AND 127); VDCregWr (31, 0);
    { Blockoperation = Fuellen }          { Datenregister = 0 }
    FOR i := 0 TO 63 DO
      BEGIN
        VDCregWr (30, 0)  { Anzahl Blockoperationen = 256 }
      END
  END;

{----------------------------------------------------------------------------}

PROCEDURE HiRes;
  VAR adr    : INTEGER;
      ch, by : BYTE;
  BEGIN
    Port [$D011] := (Port [$D011] AND 239);  { VIC ausschalten }
    FOR ch := 32 TO 127 DO
      BEGIN
        adr := $3000 + ch SHL 4;  { Gross-/Kleinzeichensatz retten }
        VDCadrWr (adr);
        FOR by := 0 TO 7 DO
          charset1 [ch, by] := VDCregRd (31);
        adr := $2000 + ch SHL 4;  { Gross-/Grafikzeichensatz retten }
        VDCadrWr (adr);
        FOR by := 0 TO 7 DO
          charset2 [ch, by] := VDCregRd (31)
      END;
    ClrHiRes;
    VDCregWr (25, 135)  { Grafikmodus ein } { oder: VDCregWr (25, 128) }
  END;
{----------------------------------------------------------------------------}

PROCEDURE TextMode;
  VAR adr    : INTEGER;
      ch, by : BYTE;
  BEGIN
    VDCregWr (25, 71);  { Grafikmodus aus } { oder: VDCregWr (25, 64) }
    ClrHiRes;
    FOR ch := 32 TO 127 DO
      BEGIN
        adr := $3000 + ch SHL 4;  { Gross-/Kleinzeichensatz retten }
        VDCadrWr (adr);
        FOR by := 0 TO 7 DO
          VDCregWr (31, charset1 [ch, by]);
        adr := $2000 + ch SHL 4;  { Gross-/Grafikzeichensatz retten }
        VDCadrWr (adr);
        FOR by := 0 TO 7 DO
          VDCregWr (31, charset2 [ch, by])
      END;
    ClrScr
  END;

{----------------------------------------------------------------------------}

PROCEDURE Plot (x, y : INTEGER; mode : BYTE);
  VAR adr  : INTEGER;
      wert : BYTE;
  BEGIN
    IF (x > -1) AND (x < 640) THEN
      IF (y > -1) AND (y < 200) THEN
        BEGIN
          adr := 80 * y + x SHR 3;
          IF mode = 1 THEN wert := VDCmemRd (adr) OR (128 SHR (x AND 7))
          ELSE wert := VDCmemRd (adr) AND NOT (128 SHR (x AND 7));
          VDCmemWr (adr, wert)
        END
  END;

{----------------------------------------------------------------------------}

FUNCTION GetDot (x, y : INTEGER) : BOOLEAN;
  VAR adr  : INTEGER;
      wert : BYTE;
  BEGIN
    IF (x > -1) AND (x < 640) THEN
      IF (y > -1) AND (y < 200) THEN
        BEGIN
          adr := 80 * y + x SHR 3; wert := 128 SHR (x AND 7);
          GetDot := (VDCmemRd (adr) AND wert) <> 0
        END
      ELSE
        GetDot := FALSE
  END;

{----------------------------------------------------------------------------}

PROCEDURE Draw (x1, y1, x2, y2 : INTEGER; mode : BYTE);
  VAR x, y, dx, dy, vx, vy, i, dsum : INTEGER;
  BEGIN
    dx := Abs (x2 - x1); dy := Abs (y2 - y1);
    IF x2 > x1 THEN vx := 1 ELSE vx := -1;
    IF y2 > y1 THEN vy := 1 ELSE vy := -1;

    x := x1; y := y1; Plot (x, y, mode);

    IF dx = 0 THEN  { Vertikale }
      IF vy = 1 THEN
        BEGIN
          FOR i := 1 TO dy DO
            BEGIN
              y := Succ (y); Plot (x, y, mode)
            END;
          Exit
        END
      ELSE
        BEGIN
          FOR i := 1 TO dy DO
            BEGIN
              y := Pred (y); Plot (x, y, mode)
            END;
          Exit
        END;

    IF dy = 0 THEN  { Horizontale }
      IF vx = 1 THEN
        BEGIN
          FOR i := 1 TO dx DO
            BEGIN
              x := Succ (x); Plot (x, y, mode)
            END;
          Exit
        END
      ELSE
        BEGIN
          FOR i := 1 TO dx DO
            BEGIN
              x := Pred (x); Plot (x, y, mode)
            END;
          Exit
        END;

    IF (dx >= dy) {AND (dy <> 0)} THEN
      BEGIN
        dsum := dx SHR 1;
        FOR i := 1 TO dx DO
          BEGIN
            dsum := dsum + dy;
            IF dsum >= dx THEN BEGIN dsum := dsum - dx; y := y + vy END;
            x := x + vx; Plot (x, y, mode)
          END
      END
    ELSE
    {IF (dx < dy) AND (dx <> 0) THEN}
      BEGIN
        dsum := dy SHR 1;
        FOR i := 1 TO dy DO
          BEGIN
            dsum := dsum + dx;
            IF dsum >= dy THEN BEGIN dsum := dsum - dy; x := x + vx END;
            y := y + vy;
            Plot (x, y, mode)
          END
      END
  END;

{----------------------------------------------------------------------------}

PROCEDURE Box (x1, y1, x2, y2 : INTEGER; mode : BYTE);
  VAR x, y, i, j : INTEGER;
  BEGIN
    x := x1; y := y1;
    IF mode > 1 THEN  { Filled Box }
    BEGIN
      IF mode = 3 THEN mode := 1 ELSE mode := 0;  { Filled Box setzen/loeschen }
      FOR i := x1 TO x2 DO
        BEGIN
          FOR j := y1 TO y2 DO
          BEGIN
            Plot (x, y, mode);
            y := Succ (y)
          END;
          y := y1;
          x :=Succ (x)
        END
    END
    ELSE  { Unfilled Box }
    BEGIN
      FOR i := x1 TO x2 DO
        BEGIN
          Plot (x, y1, mode); Plot (x, y2, mode);
          x := Succ (x)
        END;
      FOR i := y1 TO y2 DO
        BEGIN
          Plot (x1, y, mode); Plot (x2, y, mode);
          y := Succ (y)
        END
    END
  END;

{----------------------------------------------------------------------------}

PROCEDURE Circle (mx, my, r: INTEGER; mode : BYTE);
  VAR x, y, xcorr, ycorr, hr,
      mxpx, mxmx, mxpy, mxmy,
      mypx, mymx, mypy, mymy : INTEGER;
      m                      : BYTE;
  BEGIN
    m := mode AND 1;  { Circle setzen oder loeschen }
    x := r;
    y := 0;
    hr := Pred (x);
    REPEAT
      IF hr < 0 THEN
        BEGIN
          x := Pred (x); hr := hr + x SHL 1
        END;
      xcorr := x SHL 1; ycorr := y SHL 1;
      { Pixelgroessenverhaeltnis angleichen, y:x = 2:1 }
      mxpx := mx + xcorr; mxmx := mx - xcorr;
      mxpy := mx + ycorr; mxmy := mx - ycorr;
      mypx := my + x; mymx := my - x;
      mypy := my + y; mymy := my - y;
      Plot (mxpx, mymy, mode);  { 1. Quadrant bei x }
      Plot (mxmx, mymy, mode);  { 2. Quadrant bei x }
      Plot (mxmx, mypy, mode);  { 3. Quadrant bei x }
      Plot (mxpx, mypy, mode);  { 4. Quadrant bei x }
      Plot (mxpy, mymx, mode);  { 1. Quadrant bei y }
      Plot (mxmy, mymx, mode);  { 2. Quadrant bei y }
      Plot (mxmy, mypx, mode);  { 3. Quadrant bei y }
      Plot (mxpy, mypx, mode);  { 4. Quadrant bei y }
      IF mode > 1 THEN  { Filled Circle }
        BEGIN
          Draw (mxpx, mymy, mxmx, mymy, m);
          Draw (mxpx, mypy, mxmx, mypy, m);
          Draw (mxpy, mymx, mxmy, mymx, m);
          Draw (mxpy, mypx, mxmy, mypx, m)
        END;
      y := Succ (y); hr := Pred (hr) - y SHL 1;
    UNTIL y > x
  END;

{----------------------------------------------------------------------------}

PROCEDURE Ellipse (mx, my, a, b : INTEGER; mode : BYTE);
  VAR x, y,
      mxpx, mxmx, mypy, mymy : INTEGER;
      dx, dy, hr             : REAL;
      m                      : BYTE;
  BEGIN
    a := a SHL 1;  { Pixelgroessenverhaeltnis angleichen, y:x = 2:1 }
    m := mode AND 1;  { Ellipse setzen oder loeschen }
    x := a; y := 0;
    dx := 2.0 * a * a;
    dy := 2.0 * b * b;
    hr := 0.5 * dy * a;
    REPEAT
      mxpx := mx + x; mxmx := mx - x;
      mypy := my + y; mymy := my - y;
      Plot (mxpx, mymy, m);  { 1. Quadrant }
      Plot (mxmx, mymy, m);  { 2. Quadrant }
      Plot (mxmx, mypy, m);  { 3. Quadrant }
      Plot (mxpx, mypy, m);  { 4. Quadrant }
      IF hr < 0 THEN
        BEGIN
          x := Pred (x); hr := hr + dy * x
        END
      ELSE  { IF hr >= 0 THEN }
        BEGIN
          y := Succ (y); hr := hr - dx * y;
          IF mode > 1 THEN  { Filled Ellipse }
            BEGIN
              Draw (mxpx, mymy, mxmx, mymy, m);
              Draw (mxpx, mypy, mxmx, mypy, m)
            END
        END
    UNTIL x < 0
  END;

{----------------------------------------------------------------------------}

FUNCTION FileExists (name : filename) : BOOLEAN;
  VAR datei : FILE;
  BEGIN
    name := Concat (name, '.PIC');
    Assign (datei, name);
    {$I-} Reset (datei); {$I+}
    FileExists := (IOresult = 0)
  END;

{----------------------------------------------------------------------------}

PROCEDURE PutPic (name : filename);
  VAR datei  : FILE;
      i, j   : INTEGER;
      buffer : ARRAY [0 .. 1023] OF BYTE;
  BEGIN
    name := Concat (name, '.PIC');
    Assign (datei, name);
    Rewrite (datei);
    VDCadrWr (0);
    FOR i := 0 TO 15 DO
      BEGIN
        FOR j := 0 to 1023 DO
          buffer [j] := VDCregRd (31);
        BlockWrite (datei, buffer, 8)
      END;
    Close (datei)
  END;

{----------------------------------------------------------------------------}

PROCEDURE GetPic (name : filename);
  VAR datei  : FILE;
      i, j   : INTEGER;
      buffer : ARRAY [0 .. 1023] OF BYTE;
  BEGIN
    name := Concat (name, '.PIC');
    Assign (datei, name);
    Reset (datei);
    VDCadrWr (0);
    FOR i := 0 TO 15 DO
      BEGIN
        BlockRead (datei, buffer, 8);
        FOR j := 0 to 1023 DO
          VDCregWr (31, buffer [j])
      END;
    Close (datei)
  END;

{----------------------------------------------------------------------------}

PROCEDURE HiWrite (spalte, zeile : BYTE;  str : str80);
  VAR adr        : INTEGER;
      le, ch, by : BYTE;
  BEGIN
    IF (spalte > -1) AND (spalte < 80) THEN
      IF (zeile > -1) AND (zeile < 25) THEN
        BEGIN
          FOR le := 1 TO Length (str) DO
            BEGIN
              ch := Ord (str [le]);
              IF (ch > 31) AND (ch < 128) THEN
                BEGIN
                  adr := 640 * zeile + spalte;
                  FOR by := 0 TO 7 DO
                    BEGIN
                      VDCmemWr (adr, charset1 [ch, by]);
                      adr := adr + 80
                    END;
                  spalte := Succ (spalte);
                  IF spalte > 79 THEN
                    BEGIN
                      spalte := 0; zeile := Succ (zeile);
                      IF zeile > 24 THEN zeile := 0
                    END
                END
            END
        END
  END;

{----------------------------------------------------------------------------}

PROCEDURE Hardcopy;
  VAR by                          : INTEGER;
      zeile, bi, a, b, c, lstbyte : BYTE;
      vdcbyte                     : ARRAY [0 .. 639] OF BYTE;
  BEGIN
    WriteLn (LST, #10#10#10);  { drei Linefeed }
    WriteLn (LST, #27'3'#24);  { 24/216 inch Zeilenabstand }
    WriteLn (LST, #27'<');     { Unidirektional pro Zeile }
    VDCadrWr (0);
    FOR zeile := 0 TO 24 DO
      BEGIN
        FOR by := 0 TO 639 DO   { Bildschirmzeile einlesen }
          vdcbyte [by] := VDCregRd (31);
        Write (LST, #27'*'#4);  { Masterdruck 80 Dots/inch }
        Write (LST, #128#2);    { 640 Bytes pro Zeile }
        FOR by := 0 TO 639 DO   { Bildschirmzeile ausdrucken }
          BEGIN
            a := by SHR 3; b := by AND 7; c := 128 SHR b;
            lstbyte := 0;
            FOR bi := 0 TO 7 DO
              lstbyte := vdcbyte [80 * bi + a] AND c SHL b SHR bi OR lstbyte;
            Write (LST, Chr (lstbyte))
          END;
      END;
      Write (LST, #27'2');    { 1/6 inch Zeilenabstand }
      Write (LST, #10#10#10)  { drei Linefeed }
  END;
