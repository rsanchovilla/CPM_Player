program Demo1;

{$I KERNEL.INC}
{$I SIMPLE.INC}
{$I SOUND.INC}
{$I DISKETTE.INC}


var ch : char;


procedure Sinus;
var
  x,i : integer;
  y,m : byte;
  z   : real;
begin
 clrscr; x:=100; m:=0;
 for y:=20 to 200 do Plot (x,y,m);
 y:=110;
 for x:=100 to 600 do Plot (x,y,m);
 for i:=0 to 500 do
 begin
  z:=i;
  x:=i+100;
  y:=110-trunc(sin(z*0.0174533)*90);
  Plot (x,y,m);
 end;
 gotoxy (35,14); write (#27,#24);
 gotoxy (56,14); write (#27,#24);
 gotoxy (9,2); write ('+1');
 gotoxy (9,25); write ('-1');
end;


procedure Pyramide;
var
  i,j   : integer;
  a,b   : byte;
begin
 clrscr;
 a:=0; b:=30; i:=20; j:=210;
 repeat
  s_box(i,b,j*2,j,a);
  i:=i+3; b:=b+3; j:=j-6;
 until j=0;
end;


procedure Text_1;
begin
 gotoxy(60,6);   write ('Willkommen zur ersten');
 gotoxy(60,8);   write ('Grafik-Toolbox f}r den');
 gotoxy(60,10);  write ('JOYCE unter Turbo Pascal,');
 gotoxy(60,12);  write ('garantiert ohne GSX...');
 gotoxy(60,14);  write ('Bislang m|glich:');
 gotoxy(60,16);  write ('- Pixel setzen/l|schen/invert.');
 gotoxy(60,18);  write ('- Linien und Kasten zeichnen');
 gotoxy(60,20);  write ('- und noch einiges mehr...');
 gotoxy(60,26);  write ('(Bitte eine Taste dr}cken...)');
end;


procedure Zeichen;
var
  i : integer;
begin
  Symbol(255, ' ****** ',
              '*      *',
              '* *  * *',
              '*      *',
              '* *  * *',
              '*  **  *',
              '*      *',
              ' ****** ');
  gotoxy(0,27);
  for i:=1 to 45 do write (chr(255),' ');
  writeln;
  writeln ('Einzelpunktgrafik und variabler Zeichensatz...');
end;


procedure Flash;
begin
  repeat
   delay(700);
   Screen_Off;
   Sound_On;
   delay(700);
   Screen_On;
   Sound_Off;
  until keypressed;
end;


procedure Noise;
var
 Cycles, On_Time, Off_Time : integer;
begin
 Play(10,24,7000);
 Play(200,10,100);
 Play(1000,10,1);
 delay(700);
 Cycles:=1;
 On_Time:=1;
 Off_Time:=1;
 repeat
  Play (Cycles, On_Time, Off_Time);
  Cycles:=Cycles+15;
  On_Time:=On_Time+5;
  Off_Time:=Off_Time+1;
 until Cycles>200
end;



begin
  GraphInit;
  HideCursor;
  clrscr;
  Pyramide;
  Text_1;
  while not keypressed do;
  read(kbd,ch);
  Sinus;
  delay(1000);
  Zeichen;
  delay(1000);
  write('und noch andere absonderliche Effekte...');
  write('                         (Taste dr}cken)');
  Flash;
  Noise;
  clrscr;
  writeln ('...und das war noch lange nicht alles!');
  writeln ('Schauen Sie sich jetzt noch das Programm');
  writeln ('DEMO an, um die vollen M|glichkeiten zu sehen');
  writeln; writeln;
  writeln ('Aber vorher noch ein kleines Testbild...');
  LoadScreen ('DEMO1.PIC');
  while not keypressed do;
  read(kbd,ch);
  ShowCursor
end.

