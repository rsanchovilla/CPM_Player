Program INSTALL;

{ Installation Program for FILE CARD DATABASE 4.6 . This program selects the
drive where the data files will be found. }

Type
   XInstallRecord = Record
                       XDrive:   String[2];
                    End;
Var
   Disk:  File;
   DDisk: File of XInstallRecord;
   InstallRecord: XInstallRecord;
   Drive:         String[2];
   Key:           Char;

Procedure Screen;
Begin
   Clrscr;
   GotoXY(30,1);
   Write('FILE CARD DATABASE 4.6');
   GotoXY(31,3);
   Write('Installation Program');
   GotoXY(1,4);
   Write('--------------------------------------------------------------------------------');
   GotoXY(6,5);
   Write('Installation is simple. The only consideration is to select the disk drive');
   GotoXY(1,6);
   Write('where the data files KEYLIST and CARDFILE may be found. Some situations may');
   GotoXY(1,7);
   Write('require that the data files and the program set reside on the same disk. Others');
   GotoXY(1,8);
   Write('may be better suited with the program set on one disk, and the data on another.');
   GotoXY(1,9);
   Write('Single sided KAYPRO II computers will definately benefit from putting the data');
   GotoXY(1,10);
   Write('on a diskette by itself.');
   GotoXY(6,12);
   Write('User areas are not considered. The programs run from the logged drive/user');
   GotoXY(1,13);
   Write('area and the data is put on the drive specified by this program. If, on a KAYPRO');
   GotoXY(1,14);
   Write('10, you have the program set on the A7: portion of the hard disk, and you');
   GotoXY(1,15);
   Write('specify the C: (floppy) drive for the data, it will be put onto the floppy disk');
   GotoXY(1,16);
   Write('in user area 7. You must, of course be at the A7> prompt to run the program.');
   GotoXY(6,18);
   Write('Enter below, the drive where you wish to keep the data files. Typical');
   GotoXY(1,19);
   Write('examples would be B: or C: . Be sure to enter the colon!  Entering <RET> only,');
   GotoXY(1,20);
   Write('puts the data on the logged drive, along with the program set.');
   GotoXY(1,22);
   Write('Enter data drive: __');
End;

Procedure Install;
Begin
   Drive := '';
   Screen;
   Gotoxy(19,22);
   Read(Drive);
   Gotoxy(1,24);
   Write('Enter a n asterisk (*) to continue...any other key to abort: ');
   Read(Kbd,Key);
   If Key <> '*' then
   Begin
      Clrscr;
      Halt;
   End;
   Assign(DDisk,'INSTALL.DAT');
   Rewrite(DDisk);
   With InstallRecord do
   Begin
      XDrive := Drive;
      Write(DDisk,InstallRecord);
   End;
   Close(DDisk);
   Writeln;
   Writeln;
   Writeln;
   Writeln;
   If Drive = '' then
   Begin
      Writeln('Data files will be on the LOGGED DRIVE...');
   End
   Else
   Begin
      Writeln('Data files will be on the ',Drive,' DRIVE...');
   End;
   Delay(4000);
   Clrscr;
End;

Begin
   Install;
End.