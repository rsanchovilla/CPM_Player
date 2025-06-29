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
