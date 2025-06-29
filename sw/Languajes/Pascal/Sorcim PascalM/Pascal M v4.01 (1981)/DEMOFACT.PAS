program factor;

type
  num_type = real;
  
var 
  m : integer;
  
function rfact ( m : real ) : real;
begin
  if m = 0 then 
     rfact := 1
  else 
     rfact := rfact (m-1) * m;
end(*rfact*);
  
function fact ( m : long_integer ) : long_integer;
begin
  if m = 0 then 
     fact := 1
  else 
     fact := fact (m-1) * m;
end(*fact*);

begin(*main*)
  repeat
     write('Enter number (negative to exit): ');
     read(m);
     if m<0 then exit(factor);
     if m<13 then
        writeln(' factorial = ',fact(m) )
     else
        writeln(' factorial = ',rfact(m) )
  until false;
end.
