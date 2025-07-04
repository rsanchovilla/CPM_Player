PROGRAM primes(input,output);
{Computes primes up to a given limit,
 using the "sieve of Eratosthenes" }
CONST
  maxnumber = 32767;
  maxhalf = 16383;  {maxnumber DIV 2}
TYPE
  number = 1..maxnumber;
  half = 1..maxhalf;
VAR
  count,factor,maxfactor,limit,nonprime: number;
  index,halflimit: half;
  primeflags: ARRAY [half] OF boolean;
BEGIN
  REPEAT
    writeln('Upper limit = ?');
    readln(limit);
  UNTIL (1 <= limit) AND (limit <= maxnumber);
  halflimit := pred(limit) DIV 2;
  FOR index := 1 TO halflimit DO primeflags[index] := true;
  {If a number is composite, at least one of its factors is
   less than or equal to its square root, so: }
  maxfactor := round(sqrt(limit));
  count := 2;  {count of primes: 1 and 2 are the first two}
  factor := 1;  {first actual factor used will be 3}
  FOR index := 1 TO halflimit DO
    BEGIN
      factor := factor + 2;  {i.e. factor := 2*index + 1}
      IF primeflags[index] THEN
        {A new prime has been found }
        BEGIN  count := succ(count);
          {If necessary, cross out all its multiples}
          IF factor <= maxfactor THEN
            BEGIN  nonprime := index + factor;
              WHILE nonprime <= halflimit DO
                BEGIN
                  primeflags[nonprime] := false;
                  nonprime := nonprime + factor;
                END {WHILE};
            END;
         {writeln(factor);}      {omitted for timing}
        END {IF};
    END {FOR};
  writeln('Number of primes up to ',limit,' = ',count);
END.

 