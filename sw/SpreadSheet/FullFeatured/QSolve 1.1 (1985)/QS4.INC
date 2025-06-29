
function ArcSin(X: real): real;
begin
  if X=1  then ArcSin:= pi/2 else
  if X=-1 then ArcSin:=-pi/2 else
  ArcSin:=Arctan(X/sqrt(-X*X+1));
end;

function ArcCos(X: real): real;
begin
  if X=1  then ArcCos:=0  else
  if X=-1 then ArcCos:=pi else
  ArcCos:=-Arctan(X/sqrt(-X*X+1))+1.570796327;
end;

function IsAlpha(ch: char): boolean;
begin
  IsAlpha := (Upcase(ch) in ['A'..'Z'])
end;

function IsWhite(ch: char): boolean;
begin
  IsWhite := (ch= ' ') or (ch=chr(9)) or (ch=chr(13));
end;

function IsDelim(ch: char): boolean;
begin
  if pos(ch,' +-/*%^=()$')<>0 then IsDelim := true
    else IsDelim := false;
end;

function Isdigit(ch: char): boolean;
begin
  Isdigit := ch in ['0'..'9'];
end;

{$A-}

procedure GetToken;
begin
  token := '';
  while (IsWhite(prog[t])) do t := succ(t);
  if prog[t]='$' then token := '$';
  if pos(prog[t],'+-*/%^=()')<>0 then
  begin
    TokType := Delimiter;
    token := prog[t];
    t := succ(t);
  end else
  if IsAlpha(prog[t]) then
  begin
    while (not IsDelim(prog[t])) do
    begin
      token := token + prog[t];
      t := succ(t)
    end;
    TokType := Funct;
  end else
  if IsDigit(prog[t]) then
  begin
    while (not IsDelim(prog[t])) do
    begin
      token := token + prog[t];
      if (prog[t+1]='E') and (prog[t+2] in ['+','-']) then
      begin
        token := token + copy(prog,t+1,2);
        t := t + 2;
      end;
      t := succ(t);
      Toktype := number;
    end;
  end;
end;

function Pwr(a,b: real) : real;
var
  t:    integer;
  temp: real;
begin
  if a= 0 then pwr := 1
  else
  begin
    temp := a;
    for t := trunc(b) downto 2 do a := a * temp;
    Pwr := a;
  end;
end;

procedure Arith(op: str3; var result,operand: real);
begin
  if Op[0]>#1 then
  begin
    if (abs(result)>32767) or (abs(operand)>32767) then
    begin
      result:=0;
      error(4);
    end;
  end;
  if Op = 'OR'  then result := trunc(result) or  trunc(operand);
  if Op = 'XOR' then result := trunc(result) xor trunc(operand);
  if Op = 'AND' then result := trunc(result) and trunc(operand);
  if Op = 'MOD' then result := trunc(result) mod trunc(operand);
  if Op = '+'   then result := result + operand;
  if Op = '-'   then result := result - operand;
  if Op = '*'   then result := result * operand;
  if Op = '/'   then
  begin
    if operand<>0 then result := result / operand
  else
    begin
      result:=0;
      error(3);
    end;
  end;
  if Op = '^'   then result := Pwr(result,operand);
end;

procedure Level0(var result: real); forward;
procedure Level1(var result: real); forward;
procedure Level2(var result: real); forward;
procedure Level3(var result: real); forward;
procedure Level4(var result: real); forward;
procedure Level5(var result: real); forward;
procedure Primitive(var result: real); forward;

procedure GetExp(var result: real);
begin
  t:=1;
  GetToken;
  if length(token) <> 0 then Level0(result) else Error(3);
end;

procedure Level0;
var
  op:   string[3];
  hold: real;
begin
  Level1(result);
  op := token;
  while ((op='OR') or (op='XOR') or (op='AND') or (op='MOD')) do
  begin
    Gettoken;
    Level1(hold);
    arith(op, result, hold);
    op := token;
  end;
end; {Level0}

procedure Level1;
var
  op:   char;
  hold: real;
begin
  Level2(result);
  op := token[1];
  while ((op='+') or (op='-')) do
  begin
    Gettoken;
    Level2(hold);
    arith(op, result, hold);
    op := token[1]
  end;
