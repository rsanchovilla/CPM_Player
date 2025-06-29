
{ ------------------------- SIMPLE.INC ----------------------------
  Include-File fuer einfachste Grafikbefehle auf dem JOYCE unter
  Turbo Pascal. Stellt folgende Prozeduren zur Verfuegung:

     procedure S_Horizontal() -> Horizontale Linie
     procedure S_Vertikal()   -> Vertikale Linie
     procedure S_Box()        -> Rechteck zeichnen

  Es wird das Include-File KERNEL.INC benoetigt...

--------------------------------------------------------------------- }


procedure S_Horizontal (x1,x2:integer; y,m:byte);
var i : integer;
begin
  for i:=x1 to x2 do Plot(i,y,m);
end;

procedure S_Vertikal (x:integer; y1,y2,m:byte);
var i : byte;
begin
  for i:=y1 to y2 do Plot(x,i,m);
end;

procedure S_Box (x:integer; y:byte; xlen:integer; ylen,m:byte);
begin
  S_Horizontal(x,x+xlen,y,m);
  S_Vertikal(x,y,y+ylen,m);
  S_Horizontal(x,x+xlen,y+ylen,m);
  S_Vertikal(x+xlen,y,y+ylen,m);
end;

{ ------------------ Ende von SIMPLE.INC ---------------------- }

