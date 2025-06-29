
procedure Bell; begin write(#7); end;

                   { screen control for H19 terminal }

procedure BlkCur; begin { write(#27'x4'); } end; { block cursor }
procedure UlCur;  begin { write(#27'y4'); } end; { underline cursor }

procedure Curon;  begin { write(#27'y5'); } end; { cursor on }
procedure CurOff; begin { write(#27'x5'); } end; { cursor off }

procedure Gon;    begin { write(#27'F');  } end; { enter graphics mode }
procedure Goff;   begin { write(#27'G');  } end; { exit graphics mode }

function Exist(FN: str14): boolean;
var
  F: file;
begin
  Assign(F,FN);
  {$I-}
  Reset(F);
  {$I+}
  Exist:=(IOResult=0);
end;

procedure Message(S: str80);
begin
  GotoXY(1,24);
  ClrEol;
  GotoXY(40-(ord(S[0]) div 2),24);
  Write(S);
end;

procedure Error(E: integer);
begin
  Bell;
  HighVideo;
  Err:=E;
  case E of
    1:  Message(' syntax error ');
    2:  Message(' illegal cell referance ');
    3:  Message(' division by zero ');
    4:  Message(' numeric overflow ');
    11: Message(' out of memory ');
    51: Message(' block too wide, can''t print ');
    91: Message(' can''t write file ');
    92: Message(' can''t read file ');
    93: Message(' can''t find file ');
  end;
  Delay(1500);
  LowVideo;
  Message('');
end;

procedure UpperCase(var S: str80);
begin
  inline($2A/S/
         $46/
         $04/
         $05/
         $CA/*+20/
         $23/
         $7E/
         $FE/$61/
         $DA/*-9/
         $FE/$7B/
         $D2/*-14/
         $D6/$20/
         $77/
         $C3/*-20);
end;

procedure StrRC(S: str5; var C,R: integer);
begin
  C:=ord(UpCase(S[1]))-64;
  R:=ord(S[2])-48;
  if (ord(S[0])>2) and (S[3] in ['0'..'9']) then R:=R*10+(ord(S[3])-48);
end;

function StringOf(I: integer; C: char): str80;
var
  L: integer;
  S: str80;
begin
  S:='';
  for L:=1 to I do S:=S+C;
  StringOf:=S;
end;

function CLeft: integer;
var
  L,N: integer;
begin
  L:=Pred(CC);
  N:=0;
  while (N+CWidth[L]<=77) and (L>=1) do
  begin
    N:=N+CWidth[L];
    L:=Pred(L);
  end;
  CLeft:=CC-L;
end;

function CRight: integer;
var
  L,N: integer;
begin
  L:=CC;
  N:=0;
  while (N+CWidth[L]<=77) and (L<=26) do
  begin
    N:=N+CWidth[L];
    L:=Succ(L);
  end;
  CRight:=L-CC;
end;

procedure ShowBorder;
var
  C,R,N: integer;
begin
  gotoxy(1,1);
  Gon;
  write('---');
  clreol;
  N:=CRight;
  for C:=CC to CC+Pred(N) do write(Chr(C+64),StringOf(Pred(CWidth[C]),'-'));
  writeln;
  for R:=CR to CR+20 do writeln(R:2,'|');
  Goff;
end;

procedure GotoCell(C,R: integer);
var
  N,L: integer;
begin
  N:=0;
  for L:=CC to Pred(C) do N:=N+CWidth[L];
  gotoxy(N+4,(R-CR)+2);
end;

procedure AddFormSuffix;
begin
  str(CForm:3,TS);
  if TS[3]='0' then CFor:=CFor+'&fd';
  if TS[3]='1' then CFor:=CFor+'&dol';
  if TS[3]='2' then CFor:=CFor+'&sci';
  if TS[3]='3' then CFor:=CFor+'&bar';
  if TS[3]='4' then CFor:=CFor+'&hide';
  if TS[3]<'2' then
  begin
    if TS[2]='1' then CFor:=CFor+'$';
    if TS[2]='2' then CFor:=CFor+'%';
    if TS[2]='3' then CFor:=CFor+'#';
    if TS[1]=' ' then CFor:=CFor+'>';
    if TS[1]='1' then CFor:=CFor+'^';
    if TS[1]='2' then CFor:=CFor+'<';
  end;
end;

function XCol(C: integer): integer;
var
  L,N: byte;
begin
  N:=4;
  for L:=CC to Pred(C) do N:=N+CWidth[L];
  XCol:=N;
end;

procedure ShowIndex;
var
  C,R,L: integer;
begin
  for C:=Col-1 to Col+1 do
  begin
    gotoxy(XCol(C),1);
    if C in [CC..CC+Pred(CRight)] then
      if C=Col then
      begin
        HighVideo;
        write(Chr(C+64));
        LowVideo;
      end else write(Chr(C+64));
  end;
  for R:=Row-1 to Row+1 do
  begin
    Gotoxy(1,(R-CR)+2);
    if R in [CR..CR+20] then
      if R=Row then
      begin
        HighVideo;
        write(R:2);
        LowVideo;
      end else write(R:2);
  end;
  gotoxy(1,23);
  write('   col ',Chr(Col+64),' - row ',row:2,' / memory free ',MemEnd-(MemPos-FreeOfs):5,' / ');
  if CalcOn then
    write('calc / ')
  else
    write('     / ');
  L:=CA[Col,Row];
  if L<>0 then
  begin
    CType:=Mem[L+3];
    if CType=1 then
    begin
      move(Mem[L+4],CText,Mem[L+4]+1);
      writeln('text   ');
      clreol;
      write(CText);
    end;
    if CType=2 then
    begin
      move(Mem[L+4],CText,Mem[L+4]+1);
      writeln('graphic');
      clreol;
      Gon;
      write(Ctext);
      Goff;
    end;
    if CType>=3 then
    begin
      Move(Mem[L+11],CFor,Mem[L+11]+1);
      CForm:=Mem[L+4];
      AddFormSuffix;
      writeln('formula');
      clreol;
      write(CFor);
    end;
  end else
  begin
    clreol;
    writeln;
    clreol;
  end;
end;
