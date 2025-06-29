Program Torzstenyeyok;
var szam,oszto,elozo,hatv:integer;
    elso:boolean;
begin
  Write(Chr(12));
  Writeln('Torsztenyezokre bontas');
  Write('Szam: ');readln(szam);
  Write('Torzstenyezoi: ');
  elozo:=2;hatv:=0;elso:=true;
  while szam<>1 do begin
    oszto:=2;
    while (szam mod oszto)<>0 do
      oszto:=oszto+1;
    if elso then begin
      elozo:=oszto;elso:=false;
      Write(oszto)
    end;
    if elozo=oszto then
      hatv:=hatv+1
    else
      if hatv>1 then begin
        write('^',hatv,' * ',oszto);
        hatv:=1
      end
      else
        Write(' * ',oszto);
    szam:=szam div oszto;
    if (szam=1) and (elozo=oszto) and (hatv>1) then
      Write('^',hatv);
    elozo:=oszto
  end;
  Writeln
end.