program a;

{
display the osborne 1 graphic characters chr(0) .. chr(31) 
}

var i: integer;
    s: array[0..128] of byte absolute $F200;

begin 
  writeln(#26,'Osborne 1 Graphic characters');
  writeln;
  writeln('                    1                   2                   3');
  writeln('0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1');
  writeln; 
  writeln; 
  writeln; 
  writeln; 
  
  for i := 0 to 31 do begin
    s[i*2] := i;
  end;  
end.  

