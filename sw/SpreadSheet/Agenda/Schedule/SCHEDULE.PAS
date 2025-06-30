PROGRAM Schedule;

{   Personal Daily Schedule Handler by Noriaki Hosoya      }

{$C-}

CONST
   HrBgn = 7;                { = 7 am }
   HrEnd = 17;               { = 5 pm }
   IM : Integer = 1;         { Window Boundary for Munu }
   JM : Integer = 10;
   IC : Integer = 1;         { Window Boundary for Calendar }
   JC : Integer = 2;
   IS : Integer = 30;        { Window Boundary for Notepad }
   JS : Integer = 1;

TYPE
   Str2 = String[2];
   Str5 = String[5];
   Str8 = String[8];
   Str9 = String[9];
   Str40 = String[40];
   FileName = String[14];
   Apt = Record
            Date : Str8;
            Note : Array[HrBgn..HrEnd] of Str40;
         END;

CONST
   Programmer = 'Noriaki Hosoya';
   LastUpdate : Str8 = '07/11/86';
   Version = 1.0;
   DaysOfMonth : Array[1..12] of Integer = (31,28,31,30,31,30,
                 31,31,30,31,30,31);
   MonthOfYear : Array[1..12] of Str9 = ('January','February','March',
                 'April','May','June','July','August','September',
                 'October','November','December');
   Hr : Array[HrBgn..HrEnd] of Str5 = ('7 am','8 am','9 am','10 am',
        '11 am','12 n ','1 pm','2 pm','3 pm','4 pm','5 pm');
   Blank : Str40 = '                                        ';
   TempFile : FileName = 'SCHTEMP.$$$';
   Show : Boolean = True;

VAR
   Year, Month, Day, Hour, HourLast : Integer;
   DayOfWeek, DOW, DOM : Integer;
   AptFile, TFile : FILE of Apt;
   AptRec : Apt;
   DataFile : FileName;
   Rec : Integer;
   DY, DM, DD : Str2;
   Date1, Date2, Date3 : Str8;
   NoError, CreateMode, More : Boolean;

{$I SCH1.INC}

PROCEDURE DispNote(K : Integer);

VAR
   I, J, L : Integer;

BEGIN
   CursorOff;
   L := 2*(K - HrBgn) + JS;
   GotoXY(IS,L);
   ClrEol;
   If K = Hour Then NormVideo Else LowVideo;
   I := Length(AptRec.Note[K]);
   Write(Hr[K]:5, ' : ');
   UnderOn;
   If K = Hour Then
   BEGIN
      LowVideo;
      ReverseOn;
   END;
   Write(AptRec.Note[K]:1);
   If I < 40 Then For J := 1 To 40 - I Do Write(' ');
   UnderOff;
   ReverseOff;
   GotoXY(IS + 48,L);
   If K = Hour Then NormVideo Else LowVideo;
   Write(' : ');
   NormVideo;
   CursorOn;
END; {of DispNote}

PROCEDURE DispAll;

VAR
   K : Integer;

BEGIN
   For K := HrBgn To HrEnd Do DispNote(K);
END; {of DispAll}

PROCEDURE GotoNote;

VAR
   K, L : Integer;

BEGIN
   CursorOff;
   K := IS + 8;
   L := 2*(Hour - HrBgn) + JS;
   GotoXY(K,L);
   ClrEol;
   GotoXY(K + 40,L);
   Write(' : ');
   GotoXY(K,L);
   CursorOn;
END; {of GotoNote}

PROCEDURE UpDate;

BEGIN
   EnterDate;
   MakeDate;
   SearchDate;
   SetCal;
   Calendar;
   Hour := HrBgn;
   DispAll;
END; {of UpDate}

PROCEDURE Save;

BEGIN
   Seek(AptFile,Rec);
   Write(AptFile,AptRec);
   Flush(AptFile);
   Close(AptFile);
   CreateMode := False;
END; {of Save}

PROCEDURE UpHour;

BEGIN
   HourLast := Hour;
   Hour := Pred(Hour);
   If Hour < HrBgn Then Hour := HrEnd;
END; {of UpHour}

PROCEDURE DownHour;

BEGIN
   HourLast := Hour;
   Hour := Succ(Hour);
   If Hour > HrEnd Then Hour := HrBgn;
END; {of DownHour}

PROCEDURE EnterNote;

BEGIN
   StatusLine;
   GotoNote;
   Readln(AptRec.Note[Hour]);
END; {of EnterNote}

PROCEDURE CancelNote;

BEGIN
   GotoNote;
   AptRec.Note[Hour] := Blank;
END; {of CancelNote}

PROCEDURE SaveResume;

BEGIN
   Save;
   UpDate;
END; {of SaveResume}

PROCEDURE SaveQuit;
BEGIN
   Save;
   More := False
END; {of SaveQuit}

PROCEDURE DispDates;

VAR
   D, M, Y, Code, R, RecSize : Integer;
   DD1, DM1, DY1 : Str2;
   Ch : Char;

