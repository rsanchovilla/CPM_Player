program grpdemo6;   { bloadscreen, setpage, palette, CopyPic }



{$I KERNEL.GIC   }
{$I BLOADSCR.GIC }
{$I PALETTE.GIC  }
{$I COPYPIC.GIC  }
{$I SYMBOL.GIC   }

const
  demobild = 'grpdemo6.sc5';

var i: integer;
    f: file;


begin
  CrtInit;
  color (3,0,0);
  screen (5);

  gotoXY (70, 106);
  writeln ('Bild wird geladen...');

  SetPage (0, 3);                    { 0 = Angezeigte Seite, 3 = Arbeitsseite }

  bloadscreen (demobild);                { -> unsichtbar auf die Arbeitsseite }

  i := IOresult;                                         { Fehler beim Laden? }
  if i = 0
  then begin
    symbol (8,170, 12,24, 'RETURN-Taste drÅcken');   { Mitteilung vorbereiten }

    SetPage (3, 3);                                           { Bild anzeigen }
    ColorRestore;                                   { Palette aus VRAM setzen }

    CopyPic (0,0, maxX,maxY, ACPAGE, 0,0, 3-ACPAGE);  { Bild auf andere Seite }

    readln;


    { Der Quell- und Zielbereich Åberlappen sich,  }
    { deshalb die Kopierrichtung beachten!         }

    { Falsch: COPY (70,70)-(170,170) TO (80,80)    }
    { Der Copy-Befehl Åberschreibt die Vorlage!    }

    CopyPic (70,70, 170,170, ACPAGE,  80,80, ACPAGE); box (80,80, 180,180);


    readln;

    CopyPic (0,0, maxX,maxY, 3-ACPAGE, 0,0, ACPAGE);   { Original zurÅckholen }

    readln;

    { Richtig: COPY (170,170)-(70,70) TO (180,180) }
    { Vom anderen Ende her kopieren bringts!       }

    CopyPic (170,170, 70,70, ACPAGE,  180,180, ACPAGE); box (80,80, 180,180);

    readln;
    end;

  CrtExit;

  if i <> 0 then writeln ('Fehler: IOresult = ', i);    { evtl. Fehlermeldung }

  assign (f, 'DEMO.COM');
  execute (f);                                              { zurÅck zum MenÅ }
end.
