PROGRAM vector(input,output);
TYPE
 integer = -32767..32767;
VAR
 j,k :integer;
 matrix : ARRAY[0..10] OF integer;
BEGIN
   writeln('s');
   matrix[0]:=0;
   FOR k:=1 TO 10000 DO
       FOR j:=1 TO 10 DO
           matrix[j]:=matrix[j-1];
   writeln('e')
END.

 