(*             PLOTTER module   (Epson printer)              *)
(* This module implements a virtual memory system for the    *)
(* generated dot map.  A 71k temporary file is created.  The *)
(* output file, if stored on disk, will be of similar size.  *)
(*                                                           *)
(* Entries are:                                              *)
(*    plotopen;                  to initialize               *)
(*    plotdot(x, y : integer);   Sets one dot at x,y         *)
(*    plotline(ink : boolean; x, y : integer);               *)
(*                               line from current to x,y    *)
(*                               ink false to just move.     *)
(*    loadfont(VAR f : text);    Install a Hershey font      *)
(*    plotchar(ch : char, x, y : integer;                    *)
(*             height, compress, angle : real)               *)
(*                               puts one char at x,y, moves *)
(*    plotclose(VAR f : text);   End and write results       *)
(*   vdpi, hdpi, hdots        constants, dots/inch, hor size *)
(*   vdots : integer          pagesize in dots.              *)
(* NOTE: plotchar compensates for hdpi <> vdpi.              *)
(*       angle is in radians, height & compress usually in   *)
(*       the range 0.5 to 2.0. Compress 0.5 makes characters *)
(*       narrower without affecting height, etc.             *)
(* NOTE: (x,y) = (0,0) is bottom left dot position.  Plots   *)
(*       may go off page, the output will be blanked.        *)
(*                                                           *)
(*$x+,h+ Allow declaration of "local" global data/procedures *)
(* which are only visible to code which follows this area    *)
(* The "allocate", "update", "reposition" procedures and the *)
(* "(:nn:)" char definitions are PascalP specific.           *)

  CONST
    (* Alter the following group to suit your needs.              *)
    (* printer characteristics, dots per inch vertical/horizontal *)
    vdpi          = 72;
    hdpi          = 120;            (* only ratio used in this module *)
    maxstrip      = 80;      {10  for debug}
    hdots         = 900;     {127 for debug}
    stripdeep     = 8;                           (* For Epson printer *)
    maxfont       = 2905;        (* max. storage available for a font *)

    maxloaded     = maxstrip;   (* smaller can prevent excess loading *)
    filling       = false;            (* fill in dots on line drawing *)
{}  nul           = (:0:);
{}  dc1           = (:17:);                   (* Ascii control chars. *)
{}  esc           = (:27:);
(*$s+ back to standard usage *)
    debuga        = false;                   (* virtual memory scheme *)

  TYPE
    afont         = ARRAY[1..maxfont] OF integer;

    striptr       = ^strip;
    strip         = RECORD
      empty         : boolean;
      data          : ARRAY[1..hdots] OF char;
      END; (* strip *)

  VAR
    vdots,                            (* total vertical dot positions *)
    peakloaded,                                 (* total memory usage *)
    stripsloaded  : integer;             (* count of strips in memory *)
    laststrip     : 1..maxstrip;         (* for virtual memory system *)
    stripctl      : ARRAY[1..maxstrip] OF striptr;  (* NIL if in file *)
    stripfile     : FILE OF strip;       (* virtual memory for strips *)
    bit           : ARRAY[1..stripdeep] OF integer;    (* translation *)
    xnow, ynow    : integer;                (* present "pen" position *)
    doubledots,                             (* count dots overwritten *)
    dotcount      : integer;                     (* count dots placed *)
    aspect        : real;            (* vertical/horizontal dots/unit *)
    font          : afont;       (* internal storage for Hershey font *)

  (* 1---------------1 *)

  PROCEDURE loadfont(VAR f : text);

    VAR
      i, chstart,
      hersheynum   : integer;
      ch           : char;

    BEGIN (* loadfont *)
    font[1] := 0; font[2] := 0;  (* default empty *)
    IF exists(f) THEN BEGIN
      writeln('Loading font');
      ch := 'A'; i := 0; chstart := 1;
      WHILE NOT ( eof(f) OR (ch = ' ') ) DO BEGIN
        chstart := succ(i);
        read(f, ch, ch, hersheynum, font[chstart+2], font[chstart+3]);
        font[succ(chstart)] := ord(ch); i := chstart+3;
        REPEAT
          IF (i - (chstart+3)) MOD 10 = 0 THEN readln(f);
          i := succ(i); read(f, font[i]);
        UNTIL abs(font[i]) >= 10000;
        readln(f); font[chstart] := succ(i); END;
      font[chstart] := 0; write(i : 1, ' integers in font'); END
    ELSE write('No font');
    writeln;
    END; (* loadfont *)

  (* 1---------------1 *)

  PROCEDURE keepstrip(n : integer);

    BEGIN (* keepstrip *)
{}  reposition(stripfile, pred(n));
    stripfile^ := stripctl[n]^; put(stripfile);
    stripctl[n] := NIL;    (* mark not in memory *)
    stripsloaded := pred(stripsloaded);
    END; (* keepstrip *)

  (* 1---------------1 *)

  PROCEDURE getstrip(n : integer);

    VAR
      i      : integer;
      margin : ARRAY[1..128] OF integer;
      (* a dummy, to ensure stack space remains after allocate *)
      (* This is over and above the systems built in margin.   *)

    BEGIN (* getstrip *)
    IF stripctl[n] = NIL THEN BEGIN  (* otherwise in memory *)
{}    IF stripsloaded < maxloaded THEN allocate(stripctl[n]);
      IF stripctl[n] = NIL THEN BEGIN (* no more memory available *)
        IF n > laststrip THEN BEGIN (* find space *)
          i := 1;
          WHILE stripctl[i] = NIL DO i := succ(i); END
        ELSE BEGIN
          i := maxstrip;
          WHILE stripctl[i] = NIL DO i := pred(i); END;
        IF debuga THEN writeln('Flushing ', i : 1, ' for ', n : 1);
        stripctl[n] := stripctl[i]; keepstrip(i); END;
{}    reposition(stripfile, pred(n));
      get(stripfile); stripctl[n]^ := stripfile^;
      stripsloaded := succ(stripsloaded);
      IF stripsloaded > peakloaded THEN peakloaded := stripsloaded; END;
    laststrip := n;
    END; (* getstrip *)

  (* 1---------------1 *)

  PROCEDURE plotopen;

    VAR
      i, j       : integer;

    BEGIN (* plotopen *)
    j := 1; vdots := maxstrip * stripdeep;
    FOR i := 1 TO 8 DO BEGIN  (* init printer dots translation *)
      bit[i] := j; j := j+j; END;

    (* init strip control array *)
    FOR i := 1 TO maxstrip DO stripctl[i] := NIL;
    new(stripctl[1]);
    stripsloaded := 1; peakloaded := 1; laststrip := 1;

    (* init stripfile to empty & prepare for random access *)
    (* uses PascalP random access procedures *)
    WITH stripctl[1]^ DO BEGIN
      empty := true;
      FOR i := 1 TO hdots DO data[i] := nul; END;
    rewrite(stripfile);
    FOR i := 1 TO maxstrip DO BEGIN
      stripfile^ := stripctl[1]^; put(stripfile); END;
{}  update(stripfile);           (* now initialized and random access *)

    xnow := 0; ynow := 0;                  (* position at bottom left *)
    dotcount := 0; doubledots := 0;
    aspect := vdpi / hdpi;                   (* correct hor/vert skew *)
    END; (* plotopen *)

  (* 1---------------1 *)

  FUNCTION onpage(x, y : integer) : boolean;

    BEGIN (* onpage *)
    onpage := (x >= 0) AND (x < hdots) AND
              (y >= 0) AND (y < vdots);
    END; (* onpage *)

  (* 1---------------1 *)

  PROCEDURE plotdot(x, y : integer);     (* plot 1 dot at x, y *)
  (* bottom left is (x, y) = (0,0).                            *)
  (* Past top right (x, y) = (hdots, maxstrip * stripdeep) *)

    VAR
      stripnum,
      deltay, n     : integer;

    BEGIN (* plotdot *)
    IF onpage(x, y) THEN BEGIN
      stripnum := maxstrip - (y DIV stripdeep);
      deltay := y MOD stripdeep; x := succ(x);        (* 1..hdots *)
      n := bit[succ(y MOD stripdeep)];
      getstrip(stripnum);
      WITH stripctl[stripnum]^ DO BEGIN        (* Now set the bit *)

