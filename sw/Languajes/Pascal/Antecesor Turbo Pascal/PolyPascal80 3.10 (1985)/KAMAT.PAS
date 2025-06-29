Program Kamat;
var osszeg,kamatlab:real;
    i,ev:integer;
begin
  Write(chr(12));
  Writeln('Kamatos kamat szamitas eves bontasban');
  Write('Osszeg:       ');Readln(osszeg);
  Write('Kamatlab (%): ');Readln(kamatlab);
  Write('Ev:           ');Readln(ev);
  Writeln;
  for i:=1 to ev do begin
    osszeg:=osszeg*(1+kamatlab/100);
    Writeln(i:2,'. ev vegen az osszeg: ',osszeg:10:2)
  end
end.