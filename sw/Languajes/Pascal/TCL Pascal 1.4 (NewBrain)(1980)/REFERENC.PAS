PROGRAM reference(input,output);
TYPE
 integer = -32767..32767;
VAR
 j,k :integer;

PROCEDURE refer5(VAR i:integer);
BEGIN
    j:=1
END;
PROCEDURE refer4(VAR i:integer);
BEGIN
    refer5(i)
END;
PROCEDURE refer3(VAR i:integer);
BEGIN
    refer4(i)
END;
PROCEDURE refer2(VAR i:integer);
BEGIN
    refer3(i)
END;
PROCEDURE refer1(VAR i:integer);
BEGIN
    refer2(i)
END;

BEGIN
   writeln('s');
   j:=0;
   FOR k:=1 TO 10000 DO
       refer1(j);
   writeln('e')
END.

 