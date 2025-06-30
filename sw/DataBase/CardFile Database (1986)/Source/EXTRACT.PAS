Program EXTRACT;

Type
   XKeyrec =   Record
                  XTagArray:   Array[1..4] of String[40];
                  XUsed:       Boolean;
               End;

   XCardrec =  Record
                  XCardArray:  Array[1..55,1..16] of Char;
               End;

Const
   MaxColumns:      Integer = 55;
   MaxRows:         Integer = 16;
   MaxKeys:         Integer = 4;
   PrimaryKeyLen:   Integer = 40;
   SecondaryKeyLen: Integer = 18;
   XOffset:         Integer = 12;
   YOffset:         Integer = 4;

Var
   Disk:  File;
   Disk1: File of XKeyrec;
   Disk3: File of XKeyrec;
   Disk2: File of XCardrec;
   Disk4: File of XCardrec;
   Keyrec:        XKeyrec;
   Cardrec:       XCardrec;

   TagArray:      Array[1..4] of String[40];
   CardArray:     Array[1..55,1..16] of Char;

   Drive: String[2];
   Filename: String[10];
   Temp:     String[80];

   X, Y,
   Row,
   Column,
   Error,
   Keypointer,
   DFilePointer,
   DFileEndPointer,
   FileEndPointer,
   FilePointer:   Integer;

   Key:           Char;

   PrintInit,
   ExitFlag,
   Used:          Boolean;

   Procedure Help; Forward;

Procedure IOError;
Var
   Disk:  File;
   Num:   Integer;
   IOErr: Boolean;
   Key:   Char;

Begin
   Num := 0;
   IOErr := false;
   Num := IOresult;
   IOErr := (Num <> 0);
   If IOErr then
   Begin
      Write(chr(7));
      Clrscr;
      Gotoxy(20,12);
      Case Num of
         $01:  Write('File does not exist');
         $02:  Write('File not open for input');
         $03:  Write('File not open for output');
         $04:  Write('File not open');
         $05:  Write('Can''t read from this file');
         $06:  Write('Can''t write to this file');
         $10:  Write('Error in numeric format');
         $20:  Write('Operation not allowed on a logical device');
         $21:  Write('Not allowed in the direct mode');
         $22:  Write('Assign to standard files not allowed');
         $90:  Write('Record length mismatch');
         $91:  Write('Seek beyond end of file');
         $99:  Write('Unexpected end of file');
         $F0:  Write('Disk write error');
         $F1:  Write('Directory is full');
         $F2:  Write('File size overflow');
         $FF:  Write('File dissappeared!');
         Else  Write('Unknown I/O Error: ',Num:3);
      End;
      Gotoxy(20,14);
      Write('Type any key to continue... ');
      Read(Kbd,Key);
      Clrscr;
      Halt;
   End;
End;


Procedure Screen;
Begin
   Clrscr;
   GotoXY(30,1);
   Write('FILE CARD DATABASE 4.6');
   GotoXY(28,3);
   Write('Record Extraction Program');
   GotoXY(1,4);
   Write('--------------------------------------------------------------------------------');
   GotoXY(6,6);
   Write('This program EXTRACTs records from one database, deleting them from the');
   GotoXY(1,7);
   Write('original, and puts them into another. It allows you to free up space in one');
   GotoXY(1,8);
   Write('database without losing your valuble data. EXTRACT.COM must be on the diskette');
   GotoXY(1,9);
   Write('you are copying TO, and it must be run from the CURRENTLY LOGGED DRIVE.');
   GotoXY(6,11);
   Write('You will then be asked for the drive which contains the data files you are');
   GotoXY(1,12);
   Write('copying FROM. Enter A:, B:, or whatever drive is appropriate.');
   GotoXY(6,14);
   Write('You then enter ONE, or TWO key words to search on, from the original file.');
   GotoXY(1,15);
   Write('The program will extract the records which match the search pattern.');
   GotoXY(6,17);
   Write('If the database you are copying TO does not exist, it will be created anew.');
   GotoXY(1,18);
   Write('If it already exists, the records will be ADDED to the existing file. This way,');
   GotoXY(1,19);
   Write('you can make several passes through the old file, adding each pass to the new');
   GotoXY(1,20);
   Write('file.');
   GotoXY(1,22);
   Write('Enter the drive containing the old files: __');
End;


Procedure GetDrive;
Var
   Done: Boolean;
