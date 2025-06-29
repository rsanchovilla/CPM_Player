Program PRINTER;

{$I VARIABLE.INC}  (* Golbal variables for all programs *)

{$I IOERR.INC}     (* IOError *)

{$I INITVAR.INC}   (* Initvar *)

{$I DATASCR.INC}   (* Displayscr *)

{$I DISPLSCR.INC}  (* Displayrec *)

Procedure Finish;
Begin
   Clrscr;
   Close(Disk1);
   Close(Disk2);
   Assign(Disk,'MENU.COM');
   Execute(Disk);
End;

Procedure Test;
Var
   Num: Byte;
Begin
   Num := Port[05];
   If Num = 27 then Finish;
End;

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
   If Keypressed then Test;
End;

Procedure SearchFiles;
Var
   FirstArray,
   SecondArray:  Array[1..4] of String[40];
   FirstKey,
   SecondKey,
   XCopies:    String[40];
   Count,
   Copies,
   Code,
   FirstLen,
   SecondLen:    Integer;
   HaltPrinter,
   KeyEntered,
   FirstFound,
   SecondFound:  Boolean;

   Procedure Screen1;
   Begin
      Clrscr;
      GotoXY(32,1);
      Write('FILE CARD DATABASE');
      GotoXY(31,3);
      Write('Card Printing Option');
      GotoXY(1,4);
      Write('--------------------------------------------------------------------------------');
      GotoXY(6,6);
      Write('This option will print either the entire database, or cards selected by key');
      GotoXY(1,7);
      Write('words. You will be asked for key words to search on. If you respond to the first');
      GotoXY(1,8);
      Write('prompt only, you will print all cards which contain at least one key that');
      GotoXY(1,9);
      Write('matches your entry. If you respond to both prompts, you will print only the');
      GotoXY(1,10);
      Write('records that contain both keywords. You may enter two key words in either order.');
      GotoXY(1,11);
      Write('If you skip both prompts with <RET> you will print the entire file.');
      GotoXY(6,13);
      Write('Additionally, you will be asked how many copies of each card you wish to');
      GotoXY(1,14);
      Write('have printed. Enter the number followed by <RET>. If you enter <RET> only, the');
      GotoXY(1,15);
      Write('program will assume one (1) copy of each card.');
      GotoXY(5,17);
      Write('Finally, you will be asked whether or not you wish to halt the printer after');
      GotoXY(1,18);
      Write('each card, so that you can manually insert file cards into your printer as the');
      GotoXY(1,19);
      Write('file is printed. Enter a "Y" or "N". Upper or lower case will do. If you enter');
      GotoXY(1,20);
      Write('"N", your printer must be filled with continuous-form cards, as the printer will');
      GotoXY(1,21);
      Write('not stop. Even if you answer "Y" to this question, you MUST have a card in the');
      GotoXY(1,22);
      Write('printer, ready to go, before you respond with your "Y" or "N".');
      GotoXY(1,23);
      Write('(<ESC> will interrupt the print option)');
      GotoXY(52,24);
      Write('Type any key to continue...');
      Read(Kbd,Key);
      If Key = #27 then Finish;
      Clrscr;
   End;

   Procedure PrintRec;
   Var
      A: Integer;
   Begin
      If HaltPrinter then
      Begin
         Write(chr(7));
         Gotoxy(1,24);
         Write('Type any key... ');
         Read(Kbd,Key);
         If key = #27 then Finish;
      End;
      Gotoxy(60,24);
      Write('PRINTING      ');
      Writeln(Lst);
      If Keypressed then Test;
      Writeln(Lst);
      If Keypressed then Test;
      Write(Lst,'   ');
      If Keypressed then Test;
      Writeln(Lst,TagArray[1]);
      If Keypressed then Test;
      Write(Lst,'   ');
      If Keypressed then Test;
      For A := 1 to MaxColumns do
      Begin
         Write(Lst,'=');
         If Keypressed then Test;
      End;
      Writeln(Lst);
      If Keypressed then Test;
      For Row := 1 to MaxRows do
      Begin
         Write(Lst,'   ');
         For Column := 1 to MaxColumns do
         Begin
            Write(Lst,CardArray[Column,Row]);
         End;
         Writeln(Lst);
         If Keypressed then Test;
      End;
      Write(Lst,'  ');
      If Keypressed then Test;
      For A := 1 to (MaxColumns + 1) do Write(Lst,'-');
      If Keypressed then Test;
      Writeln(Lst);
      If Keypressed then Test;
      Write(Lst,'  ');
      If Keypressed then Test;
      Write(Lst,TagArray[2]);
      If Keypressed then Test;
      Write(lst,' |');
      If Keypressed then Test;
      Write(Lst,TagArray[3]);
      If Keypressed then Test;
      Write(Lst,' |');
      If Keypressed then Test;
      Writeln(Lst,TagArray[4]);
      If Keypressed then Test;
      Writeln(Lst);
      If Keypressed then Test;
      Writeln(Lst);
      If Keypressed then Test;
      Gotoxy(1,24);
      ClrEOL;
   End;

   Procedure GetKeyWord;
   Var
      Temp: String[40];
      I:    Integer;
   Begin
      KeyEntered := true;
      Copies := 1;
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
      Writeln('First key:  ',FirstKey);
      Writeln('Second key: ',SecondKey);
      Writeln;
      Write('How many copies of each card? ( <RET> = 1 ) ');
      Read(XCopies);
      val(XCopies,Copies,Code);
      Writeln;
      Writeln;
      Write('Halt the printer after each card? (Y/N)  ');
      Repeat
         Read(Kbd,Key);
         Key := upcase(Key);
      Until Key in['Y','N'];
      If Key = 'Y' then HaltPrinter := true Else HaltPrinter := false;
      Writeln;
      Writeln;
      Writeln('Searching...   ');
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
      With Keyrec do
      Begin
         Read(Disk1,Keyrec);
         IOError;
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
      If Keypressed then Test;
   End;


Begin
   Screen1;
   Repeat
      GetKeyWord;
      Displayscr;
      For FilePointer := 1 to (FileEndPointer-1) do
      Begin
         CheckRecord;
         If Used then
         Begin
            If SecondFound then
            Begin
               If Keypressed then Test;
               GetCardRecord;
               If Keypressed then Test;
               DisplayRec;
               For Count := 1 to copies do
               Begin
                  If Keypressed then Test;
                  Printrec;
               End;
            End;
         End;
      End;
      Clrscr;
      Write(chr(7));
      If SecondFound then
      Begin
         Writeln;
         Writeln('That`s All Folks...');
      End
      Else
      Begin
         Writeln;
         Writeln('No such key match found... ');
      End;
      Writeln;
      Writeln('Enter "*" for another search, any other key to exit. ');
      Read(Kbd,Key);
   Until Key <> '*';
   Clrscr;
End;

Procedure Help;
Begin
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
End.

