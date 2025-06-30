program quatris(input,output);
{$C-}
const
  Pieces      = 6;
  ScoreName   ='QUATRIS.SCO';
  cr          = #$0d;
  esc         = #$1b;
{ Clock byte - only in standard TP 3.0 for CP/M }
  SysClock    = $0124;
type
  mstring     = string[20];
  user        = record
                  name:  mstring;
                  score: integer;
                end;
  UserData    = array[0..9] of user;
  Piece_fix   = array[0..Pieces,0..1,0..1] of integer;
  board_line  = record
                  state:array[0..29] of boolean;
                end;
const
  xy_adjust   : Piece_fix = (((-1, 0),(-2, 0)),
                             ((-1, 0),( 1, 1)),
                             ((-1, 0),(-1, 1)),
                             ((-1, 1),( 0, 1)),
                             ((-1,-1),( 0,-1)),
                             ((-1, 0),( 0, 1)),
                             (( 0, 1),( 1, 1)));
var
  ScoreList   : UserData;
  ScoreFile   : file of UserData;
  game_board  : array[0..17] of board_line;
  PieceArr    : array[0..3] of integer;
  PieceCount  : array[0..Pieces] of integer;
  CmdChr      : char;
  Dummy       : boolean;
  MaxUser,
  PieceY,
  i,
  yCor,
  PieceIdx,
  rows,
  PieceTotal,
  xcur,
  ycur,
  level,
  score,
  NxtPiece,
  Piece,
  setCtrl     : integer;
  pieceDown,
  ShowMode,
  clrMode     : boolean;
  CmdStr      : string[5];

procedure get_xy(var xset:integer;var yset:integer);
var
  locx        : integer;
begin
  locx:=xset;
  if (setCtrl=1) then
  begin
    xset:=yset;
    yset:=-locx;
  end;
  if (setCtrl=2) then
  begin
    xset:=-xset;
    yset:=-yset;
  end;
  if (setCtrl=3) then
  begin
    xset:=-yset;
    yset:=locx;
  end;
  xset:=xcur+xset;
  yset:=ycur+yset;
end;

procedure put_xy(xpos:integer;ypos:integer);
begin
  get_xy(xpos,ypos);
  if (ypos<1) then else
  begin
    gotoxy(28+xpos*2,ypos);
    if clrMode then write('.')
               else write('#');
  end;
end;

procedure disp_piece(DPiece:integer);
begin
  put_xy(0,0);
  put_xy(1,0);
  put_xy(xy_adjust[DPiece,0,0],xy_adjust[DPiece,0,1]);
  put_xy(xy_adjust[DPiece,1,0],xy_adjust[DPiece,1,1]);
end;

procedure tell_score;
var
  j           : integer;
begin
  clrscr;
  writeln('          SCORE               NAME');
  for j:=1 to 10 do
  begin
    write('         ');
    if (i=MaxUser) then write('*')
                   else write(' ');
    write(ScoreList[pred(j)].score:5,ScoreList[pred(j)].name:25);
    if (ScoreList[pred(j)].score=MAXINT) then writeln(' (World Champion)')
                                         else writeln;
  end;
  writeln;
  writeln;
end;

procedure end_game;
var
  j           : integer;
begin
  crtexit;
  j:=10;
  gotoxy(1,22);
  write('Final Score: ',score,'    Hit <CR>');
  readln(CmdChr);
  MaxUser:=0;
  while (j>=0) do
  begin
    if (ScoreList[pred(j)].score<score) and
       (j>0) then
    begin
      ScoreList[pred(j)]:=ScoreList[pred(j-1)];
    end else
    begin
      if (j<10) then
      begin
        ScoreList[pred(j+1)].score:=score;
        write('You made the top 10!  Enter your name: ');
        readln(ScoreList[pred(j+1)].name);
        MaxUser:=j+1;
      end;
      j:=0;
    end;
    j:=j-1;
  end;
  tell_score;
  write('Play again? ');
  read(kbd,CmdChr);
  write(CmdChr);
  if (CmdChr<>'N') and (CmdChr<>'n') then else
  begin
    rewrite(ScoreFile);
    write(ScoreFile,ScoreList);
    close(ScoreFile);
    halt;
  end;
end;

function PieceFlag:boolean;
var
  x,y         : integer;
begin
  PieceFlag:=false;
  x:=0;
  y:=0;
  get_xy(x,y);
  if game_board[x].state[pred(y+9)]<>false then else
  begin
    x:=1;
    y:=0;
    get_xy(x,y);
    if game_board[x].state[pred(y+9)]<>false then else
    begin
      x:=xy_adjust[Piece,0,0];
      y:=xy_adjust[Piece,0,1];
      get_xy(x,y);
      if game_board[x].state[pred(y+9)]<>false then else
      begin
        x:=xy_adjust[Piece,1,0];
        y:=xy_adjust[Piece,1,1];
        get_xy(x,y);
        if game_board[x].state[pred(y+9)]<>false then else PieceFlag:=true;
      end;
    end;
  end;
