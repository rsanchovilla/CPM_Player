{File: INPUT.LIB}

Procedure Input(PositionPtr, Y, Len: Integer);
Var
   Line:   Array[1..80] of Char;
   I, ArrayPtr, Marker: Integer;
   Ch:   Char;
   Done: Boolean;

   Procedure Quit;
   Begin
      ExitFlag := true;
      Done := true;
      Exit;
   End;

   Procedure Left;
   Begin
      ArrayPtr := (ArrayPtr-1);
      If ArrayPtr < 1 THEN
      Begin
         ArrayPtr := 1;
         Write(chr(7));
      End
      Else PositionPtr := (PositionPtr-1);
      Gotoxy(PositionPtr,Y);
   End;

   Procedure Right;
   Begin
      If ArrayPtr > (Len+1) then
      Begin
         Write(chr(7));
         Exit;
      End;
      ArrayPtr := (ArrayPtr+1);
      If ArrayPtr > (Len+1) THEN
      Begin
         ArrayPtr := (Len+1);
         Write(chr(7));
      End
      Else PositionPtr := (PositionPtr+1);
      If PositionPtr > 80 then
      Begin
      Write(chr(7));
         ArrayPtr := (ArrayPtr-1);
         PositionPtr := 80;
         Write(chr(7));
      End;
      Gotoxy(PositionPtr,Y);
   End;

   Procedure Insert;
   Begin
      For I := Len Downto (ArrayPtr+1) do Line[I] := Line[(I-1)];
      Line[ArrayPtr] := ' ';
      Marker := PositionPtr;
      For I := ArrayPtr to Len do
      Begin
         Gotoxy(Marker,Y);
         Write(Line[I]);
         Marker := (Marker+1);
      End;
      Gotoxy(PositionPtr,Y);
   End;

   Procedure Delete;
   Begin
      ArrayPtr := (ArrayPtr-1);
      If ArrayPtr < 1 THEN
      Begin
         ArrayPtr := 1;
         Write(chr(7));
         Exit;
      End
      Else
      Begin
         PositionPtr := (PositionPtr-1);
         For I := ArrayPtr to (Len-1) do Line[I] := Line[(I+1)];
         Line[Len] := ' ';
      End;
      Marker := PositionPtr;
      For I := ArrayPtr to (Len) do
      Begin
         Gotoxy(Marker,Y);
         Write(Line[I]);
         Marker := (Marker+1);
      End;
      Gotoxy(PositionPtr,Y);
   End;

   Procedure DeleteToEndOfLine;
   Begin
      Marker := PositionPtr;
      For I := ArrayPtr to (Len) do
      Begin
         Line[I] := ' ';
         Gotoxy(Marker,Y);
         Write(Line[I]);
         Marker := (Marker+1);
      End;
      Gotoxy(PositionPtr,Y);
   End;

   Procedure Copy;
   Begin
      If ArrayPtr > Len then
      Begin
         Write(chr(7));
         Exit;
      End;
      If ord(Ch) < 32 then Exit;
      Line[ArrayPtr] := Ch;
      Gotoxy(PositionPtr,Y);
      Write(Line[ArrayPtr]);
      ArrayPtr := (ArrayPtr+1);
      If ArrayPtr > (Len+1) THEN
      Begin
         ArrayPtr := Len;
         Write(chr(7));
      End
      Else PositionPtr := (PositionPtr+1);
      If PositionPtr > 80 then
      Begin
         ArrayPtr := (ArrayPtr-1);
         PositionPtr := 80;
         Write(chr(7));
      End;
      Gotoxy(PositionPtr,Y);
   End;

Begin
   Done := false;
   ArrayPtr := 1;
   If Len > 80 then Len := 80;
   For I := 1 to 80 do Line[I] := chr(32);
   For I := 1 to Length(Temporary) do Line[I] := Temporary[I];
   Repeat
      Gotoxy(PositionPtr,Y);
      Read(Kbd,Ch);
      Case Ch of
         #4:   Right;
         #8:   Left;
         #9:   Insert;
         #12:  Right;
         #13:  Done := true;
         #17:  DeleteToEndOfLine;
         #19:  Left;
         #27:  Quit;
         #127: Delete
         Else  Copy;
      End;
   Until Done;
   Temporary := '';
   For I := 1 to Len do Temporary := (Temporary + Line[I]);
End;
