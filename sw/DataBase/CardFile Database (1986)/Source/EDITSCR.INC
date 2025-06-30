Procedure EditScr;
Var
  Num, Numm, XNum: Integer;
  Flag1, Flag2, GraphicsFlag: Boolean;

   Procedure Quit;
   Begin
      Flag1 := true;
      Flag2 := true;
   End;

   Procedure CursorUp;
   Begin
      Flag2 := true;
      Y := (Y-1);
      If Y < 1 then Y := 1;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure CursorDown;
   Begin
      Flag2 := true;
      Y := (Y+1);
      If Y > MaxRows then Y := MaxRows;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure CarriageReturn;
   Begin
      Flag2 := true;
      Y := (Y+1);
      X :=1;
      If Y > MaxRows then Y := 1;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure CursorLeft;
   Begin
      Flag2 := true;
      X := (X-1);
      If X < 1 then
      Begin
         X := MaxColumns;
         Y := (Y-1);
         If Y < 1 then
         Begin
            X := 1;
            Y := 1;
         End;
      End;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure CursorRight;
   Begin
      Flag2 := true;
      If Y = MaxRows then
      Begin
         X := (X+1);
         If X > MaxColumns then
         Begin
            X := MaxColumns;
            Y := MaxRows;
         End;
      End;
      If Y < MaxRows then
      Begin
         X := (X+1);
         If X > MaxColumns then
         Begin
            X := 1;
            Y := (Y+1);
         End;
     End;
     If X = (MaxColumns-5) then write(chr(7));
     Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure LeftEnd;
   Begin
      Flag2 := true;
      X := 1;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure RightEnd;
   Begin
      Flag2 := true;
      X := MaxColumns;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure BeginningOfField;
   Begin
      Flag2 := true;
      X :=1;
      Y :=1;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure EndOfField;
   Begin
      Flag2 := true;
      X := MaxColumns;
      Y := MaxRows;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure EraseField;
   Begin
      Flag2 := true;
      For Y := 1 to MaxRows do
      Begin
         For X := 1 to MaxColumns do
         Begin
            CardArray[X,Y] := (' ');
            Gotoxy((X+XOffset),(Y+YOffset));
            Write(CardArray[X,Y]);
         End;
      End;
      X :=1;
      Y:= 1;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure InsertCharacter;
   Var
      I:   Integer;
   Begin
      Flag2 := true;
      For I := MaxColumns downto (X+1) do
      Begin
         CardArray[I,Y] := CardArray[(I-1),Y];
         Gotoxy((I+XOffset),(Y+YOffset));
         Write(CardArray[I,Y]);
      End;
      CardArray[X,Y] := (' ');
      Gotoxy((X+XOffset),(Y+YOffset));
      Write(CardArray[X,Y]);
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure DeleteCharacter;
   Var
      I:   Integer;
   Begin
      Flag2 := true;
      X := (X-1);
      If X <1 then
      Begin
         Write(chr(7));
         X := 1;
         Gotoxy((X+XOffset),(Y+YOffset));
         Exit;
      End;
      If X < (MaxColumns-1) then
      Begin
         For I := X to (MaxColumns-1) do CardArray[I,Y] := CardArray[(I+1),Y];
         I := MaxColumns;
         CardArray[I,Y] := ' ';
         For I := X to MaxColumns do
         Begin
            Gotoxy((I+XOffset),(Y+YOffset));
            Write(CardArray[I,Y]);
         End;
      End
      Else
      Begin
         I := X;
         CardArray[I,Y] := CardArray[(I+1),Y];
         Gotoxy((I+XOffset),(Y+YOffset));
         Write(CardArray[I,Y]);
         CardArray[MaxColumns,Y] := ' ';
         Gotoxy((MaxColumns+XOffset),(Y+YOffset));
         Write(CardArray[MaxColumns,Y]);
      End;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure DeleteToEndOfLine;
   Var
      I:   Integer;
   Begin
      Flag2 := true;
      For I := X to MaxColumns do
      Begin
         CardArray[I,Y] := (' ');
         Gotoxy((I+XOffset),(Y+YOffset));
         Write(CardArray[I,Y]);
      End;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure InsertLine;
   Var
      I, R:   Integer;
   Begin
      Flag2 := true;
      For R := MaxRows downto (Y+1) do
      Begin
         For I := 1 to MaxColumns do
         Begin
            CardArray[I,R] := CardArray[I,(R-1)];
            Gotoxy((I+XOffset),(R+YOffset)); Write(CardArray[I,R]);
         End;
      End;
      For I := 1 to MaxColumns do
      Begin
         CardArray[I,Y] := (' ');
         Gotoxy((I+XOffset),(Y+YOffset)); Write(CardArray[I,Y]);
      End;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure DeleteLine;
   Var
      I, R:   Integer;
   Begin
      Flag2 := true;
      For R := Y to (MaxRows-1) do
      Begin
         For I := 1 to MaxColumns do
         Begin
            CardArray[I,R] := CardArray[I,(R+1)];
            Gotoxy((I+XOffset),(R+YOffset)); Write(CardArray[I,R]);
         End;
      End;
      For I := 1 to MaxColumns do
      Begin
         CardArray[I,MaxRows] := ' ';
         Gotoxy((I+XOffset),(MaxRows+YOffset));
         Write(CardArray[I,MaxRows]);
     End;
     Gotoxy((X+XOffset),(Y+YOffset));
   End;

   Procedure PrintText;
   Begin
      Gotoxy((X+XOffset),(Y+YOffset));
      If X < 67 then
      Begin
         CardArray[X,Y] := Key;
         Write(CardArray[X,Y]);
      End;
      X := (X+1);
      If X = (MaxColumns-5) then Write(chr(7));
      If X > MaxColumns then X := MaxColumns;
      Gotoxy((X+XOffset),(Y+YOffset));
   End;

Begin
   Flag1 := false;
   Flag2 := false;
   X := 1; Y := 1;
   Gotoxy((X+XOffset),(Y+YOffset));
   Repeat
      Flag2 := false;
      Repeat
         Read(Kbd,Key);
         Numm := ord(Key);
         Case Numm of
            1:   LeftEnd;
            3:   EndOfField;
            4:   CursorRight;
            5:   CursorUp;
            6:   RightEnd;
            8:   CursorLeft;
            9:   InsertCharacter;
           10:   CursorDown;
           11:   CursorUp;
           12:   CursorRight;
           13:   CarriageReturn;
           14:   InsertLine;
           17:   DeleteToEndOfLine;
           18:   BeginningOfField;
           19:   CursorLeft;
           22:   Help;
           24:   CursorDown;
           25:   DeleteLine;
           26:   EraseField;
           27:   Quit;
          127:   DeleteCharacter;
         End;
         If Numm in[31..126] then PrintText;
      Until Flag2;
   Until Flag1;
End;
