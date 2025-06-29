procedure CleanUp;
begin
  CAddr:=MemStart;
  Message(' clean up in progress, please wait ... ');
  for TC:=1 to 26 do
    for TR:=1 to 99 do
      CA[TC,TR]:=0;
  while CAddr<MemPos do
  begin
    if Mem[CAddr+3]=9 then
    begin
      Temp:=CAddr+Mem[CAddr];
      Move(Mem[Temp],Mem[CAddr],(MemPos-Temp)+1);
      MemPos:=MemPos-(Temp-CAddr);
    end else
    begin
      CA[Mem[CAddr+1],Mem[CAddr+2]]:=CAddr;
      CAddr:=CAddr+Mem[CAddr];
    end;
  end;
  FreeOfs:=0;
  Message('');
end;

procedure DelCell(C,R: integer);
begin
  CAddr:=CA[C,R];
  if CAddr<>0 then
  begin
    FreeOfs:=FreeOfs+Mem[CAddr];
    Mem[CAddr+3]:=9;
    CA[C,R]:=0;
  end;
end;

procedure PutCell(C,R: integer);
label
  Exit;
{ uses:    CType, CText, CFor, CVal }
begin
  if CA[C,R]<>0 then DelCell(C,R);
  Temp   :=MemPos;
  CAddr  :=MemPos;
  CA[C,R]:=MemPos;
  if CType in [1,2]  then MemPos:=MemPos+Ord(CText[0])+5;
  if CType in [3,13] then MemPos:=MemPos+Ord(CFor[0])+12;
  if MemPos>MemEnd then
  begin
    MemPos :=Temp;
    CleanUp;
    Temp   :=MemPos;
    CAddr  :=MemPos;
    CA[C,R]:=MemPos;
    if CType in [1,2]  then MemPos:=MemPos+Ord(CText[0])+5;
    if CType in [3,13] then MemPos:=MemPos+Ord(CFor[0])+12;
    if MemPos>MemEnd then
    begin
      Error(11);
      CA[C,R]:=0;
      MemPos:=Temp;
      ShowCells;
      goto Exit;
    end;
  end;
  Mem[CAddr]  :=MemPos-CAddr;
  Mem[CAddr+1]:=C;
  Mem[CAddr+2]:=R;
  Mem[CAddr+3]:=CType;
  Case CType of
    1,2 : Move(CText,Mem[CAddr+4],Ord(CText[0])+1);
    3,13: begin
            Move(CVal,Mem[CAddr+5 ],6);
            Move(CFor,Mem[CAddr+11],Ord(CFor[0])+1);
            Mem[CAddr+4]:=CForm;
          end;
  end;
Exit:
end;

procedure GetCell(C,R: integer);
{ returns: CAddr, CType, CText, CFor, CVal }
begin
  CAddr:=CA[C,R];
  if CAddr<>0 then
  begin
    CType:=Mem[CAddr+3];
    case CType of
      1,2:  begin
              Move(Mem[CAddr+4],CText,Mem[CAddr+4]+1);
              CFor:='';
              CForm:=0;
              CVal:=0;
            end;
      3,13: begin
              Move(Mem[CAddr+5 ],CVal,6);
              Move(Mem[CAddr+11],CFor,Mem[CAddr+11]+1);
              CForm:=Mem[CAddr+4];
              CText:='';
            end;
    end;
  end;
  if (CAddr=0) or (CType=0) then
  begin
    CText:='';
    CFor :='';
    CForm:=0;
    CType:=0;
    CVal :=0;
  end;
end;

