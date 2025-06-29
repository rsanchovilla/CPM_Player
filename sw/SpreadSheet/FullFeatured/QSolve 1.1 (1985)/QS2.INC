
procedure ShowStr(C,R: integer; Text: str80);
var
  L: integer;
begin
  if (CType=2) or (CForm=3) then Gon;
  gotoxy(XCol(C),(R-CR)+2);
  if (C in [SC..FC]) and (R in [SR..FR]) and (not Hide) then
  begin
    while ord(Text[0])<CWidth[C] do Text:=Text+' ';
    HighVideo;
    write(copy(Text,1,CWidth[C]));
    LowVideo;
  end else
    write(copy(Text,1,CWidth[C]));
  if (CType=2) or (CForm=3) then Goff;
end;

function CellText(C,R: integer): str80;
var
  S1:    string[20];
  P,L,M: integer;
begin
  GetCell(C,R);
  Case CType of
    3,13:
       begin
         S:='';
         str(CForm:3,TS);
         if TS[3]='0' then
         begin
           if abs(CVal)>=1E+12 then
             CVal:=0;
           str(CVal,S1);
           S:='';
           while S1[1]=' ' do delete(S1,1,1);
           for L:=1 to ord(S1[0])-4 do
           begin
             if S1[L] in ['0'..'9'] then
               S:=S+S1[L];
           end;
           while S[ord(S[0])]='0' do S[0]:=chr(ord(S[0])-1);
           L:=ord(S1[0]);
           M:=(ord(S1[L-1])-48)*10+(ord(S1[L])-48);
           if S1[L-2]='-' then M:=-M;
           while M<0 do
           begin
             M:=M+1;
             S:='0'+S;
           end;
           while Succ(M)>Ord(S[0]) do S:=S+'0';
           if M+2<=ord(S[0]) then
             insert('.',S,M+2);
           if CVal<0 then S:='-'+S;
         end;
         if TS[3]='1' then
         begin
           if abs(CVal)>=1E+6 then
             CVal:=0;
           Str(CVal:10:2,S);
           while (S[1]=' ') do delete(S,1,1);
         end;
         if TS[3]='2' then Str(CVal,S);
         if TS[3]='3' then
         begin
           if (CVal<0)   then CVal:=0;
           if (CVal>255) then CVal:=255;
           if Ch=^P then Ch1:='#' else Ch1:='#';
           for Temp:=1 to Trunc(CVal) do S:=S+Ch1;
         end;
         if TS[3] in ['1','2'] then
         begin
           if TS[2]='3' then
             S:=S+'#'
           else
           if TS[2]='2' then
             S:=S+'%'
           else
           if TS[2]='1' then
             S:='$'+S;
         end;
         if CForm=3 then CText:=S
         else
         begin
           if TS[1]<='2' then
           begin
             Temp:=Ord(S[0]);
             if TS[1]='1' then
               for L:=1 to (CWidth[C] div 2)-(Temp div 2) do S:=' '+S;
             if TS[1]=' ' then
               for L:=Succ(Temp) to CWidth[C] do S:=' '+S;
             CText:=S;
           end;
         end;
       end;
  end;
  CellText:=CText;
end;

procedure ShowCells;
var
  C,R: integer;
begin
  for R:=CR to CR+20 do
  begin
    gotoxy(4,(R-CR)+2);
    ClrEol;
    for C:=CC to CC+Pred(CRight) do
      if CA[C,R]<>0 then
        ShowStr(C,R,CellText(C,R))
          else
        begin
          if (C in [SC..FC]) and (R in [SR..FR]) then
            ShowStr(C,R,'');
        end;
  end;
end;
