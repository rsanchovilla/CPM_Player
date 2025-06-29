PROGRAM plotprofile(profdata, outfile, output);
(* ******************************************************** *)
(* Plots a histogram from "profdata", which was saved via   *)
(* "dumprofile" routine of "profiler" subsystem.  Note that *)
(* profile can be of machine language operation.            *)
(*                                                          *)
(* Copyright (c) 1981, 1983 by:                             *)
(*                                                          *)
(*       C.B. Falconer,        (203) 785-2447               *)
(*       Yale School of Medicine,                           *)
(*       Room 6016CB,                                       *)
(*       789 Howard Ave.,                                   *)
(*       New Haven, Conn. 06504.                            *)
(* ******************************************************** *)

(* 1.2 84/11/02 fix for terminals that cannot handle 80 char *)
(*     lines without extra linefeeds.   cbf                  *)

  CONST
    version      = '1.2';
    firstxcolumn = 8;   (* first used for actual plot *)
    screenwidth  = 80;
    widthless1   = 79;  (* lousy terminals that linefeed at 80 *)
    screenlines  = 24;

  TYPE
    lineimage    = PACKED ARRAY[1..screenwidth] OF char;
    screenimage  = ARRAY[1..screenlines] OF lineimage;
    yarray       = ARRAY[firstxcolumn..screenwidth] OF integer;
    fntype       = PACKED ARRAY[1..28] OF char;
    dltype       = PACKED ARRAY[1..15] OF char;

  VAR
    xfirst, xstep, xsqueeze,
    events,
    minline,
    maxline,
    maxcount     : integer;  (* data limits *)
    yvalues      : yarray;
    r            : real;
    i            : integer;
    profdata,                  (* the stored data *)
    outfile      : text;     (* the histogram *)
    fn           : fntype;   (* the data file name *)
    dl           : dltype;   (* current time/date *)

  (* 1---------------1 *)

(*$i'aiwrite.inc' *)
  PROCEDURE skipblanks(VAR f : text);
  (* skips blanks and eolns until first non-blank char *)

    BEGIN (* skipblanks *)
    WHILE  (f^ = ' ') AND NOT eof(f) DO get(f);
    END; (* skipblanks *)

  (* 1---------------1 *)

  FUNCTION getpair(VAR f : text; VAR x,y : integer) : boolean;
  (* returns true if error in input data of form "x: y " *)

    BEGIN (* getpair *)
    getpair := true; (* default failure *)
    IF NOT readx(f, x) THEN (* ok so far *)
      IF f^ = ':' THEN BEGIN
        get(f);
        IF NOT readx(f, y) THEN
          IF f^ = ' ' THEN BEGIN
            skipblanks(f); getpair := false; END;
        END;
    END; (* getpair *)

  (* 1---------------1 *)

  FUNCTION xlimitscan(VAR profdata : text;
                      VAR minx, maxx : integer) : boolean;
  (* returns true if input data satisfactory *)

    LABEL 1;

    VAR
      thisx,
      thiscount : integer;

    BEGIN (* xlimitscan *)
    IF exists(profdata) THEN BEGIN
      skipblanks(profdata); xlimitscan := true;
      maxx := 0; minx := maxint;
      IF getpair(profdata, thisx, thiscount) OR (thisx > 0) THEN
        xlimitscan := false
      ELSE
        WHILE NOT eof(profdata) DO BEGIN
          IF getpair(profdata, thisx, thiscount) THEN BEGIN
            xlimitscan := false; GOTO 1; END;
          IF thisx > maxx THEN maxx := thisx;
          IF thisx < minx THEN minx := thisx; END;
      END
    ELSE xlimitscan := false;
