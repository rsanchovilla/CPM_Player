
{ ------------------------- SOUND.INC -----------------------------
  Include-File fuer Sound-befehle auf dem JOYCE unter Turbo Pascal.
  Stellt (bislang) folgende Prozeduren zur Verfuegung:

     procedure Sound_On     -> Beeper an
     procedure Sound_Off    -> Beeper aus
     procedure Play(...)    -> Beeperzyklus Anzahl/Ein-/Auspause

   Kann eigenstaendig oder mit der Grafikerweiterung verwendet
   werden, letzterenfalls sind die Einschraenkungen zu beachten.

--------------------------------------------------------------------- }


procedure Sound_On;
begin
  port[248]:=11;
end;

procedure Sound_Off;
begin
  port[248]:=12;
end;

procedure Play(Num,On,Off:integer);
var i,j : integer;
begin
  for i:=1 to Num do
  begin
    Sound_On;
    for j:=1 to On do;
    Sound_Off;
    for j:=1 to Off do;
  end;
end;


{ ------------------ Ende von SOUND.INC ---------------------- }

