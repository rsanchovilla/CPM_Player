{File: IOERR.LIB}

Procedure IOError;
Var
   Disk:  File;
   Num:   Integer;
   IOErr: Boolean;
   Key:   Char;

Begin
   Num := 0;
   IOErr := false;
   Num := IOresult;
   IOErr := (Num <> 0);
   If IOErr then
   Begin
      Write(chr(7));
      Clrscr;
      Gotoxy(20,12);
      Case Num of
         $01:  Write('File does not exist');
         $02:  Write('File not open for input');
         $03:  Write('File not open for output');
         $04:  Write('File not open');
         $05:  Write('Can''t read from this file');
         $06:  Write('Can''t write to this file');
         $10:  Write('Error in numeric format');
         $20:  Write('Operation not allowed on a logical device');
         $21:  Write('Not allowed in the direct mode');
         $22:  Write('Assign to standard files not allowed');
         $90:  Write('Record length mismatch');
         $91:  Write('Seek beyond end of file');
         $99:  Write('Unexpected end of file');
         $F0:  Write('Disk write error');
         $F1:  Write('Directory is full');
         $F2:  Write('File size overflow');
         $FF:  Write('File dissappeared!');
         Else  Write('Unknown I/O Error: ',Num:3);
      End;
      Gotoxy(20,14);
      Write('Type any key to continue... ');
      Read(Kbd,Key);
      Assign(Disk,'MENU.COM');
      Execute(Disk);
   End;
End;
