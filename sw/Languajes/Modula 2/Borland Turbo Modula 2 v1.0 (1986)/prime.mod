(*********************************************************************)
(*                  The Sieve Benchmark                              *)
(*                                                                   *)
(*  Compile with test, overflow switches off and native code on.     *)
(*                                                                   *)
(*********************************************************************)
MODULE prime;

CONST
  size = 8190;

VAR
  flags : ARRAY [ 0 .. size ] OF BOOLEAN;
  i, prime, k, count, iter : CARDINAL;
  ch : CHAR;

BEGIN
  WRITELN("10 iterations");
  WRITELN("Type Return"); READLN(ch);
  FOR iter := 1 TO 10 DO
    count := 0;
    FOR i := 0 TO size DO flags[i] := TRUE END;
    FOR i := 0 TO size DO
      IF flags[i] THEN
        prime := i + i + 3;
        k := i + prime;
        WHILE k <= size DO
          flags[k] := FALSE;
          k := k + prime;
        END;
        count := count + 1;
      END;
    END;
  END;
  WRITELN( count, " primes" );
END prime.
                                                                                             