PROGRAM testunsigned(input, output);
(* Test PascalP 3.1.9 std. procedures UADD, USUB, UMULT, UDIV  *)
(* UCOMPARE and demonstate the GETMEM, STRINGCP (compare),     *)
(* LENGTH and string read facilities. All new PascalP features *)
(* are ISO standard compatible, in that their usage can be     *)
(* replaced by procedures written in standard Pascal, at the   *)
(* expense of efficiency.  Main programs need not be changed.  *)
(*   C.B. Falconer, 87/01/08      (203) 281-1438               *)

  CONST
    maxstring    = 80;
    xmaxstring   = 81;       (* maxstring + 1, for end marker *)
(*$s- non-standard usage *)
    eostring     = (:0:);    (* use chr(0) in standard Pascal *)
(*$s+*)

  TYPE
    unsigned     = integer;
    string       = ARRAY[1..xmaxstring] OF char;
    stringp      = ^string;

  VAR
    u1, u2, u3   : unsigned;
    line         : string;    (* input buffer *)
    p1, p2       : stringp;   (* pointers to strings in heap *)
    icmp         : -1..+1;    (* results of string compares *)

  (* 1---------------1 *)

  PROCEDURE wrtunsigned(VAR f : text; n : unsigned; fld : integer);
  (* Acts just like std Pascal write(f, integer : fld) procedure *)

    (* 2---------------2 *)

    PROCEDURE writeout(n : unsigned);

      BEGIN (* writeout *)
      IF n <> 0 THEN BEGIN
        writeout(udiv(n, 10));
        write(chr(usub(n, umult(udiv(n, 10), 10)) + ord('0'))); END;
      END; (* writeout *)

    (* 2---------------2 *)

    BEGIN (* wrtunsigned *)
    IF n >= 0 THEN write(f, n : fld)  (* no special handling *)
    ELSE BEGIN
      IF fld > 5 THEN write(f, ' ' : fld-5);
      writeout(n); END;
    END; (* wrtunsigned *)

  (* 1---------------1 *)

  PROCEDURE rdunsigned(VAR f : text; VAR u : unsigned);
  (* Acts just like standard Pascal read(f, integer) procedure *)

    BEGIN (* rdunsigned *)
    WHILE f^ = ' ' DO get(f);  (* skipping eolns also *)
    u := 0;
    IF (f^ IN ['0'..'9']) THEN
      REPEAT
        u := uadd(umult(u, 10), ord(f^) - ord ('0')); get(f);
      UNTIL NOT (f^ IN ['0'..'9'])
    ELSE BEGIN
      writeln('Illegal char - RDUNSIGNED'); terminate; END;
    END; (* rdunsigned *)

  (* 1---------------1 *)

  PROCEDURE save(VAR ln : string; VAR p : stringp);
  (* saving a string, with no wasted memory. If you copy *)
  (* too much of the string over you will cause crashes. *)

    BEGIN (* save *)
    getmem(p, succ(length(ln)));  (* 1 extra for end marker *)
    IF p <> NIL THEN moveto(p^, ln, succ(length(ln)))
    ELSE BEGIN
      writeln('Heap overflow'); terminate; END;
    END; (* save *)

  (* 1---------------1 *)

  BEGIN (* testunsigned *)
  writeln('Enter 2 lines, of any text');

  readln(line); save(line, p1);  (* line is nul padded *)
  readln(line); save(line, p2);

  icmp := stringcp(p1^, p2^);
  write(p1^ : length(p1^));
  IF icmp < 0 THEN write(' < ')
  ELSE IF icmp = 0 THEN write (' = ')
  ELSE (* > 0 *) write(' > ');
  writeln(p2^ : length(p2^));

  dispose(p1); dispose(p2);  (* you can give up the memory *)

  writeln;
  writeln('Enter numeric unsigned pairs, space or <cr> separators');
  writeln('CTL-Z at line left terminates');
  WHILE NOT eof DO BEGIN
    rdunsigned(input, u1); rdunsigned(input, u2); readln;

    u3 := uadd(u1, u2);
    writeln('u1' : 10, 'u2' : 10, 'sum' : 10, 'diff' : 10,
                                  'prod' : 10, 'quotient' : 10);
    icmp := ucompare(u1, u2);
    wrtunsigned(output, u1, 10);
    IF icmp < 0 THEN write(' < ')
    ELSE IF icmp = 0 THEN write (' = ')
    ELSE (* > 0 *) write(' > ');
    wrtunsigned(output, u2, 7);
    wrtunsigned(output, u3, 10);
    wrtunsigned(output, usub(u1, u2), 10);
    wrtunsigned(output, umult(u1, u2), 10);
    wrtunsigned(output, udiv(u1, u2), 10);
    writeln; END;
  END. (* testunsigned *)
”•