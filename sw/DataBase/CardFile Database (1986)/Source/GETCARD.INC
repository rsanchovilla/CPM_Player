   Procedure GetCardRecord;
   Begin
      (* {$I-} *)
      Assign(Disk2,'B:CARDFILE');
      Reset(Disk2);
      IOError;
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
      Close(Disk2);
      IOError;
      {$I+}
   End;
