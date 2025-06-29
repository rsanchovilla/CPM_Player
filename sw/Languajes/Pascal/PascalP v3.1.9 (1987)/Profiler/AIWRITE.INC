  PROCEDURE aiwrite(VAR a : lineimage; VAR x : integer;
                    maxx : integer;
                    v : integer;   f : integer);
  (* equivalent to write, except destination is a[x] up    *)
  (* Note that the returned value of x is the location     *)
  (* of the last character written, to ensure bounds.      *)
  (* maxx is supplied to prevent exceeding array bounds    *)
  (* At some time a system procedure awrite(a, x, v:f)     *)
  (* which automatically supplies maxx and parses f        *)
  (* and calls one of aiwrite, acwrite, aswrite,           *)
  (* arwrite, or abwrite (integer, char, string, real,     *)
  (* boolean) will be created. Similar plans for the       *)
  (* system procedure aread(a,x,v).  Note that the         *)
  (* initial value of x can be checked by the compiler     *)
  (* against the declaration of a.                         *)

  (* Requires global declarations for lineimage, terminate *)

    VAR
      i, j, k, l : integer;
      magnitude  : real;
      negative   : boolean;

    BEGIN (* aiwrite *)
    negative := v < 0; k := ord(negative);
    IF NOT negative THEN v := -v; (* ensure -maxint-1 usable *)
    i := v; magnitude := 0.1;
    REPEAT (* find no. of significant digits *)
      k := succ(k); i := i DIV 10; magnitude := magnitude * 10.0;
    UNTIL i = 0;
    l := round(magnitude); (* magnitude of largest digit *)
    IF f < k THEN (* expand f to allow write *) f := k;
    IF pred(x + f) > maxx THEN BEGIN
      writeln('*** ERROR - aiwrite bounds violation');
      terminate; END;
    (* Now it is known that the result will fit in the array *)
    j := x + f - k;
    WHILE x < j DO BEGIN
      a[x] := ' '; x := succ(x); END;
    IF negative THEN BEGIN
      a[x] := '-'; x := succ(x); END;
    i := v; k := pred(x);
    REPEAT
      j := i DIV l; i := i - j*l; l := l DIV 10;
      k := succ(k); a[k] := chr(ord('0') - j);
    UNTIL l = 0;
    x := k;
    END; (* aiwrite *)

  (* 1------------------------------1 *)

|