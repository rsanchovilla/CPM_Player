program CONTEST (Input,Output);
{ 'Contest.pas' Console intrinsic tests. }
-- Note:
--  This program is intended to test conact functions as well as
--  ReadXY and GotoXY. This is for use in constructing a new
--  CONSTRL.asm deck and testing it.
--  This program and the procedures within it are NOT licensed,
--  and the user may adapt any part of this program for his\her
--  own personal instruction.
--  End Note.
--
{ SORCIM PASCAL/M cmi 12-31-80 }
const
   VERSION='Contest: Version 2.00 01-05-81';

var
   CH : char;
   OUT : file;
   WIDTH,HEIGHT : integer;

procedure WAIT ;
var
   X : integer;

Begin
   For X := 1 to 5000 do
End; {Wait}

procedure COMPLETE ;
var
   CH : char;

Begin
   Write('Test Complete. Press return to continue.');
   Read(Keyboard,CH);
   Writeln
End; {Complete}

procedure GET_RESPONSE (var CH : char);
Begin
   Writeln;
   Writeln('If your terminal does not handle this');
   Writeln('conact function, you may wish to bypass');
   Writeln('this test. To bypass this test');
   Write('type "B" otherwise, press return.');
   Read(Keyboard,CH);
   If (Ord(CH) >= Ord('a')) then 
      CH := Chr(Ord(CH)-32);
   Writeln;
   Writeln
End; {Get_Response}

procedure SIGNON ;
var
   CH : char;
   
Begin
   Writeln;
   Writeln(VERSION);
   Writeln;
   Writeln('Welcome to PASCAL/M !!');
   Writeln('This program is to test the Conact functions of Pascal/M');
   Writeln('as well as the read and write X,Y procedures.');
   Writeln('These procedures are in the Pascal manual on pg. 40');
   Writeln('(Although they may not be tested in order.)');
   Writeln('If any of these tests fail, consult manual as to');
   Writeln('re-writing of the constrl.asm deck to suit your machine.');
   Writeln;
   Write('Press return to continue. ');
   Read(Keyboard,CH);
   Writeln
End; {Signon}
   
procedure CNACT0;
-- This procedure uses Conact(0) only.
Begin
   Writeln;
   Writeln('This will test the Conact(0) the function to clear the screen');
   Writeln('and home the cursor.'); 
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Writeln('When you press return, the screen should clear and the');
         Writeln('cursor should start in the home position. A test');
         Write('complete message will then be written.');
         Read(Keyboard,CH);
         Conact(0);
         WAIT;
         Writeln('This should be in the uppermost left hand corner.');
         Write('Test Complete. Press return to continue.');
         Read(Keyboard,CH);
         Writeln
      End; {If}
End; {Test1}

procedure TESTDIR ;
-- This procedure uses Conact(0) thru Conact(5).
-- (exept Conact(1).)
const
   R='R';
   L='L';
   U='U';
   D='D';

var
   X : integer;

Begin
   Writeln;
   Writeln('This procedure tests conacts 2-5.');
   Writeln('These are the cursor direction conacts (up,down,left,right)');
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Writeln;
         Writeln('The screen will clear, and a box will be drawn');
         Writeln('near the upper left hand corner of the screen.');
         Writeln('The four cursor directions will be used to draw');
         Writeln('the box. The letters indicate which direction');
         Write('conact was used. Press return to continue.');
         Read(Keyboard,CH);
         Conact(0);
         Writeln;
         Writeln;
         Write('    ');
-- Left side.
         For X := 1 to 9 do
            Begin
               Conact(3);
               Conact(4);
               Write(D)
            End; {For}
-- Bottom.
         For X := 1 to 9 do
            Begin
               Write(R);
               Conact(5)
            End; {For}
-- Right side.
         For X := 1 to 9 do
            Begin
               Conact(2);
               Write(U);
               Conact(4)
            End; {For}
-- Top.
         For X := 1 to 9 do
            Begin
               Conact(4);
               Write(L);
               Conact(4);
               Conact(4)
            End; {For}
         WAIT;
         For X := 1 to 14 do
            Conact(3);
         COMPLETE;
      End; {If}
End; {Test3}

procedure DELETE ;
-- This procedure uses Conact(0) and Conact(6).
var
   X : integer;
   
