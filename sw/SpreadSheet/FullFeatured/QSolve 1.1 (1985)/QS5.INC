
procedure ReadIn(var X,Y,N: integer; var S: str80);
var
  P: integer;
begin
  P:=0;
  repeat
    gotoxy(X+P,Y);
    read(kbd,Ch);
    if (Ch in [' '..'~']) then
    begin
      if InsertOn then
      begin
        if Ord(S[0])<N then
        begin
          P:=P+1;
          insert(Ch,S,P);
        end else Bell;
      end else
      if P<N then
      begin
        P:=P+1;
        if P<=Ord(S[0]) then S[P]:=Ch else S:=S+Ch;
      end else Bell;
      gotoxy(X,Y);
      write(S);
    end;
    if Ch=^V then
    if InsertOn=True then InsertOn:=False else InsertOn:=True;
    if ((Ch=#8) or (Ch=#127)) and (P>0) then
    begin
      delete(S,P,1);
      P:=P-1;
      gotoxy(X,Y);
      write(S+' ');
    end;
    if Ch=^G then
    begin
      delete(S,P+1,1);
      gotoxy(X,Y);
      write(S+' ');
    end;
    if (Ch=^S) and (P>0) then
      P:=P-1;
    if (Ch=^D) and (P<Ord(S[0])) then
      P:=P+1;
  until Ch=#13;
end;

procedure ReadText;
label
  Exit;
var
  X,Y,L,N: integer;
begin
  CurOn;
  X:=XCol(Col);
  Y:=(Row-CR)+2;
  N:=CWidth[Col];
  if CA[Col,Row]<>0 then
  begin
    GetCell(Col,Row);
    if ((Ch='`')   and (CType<>1)) or
       ((Ch='~')   and (CType<>2)) or
       ((CType<>1) and (CType<>2)) then
    begin
      Bell;
      goto Exit;
    end;
    S:=CText;
  end else
  begin
    S:='';
    if Ch='`' then CType:=1;
    if Ch='~' then CType:=2;
  end;
  if CType=2 then Gon;
  ReadIn(X,Y,N,S);
  if CType=2 then Goff;
  if S='' then goto Exit;
  CText:=S;
  PutCell(Col,Row);
  Exit:
  CurOff;
end;

procedure ReadFor;
label
  Exit;
var
  P,X,Y,L,N:   integer;
begin
  CurOn;
  X:=1;
  Y:=24;
  N:=80;
  P:=0;
  if CA[Col,Row]<>0 then
  begin
    GetCell(Col,Row);
    if CType<3 then
    begin
      Bell;
      goto Exit;
    end;
    AddFormSuffix;
    S:=CFor;
  end else
    S:='';
  gotoxy(1,24);
  write(S);
  ReadIn(X,Y,N,S);
  if S='' then goto Exit;
  P:=Pos('&',S);
  if P=0 then CForm:=1
  else
  begin
    TS:=Copy(S,P,6);
    UpperCase(TS);
    S:=Copy(S,1,Pred(P));
    if TS='&HIDE' then CForm:=4 else
    if TS='&BAR'  then CForm:=3 else
    if TS='&SCI'  then CForm:=2 else
    if Copy(TS,1,3)='&FD'  then CForm:=0 else
    if Copy(TS,1,4)='&DOL' then CForm:=1 else CForm:=1;
    if CForm<2 then
    begin
      if pos('$',TS)>0 then CForm:=CForm+10 else
      if pos('%',TS)>0 then CForm:=CForm+20 else
      if pos('#',TS)>0 then CForm:=CForm+30;
      if pos('^',TS)>0 then CForm:=CForm+100 else
      if pos('<',TS)>0 then CForm:=CForm+200;
    end;
  end;
  CFor:=S;
  CVal:=0;
  if ThisCalc=1 then CType:=13 else CType:=3;
  PutCell(Col,Row);
  if CalcOn then
  begin
    LookUpCells;
    ShowCells;
  end else ShowStr(Col,Row,CellText(Col,Row));
Exit:
  CurOff;
  gotoxy(1,24);
  ClrEol;
end;

procedure Block;
label
  Start,Exit;
var
  TS:                string[40];
  S1:                string[255];
  C,R,
  C1,R1:             integer;
  FileName:          str14;
  F:                 text;
begin
  Read(kbd,Ch);
  if Ch=^B then
  begin
    Hide:=False;
    SC:=Col;
    SR:=Row;
    ShowCells;
  end;
  if Ch=^K then
  begin
    Hide:=False;
    FC:=Col;
    FR:=Row;
    ShowCells;
  end;
  if Ch=^H then
  begin
    if Hide=True then Hide:=False else Hide:=True;
    ShowCells;
  end;
  if Ch in [^V,^C,^Y,^P,^W] then
  begin
    Hide:=False;
    DC:=Col;
    DR:=Row;
    C1:=FC-SC;
    R1:=FR-SR;
    if Ch in [^P,^W] then
    begin
      C:=0;
      for R:=SC to FC do
      begin
        C:=C+CWidth[R];
        if C>80 then
        begin
          Error(51);
          goto exit;
        end;
      end;
    end;
    if Ch=^P then
    begin
      TS:='';
      CurOn;
      UlCur;
      gotoxy(1,24);
      clreol;
      write('center print-out <Y>/N ? ');
      repeat read(kbd,Ch1); Ch1:=UpCase(Ch1); until Ch1 in ['Y','N',#13];
      if Ch1<>'N' then TS:=StringOf(40-(C div 2),' ');
      message('press return to start print-out ? ');
      read(kbd,Ch1);
      message('');
      CurOff;
    end;
    if Ch=^W then
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
      if Exist(FileName) then
      begin
        write(#13);
        clreol;
        HighVideo;
        write('file exists, erase (Y/N) ? ');
        LowVideo;
        repeat read(kbd,Ch1); Ch1:=Upcase(Ch1); until Ch1 in ['Y','N'];
        write(#13);
        clreol;
        if Ch1='N' then goto Start;
      end;
      Assign(F,FileName);
      ReWrite(F);
    end;
    if Ch in [^V,^C] then
    begin
      if (((C1+DC in [SC..FC]) and
         (R1+DR in [SR..FR])) or
         ((DC in [SC..FC]) and
         (DR in [SR..FR]))) or
         (DC+C1>26) or
         (DR+R1>99) then
      begin
        Bell;
        goto Exit;
      end;
    end;
    Err:=0;
    S1:='';
    for R:=SR to FR do
    begin
      for C:=SC to FC do
      begin
        case Ch of
          ^V,^C:
          begin
            if CA[C,R]<>0 then
            begin
              GetCell(C,R);
              PutCell((C-SC)+DC,(R-SR)+DR);
              if Err<>0 then
              begin
                ShowCells;
                Goto Exit;
              end;
              if Ch=^V then DelCell(C,R);
            end;
          end;
          ^Y:
          DelCell(C,R);
          ^P,^W:
          begin
            S:=CellText(C,R);
            while ord(S[0])<CWidth[C] do S:=S+' ';
            S1:=S1+S;
          end;
        end;
      end;
      if Ch in [^P,^W] then
        while S1[Ord(S1[0])]=' ' do S1[0]:=chr(pred(ord(S1[0])));
      if Ch=^P then
        writeln(lst,TS+S1);
      if Ch=^W then
        writeln(F,S1);
      S1:='';
    end;
    if Ch=^W then close(F);
    if Ch in [^Y,^P,^W] then
    begin
      FC:=Pred(SC);
      FR:=Pred(SR);
    end else
    begin
      SC:=DC;
      SR:=DR;
      FC:=DC+C1;
      FR:=DR+R1;
    end;
    LookUpCells;
    ShowCells;
  end;
Exit:
end;
