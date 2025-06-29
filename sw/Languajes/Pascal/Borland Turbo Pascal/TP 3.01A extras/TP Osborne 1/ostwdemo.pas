program OSTWDEMO;


(* DEMO PROGRAM FOR WINDOW PROCEDURES *)
(*  by Claude Ostyn - March 21, 1986  *)
(*  to draw boxes around windows      *)

(*$I OSBTWIND.INC    *)

var
    testline: string[255];
    I  : integer;
    Ch : char;

procedure ShowABunchOfStuff;
  var D : integer;
begin
  D := trunc(Random(3) * 10);
  for I := 1 to 4 do
    for Ch := '!' to '~' do begin
      write(Ch);
      Delay(D);
    end;
end;


begin (* demo *)
  ClrScr;
  InitVideo;
  Randomize;
  SetVideo(NormalV);
  MakeWindow(1,20,52,23);
  Delay(200);
  GotoXY(20,2); write('Claude''s windows mini-demo');
  MakeWindow(25,4,40,16);
  ShowABunchOfStuff;
  MakeWindow(2,2,20,6);
  ShowABunchOfStuff;
  Window(15,7,50,14);
  ClrScr;
  ShowABunchOfStuff;
  SetVideo(DimV);
  ShowABunchOfStuff;
  setVideo(BrightV);
  Delay(200);
  Window(35,9,45,12);
  ClrScr;
  Delay(200);
  GotoXY(2,3); Write ('Hi there!');
  FullScreen;
  MakeWindow(1,20,52,23);
  ShowABunchOfStuff;
  ClrScr;
  writeln('Input anything:');
  readln(testline);
  ClrScr;
  write(testline);
  Delay(300);
  MakeWindow(1,2,52,24);
  Ch := 'a';
  for I := 1 to 50 * 36 do begin
    if Ch = '~' then Ch := '!';
    write (Ch);
    Ch := succ(Ch);
    if (I > 50 * 22) and (I < 50 * 27) then Delay(20);
  end;
  FullScreen;
  GotoXY(1,1); write('Done - press any key to exit');
  repeat until keypressed;
  DeInitVideo;
  ClrScr;
end.
