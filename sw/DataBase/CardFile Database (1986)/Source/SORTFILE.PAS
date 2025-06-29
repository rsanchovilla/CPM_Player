Program Sortfile;

(*    This program sorts and displays all of the keywords in the file KEYLIST. *)

{$I VARIABLE.INC}

{$I IOERR.INC}

Procedure PrintKeys;

Var
   Keylist:    Array[0..1000] of String[18];
   Keyword:    Array[1..4] of String[40];
   KeyWord1,
   Tempword,
   Testword:   String[40];
   PrimeCount,
   Pointer,
   FilePointer,
   EndOfFile,
   EndOfArray,
   SubPointer,
   I, X, Y, Z: Integer;
   Check, Key: Char;
   Used,
   Flag1,
   Flag2,
   Flag3:      Boolean;

Procedure Init;
Begin
   PrimeCount := 0;
   FilePointer := 1;
   EndOfFile := 0;
   EndOfArray := 0;
   Pointer := 0;
   SubPointer := 0;
   I := 0;
   Clrscr;
End;

Procedure ReadFile;
Begin
   {$I-}
   Write('Reading in key list file... ');
   Filename := concat(Drive,'KEYLIST');
   Assign(Disk1,Filename);
   Reset(Disk1);
   IOError;
   EndOfFile := Filesize(Disk1);
   For FilePointer := 1 to (EndOfFile-1) do
   Begin
      Seek(Disk1,FilePointer);
      IOError;
      With Keyrec do
      Begin
         Read(Disk1,Keyrec);
         IOError;
         For Z := 1 to 4 do
         Begin
            KeyWord[Z] := XTagArray[Z];
         End;
         Used := XUsed;
      End;
      If Used then
      Begin
         For Z := 1 to 4 do
         Begin
            EndOfArray := (EndOfArray+1);
            Keylist[EndOfArray] := KeyWord[Z];
         End;
      End;
   End;
   Close(Disk1);
   {$I+}
   Writeln(EndOfArray,'  Key words.');
End;

Procedure MakeSpace;
Begin
   For I := Pointer downto (Subpointer+1) do
   Begin
      Keylist[I] := Keylist[(I-1)];
   End;
   Keylist[SubPointer] := Tempword;
End;

Procedure PurgeWord;
Begin
   EndOfArray := (EndOfArray-1);
   For I := Pointer to EndOfArray do
   Begin
      Keylist[I] := KeyList[(I+1)];
   End;
   Pointer := (Pointer-1);
End;

Procedure SortFile;
Begin
   Writeln;
   Write('Sorting list and purging duplicates... ');
   Keylist[0] := Keylist[1];
   Pointer := 1;
   Flag1 := false;
   Repeat
      SubPointer := 0;
      Pointer := (Pointer+1);
      Tempword := Keylist[Pointer];
      Check := copy(Tempword,1,1);
      Repeat
         Flag2 := false;
         Testword := Keylist[Subpointer];

         If not Flag2 then
         Begin
            If Tempword < Testword then
            Begin
               Flag1 := true;
               Flag2 := true;
               MakeSpace;
            End;
         End;

         If not Flag2 then
         Begin
            If Tempword = Testword then
            Begin
               Flag1 := true;
               Flag2 := true;
               PurgeWord;
            End;
         End;

         If not Flag2 then
         Begin
            If Check = (' ') then
            Begin
               Flag1 := true;
               Flag2 := true;
               PurgeWord;
            End;
         End;

         If not Flag2 then
         Begin
            SubPointer := (SubPointer+1);
            If SubPointer = (Pointer-1) then
            Begin
               Flag1 := true;
               Keylist[Subpointer] := Tempword;
               SubPointer := 0;
            End;
         End;
      Until Flag1;
      Flag1 := false;
   Until Pointer = EndOfArray;
End;

Procedure ShiftOut;
Begin
   Writeln(EndOfArray,' Sorted words');
   For I := EndOfArray downto 1 do
   Begin
      Keylist[I] := Keylist[(I-1)];
   End;
End;

Procedure PrintList;
Var
   C, P: Integer;

Begin
   C := ConOutPtr;
   P := LstOutPtr;
   Flag3 := false;
   Repeat
      Gotoxy(1,5);
      Write('Output to Screen or Printer? ');
      Read(Kbd,Key);
      Key := upcase(Key);

      If Key = 'S' then
      Begin
         Flag3 := true;
      End;

      If Key = 'P' then
      Begin
         Flag3 := true;
         ConOutPtr := P;
      End;

   Until Flag3;
   Writeln;
   Writeln;
   For I := 1 to EndOfArray do
   Begin
      Writeln(Keylist[I]);
   End;
   Write(chr(12));
   ConOutPtr := C;
   Writeln;
   Writeln;
   Repeat
      Gotoxy(1,24);
      Write('Type <ESC> to continue... ');
      Read(Kbd,Key);
   Until Key = (chr(27));
   Clrscr;
   Assign(Disk,'MENU.COM');
   Execute(Disk);
End;

Begin
   Init;
   Readfile;
   Sortfile;
   ShiftOut;
   PrintList;
End;

Procedure Help;
Begin
End;

Begin
   PrintKeys;
End.
