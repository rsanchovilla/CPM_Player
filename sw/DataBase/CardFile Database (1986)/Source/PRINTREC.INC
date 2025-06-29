Procedure PrintRecord;
Var
   A: Integer;
Begin
   Write(chr(7));
   Gotoxy(60,24);
   Write('PRINTING      ');
   Writeln(Lst);
   Writeln(Lst);
   Write(Lst,'   ');
   Writeln(Lst,TagArray[1]);
   Write(Lst,'   ');
   For A := 1 to MaxColumns do Write(Lst,'=');
   Writeln(Lst);
   For Row := 1 to MaxRows do
   Begin
      Write(Lst,'   ');
      For Column := 1 to MaxColumns do
      Begin
         Write(Lst,CardArray[Column,Row]);
      End;
      Writeln(Lst);
   End;
   Write(Lst,'  ');
   For A := 1 to (MaxColumns + 1) do Write(Lst,'-');
   Writeln(Lst);
   Write(Lst,'  ');
   Write(Lst,TagArray[2]);
   Write(lst,' |');
   Write(Lst,TagArray[3]);
   Write(Lst,' |');
   Writeln(Lst,TagArray[4]);
   Writeln(Lst);
   Writeln(Lst);
   Gotoxy(60,24);
   ClrEOL;
End;
