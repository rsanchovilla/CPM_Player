Program QuickSolver;

{       by Howard Dutton          }
{    Genie: XJM23622 H.DUTTON     }

{         version 1.1             }

{          changes:               }
{ 1: moved help out to disk to    }
{    save on memory.              }
{ 2: corrected bug that prevented }
{    program from running on non- }
{    H19 terms.                   }

label
  Start;
type
  str3   = string[3];
  str5   = string[5];
  str14  = string[14];
  str80  = string[80];
  str255 = string[255];
const
  SI = '#';
var
  Bdos:     integer absolute $6;
  Temp,
  MemStart,
  MemEnd,
  MemPos,
  FreeOfs:  integer;
  CWidth:   array[1..26]       of byte;
  CA:       array[1..26,1..99] of integer;  { Cell Address table }
  L,
  CAddr,
  CType,
  CForm,

  TC,TR,
  Col,Row,
  CC,CR,
  SC,SR,
  FC,FR,
  DC,DR:    integer;
  CText,
  CFor,
  S,TS:     str80;
  CVal:     real;

  T,Code:   integer;
  Result:   real;
  Token:    str80;
  Prog:     str255;
  TokType:  (Delimiter,Funct,Number);

  InsertOn,
  Finished,
  Hide,
  CalcOn:   boolean;
  LastCalc,
  ThisCalc,
  Err:      integer;
  Ch,Ch1:   char;

procedure ShowCells; forward;

{$I QSMISC.INC}

{$I QS1.INC}
{$I QS2.INC}
{$I QS3.INC}
{$I QS4.INC}
{$I QS5.INC}
{$I QS6.INC}

procedure Help;
var
  F: text;
begin
  gotoxy(1,1);
  assign(F,'QS.HLP');
  if not Exist('QS.HLP') then
  begin
    Bell;
    HighVideo;
    message('help file not found');
    LowVideo;
    delay(2000);
    message('');
  end else
  begin
    reset(F);
    gotoxy(1,1);
    while not eof(F) do
    begin
      readln(F,Prog);
      clreol;
      writeln(Prog);
    end;
    message('press <RET> to continue?');
    read(kbd,Ch);
    ShowBorder;
    ShowIndex;
    ShowCells;
  end;
end;

begin
  CrtInit;
  delay(100);
  clrscr;
  MemStart:=$A800;       { start of free Memory          }
  MemEnd  :=Bdos-7;      { end   of free Memory          }
  MemPos  :=MemStart;    { pointer to current pos in Mem }
  FreeOfs :=0;           { offset for true memory free   }
  for TC:=1 to 26 do
    for TR:=1 to 99 do CA[TC,TR]:=0;
  CC:=1;
  CR:=1;
  Col:=1;
  Row:=1;
  for L:=1 to 26 do CWidth[L]:=11;
  ShowBorder;
  SC:=1;
  SR:=1;
  FC:=0;
  FR:=0;
  ThisCalc:=1;
  CalcOn  :=True;
  Hide    :=False;
  InsertOn:=True;
  Finished:=False;
  Start:
  repeat
    ShowIndex;
    HighVideo;
    TS:=CellText(Col,Row);
    ShowStr(Col,Row,TS);
    GotoCell(Col,Row);
    LowVideo;
    BlkCur;
    CurOn;
    read(kbd,Ch);
    Ch:=UpCase(Ch);
    CurOff;
    UlCur;
    ShowStr(Col,Row,TS);
    case Ch of
      '/',
      '?': Help;
      ^E: UpRow;
      ^R: UpPage;
      ^X: DownRow;
      ^C: DownPage;
      ^D: RightCol;
      ^F: RightPage;
      ^S: LeftCol;
      ^A: LeftPage;
      'Q': begin
            if CalcOn then CalcOn:=False else CalcOn:=True;
            LookUpCells;
            if CalcOn then ShowCells;
          end;
      ^K: Block;
      '`',
      '~': ReadText;
      '=': ReadFor;
      'S': SetWidth;
      'M': MoveToCell;
      'D': begin
             DelCell(Col,Row);
             LookUpCells;
             ShowCells;
           end;
      'W': WriteSheet;
      'R': ReadSheet;
      ^[ : Finished:=True;
    end;
  until Finished;
  gotoxy(1,24);
  clreol;
  write('save file <Y>/N ? ');
  repeat read(kbd,Ch); Ch:=UpCase(Ch); until Ch in ['Y','N',#13];
  if Ch=#13 then
  begin
    Finished:=False;
    goto Start;
  end;
  if Ch='Y' then WriteSheet;
  CrtExit;
  delay(100);
end.
