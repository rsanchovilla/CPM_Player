Program RETRIEVE;

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
      Until Key in['Y','N'];
   Until Key = 'Y';
End;

Procedure SearchFiles;
Var
   FirstArray,
   SecondArray:  Array[1..4] of String[40];
   FirstKey,
   SecondKey:    String[40];
   FirstLen,
   SecondLen:    Integer;
   KeyEntered,
   FirstFound,
   SecondFound:  Boolean;

   Procedure GetKeyWord;
   Var
      Temp: String[40];
      I:    Integer;
   Begin
      KeyEntered := true;
      Clrscr;
      Writeln;
      Writeln('Enter first key word for search');
      Writeln;
      Write('#1:  ');
      Read(Temp);
      For I := 1 to length(Temp) do Temp[I] := upcase(Temp[I]);
      FirstLen := length(Temp);
      FirstKey := Temp;
      Writeln;
      Writeln;
      Writeln('Enter second key word for search  (<RET> to ignore )');
      Writeln;
      Write('#2:  ');
      Read(Temp);
      If Temp <> '' then
      Begin
         For I := 1 to length(Temp) do Temp[I] := upcase(Temp[I]);
         SecondLen := length(Temp);
         SecondKey := Temp;
      End
      Else
      Begin
         SecondKey := FirstKey;
         SecondLen := FirstLen;
      End;
      If (length(FirstKey) = 0) AND (length(SecondKey) = 0) then KeyEntered := false;
      Writeln;
      Writeln;
      Writeln;
      Writeln;
      Writeln('First key:  ',FirstKey);
      Writeln('Second key: ',SecondKey);
      Writeln;
      Writeln;
      Writeln;
      Writeln('Searching... ');
   End;

   Procedure CheckRecord;
   Var
      Count: Integer;
   Begin
      FirstFound := false;
      SecondFound := false;

      {$I-}
      Seek(Disk1,FilePointer);
      IOError;
      {$I+}
      With Keyrec do
      Begin
         {$I-}
         Read(Disk1,Keyrec);
         IOError;
         {$I+}
         For Count := 1 to 4 do
         Begin
            FirstArray[Count]  := XTagArray[Count];
            SecondArray[Count] := XTagArray[Count];
            TagArray[Count]    := XTagArray[Count];
            If Count > 1 then TagArray[Count] := copy(TagArray[Count],1,SecondaryKeyLen);
            FirstArray[Count] := copy(FirstArray[Count],1,FirstLen);
            SecondArray[Count] := copy(SecondArray[Count],1,SecondLen);
            If FirstArray[Count] = FirstKey then
            Begin
               FirstFound := true;
            End;
         End;
      Used := XUsed;
      End;
      If FirstFound then
      Begin
         For Count := 1 to 4 do
         Begin
            If SecondArray[Count] = SecondKey then SecondFound := true;
         End;
      End;
   End;

   Procedure DeleteRecord;
   Begin
      Initvar;
      Clrscr;
      Gotoxy(34,12);
      Write('DELETING...   ');
      Used := false;
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
      Used := true;
   WriteCardFile;
   Displayscr;
   Displayrec;
End;

Begin
   Repeat
      GetKeyWord;
      If KeyEntered then
      Begin
         For FilePointer := 1 to (FileEndPointer-1) do
         Begin
            CheckRecord;
            If Used then
            Begin
               If SecondFound then
               Begin
                  GetCardRecord;
                  DisplayScr;
                  DisplayRec;
                  Repeat
                     Gotoxy(1,24);
                     Write('^D=Delete  ^P=Print  ^W=Write  <RET>=Next  <ESC>=Quit   ');
                     Read(Kbd,Key);
                     Case Key of
                        #4:   Begin
                                 Write(Chr(7));
                                 Gotoxy(60,24);
                                 Write('Delete? (Y/N) ');
                                 Repeat
                                    Read(Kbd,Key);
                                    Key := upcase(Key);
                                 Until Key in['Y','N'];
                                 If Key = 'Y' then DeleteRecord;
                                 Gotoxy(60,24);
                                 ClrEOL;
                              End;
                        #16:  Begin
                                 PrintRecord;
                              End;
                        #23:  Begin
                                 Gotoxy(1,24);
                                 ClrEOL;
                                 InputScr;
                                 WriteTagFile;
                                 WriteCardFile;
                              End;
                        #27:  Begin
                                 Clrscr;
                                 Close(Disk1);
                                 Close(Disk2);
                                 Assign(Disk,'MENU.COM');
                                 Execute(Disk);
                              End;
                     End;
                  Until (Key = #13) OR (Key = #32);
                  Clrscr;
               End;
            End;
         End;
      End;
      Write(chr(7));
      If SecondFound then
      Begin
         Writeln('That`s All Folks...');
      End;
      If NOT KeyEntered then
      Begin
         Writeln('No Key word entered...');
      End;
      Writeln;
      Write('Enter "*" for another search, any other key to quit. ');
      Read(Kbd,Key);
   Until Key <> '*';
   Clrscr;
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
   Close(Disk1);
   Close(Disk2);
   Assign(Disk,'MENU.COM');
   Execute(Disk);
End.