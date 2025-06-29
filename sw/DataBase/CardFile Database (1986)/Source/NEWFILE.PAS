Program NEWFILE;

{$I VARIABLE.INC}

{$I IOERR.INC}

{$I INITVAR.INC}


Procedure CreateKeyFile;
Begin
   {$I-}
   Filename := concat(Drive,'KEYLIST');
   Assign(Disk1,Filename);
   Rewrite(Disk1);
   IOError;
   With Keyrec do
   Begin
      For Row := 1 to MaxKeys do XTagArray[Row] := TagArray[Row];
      XUsed := Used;
      Write(Disk1,Keyrec);
      IOError;
   End;
   Close(Disk1);
   IOError;
   {$I+}
End;

Procedure CreateCardfile;
Begin
   {$I-}
   Filename := concat(Drive,'CARDFILE');
   Assign(Disk2,Filename);
   Rewrite(Disk2);
   IOError;
   With Cardrec do
   Begin
      For Row := 1 to MaxRows do
      Begin
         For Column := 1 to MaxColumns do
         Begin
            XCardArray[Column,Row] := CardArray[Column,Row];
         End;
      End;
      Write(Disk2,Cardrec);
      IOError;
   End;
   Close(Disk2);
   IOError;
   {$I+}
End;

Procedure Help;
Begin
End;

Begin
   Clrscr;
   InitVar;
   Writeln;
   Writeln('Creating:  KEYLIST...');
   CreateKeyFile;
   Writeln;
   Writeln('Creating: CARDFILE...');
   CreateCardFile;
   Write(chr(7));
   Writeln;
   Writeln('Done...Returning to the Main Menu.');
   {$I-}
   Assign(Disk,'MENU.COM');
   IOError;
   {$I+}
   Execute(Disk);
End.