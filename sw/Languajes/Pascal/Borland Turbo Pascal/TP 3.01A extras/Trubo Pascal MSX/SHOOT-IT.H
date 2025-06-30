const
  menue     = 'DEMO.COM';
  display1  = 0;
  display2  = 1;
  ballstuff = 2;
  savestuff = 3;
  xsize     = 41;
  xsize2    = 50;
  ysize     = 69;
  maxphase  = 17;
  bufsize   = 1024;
  forever   = FALSE;

  xmap: array[boolean,0..maxphase] of byte =
           ((  0,  42,  84, 126, 168, 210,
               0,  42,  84, 126, 168, 210,
               0,  42,  84, 126, 168, 210),
            (  0,  45,  89, 133, 176, 220,
              11,  54,  97, 140, 183, 226,
              16,  59, 101, 144, 186, 228));

  ymap: array[boolean,0..maxphase] of byte =
           ((  0,   0,   0,   0,   0,   0,
              70,  70,  70,  70,  70,  70,
             140, 140, 140, 140, 140, 140),
            (  0,   3,   6,   9,  11,  13,
              85,  87,  88,  89,  91,  92,
             162, 163, 164, 164, 165, 166));

  xdim: array[boolean,0..maxphase] of byte =
           (( 40,  40,  40,  40,  40,  40,
              40,  40,  40,  40,  40,  40,
              40,  40,  40,  40,  40,  40),
            ( 40,  34,  30,  26,  24,  20,
              18,  16,  14,  12,  10,   8,
               8,   6,   6,   4,   4,   4));

  ydim: array[boolean,0..maxphase] of byte =
           (( 56,  56,  56,  56,  56,  56,
              56,  56,  56,  56,  56,  56,
              56,  56,  56,  56,  56,  56),
            ( 56,  50,  44,  38,  34,  30,
              26,  22,  20,  18,  14,  12,
              12,  10,   8,   8,   6,   4));


type
  drehrichtung = (rechtsrum, linksrum, geplatzt);


var
  piuuu,
  pitch:        integer;
  xBall,
  yBall:        integer;
  xZiel,
  yZiel:        integer;
  vx,vy:        integer;

  lastx, lasty,
  lastphase:    array[display1..display2] of integer;
  lastspin:     array[display1..display2] of drehrichtung;
  spin:         drehrichtung;
  phase:        integer;

  LuftRaus:     boolean;

  PlatzBall,
  HopsBall:     MapPointer;

  sbuffer:      array[1..bufsize] of byte;

  MausPort:     integer;



