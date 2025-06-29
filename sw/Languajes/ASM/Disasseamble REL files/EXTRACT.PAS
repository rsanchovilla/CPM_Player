
MODULE extract_cmd;
{   
    Extracts first and second file-names from the
    "command tail".

    Written by:

    Ronald E. Bruck
    Department of Mathematics
    University of Southern California
    Los Angeles, CA  90089
}

CONST
   space = ' ';

TYPE
   ptrstring = ^STRING;

EXTERNAL FUNCTION @cmd : ptrstring;

{$E- : private }
PROCEDURE strip_leading_blanks ( VAR s : STRING ) ;
BEGIN
   WHILE ( POS ( space, s ) = 1 ) DO
      DELETE ( s, 1, 1 ) ;
END;

{$E+ : public}
PROCEDURE xtrct_cmd ( VAR first_id, second_id : STRING ) ;
VAR
   m,
   n   : INTEGER;
   ptr : ptrstring;
   ch  : CHAR;
BEGIN
   ptr := @cmd;
   first_id := ptr^;
   strip_leading_blanks ( first_id ) ;
   n := POS ( space, first_id );
   IF n = 0
      THEN
         second_id := ''
      ELSE
         BEGIN
            m := LENGTH ( first_id ) - n + 1;
            second_id := COPY ( first_id, n, m );
            DELETE ( first_id, n, m ) ;
            strip_leading_blanks ( second_id ) ;
         END;
END;

MODEND.
