PROGRAM maths(input,output);
TYPE
   integer = -32767..32767;
VAR
   k :integer;
   x,y :real;
BEGIN
   writeln('s');
   FOR k:=1 TO 1000 DO
   BEGIN
       x:=sin(k);
       y:=exp(x);
   END;
   writeln('e')
END.
 