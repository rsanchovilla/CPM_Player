PROGRAM outest(input,output);
{ out put 1000 characters to the screen time on 32K and 96K system}

CONST
 length = 50000;
TYPE
 number = 1..length;
VAR
 count,maxcount :number;
 letter         :char;

BEGIN
 letter:='A';
 write(chr(31),'Start run :enter number of characters ');
 readln(maxcount);
 FOR count :=1 TO maxcount  DO
     write(letter);
 writeln(chr(31),'End of run.');
END.

 