{ This program is Copyrighted by Borland International Inc. 1983     }

program MicroCalc;

const
  FileVar= 36;

  FXMax = 7;    { Maximum number of columns                   }
  FYMax = 21;   { Maximum number of lines                     }

  Constant=1;
  Formula=2;
  Txt=4;
  OverWritten=8;
  Locked=16;
  Calculated=32;

var
  XPOS: array[1..FXMax] of integer;

  Screen_CellStatus: array[1..FXMax,1..FYMax] of integer; 
  Screen_Contents: array[1..FXMax,1..FYMax] of String[70];
  Screen_Value: array[1..FXMax,1..FYMax] of real;
  Screen_DEC: array[1..FXMax,1..FYMax] of integer;
  Screen_FW: array[1..FXMax,1..FYMax] of integer;

  { Definition of the spread sheet }
  
  FX:            integer;           { Column of current cell         }
  FY:            Integer;           { Line of current cell           }
  Ch:            string[1];         { Last read character            }
  nCh:           integer; 
  MCFile:        string[FileVar];   { File to store sheets in        }
  AutoCalc:      boolean;           { Recalculate after each entry?  }

  Form: Boolean;

    bdosRes, bdosResAddr: integer;
    IORes: integer; 

procedure bdos(c, de: integer);
(* call cp/m bdos function c, with de param. Return values in a,hl *)
var m: array[0..9] of integer;
    bdoscall: integer; 
begin
   INIT m TO 256, 0, 4352, 0, 1485, 8704, 2048, 562, 8, 201;
   m[1] := c;
   m[3] := de;
   bdoscall := addr(m[0]);
   call (bdoscall);
   bdosRes     := mem[2050];
   bdosResAddr := mem[2048] + 256*mem[2049];
end;

function BlsPascalVersion: integer; 
begin
   BlsPascalVersion := mem[$0100 + 5] * 10 + mem[$0100 + 6];
   (* return 10 for v1.0, 12 for v1.2, etc *)
end; 

procedure Halt; 
begin
   if BlsPascalVersion = 10 then call(-7845);
   if BlsPascalVersion = 12 then call(8524);
   bdos(0,0);
end; 

procedure ClrScr;
begin
   write(chr(12));
end;

procedure GotoXY(x,y: integer);
begin
   screen(x-1,y-1);
end;


function UpCase(c: integer): integer;
begin 
   if (c >= ord('a')) and (c <= ord('z')) then c := c - ord('a') + ord('A');
   UpCase := c;
end;

function ValInt(s:string[8]; var Err: integer): integer;
var n: integer;
    p: integer; 
    ch: string[1];
    neg: boolean;
   procedure nextchar;
   begin p:= p+1; ch :=mid(s, p, 1); end;
begin
  n := 0; p := 0; neg := false; 
  nextchar;
  if ch = '-' then begin
     neg := true; 
     nextchar; 
  end;
  while (ch >= '0') and (ch <= '9') do begin
     n := n * 10 + (ord(ch) - 48);
     nextchar;
  end; 
  if neg then ValInt := -n else ValInt := n;
  if ch <> '' then Err := p else Err := 0;
end;

function ValReal(s:string[16]; var Err: integer): real;
var r,f: real;
    p: integer; 
    ch: string[1];
    neg, decpoint: boolean;
   procedure nextchar;
   begin p:= p+1; ch :=mid(s, p, 1); end;
begin
  r := 0; p := 0; neg := false; decpoint := false;
  f := 1; nextchar;
  if ch = '-' then begin
     neg := true; 
     nextchar; 
  end;
  while (ch >= '0') and (ch <= '9') do begin
     r := r * 10.0 + (ord(ch) - 48);
     if decpoint then f := f * 10.0;
     nextchar;
     if (ch='.') and not decpoint then begin
        decpoint := true; 
        nextchar; 
     end; 
  end; 
  if neg then ValReal := -r/f else ValReal := r/f;
  if ch <> '' then Err := p else Err := 0;
end;

function StrInt(n: integer): string[8];
label ProcEnd;
var d: integer; 
    ch: string[1];
    neg: boolean;
    s: string[8];
begin
   s := ''; neg := false;
   if n < 0 then begin
      neg := true;
      n := -n;
   end;
   repeat
      d := n mod 10;
      n := n div 10;
      ch := chr(48+d);
      s := concat(ch, s);
   until n = 0;
   if neg then s := concat('-', s);
   ProcEnd:
   StrInt := s;
