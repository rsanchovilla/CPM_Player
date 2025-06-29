  PROCEDURE settimer(conditional : boolean);
  (* sets time if date 0/0/0 or if conditional=false  *)
  (* Allows entries of the form "hr:min" and "y/m/d"  *)
  (*   when intermediate prompts are avoided.         *)
  (* Note side effects of readx and getvalue funcs.   *)

    LABEL 1, 2;

    VAR
      i, hr, min : integer;
      ch         : char;
      d          : ARRAY[0..2] OF integer;
      dl         : PACKED ARRAY[1..15] OF char;

    (* 2--------------2 *)

    FUNCTION getvalue(VAR v : integer; min, max : integer) : boolean;
    (* input a value in range, terminate on eof. signal any error *)

      VAR
        ok    : boolean;

(*$x+,p+ Non-standard std. procedures used *)
      BEGIN (* getvalue *)
      IF eof THEN terminate;
      IF readx(v) THEN ok := false
      ELSE ok := (v >= min) AND (v <= max);
      IF NOT ok THEN BEGIN
        readln; writeln('Invalid'); END;
      getvalue := ok;
      END; (* getvalue *)

    (* 2--------------2 *)

    FUNCTION notswallow(ch : char) : boolean;

      BEGIN (* notswallow *)
      IF input^ = ch THEN BEGIN
        get(input); notswallow := false; END
      ELSE notswallow := true;
      END; (* notswallow *)

    (* 2--------------2 *)

    BEGIN (* settimer *)
    i := 0; dateget(d);
    IF conditional THEN (* check if timer already set *)
      WHILE conditional AND (i < 3) DO BEGIN
        conditional := d[i] = 0; i := succ(i); END
    ELSE conditional := true;
    (* now sense of conditional is reversed *)
    IF conditional THEN BEGIN (* date=0/0/0, not set *)
      REPEAT
   1:   prompt('year(0..99)=?');
        IF getvalue(i, 0, 99) THEN d[2] := i
        ELSE GOTO 1;
        IF notswallow('/') THEN BEGIN
          readln; prompt('month(1..12)=?'); END;
        IF getvalue(i, 1, 12) THEN d[1] := i
        ELSE GOTO 1;
        IF notswallow('/') THEN BEGIN
          readln; prompt('day(0..99)=?'); END;
        IF getvalue(i, 1, 31) THEN d[0] := i
        ELSE GOTO 1;
        dateset(d);
   2:   prompt('hour(0..23)=?');
        IF getvalue(i, 0, 23) THEN hr := i
        ELSE GOTO 2;
        IF notswallow(':') THEN BEGIN
          readln; prompt('min(0..59)=?'); END;
        IF getvalue(i, 0, 59) THEN min := i
        ELSE GOTO 2;
        readln;
        timeset(hr, min);
        dater(dl);
        (* check actual time returned, allows for *)
        (* systems that forbid altering master timer *)
        (* eg HP3000 *)
        IF dl[10] = ' ' THEN hr := 0
        ELSE hr := 10*(ord(dl[10])-ord('0'));
        hr := hr + (ord(dl[11])-ord('0'));
        write(dl);
        IF hr < 12 THEN write('(AM)')
        ELSE write('(PM)');
        prompt(' Correct(y/n)?'); readln(ch);
      UNTIL (ch IN ['Y', 'y']); END;
    END; (* settimer *)
(*$x- restore options *)

  (* 1--------------1 *)

p±