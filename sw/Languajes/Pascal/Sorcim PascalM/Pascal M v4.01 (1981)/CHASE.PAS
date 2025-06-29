(*$D-  Must suppress debug info for Filebusy *)
program CHASE;
--************************************************************
--Note to users of this program: 
--'Contest' is intended to demonstrate and exercise 
--the console-action intrinsics of Pascal/M. 
--This program and the procedures within it are NOT licensed, 
--and the user may adapt any part of this program 
--for his own software and/or personal instruction. 
--Indeed, users are encouraged to suggest improvements 
--(or useful adaptations/applications) to this program 
--for inclusion in the next release of Pascal/M. 
--Please send comments to Digital Marketing: 
--(address inside Pascal/M manual)
--************************************************************
const
  Width     = 79;
  Height    = 23;
  U1up      = 'e'; U1dwn = 'x'; U1lft = 's' ; U1rht = 'f';
  U2up      = '8'; U2dwn = '2'; U2lft = '4' ; U2rht = '6';
  
type
  Ustat= record
            X,Y : Integer;
            Dir : (up,down,right,left);
            Ch  : Char;
            Dead: Boolean;
            Wins: Integer;
         end;
var
  Delay     : Integer;
  Mspeed    : Integer;
  Ngames    : Integer;
  Steps     : Integer;
  II        : Integer;
  Crash     : Boolean;
  Lchr      : Char;
  Uch       : Char;
  Screen    : packed array [0..Width, 0..Height] of Char;
  U1stat, U2stat         : Ustat;


procedure Init;
var
  i,j   : Integer;
begin
  for i := 0 to Width do begin
     Fillchar(Screen[i],Height+1,' ');
  end;
  Conact (0)  (*home and clear Screen *);
  for i := 1 to Width do begin
    Write('-');
  end;
  for i := 1 to Height-1 do begin
    Gotoxy(0,i)     ; Write('|');
    Gotoxy(Width,i) ; Write('|');
  end;
  Gotoxy(0,Height);
  for i := 1 to Width do begin
    Write('-');
  end;
  U1stat.Ch:= '+';
  U2stat.Ch:= 'x';
  U1stat.X := Width div 3;
  U2stat.X := Width div 3 *2;
  U1stat.Y := Height div 2;
  U2stat.Y := Height div 2+1;
  U1stat.Dir := right;
  U2stat.Dir := left ;
  U1stat.Dead := False;
  U2stat.Dead := False;

  Steps := 0;
  Delay := (Mspeed * 100) - (Ngames * 5);
  Ngames:= Ngames+1;
  Crash := False;
  Lchr  := '.';
  (* throw away any Chars in usart *)
  while not Filebusy(Keyboard) do Read(Keyboard, Uch);
end;
procedure Getchr;
var
 dum     : real;
 Uchr    : Char;
 i       : Integer;
begin
  for i := 0 to Delay do begin
    Dum :=  (0);
  end;
  if Steps mod 20 = 0 then Delay := Delay - (Delay div 10);
  if Filebusy(Keyboard) then Exit (Getchr);
  Read (Keyboard,Uchr);
  if Uchr = Lchr then Exit(Getchr);
  case Uchr of
      U1up  : U1stat.Dir := up;
      U2up  : U2stat.Dir := up;
      U1dwn : U1stat.Dir := down;
      U2dwn : U2stat.Dir := down;
      U1lft : U1stat.Dir := left;
      U2lft : U2stat.Dir := left;
      U1rht : U1stat.Dir := right;
      U2rht : U2stat.Dir := right;
   otherwise
      Uchr := Lchr;
   end;
   Lchr := Uchr;
end(*Getchr*);
procedure Cnewpos (var U: Ustat);
var
  Offsides: Boolean;
begin
  case U.Dir of
       up     : U.Y := U.Y-1;
       down   : U.Y := U.Y+1;
       left   : U.X := U.X -1;
       right  : U.X := U.X +1;
  end;
  Offsides := (U.X < 0) or (U.X > Width) or
              (U.Y < 0) or (U.Y > Height);
  if not Offsides then begin
     Offsides := Screen[U.X, U.Y] <> ' ';
     if not Offsides then begin
       Screen [U.X, U.Y] := U.Ch;
       Gotoxy (U.X, U.Y);
       Write (U.Ch);
     end;
  end;
  Crash := Crash or Offsides;
  U.Dead := Offsides;
end(*Cnewpos*);



procedure Dispts;
begin
  Steps := Steps +1;
  Cnewpos(U1stat);
  Cnewpos(U2stat);
  if not Crash then begin
    Crash := (U1stat.X = U2stat.X) and (U1stat.Y = U2stat.Y)
  end;
end;

begin   (*chase*)
  U1stat.Wins := 0; U2stat.Wins := 0;
  Writeln; Writeln;
  Writeln(' Welcome to the Sorcim program of CHASE...');
  Writeln(' The object of this two player program is to');
  Writeln(' avoid each other and the walls while moving');
  Writeln(' your object around the inscribed box.');
  Writeln(' Player one (+) uses e,x  s,f for up,down left,right');
  Writeln(' Player two (x) uses 8,2  4,6');
  Writeln; Writeln;
  Write(' Please indicate your machine speed, 2 or 4(MHz)');
  Read( Mspeed);
  Ngames := 0;
  repeat
    Init;
    Dispts;    (* Display Initial setting *)
    repeat
      Getchr;
      Dispts;
    until Crash;
    Gotoxy(4,Height-3);
    if U1stat.Dead = U2stat.Dead then Write(' TIE game.  ')
    else
       if U1stat.Dead then begin
          U2stat.Wins := U2stat.Wins+1;
          Write(' User ', U2stat.Ch, ' won.')
       end else begin
          U1stat.Wins := U1stat.Wins+1;
          Write(' User ', U1stat.Ch, ' won.');
       end;
    Writeln (' Total number of steps : ',Steps, 
             '  + user wins ',U1stat.Wins..3,
             '  x user wins ',U2stat.Wins..3);
    Gotoxy(4,Height-2);
    Write (' Want to play again? (y or n): ');
    while not Filebusy(Keyboard) do Read(Keyboard,Uch);
    for II := 0 to 700 do begin
      Uch := ' ';
    end;
    Read (Keyboard,Uch);

  until Uch = 'n';

  end.