end; 

procedure ClrMsgEol;
var n: integer;
begin
  GotoXY(1,24);
  for n := 1 to 78 do write(' ');
  GotoXY(1,24);
end;

procedure Msg(S: String[255]);
begin
  ClrMsgEol;
  Write(S);
end;

procedure Flash(X: integer; S: String[255];  Blink: boolean);
var a: real;
    n: integer; 
begin
  GotoXY(X,23);
  Write(S);
  if Blink then begin
    repeat
      GotoXY(X,23);
      Blink:=not Blink; 
      if Blink then Write(S) else for n := 1 to length(S) do write(' ');
      for n:= 0 to 100 do begin a := 0.5; a := cos(a); end;
    until keyboard<>0;
  end;
  GotoXY(X,23);
  Write(S);
end;

procedure Auto;
begin
  AutoCalc:=not AutoCalc;
  if AutoCalc then  Flash(65,'AutoCalc: ON ',false)
  else Flash(65,'AutoCalc: OFF',false);
end;

procedure Grid;
var I: integer;
    Count: integer;
begin
  For Count:=1 to FXMax do begin
    GotoXY(XPos[Count],1);
    Write(chr(ord('A')-1+Count));
  end;
  GotoXY(1,2);
  for I:=1 to FYMax do writeln(I:2);
  if AutoCalc then  Flash(65,'AutoCalc: ON' ,false)
  else Flash(65,'AutoCalc: OFF',false);
  Flash(33,'  Type / for Commands',false);
end;


procedure Initialize;
var
  I: integer;
  J: Integer;
  LastName: string[2];
begin
  for I:=1 to FXMax do begin
    for J:=1 to FYMax do begin
        Screen_CellStatus[I,J]:=Txt;
        Screen_Contents[I,J]:='';
        Screen_Value[I,J]:=0;
        Screen_DEC[I,J]:=2;              { Default number of decimals        }
        Screen_FW[I,J]:=10;              { Default field whith               }
    end;
  end;
  AutoCalc:=True;
  FX:=1; FY:=1;            { First field in upper left corner  }
end;

procedure Clear;
begin
  ClrMsgEol;
  Write('Clear this worksheet? (Y/N) ');
  repeat Read(Ch); Ch := chr(upcase(ord(Ch))); until (Ch = 'Y') or (Ch = 'N');
  Write(Ch);
  if Ch='Y' then begin
    ClrScr;
    Initialize;
    Grid;
  end;
end;

procedure FlashType;
var CellStatus: integer; 
begin
  CellStatus := Screen_CellStatus[FX,FY];
  GotoXY(1,23);
  Write(FX,FY:2,' ');
  if (Formula and CellStatus) <> 0 then write('Formula:')  else
  if (Constant and CellStatus) <> 0 then Write('Numeric ') else
  if (Txt and CellStatus) <> 0 then Write('Text    ');
  ClrMsgEol;
  if (Formula and CellStatus) <> 0 then Write(Screen_Contents[FX,FY]);
end;

procedure GotoCell(GX: integer; GY: integer);
begin
    GotoXY(XPos[GX],GY+1);
    Write('[         ]');
    GotoXY(XPos[GX],GY+1);
    if ((Txt and Screen_CellStatus[GX,GY]) <> 0) then Write('[', Screen_Contents[GX,GY])
    else begin
      if Screen_DEC[GX,GY]>=0 then Write('[', Screen_Value[GX,GY]:Screen_FW[GX,GY]:Screen_DEC[GX,GY])
      else Write('[', Screen_Value[GX,GY]:Screen_FW[GX,GY]);
    end;
    FlashType;
    GotoXY(XPos[GX],GY+1);
end;

procedure LeaveCell(FX,FY: integer);
begin
    GotoXY(XPos[FX],FY+1);
    Write('           ');
    GotoXY(XPos[FX],FY+1);
    if ((Txt and Screen_CellStatus[FX,FY])<>0) then Write(Screen_Contents[FX,FY])
    else begin
      if Screen_DEC[FX,FY]>=0 then Write(Screen_Value[FX,FY]:Screen_FW[FX,FY]:Screen_DEC[FX,FY])
      else Write(Screen_Value[FX,FY]:Screen_FW[FX,FY]);
    end;
end;


procedure Update;
var
  UFX, UFY: integer;
