PROGRAM PRIMES;
(*$I+
 * THIS IS A DEMONSTATION PROGRAM TO GIVE AN EXAMPLE
 * OF HOW TO WRITE A PROGRAM IN PASCAL/Z
 * TO STOP THIS PROGRAM JUST TYPE CTRL-C
 *
 * TEST PROGRAM TO GET THE PRIME FACTORS OF NUMBERS 2..32767
 *)
 
 (*
  * DEFINE SOME VARIABLES
  *)
VAR  A: INTEGER;		(* NUMBER UNDER TEST *)
     PRIME: BOOLEAN;		(* IS PRESENT # A PRIME *)
     COUNT: INTEGER;		(* # OF PRIMES ALREADY FOUND *)
     PRIMES: ARRAY(. 1..5000 .) OF INTEGER;
PROCEDURE FACTOR( A: INTEGER );
     VAR   I,J,K:  INTEGER;
           DIVIDE:  BOOLEAN;	(* WAS DIVISION SUCCESSFUL *)
     BEGIN
           IF A < 4 THEN WRITE( A:1 ) (* #'S < 4 ARE PRIME *)
           ELSE BEGIN
                J := 1;
                REPEAT
                     J := J + 1;
                     K := PRIMES(. J .);
                     I := A DIV K;
                     DIVIDE := ( I * K = A )
                     UNTIL DIVIDE OR (I < K) OR (J = COUNT);
                IF DIVIDE THEN BEGIN
                     PRIME := FALSE;
                     FACTOR( I );
                     WRITE( '*',K:1 ) 
                     END
                ELSE WRITE( A:1 )
                END
           END;
(*
 * MAIN PROGRAM
 *)
     BEGIN
          COUNT := 1;			(* INITIALIZE COUNT *)
          FOR A := 2 TO 32767 DO BEGIN
               WRITE( A:5, ' = ' );
               PRIME := TRUE;
               FACTOR( A );
               IF PRIME THEN BEGIN
                    WRITE('*1            *****  PRIME  *****');
                    COUNT := COUNT + 1;
                    PRIMES(. COUNT .) := A
                    END;
               WRITELN(' ');
               END;
          WRITELN(' THERE WERE ', COUNT-1:1, ' PRIMES ' );
          END...........................