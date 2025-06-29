Procedure SetCardFile;
Begin
   {$I-}
   Filename := concat(Drive,'CARDFILE');
   Assign(Disk2,Filename);
   Reset(Disk2);
   IOError;
   FileEndpointer := Filesize(Disk2);
   {$I+}
End;
