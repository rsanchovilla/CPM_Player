PROGRAM whileloop(input,output);
TYPE
 integer = -32767..32767;
VAR
 j,k :integer;
BEGIN
   writeln('s');
   FOR k:=1 TO 10000 DO
   BEGIN
      j:=1;
      WHILE j<=10 DO j:=j+1
   END;

   writeln('e')
END.

 