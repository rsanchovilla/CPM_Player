PROGRAM repeatloop(input,output);
TYPE
 integer = -32767..32767;
VAR
 j,k :integer;
BEGIN
   writeln('s');
   FOR k:=1 TO 10000 DO
   BEGIN
      j:=1;
      REPEAT
          j:=j+1;
      UNTIL j>10;

   END;
   writeln('e')
END.

 