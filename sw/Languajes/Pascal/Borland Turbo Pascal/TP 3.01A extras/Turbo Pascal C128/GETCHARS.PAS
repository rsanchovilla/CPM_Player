{----------------------------------------------------------------------------}
{   Programmname    :   GETCHARS.PAS                                         }
{   Version         :   1.01                                                 }
{   Aufgabe         :   File zum Schreiben der Zeichen ins VDC-RAM           }
{   Sprache         :   Turbo Pascal 3.00A                                   }
{   Computer        :   Commodore 128(D) mit RGBI-Monitor                    }
{   Betriebssystem  :   CP/M 3.0                                             }
{   Autor           :   Ralph Schlichtmeier                                  }
{   Copyright       :   Markt & Technik Verlag AG                            }
{----------------------------------------------------------------------------}

PROGRAM GetChars;

TYPE filename  = STRING [14];

VAR fname : filename;

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

PROCEDURE VDCmemWr (adr : INTEGER; wert : BYTE);
  BEGIN
    VDCregWr (18, Hi (adr)); VDCregWr (19, Lo (adr)); VDCregWr (31,wert)
    { RAM-Adresse HighByte } { RAM-Adresse LowByte }  { Datenregister }
  END;

{----------------------------------------------------------------------------}

FUNCTION FileExists (name : filename) : BOOLEAN;
  VAR datei : FILE;
  BEGIN
    name := Concat (name, '.CHR');
    Assign (datei, name);
    {$I-} Reset (datei); {$I+}
    FileExists := (IOresult = 0)
  END;

{----------------------------------------------------------------------------}

PROCEDURE RdChars (name : filename);
  VAR datei  : FILE;
      i      : INTEGER;
      buffer : ARRAY [0 .. 2047] OF BYTE;
  BEGIN
    name := Concat (name, '.CHR');
    Assign (datei, name);
    Reset (datei);
    BlockRead (datei, buffer, 16);
    FOR i := 0 to 2047 DO
        VDCmemWr ($3000 + i, buffer [i]);  { Gross-/Kleinzeichensatz }
    BlockRead (datei, buffer, 16);
    FOR i := 0 to 2047 DO
        VDCmemWr ($2000 + i, buffer [i]);  { Gross-/Grafikzeichensatz }
    Close (datei)
  END;

{----------------------------------------------------------------------------}

BEGIN
  VDCregWr (25, 71);  { Grafikmodus aus }  { oder: VDCregWr (25, 64) }
  WriteLn;
  WriteLn ('GETCHARS');
  Write (' Bitte Filenamen des Zeichensatzes ohne Extend eingeben: ');
  BufLen := 10; ReadLn (fname);
  IF fname = '' THEN Exit;
  IF (fname = 'a') OR (fname = 'A') THEN fname := 'ASCII';
  IF (fname = 'd') OR (fname = 'D') THEN fname := 'DIN';
  IF (fname = 'i') OR (fname = 'I') THEN fname := 'IBM';
  IF NOT FileExists (fname) THEN
    BEGIN
      WriteLn (#7, ' File existiert nicht ! ');
      Exit
    END;
  RdChars (fname)
END.