program panther;

{$I KERNEL.GIC  }
{$I WBORDER.GIC }
{$I EVENT.SIC   }
{$I MUSIC.GIC   }



type
  playstring = string[80];

var
  a,a1,a2,a3,b,c,d,c1,c2,d1,d2,e,f,g,h,
  j,j1,k,k1,l,m,n,o,o1,p,p2,n2,o2,o3:   playstring;

const
  menue = 'DEMO.COM';
  nothing: playstring = '';



procedure quit;

  var
    f: file;

  begin
    PSGinit;
    CrtExit;
    assign (f, menue);
    execute (f);
  end;


procedure window1; begin window (12, 2, 79, 7); end;
procedure window2; begin window (12,10, 79,15); end;
procedure window3; begin window (12,18, 79,23); end;



procedure PlayDemo (s1, s2, s3: playstring);


  begin
    window1; writeln; write (s1);
    window2; writeln; write (s2);
    window3; writeln; write (s3);
    play (s1, s2, s3);
  end;


{$U+}

begin
  CrtInit; PSGinit; AllEventsOff;
  OnStop (addr(quit)); StopOn;
  screen (0); width (80); color (10,4,4);

  gotoXY (2, 2); write ('1. Stimme');
  gotoXY (2,10); write ('2. Stimme');
  gotoXY (2,18); write ('3. Stimme');

  window1; wBorder;
  window2; wBorder;
  window3; wborder;

  BlinkColor (15,4,1,0); HighVideo;

  A :='T125o3L1E';
  A1:='T125o4R2R4R6L12D#';
  A2:='o4E2E4R6L12D#';
  A3:='o5L1D#';
  B :='T125o3L1D';
  C :='o3L2EL12ER12o2C#o3DR12D#';
  D :='o3L2BL12BR12G#AR12A#';
  C1:='o3L2EL12ER12DD#R12E';
  C2:='o3L2CL12CR12C#R12D#';
  D1:='o3L2BL12BR12AA#R12B';
  D2:='o3L2GL12GR12G#AR12A#';
  E :='o3L2EL12ER12D#DR12o2C#';
  F :='o3L2BL12BR12A#AR12G#';
  G :='o2L1C';
  H :='o3L1G';
  J :='o3L1F';
  J1:='o3L2FL12FR12C#DR12D#';
  K :='o4L1C';
  K1:='o3L2CL12CR12G#AR12A#';
  L :='o2L2CB';
  M :='o3L2GF#';
  N :='o4L4ER6L12F#L4GR6L12G#';
  O :='o4L6EL12F#L6GL12o5Co4L6BL12EL6GL12B';
  O1:='o4L6EL12F#L6GL12o5Co4L6BL12GL6Bo5L12E';
  P :='o4L2A#L12A#AGEDE';
  P2:='o5L2A#AGEDE';

  PlayDemo (A,B,nothing);
  PlayDemo (C,D,nothing);
  PlayDemo (A,B,nothing);
  PlayDemo (C,D,A1);
  PlayDemo (A,B,N);
  PlayDemo (E,F,O);
  PlayDemo (G,H,P);
  PlayDemo (C2,D2,A2);
  PlayDemo (A,B,N);
  PlayDemo (C1,D1,O1);
  PlayDemo (J,K,A3);
  PlayDemo (J1,K1,'o5L2D#L4D#L12D#R12o4D#');
  PlayDemo (A,B,N);
  PlayDemo (E,F,O);
  PlayDemo (G,H,P);
  PlayDemo (C,D,'o4L1E');
  PlayDemo ('o3L12E','o3L12B','o5R4L6EL12Do4L6BL12AL6GL12E');
  PlayDemo (L,M,'o4L12A#L6AL12A#L6AL12A#L6A');
  PlayDemo (C,D,'o4L12GEDER12L12EL2E');
  PlayDemo (C,D,'o5R2R4R6L12D#');

  N2:='o5L4ER6L12F#L4GR6L12D#';
  O2:='o5L6EL12F#L6GL12o6Co5L6BL12EL6GL12B';
  O3:='o5L6EL12F#L6GL12o6Co5L6BL12GL6Bo6L12E';

  PlayDemo (A,B,N2);
  PlayDemo (E,F,O2);
  PlayDemo (G,H,P2);
  PlayDemo (C2,D2,'o5L2EL4ER6L12D#');
  PlayDemo (A,B,N2);
  PlayDemo (C1,D1,O3);
  PlayDemo (J,K,'o6L1D#');
  PlayDemo (J1,K1,'o6L2D#L4D#L12D#R12o4D#');
  PlayDemo (A,B,N2);
  PlayDemo (E,F,O2);
  PlayDemo (G,H,P2);
  PlayDemo (C2,D2,'o5L1E');
  PlayDemo ('o3L12E','o3L12B','o6R4L6EL12Do5L6BL12AL6GL12E');
  PlayDemo (L,M,'o5L12A#L6AL12A#L6AL12A#L6AL12A#L6A');
  PlayDemo (E,F,'o5L12GEDER12EL2E');
  PlayDemo (C2,D2,'o5L12GEDER12EL2E');
  PlayDemo ('o3L2El4E','o3L2GL4GG','o5L12GEDER12El2E');
  PlayDemo ('o4L4Eo3BEE','o4L2EL6ER12L4G','o5L2GL6BR12o6L4D#');
  PlayDemo ('o4L1E','o5L1G','o6L1D#');
  while PlayStatus(0) do {warten};
  quit;
end.
