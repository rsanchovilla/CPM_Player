program CAL;

{ Calender version 3.2  }
{ for all terminals     }

{    by Howard Dutton      }

{ GENIE ADDRESS: H.DUTTON  }

label
  Start,Exit;

type
  Str14  = String[14];
  Str80  = String[80];
  Str255 = String[255];
  Messages = record
    Short: String[20];
    Long:  String[200];
  end;

var
  Finished,PrintOut,H19:   Boolean;
  M,D,Y:                   Real;
  TS:                      Str255;
  Ch:                      Char;
  L,L1,L2,MS,
  CDay,Count:              Integer;
  Message: array[1..31] of Messages;
  F:                       Text;

  FN:                      Str14;

  Screen: array[1..24] of  Str80;

const
  MonthStr: array[1..12] of string[10] =
  ('January','Febuary','March','April','May','June','July',
   'August','September','October','November','December');

procedure Bell;
begin
  Write(#7);
end;

procedure GOn;
begin
  if H19 then
    write(#27'F');
end;

procedure GOff;
begin
  if H19 then
    write(#27'G');
end;

procedure CurOn;
begin
  if H19 then
    write(#27'y5');
end;

procedure CurOff;
begin
  if H19 then
    write(#27'x5');
end;

procedure BlkCur;
begin
  if H19 then
    write(#27'x4');
end;

procedure UlCur;
begin
  if H19 then
    write(#27'y4');
end;

function Exist(FN: str14): boolean;
var
  F: file;
begin
  Assign(F,FN);
  {$I-} reset(F); {$I+}
  Exist:= (IOResult = 0);
end;

function Julian(M,D,Y: real): real;
var
  A: real;
begin
  if (M=1) or (M=2) then
  begin
    Y:=Y-1;
    M:=M+12;
  end;
  A:=int(Y/100);
  A:=2-A+int(A/4);
  A:=A+int(365.25*Y);
  A:=A+int(30.6001*(M+1));
  Julian:=A+D+1720994.5;
end;

function DayOfWeek(DOW: integer): integer;
begin
  DayOfWeek:=Round(frac((Julian(M,DOW,Y)+1.5)/7.0)*7.0);
end;

procedure Center(S: str80);
var
  L: integer;
begin
  for L:=1 to 39-(ord(S[0]) div 2) do write(' ');
  write(S);
end;

function StringOf(N: byte; C: char): str80;
var
  L: byte;
  S: str80;
begin
  S:='';
  for L:=1 to N do S:=S+C;
  StringOf:=S;
end;

function DiM(M,Y: real): integer;
const
  Days: array[1..12] of byte =
  (31,28,31,30,31,30,31,31,30,31,30,31);
begin
  if (Y/4=trunc(Y) div 4) and (M=2) then
    DiM:=DAYS[trunc(M)]+1
  else
    DiM:=DAYS[trunc(M)];
end;

procedure GotoDay(Day,OX,OY: integer);
var
  Temp: Integer;
begin
  Temp:=Day+MS-1;
  gotoxy((Temp mod 7)*11+3+OX,(Temp div 7)*3+4+OY);
end;

procedure PutInDay(Day,OX,OY: integer; var S: Str255);
var
  Temp,
  Xp,Yp: Integer;
begin
  Temp:=Day+MS-1;
  Xp:=(Temp mod 7)*11+3+OX;
  Yp:=(Temp div 7)*3+4+OY;
  for Temp:=1 to Ord(S[0]) do
    Screen[Yp][Xp+Pred(Temp)]:=S[Temp];
end;

function CenterStr(var S: str255): str255;
var
  L: integer;
  S1: str80;
begin
  S1:='';
  for L:=1 to 39-(ord(S[0]) div 2) do S1:=S1+' ';
  S1:=S1+S;
  CenterStr:=S1;
end;

procedure MakeCal;
var
  NumberOfWeeks: Integer;
  DaysInMonth: Integer;
begin
  NumberOfWeeks:=Trunc((DiM(M,Y)/7.0)+(DayOfWeek(1))/7.0)+1;
  str(Y:4:0,TS);
  TS:='calender for '+MonthStr[trunc(M)]+' '+TS;
  TS:=CenterStr(TS);
  Screen[1]:=TS;
  Screen[2]:='';
  Screen[3]:='    Sunday     Monday    Tuesday    Wensday    Thursday    Friday    Saturday  ';
  if PrintOut or (not H19) then
    Screen[4]:=' |----------+----------+----------+----------+----------+----------+----------|'
  else
    Screen[4]:=' faaaaaaaaaasaaaaaaaaaasaaaaaaaaaasaaaaaaaaaasaaaaaaaaaasaaaaaaaaaasaaaaaaaaaac';
  Count:=0;
  for L:=1 to NumberOfWeeks do
  begin
    for L1:=1 to 2 do
    begin
      if PrintOut or (not H19) then
        Screen[5+Count]:=' |          |          |          |          |          |          |          |'
      else
        Screen[5+Count]:=' `          `          `          `          `          `          `          `';
      Count:=Count+1;
    end;
    if L< NumberOfWeeks then
    begin
      if PrintOut or (not H19) then
        Screen[5+Count]:=' |----------+----------+----------+----------+----------+----------+----------|'
      else
        Screen[5+Count]:=' vaaaaaaaaaabaaaaaaaaaabaaaaaaaaaabaaaaaaaaaabaaaaaaaaaabaaaaaaaaaabaaaaaaaaaat';
      Count:=Count+1;
    end;
  end;
  if PrintOut or (not H19) then
    Screen[5+Count]:=' |----------+----------+----------+----------+----------+----------+----------|'
  else
    Screen[5+Count]:=' eaaaaaaaaaauaaaaaaaaaauaaaaaaaaaauaaaaaaaaaauaaaaaaaaaauaaaaaaaaaauaaaaaaaaaad';
  Count:=Count+1;
  for L:=Count+5 to 24 do
  Screen[L]:='';
end;

procedure ShowCal;
var
  L:           Integer;
  CDay:        Integer;
begin
  PrintOut:=False;
  MakeCal;
  clrscr;
  for L:=1 to 3 do writeln(Screen[L]);
  GOn; for L:=4 to 4+Count+1 do writeln(Screen[L]); GOff;
  L1:=DiM(M,Y);
  for L:=1 to L1 do
  begin
    GotoDay(L,0,0);
    write(L:2);
    if Message[L].Long<>'' then
    begin
      GOn;
      if not H19 then
        write('---&')
      else
        write('aaak');
      GOff;
    end;
    GotoDay(L,0,1);
    write(copy(Message[L].Short,1,10));
    GotoDay(L,0,2);
    write(copy(Message[L].Short,11,20));
  end;
  gotoxy(1,24);
  clreol;
  if not H19 then
    write('E-edit note / B-edit brief / D-delete day / P-Print / R-to restart / X-to exit')
  else
    write(' f1 notes / f2 brief / f3 delete day / f4 restart cal / f5 print cal / wh exit');
end;

procedure printcal;
var
  L,DaysInMonth: Integer;
begin
  PrintOut:=True;
  MakeCal;
  DaysInMonth:=DiM(M,Y);
  for L:=1 to DaysInMonth do
  begin
    str(L:2,TS);
    PutInDay(L,0,0,TS);
    TS:=Copy(Message[L].Short,1,10);
    PutInDay(L,0,1,TS);
    TS:=Copy(Message[L].Short,11,20);
    PutInDay(L,0,2,TS);
  end;
  writeln(lst);
  writeln(lst);
  writeln(lst);
  writeln(lst,Screen[1]);
  writeln(lst,Screen[2]);
  GOn;
  for L:=4 to 4+Count+1 do
    writeln(lst,Screen[L]);
  GOff;
  writeln(lst);
end;

procedure MoveLeft;
begin
  if CDay>1 then
    CDay:=CDay-1 else Bell;
end;

procedure MoveRight;
begin
  if CDay<Dim(M,Y) then
    CDay:=CDay+1 else Bell;
end;

procedure MoveUp;
begin
  if CDay-7>0 then
    CDay:=CDay-7 else Bell;
end;

procedure MoveDown;
begin
  if CDay+7<=Dim(M,Y) then
    CDay:=CDay+7 else Bell;
end;

procedure GetDate;
var
  Finished: boolean;
  N,X,Y,YOfs: integer;
begin
  GotoDay(CDay,0,0);
  LowVideo;
  write(CDay:2);
  HighVideo;
  CurOn;
  if Pred(CDay+MS) div 7 < 3 then YOfs:=11 else YOfs:=1;
  gotoxy(19,4+YOfs);
  GOn;
  if not H19 then
    write('|',StringOf(40,'-'),'|')
  else
    write('f',StringOf(40,'a'),'c');
  for L:=1 to 5 do
  begin
    gotoxy(19,4+L+YOfs);
    if not H19 then
      write('|',StringOf(40,' '),'|')
    else
      write('`',StringOf(40,' '),'`');
  end;
  gotoxy(19,5+L+YOfs);
  if not H19 then
    write('|',StringOf(40,'-'),'|')
  else
    write('e',StringOf(40,'a'),'d');
  GOff;
  gotoxy(20,5+YOfs);
  write(Copy(Message[CDay].Long,1,40));
  gotoxy(20,6+YOfs);
  write(Copy(Message[CDay].Long,41,40));
  gotoxy(20,7+YOfs);
  write(Copy(Message[CDay].Long,81,40));
  gotoxy(20,8+YOfs);
  write(Copy(Message[CDay].Long,121,40));
  gotoxy(20,9+YOfs);
  write(Copy(Message[CDay].Long,161,40));
  gotoxy(20,5+YOfs);
  X:=20;
  Y:=5;
  TS:=Message[CDay].Long;
  while Ord(TS[0])<200 do TS:=TS+' ';
  N:=0;
  gotoxy(1,24);
  clreol;
  center('press <RET> to exit');
  Finished:=False;
  repeat
    gotoxy(X+(N mod 40),Y+(N div 40)+YOfs);
    read(kbd,Ch);
    if Ch in [' '..'~'] then
      if N<200 then
      begin
        write(Ch);
        N:=N+1;
        TS[N]:=Ch;
      end else Bell;
    if (Ch=#8) or (Ch=#127) then
    begin
      if N>0 then
      begin
        TS[N]:=' ';
        N:=N-1;
        gotoxy(X+(N mod 40),Y+(N div 40)+YOfs);
        write(' '#8);
      end else Bell;
    end;
    if Ch=^E then
      if N>39 then
        N:=N-40;
    if Ch=^X then
      if N<160 then
        N:=N+40;
    if Ch=^S then
      if N>0 then
        N:=N-1;
    if Ch=^D then
      if N<199 then
        N:=N+1;
    if Ch=#13 then Finished:=True;
  until Finished;
  Ch:=#0;
  while TS[Ord(TS[0])]=#32 do TS[0]:=Chr(Ord(TS[0])-1);
  Message[CDay].Long:=TS;
  CurOff;
end;

procedure GetNote;
var
  Finished: boolean;
  N,X,Y: integer;
begin
  CurOn;
  GotoDay(CDay,0,1);
  write(Copy(Message[CDay].Short,1,10));
  GotoDay(CDay,0,2);
  write(Copy(Message[CDay].Short,11,10));
  GotoDay(CDay,0,1);
  L2:=trunc(Pred(Trunc(CDay+MS)));
  X:=(L2 mod 7)*11+3;
  Y:=(L2 div 7)*3+5;
  TS:=Message[CDay].Short;
  while TS[0]<#20 do TS:=TS+' ';
  N:=0;
  gotoxy(1,24);
  clreol;
  center('press <RET> to exit');
  Finished:=False;
  repeat
    gotoxy(X+(N mod 10),Y+(N div 10));
    read(kbd,Ch);
    if Ch in [' '..'~'] then
      if N<20 then
      begin
        write(Ch);
        N:=N+1;
        TS[N]:=Ch;
      end else Bell;
    if (Ch=#8) or (Ch=#127) then
    begin
      if N>0 then
      begin
        TS[N]:=' ';
        N:=N-1;
        gotoxy(X+(N mod 10),Y+(N div 10));
        write(' '#8);
      end else Bell;
    end;
    if Ch=^E then
      if N>9 then
        N:=N-10;
    if Ch=^X then
      if N<9 then
        N:=N+10;
    if Ch=^S then
      if N>0 then
        N:=N-1;
    if Ch=^D then
      if N<19 then
        N:=N+1;
    if Ch=#13 then Finished:=True;
  until Finished;
  while TS[Ord(TS[0])]=#32 do TS[0]:=Chr(Ord(TS[0])-1);
  Message[CDay].Short:=TS;
  CurOff;
  gotoxy(1,24);
  clreol;
  if not H19 then
    write('E-edit note / B-edit brief / D-delete day / P-Print / R-to restart / X-to exit')
  else
    write(' f1 notes / f2 brief / f3 delete day / f4 restart cal / f5 print cal / wh exit');
  Ch:=#0;
end;

procedure EraseDay;
begin
  CurOn;
  gotoxy(1,23);
  clreol;
  str(CDay:2,TS);
  TS:='erase '+MonthStr[trunc(M)]+' '+TS+' (Y/N) ? ';
  center(TS);
  repeat read(kbd,Ch); Ch:=UpCase(Ch); until Ch in ['Y','N'];
  if Ch='Y' then
  begin
    Message[CDay].Short:='';
    Message[CDay].Long:='';
  end;
  CurOff;
  ShowCal;
end;

procedure Save;
label
  Exit;
begin
  L2:=0;
  ReWrite(F);
  for L:=1 to Dim(M,Y) do
  begin
    if Message[L].Short<>'' then
    begin
      str(L:2,TS);
      TS:=TS+Message[L].Short+Message[L].Long;
      {$I-} writeln(F,TS); {$I+}
      if IOResult<>0 then
      begin
        gotoxy(1,23);
        clreol;
        LowVideo;
        center('ERROR: out of disk space.');
        HighVideo;
        delay(4000);
        erase(F);
        Finished:=True;
        goto Exit;
      end;
      L2:=1;
    end;
  end;
  close(F);
  if L2=0 then Erase(F);
Exit:
end;

begin
Start:
  H19:=True;
  CrtInit;
  ClrScr;
  delay(20);
  writeln;
  writeln;
  center('CALANDER V3');
  for L:=1 to 31 do
  begin
    Message[L].Short:='';
    Message[L].Long:='';
  end;
  repeat
    repeat
      clreol;
      gotoxy(26,6);
      write('Use what date (MM DD YY) ? ');
      readln(M,D,Y);
      Y:=Y+1900;
    until (Y>1980) and (Y<2080);
  until (trunc(M) in [1..12]) and (trunc(D) in [1..DiM(M,Y)]);
  CurOff;
  str(Y:4:0,TS);
  FN:=Copy(MonthStr[trunc(M)],1,3)+copy(TS,3,2)+'.CAL';
  assign(F,FN);
  if not exist(FN) then
  begin
    {$I-} rewrite(F); {$I+}
    if IOResult<>0 then
    begin
      gotoxy(1,23);
      clreol;
      LowVideo;
      center('ERROR: no disk space');
      HighVideo;
      Delay(4000);
      goto Exit;
    end else close(F);
  end;
  reset(F);
  while not eof(F) do
  begin
    readln(F,TS);
    val(copy(TS,1,2),L,L1);
    if L1<>0 then val(copy(TS,2,1),L,L1);
    Message[L].Short:=copy(TS,3,20);
    Message[L].Long :=copy(TS,23,255);
  end;
  MS:=DayOfWeek(1);
  ShowCal;
  CDay:=Trunc(D);
  Finished:=False;
  repeat
    GotoDay(CDay,0,0);
    LowVideo;
    write(CDay:2);
    HighVideo;
    GotoDay(CDay,0,0);
    read(kbd,Ch);
    write(CDay:2);
    case Ch of
      ^S: MoveLeft;
      ^D: MoveRight;
      ^E: MoveUp;
      ^X: MoveDown;
    end;
    if not H19 then
    begin
      if Ch='E' then
      begin
        GetDate;
        ShowCal;
      end;
      if Ch='B' then
      GetNote;
      if Ch='D' then EraseDay;
      if Ch='R' then
      begin
        Save;
        goto Start;
      end;
      if Ch='P' then PrintCal;
      if Ch='X' then Finished:=True;
    end
    else
    begin
      if Ch=^[ then
      begin
        read(kbd,Ch);
        if Ch='S' then
        begin
          GetDate;
          ShowCal;
        end;
        if Ch='T' then
          GetNote;
        if Ch='U' then EraseDay;
        if Ch='V' then
        begin
          Save;
          goto Start;
        end;
        if Ch='W' then PrintCal;
        if Ch='R' then Finished:=True;
      end;
    end;
  until Finished;
  Save;
Exit:
  ClrScr;
  CrtExit;
  delay(30);
end.
