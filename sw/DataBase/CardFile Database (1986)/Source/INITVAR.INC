Procedure Initvar;
Begin
   Used := false;
   For Row := 1 to MaxKeys do
   Begin
      TagArray[Row] := '';
      For Column := 1 to PrimaryKeyLen do
      Begin
         TagArray[Row] := concat(TagArray[Row],' ');
      End;
   End;
   For Row := 2 to 4 do TagArray[Row] := copy(TagArray[Row],1,18);
   For Row := 1 to MaxRows do
   Begin
      For Column := 1 to MaxColumns do
      Begin
         CardArray[Column,Row] := ' ';
      End;
   End;
End;
