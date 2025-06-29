
program PrintTest;

{$IKERNEL.INC}
{$IPRINTAT.INC}
{$ISPRINTAT.INC}

var Schrift  : integer;
    Zeichen  : char;

begin
  GraphInit;
  for Schrift:=0 to 4 do
  begin
   clrscr;
   HideCursor;
   PrintAT(10,10,Schrift,0,'Hallo Heading 0');
   PrintAT(15,15,Schrift,1,'Hallo Heading 1');
   PrintAT(50,30,Schrift,2,'Hallo Heading 2');
   PrintAT(60,30,Schrift,3,'Hallo Heading 4');
   readln(Zeichen);
  end;
  for Schrift:=0 to 4 do
  begin
   clrscr;
   HideCursor;
   SPrintAT(10,10,Schrift,0,'Hallo Heading 0');
   SPrintAT(15,15,Schrift,1,'Hallo Heading 1');
   SPrintAT(50,30,Schrift,2,'Hallo Heading 2');
   SPrintAT(60,30,Schrift,3,'Hallo Heading 4');
   readln(Zeichen);
  end;

  ShowCursor
end.