begin
  ClrScr;
  Grid;
  for UFX:=1 to FXMax do for UFY:=1 to FYMax do
     if Screen_Contents[UFX,UFY]<>'' then LeaveCell(UFX,UFY);
  GotoCell(FX,FY);
end;

procedure MoveDown;
var Start: integer;
begin
  LeaveCell(FX,FY);
  Start:=FY;
  repeat
    FY:=FY+1;
    if FY>FYMax then FY:=1;
  until ((Screen_CellStatus[FX,FY] and (OverWritten+Locked))=0) or (FY=Start);
  if FY<>Start then GotoCell(FX,FY);
end;

procedure MoveUp;
var Start: integer;
begin
  LeaveCell(FX,FY);
  Start:=FY;
  repeat
    FY:=FY-1;
    if FY<1 then FY:=FYMax;
  until ((Screen_CellStatus[FX,FY] and (OverWritten+Locked))=0) or (FY=Start);
  if FY<>Start then GotoCell(FX,FY);
end;

procedure MoveRight;
var Start: integer;
begin
  LeaveCell(FX,FY);
  Start:=FX;
  repeat
    FX:=Succ(FX);
    if FX>FXMax then begin
      FX:=1;
      FY:=FY+1;
      if FY>FYMax then FY:=1;
    end;
  until ((Screen_CellStatus[FX,FY] and (OverWritten+Locked))=0) or (FX=Start);
  if FX<>Start then GotoCell(FX,FY);
end;

procedure MoveLeft;
var Start: integer;
begin
  LeaveCell(FX,FY);
  Start:=FX;
  repeat
    FX:=Pred(FX);
    if FX<1 then
    begin
      FX:=FXMax;
      FY:=FY-1;
      if FY<1 then FY:=FYMax;
    end;
  until ((Screen_CellStatus[FX,FY] and (OverWritten+Locked))=0) or (FX=Start);
  if FX<>Start then GotoCell(FX,FY);
end;

procedure Evaluate(var IsFormula: Boolean; { True if formula}
                   var sFormula: string[70]; { Fomula to evaluate}
                   var Value: Real;  { Result of formula }
                   var ErrPos: Integer);{ Position of error }
