PROGRAM MANDELBROT ( OUTPUT );

(*$I GR.PAS *)

VAR  X, Y, X_ALT, Y_ALT, RE_C, IM_C, DC : REAL;
     K, L, N : INTEGER;

BEGIN
  GRAPHIC;
  COLOR ( WHITE );
  DC := 3 / 230;
  FOR K := 0 TO 230 DO
    BEGIN
      RE_C := -2.25 + K * DC;
      FOR L := 0 TO 95 DO
        BEGIN
          IM_C := L * DC;
          X := 0;  Y := 0;
          N := 0;
          REPEAT
            X_ALT := X;  Y_ALT := Y;
            X := SQR( X_ALT ) - SQR ( Y_ALT ) + RE_C;
            Y := 2 * X_ALT * Y_ALT + IM_C;
            N := N + 1;
          UNTIL ( N > 100 ) OR ( ( SQR( X ) + SQR( Y ) ) > 100 );
          IF ( N > 100 ) THEN
(* IF ( N > 100 ) OR ( ( N < 11 ) AND ( N MOD 2 = 0 ) ) THEN *)
                         BEGIN
                           PLOT ( K, 95 + L );
                           PLOT ( K, 95 - L )
                         END
        END
    END;
   WHILE NOT KEYPRESSED DO;
END.

