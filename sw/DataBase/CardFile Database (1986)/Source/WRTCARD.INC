Procedure WriteCardFile;
Begin
   {$I-}
   IOError;
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