Begin
   Conact(0);
   Writeln;
   Writeln('This procedure will test Conact 6.');
   Writeln('This is the delete character conact.');
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Writeln;
         Writeln('The screen will clear and a line of text will');
         Writeln('appear. The word "delete" will then be deleted using');
         Write('Conact(6). Press return to continue.');
         Read(Keyboard,CH);
         Conact(0);
         Writeln;
         Writeln('In this line, DELETE will be removed.');
         GotoXY(13,1);
         WAIT;
         For X := 1 to 7 do
            Conact(6);
         WAIT;
         Writeln;
         Writeln('If "DELETE" or any part of it still exists,');
         Writeln('then Conact(6) is not working correctly.');
         COMPLETE
      End; {If}
End; {Delete}

procedure INSERT ;
-- This procedure uses Conact(0) and Conact(7).
Begin
   Conact(0);
   Writeln;
   Writeln('This procedure tests Conact(7)');
   Writeln('This is the insert character conact.');
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Writeln;
         Writeln('The screen will clear and a line of text will');
         Writeln('appear. Then a word will appear in the middle');
         Writeln('of the line. If is not done correctly, Conact(7)');
         Writeln('does not work correctly. Press return to');
         Write('continue.');
         Read(Keyboard,CH);
         Conact(0);
         Writeln;
         Writeln('This sentence be made correct.');
         GotoXY(13,1);
         WAIT;
         Conact(7);
         Write(' ');
         Conact(7);
         Write('w');
         Conact(7);
         Write('i');
         Conact(7);
         Write('l');
         Conact(7);
         Write('l');
         WAIT;
         Writeln;
         Writeln('If the "will" is now before the "be" then');
         Writeln('Conact(7) is working correctly.');
         COMPLETE
      End; {If}
End; {Insert}

procedure WRITEXY ;
-- This procedure uss Conact(0) and GotoXY.
var
   X,Y : integer;
   
Begin
   Conact(0);
   Writeln;
   Writeln('This will test your GotoXY procedure.');
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Conact(0);
         Writeln;
         Writeln('The screen should now be clear and the cursor');
         Writeln('should start at the upper left hand corner');
         Writeln('of your screen. After a pause, it will move');
         Writeln('to each of the other four corners in turn.');
         GotoXY(0,0);
         WAIT;
         GotoXY(WIDTH-1,0);
         WAIT;
         GotoXY(WIDTH-1,HEIGHT-1);
         WAIT;
         GotoXY(0,HEIGHT-1);
         WAIT;
         COMPLETE;
      End; {If}
End; {WriteXY}

procedure GETXY ;
-- This procedure uses Conact(0), ReadXY and GotoXY.
var
   X,Y : integer;
   
Begin
   Conact(0);
   Writeln;
   Writeln('This procedure tests the ReadXY procedure.');
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Writeln;
         Writeln('The screen will clear and a line of text will');
         Writeln('be displayed. The cursor will move to another');
         Writeln('spot, write some more text, then return to the');
         Writeln('end of the original line.');
         Write('Press return to continue.');
         Read(Keyboard,CH);
         Conact(0);
         Writeln;
         Write('The cursor should return to the end of this line.');
         ReadXY(X,Y);
         WAIT;
         GotoXY(10,10);
         Write('Now here.');
         WAIT;
         GotoXY(X,Y);
         WAIT;
         Writeln;
         COMPLETE;
      End; {If}
End; {WriteXY}

procedure CNACT1;
-- This procedure uses GotoXY.
-- This procedure uses the Conact(0) and Conact(1) only.
var
   X : integer;
   
Begin
   Conact(0);
   Writeln;
   Writeln('This procedure will test Conact(1).');
   Writeln('This is the delete to end of the line conact.');
   GET_RESPONSE(CH);
   If CH<>'B' then
      Begin
         Writeln('The screen will clear and a line of text will');
         Writeln('appear. The second half of the line will then');
         Writeln('be erased. If it remains, the Conact(1) function');
         Writeln('is not functioning correctly.');
         Write('Press return to continue.');
         Read(Keyboard,CH);
         Conact(0);
         Writeln;
         Writeln;
         Write('This should remain.');
         For X := 1 to 12 do
            Write(' ');
         Write('This should be erased.');
         GotoXY(20,2);
         WAIT;
         Conact(1);
         Writeln;
         COMPLETE
      End; {If}
End; {Test2}

procedure BORDER (WIDTH,HEIGHT : integer);
-- This procedure uses Conact(0) only.
const
   CH='+';
   
var
   X,Y : integer;

Begin
   Conact(0);
-- Top line.
   For X := 1 to WIDTH do
      Write(CH);
-- Sides.
   For X := 1 to HEIGHT-2 do
      Begin
         Write(CH);
         For Y := 1 to WIDTH-2 do
            Write(' ');
         Write(CH)
      End; {For}
