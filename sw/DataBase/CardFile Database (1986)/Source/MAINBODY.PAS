Program MAINBODY;

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

Procedure Screen2;
Begin
   Clrscr;
   Write(chr(7));
   Writeln('DATABASE is FULL. Try deleting some records, or EXTRACTing some records to a');
   Writeln('new database to make more room.');
   Writeln;
   Writeln;
   Write('Type any key to continue... ');
   Read(Kbd,Key);
   Clrscr;
   Close(Disk1);
   IOError;
   Close(Disk2);
   IOError;
   Assign(Disk,'MENU.COM');
   {$I+}
   Execute(Disk);
End;

Procedure ReadRecord0;
Begin
   {$I-}
   Seek(Disk2,0);
   IOError;
   With CardRec do
   Begin
      Read(Disk2,CardRec);
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


Procedure Addrecords;
Var
   YCardArray:  Array[1..55,1..16] of Char;
   MaxFiles:    Integer;

Procedure CopyData;
Begin
   For Row := 1 to MaxRows do
   Begin
      For Column := 1 to MaxColumns do
      Begin
         YCardArray[Column,Row] := CardArray[Column,Row];
      End;
   End;
End;

Procedure RetrieveData;
Begin
   For Row := 1 to MaxRows do
   Begin
      For Column := 1 to MaxColumns do
      Begin
         CardArray[Column,Row] := YCardArray[Column,Row];
      End;
   End;
End;

Procedure HandleData;
Var
   Flag, KeyFlag:   Boolean;

{$I INPUTSCR.INC}

Begin
   Flag := false;
   Repeat
      InitVar;
      RetrieveData;
      DisplayScr;
      DisplayRec;
      Inputscr;
      WriteTagFile;
      WriteCardFile;
      FilePointer := (FilePointer+1);
      If FilePointer > 250 then Screen2;
      Clrscr;
      Write('Enter another record? (Y/N) ');
      Keyflag := false;
      Repeat
         Read(Kbd,Key);
         Key := upcase(Key);

         If Key = ('N') then
            Begin
               Keyflag := true;
               Flag := true;
            End;

         If Key = ('Y') then Keyflag := true;

      Until Keyflag;
   Until flag;
End;

Begin
   PrintInit := false;
   MaxFiles := 250;
   ReadRecord0;
   CopyData;
   HandleData;
   Clrscr;
   Close(Disk1);
   Close(Disk2);
   Assign(Disk,'MENU.COM');
   Execute(Disk);
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
   FilePointer := FileEndPointer;
   If FilePointer > 250 then Screen2;
   AddRecords;
   Close(Disk1);
   IOError;
   Close(Disk2);
   IOError;
   Assign(Disk,'MENU.COM');
   IOError;
   {$I+}
   Execute(Disk);
End.