var
  Pos: Integer;    { Current position in formula                     }
  Ch: string[1];        { Current character being scanned                 }
  EXY: string[3];  { Intermidiate string for conversion              }

  procedure NextCh;
  var l: integer; 
  begin
    repeat
      Pos:=Pos+1;
      l := length(sFormula);
      if Pos<=l then begin
         Ch:=mid(sFormula, Pos, 1) 
      end else begin
         Ch:=chr(13);
      end;
    until Ch<>' ';
  end  { NextCh };


  function Expression: Real;
  var  E: Real;
       Opr: string[1];

    function SimpleExpression: Real;
    var S: Real;
        Opr: string[1];

      function Term: Real;
      var T: Real;

        function SignedFactor: Real;

          function Factor: Real;
          const fabs    = 1; fsqrt = 2; fsqr = 3; fsin = 4; fcos  = 5;  
                farctan = 6; fln   = 7; flog = 8; fexp = 9; ffact = 10;
          var
            StandardFunctionNames: array[1..10] of string[6];
            E,EE,L:  Integer;       { intermidiate variables }
            Found:Boolean;
            F: Real;
            Sf:integer;
            OldEFY,                 { Current cell  }
            EFY,
            SumFY,
            Start:Integer;
            OldEFX,
            EFX,
            SumFX:integer;
            CellSum: Real;

              function Fact(I: Integer): Real;
              begin
                if I > 0 then begin Fact:=I*Fact(I-1); end
                else Fact:=1;
              end  { Fact };

          begin { Function Factor }
            INIT StandardFunctionNames TO 'ABS','SQRT','SQR','SIN','COS',
                                          'ARCTAN','LN','LOG','EXP','FACT';
            if ((Ch >= '0') and (Ch <= '9')) then begin
              Start:=Pos;
              repeat NextCh until not ((Ch >= '0') and (Ch <= '9')) ;
              if Ch='.' then repeat NextCh until not ((Ch >= '0') and (Ch <= '9'));
              if Ch='E' then begin
                NextCh;
                repeat NextCh until not ((Ch >= '0') and (Ch <= '9'));
              end;
              F := ValReal(mid(sFormula,Start,Pos-Start),ErrPos);
            end else if Ch='(' then  begin
              NextCh;
              F:=Expression;
              if Ch=')' then NextCh else ErrPos:=Pos;
            end else if (Ch >= 'A') and (Ch <= 'G') then begin { Maybe a cell reference }
              EFX:=ord(Ch) - ord('A') + 1;
              NextCh;
              if ((Ch >= '0') and (Ch <= '9'))  then begin
                F:=0;
                EXY:=Ch; NextCh;
                if ((Ch >= '0') and (Ch <= '9')) then begin
                  EXY:=concat(EXY,Ch);
                  NextCh;
                end;
                EFY := ValInt(EXY,ErrPos);
                IsFormula:=true;
                if ((Constant and Screen_CellStatus[EFX,EFY]) <> 0) and
                not ((Calculated and Screen_CellStatus[EFX,EFY])<>0) then begin
                  Evaluate(Form,screen_contents[EFX,EFY],f,ErrPos);
                  Screen_CellStatus[EFX,EFY]:=Screen_CellStatus[EFX,EFY] or Calculated;
                end else if not ((Txt and Screen_CellStatus[EFX,EFY])<>0) then
                F:=Screen_Value[EFX,EFY];
                if Ch='>' then begin
                  OldEFX:=EFX; OldEFY:=EFY;
                  NextCh;
                  EFX:=ord(Ch) - ord('A') + 1;
                  NextCh;
                  if ((Ch >= '0') and (Ch <= '9')) then begin
                    EXY:=Ch;
                    NextCh;
                    if ((Ch >= '0') and (Ch <= '9')) then begin
                      EXY:=concat(EXY,Ch);
                      NextCh;
                    end;
                    EFY := ValInt(EXY,ErrPos);
                    Cellsum:=0;
                    for SumFY:=OldEFY to EFY do begin
                      for SumFX:=OldEFX to EFX do begin
                        F:=0;
                        if ((Constant and Screen_CellStatus[SumFX,SumFY])<>0) and
                        not ((Calculated or Screen_CellStatus[SumFX,SumFY])<>0) then begin
                          Evaluate(Form,Screen_contents[SumFX,SumFY],f,errPos);
                          Screen_CellStatus[SumFX,SumFY]:=
                          Screen_CellStatus[SumFX,SumFY] or Calculated;
                        end else if not ((Txt and Screen_CellStatus[SumFX,SumFY])<>0) then
                        F:=Screen_Value[SumFX,SumFY];
                        Cellsum:=Cellsum+f;
                        f:=Cellsum;
                      end;
                    end;
                  end;
                end;
              end;
            end else
            begin
              found:=false;
              for sf:=fabs to ffact do
              if not found then
              begin
                l:=Length(StandardFunctionNames[sf]);
                if mid(sFormula,Pos,l)=StandardFunctionNames[sf] then begin
                  Pos:=Pos+l-1; NextCh;
                  F:=Factor;
                  case sf of
                    fabs:     f:=abs(f);
                    fsqrt:    f:=sqrt(f);
                    fsqr:     f:=sqr(f);
                    fsin:     f:=sin(f);
                    fcos:     f:=cos(f);
                    farctan:  f:=arctan(f);
                    fln :     f:=ln(f);
                    flog:     f:=ln(f)/ln(10);
                    fexp:     f:=exp(f);
                    ffact:    f:=fact(trunc(f));
                  end;
                  Found:=true;
                end;
              end;
              if not Found then ErrPos:=Pos;
            end;
            Factor:=F;
          end { function Factor};

        begin { SignedFactor }
          if Ch='-' then
          begin
            NextCh; SignedFactor:=-Factor;
          end else SignedFactor:=Factor;
        end { SignedFactor };

      begin { Term }
        T:=SignedFactor;
        while Ch='^' do begin
          NextCh; t:=exp(ln(t)*SignedFactor);
        end;
        Term:=t;
      end { Term };


    begin { SimpleExpression }
      s:=term;
      while (Ch = '*') or (Ch = '/') do begin
        Opr:=Ch; NextCh;
        if Opr = '*' then s:=s*term;
        if Opr = '/' then s:=s/term;
      end;
      SimpleExpression:=s;
    end { SimpleExpression };

  begin { Expression }
    E:=SimpleExpression;
    while (Ch = '+') or (Ch = '-') do begin
      Opr:=Ch; NextCh;
      if Opr = '+' then e:=e+SimpleExpression;
      if Opr = '-' then e:=e-SimpleExpression;
    end;
    Expression:=E;
  end { Expression };


