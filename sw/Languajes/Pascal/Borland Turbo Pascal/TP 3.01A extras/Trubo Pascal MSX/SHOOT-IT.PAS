(*   S H O O T - I T     V  2 . 0      Uwe Schrîder  4.3.89, 19:47:34 *)

program shoot_it;

{$I KERNEL.GIC   }
{$I LOADSCR.GIC  }
{$I PALETTE.GIC  }
{$I COPYPIC.GIC  }
{$I MUSIC.GIC    }
{$I JOYSTICK.GIC }
{$I SPRITES.GIC  }
{$I EVENT.SIC    }
{$I MOUSE.GIC    }
{$I MAPPER.MIC   }

procedure IOcheck; external $201B;

{$W0,R-}

{$I SHOOT-IT.H }


{----------------------------------------------}
{ Abspeichern einer Bildseite im Memory Mapper }
{----------------------------------------------}

procedure definiere (var p: MapPointer);

  const
    pagesize = 27648;

  var
    p1: MapPointer;
    n:  integer;

  begin
    MapGetMem (p1, pagesize);
    p := p1;
    n := 0;
    while n <> pagesize do
      begin
      ReadVRAM (n,  sbuffer, bufsize);
      WriteMap (p1, sbuffer, bufsize);
      MapIncrement (p1, bufsize);
      n := n + bufsize;
      end;
  end;



{---------------------------------------------------}
{ ZurÅckholen einer Bildseite aus dem Memory Mapper }
{---------------------------------------------------}

procedure waehle (p: MapPointer);

  const
    pagesize = 27648;

  var
    n:        integer;
    workpage: integer;

  begin
    n        := 0;
    workpage := ACPAGE;
    SetPage (DPPAGE, ballstuff);
    while n <> pagesize do
      begin
      ReadMap   (p, sbuffer, bufsize);
      WriteVRAM (n, sbuffer, bufsize);
      MapIncrement (p, bufsize);
      n := n + bufsize;
      end;
    SetPage (DPPAGE, workpage);
  end;



{-----------------------------------}
{ Sprites fÅr Fadenkreuz definieren }
{-----------------------------------}

