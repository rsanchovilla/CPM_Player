
procedure LeftCol;
begin
  if Col>1 then
  begin
    Col:=Col-1;
    if Col<CC then
    begin
      CC:=CC-1;
      ShowBorder;
      ShowCells;
    end;
  end;
end;

procedure LeftPage;
begin
  CC:=CC-Pred(CLeft);
  if CC<1 then CC:=1;
  Temp:=CC+Pred(CRight);
  if Temp<Col then Col:=Temp;
  ShowBorder;
  ShowCells;
end;

procedure RightCol;
begin
  if Col<26 then
  begin
    Col:=Col+1;
    if Col>CC+Pred(CRight) then
    begin
      while (CC+Pred(CRight)<Col) do CC:=Succ(CC);
      ShowBorder;
      showCells;
    end;
  end;
end;

procedure RightPage;
var
  T: integer;
begin
  CC:=CC+CRight;
  Temp:=CC;
  CC:=27;
  T:=CLeft;
  CC:=Temp;
  if CC>28-T then CC:=28-T;
  if Col<CC then
    Col:=CC;
  ShowBorder;
  ShowCells;
end;

procedure UpRow;
begin
  if Row>1 then
  begin
    Row:=Row-1;
    if Row<CR then
    begin
      CR:=CR-1;
      ShowBorder;
      showCells;
    end;
  end;
end;

procedure UpPage;
begin
  CR:=CR-21;
  Row:=Row-21;
  if Row<1 then Row:=1;
  if CR<1 then CR:=1;
  ShowBorder;
  ShowCells;
end;

procedure DownRow;
begin
  if Row<99 then
  begin
    Row:=Row+1;
    if Row>CR+20 then
    begin
      CR:=CR+1;
      ShowBorder;
      showCells;
    end;
  end;
end;

procedure DownPage;
begin
  CR:=CR+21;
  Row:=Row+21;
  if Row>99 then Row:=99;
  if CR>79 then CR:=79;
  ShowBorder;
  ShowCells;
end;
