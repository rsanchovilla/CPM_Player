{ INCLUDE File SCH1.INC}

PROCEDURE CursorOn;

BEGIN
   Write(^[, 'B4');
END;

PROCEDURE CursorOff;

BEGIN
   Write(^[, 'C4');
END;

PROCEDURE UnderOn;

BEGIN
   Write(^[, 'B3');
END;

PROCEDURE UnderOff;

BEGIN
   Write(^[, 'C3');
END;

PROCEDURE ReverseOn;

BEGIN
   Write(^[, 'B0');
END;

PROCEDURE ReverseOff;

BEGIN
   Write(^[, 'C0');
END;

PROCEDURE HMove(Xbgn,Xend,Y:Integer; Ch:Char);

VAR
   I, NextI, DFlag, IPos : Integer;

BEGIN
   If Xbgn < Xend Then DFlag := 1 Else DFlag := -1;
   GotoXY(Xbgn,Y);
   Write(Ch);
   Xbgn := Xbgn + DFlag;
   Xbgn := Xbgn*DFlag;
   Xend := Xend*DFlag;
   For I := Xbgn to Xend Do
   BEGIN
      Delay(20);
      IPos := I*DFlag;
      NextI := IPos - DFlag;
      GotoXY(NextI,Y);
      Write(' ');
      GotoXY(IPos,Y);
      Write(Ch);
   END;
END;

PROCEDURE VMove(Ybgn,Yend,X:Integer; Ch:Char);

VAR
   J, NextJ, DFlag, JPos : Integer;

BEGIN
   If Ybgn < Yend Then DFlag := 1 Else DFlag := -1;
   GotoXY(X,Ybgn);
   Write(Ch);
   Ybgn := Ybgn + DFlag;
   Ybgn := Ybgn*DFlag;
   Yend := Yend*DFlag;
   For J := Ybgn to Yend Do
   BEGIN
      Delay(40);
      JPos := J*DFlag;
      NextJ := JPos - DFlag;
      GotoXY(X,NextJ);
      Write(' ');
      GotoXY(X,JPos);
      Write(Ch);
   END;
END;

PROCEDURE SignOn;

BEGIN
   ClrScr;
   CursorOff;
   HMove(1,32,10,'S');
   VMove(1,10,34,'C');
   HMove(80,36,10,'H');
   VMove(24,10,38,'E');
   VMove(1,10,40,'D');
   VMove(24,10,42,'U');
   HMove(80,44,10,'L');
   HMove(80,46,10,'E');
   GotoXY(37,12);
   Write('v', Version:1:1);
   GotoXY(32,14);
   Write(Programmer:1);
   GotoXY(28,16);
   Write('Last Update : ', LastUpdate);
   Delay(3000);
   CursorOn;
END; {of SignOn}

PROCEDURE SignOff;

BEGIN
   ClrScr;
   GotoXY(30,12);
   Writeln('Have a good day!!');
END; {of SignOff}

PROCEDURE StatusLine;

BEGIN
   GotoXY(1,23);
   ClrEol;
END; {of StatusLine}

FUNCTION NoYes(I : Integer) : Boolean;

VAR
   Ch : Char;
   Valid : Boolean;

BEGIN
   Repeat
      Read(Kbd,Ch);
      If Ch In ['N', 'Y', 'n', 'y'] Then Valid := True Else Valid := False;
      If Not Valid Then Write(^G);
   Until Valid;
   If Ch In ['N', 'n'] Then NoYes := False Else Noyes := True;
END; {of NoYes}

PROCEDURE Menu;

BEGIN
   CursorOff;
   GotoXY(IM,JM);
   UnderOn;
   Write('Command Sammary');
   UnderOff;
   GotoXY(IM,JM + 2);
   Write('[^E]  : Up Hour');
   GotoXY(IM,JM + 3);
   Write('[^X]  : Down Hour');
   GotoXY(IM,JM + 4);
   Write('[ESC] : Enter Note');
   GotoXY(IM,JM + 5);
   Write('[^C]  : Cancel Note');
   GotoXY(IM,JM + 6);
   Write('[^S]  : Save/Resume');
   GotoXY(IM,jM + 7);
   Write('[^T]  : Delete Record');
   GotoXY(IM,JM + 8);
   Write('[^D]  : Display Dates');
   GotoXY(IM,JM + 9);
   Write('[^P]  : Save/Print');
   GotoXY(IM,JM + 10);
   Write('[^F]  : Save/Open File');
   GotoXY(IM,JM + 11);
   Write('[^Q]  : Save/Quit');
   CursorOn;
END; {of Menu}

PROCEDURE Ucase;

VAR
   Len, I : Integer;
   Ftemp : FileName;

BEGIN
   Ftemp := '';
   Len := Length(DataFile);
   For I := 1 To Len Do Ftemp := Ftemp + UpCase(DataFile[I]);
   DataFile := Ftemp;
END; {of Ucase}

PROCEDURE Error;

BEGIN
   CreateMode := False;
   If IOResult = 0 Then NoError := True Else NoError := False;
   If Not NoError Then
   BEGIN
      Close(AptFile);
      ClrScr;
      GotoXY(12,7);
      Write(^G, 'Cannot find ', DataFile);
      GotoXY(12,9);
      Write('Do you want to create it (y/n) ? ');
      CreateMode := NoYes(1);
      If Not CreateMode Then
      BEGIN
         GotoXY(12,10);
         Write('Continue (y/n) ? ');
         If Not NoYes(1) Then Halt;
      END;
   END;
END; {of Error}

PROCEDURE OpenToUpdate;

BEGIN
   Assign(AptFile, DataFile);
   {$I-}
   Reset(AptFile);
   {$I+}
END; {of OpenToUpdate}

PROCEDURE OpenToCreate;

BEGIN
   Assign(AptFile, DataFile);
   Rewrite(AptFile);
END; {of OpenToCreate}

PROCEDURE EnterFile;

VAR
   I : Integer;

BEGIN
   Repeat
      ClrScr;
      GotoXY(12,7);
      Write('Enter Schedule File name : ');
      Readln(DataFile);
      GotoXY(12,7);
      Ucase;
      OpenToUpDate;
      Error;
   Until NoError Or CreateMode;
   If CreateMode Then
   BEGIN
      OpenToCreate;
      For I := HrBgn To HrEnd Do AptRec.Note[I] := Blank;
   END;
END; {of EnterFile}

PROCEDURE SearchDate;

LABEL
   Found;

VAR
   I, RecSize : Integer;
   Exist : Boolean;

BEGIN
   Rec := 0;
   Exist := False;
   If CreateMode Then Goto Found;
   OpenToUpdate;
   RecSize := FileSize(AptFile);
   If RecSize = 0 Then Goto Found;
   While Rec < RecSize Do
   BEGIN
      Seek(AptFile,Rec);
      Flush(AptFile);
      Read(AptFile,AptRec);
      If AptRec.Date = Date1 Then
      BEGIN
         Exist := True;
         Goto Found;
      END;
      Rec := Succ(Rec);
   END;
   Found : With AptRec Do Date := Date1;
   If Not Exist Then For I := HrBgn To HrEnd Do AptRec.Note[I] := Blank;
END; {ofSearchDate}

PROCEDURE SetCal;

VAR
   Yr, AcDays, I : Integer;
   Leap : Boolean;

BEGIN
   Yr := Year - 80;
   Leap := False;
   If (Yr Mod 4 = 0) Then Leap := True;
   AcDays := 365*Yr + Yr Div 4 + 1;
   For I := 1 To Month Do AcDays := AcDays + DaysOfMonth[I];
   AcDays := AcDays - DaysOfMonth[Month];
   If (Month > 2) And Leap Then AcDays := Succ(AcDays);
   DayOfWeek := (AcDays + 2)  Mod 7 + 1;
   DOM := DaysOfMonth[Month];
   If Leap And (Month = 2) Then DOM := Succ(DOM);
END; {of SetCal}

PROCEDURE EnterDate;

LABEL
   Retry;

VAR
   Valid, ValidDay : Boolean;
   Y : Integer;

BEGIN
   Repeat
      StatusLine;
      Write('Month (1-12) ? ');
      {$I-}
      Readln(Month);
      {$I+}
      If (Month In [1..12]) And (IOResult = 0) Then Valid := True Else Valid := False;
      If Not Valid Then Write(^G);
   Until Valid;
   Repeat
      StatusLine;
      Retry: Write('Day ? ');
      {$I-}
      Readln(Day);
      {$I+}
      If (Day In [1..31]) And (IOResult = 0) Then ValidDay := True Else ValidDay := False;
      If Not ValidDay Then Write(^G);
   Until ValidDay;
   Repeat
      StatusLine;
      Write('Year (80-99) ? ');
      {$I-}
      Readln(Year);
      {$I+}
      If (Year In [80..99]) And (IOResult = 0) Then Valid := True Else Valid := False;
      If Not Valid Then Write(^G);
   Until Valid;
   SetCal;
   If Not (Day In [1..DOM]) Then ValidDay := False Else ValidDay := True;
   If Not ValidDay Then
   BEGIN
      Write(^G);
      StatusLine;
      Y := 1900 + Year;
      Write('Invalid Day entered for ', MonthOfYear[Month]:1, ', ', Y:1,'.');
      Write('   Please re-enter ');
      Goto Retry;
   END;
END; {of EnterDate}

PROCEDURE MakeDate;

VAR
   I : Integer;

BEGIN
   Str(Year:2,DY);
   Str(Month:2,DM);
   Str(Day:2,DD);
   Date1 := DY + '/' + DM + '/' + DD;
   For I := 1 To 8 Do If Date1[I] = ' ' Then Date1[I] := '0';
END; {of MakeDate}

PROCEDURE Calendar;

VAR
   J, K, Ih, Jh, Yr : Integer;

BEGIN
   CursorOff;
   j := JC;
   Yr := 1900 + Year;
   Ih := (15 -  Length(MonthOfYear[Month])) Div 2 + IC;
   Jh := Pred(JC);
   For K := 0 To 7 Do
   BEGIN
      GotoXY(IC,Jh + K);
      Write('                    ');
   END;
   GotoXY(Ih,Jh);
   Write(MonthOfYear[Month]:1, ', ', Yr:1);
   GotoXY(IC,J);
   Write('Su Mo Tu We Th Fr Sa');
   LowVideo;
   For K := 1 To DOM Do
   BEGIN
      DOW := (DayOfWeek + K - 2) Mod 7 + 1;
      GotoXY(3*(DOW - 1) + IC,J + 1);
      If K = Day Then NormVideo Else LowVideo;
      Write(K:2);
      If DOW = 7 Then J := Succ(J);
   END;
   NormVideo;
   CursorOn;
END; {of Calendar}