1:  END; (* xlimitscan *)

  (* 1---------------1 *)

  PROCEDURE yrangescan(VAR profdata      : text;
                           xfirst, xstep : integer;
                       VAR yvalues       : yarray;
                       VAR ymax, events  : integer
                       VAR xsqueeze      : integer);
  (* primarily fills yvalues array with input data *)
  (* xlimitscan has already validated the input    *)

    VAR
      xvalue, i,
      thisy,
      thissum  : integer;
      junk     : boolean;

    BEGIN (* yrangescan *)
    FOR i := firstxcolumn TO screenwidth DO yvalues[i] := 0;
    reset(profdata); skipblanks(profdata);
    junk := getpair(profdata, xsqueeze, events); (* eventcount line *)
    ymax := 0; thissum := 0; i := firstxcolumn;
    WHILE NOT eof(profdata) DO BEGIN
      junk := getpair(profdata, xvalue, thisy);
      IF xvalue >= xfirst + xstep THEN BEGIN
        IF thissum > ymax THEN ymax := thissum;
        yvalues[i] := thissum; i := succ(i);
        xfirst := xfirst + xstep;
        WHILE xvalue >= xfirst + xstep DO BEGIN
          i := succ(i); xfirst := xfirst + xstep; END;
        thissum := 0; END;
      thissum := thissum + thisy; END;
    yvalues[i] := thissum;
    IF thissum > ymax THEN ymax := thissum;
    END; (* yrangescan *)

  (* 1---------------1 *)

  PROCEDURE plot(VAR outfile : text;
                     yvalues : yarray;
                     minline, step,
                     maxcount, events, xsqueeze : integer);
    VAR
      maxpercent,
      i, j, k   : integer;
      screen    : screenimage;
      scale     : real;

    (* 2---------------2 *)

    PROCEDURE makecoordinates(VAR screen        : screenimage;
                                  minline, step : integer;
                                  maxpercent    : integer);
      VAR
        i, j, v   : integer;
        s         : PACKED ARRAY[1..21] OF CHAR;
        r, num    : real;

      (* 3---------------3 *)

      PROCEDURE arhexwrite(VAR a    : lineimage;
                           VAR x    : integer;
                               maxx : integer;
                               num  : real);
        VAR
          divd      : real;
          i, dig    : integer;

        BEGIN (* arhexwrite *)
        IF x + 3 > maxx THEN BEGIN
          writeln('arhexwrite bounds violation');
          terminate; END
        ELSE BEGIN
          divd := 4096.0;
          FOR i := 0 TO 3 DO BEGIN
            dig := trunc(num/divd); num := num - divd * dig;
            divd := divd/16.0;
            IF dig > 9 THEN dig := dig + 7;
            a[x + i] := chr(dig + ord('0')); END;
          x := x + 3; END;
        END; (* arhexwrite *)

      (* 3---------------3 *)

      BEGIN (* makecoordinates *)
      r := 1.0;
      FOR i := xsqueeze TO -1 DO r := 2.0 * r;
      FOR i := 1 TO screenwidth DO screen[1,i] := ' ';
      FOR i := 2 TO screenlines DO screen[i] := screen[1];
      FOR i := 0 TO 4 DO BEGIN (* grid and y scale *)
        v := (4 - i) * maxpercent DIV 4; j := 1;
        aiwrite(screen[5*i+1], j, screenwidth, v, firstxcolumn-2);
        FOR j := 1 TO screenwidth DIV 8 DO
          screen[5*i+1, 8*j] := '+'; END;
      FOR i := 0 TO pred(screenwidth DIV 8) DO BEGIN
        j := 8*i+1;
        IF xsqueeze = 0 THEN
          aiwrite(screen[22], j, screenwidth, minline, 7)
        ELSE BEGIN
          num := r * minline; j := j+3;
          arhexwrite(screen[22], j, screenwidth, num); END;
        minline := minline + 8*step; screen[22, j+1] := '^'; END;
      s := '   PERCENT OF TIME   ';
      FOR i := 1 TO 21 DO screen[i, firstxcolumn-5] := s[i];
      END; (* makecoordinates *)

    (* 2---------------2 *)

    BEGIN (* plot *)
    scale := 100.0/events; maxpercent := 40;
    IF scale * maxcount > 80.0 THEN maxpercent := 100
    ELSE IF scale * maxcount > 40.0 THEN maxpercent := 80;
    IF scale * maxcount < 12.0 THEN maxpercent := 12
    ELSE IF scale * maxcount < 20.0 THEN maxpercent := 20;
    (* maxpercent must be divisible by 4 *)
    scale := 40.0/maxpercent * scale;
    makecoordinates(screen, minline, step, maxpercent);
    FOR i := firstxcolumn TO screenwidth DO BEGIN
      j := 1 + round(scale * yvalues[i]);
      IF odd(j) THEN screen[21 - j DIV 2, i] := '-'
      ELSE screen[21 - j DIV 2, i] := '_'; END;
    FOR i := 1 TO 22 DO
(*$x+,s-*)
      writeln(outfile, screen[i, 2 FOR widthless1]);
(*$x-*)
    END; (* plot *)

  (* 1---------------1 *)

  BEGIN (* plotprofile *)
  writeln('PLOTPROFILE (profdata, outfile, output) Ver.',
           version);
  IF xlimitscan(profdata, minline, maxline) THEN BEGIN
    filename(profdata, fn); dater(dl);
    rewrite(outfile);
    maxcount := succ(8 * ((screenwidth-firstxcolumn) DIV 8));
    xstep := round((maxline-minline)/maxcount + 0.5); (* round up *)
    xfirst := minline;
    yrangescan(profdata,xfirst,xstep,yvalues,maxcount,events,xsqueeze);
    writeln(outfile, dl, ' Data file = ', fn);
    writeln(outfile);
    write(outfile, 'Profile of ');
    IF xsqueeze = 0 THEN
      write(outfile, 'pcode execution, line increment=', xstep:1)
    ELSE BEGIN
      r := xstep;
      FOR i := xsqueeze TO -1 DO r := 2.0 * r;
      write(outfile, 'machine code execution, ');
      write(outfile, 'adr. increment(decimal)=', trunc(r):1); END;
    writeln(outfile);
    plot(outfile,yvalues,xfirst,xstep,maxcount,events,xsqueeze); END
  ELSE writeln('Fatal error in input data ');
  END. (* plotprofile *)
¦ó