procedure InitSprites;

  begin
    ClrSprites;
    SetSpriteSize (2);
    DefSprite (0, #15#9#9#9#9#249#128#128#249#9#9#9#9#15#0#0#0#0#0#0#0#240#16#16#240);
    DefSprite (1, #0#6#6#6#6#6#121#121#6#6#6#6#6#0#0#0#0#0#0#0#0#0#224#224);
    SpriteColor (0,15);
    SpriteColor (1,13);
  end;


{---------------------------}
{ BeepBoingPfft ausschalten }
{---------------------------}

procedure NoSound;

  begin
    PSGinit;
  end;



{---------------------------------------------}
{ Programm-Ende (aufgerufen bei Control-Stop) }
{---------------------------------------------}

procedure adieu;

  var f: file;

  begin
    AllEventsOff;
    NoSound;
    CrtExit;
    assign (f, menue);
    execute (f);
    IOcheck;
  end;



{----------------------------------------}
{ Bearbeiten der Soundqueue (OnInterval) }
{----------------------------------------}

procedure Boing;

  begin
    if pitch <= 255
    then begin
      SetPSG (0,255-pitch);
      SetPSG (2,254-pitch);
      pitch := pitch + 20;
      end;

    if piuuu > 0
    then begin
      piuuu := piuuu + 20;
      if piuuu < 100
      then SetPSG ( 4, piuuu)
      else begin
        SetPSG (10, 0);
        piuuu := 0;
        end;
      end;
  end;



{-----------------}
{ Schu· (OnStrig) }
{-----------------}

procedure Peng;

  var
    psave: integer;

  begin

    piuuu := 20;
    SetPSG ( 4, 20);
    SetPSG (10,  8);

    psave := ACPAGE;
    SetPage (DPPAGE, DPPAGE);
    if  (point(xZiel,      yZiel)       = 13) { Leichter: "point(...) >= 13" }
     or (point(succ(xZiel),yZiel)       = 13)
     or (point(xZiel,      succ(yZiel)) = 13)
     or (point(succ(xZiel),succ(yZiel)) = 13)
    then begin
      StrigOff (0);                           { Treffer !                    }
      StrigOff (1);
      StrigOff (2);
      time  := 0;
      spin  := geplatzt;
      phase := 0;
      SetPSG ( 6,  31);
      SetPSG ( 7, 227);
      SetPSG ( 8,  15);
      SetPSG ( 9,  16);
      SetPSG (12,   5);
      SetPSG (13,   1);
      SetVDP (7, 14);
      waehle (PlatzBall);
      SetVDP (7, 0);
      end;
    SetPage (DPPAGE, psave);
  end;



{--------------------------}
{ Neuen Hopsball einwerfen }
{--------------------------}

procedure Einwurf;

  begin
    LuftRaus := FALSE;
    phase    := 0;
    piuuu    := 0;
    pitch    := 255;
    spin     := rechtsrum;
    xBall    := 0;
    yBall    := 0;
    xZiel    := 128;
    yZiel    := 106;
    vx       := succ(random(5));
    vy       := 0;

    waehle (HopsBall);

    SetPSG ( 1,   8);
    SetPSG ( 3,   4);
    SetPSG ( 5,   1);
    SetPSG ( 6,  31);
    SetPSG ( 7, 248);
    SetPSG ( 8,  16);
    SetPSG ( 9,  16);
    SetPSG (10,   0);

    StrigOn (0);
    StrigOn (1);
    StrigOn (2);
  end;



{------------}
{ Ball malen }
{------------}

procedure MaleBall;

  var
    schwirr:   boolean;
    dx, dy: integer;

  begin
    schwirr := (spin = geplatzt);
    dx      := xdim[schwirr,phase];
    dy      := ydim[schwirr,phase];

    { alten Bildschirminhalt retten }

    if ACPAGE = display1
    then HiSpeedCopyPic (xBall and $FFFE, yBall, (xBall+dx) or 1, yBall+dy, display1, 0,      0, savestuff)
    else HiSpeedCopyPic (xBall and $FFFE, yBall, (xBall+dx) or 1, yBall+dy, display2, xsize2, 0, savestuff);


    { Ball hinsetzen }

    CopyPic (xmap[schwirr,phase],    ymap[schwirr,phase],
             xmap[schwirr,phase]+dx, ymap[schwirr,phase]+dy, ballstuff,
             xBall,                  yBall,                  ACPAGE);


    { neue Koordinaten merken }

    lastx[ACPAGE]     := xBall;
    lasty[ACPAGE]     := yBall;
    lastphase[ACPAGE] := phase;
    lastspin[ACPAGE]  := spin;


    { Bildschirmseiten umschalten }

    while boolean(VDPstatus(2)) do { schnarch };
    SetPage (ACPAGE, DPPAGE);


    { Bildschirm restaurieren }

    schwirr := (lastspin[ACPAGE]=geplatzt);
    dx      := xdim[schwirr,lastphase[ACPAGE]];
    dy      := ydim[schwirr,lastphase[ACPAGE]];

    if lastx[ACPAGE] >= 0
    then begin
      if ACPAGE = display1
      then HiSpeedCopyPic (     0, 0, (       dx) or 1, dy, savestuff, lastx[display1] and $FFFE, lasty[display1], display1)
      else HiSpeedCopyPic (xsize2, 0, (xsize2+dx) or 1, dy, savestuff, lastx[display2] and $FFFE, lasty[display2], display2);
      end;
  end;



{-------------------------------------}
{ Angezeigte Bewegungsphase auswÑhlen }
{-------------------------------------}

procedure DreheBall;

  begin

    { nÑchste Bewegungsphase wÑhlen }

    case spin of
      rechtsrum: if phase = maxphase
                 then phase := 0
                 else phase := succ(phase);
      linksrum:  if phase = 0
                 then phase := maxphase
                 else phase := pred(phase);
      geplatzt:  begin
                 if (phase < maxphase) and (time > 25)
                 then begin
                   phase := succ(phase);
                   time  := 0;
                   SetPSG (8, 15-(phase shr 1));
                   SetPSG (6, phase);
                   end;
                 if (time > 500) or strig(3) or strig(4) then Einwurf;
                 end;
      end {case};
  end;





{------------------------------------}
{ Neue Position des Balls ausrechnen }
{------------------------------------}

procedure BewegeBall;

  begin
    { Neue Koordinaten ausrechnen }

    xBall := xBall + vx;
    yBall := yBall + vy;


    { Linke Wand }

    if xBall < 1
    then begin
      vx    := -vx;
      xBall := xBall + vx;
      if spin <> geplatzt
      then begin
        SetPSG (12,4);
        SetPSG (13,1);
        pitch := 80;
        Boing;
        if vy > 0 then spin := rechtsrum else spin := linksrum;
        end;
      end;


    { Rechte Wand }

    if xBall > 210
    then begin
      vx    := -vx;
      xBall := xBall + vx;
      if spin <> geplatzt
      then begin
        SetPSG (12,4);
        SetPSG (13,1);
        pitch := 80;
        Boing;
        if vy < 0 then spin := rechtsrum else spin := linksrum;
        end;
      end;


    { Boden }

    if yBall > 155
    then begin
      vy    := -vy;
      yBall := yBall + vy;
      if spin <> geplatzt
      then begin
        SetPSG (12,15);
        SetPSG (13, 1);
        pitch := 0;
        Boing;
        if vx > 0 then spin := rechtsrum else spin := linksrum;
        end;
      end;


    { Decke }

    if yBall < 0
    then begin
      vy    := -vy;
      yBall := yBall + vy;
      end;


    if spin = geplatzt
    then if time < 30
      then begin
        { Pfft ... }
        vx := vx + pred(random(3));
        vy := vy + pred(random(3));
        end
      else begin
        { Luft raus }
        if vy > 0 then vy := pred(vy) else if vy < 0 then vy := succ(vy);
        if vx > 0 then vx := pred(vx) else if vx < 0 then vx := succ(vx);
        if not LuftRaus
        then begin
          SetPSG ( 8, 16);
          SetPSG (13,  4);
          LuftRaus := TRUE;
          end;
        end;


    { Erdanziehung (lineare Beschleunigung nach unten) }

    vy := succ(vy);

  end;




{--------------------------}
{ Joystick / Maus abfragen }
{--------------------------}

procedure BewegeFadenkreuz;

  const
    dx: array[1..8] of integer = ( 0,  2,  2,  2,  0, -2, -2, -2);
    dy: array[1..8] of integer = (-2, -2,  0,  2,  2,  2,  0, -2);

  var
    st: integer;

  procedure moveXY;

    begin
      if xZiel < 0 then xZiel := 0 else if xZiel > 255 then xZiel := 255;
      if yZiel < 0 then yZiel := 0 else if yZiel > 211 then yZiel := 211;
      PutSprite (0, xZiel-5, yZiel-7);
      PutSprite (1, xZiel-5, yZiel-7);
    end;


  begin
    if spin = geplatzt
    then PutSprite (0, 0, 216)
    else begin
      if Mausport = 0
      then begin
        st := stick(0) + stick(1) + stick(2);
        if st <> 0
        then begin
          xZiel := xZiel + dx[st];
          yZiel := yZiel + dy[st];
          end;
        end
      else GetMouse (Mausport, xZiel, yZiel);
      moveXY;
      end;
  end;



{-----------------}
{|---------------|}
{| Hauptprogramm |}
{|---------------|}
{-----------------}

begin
  CrtInit;
  MapInit;

  if MapMaxAvail < 65536.0
  then begin
    CrtExit;
    ClrScr;
    writeln ('Requires 128K Memory Mapper');
    writeln ('Program aborted');
    halt;
    end;

  AllEventsOff;
  OnInterval (4, addr(Boing));
  OnStrig    (0, addr(Peng));
  OnStrig    (1, addr(Peng));
  OnStrig    (2, addr(Peng));
  OnStop     (addr(adieu));
  StopOn;

  lastx[display1] := -1;
  lasty[display1] := -1;
  lastx[display2] := -1;
  lasty[display2] := -1;

  color (3,0,0);
  screen(5);

  SetPage (display1, display1);
  loadSCR ('SHOOT-IT.SCR'); IOcheck;

  SetPage (display1, ballstuff);
  loadSCR ('SHOOT-01.SCR'); IOcheck; definiere (PlatzBall);
  loadSCR ('SHOOT-02.SCR'); IOcheck; definiere (HopsBall);

  SetColor (15, 7,7,7);
  SetColor (14, 7,0,0);
  SetColor (13, 0,0,0);


  HiSpeedCopyPic (0, 0, maxX, maxY, display1, 0, 0, display2);
  SetPage (display1, display1); InitSprites;
  SetPage (display1, display2); InitSprites;
  LOGOPR := G_TPSET;

       if IsMouse (1) then Mausport := 1
  else if IsMouse (2) then Mausport := 2
  else                     Mausport := 0;


  IntervalOn;

  {$U+}

  Einwurf;

  repeat
    MaleBall;
    BewegeFadenkreuz;
    DreheBall;
    BewegeBall;
    BewegeFadenkreuz;
  until forever;

  {$U-}
end.
