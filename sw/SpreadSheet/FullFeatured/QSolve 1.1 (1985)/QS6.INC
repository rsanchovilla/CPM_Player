
procedure SetWidth;
label
  Exit;
var
  C,W,L: integer;
begin
  gotoxy(1,24);
  clreol;
  CurOn;
  UlCur;
  write('global Y/N ? ');
  repeat read(kbd,Ch); Ch:=Upcase(Ch); until Ch in ['Y','N',#13];
  if Ch='Y' then
  begin
    repeat
      write(#13);
      clreol;
      W:=-999;
      write('what''s the cell''s width (1 to 77) ? ');
      read(W);
      if W=-999 then goto Exit;
    until W in [1..77];
    for L:=1 to 26 do CWidth[L]:=W;
  end;
  if Ch='N' then
  begin
    repeat
      write(#13);
      clreol;
      Ch:=#255;
      write('what col. (A to Z) ? ');
      read(kbd,Ch);
      if Ch=#255 then goto Exit;
      C:=Ord(Ch)-64;
    until C in [1..26];
    repeat
      write(#13);
      clreol;
      W:=-999;
      write('what''s the cell''s width (1 to 77) ? ');
      read(W);
      if W=-999 then goto Exit;
    until W in [1..77];
    CWidth[C]:=W;
  end;
  Col:=CC;
  Row:=CR;
Exit:
  CurOff;
  gotoxy(1,24);
  clreol;
  ShowBorder;
  ShowCells;
end;

procedure MoveToCell;
label
  Exit;
var
  S:   str5;
  R,C: integer;
begin
  CurOn;
  UlCur;
  repeat
    gotoxy(1,24);
    clreol;
    S:='';
    write('move to what row & col ? ');
    read(S);
    if S='' then goto Exit;
    StrRC(S,C,R);
  until (C in [1..26]) and (R in [1..99]);
  Col:=C;
  Row:=R;
  CC:=C;
  CR:=R;
  ShowBorder;
  ShowCells;
Exit:
  gotoxy(1,24);
  clreol;
  CurOff;
end;

procedure WriteSheet;
label
  Start,Exit;
var
  FileName:          str14;
  F:         file of byte;
  B:                 byte;
  C,R,L:             integer;
begin
  CurOn;
  UlCur;
Start:
  gotoxy(1,24);
  clreol;
  FileName:='';
  write('file''s name ? ');
  read(FileName);
  if FileName='' then goto Exit;
  Temp:=Pos('.',FileName);
  if Temp>0 then FileName:=Copy(FileName,1,Pred(Temp));
  FileName:=FileName+'.QSS';
  if Exist(FileName) then
  begin
    write(#13);
    clreol;
    LowVideo;
    write('file exists, erase (Y/N) ? ');
    LowVideo ;
    repeat read(kbd,Ch); Ch:=Upcase(Ch); until Ch in ['Y','N'];
    write(#13);
    clreol;
    if Ch='N' then goto Start;
  end;
  Assign(F,FileName);
  ReWrite(F);
  B:=$FF;
  write(F,B);
  for L:=1 to 26 do write(F,CWidth[L]);
  CAddr:=MemStart;
  {$I-}
  while CAddr<MemPos do
  begin
    if Mem[CAddr+3]<>9 then
    begin
      Temp:=Pred(CAddr+Mem[CAddr]);
      for L:=CAddr to Temp do
      begin
        write(F,Mem[L]);
        if IOResult<>0 then
        begin
          Error(91);
          close(F);
          erase(F);
          goto Exit;
        end;
      end;
    end;
    CAddr:=CAddr+Mem[CAddr];
  end;
  close(F);
  Exit:
  write(#13);
  clreol;
end;

procedure ReadSheet;
label
  Start,Exit;
var
  FileName:          str14;
  F:         file of byte;
  B:                 byte;
  C,R,TE,TB,T,L:     integer;
begin
  CurOn;
  UlCur;
Start:
  gotoxy(1,24);
  clreol;
  write('erase current sheet <Y>/N ? ');
  repeat read(kbd,Ch); Ch:=Upcase(Ch); until Ch in ['Y','N',#13];
  if Ch<>'N' then
  begin
    MemPos:=MemStart;
    FreeOfs:=0;
    for C:=1 to 26 do
      for R:=1 to 99 do
        CA[C,R]:=0;
    ShowCells;
    ShowBorder;
  end else CleanUp;
  gotoxy(1,24);
  clreol;
  FileName:='';
  write('file''s name ? ');
  read(FileName);
  if FileName='' then goto Exit;
  Temp:=Pos('.',FileName);
  if Temp>0 then FileName:=Copy(FileName,1,Pred(Temp));
  FileName:=FileName+'.QSS';
  if not Exist(FileName) then
  begin
    Error(93);
    goto Start;
  end;
  Assign(F,FileName);
  Reset(F);
  read(F,B);
  if B=255 then
    for L:=1 to 26 do read(F,CWidth[L]) else Reset(F);
  Temp:=MemPos;
  while not Eof(F) do
  begin
    read(F,Mem[MemPos]);
    TB:=Succ(MemPos);
    TE:=(Mem[MemPos]+TB)-2;
    if TE>MemEnd then
    begin
      close(F);
      Error(11);
      MemPos:=Temp;
      goto Exit;
    end;
    for MemPos:=TB to TE do
      read(F,Mem[MemPos]);
    if (LastCalc=1) and (Mem[TB+3]=3)  then Mem[TB+3]:=13;
    if (LastCalc=0) and (Mem[TB+3]=13) then Mem[TB+3]:=3;
    DelCell(Mem[TB],Mem[TB+1]);
    CA[Mem[TB],Mem[TB+1]]:=Pred(TB);
    MemPos:=Succ(MemPos);
  end;
  close(F);
  LookUpCells;
  ShowCells;
  ShowBorder;
Exit:
  write(#13);
  clreol;
end;