begin { procedure Evaluate }
  if left(sFormula,1)='.' then sFormula:=concat('0',sFormula);
  if left(sFormula,1)='+' then sFormula:=mid(sFormula,2);
  IsFormula:=false;
  Pos:=0; NextCh;
  Value:=Expression;
  if Ch=chr(13) then ErrPos:=0 else ErrPos:=Pos;
end { Evaluate };

procedure Recalculate;
var
  RFX, RFY:integer;
  OldValue: real;
  Err: integer;

begin
  ClrMsgEol;
  Write('Calculating..');
  for RFY:=1 to FYMax do begin
    for RFX:=1 to FXMax do begin
      if ((Formula and Screen_CellStatus[RFX,RFY]) <>0) then begin
        Screen_CellStatus[RFX,RFY]:=Screen_CellStatus[RFX,RFY] or Calculated;
        OldValue:=Screen_Value[RFX,RFY];
        Evaluate(Form,Screen_Contents[RFX,RFY],Screen_Value[RFX,RFY],Err);
        if OldValue<>Screen_Value[RFX,RFY] then
        begin
          GotoXY(XPos[RFX],RFY+1);
          if (Screen_DEC[RFX,RFY]>=0) then Write(Screen_Value[RFX,RFY]:Screen_FW[RFX,RFY]:Screen_DEC[RFX,RFY])
          else Write(Screen_Value[RFX,RFY]:Screen_FW[RFX,RFY]);
        end;
      end;
    end;
  end;
  GotoCell(FX,FY);
end;

procedure GetLine(var S: String[70];          { String to edit       }
                         ColNO,LineNO,        { Where start line     }
                         MAX,                 { Max length           }
                         ErrPos: integer;     { Where to begin       }
                         UpperCase:Boolean);  { True if auto Upcase  }
var
  X: integer;
  InsertOn: boolean;
  OkChars: boolean;
  nCh: integer;

  procedure GotoX;
  begin
    GotoXY(X+ColNo-1,LineNo);
  end;

begin
  OkChars:=true;
  InsertOn:=true;
  X:=1; GotoX;
  Write(S);
  if Length(S)=1 then X:=2;
  if ErrPos<>0 then X:=ErrPos;
  GotoX;
  repeat
    Read(Ch);
    nCh := ord(Ch);
    if UpperCase then nCh:=UpCase(nCh);
    case nCh of
       27: begin
             S:=chr($FF); { ESC=abort editing }
             Ch:=chr(13);
           end;
       4: begin { ^D=Move cursor right }
             X:=X+1;
             if (X>length(S)+1) or (X>MAX) then X:=X-1;
             GotoX;
           end;
       7: begin { ^G=Delete right char }
             if X<=Length(S) then begin
               S := concat(left(S, X-1), mid(S, X+1));
               write(mid(S,X,Length(S)-X+1),' ');
               GotoX;
             end;
           end;
      20: begin { ^S,^H=Move cursor left }
             X:=X-1;
             if X<1 then X:=1;
             GotoX;
           end;
       6: begin { ^F=Move cursor to end of line }
              X:=Length(S)+1;
              GotoX;
           end;
       1: begin { ^A=Move cursor to beginning of line }
             X:=1;
             GotoX;
           end;
     127: begin { Delete left char }
             X:=X-1;
             if (Length(S)>0) and (X>0)  then begin
               S := concat(left(S, X-1), mid(S, X+1));
               write(mid(S,X,Length(S)-X+1),' ');
               GotoX;
               if X<1 then X:=1;
             end else X:=1;
           end;
       22: InsertOn:= not InsertOn; {^V}
       others: begin
        if OkChars and (Ch>=' ') and (Ch <= '{') then begin
          if InsertOn then begin
            S := concat(left(S,X-1), Ch, mid(S, X));
            Write(mid(S,X,Length(S)-X+1),' ');
          end else begin
            write(Ch);
            if X=length(S) 
               then S:=concat(S,Ch) 
               else S:=concat(left(S, X-1), Ch, mid(S, X+1));
          end;
          if Length(S)+1<=MAX then X:=X+1
          else OkChars:=false; { Line too Long }
          GotoX;
        end else
        if Length(S)+1<=Max then
          OkChars:= true; { Line ok again }
      end;
    end;
  until Ch = chr(13);
