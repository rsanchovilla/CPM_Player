(****************************************************************
 file OSBTWIND.INC  -  Video and window primitives
 (c) Copyright 1986 Claude Ostyn
 Osborne 1 memory-mapped version 3/21/86
 See file TURBWIN2.DOC for important information.

 ****************************************************************)
const

    (*======= Terminal-dependent strings  =======*)
    (* as shown, good for ADM3A, Osborne 1, etc. *)
    ClrScrString  = #26;      (* string to clear screen          *)
    ClrEolString  = #27'T';   (* string to clear to end of line  *)
    DimVidString  = #27')';   (* string to start dim video       *)
    BrightString  = #27'(';   (* string to end dim video         *)
    InverseString = #27'l';   (* string to start inverse video   *)
    NormalString  = #27'm';   (* string to end inverse video     *)
      (* note:  since inverse video is not available on the      *)
      (*        Osborne 1, underlining codes are used instead    *)
    BlinkString   = #0;
    NoBlinkString = #0;       (* blink not available on Osborne  *)

    (* Osborne only, replace with #0 for other terminals *)
    GraphString   = #27'g';
    NoGraphString = #27'G';

    (* graphic characters, if available (otherwise use ASCII)    *)

    (* these characters are special graphic characters for the   *)
    (* Osborne 1.  They require that graphic mode be turned on.  *)
    BoxTLCh   = #17; (* char used for top left corner of box     *)
    BoxTRCh   = #05; (* char used for top right corner of box    *)
    BoxBRCh   = #03; (* char used for bottom right corner of box *)
    BoxBLCh   = #26; (* char used for bottom left corner of box  *)
    BoxTHorCh = #23; (* char used for top of box                 *)
    BoxBHorCh = #24; (* char used for bottom of box              *)
    BoxLVerCh = #01; (* char used for left side of box           *)
    BoxRVerCh = #04; (* char used for right side of box          *)
    (*===========================================================*)

    (* You may also have to alter the procedure GotoXY below     *)

    (*=== Control constants ===*)

    ScreenMemSize = 3072;   (* size of video memory map (either  *)
                            (* "ghost" video screen in RAM if not*)
                            (* memory-mapped video, or video RAM *)
                            (* area if memory-mapped video)      *)
                            (* 3072 for Osborne 1 memory-mapped, *)
                            (* usually 2000 otherwise            *)
    ScrMemWidth   = 128;    (* line width in video memory        *)
                            (* 128 if using Osborne video memory *)
                            (* usually 80 otherwise              *)
    MemMapVideo   = true ;  (* true if var ScreenMem is set to   *)
                            (* same address as video screen map  *)
                            (* (if using memory-mapped video)    *)
    ScreenWidth   = 80;     (* actual screen width               *)

    (*=== initialized variables ===*)
    CustomConout : boolean = false;
                                (* true if using special Conout *)
    XTopLWindow : byte = 1;     (* 1..80 *)
    YTopLWindow : byte = 1;     (* 1..25 *)
    XBotRWindow : byte = 80;
    YBotRWindow : byte = 24;    (* 25 on some terminals      *)
    WindowWidth : byte = 80;
    XNext       : byte = 1;     (* default position to write *)
    YNext       : byte = 1;     (* next character (relative  *)
                                (* to current window         *)

type
    String1 = string[1];

    VideoEffect = (NormalV,
                   InverseV,
                   BrightV, DimV,
                   GraphV, NoGraphV,
                   BlinkV, NoBlinkV);

    VidFXSet = set of VideoEffect;

const
    VideoAttributes : VidFXSet
                      = [NormalV, BrightV, NoGraphV, NoBlinkV];
                         (* default video attributes *)

var
    StdConOut   : integer; (* used to save address of standard  *)
                           (* Turbo Pascal ConOut procedure     *)

    ScreenMem   : array[1..ScreenMemSize] of byte absolute $F000;
                           (* This is a ghost screen in RAM,    *)
                           (* necessary to implement scrolling  *)
                           (* within window                     *)


procedure GotoXY( X, Y: byte);
(****************************************************************
 Direct cursor addressing
  Sets global vars YNext, XNext for next print position and
  places cursor.  Erase old cursor if memory-mapped video.
  Performs NO range checking on parameters.  If X or Y are outside
  current window, the cursor position is unpredictable!
  This procedure uses the cursor addressing sequence for Osborne,
  ADM3A, Televideo, Epson, Kaypro, etc.  Change for others.
  Note that char is output by direct call to BIOS.
  Do NOT use Write since Conout is taken over by windows module!
 ****************************************************************)
    var OldX, OldY : byte;
        Offset     : integer;

begin

  OldX  := XNext;
  OldY  := YNext;
  YNext := Y;
  XNext := X;
  Bios(3,27);                           (* ESC             *)
  Bios(3,61);                           (* '='             *)
  Bios(3,YNext + YTopLWindow + 30);     (* Row + offset    *)
  Bios(3,XNext + XTopLWindow + 30);     (* Column + offset *)
  if MemMapVideo and (not (InverseV in VideoAttributes)) then begin
    Offset := (YTopLWindow + OldY - 2) * ScrMemWidth +
               XTopLWindow + OldX - 1;
    ScreenMem[Offset] := ScreenMem[Offset] and $7F;
  end;
end;


function WhereX: byte;
(****************************************************************
 Returns current cursor X location.  If not available, return 255
 ****************************************************************)
begin
  WhereX := XNext
end;


function WhereY: byte;
(****************************************************************
 Returns current cursor Y location.  If not available, return 255
 ****************************************************************)
begin
  WhereY := YNext
end;


procedure PutVidChar(C : byte;  AdjustCursor : boolean);
(****************************************************************
 Output character value through operating system, so screen cursor
 position is adjusted automatically and video attributes are
 implemented.
 Also write into the ghost video array if adjusting cursor
 (i.e. if not part of a control sequence) and not memory-mapped.
 ****************************************************************)

begin
  Bios(3,C);
  if AdjustCursor then begin
    if not MemMapVideo then
       ScreenMem[(YNext-1) * ScrMemWidth
                  + (YTopLWindow -1) * ScrMemWidth
                  + XTopLWindow - 1 + XNext] := C;
    XNext := succ(XNext);
  end;
end;


procedure ScrHome;
(****************************************************************
 Erase window and put cursor at top left of window
 ****************************************************************)
    var Height, Offset, R,C : integer;

begin
  Height := YBotRWindow - YTopLWindow + 1;
  Offset := (YTopLWindow -1) * ScrMemWidth + XTopLWindow;
  if MemMapVideo then begin
    GotoXY(1,1);
    for R := 1 to Height do
      FillChar(ScreenMem[Offset + (R-1) * ScrMemWidth],
               WindowWidth,32);
  end else begin
    for R := 1 to Height do begin
      GotoXY(1,R);
      for C := 1 to WindowWidth do PutVidChar(32,true);
    end;
  end;
  GotoXY(1,1);
end;


procedure ScrBackX;
(****************************************************************
 Move cursor position left (backspace)
 ****************************************************************)

begin
    if XNext > 1 then XNext := pred(XNext)
    else
      if YNext > 1 then begin
        XNext := WindowWidth;
        YNext := pred(YNext);
      end;
    GotoXY(XNext,YNext);
end;


procedure ScrNextLine;
(****************************************************************
 Move down one line if still within window else scroll
 ****************************************************************)
    var   Row, Col,
          Height,
          FirstCh   : byte;
          Offset    : integer;

begin
    Height := YBotRWindow - YTopLWindow ;
    if YNext < Height + 1 then begin
      GotoXY(XNext,YNext+1);
    end else begin
      (*  Scroll text within window.  Top line of text is lost.
          Leaves cursor at end of bottom line of window.        *)
      Offset := (YTopLWindow -1) * ScrMemWidth + XTopLWindow;
      FirstCh := ScreenMem[Offset + ScrMemWidth];
      if MemMapVideo then begin
        GotoXY(1,1);  (* put cursor where it will be erased *)
        for Row := 1 to Height do
          Move(ScreenMem[Offset + Row * ScrMemWidth],
               ScreenMem[Offset + (Row-1) * ScrMemWidth],
               WindowWidth);
        FillChar(ScreenMem[Offset + Height * ScrMemWidth],
               WindowWidth,32);
      end else begin
        for Row := 1 to Height do begin
          GotoXY(1,Row);
          for Col := 0 to WindowWidth - 1 do begin
            PutVidChar(ScreenMem[Offset + Row * ScrMemWidth + Col],
                       true);
          end;
        end;
        GotoXY(1,Height+1);
        for Col := 1 to WindowWidth do
          PutVidChar(32,true);
      end;
      GotoXY(1,Height+1);
      ScreenMem[Offset] := FirstCh; (* erase ghost of cursor *)
    end;
end;


procedure ScrWrite(C : integer);
(****************************************************************
 Replaces the Turbo ConOut driver for character output to the
 screen within current window.
 Assumes only a limited set of characters, filters out most
 control characters and allows limited cursor movement.
 If GraphV attribute is set, accepts any character w/out filtering.
 The integer parameter C is required rather than a char parameter.
 I could explain why, but it would be boring.  Just believe me.
 ****************************************************************)
 var Ch : char;

begin (* ScrWrite *)

    Ch := chr(Lo(C));
    if (not (GraphV in VideoAttributes)) and
       (Ch < ' ') then begin

      case Ch of
        ^G       : PutVidChar(7,false);
        ^H       : ScrBackX;
        ^J       : ScrNextLine;          (* line feed *)
        ^K       : if YNext > 1 then
                     GotoXY(XNext,pred(YNext));
        ^L       : if (XNext < WindowWidth) then
                     GotoXY(succ(XNext),YNext);
        ^M       : GotoXY(1,YNext);      (* CR        *)
      end;

    end else begin

      if XNext > WindowWidth then begin
        XNext := 1;
        ScrNextLine;
      end;

      PutVidChar(ord(Ch),true);

    end;

end; (* ScrWrite *)


procedure SetVideo(Effect : VideoEffect);
(****************************************************************
 Turn video attributes on and off
 (uses standard Turbo ConOut instead of ScrWrite)
 Attributes affect whole window if scrolled
 ****************************************************************)
    var FX:  VidFXSet;

begin
    if CustomConout then
      ConOutPtr := StdConOut;

    case Effect of
       NormalV  : begin
                    write(Con,BrightString,
                              NormalString,
                              NoGraphString);
                    FX := [NormalV, BrightV, NoGraphV,NoBlinkV];
                  end;
       InverseV : begin
                    write(Con,#27,'l');  (* underline instead *)
                    FX := FX - [NormalV] + [InverseV];
                  end;
       BrightV  : begin
                    write(Con,BrightString);
                    FX := FX - [DimV] + [BrightV];
                  end;
       DimV     : begin
                    write(Con,DimVidString);
                    FX := FX - [BrightV] + [DimV];
                  end;
       GraphV   : begin
                    write(Con,GraphString);
                    FX := FX - [NoGraphV] + [GraphV];
                  end;
       NoGraphV : begin
                    write(Con,NoGraphString);
                    FX := FX - [GraphV] + [NoGraphV];
                  end;
       BlinkV   : begin
                    write(Con,BlinkString);
                    FX := FX - [NoBlinkV] + [BlinkV];
                  end  ;
       NoBlinkV : begin
                    write(Con,NoBlinkString);
                    FX := FX - [BlinkV] + [NoBlinkV];
                  end  ;

    end;
    VideoAttributes := FX;
    if CustomConout then
      ConOutPtr := Addr(ScrWrite);
end;


(*===  Replacements for standard screen procedures  ===*)

procedure NormVideo;
(****************************************************************
 Set screen to "Normal video"
 ****************************************************************)
begin
   SetVideo(NormalV);
end;

procedure LowVideo;
(****************************************************************
 set video attributes to dim
 ****************************************************************)
begin
   SetVideo(DimV);
end;

procedure ClrScr;
(****************************************************************
 Erase screen or current window
 ****************************************************************)
begin
  if CustomConout then ScrHome
  else write(con, ClrScrString);
end;

procedure ClrEol;
(****************************************************************
 Erase to end of line (or right edge of window) without moving
 cursor
 ****************************************************************)
    var X, I : byte;
begin
    if CustomConout or (Length(ClrEolString) = 0) then begin
       X := XNext;
       for I := 1 to WindowWidth - XNext + 1 do write(' ');
       GotoXY(X,YNext);
    end else begin
      write(con, ClrEolString);
    end;
end;


procedure Window(XTopL,YTopL,XBotR,YBotR : integer);
(****************************************************************
 Set global variables for window parameters and places cursor
 within window.
 ****************************************************************)

begin
  (* Reset screen position - Delete this *)
  (* part if not using an Osborne 1      *)
  Bios(3,27); Bios(3,83); Bios(3,32); Bios(3,32);

    XTopLWindow := XTopL;
    YTopLWindow := YTopL;
    XBotRWindow := XBotR;
    YBotRWindow := YBotR;
    WindowWidth := XBotR - XTopL + 1;
    GotoXY(1,1);
end;


procedure FullScreen;
(****************************************************************
 Set active window screen to full screen
 ****************************************************************)
begin
    Window(1,1,80,24);
    WindowWidth := 80;
end;


procedure InitVideo;
(****************************************************************
 Initialize video writing routines
 Must be called at least once to initialize window emulation
 Does NOT clear the screen automatically.
 ****************************************************************)
begin
    FullScreen;
    SetVideo(NormalV);
    if ConOutPtr <> Addr(ScrWrite) then
      StdConOut := ConOutPtr;
    ConOutPtr := Addr(ScrWrite);
    CustomConout := true;
end;


procedure DeInitVideo;
(****************************************************************
 Return control to Turbo standard Conout driver
 Must be called at end of program if you want to run it again
 in memory (otherwise Turbo detects anomaly and quits)
 ****************************************************************)
begin
    ConOutPtr    := StdConOut;
    CustomConout := false;
end;


(*========  Additional goodies to make pretty windows  ========*)

procedure DrawBox (TLX,TLY,BRX,BRY: integer);
(****************************************************************
 Draw a box with TLX,TLY as top left corner and BRX,BRY as
 bottom left corner.
 Uses graphic characters defined above
 BoxTLCh   = top left corner of box
 BoxTRCh   = top right corner of box
 BoxBRCh   = bottom right corner of box
 BoxBLCh   = bottom left corner of box
 BoxTHorCh = top of box
 BoxBHorCh = bottom of box
 BoxLVerCh = left side of box
 BoxRVerCh = right side of box
 ****************************************************************)
    var Y,X : integer;

begin (* DrawBox *)
    GotoXY(TLX,TLY);
    SetVideo(GraphV);
    Write(BoxTLCh);
    for X := 1 to BRX-TLX-1 do Write(BoxTHorCh);
    Write(BoxTRCh);
    SetVideo(NoGraphV);
    for Y := TLY+1 to BRY-1 do begin
      GotoXY(TLX,Y); SetVideo(GraphV);
      Write(BoxLVerCh); SetVideo(NoGraphV);
      GotoXY(BRX,Y); SetVideo(GraphV);
      Write(BoxRVerCh); SetVideo(NoGraphV);
    end;
    GotoXY(TLX,BRY);
    SetVideo(GraphV);
    Write(BoxBLCh);
    for X := 1 to BRX-TLX-1 do Write(BoxBHorCh);
    Write(BoxBRCh);
    SetVideo(NoGraphV);
end; (* DrawBox *)


procedure MakeWindow (TLX,TLY,BRX,BRY: integer);
(****************************************************************
 Draw a window on screen at coordinates, and set a text window
 that fits within the coordinates (i.e. window dimensions -1).
 Also set global var WindowWidth.
 ****************************************************************)

begin
    FullScreen;
    DrawBox(TLX, TLY, BRX, BRY);
    Window(TLX+1, TLY+1, BRX-1, BRY-1);
    ClrScr;
end;

(********************* end of WINDOWS.INC ********************)

