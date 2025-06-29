Procedure ReadKey;
Var
   I: Integer;
Begin
   ExitFlag := false;
   Temporary := (TagArray[1]);
   Input(13,3,40);
   For I := 1 to 80 do Temporary[I] := upcase(Temporary[I]);
   TagArray[1] := Temporary;
   Gotoxy(13,3);
   Write(TagArray[1]);
   ExitFlag := false;

   Temporary := (TagArray[2]);
   Input(12,22,SecondaryKeyLen);
   If ExitFlag then
   Begin
      Gotoxy(12,22);
      Write(TagArray[2]);
      Exit;
   End;
   For I := 1 to 80 do Temporary[I] := upcase(Temporary[I]);
   TagArray[2] := Temporary;
   TagArray[2] := copy(TagArray[2],1,SecondaryKeyLen);
   Gotoxy(12,22);
   Write(TagArray[2]);

   Temporary := (TagArray[3]);
   Input(31,22,SecondaryKeyLen);
   If ExitFlag then
   Begin
      Gotoxy(31,22);
      Write(TagArray[3]);
      Exit;
   End;
   For I := 1 to 80 do Temporary[I] := upcase(Temporary[I]);
   TagArray[3] := Temporary;
   TagArray[3] := copy(TagArray[3],1,SecondaryKeyLen);
   Gotoxy(31,22);
   Write(TagArray[3]);

   Temporary := (TagArray[4]);
   Input(50,22,SecondaryKeyLen);
   If ExitFlag then
   Begin
      Gotoxy(50,22);
      Write(TagArray[4]);
      Exit;
   End;
   For I := 1 to 80 do Temporary[I] := upcase(Temporary[I]);
   TagArray[4] := Temporary;
   TagArray[4] := copy(TagArray[4],1,SecondaryKeyLen);
   Gotoxy(50,22);
   Write(TagArray[4]);
End;
