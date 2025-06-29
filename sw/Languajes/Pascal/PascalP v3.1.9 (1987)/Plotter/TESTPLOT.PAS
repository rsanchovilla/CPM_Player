PROGRAM testplot(plotfile, fontfile, input, output);
(*$n-,d- no line numbers nor range checking *)

  CONST
    fontsize       = 2905;
    twopi          = 6.2831853;

  VAR
    fontfile,
    plotfile       : text;
    x, y           : integer;
    degrees        : integer;
    compress,
    charsize       : real;

  (* 1---------------1 *)

01000000(*$i'plotter.inc'*)
00019000
  (* 1---------------1 *)

  FUNCTION getxy(VAR x, y : integer) : boolean;

    BEGIN (* getxy *)
    prompt(' (blank separator) =? ');
    WHILE input^ = ' ' DO get(input);
    IF eof THEN getxy := false
    ELSE BEGIN
      readln(x, y); getxy := true; END;
    END; (* getxy *)

  (* 1---------------1 *)

  BEGIN (* testplot *)
  writeln('Testplot (plotfile, fontfile)');
  plotopen; loadfont(fontfile);
  writeln('Page size (x,y) is from (0,0) to (',
                pred(hdots) : 1, ',', pred(vdots) : 1, ')');

  prompt('Drawing border line 1');
  plotline(true, pred(hdots), 0);           prompt(' 2');
  plotline(true, pred(hdots), pred(vdots)); prompt(' 3');
  plotline(true, 0,           pred(vdots)); prompt(' 4');
  plotline(true, 0,           0);           writeln;

  charsize := 0.5; degrees := 0; compress := 1;
  WHILE charsize > 0 DO BEGIN
    writeln('At ', xnow : 1, ',', ynow : 1);
    prompt('Charsize (0 exits) =? ');
    IF NOT eoln THEN read(charsize);
    readln;
    IF charsize > 0 THEN BEGIN
      prompt('Horiz. compression factor =? ');
      IF NOT eoln THEN read(compress);
      readln;
      prompt('Start point x y ');
      IF getxy(xnow, ynow) THEN BEGIN
        prompt('Angle (degrees) =? ');
        IF NOT eoln THEN read(degrees);
        readln; degrees := degrees MOD 360; END
      ELSE charsize := 0; END;
    IF charsize > 0 THEN BEGIN
      prompt('drawing chars to eoln:');
      WHILE NOT eoln DO BEGIN
        plotchar(input^, xnow, ynow, compress, charsize,
                 degrees * twopi / 360);
        get(input); END;
      readln; END;
    END;

  writeln('Drawing test lines. Portions off page should be blanked');
  writeln; write('Initial x y');
  WHILE getxy(x, y) DO BEGIN
    plotline(false, x, y); write('Terminal x y');
    IF getxy(x, y) THEN BEGIN
      plotline(true, x, y); write('Initial x y'); END;
    END;

  writeln(peakloaded : 1, ' (max) storage strips in memory');
  writeln('Final position, x = ', xnow : 1, ', y = ', ynow : 1);
  writeln(dotcount : 1, ' dots, ', doubledots : 1, ' overwrites');

  writeln('Writing out plot');
  rewrite(plotfile); plotclose(plotfile);
  END. (* testplot *)
на