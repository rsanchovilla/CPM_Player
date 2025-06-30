Program UNDELETE;

{$I VARIABLE.INC}  (* Golbal variables for all programs *)

{$I IOERR.INC}     (* IOError *)

{$I INITVAR.INC}   (* Initvar *)

{$I PRINTREC.INC}  (* PrintRecord *)

{$I DATASCR.INC}   (* Displayscr *)

{$I DISPLSCR.INC}  (* Displayrec *)

{$I INPUT.INC}     (* Input(PositinPtr,Y,Len) *)

{$I EDITSCR.INC}   (* Editscr *)

{$I READKEY.INC}   (* ReadKey *)

{$I HELPSCR.INC}   (* Help *)

Procedure GetCardRecord;
Begin
   {$I-}
   Seek(Disk2,FilePointer);
   IOError;
   With Cardrec do
   Begin
      Read(Disk2,Cardrec);
      IOError;
      For Row := 1 to MaxRows do
      Begin
         For Column := 1 to MaxColumns do
         Begin
            CardArray[Column,Row] := XCardArray[Column,Row];
         End;
      End;
   End;
   {$I+}
End;

Procedure WriteTagFile;
Begin
   Used := true;
   {$I-}
   Seek(Disk1,FilePointer);
   IOError;
   With KeyRec do
   Begin
      For Row := 1 to MaxKeys do
      Begin
         XTagArray[Row] := TagArray[Row];
      End;
      XUsed := Used;
      Write(Disk1,Keyrec);
      IOError;
   End;
   {$I+}
End;

Procedure WriteCardFile;
Begin
   {$I-}
   Seek(Disk2,FilePointer);
   IOError;
   With CardRec do
   Begin
      For Row := 1 to MaxRows do
      Begin
         For Column := 1 to MaxColumns do
         Begin
            XCardArray[Column,Row] := CardArray[Column,Row];
         End;
      End;
      Write(Disk2,CardRec);
      IOError;
   End;
   {$I+}
End;

Procedure Inputscr;
Var
   Chrnum:        Integer;
   TempKey:        String[18];
   Quit,Flag1, Flag2: Boolean;

Begin
   Repeat
      ReadKey;
      EditScr;
      Gotoxy(28,24);
      Write('Is the above correct? (Y/N)  ');
      Repeat
         Read(Kbd,Key);
         Key := upcase(Key);
         Gotoxy(1,24);
         ClrEOL;
      Until Key in['Y','N'];
   Until Key = 'Y';
   WriteTagFile;
   WriteCardFile;
End;

Procedure SearchFiles;
Var
   ZKey:       Char;
   Found:      Boolean;


   Procedure CheckRecord;
   Var
      Count: Integer;
   Begin
      {$I-}
      Seek(Disk1,FilePointer);
      IOError;
      With Keyrec do
      Begin
         Read(Disk1,Keyrec);
         IOError;
         For Count := 1 to 4 do
         Begin
            TagArray[Count] := XTagArray[Count];
         End;
         Used := XUsed;
      End;
      {$I+}
      If NOT Used then Found := true;
   End;


Begin
   Found := false;
   For FilePointer := 1 to (FileEndPointer-1) do
   Begin
      CheckRecord;
      If NOT Used then
      Begin
         GetCardRecord;
         DisplayScr;
         DisplayRec;
         Gotoxy(1,24);
         Write('Edit this record? (Y/N)...{ <ESC> = Quit }  ');
         Repeat
            Read(Kbd,ZKey);
            ZKey := upcase(ZKey);
            If ZKey = #27 then
            Begin
               Clrscr;
               Writeln;
               Writeln;
               Writeln('Returning to the Main Menu... ');
               Close(Disk1);
               Close(Disk2);
               Assign(Disk,'MENU.COM');
               Execute(Disk);
            End;
         Until ZKey in['Y','N'];
         If ZKey = 'Y' then
         Begin
            Gotoxy(1,24);
            ClrEOL;
            Inputscr;
         End;
      End;
      Clrscr;
   End;
   If NOT Found then
   Begin
      Writeln;
      Writeln;
      Writeln('No Deleted Records Available.');
      Writeln;
      Writeln;
      Write('Type any key to continue...  ');
      Read(Kbd,Key);
      Clrscr;
   End;
End;

Begin
   {$I-}
   Filename := concat(Drive,'KEYLIST');
   Assign(Disk1,Filename);
   Reset(Disk1);
   IOError;
   Filename := concat(Drive,'CARDFILE');
   Assign(Disk2,Filename);
   Reset(Disk2);
   IOError;
   FileEndPointer := filesize(Disk2);
   {$I+}
   SearchFiles;
   Writeln;
   Writeln;
   Writeln('Returning to the Main Menu... ');
   Close(Disk1);
   Close(Disk2);
   Assign(Disk,'MENU.COM');
   Execute(Disk);
End.