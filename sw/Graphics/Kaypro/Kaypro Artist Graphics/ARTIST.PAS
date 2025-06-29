program Artist;

{****************************************************************************}
{*  Artist is used with the Kaypro 2-84 and Epson RX80-F/T printer to allow *}
{*  the user to draw on the screen with the Kaypro's graphics and then      *}
{*  dump the graphics to the Epson printer.  The graphic pictures can also  *}
{*  be saved and loaded from a disk file.  The pixels are positioned on     *}
{*  the screen using the numeric key pad.                                   *}
{****************************************************************************}

type
    FileName = string[12]; { file name size }

var
   X,Y     : integer; { graphic coordinate variables }
   KeyIn   : char; { used for inputing commands and utilities }
   Quit    : boolean; { determines if the program is finished }
   Status  : boolean; { determines if the graphics is on or off }
   Draw    : boolean; { determines if graphics are to be drawn }
   BitMap  : array [1..160,1..100] of boolean; { holds the graphic table }
   FilName : FileName; { file name }
   FilVar  : file of boolean; { file type }

procedure LineSpaceGraphic;
{* sets line spacing for graphic characters *}
begin { procedure LineSpaceGraphic }
     write(lst,chr(27),'A',chr(6))
end; { procedure LineSpaceGraphic }

procedure GraphicLine;
{* command for printing one line ( 80 ) graphic characters *}
begin { procedure GraphicLine }
     write(lst,chr(27),'K',chr(224),chr(1))
end; { procedure GraphicLine }

procedure MasterReset;
{* resets the printer for ASCII characters *}
begin { procedure MasterReset }
     write(lst,chr(27),'@')
end; { procedure MasterReset }

procedure PixelOn(X,Y:integer);
{* turns a screen pixel on *}
begin { procedure PixelOn }
     write(chr(27),'*',chr(Y+31),chr(X+31));
end; { procedure PixelOn }

procedure PixelOff(X,Y:integer);
{* turns a screen pixel off *}
begin { procedure PixelOff }
     write(chr(27),' ',chr(Y+31),chr(X+31))
end; { procedure PixelOff }

procedure CursorOn;
{* turns the screen cursor on *}
begin { procedure CursorOn }
     write(chr(27),'B',4)
end; { procedure CursorOn }

procedure CursorOff;
{* turns the screen cursor off *}
begin { procedure CursorOff }
     write(chr(27),'C',4)
end; { procedure CursorOff }

procedure Plot(X,Y:integer;Status,Draw:boolean);
{* plots a graphic pixel on the screen and in the BitMap *}
begin { procedure Plot }
     if Draw
     then
        if Status=true
        then
        begin
             PixelOn(X,Y);
             BitMap[X,Y]:=true
        end
        else
        begin
             PixelOff(X,Y);
             BitMap[X,Y]:=false
        end
     else
         if BitMap[X,Y]=true
         then
             PixelOn(X,Y)
         else
             PixelOff(X,Y);
end; { procedure Plot }

procedure NewLine;
{* resets line 24 for help menu *}
begin { procedure NewLine }
     GotoXY(1,24);
     DelLine;
     GotoXY(20,24)
end; { procedure NewLine }

procedure Menu;
{* contains the help menu and file utilities *}
var
   Xidx,Yidx,Y1,Y2 : integer; { used for BitMap }
   Index               : integer; { used for printing pixels }
   Pixels              : integer; { used for printer graphic handling }
   Ok                  : boolean; { used for file I/O error checking }
   DisplayGraphic      : boolean; { used for returning to graphic screen }
   Data                : boolean; { used for file handling }
begin { procedure Menu }
     DisplayGraphic:=false; { set display boolean }
     CursorOn; { turn on cursor }
     ClrScr; { clears the screen }
     gotoXY(35,2);
     writeln('HELP MENU');
     gotoXY(30,5);
     write('* DRAWING COMMANDS *');
     gotoXY(10,7);
     write('D - begin drawing');
     gotoXY(45,7);
     write('E - begin erasing');
     gotoXY(10,8);
     write('M - move cursor');
     gotoXY(45,8);
     write('B - blank screen');
     gotoXY(10,9);
     write('H - help menu');
     gotoXY(17,11);
     write('Numeric Key Pad controls the pixel positioning');
     gotoXY(30,14);
     write('* UTILITY COMMANDS *');
     gotoXY(10,16);
     write('P - print graphic screen');
     gotoXY(45,16);
     write('R - return to graphic screen');
     gotoXY(10,17);
     write('S - save graphic screen in file');
     gotoXY(45,17);
     write('L - load graphic screen from file');
     gotoXY(10,18);
     write('Q - quit program');
     repeat
           NewLine; { erase command line }
           write('Enter Command : ');
           while not KeyPressed do; { wait until a key is pressed }
           read(KBD,KeyIn); { read input into KeyIn }
           case UpCase(KeyIn) of { make input selection }
                'P' : begin { print graphic screen }
                           NewLine;
                           LineSpaceGraphic; { set printer line spacing }
                           for Yidx:=1 to 50 do
                           begin
                                GraphicLine; { set one printer graphic line }
                                Y2:=2*Yidx; { set even BitMap Y }
                                Y1:=Y2-1; { set odd BitMap Y }
                                for Xidx:=1 to 160 do
                                begin
                                     if BitMap[Xidx,Y1]=false
                                     then
                                         if BitMap[Xidx,Y2]=false
                                         then
                                             Pixels:=0
                                         else
                                             Pixels:=7
                                     else
                                         if BitMap[Xidx,Y2]=false
                                         then
                                             Pixels:=56
                                         else
                                             Pixels:=63;
                                     for Index:=1 to 3 do { print pixels }
                                         write(lst,chr(Pixels))
                                end
                           end;
                           MasterReset
                      end;
                'R' : begin { return to graphic screen }
                           CursorOff; { turn cursor off }
                           ClrScr; { clear screen }
                           Draw:=true; { enable graphic draw }
                           for Yidx:=1 to 100 do
                               for Xidx:=1 to 160 do
                                   Plot(Xidx,Yidx,BitMap[Xidx,Yidx],Draw);
                           Status:=false; { set pixel off }
                           Draw:=false; { disable graphic draw }
                           X:=1;
                           Y:=1;
                           DisplayGraphic:=true { set display boolean }
                     end;
                'S' : begin { save graphic screen in a file }
                           NewLine;
                           write('Enter file name : ');
                           read(FilName);
                           assign(FilVar,FilName);
                           {$I-} reset(FilVar) {$I+};
                           OK:=(IOresult=0); { check for I/O error }
                           if (not OK)
                           then
                           begin
                                NewLine;
                                write('New file : ',FilName);
                                delay(2500);
                                rewrite(FilVar)
                           end;
                           NewLine;
                           for Yidx:=1 to 100 do
                               for Xidx:=1 to 160 do
                               begin
                                    Data:=BitMap[Xidx,Yidx];
                                    write(FilVar,Data)
                               end;
                           Close(FilVar)
                      end;
                'L' : begin { load graphic screen from a file }
                           NewLine;
                           write('Enter file name : ');
                           read(FilName);
                           assign(FilVar,FilName);
                           {$I-} reset(FilVar) {$I+};
                           OK:=(IOresult=0); { check for I/O error }
                           if (not OK)
                           then
                           begin
                                NewLine;
                                write('Cannot locate file : ',FilName);
                                delay(2500)
                           end
                           else
                           begin
                                NewLine;
                                for Yidx:=1 to 100 do
                                    for Xidx:=1 to 160 do
                                    begin
                                         read(FilVar,Data);
                                         BitMap[Xidx,Yidx]:=Data
                                    end;
                                Close(FilVar)
                           end
                      end;
                'Q' : begin { quit program }
                           Quit:=true
                      end;
           end; { case UpCase(KeyIn) of }
     until (DisplayGraphic) or (Quit)
end; { procedure Menu }

procedure BlankGraphics;
{* clears the graphic screen and BitMap *}
var
   Xidx,Yidx : integer; { BitMap indexes }
begin { procedure BlankGraphics }
     ClrScr;
     for Yidx:=1 to 100 do
         for Xidx:=1 to 160 do
             BitMap[Xidx,Yidx]:=false;
     X:=1;
     Y:=1
end; { procedure BlankGraphics }

begin { program Artist }
     Quit:=false; { set program end boolean to false }
     CursorOff; { turn cursor off }
     BlankGraphics; { clear graphic screen }
     gotoXY(23,10);
     write('******** THE KAYPRO ARTIST ********');
     gotoXY(32,12);
     write('by Scott Reinhart');
     gotoXY(27,15);
     write('-- type H for help menu --');
     gotoXY(30,17);
     write('-- type D to draw --');
     repeat { wait for valid input }
           while not KeyPressed do; { wait for input }
           read(KBD,KeyIn)
     until (UpCase(KeyIn)='H') or (UpCase(KeyIn)='D') ;
     if UpCase(KeyIn)='H'
     then
         Menu { display help menu }
     else
         ClrScr; { clear screen }
     while not Quit do
           begin
                while not KeyPressed do { flash  pixel until a key is pressed }
                      begin
                           PixelOn(X,Y);
                           delay(50);
                           PixelOff(X,Y);
                           delay(50);
                      end;
                Plot(X,Y,Status,Draw); { plot current pixel position }
                read(KBD,KeyIn); { read input into KeyIn }
                case UpCase(KeyIn) of { make input selection }
                     'H' : begin { display help menu }
                                Menu
                           end;
                     'B' : begin { clear screen and BitMap }
                                BlankGraphics
                           end;
                     'M' : begin { move cursor }
                                Draw:=false;
                                Status:=false
                           end;
                     'D' : begin { turn pixels on }
                                Draw:=true;
                                Status:=true
                           end;
                     'E' : begin { turn pixels off }
                                Draw:=true;
                                Status:=false
                           end;
                     '1' :begin { move pixel SW direction }
                               if X>1 then X:=X-1;
                               if Y<100 then Y:=Y+1;
                          end;
                     '2' : begin { move pixel S direction }
                                if Y<100 then Y:=Y+1;
                           end;
                     '3' : begin { move pixel SE direction }
                                if X<160 then X:=X+1;
                                if Y<100 then Y:=Y+1;
                           end;
                     '4' : begin { move pixel W direction }
                                if X>1 then X:=X-1;
                           end;
                     '6' : begin { move pixel E direction }
                                if X<160 then X:=X+1;
                           end;
                     '7' : begin { move pixel NW direction }
                                if X>1 then X:=X-1;
                                if Y>1 then Y:=Y-1;
                           end;
                     '8' : begin { move pixel N direction }
                                if Y>1 then Y:=Y-1;
                           end;
                     '9' : begin { move pixel NE direction }
                                if X<160 then X:=X+1;
                                if Y>1 then Y:=Y-1;
                           end;
                end; { case UpCase(KeyIn) of }
           end; { while not Quit do }
     ClrScr; { clear screen }
     CursorOn { turn cursor on }
end. { program Artist }
