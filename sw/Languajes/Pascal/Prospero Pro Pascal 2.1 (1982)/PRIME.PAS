PROGRAM prime(input,output);
{Eratosthenes Sieve Prime Number Program}

CONST
 size                   = 8190;
TYPE
 integer                =-32767..32767;
VAR
 flags                  :ARRAY[0..size] OF BOOLEAN;
 i,     prime,  k,
 count, iter            :INTEGER;
BEGIN
 writeln('10 iterations');
 FOR iter := 1 TO 10 DO                 {do program 10 times}
  BEGIN
   count := 0;                          {prime count}
   FOR i := 0 TO size DO
    flags[i] := true;                   {set flags all true}
   FOR i := 0 TO size DO
    IF flags[i]                         {found a prime}
    THEN BEGIN
          prime := i+i+3;               {twice the index + 3}
          {writeln(prime);}
          k := i + prime;               {first multiple to kill}
          WHILE k<=size DO
           BEGIN
            flags[k] := false;          {zero a non-prime}
            k := k + prime              {next multiple}
           END;
          count := succ(count);         {primes found}
         END;
  END;
  writeln(count,' primes')             {primes found in 10th pass}
END.
 