BEGIN
   ClrScr;
   R := 0;
   OpenToUpdate;
   RecSize := FileSize(AptFile);
   If RecSize = 0 Then
   BEGIN
      GotoXY(12,7);
      Write(^G, 'No Record in File ', DataFile:1,'!!');
   END
   Else
   BEGIN
      GotoXY(12,1);
      UnderOn;
      Write('File ', DataFile:1, ' contains Records for:');
      UnderOff;
      Writeln;
      Writeln;
      While R < RecSize Do
      BEGIN
         Seek(AptFile,R);
         Flush(AptFile);
         Read(AptFile,AptRec);
         DY1 := Copy(AptRec.Date,1,2);
         DM1 := Copy(AptRec.Date,4,2);
         DD1 := Copy(AptRec.Date,7,2);
         Val(DY1,Y,Code);
         Val(DM1,M,Code);
         Val(DD1,D,Code);
         Y := Y + 1900;
         Write('              ', (R + 1):3, ' ');
         Writeln(MonthOfYear[M]:9, ' ', D:2, ', ', Y:1);
         If Succ(R) Mod 18 = 0 Then
         BEGIN
            StatusLine;
            Write('Enter any key to continue : ');
            Read(Kbd,Ch);
            ClrScr;
         END;
         R := Succ(R);
      END;
      Close(AptFile);
   END;
   StatusLine;
   Write('Enter any key to resume : ');
   Read(Kbd,Ch);
   ClrScr;
END; {of DispDates}

PROCEDURE PrintSchedule;

VAR
   I, Y : Integer;

BEGIN
   Save;
   StatusLine;
   Write('Printer ready (y/n) ? ');
   If NoYes(1) Then
   BEGIN
      Y := 1900 + Year;
      StatusLine;
      Write('Printing Schedule On ', MonthOfYear[Month]:1);
      Write(' ', Day:1, ', ', Y:1);
      Write(Lst, '          Schedule on ');
      Writeln(Lst, MonthOfYear[Month]:1, ' ', Day:1, ', ', Y:1);
      Writeln(Lst);
      For I := HrBgn To HrEnd Do
      BEGIN
         Write(Lst, '     ', Hr[I]:5);
         Writeln(Lst, ' : ', AptRec.Note[I]:1);
         Writeln(Lst);
      END;
      Write(Lst,^L);
   END;
   OpenToUpdate;
END; {of PrintSchedule}

PROCEDURE  OpenFile;

BEGIN
   Save;
   More := True;
END; {of OpenFile}

PROCEDURE DeleteRecord;

VAR
   R, RSize : Integer;

BEGIN
   Close(AptFile);
   More := True;
   StatusLine;
   Write('Are you sure (y/n) ? ');
   If NoYes(1) Then
   BEGIN
      ClrScr;
      StatusLine;
      Write('Packing File ', DataFile:1, '.   Please WAIT...');
      Date3 := Date1;
      OpenToUpdate;
      Assign(TFile, TempFile);
      Rewrite(TFile);
      RSize := FileSize(AptFile);
      R := 0;
      While R < RSize Do
      BEGIN
         Flush(AptFile);
         Seek(AptFile,R);
         Read(AptFile,AptRec);
         R := Succ(R);
         If AptRec.Date <> Date3 Then
         BEGIN
            Write(TFile,AptRec);
            Flush(TFile);
         END;
      END;
      Close(AptFile);
      Close(TFile);
      Erase(AptFile);
      Rename(TFile,DataFile);
   END;
END; {of DeleteRecord}

PROCEDURE EnterCommand;

VAR
   Com : Char;
   Valid : Boolean;

BEGIN
   Com := ^E;
   Hour := HrBgn;
   HourLast := Succ(HrBgn);
   While Com In [^E, ^X, ^[, ^C, ^S, ^D, ^P, ^T] Do
   BEGIN
      DispNote(Hour);
      DispNote(HourLast);
      StatusLine;
      Write('Your Command ? ');
      Repeat
         Read(Kbd,Com);
         If Com In [^E, ^X, ^[, ^C, ^S, ^T, ^D, ^P, ^F, ^Q] Then Valid := True Else Valid := False;
         If Not Valid Then Write(^G);
      Until Valid;
      Case Com of
         ^E : UpHour;
         ^X : DownHour;
         ^[ : EnterNote;
         ^C : CancelNote;
         ^S : SaveResume;
         ^T : BEGIN
                 Save;
                 DeleteRecord;
                 DispDates;
                 UpDate;
                 Menu;
              END;
         ^D : BEGIN
                 Save;
                 DispDates;
                 UpDate;
                 Menu;
              END;
         ^P : PrintSchedule;
         ^F : OpenFile;
         ^Q : SaveQuit;
      END;
   END;
END; {of EnterCommand}

BEGIN {of Main Program}
   ClrScr;
   If Show Then SignOn;
   Repeat
      EnterFile;
      ClrScr;
      If Not CreateMode Then
      BEGIN
         StatusLine;
         Write('Do you want to see the contents of File ');
         Write(DataFile:1, ' (y/n) ? ');
         If NoYes(1) Then DispDates;
      END;
      UpDate;
      Menu;
      EnterCommand;
   Until Not More;
   SignOff;
END. {of SCHEDULE}
