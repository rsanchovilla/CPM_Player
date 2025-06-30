program grpdemo7;        { GetPic / PutPic }


{$I KERNEL.GIC   }
{$I BLOADSCR.GIC }
{$I GETPIC.GIC   }
{$I PALETTE.GIC  }

const  demobild = 'grpdemo6.sc5';

var    p:    array[0..6000] of byte;                  { Puffer mit viel Platz }
       x, y: integer;
       f:    file;

begin
  CrtInit;

  screen (5);
  bloadscreen (demobild);                                        { Bild laden }

  if IOresult <> 0
  then begin
    CrtExit;
    writeln ('Fehler beim Laden von ', demobild);
    halt;
    end;

  ColorRestore;                                              { Palette setzen }

  Color (3,0,0);

  SetPage (1, 1);  ClrScr;                    { andere Bildschirmseite wÑhlen }

  gotoXY (77, 0);
  write ('Ende mit ''RETURN''');

  randomize;

  repeat

    x := random (157);
    y := random (112);

    GetPic (p, x,y, x+99,y+99, 0);       { Zufalls-Rechteck von Seite 0 holen }

    LOGOPR := G_PSET;

    PutPic (p, 128,111, 1, 0);          { und vierfach gespiegelt auf Seite 1 }
    PutPic (p, 127,111, 1, 1);                                     { anzeigen }
    PutPic (p, 128,110, 1, 2);
    PutPic (p, 127,110, 1, 3);
    delay (1000);

    LOGOPR := G_TPRESET;

    PutPic (p, 128,111, 1, 0);             { dasselbe mit invertierten Farben }
    PutPic (p, 127,111, 1, 1);
    PutPic (p, 128,110, 1, 2);
    PutPic (p, 127,110, 1, 3);

  until keypressed;

  LOGOPR := G_PSET;
  readln;

  CrtExit;

  assign (f, 'DEMO.COM');                                   { zurÅck zum MenÅ }
  execute (f);
end.