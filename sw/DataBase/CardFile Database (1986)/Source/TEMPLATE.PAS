Program TEMPLATE;

{$I VARIABLE.INC}

{$I IOERR.INC}

{$I INITVAR.INC}

{$I READ0.INC}

{$I DATASCR.INC}

{$I DISPLSCR.INC}

{$I HELPSCR.INC}

{$I EDITSCR.INC}

{$I WRTCARD.INC}

Procedure Inputscr;
Var
   Chrnum:        Integer;
   TempKey:        String[18];
   Quit,Flag1, Flag2: Boolean;

Begin
   FilePointer := 0;
   Initvar;
   ReadRecord0;
   Displayscr;
   Displayrec;
   Repeat
      EditScr;
      Gotoxy(28,24);
      Write('Is the above correct? (Y/N)  ');
      Repeat
         Read(Kbd,Key);
         Key := upcase(Key);
      Until Key in['Y','N'];
      If Key = 'N' then
      Begin
         Gotoxy(28,24);
         ClrEOL;
      End;
   Until Key = 'Y';
   WriteCardFile;
End;

Begin
   {$I-}
   Filename := concat(Drive,'CARDFILE');
   Assign(Disk2,Filename);
   Reset(Disk2);
   IOError;
   Inputscr;
   Clrscr;
   Close(Disk2);
   Assign(Disk,'MENU.COM');
   IOError;
   {$I+}
   Execute(Disk);
End.