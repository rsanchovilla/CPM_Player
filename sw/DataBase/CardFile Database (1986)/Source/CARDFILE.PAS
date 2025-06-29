Program MENU;

{This menu is written for the File Card Database.}

{$I VARIABLE.INC}

Procedure MainMenu;

Var
   Disk:        File;
   Inkey:       Char;
   A, B, X, Y:  Integer;
   Line:        String[80];
   Flag, LFlag: Boolean;
   Procedure DrawMainMenu; Forward;

{$I IOERR.INC}

Procedure CenterText;
Begin
   A := length(Line);
   B := 80 - A;
   X := B div 2;
   Gotoxy(X,Y);
   Write(Line);
End;

Procedure GetDrive;
Begin
   {$I-}
   Assign(DDisk,'INSTALL.DAT');
   Reset(DDisk);
   IOError;
   With InstallRecord do
   Begin
      Read(DDisk,InstallRecord);
      IOError;
      Drive := XDrive;
   End;
   Close(DDisk);
   IOError;
   {$I+}
End;

Procedure DrawAltMenu;
Begin
   Clrscr;
   Y := 2; Line := ('FILE CARD DATABASE'); CenterText;
   Y := 6; Line := ('Options Menu'); CenterText;
   Writeln;
   For A := 1 to 80 do
   Begin
      Write('-');
   End;
   Y := 12; Line := ('<1>  Display Key Words'); CenterText;
   Y := 14; Gotoxy(X,Y); Write('<2>  Reuse Deleted Records');
   Y := 16; Gotoxy(X,Y); Write('<3>  Create a Template');
   Y := 18; Gotoxy(X,Y); Write('<4>  Erase the Entire Database');
   Y := 20; Gotoxy(X,Y); Write('<ESC>  Return to the Main Menu');
   Gotoxy(60,22); Write('Please select: ');
End;

Procedure AlternateMenu;

   Procedure SecondChoice;
   Begin
      LFlag := false;
      Repeat
         Gotoxy(75,22);
         Read(Kbd,Inkey);
         Inkey := upcase(Inkey);

         If Inkey = chr(27) then
         Begin
            DrawMainMenu;
            LFlag := true;
         End;

         If Inkey = '1' then
         Begin
            Clrscr;
            {$I-}
            Assign(Disk,'SORTFILE.CHN');
            Chain(Disk);
            IOError;
            {$I+}
         End;

         If Inkey = '2' then
         Begin
            Clrscr;
            {$I-}
            Assign(Disk,'UNDELETE.CHN');
            Chain(Disk);
            IOError;
            {$I+}
         End;

         If Inkey = '3' then
         Begin
            Clrscr;
            {$I-}
            Assign(Disk,'TEMPLATE.CHN');
            Chain(Disk);
            IOError;
            {$I+}
         End;

         If Inkey = '4' then
         Begin
            Clrscr;
            Writeln('WARNING: This subprogram erases all existing data from the database.');
            Writeln('use only if you wish to start a new database.');
            Writeln;
            Writeln;
            Write('Type "*" to continue...any other key to abort: ');
            Read(Kbd,Inkey);
            If Inkey = '*' then
            Begin
               {$I-}
               Assign(Disk,'NEWFILE.CHN');
               Chain(Disk);
               IOError;
            {$I+}
            End;
            Inkey := chr(0);
            DrawAltMenu;
         End;


      Until LFlag;
   End;

Begin
   DrawAltMenu;
   SecondChoice;
End;

Procedure DrawMainMenu;
Begin
   Clrscr;
   Y := 2; Line := ('FILE CARD DATABASE ver 4.6'); CenterText;
   Y := 4; Line := ('(c) 1986 by'); CenterText;
   Y := 6; Line := ('Thomas R. Mierau'); Centertext;
   Y := 8; Line := ('*** MAIN MENU ***'); CenterText;
   Writeln;
   For A := 1 to 80 do
   Begin
      Write('-');
   End;
   Y := 12; Line := ('<A>  Add Records to the Database'); CenterText;
   Y := 14; Gotoxy(X,Y); Write('<B>  Retrieve Existing Records');
   Y := 16; Gotoxy(X,Y); Write('<C>  Print Cards');
   Y := 18; Gotoxy(X,Y); Write('<D>  Other Options');
   Y := 20; Gotoxy(X,Y); Write('<ESC>  Quit');
   Gotoxy(60,22); Write('Please select: ');
End;


Procedure FirstChoice;
Begin
   Flag := false;
   Repeat
      Gotoxy(75,22);
      Read(Kbd,Inkey);
      Inkey := upcase(Inkey);

      If Inkey = chr(27) then Flag := true;

      If Inkey = 'A' then
      Begin
         Clrscr;
         {$I-}
         Assign(Disk,'MAINBODY.CHN');
         Chain(Disk);
         IOError;
         {$I+}
      End;

      If Inkey = 'B' then
      Begin
         Clrscr;
         {$I-}
         Assign(Disk,'RETRIEVE.CHN');
         Chain(Disk);
         IOError;
         {$I+}
      End;

      If Inkey = 'C' then
      Begin
         Clrscr;
         {$I-}
         Assign(Disk,'PRINTER.CHN');
         Chain(Disk);
         IOError;
         {$I+}
      End;

      If Inkey = 'D' then
      Begin
         AlternateMenu;
      End;

   Until Flag;
   Clrscr;
End;


Begin
   GetDrive;
   DrawMainmenu;
   FirstChoice;
End;

Procedure Help;
Begin
End;

Begin
   MainMenu;
End.