end;

procedure InitStat;
begin
  gotoxy(1,27-9);
  writeln('              ');
  writeln('              ');
  writeln('              ');
  if (ShowMode) then
  begin
    xcur:=-8;
    ycur:=28-9;
    setCtrl:=0;
    disp_piece(NxtPiece);
  end;
end;

procedure put_board;
var
  j           : integer;
begin
  for j:=1 to 29-9 do
  begin
    gotoxy(30,j);
    for i:=1 to 10 do
    begin
      if game_board[i].state[pred(j+9)]<>false then write('# ')
                                               else write('. ');
    end;
  end;
end;

procedure init_board;
var
  j           : integer;
begin

{ Give help }
  gotoxy(1,6);
  writeln(' 1  - Move left       ');
  writeln(' 2  - Rotate clockwise');
  writeln(' 3  - Move right      ');
  writeln(' 7  - Show next piece ');
  writeln(' 9  - Speed up        ');
  writeln('SPC - Drop piece      ');
  writeln('                      ');
  writeln('ESC - Exit');
  writeln('RET - Supervisor pause');

{ Build pieces }
  gotoxy(55, 2);write(     '# # # #'  );

  gotoxy(65, 3);write(     '#'        );
  gotoxy(65, 4);write(     '# # #'    );

  gotoxy(59, 5);write(         '#'    );
  gotoxy(55, 6);write(     '# # #'    );

  gotoxy(67, 7);write(       '# #'    );
  gotoxy(65, 8);write(     '# #'      );

  gotoxy(55, 9);write(     '# #'      );
  gotoxy(57,10);write(       '# #'    );

  gotoxy(67,11);write(       '#'      );
  gotoxy(65,12);write(     '# # #'    );

  gotoxy(55,13);write(     '# #'      );
  gotoxy(55,14);write(     '# #'      );
  gotoxy(74,16);
  write('-----');
  gotoxy(60,18);
  write('T O T A L');
  gotoxy(56,20);
  write('Q U A T R I S   2.0');
  gotoxy(57,21);
  write('Copyright 1989 by');
  gotoxy(57,22);
  write('Steven B. Perkins');

{ Init piece count }
  for j:=0 to 6 do
  begin
    gotoxy(77,j*2+2);
    write('0');
  end;
  gotoxy(77,18);
  write('0');

{ Init game board }
  for j:=1 to 30-9 do
  begin
    gotoxy(28,j);
    write('I');
    gotoxy(30+10*2,j);
    write('I');
  end;
  gotoxy(29,30-9);
  for j:=0 to 10*2 do
      write('-');
end;

procedure player_setting;
var
  j, CtrlSav,
  xsav, ysav  : integer;
begin
  CmdChr:='$';
  j:=1;
  repeat
    delay(abs(2*mem[SysClock]+level*12-2));
    if keypressed then
    begin
      read(kbd,CmdChr);
      case CmdChr of
{ Move left }
        '1' : begin
                clrMode:=true;
                disp_piece(Piece);
                clrMode:=false;
                xcur:=xcur-1;
                if not PieceFlag then xcur:=xcur+1;
                disp_piece(Piece);
              end;
        '3' : begin
{ Move right }
                clrMode:=true;
                disp_piece(Piece);
                clrMode:=false;
                xcur:=xcur+1;
                if not PieceFlag then xcur:=xcur-1;
                disp_piece(Piece);
              end;
        '2' : begin
{ Rotate clockwise }
                clrMode:=true;
                disp_piece(Piece);
                setCtrl:=(setCtrl+3) MOD 4;
                if not PieceFlag then setCtrl:=(setCtrl+1) MOD 4;
                clrMode:=false;
                disp_piece(Piece);
              end;
        '9' : begin
{ Speed up }
                if (level>0) then level:=level-1;
              end;
        '7' : begin
{ Show next piece }
                ShowMode:=not ShowMode;
                if ShowMode then score:=score-2;
                CtrlSav:=setCtrl;
                xsav:=xcur;
                ysav:=ycur;
                InitStat;
                xcur:=xsav;
                ycur:=ysav;
                setCtrl:=CtrlSav;
              end;
       cr   : begin
{ Supervisor pause }
                clrscr;
                write('A>');
                read(kbd,CmdChr);
                if (CmdChr=esc) then
                begin
                  crtexit;
                  halt;
                end;
                clrscr;
                init_board;
                put_board;
              end;
        ' ' : begin
{ Drop piece }
                pieceDown:=true;
                j:=5;
              end;
      end;
    end;
    j:=j+1;
  until (j>5);
end;

procedure PopPiece;
var
  j, k        : integer;
begin
  PieceY:=PieceArr[pred(PieceIdx)];
  j:=1;
  while (j<PieceIdx) do
  begin
    if (PieceArr[pred(j)]<PieceY) then
    begin
      PieceArr[pred(PieceIdx)]:=PieceArr[pred(j)];
      PieceArr[pred(j)]:=PieceY;
      PieceY:=PieceArr[pred(PieceIdx)];
    end;
    j:=j+1;
  end;
  for j:=PieceY downto 2 do
    for k:=1 to 10 do
      game_board[k].state[pred(j)]:=game_board[k].state[pred(j-1)];