-- Bottom.
   For X := 1 to WIDTH-1 do
      Write(CH)
End; {Border}

procedure Spiral (Maxx,Maxy: integer);
-- 'Spiral':  seh  09/07/79
-- requires 'GotoXY' and 'ReadXY'
-- draws a spiral of size MAXX by MAXY;
-- cursor position @ start becomes UL corner of spiral
-- Exit: cursor @ starting position
const
   C        =0.345;   {tightness-of-curl constant}
   Incr     =0.08;    {0.08 radians = 3.6305 degrees}
   XStretch =2.3;     {optimum for TeleVideo}
   CH       ='*';

var
   Minx,Miny,Offx,Offy,X,Y: integer;
   Theta: real;

begin
   ReadXY(Minx,Miny);
   Offx:=Maxx div 2 + Minx; Offy:=Maxy div 2 + Miny;
   Maxx:=Maxx+Minx; Maxy:=Maxy+Miny;
--   Offx & Offy are offsets for center of spiral:
--   Theta is radians, and XStretch stretches the spiral to fit screen}
   Theta:=0;
   repeat
      X:=Round(Offx+XStretch*(Theta*Cos(Theta)*C));
      Y:=Round(Offy+          Theta*Sin(Theta)*C );
      if ( (X>=Minx) and (X<Maxx) and
           (Y>=Miny) and (Y<Maxy)    ) then begin
         GotoXY(X,Y);
         Write (CH);
     end (*endif X & Y are in range*) ;
      Theta:=Theta+Incr;
   Until ( ((X<Minx) or (X>=Maxx)) and
           ((Y<Miny) or (Y>=Maxy))    );
   (*until X and Y have both exceeded their boundaries*)
end (*end Spiral*) ;

procedure Sinewave (MAXX,MAXY: integer);
{'Sinewave':  seh  09/07/79}
{requires ReadXY and GotoXY}
{draws a sine-wave of MAXX by MAXY;
 cursor position @ start becomes UL corner of sine-wave;
 Note: A height of <3 will not produce a recognizable drawing...}
{Exit: cursor @ starting position}
const
   CH='*';
   TWOPi=6.28318;

var
   OFFY,OLDX,OLDY,X,Y: integer;
   INCR,THETA,YSTRETCH: real;

begin
   ReadXY(OLDX,OLDY);
   INCR:=TWOPi/MAXX; THETA:=0;
   OFFY:=Round(MAXY/2)+OLDY-1;
   YSTRETCH:=MAXY/2;
   for X:=OLDX to OLDX+MAXX-1 do begin
      Y:=-Round(Sin(THETA)*YSTRETCH);
      if (not Odd(MAXY)) and (Y<1) then Y:=Y+1+OFFY else Y:=Y+OFFY;
      GotoXY(X,Y);
      Write (OUTPUT,CH);
      THETA:=THETA+INCR;
   end (*endfor*) ;
   GotoXY(OLDX,OLDY);
end (*end Sinewave*);

procedure SIGNOFF ;
-- This procedure uses GotoXY only.
Begin
   GotoXY(2,2);
   Write('If your entire screen now has a border of plus'' with only');
   GotoXY(2,3);
   Write('this text showing, you are done configuring your Pascal.');
   GotoXY(2,4);
   Write('Note: There should be a plus missing in the lower right');
   GotoXY(2,5);
   Write('hand corner. This is normal.');
   GotoXY(2,6);
   Write('If the boarder is wrong, check your screen size parameters in');
   GotoXY(2,7);
   Write('constrl.asm for proper values.');
   GotoXY(2,8);
   Write('Press return to end program or anything else to try again.')
End; {Signoff}
      
Begin {Main}
   Repeat
      SIGNON;
      CNACT0;
      TESTDIR;
      DELETE;
      INSERT;
      Reset(OUT,'CRT:');
      Screen(OUT,HEIGHT,WIDTH);
      WRITEXY;
      GETXY;
      CNACT1;
      BORDER(WIDTH,HEIGHT);
      GOTOXY(1,1);
      SINEWAVE((WIDTH-2),(HEIGHT-2));
      WAIT;
      BORDER(WIDTH,HEIGHT);
      GOTOXY(1,1);
      SPIRAL((WIDTH-2),(HEIGHT-2));
      BORDER(WIDTH,HEIGHT);
      WAIT;
      SIGNOFF;
      Read(Keyboard,CH);
      Conact(0);
   Until CH=' ';
End. {Main}
