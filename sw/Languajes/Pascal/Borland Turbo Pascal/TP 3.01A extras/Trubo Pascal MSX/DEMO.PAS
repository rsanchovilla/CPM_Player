program demo;    (* MenÅprogramm fÅr Demo-Dateien *)


{                WICHTIGER HINWEIS ZUM COMPILIEREN                  }
{                ===================================                }
{                                                                   }
{ Alle  Demo-Programme  von dieser Diskette mÅssen mit einer Start- }
{ adresse von $3DBC compiliert werden! Dies ist die minimale Start- }
{ adresse fÅr die Mapper-Routinen in MAPDEMO1.CHN und MAPDEMO2.CHN; }
{ die anderen Programme  haben  sich  daran  anzupassen,  weil  bei }
{ chain-Aufrufen  die  Startadressen  aller  Programme  gleich sein }
{ mÅssen.                                                           }


{$W0,C-}

type
  item       = (Datei, Beschreibung);
  Menuepunkt = array[item] of string[40];

const
  FOREVER = FALSE;
  num     = 11;
  menue: array [0..num] of Menuepunkt = (
          ('        ', 'Programm abbrechen'),
          ('GRPDEMO1', 'read & write im Grafikmodus'),
          ('GRPDEMO2', 'Sprites (TÅrme von Hanoi)'),
          ('GRPDEMO3', 'Zeichnen mit dem Lichtgriffel'),
          ('GRPDEMO4', 'Zeichnen mit der Maus'),
          ('GRPDEMO5', 'Zeichensatzdefinition'),
          ('GRPDEMO6', 'bloadscreen und CopyPic'),
          ('GRPDEMO7', 'GetPic und PutPic, LOGOPR'),
          ('MAPDEMO1', 'Memory Mapper: Jobliste'),
          ('MAPDEMO2', 'Memory Mapper: Textspeicher'),
          ('SHOOT-IT', 'SHOOT-IT (Interval usw.)'),
          ('PANTHER',  'Musik und Text-Windows'));

var f: file;
    c: char;
    i: integer;
    l: string[128] absolute $80;


{$I KERNEL.GIC  }
{$I COPYPIC.GIC }


procedure kasten (x1, y1, x2, y2: integer);

  var i: integer;

  begin
    for i := 1 to 5 do
      begin
      line (x1+i, y2+i,  x2+i, y2+i);
      lineto (x2+i, y1+i);
      end;

    i := ATRBYT;
    box (x1, y1, x2, y2);

    pencolor (paper);
    boxfill (x1+1, y1+1,  x2-1, y2-1);

    pencolor (i);
  end;



begin        (* Hauptprogramm *)

  CrtInit;
  color (15, 4, 4);
  screen (7);

  kasten (136, 40, 376, 56 + num * 8);

  for i := 0 to num do
    begin
    gotoXY (148, 44 + i * 8);
    write (chr(i+65), ': ', menue[i][Beschreibung]);
    end;

  if ParamCount > 0
  then c := copy (ParamStr(1), 1, 1)
  else c := ' ';

  l := '';

  repeat
    while not (c in ['A'..chr(num+65), 'a'..chr(num+97)]) do
      read (kbd, c);

    c := upcase (c);

    if c = 'A'
    then begin
      CrtExit;
      writeln ('tschÅ·...');
      Halt;
      end;

    color (11, 5, 4);

    i := ord(c) - ord('A');


    CopyPic (175,100, 342,129, 0,  0,0, 1);   { Fensterinhalt 1 retten }

    { in BASIC: COPY (175,100)-(342,129),0 TO (0,0),1                  }



    kasten  (175,100, 337,124);               { neues Fenster îffnen   }
    gotoXY  (181, 108);
    write (menue[i][Datei], '.CHN wird geladen');

    assign (f, menue[i][Datei]+'.CHN');
    {$I-}
    reset (f);
    close (f);
    if IOresult = 0
    then begin
      delay (2000);
      CrtExit;
      chain (f);
      if IOresult = $21
      then writeln ('CHAIN ist im Memory-Modus nicht erlaubt!');
      halt;
      end;

    color (1, 6, 4);
    CopyPic (166,80, 351,109, 0,  0,30, 1);   { Fensterinhalt 2 retten }
    kasten  (166,80, 346,104);                { neues Fenster îffnen   }

    gotoXY (172, 88);
    pencolor (15);
    write (menue[i][Datei], '.CHN nicht gefunden!');

    Delay (5000);
    c := ' ';

    CopyPic (0,30, 185,59, 1,  166,80,  0);   { Fensterinhalt 2 restaurieren }
    Delay (500);                              { damit man's verfolgen kann   }
    CopyPic (0,0,  167,29, 1,  175,100, 0);   { Fensterinhalt 1 restaurieren }
    color (15,4,4);

  until FOREVER;
end.
