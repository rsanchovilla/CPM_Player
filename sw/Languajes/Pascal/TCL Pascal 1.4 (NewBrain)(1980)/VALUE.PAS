PROGRAM value(input,output);
TYPE
 integer = -32767..32767;
VAR
 j,k :integer;

PROCEDURE value5(i:integer);
BEGIN
    j:=1
END;
PROCEDURE value4(i:integer);
BEGIN
    value5(i)
END;
PROCEDURE value3(i:integer);
BEGIN
    value4(i)
END;
PROCEDURE value2(i:integer);
BEGIN
    value3(i)
END;
PROCEDURE value1(i:integer);
BEGIN
    value2(i)
END;

BEGIN
   writeln('s');
   j:=0;
   FOR k:=1 TO 10000 DO
       value1(j);
   writeln('e')
END.

 