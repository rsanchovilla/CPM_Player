PROGRAM noparameters(input,output);
TYPE
 integer = -32767..32767;
VAR
 j,k :integer;

PROCEDURE none5;
BEGIN
    j:=1
END;
PROCEDURE none4;
BEGIN
    none5
END;
PROCEDURE none3;
BEGIN
    none4
END;
PROCEDURE none2;
BEGIN
    none3
END;
PROCEDURE none1;
BEGIN
    none2
END;

BEGIN
   writeln('s');
   j:=0;
   FOR k:=1 TO 10000 DO
       none1;

   writeln('e')
END.

 