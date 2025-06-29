Program Csatorna;
{$I grafcs.ppu}
const x:integer=640;y:integer=360;
var a,a1,c,c1:integer;
    r:byte;

Procedure Tuzlabda(szin,x1,y1:integer);
var jel:byte;
    sugar:integer;
begin
  Linemode(101,3);
  Ink(101,szin);Beam(101,1);
  for jel:=1 to 2 do
    for sugar:=1 to 21 do begin
      Plot(101,x1,y1);Ellipse(101,sugar*30,sugar*30)
    end;
  Linemode(101,0)
end;

begin
  Graf_ON(101,1,3,40,20);
  Display(101,1,1,20);
  for r:=1 to 255 do begin
    Ink(101,r);
    a:=x-r-220;a1:=y-r-50;
    c:=x+r+220;c1:=y+r+50;
    Box(101,a,a1,c,c1)
  end;
  Beam(101,0);Plot(101,x,y);
  repeat
    Tuzlabda(Random(254)+1,x,y);
  until KeyPress;
  Graf_OFF(101)
end.