end; {Level1}

procedure Level2;
var
  op:   char;
  hold: real;
begin
  Level3(result);
  op := token[1];
  while ((op='*') or (op='/')) do
  begin
    Gettoken;
    level3(hold);
    arith(op, result, hold);
    op := token[1];
  end;
end; {Level2}

procedure Level3;
var
  hold: real;
begin
  Level4(result);
  if token[1] = '^' then
  begin
    GetToken;
    Level4(hold);
    arith('^',result, hold);    {exponent}
  end;
end; {Level3}

procedure Level4;
label
  Exit;
var
  Op,L: byte;
const
  Rad=57.29577951;
  NumFun=15;
  Fun: array[1..NumFun] of string[5] =
  ('SIN','COS','TAN','ASIN','ACOS','ATAN',
   'SQRT','LOG','LN','INT','TRUNC','FRAC','ABS','RAND','SIGN');
begin
  Op:=0;
  if tokType=Funct then
    for L:=1 to NumFun do
      if Token=Fun[L] then
        op:=L;
  if Op<>0 then GetToken;
  Level5(result);
  case Op of
    4,5: if abs(result)>1 then
         begin
           result:=0;
           error(4);
           goto Exit;
         end;
    7:   if result<0  then
         begin
           result:=0;
           error(4);
           goto Exit;
         end;
    8,9: if result<=0 then
         begin
           result:=0;
           error(4);
           goto Exit;
         end;
    14:  if abs(result)>32767 then
         begin
           result:=0;
           error(4);
           goto Exit;
         end;
  end;
  case Op of
    1:  result:=sin(result/Rad);
    2:  result:=cos(result/Rad);
    3:  result:=sin(result/Rad)/cos(result/Rad);
    4:  result:=arcsin(result)*Rad;
    5:  result:=arccos(result)*Rad;
    6:  result:=arctan(result)*Rad;
    7:  result:=sqrt(result);
    8:  result:=ln(result)/ln(10);
    9:  result:=ln(result);
    10: result:=int(result);
    11: result:=trunc(result);
    12: result:=frac(result);
    13: result:=abs(result);
    14: result:=random(trunc(result));
    15: begin
          if result<0 then result:=-1;
          if result>0 then result:=1;
        end;
  end;
Exit:
end; {level4}

procedure Level5;
var
  op: char;
begin
  op := ' ';
  if ((tokType=Delimiter) and ((token[1]='+') or (token[1]= '-'))) then
  begin
    op := token[1];
    Gettoken;
    Level4(result);
  end else
    Primitive(result);
  if op='-' then result := -result;
end; {level5}

procedure Primitive;
begin
  if TokType=Number then val(token, result, code)
    else Error(1);
  GetToken;
end; {Primitive}

procedure Calc(var result: real);
label
  Exit;
var
  TS1:             str255;
  CPos,Count,
  MaxPos,MaxCount: integer;
begin
  TS1:=Prog;
  repeat
    Count   :=0;
    MaxCount:=0;
    MaxPos  :=0;
    for CPos:=1 to Ord(Prog[0]) do
    begin
      Ch:=Prog[CPos];
      if Ch='(' then Count:=Count+1;
      if Ch=')' then Count:=Count-1;
      if Count>MaxCount then
      begin
        MaxCount:=Count;
        MaxPos  :=CPos;
      end;
    end;
    if Count<>0 then
    begin
      Error(1);
      result:=0;
      goto Exit;
    end;
    if MaxCount<>0 then
    begin
      Prog:=copy(Prog,Succ(MaxPos),255);
      Prog:=copy(Prog,1,Pred(pos(')',Prog)))+'$';
      delete(TS1,MaxPos,Ord(Prog[0])+1);
      GetExp(result);
      str(result,Prog);
      insert(prog,TS1,MaxPos);
    end;
    Prog:=TS1;
  until MaxCount=0;
  GetExp(result);
Exit:
end;

function LookUp(C,R: integer): real;
label
  Exit;
var
  F:       str255;
  L,
  C1,R1,
  SC,SR,
  FC,FR,
  Func:    integer;
  V,FV:    real;
