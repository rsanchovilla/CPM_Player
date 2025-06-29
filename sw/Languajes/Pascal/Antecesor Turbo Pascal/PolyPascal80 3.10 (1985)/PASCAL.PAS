Program Pascal;
const sor=12;
var c,i,k:integer;
begin
  Write(Chr(12));
  for i:=0 to sor do begin
    GotoXY(37-i*3,i+1);
    c:=1;
    for k:=0 to i do begin
      Write(c:6);
      c:=c*(i-k) Div (k+1)
    end;
    Writeln
  end;
end.