Begin
   Done := false;
   Repeat
      Gotoxy(43,22);
      Read(Drive);
      If (length(Drive) = 2) AND (Drive[2] = ':') then
      Begin
         Done := true;
      End
      Else
      Begin
         Write(chr(7));
         Gotoxy(52,22);
         Write('Bad Drive designator! ');
         Read(Kbd,Key);
         Gotoxy(43,22);
         Write('__');
         ClrEOL;
      End;
   Until Done;
   Drive[1] := upcase(Drive[1]);
   Gotoxy(43,22);
   Write(Drive);
   Gotoxy(1,24);
   Write('Now, enter an asterisk to continue...any other key to abort: ');
   Read(Kbd,Key);
   If Key <> '*' then
   Begin
      Clrscr;
      Halt;
   End;
   Clrscr;
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


   Procedure WriteRecord;
   Begin
      {$I-}
      Gotoxy(1,24);
      Write('Copying from Old Record# ',FilePointer:4,'  ');
      Write('to New Record# ',DFilePointer:4);
      Seek(Disk3,DFilePointer);
      IOError;
      With Keyrec do
      Begin
         Write(Disk3,Keyrec);
         IOError;
      End;
      Seek(Disk4,DFilePointer);
      IOError;
      With Cardrec do
      Begin
         Write(Disk4,Cardrec);
         IOError;
      End;
      Used := false;
      For Row := 1 to MaxKeys do
      Begin
         Temp := '';
         For Column := 1 to MaxColumns do
         Begin
            Temp[Column] := ' ';
         End;
         TagArray[Row] := Temp;
      End;
      For Row := 1 to MaxRows do
      Begin
         For Column := 1 to MaxColumns do
         Begin
            CardArray[Column,Row] := ' ';
         End;
      End;
      Seek(Disk1,FilePointer);
      IOError;
      With Keyrec do
      Begin
         For Row := 1 to MaxKeys do
         Begin
            XTagArray[Row] := TagArray[Row];
         End;
         XUsed := Used;
         Write(Disk1,Keyrec);
         IOError;
      End;
      Seek(Disk2,FilePointer);
      IOError;
      With Cardrec do
      Begin
         For Row := 1 to MaxRows do
         Begin
            For Column := 1 to MaxColumns do
            Begin
               XCardArray[Column,Row] := CardArray[Column,Row];
            End;
         End;
         Write(Disk2,Cardrec);
         IOError;
      End;
      DFilePointer := (DFilePointer + 1);
      {$I+}
      If DFilePointer > 250 then
      Begin
         Clrscr;
         Writeln('This database is full. Try EXTRACTing to another.');
         Halt;
      End;
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
      If (length(FirstKey) = 0) AND (length(SecondKey) = 0) then
      Begin
         Clrscr;
         Writeln('You didn`t enter a key word. Rerun the program, and try again.');
         Halt;
      End;
      Writeln;
      Writeln;
      Writeln('First key:  ',FirstKey);
      Writeln('Second key: ',SecondKey);
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
   End;


Begin
   Repeat
      GetKeyWord;
      For FilePointer := 1 to (FileEndPointer-1) do
      Begin
         CheckRecord;
         If Used then
         Begin
            If SecondFound then
            Begin
               GetCardRecord;
               WriteRecord;
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

Procedure MakeNewFiles;
Begin
   Assign(Disk3,'KEYLIST');
   Rewrite(Disk3);
   IOError;
   With Keyrec do
   Begin
      For Row := 1 to MaxKeys do XTagArray[Row] := TagArray[Row];
      XUsed := Used;
      Write(Disk3,Keyrec);
      IOError;
   End;
   IOError;
   Close(Disk3);
   Assign(Disk4,'CARDFILE');
   Rewrite(Disk4);
   IOError;
   With Cardrec do
   Begin
      For Row := 1 to MaxRows do
      Begin
         For Column := 1 to MaxColumns do
         Begin
            XCardArray[Column,Row] := CardArray[Column,Row];
         End;
      End;
      Write(Disk4,Cardrec);
      IOError;
   End;
   Close(Disk4);
   IOError;
   Error := 0;
End;

Procedure InitFiles;
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
   Assign(Disk3,'KEYLIST');
   Reset(Disk3);
   Error := IOResult;
   Close(Disk3);
   If Error = 1 then MakeNewFiles;
   If Error <> 0 then
   Begin
      Clrscr;
      Write('Disk file problems');
      Close(Disk1);
      Close(Disk2);
      Close(Disk3);
      Halt;
   End;
   Assign(Disk3,'KEYLIST');
   Reset(Disk3);
   IOError;
   DFileEndPointer := filesize(Disk3);
   DFilePointer := DFileEndPointer;
   If DFilePointer > 249 then
   Begin
      Clrscr;
      Writeln('This database is full. Try EXTRACTing to another.');
      Halt;
   End;
   Assign(Disk4,'CARDFILE');
   Reset(Disk4);
   IOError;
   {$I+}
End;

Procedure Help;
Begin
End;

Begin
   Screen;
   GetDrive;
   InitFiles;
   SearchFiles;
   Close(Disk1);
   Close(Disk2);
   Close(Disk3);
   Close(Disk4);
   Clrscr;
End.