(* Standard Pascal code *)
{       IF odd(ord(data[x]) DIV n) THEN      }
(* PascalP specific code *)
        IF odd(lsr(ord(data[x]), deltay)) THEN

          doubledots := succ(doubledots)
        ELSE data[x] := chr(ord(data[x]) + n);
        empty := false; END;
      dotcount := succ(dotcount); END;
    END; (* plotdot *)

  (* 1---------------1 *)

  PROCEDURE plotline(ink : boolean; x, y : integer);
  (* drawline from present location to (x, y) using ink *)

    VAR
      err,
      deltax, deltay,
      ix, iy,
      xend, yend      : integer;

    BEGIN (* plotline *)
    IF ink THEN (* check not totally off page *)
      IF NOT (((y < 0)      AND (ynow < 0)     ) OR
              ((y >= vdots) AND (ynow >= vdots)) OR
              ((x < 0)      AND (xnow < 0)     ) OR
              ((x >= hdots) AND (xnow >= hdots))) THEN BEGIN
        deltax := x - xnow; deltay := y - ynow;
        ix := xnow; iy := ynow; xend := x; yend := y;
        IF deltax < 0 THEN BEGIN (* so x always increasing *)
          ix := x; x := xnow; deltax := -deltax;
          iy := y; y := ynow; deltay := -deltay; END;
        IF deltay >= 0 THEN
          IF deltax >= deltay THEN BEGIN
{0..45}     err := -deltax DIV 2;
            FOR ix := ix TO x DO BEGIN
              plotdot(ix, iy); err := err + deltay;
              IF err > 0 THEN BEGIN
                iy := succ(iy); err := err - deltax;
                IF filling THEN plotdot(ix, iy); END;
              END;
            END
          ELSE BEGIN
{45..90}    err := -deltay DIV 2;
            FOR iy := iy TO y DO BEGIN
              plotdot(ix, iy); err := err + deltax;
              IF err > 0 THEN BEGIN
                ix := succ(ix); err := err - deltay;
                IF filling THEN plotdot(ix, iy); END;
              END;
            END
        ELSE BEGIN
          IF deltax >= -deltay THEN BEGIN
{-45..0}    err := -deltax DIV 2;
            FOR ix := ix TO x DO BEGIN
              plotdot(ix, iy); err := err - deltay;
              IF err > 0 THEN BEGIN
                iy := pred(iy); err := err - deltax;
                IF filling THEN plotdot(ix, iy); END;
              END;
            END
          ELSE BEGIN
{-90..-45}  err := deltay DIV 2;
            FOR iy := iy DOWNTO y DO BEGIN
              plotdot(ix, iy); err := err + deltax;
              IF err > 0 THEN BEGIN
                ix := succ(ix); err := err + deltay;
                IF filling THEN plotdot(ix, iy); END;
              END;
            END;
          END;
        x := xend; y := yend; END;
    xnow := x; ynow := y;
    END; (* plotline *)

  (* 1---------------1 *)

  PROCEDURE plotchar(ch : char; x, y : integer; (* start point for ch *)
                     compress,         (* < 1.0 squashes horizontally *)
                     height,    (* < 1.0 reduces char. size from font *)
                     angle : real); (* ccw radians, at which to write *)
                                    (* 0 is horizontal (normal),      *)
                                    (* pi is upside down r to left.   *)
  (* leaves "pen" positioned ready for next character.                *)

    CONST
      xstart       = 10;       (* the font letter base point *)
      ystart       = 35;

    VAR
      j     : integer;

    (* 2---------------2 *)

    PROCEDURE dostroke(coord : integer);
    (* interprets, handling size, compression, angle *)

      VAR
        ink          : boolean;
        xfont, yfont : real;

      BEGIN (* dostroke *)
      ink := coord >= 0; coord := abs(coord) MOD 10000;
      xfont := (coord DIV 100 - xstart) * height * compress;
      yfont := (coord MOD 100 - ystart) * height;
      plotline(ink, x + round(xfont * cos(angle)
                            - yfont * sin(angle)),
                    y + round(aspect * (yfont * cos(angle)
                                      + xfont * sin(angle))));
      END; (* dostroke *)

    (* 2---------------2 *)

    PROCEDURE drawchar(place : integer);
    (* scans the font specifications *)

      VAR
        coord,
        fontwidth,
        fontheight   : integer;

      BEGIN (* drawchar *)
      (* 0 is link, 1 is char *)
      fontheight := font[place+2]; fontwidth := font[place+3];
      place := place + 3;  (* 4 up are strokes *)
      REPEAT
        place := succ(place); coord := font[place]; dostroke(coord);
      UNTIL abs(coord) >= 10000;
      END; (* drawchar *)

    (* 2---------------2 *)

    BEGIN (* plotchar *)
    IF (ch = ' ') AND (font[2] <> 0) THEN     (* fake it *)
      dostroke(-100 * (font[3] + xstart) - ystart)
    ELSE BEGIN
      j := 1;
      WHILE (font[succ(j)] <> ord(ch)) AND (font[j] <> 0) DO
        j := font[j];
      IF font[succ(j)] = ord(ch) THEN drawchar(j) (* found descriptor *)
      ELSE BEGIN
        IF ch IN [' '..'~'] THEN write('''', ch, '''')
        ELSE write('<', ord(ch) : 1, '>');
        writeln('  not in font'); END;
      END;
    END; (* plotchar *)

  (* 1---------------1 *)

  PROCEDURE plotclose(VAR f : text);             (* write result to f *)

    CONST
      smax      = 250;       (* max allowable string length for write *)

    VAR
      i, j, k   : integer;

    BEGIN (* plotclose *)
    FOR i := 1 TO maxstrip DO
      IF stripctl[i] <> NIL THEN keepstrip(i);
    close(stripfile);           (* overkill, ensure random write done *)
    reset(stripfile);
  { write(f, dc1, dc1, esc, '@'); }            (* reset Epson printer *)
{}{ delay(1);                     }          (* let reset take effect *)
    write(f, esc, 'A', chr(8), chr(13));        (* 8 dot line spacing *)
    FOR i := 1 TO maxstrip DO BEGIN
      IF NOT stripfile^.empty THEN BEGIN
        write(f, esc, 'L', chr(hdots MOD 256), chr(hdots DIV 256));

        (* PascalP specific coding, strings cannot exceed 255 chars *)
        (* String writes are much faster than char by char writes.  *)
        FOR j := 0 TO pred(hdots DIV smax) DO
(*$s-,d- non-std, avoid range errors in last, field spec guards it *)
{}        write(f, stripfile^.data[succ(smax * j) FOR smax]);
        write(f,
{}           stripfile^.data[succ((hdots DIV smax) * smax) FOR smax]
(*$s+,d+*)         : hdots MOD smax); END;
      writeln(f);
      IF i < maxstrip THEN get(stripfile); END;
    END; (* plotclose *)
(*$x- restore input options, END of plotter module *)
Ž