begin
  C1:=C;
  R1:=R;
  GetCell(C,R);
  UpperCase(CFor);
  F:=CFor;
  LookUp:=0;
  if CType<3 then goto Exit;
  if CType=13 then LastCalc:=1 else LastCalc:=0;
  if LastCalc=ThisCalc then
  begin
    move(mem[CA[C1,R1]+5],V,6);
    LookUp:=V;
    goto Exit;
  end;
  L:=1;
  while L<Ord(F[0]) do
  begin
    S:=copy(F,L,3);
    if (S='SUM') or (S='MAX') or (S='MIN') then
    begin
      if S='SUM' then Func:=1;
      if S='MAX' then Func:=2;
      if S='MIN' then Func:=3;
      delete(F,L,3);
      if F[L]<>'[' then
      begin
        Error(1);
        goto Exit;
      end;
      delete(F,L,1);
      StrRC(Copy(F,L,3),C,R);
      if R>9 then
        delete(F,L,1);
      delete(F,L,2);
      SC:=C;
      SR:=R;
      if F[L]<>'>' then
      begin
        Error(1);
        goto Exit;
      end;
      delete(F,L,1);
      StrRC(Copy(F,L,3),C,R);
      if R>9 then
        delete(F,L,1);
      delete(F,L,2);
      if F[L]<>']' then
      begin
        Error(1);
        goto Exit;
      end;
      delete(F,L,1);
      FC:=C;
      FR:=R;
      case Func of
        1: FV:=0;
        2: FV:=-1E+36;
        3: FV:=+1E+36;
      end;
      if ((SC<>FC) and (SR<>FR)) or
         (SC<1)  or (FC<1)  or (SR<1)  or (FR<1)  or
         (SC>26) or (FC>26) or (SR>99) or (FR>99) or
         (SC>FC) or (SR>FR) then
      begin
        Error(1);
        goto Exit;
      end;
      if SC=FC then
      begin
        C:=SC;
        for R:=SR to FR do
        begin
          if HeapPtr+512>RecurPtr then
          begin
            V:=LookUp(C,R);
            case Func of
              1: FV:=FV+V;
              2: if V>FV then FV:=V;
              3: if V<FV then FV:=V;
            end;
          end else
          begin
            Error(2);
            Goto Exit;
          end;
        end;
      end else
      begin
        R:=SR;
        for C:=SC to FC do
        begin
          if HeapPtr+512>RecurPtr then
          begin
            V:=LookUp(C,R);
            case Func of
              1: FV:=FV+V;
              2: if V>FV then FV:=V;
              3: if V<FV then FV:=V;
            end;
          end else
          begin
            Error(2);
            Goto Exit;
          end;
        end;
      end;
      str(FV,S);
      if Ord(S[0])+Ord(F[0])>255 then
      begin
        Error(4);
        goto Exit;
      end;
      insert(S,F,L);
      L:=L+Pred(Ord(S[0]));
    end;
    if (F[L] in ['A'..'Z']) and (F[L+1] in ['0'..'9']) then
    begin
      StrRC(Copy(F,L,3),C,R);
      if R>9 then
        delete(F,L,1);
      delete(F,L,2);
      if HeapPtr+512>RecurPtr then
        V:=LookUp(C,R)
      else
      begin
        Error(2);
        Goto Exit;
      end;
      str(V,S);
      if Ord(S[0])+Ord(F[0])>255 then
      begin
        Error(4);
        goto Exit;
      end;
      insert(S,F,L);
      L:=L+Pred(Ord(S[0]));
    end;
    L:=Succ(L);
  end;
  Prog:=F+'$';
  Calc(V);
  LookUp:=V;
  move(V,mem[CA[C1,R1]+5],6);
  CType:=ThisCalc*10+3;
  mem[CA[C1,R1]+3]:=CType;
Exit:
  C:=C1;
  R:=R1;
end;

{$A+}

procedure LookUpCells;
var
  C,R: integer;
  V:   real;
begin
  if CalcOn then
  begin
    if ThisCalc=1 then ThisCalc:=0 else ThisCalc:=1;
    for R:=1 to 99 do
      for C:=1 to 26 do
        if CA[C,R]<>0 then
          V:=LookUp(C,R);
  end;
end;

