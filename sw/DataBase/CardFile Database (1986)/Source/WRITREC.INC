{File: WRITREC.LIB}

Procedure WriteRecord;
Begin
   Used := true;
   {$I-}
   Filename := concat(Drive,'KEYLIST');
   Assign(Disk1,Filename);
   Reset(Disk1);
   IOError;
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
   Close(Disk1);
   IOError;
   Filename := concat(Drive,'CARDFILE');
   Assign(Disk,Filename);
   Reset(Disk2);
   IOError;
   Seek(Disk2,FilePointer);
   IOError;
   With Cardrec do
   Begin
      For Row := 1 to MaxRows do
      Begin
         For Column := 1 to MaxColumns do
         Begin
            XCardArray[Column,Row] := CardArray[Column.Row];
         End;
      End;
      Write(Disk2,Cardrec);
      IOError;
   End;
   Close(Disk2);
   IOError;
   {$I+}
End;
