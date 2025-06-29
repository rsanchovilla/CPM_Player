Program Terfog;
Var sugar,magassag,terfogat:real;
    key:char;

Procedure Ink(i:byte);
begin
  Write(Chr(27),'i',i)
end;

Begin
  repeat
    Sugar:=0;Magassag:=0;
    Write(Chr(12));
    Ink(2);Gotoxy(27,8);Write('Henger  terfogatszamitasa');
    Ink(0);
    Gotoxy(28,11);Write('Sugar    :            cm');
    Gotoxy(28,13);Write('Magassag :            cm');
    Gotoxy(28,15);Write('------------------------');
    Gotoxy(28,16);Write('Terfogat =            m3');
    Ink(2);
    Gotoxy(39,11);Readln(Sugar);
    Gotoxy(39,11);Write(Sugar:10:2);
    Gotoxy(39,13);Readln(Magassag);
    Gotoxy(39,13);Write(Magassag:10:2);
    Terfogat:=(Sqr(sugar)*Pi*magassag)/1e6;
    Gotoxy(39,16);Write(Terfogat:10:2);
    Ink(0);
    Gotoxy(48,22);Write('ENTER / ESC');
    repeat
      read(kbd,key)
    until (key=Chr(13)) or (key=Chr(27))
  until key=chr(27);
  Writeln;
end.