end;

procedure  GetCell(FX, FY: Integer);
var
  S:             String[70];
  NewStat:       integer;
  ErrorPosition: Integer;
  I:             integer;
  Result:        Real;
  Abort:         Boolean;
  IsForm:        Boolean;

  procedure ClearCells;
  begin
    I:=FX;
    repeat
      GotoXY(XPos[I],FY+1);
      write('           '); I:=Succ(I);
    until ((OverWritten + Locked) and Screen_CellStatus[I,FY]) = 0;
    { Cell is not OVerWritten not Locked }
  end;

{ The new type of the cell is flashed at the bottom of the screen    }
{ Notice that a constant of type array is used to indicate the type  }

  procedure FlashType;
  begin
    GotoXY(5,23);
  end;

  procedure GetFormula;
  begin
    FlashType;
    repeat
      GetLine(S,1,24,70,ErrorPosition,True);
      if S<>Chr(255) then begin
        Evaluate(IsForm,S,Result,ErrorPosition);
        if ErrorPosition<>0 then
          Flash(15,'Error at cursor',false)
        else 
          Flash(15,'               ',false);
      end;
    until (ErrorPosition=0) or (S=Chr(255));
    if IsForm then NewStat:=NewStat or Formula;
  end;

  procedure GetText;
  begin
    FlashType;
    GetLine(S,XPos[FX],FY+1,70,ErrorPosition,False);
  end;

  procedure EditCell;
  begin
    S:=Screen_Contents[FX,FY];
    if (Txt and Screen_CellStatus[FX,FY]) <> 0 then GetText else GetFormula;
  end;

  procedure UpdateCells;
  var Flength: Integer;
  begin
    Screen_Contents[FX,FY]:=S;
    if (Txt and NewStat) <> 0 then begin
      I:=FX; Flength:=Length(S);
      repeat
        I:=Succ(I);
        Flength:=Flength-11;
        if (Flength>0) then begin
          Screen_CellStatus[I,FY]:= Overwritten + Txt;
          Screen_Contents[I,FY]:='';
        end else begin
          if (OverWritten and Screen_CellStatus[I,FY]) <> 0 then begin
            Screen_CellStatus[I,FY]:= Txt;
            GotoCell(I,FY);LeaveCell(I,FY);
          end;
        end;
      until (I=FXMax)  or (Screen_Contents[I,FY]<>'');
      Screen_CellStatus[FX,FY]:=Txt;
    end else { string changed to formula or constant }
    begin { Event number two }
      I:=FX;
      repeat
        if (OverWritten and Screen_CellStatus[I,FY]) <> 0 then begin
          Screen_CellStatus[I,FY]:=Txt;
          Screen_Contents[I,FY]:='';
        end;
        I:=Succ(I);
      until (OverWritten and Screen_CellStatus[I,FY]) = 0;
      Screen_CellStatus[FX,FY]:=Constant;
      if IsForm then Screen_CellStatus[FX,FY]:=Screen_CellStatus[FX,FY] or Formula;
      Screen_Value[FX,FY]:=Result;
    end;
  end;

begin { procedure GetCell }
  S:=Ch; ErrorPosition:=0; Abort:=false;
  NewStat:=0;
  if ((Ch >= '0') and (Ch <= '9')) or
     (Ch = '+') or 
     (Ch = '-') or 
     (Ch = '.') or 
     (Ch = '(') or 
     (Ch = ')') then begin
    NewStat:= Constant;
    if (Formula and Screen_CellStatus[FX,FY]) = 0 then begin
      ClrMsgEol;
      ClearCells;
      GetFormula;
    end else begin
      Flash(15,'Edit formula Y/N?',true);
      repeat read(Ch) until (Ch = 'Y') or (Ch = 'N') or (Ch = 'y') or (Ch = 'n');
      Flash(15,'                 ',false);
      if (Ch = 'Y') or (Ch = 'y')  then EditCell Else Abort:=true;
    end;
  end else begin
    if Ch=chr(27) then begin
      NewStat:=Screen_CellStatus[FX,FY] and (Txt + Constant);
      EditCell;
    end else begin
      if (Formula and Screen_CellStatus[FX,FY]) <> 0 then begin
        Flash(15,'Edit formula Y/N?',true);
        repeat read(Ch) until (Ch = 'Y') or (Ch = 'N') or (Ch = 'y') or (Ch = 'n');
        Flash(15,'                 ',false);
        if (Ch = 'Y') or (Ch = 'y')  then EditCell Else Abort:=true;
      end else begin
        NewStat:= Txt;
        ClearCells;
        GetText;
      end;
    end;
  end;
  if not Abort then begin
    if S<>Chr(255) then UpdateCells;
    GotoCell(FX,FY);
    if AutoCalc and ((Constant and Screen_CellStatus[FX,FY]) <> 0) then Recalculate;
    if (Txt and NewStat) <> 0 then begin
      GotoXY(3,FY+1); {Clreol;}
      For I:=1 to FXMax do LeaveCell(I,FY);
    end;
  end;
  Flash(15,'                ',False);
  GotoCell(FX,FY);
