(* G R P D E M O 4 :    Zeichnen mit der Maus *)

{$I KERNEL.GIC   }
{$I JOYSTICK.GIC }
{$I MOUSE.GIC    }
{$I SPRITES.GIC  }



var
  x, y: integer;

  f: file;



{ In der linken oberen Ecke gibt es ein kleines rotes KÑstchen, in dem }
{ steht das Wort "ENDE":                                               }

procedure exitbox;

  begin
    color (15, 9, border);
    gotoXY (2, 2);
    write (' ENDE ');
  end;



{ "finito" schaltet zurÅck in den Textmodus und ruft das MenÅprogramm auf. }

procedure finito;

  begin
    CrtExit;
    assign (f, 'DEMO.COM');
    execute (f);
  end;




{ "InitMaus" prÅft, ob eine Maus vorhanden ist, und definiert ein Sprite }
{ als Mauszeiger.                                                        }

procedure InitMaus;

  begin
    if not IsMouse(1) then finito;                 { Keine Maus? -> raus! }
    SetSpriteSize (0);                             { 8 * 8 - Sprites      }
    DefSprite (0, #$10#$10#$10#$EE#$10#$10#$10);   { Sprite-Pattern "+"   }
    DefSprite (1, #$00#$28#$6C#$00#$6C#$28#$00);   { Sprite-Pattern "o"   }
    SpriteColor (0,15);                            { wei·es "+"           }
    SpriteColor (1, 5);                            { blaues "o"           }
    x := 256; y := 106;                            { Anfangskoordinaten   }
  end;



{ "MausZeiger" fragt die Maus ab, setzt den Mauszeiger auf dem Bildschirm }
{ entsprechend um und liefert in x und y die aktuelle Mausposition zurÅck.}

procedure MausZeiger (var x,y: integer);

  begin
    GetMouse (1, x, y);                            { Maus abfragen       }

    if x < 0 then x := 0                           { x-Koordinaten auf   }
    else if x > 511 then x := 511;                 { 0..511 begrenzen    }

    if y < 0 then y := 0                           { y-Koordinaten auf   }
    else if y > 211 then y := 211;                 { 0..211 begrenzen    }

    { Mit PutSprite wird der Mauszeiger gesetzt. Dabei ist zweierlei zu  }
    { beachten:                                                          }
    { Die x-Werte der Spritekoordinaten gehen auch in Screen 6 und 7 nur }
    { von 0 bis 255, nicht bis 511. Deshalb mu· der x-Wert erst durch 2  }
    { geteilt werden. Au·erdem soll das Sprite mit der Mitte auf der ak- }
    { tuellen Mausposition erscheinen; Bezugspunkt fÅr PutSprite ist aber}
    { die linke obere Ecke. Wird das Sprite um drei Punkte nach links    }
    { und vier Punkte nach oben verschoben, dann stimmt's.               }

    PutSprite (0, (x div 2)-3, y-4);
    PutSprite (1, (x div 2)-3, y-4);
  end;



{ "Anfangswert" schiebt so lange den Mauszeiger auf dem Bildschirm herum, }
{ bis die linke Maustaste gedrÅckt wird. Befindet sich der Mauszeiger in  }
{ diesem Augenblick in dem roten "ENDE"-KÑstchen, wird das Programm be-   }
{ endet; sonst ist der aktuelle Punkt Anfangspunkt einer neuen Linie.     }

procedure Anfangswert;

  begin
    repeat Mauszeiger(x,y) until LeftButton(1);        { Warten auf Taste }

    if (x < 38) and (y < 10)                           { Wenn im KÑstchen }
    then finito                                        { dann Ende        }
    else pset (x, y);                                  { sonst zeichnen   }
  end;




{ "linie" verbindet alle mit der Maus angefahrenen Punkte, bis die linke  }
{ Maustaste wieder losgelassen wird.                                      }

procedure linie;

  begin
    while Leftbutton(1) do
      begin
      Mauszeiger (x, y);
      lineto     (x, y);
      end;
  end;


begin
  CrtInit;
  screen (7);
  color (15, 4, 0);
  ClrScr;
  exitbox;
  InitMaus;
  repeat
    Anfangswert;
    Linie;
  until FALSE; { endlos wiederholen; das Programm-Ende ist in "Anfangswert". }
end.
