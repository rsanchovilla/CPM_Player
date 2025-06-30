program Acktest;
(* Implementation of Ackermann's function *)

var
  maxdepth,
  depth,
  m,n:integer;
  count:long_integer;
function Ack(m,n:integer):integer;
begin
  count := count+1;  
  depth := depth+1;
  if depth > maxdepth then maxdepth := depth;
  if m=0 then Ack := n+1 else
     if n=0 then Ack := Ack(m-1,1) else
        Ack := Ack ( m-1, Ack (m,n-1) );
  depth := depth - 1;
end;
begin
  repeat
  depth:=0;
  count:=0;
  maxdepth:=0;
  write('Input M,N followed by return (or -1 to exit) : ');
  read(m);
  if m<0 then exit(Acktest);
  read(n);
  if n<0 then exit(Acktest);
  if (m<0) or (n<0) then exit(Acktest);
  write('ACK(',m,',',n,') = ');
  writeln(Ack(m,n),' count=',count,' depth=',maxdepth);
  until false;
end.
