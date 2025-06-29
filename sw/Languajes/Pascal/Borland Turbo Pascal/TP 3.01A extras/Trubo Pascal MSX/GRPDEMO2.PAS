program GRPDEMO2;    (* Grafik-Demo 2: TÅrme von Hanoi (Sprites) *)



{$I KERNEL.GIC  }
{$I SPRITES.GIC }



const
  SpritePatterns: array[1..7] of Sprite32 =             { Sprite-Definitionen }
      (#0#0#0#0#0#0#0#0#0#0#0#0#$01#$03#$03#$01#0#0#0#0#0#0#0#0#0#0#0#0#$80#$C0#$C0#$80,
       #0#0#0#0#0#0#0#0#0#0#0#0#$03#$07#$07#$03#0#0#0#0#0#0#0#0#0#0#0#0#$C0#$E0#$E0#$C0,
       #0#0#0#0#0#0#0#0#0#0#0#0#$07#$0F#$0F#$07#0#0#0#0#0#0#0#0#0#0#0#0#$E0#$F0#$F0#$E0,
       #0#0#0#0#0#0#0#0#0#0#0#0#$0F#$1F#$1F#$0F#0#0#0#0#0#0#0#0#0#0#0#0#$F0#$F8#$F8#$F0,
       #0#0#0#0#0#0#0#0#0#0#0#0#$1F#$3F#$3F#$1F#0#0#0#0#0#0#0#0#0#0#0#0#$F8#$FC#$FC#$F8,
       #0#0#0#0#0#0#0#0#0#0#0#0#$3F#$7F#$7F#$3F#0#0#0#0#0#0#0#0#0#0#0#0#$FC#$FE#$FE#$FC,
       #0#0#0#0#0#0#0#0#0#0#0#0#$7F#$FF#$FF#$7F#0#0#0#0#0#0#0#0#0#0#0#0#$FE#$FF#$FF#$FE);

  links  =  30;                            { x-Koordinate des linken    Turms }
  mitte  = 128;                            { x-Koordinate des mittleren Turms }
  rechts = 226;                            { x-Koordinate des rechten   Turms }

  TurmPosition: array[1..3] of integer = (links, mitte, rechts);

  Grundlinie = 160;                        { y-Koordinate der Grundlinie      }
  Oberkante  =  90;                        { y-Koordinate der Oberkante       }


var
  c:               char;                    { Eingabevariable fÅr Tastendruck }
  AnzahlScheiben:  integer;
  AnzahlZuege:     integer;
  Turm:            array[1..3] of string[7];

  f:               file;




procedure SpritesInitialisieren;

  var
    i: integer;

  begin
    SetSpriteSize (3);
    for i := 1 to 7 do
      begin
      DefSprite   (i, SpritePatterns[i]);
      SpriteColor (i, i+1);
      end;
  end;




procedure GeruestZeichnen;

  begin
    { Grundlinie zeichnen }
    pencolor (10);
    box (0, Grundlinie, 255, Grundlinie+1);

    { TurmstÑbe zeichnen }
    pencolor (11);
    box (links,  Grundlinie,  links+1,  Oberkante);
    box (mitte,  Grundlinie,  mitte+1,  Oberkante);
    box (rechts, Grundlinie,  rechts+1, Oberkante);

    { Beschriftung }
    GotoXY (20,  0);  write ('Anzahl Scheiben:');
    GotoXY (20, 10);  write ('Anzahl ZÅge:');
  end;



procedure TasteDruecken;

  begin
    pencolor (2);
    gotoXY (Mitte-120, Grundlinie+13);
    write ('Bitte eine Taste drÅcken (Ende = ^C)');
    read (kbd, c);
    pencolor (paper);
    boxfill (0, Grundlinie+13, maxX, maxY);
  end;



procedure ZuegeAnzeigen;

  begin
    AnzahlZuege := succ(AnzahlZuege);
    pencolor (paper);
    boxfill (122, 10, 182, 18);

    pencolor (15);
    gotoXY (122, 10);
    write (AnzahlZuege);
  end;





procedure Eingabe;

  procedure Eingabefeldloeschen;

    begin
      pencolor (paper);
      boxfill (122, 0, 182, 18);
      gotoXY (122, 0);
    end;

  begin
    pencolor (2);
    gotoXY (Mitte-120, Grundlinie+13);
    write ('Bitte Anzahl der Scheiben eingeben (1-7)');
    {$I-}
    repeat
      Eingabefeldloeschen;
      BufLen := 10;
      pencolor (11);
      read (AnzahlScheiben);
    until (AnzahlScheiben > 0) and (AnzahlScheiben < 8) and (IOresult = 0);
    {$I+}
    Eingabefeldloeschen;
    pencolor (15);
    write (AnzahlScheiben);
    AnzahlZuege := 0;
    pencolor (paper);
    boxfill (0, Grundlinie+13, maxX, maxY);
  end;




function Turmhoehe (i: integer): integer;

  begin
    Turmhoehe := 9*(length(turm[i]) + 1);
  end;




procedure ScheibeWegnehmen (t: integer; var scheibe: integer);

  var
    i: integer;

  begin
    scheibe := ord(turm[t][1]);            { Welche liegt obendrauf? }

    for i := Grundlinie - turmhoehe(t) downto Oberkante-10 do
      PutSprite (scheibe, turmposition[t]-15, i-24);

    delete (turm[t], 1, 1);                { weg ist die Scheibe }
  end;



procedure ScheibeDrauflegen (t: integer; scheibe: integer);

  var
    i: integer;

  begin
    for i := Oberkante-10 to Grundlinie - turmhoehe(t) do
      PutSprite (scheibe, turmposition[t]-15, i-24);

    insert (chr(scheibe), turm[t], 1);     { drauf auf den Turm }
  end;


procedure TurmAufbauen;

  var i: integer;

  begin
    Turm[1] := '';
    Turm[2] := '';
    Turm[3] := '';

    for i := 1 to 7 do
      PutSprite (i, 0, 217);  { weg vom Bilschirm }

    for i := AnzahlScheiben downto 1 do
      ScheibeDrauflegen (1, i);
  end;



{$A-}    { Hier wird's rekursiv }

procedure TurmBewegen (AnzahlScheiben, Von, Hilfe, Nach: integer);


  var
    scheibe: integer;
    i:       integer;

  begin
    if keypressed then exit;     { Mîglichkeit zum Abbruch einrÑumen! }

    { Wenn mehr als eine Scheibe, alle bis auf die unterste auf den Hilfsturm }

    if AnzahlScheiben > 1
    then TurmBewegen (pred(AnzahlScheiben), Von, Nach, Hilfe);


    { Jetzt kann die unterste Scheibe bewegt werden }

    ScheibeWegnehmen (von, Scheibe);

    { von links nach rechts oder von rechts nach links }

    if Turmposition[von] < Turmposition[nach]
    then for i := Turmposition[von]-15 to Turmposition[nach]-15 do
      PutSprite (Scheibe, i, Oberkante-34)
    else for i := Turmposition[von]-15 downto Turmposition[nach]-15 do
      PutSprite (Scheibe, i, Oberkante-34);

    { ZugzÑhler erhîhen }

    ZuegeAnzeigen;

    ScheibeDrauflegen (nach, Scheibe);

    { Wenn mehr als eine Scheibe, alle fehlenden vom Hilfsturm nachholen }

    if AnzahlScheiben > 1
    then TurmBewegen (pred(AnzahlScheiben), Hilfe, von, Nach);
  end;

{$A+}


begin  { Hauptprogramm }
  CrtInit;

  color (15, 0, 0);
  if MSX2 then screen(5) else screen(2);    { angemessenen Grafikmodus wÑhlen }

  GeruestZeichnen;
  SpritesInitialisieren;

  repeat
    Eingabe;
    TurmAufbauen;
    TasteDruecken;
    if c <> ^C
    then begin
      TurmBewegen (AnzahlScheiben, 1, 2, 3);       { von 1 nach 3 Åber 2 }
      TasteDruecken;
      end;
  until c = ^C;

  CrtExit;

  assign (f, 'DEMO.COM');
  execute (f);
end.