end;

procedure PushPiece;
var
  j           : integer;
label l1;
begin
  PieceY:=PieceY+9;
  game_board[MaxUser].state[pred(PieceY)]:=true;
  for j:=1 to 10 do
    if (game_board[j].state[pred(PieceY)]=false) then goto l1;
  PieceIdx:=PieceIdx+1;
  PieceArr[pred(PieceIdx)]:=PieceY;
l1:
end;

procedure play_game;
begin
  ShowMode:=false;
  for i:=0 to 6 do
      PieceCount[i]:=0;
  rows:=0;
  PieceTotal:=0;
  repeat
    randomize;
    writeln;
    write('What level (0-9, 0=hardest)? ');
    read(kbd,CmdChr);
    level:=ord(CmdChr)-ord('0');
  until ((level>=0) and (level<=9));
  crtinit;
  clrscr;
  init_board;
  for i:=1 to 10 do
    for yCor:=1 to 29 do
    begin
      if (yCor<30-9) then
      begin
        gotoxy(28+i*2,yCor);
        write('.');
      end;
      game_board[i].state[pred(yCor)]:=false;
    end;
  for i:=0 to 10+1 do
    game_board[i].state[pred(30)]:=true;
  for i:=1 to 30 do
  begin
    game_board[   0].state[pred(i)]:=true;
    game_board[10+1].state[pred(i)]:=true;
  end;
  if keypressed then read(kbd,CmdChr);
  score:=0;
  NxtPiece:=random(Pieces+1);
  repeat
    gotoxy(1,2);
    writeln('       LEVEL: ',level);
    if (score<0) then score:=MAXINT;
    writeln('       SCORE: ',score);
    write  (' ROWS FILLED: ',rows);
    Piece:=NxtPiece;
    NxtPiece:=random(Pieces+1);
    InitStat;
    setCtrl:=random(4);
    pieceDown:=false;
    xcur:=6;
    ycur:=1;
    if not PieceFlag then exit else
    repeat
      if not pieceDown then
      begin
        clrMode:=false;
        disp_piece(Piece);
        player_setting;
        if (CmdChr=esc) then exit else
        begin
          clrMode:=true;
          disp_piece(Piece);
        end;
      end else score:=score+1;
      ycur:=ycur+1;
    until not PieceFlag;
    if ShowMode then score:=score-2;
    ycur:=ycur-1;
    score:=score+44-round(10.0*sqrt(int(level)+0.2));
    PieceCount[Piece]:=PieceCount[Piece]+1;
    PieceTotal:=PieceTotal+1;
    gotoxy(75,Piece*2+2);
    write(PieceCount[Piece]:3);
    gotoxy(74,18);
    write(PieceTotal:4);
    clrMode:=false;
    disp_piece(Piece);
    PieceIdx:=0;
    MaxUser:=0;
    PieceY:=0;
    get_xy(MaxUser,PieceY);
    PushPiece;
    MaxUser:=1;
    PieceY:=0;
    get_xy(MaxUser,PieceY);
    PushPiece;
    MaxUser:=xy_adjust[Piece,0,0];
    PieceY:=xy_adjust[Piece,0,1];
    get_xy(MaxUser,PieceY);
    PushPiece;
    MaxUser:=xy_adjust[Piece,1,0];
    PieceY:=xy_adjust[Piece,1,1];
    get_xy(MaxUser,PieceY);
    PushPiece;
    if (PieceIdx>0) then
    begin
      while (PieceIdx>0) do
      begin
        PopPiece;
        rows:=rows+1;
        PieceIdx:=PieceIdx-1;
      end;
      if ((level>9-(rows div 10)) and
          (level>0)) then level:=9-(rows div 10);
      put_board;
    end;
  until false;
end;

BEGIN { ** M A I N ** }
  CmdStr:=paramstr(1);
  CmdChr:=CmdStr[1];
  CmdStr[1]:='S';

{ Test Clock speed x MHZ }
  if (CmdStr='SMHZ') or
     (paramstr(2)='MHZ') then
  begin
    CmdStr[1]:=CmdChr;
    writeln('System speed set to ',CmdStr);
    mem[SysClock]:=ord(CmdChr)-ord('0');
  end;
  assign(ScoreFile,ScoreName);
  {$I-}reset(ScoreFile);{$I+}
  if (ioresult=0) then
  begin
    read(ScoreFile,ScoreList);
  end else
  begin
    for i:=1 to 10 do
    begin
      ScoreList[pred(i)].name:='                 ---';
      ScoreList[pred(i)].score:=0;
    end;
  end;
  close(ScoreFile);

{ Test SCORE or HIGH as option }
  if ((CmdStr='SCORE') or
      (CmdStr='SIGH')) then tell_score
  else repeat
         play_game;
         end_game;
       until false;
END.


