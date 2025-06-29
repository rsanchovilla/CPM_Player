{----------------------------------------------------------------------------}
{   Programmname    :   PUTCHARS.PAS                                         }
{   Version         :   1.01                                                 }
{   Aufgabe         :   File zum Auslesen der Zeichen im VDC-RAM             }
{   Sprache         :   Turbo Pascal 3.00A                                   }
{   Computer        :   Commodore 128(D) mit RGBI-Monitor                    }
{   Betriebssystem  :   CP/M 3.0                                             }
{   Autor           :   Ralph Schlichtmeier                                  }
{   Copyright       :   Markt & Technik Verlag AG                            }
{----------------------------------------------------------------------------}

PROGRAM PutChars;

TYPE filename  = STRING [14];

VAR fname : filename;
    ch    : CHAR;

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

FUNCTION VDCmemRd (adr : INTEGER) : BYTE;
  BEGIN
    VDCregWr (18, Hi (adr)); VDCregWr (19, Lo (adr)); VDCmemRd := VDCregRd (31)
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

PROCEDURE WrChars (name : filename);
  VAR datei  : FILE;
      i      : INTEGER;
      buffer : ARRAY [0 .. 2047] OF BYTE;
  BEGIN
    name := Concat (name, '.CHR');
    Assign (datei, name);
    Rewrite (datei);
    FOR i := 0 TO 2047 DO
      buffer [i] := VDCmemRd ($3000 + i);  { Gross-/Kleinzeichensatz }
    BlockWrite (datei, buffer, 16);
    FOR i := 0 TO 2047 DO
      buffer [i] := VDCmemRd ($2000 + i);  { Gross-/Grafikzeichensatz }
    BlockWrite (datei, buffer, 16);
    Close (datei)
  END;

{----------------------------------------------------------------------------}

BEGIN
  WriteLn;
  WriteLn ('PUTCHARS');
  Write (' Bitte Filenamen des Zeichensatzes ohne Extend eingeben: ');
  BufLen := 10; ReadLn (fname);
  IF fname = '' THEN Exit;
  IF FileExists (fname) THEN
    BEGIN
      Write (#7, ' File ueberschreiben? (J/N) ');
      ReadLn (ch);
      IF ch = 'j' THEN WrChars (fname) ELSE Exit
    END;
  WrChars (fname)
END.