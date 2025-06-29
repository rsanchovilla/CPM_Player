Procedure Inputscr;
Var
   Chrnum:        Integer;
   TempKey:        String[18];
   Quit,Flag1, Flag2: Boolean;

Begin
   DisplayScr;
   DisplayRec;
   Gotoxy(16,24); Write(FilePointer:4);
   Repeat
      ReadKey;
      EditScr;
      Gotoxy(60,24);
      Write('(^P to print)');
      Gotoxy(28,24);
      Write('Is the above correct? (Y/N)  ');
      Repeat
         Read(Kbd,Key);
         Key := upcase(Key);
         If Key = chr(16) then
         Begin
            Gotoxy(60,24);
            Write('Please wait...');
            Write(chr(7));
            PrintRecord;
         end;
      Until Key in['Y','N'];
      Write(Key);
      Delay(100);
      Gotoxy(28,24);
      ClrEOL;
      If Key = 'Y' then
      Begin
         Clrscr;
      End
      Else
      Begin
         Write(chr(7));
      End;
   Until Key = 'Y';
End;
