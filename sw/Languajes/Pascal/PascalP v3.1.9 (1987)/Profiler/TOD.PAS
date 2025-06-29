PROGRAM tod(input, output);
(* simplified from SETTIMER.INC *)

(*$n-,d-,p+*)
(* Allows entries of the form "hr:min" and "y/m/d"  *)
(*   when intermediate prompts are avoided.         *)
(* Note side effects of readx and getvalue funcs.   *)

  LABEL 1, 2;

  VAR
    i, hr, min : integer;
    ch         : char;
    d          : ARRAY[0..2] OF integer;
    dl         : PACKED ARRAY[1..15] OF char;

  (* 1--------------1 *)

  FUNCTION getvalue(VAR v : integer; min, max : integer) : boolean;
  (* input a value in range, terminate on eof. signal any error *)

    VAR
      ok    : boolean;

    BEGIN (* getvalue *)
    IF readx(v) THEN ok := false
    ELSE ok := (v >= min) AND (v <= max);
    IF NOT ok THEN BEGIN
      readln; writeln('Invalid'); END;
    getvalue := ok;
    END; (* getvalue *)

  (* 1--------------1 *)

  FUNCTION notswallow(ch : char) : boolean;

    BEGIN (* notswallow *)
    IF input^ = ch THEN BEGIN
      get(input); notswallow := false; END
    ELSE BEGIN 
      notswallow := true; readln; END;
    END; (* notswallow *)

  (* 1--------------1 *)

  BEGIN (* tod *)
  i := 0;
  REPEAT
 1: prompt('year(0..99)=?');
    IF getvalue(i, 0, 99) THEN d[2] := i
    ELSE GOTO 1;
    IF notswallow('/') THEN prompt('month(1..12)=?');
    IF getvalue(i, 1, 12) THEN d[1] := i
    ELSE GOTO 1;
    IF notswallow('/') THEN prompt('day(0..99)=?');
    IF getvalue(i, 1, 31) THEN d[0] := i
    ELSE GOTO 1;
    dateset(d);
    IF eoln THEN (* illegal label use *)
2:   prompt('hour(0..23)=?');
    IF getvalue(i, 0, 23) THEN hr := i
    ELSE GOTO 2;
    IF notswallow(':') THEN prompt('min(0..59)=?');
    IF getvalue(i, 0, 59) THEN min := i
    ELSE GOTO 2;
    readln;
    timeset(hr, min);
    dater(dl);
    (* check actual time returned, allowing for systems *)
    (* that forbid altering master timer, eg HP3000     *)
    write(dl);
    prompt(' Correct(y/n)?'); readln(ch);
  UNTIL (ch IN ['Y', 'y']);
  END. (* tod *)
ƍ