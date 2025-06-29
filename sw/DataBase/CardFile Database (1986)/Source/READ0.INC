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
   IOError;
   {$I+}
End;