end;

{ Procedure Format is used to }

procedure Format;
var
  J,FW,DEC,
  FromLine,ToLine: integer;
  Lock:            Boolean;

  procedure GetInt(var I: integer; Max: Integer);
  var
    S: string[8];
    Err: Integer;
    Ch: string[1];
  begin
    S:='';
    repeat
      repeat 
         Read(Ch);
         nCh := ord(Ch);
      until ((Ch >= '0') and (Ch <= '9')) or
            (Ch = '-') or
            (nCh = 13); 
      if nCh<>13 then begin
         Write(Ch); S:=concat(S,Ch);
         I := ValInt(left(S,8), Err);
      end;
    until (I>=Max) or (nCh=13);
    if I>Max then I:=Max;
  end;

begin
  Msg('Format: Enter number of decimals (Max 11):  ');
  GetInt(DEC,11);
  Msg('Enter Cell whith remember if larger than 10 next column will lock: ');
  GetInt(FW,20);  
  Msg(concat('From which line in column ',StrInt(FX),': '));
  GetInt(FromLine,FYMax);
  Msg(concat('To which line in column ',StrInt(FX),': '));
  GetInt(ToLine,FYMax);
  if FW>10 then Lock:=true else Lock:=False;
  for J:=FromLine to ToLine do begin
    Screen_DEC[FX,J]:=DEC;
    Screen_FW[FX,J]:=FW;
    if Lock then begin
       Screen_CellStatus[Succ(FX),J] := Screen_CellStatus[Succ(FX),J] 
                                        or Locked or Txt;
       Screen_Contents[Succ(FX),J]:='';
    end else begin
       Screen_CellStatus[Succ(FX),J] := Screen_CellStatus[Succ(FX),J] 
                                        and (not Locked);
    end;
  end;
  Update;
  GotoCell(FX,FY);
end;

procedure Commands;
begin
  GotoXY(1,24);
  Write('/ restore, Quit, Recalculate, Format, AutoCalc, Clear ');
  Read(Ch);
  Ch:=chr(UpCase(ord(Ch)));
  case Ch of 
    'Q': Halt;
    'F': Format;
    'R': Recalculate;   
    'A': Auto;          
    '/': Update;        
    'C': Clear;         
  end;
  Grid;                 
  GotoCell(FX,FY);      
end;

procedure Wellcome;

  procedure Center(S: string[80]);
  var I: integer;
  begin
    for I:=1 to (80-Length(S)) div 2 do Write(' ');
    writeln(S);
  end;

begin { procedure Wellcome }
  ClrScr; GotoXY(1,9);
  Center('Welcome to MicroCalc. A Turbo demonstation program');
  Center('Copyright 1983 by Borland International Inc. ');
  Center('Press any key to start');
  GotoXY(40,12);
  Read(Ch);
end;

{*********************************************************************}
{*          THIS IS WHERE THE PROGRAM STARTS EXECUTING               *}
{*********************************************************************}

begin
  INIT XPOS to 3,14,25,36,47,58,68;
  Initialize;  
  Wellcome;
  ClrScr; Grid;
  GotoCell(FX,FY);
  repeat
    Read(Ch);
    nCh := ord(Ch);
    case nCh of
      5:  {^E}       MoveUp; 
      24: {^X,^J}    MoveDown; 
      4:  {^D,^M,^F} MoveRight;
      19: {^S,^A}    MoveLeft; 
      47: {'/'}      Commands;
      27: {Esc}      GetCell(FX,FY);
      others: if (Ch > ' ') and (Ch < '~') then GetCell(FX,FY);                                          {  04 }
    end;
  until true=false;          { (program stops in procedure Commands) }
end.


