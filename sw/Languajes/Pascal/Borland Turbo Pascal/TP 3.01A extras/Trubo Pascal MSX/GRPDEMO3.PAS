(* G R P D E M O 3 :    Zeichnen mit dem Lichtgriffel *)

{$I KERNEL.GIC   }
{$I JOYSTICK.GIC }
{$I LIGHTPEN.GIC }



var
  x, y: integer;

  f: file;



procedure exitbox;

  begin
    color (15, 9, border);
    gotoXY (2, 2);
    write (' ENDE ');
  end;



procedure finito;

  begin
    CrtExit;
    assign (f, 'DEMO.COM');
    execute (f);
  end;



procedure Anfangswert;

  begin
    repeat until penvalid;
    lightpen (x, y);
    if (x < 38) and (y < 10)
    then finito
    else pset (x, y);
  end;



procedure linie;

  begin
    while penswitch do
      if penvalid
      then begin
        lightpen (x, y);
        lineto   (x, y);
        end;
  end;


begin
  CrtInit;

  if not (IsLightpen and MSX2)
  then begin
    writeln ('No lightpen!');
    delay(1000);
    finito;
    end;

  screen (7);
  CalibrateLightpen;
  color (15, 4, 0);
  ClrScr;
  exitbox;
  repeat
    Anfangswert;
    Linie;
  until FALSE;
end.
