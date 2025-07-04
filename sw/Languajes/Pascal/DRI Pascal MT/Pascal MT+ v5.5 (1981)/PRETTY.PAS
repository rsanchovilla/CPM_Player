(*  VERSION 0044 *)

(* 5.5 STARTS WITH VERSION 44 *)

MODULE PRETTYPRINT;


(*$I PPTYPES*)

(*$I PPGLBLS*)
(*$E-*)
VAR
  CH : CHAR;
(*$E+*)

EXTERNAL PROCEDURE GETSYMBOL(VAR NEXTSYM, CURRSYM : SYMBOLINFO);
EXTERNAL PROCEDURE INSERTCR ( VAR CURRSYM : SYMBOLINFO);
EXTERNAL PROCEDURE INSERTBLANKLINE( VAR CURRSYM : SYMBOLINFO);
EXTERNAL PROCEDURE LSHIFTON(DINDENTSYMBOLS : KEYSYMSET);
EXTERNAL PROCEDURE LSHIFT;
EXTERNAL PROCEDURE INSERTSPACE(VAR SYMBOL : SYMBOLINFO);
EXTERNAL PROCEDURE PPSYMBOL(CURRSYM : SYMBOLINFO);
EXTERNAL PROCEDURE GOBBLE (TERMINATORS : KEYSYMSET;
                           VAR CURRSYM, NEXTSYM : SYMBOLINFO);
EXTERNAL PROCEDURE INITIALIZE;
EXTERNAL PROCEDURE RSHIFT(CURRSYYM : KEYSYMBOL);
EXTERNAL PROCEDURE RSHIFTTOCLP(CURRSYM : KEYSYMBOL);
EXTERNAL PROCEDURE PUTLN;
PROCEDURE PRETTY;     (* FOR NOW *)
VAR
  I : INTEGER;

BEGIN (* MAIN PROGRAM *)
  FOR I := 1 TO 24 DO
    WRITELN;    (* POOR MAN'S CLEAR SCREEN *)

  WRITELN('Pascal/MT+ 5.5');
  WRITELN('Program reformatting utility');
  WRITELN('Available memory for expansion = ',BUFSZ-ENDFILE+1,' bytes');
  IF BUFSZ-ENDFILE+1 < 512 THEN
    BEGIN
      REPEAT
        WRITELN('You do not have much expansion space,  Type E now if you');
        WRITELN('have not saved (updated) your file recently and you wish');
        WRITELN('to do so before you possibly lose it! E)xit or C)ontinue:');
        READLN(CH)
      UNTIL CH IN ['E','e','C','c'];
      IF CH IN ['E','e'] THEN
        EXIT
    END;
  WRITE('Formatting');

  GBL_OOPS := FALSE;

  DSTCURSOR := 2+(BUFSZ-ENDFILE);

  MOVERIGHT(BUF[2],BUF[DSTCURSOR],ENDFILE-1);
  (* SHIFT ENTIRE BUFFER UP TO HIGH AREA OF BUFFER *)


  CURSOR := DSTCURSOR;  (* WHERE TO READ FROM *)
  ENDFILE := bufsz+4;
  DSTCURSOR := 2;       (* WHERE TO WRITE TO  *)

  LASTLINE := 0;

  INITIALIZE;

  CRPENDING := FALSE;
  WHILE NEXTSYM{^}.NAME <> ENDOFFILE DO
    BEGIN
      IF GBL_OOPS THEN
        BEGIN
          WRITELN;
          WRITELN('I warned you, the new and old data has collided');
          WRITELN('and the source text in the buffer has been lost');
          WRITELN('Type <ret> to return to the supervisor');
          READLN;
          EXIT
        END;

      GETSYMBOL(NEXTSYM,CURRSYM);
      WITH PPOPTION[CURRSYM{^}.NAME] DO
        BEGIN

          IF (CRPENDING AND NOT(CRSUPPRESS IN OPT))
            OR (CRBEFORE IN OPT) THEN
            BEGIN
              INSERTCR(CURRSYM);
              CRPENDING := FALSE
            END;

          IF BLANKLINEBEFORE IN OPT THEN
            BEGIN
              INSERTBLANKLINE(CURRSYM);
              CRPENDING := FALSE
            END;

          IF DINDENTONKEYS IN OPT THEN
            LSHIFTON(DINDENTSYMBOLS);

          IF DINDENT IN OPT THEN
            LSHIFT;

          IF SPACEBEFORE IN OPT THEN
            INSERTSPACE(CURRSYM);

          PPSYMBOL(CURRSYM);
          IF SPACEAFTER IN OPT THEN
            INSERTSPACE(NEXTSYM);

          IF INDENTBYTAB IN OPT THEN
            RSHIFT(CURRSYM{^}.NAME);

          IF INDENTTOCLP IN OPT THEN
            RSHIFTTOCLP(CURRSYM{^}.NAME);

          IF GOBBLESYMBOLS IN OPT THEN
            GOBBLE(GOBBLETERMINATORS,CURRSYM,NEXTSYM);

          IF CRAFTER IN OPT THEN
            CRPENDING := TRUE
        END
    END;
  IF CRPENDING THEN
    PUTLN;

  PUTLN;
  ENDFILE := DSTCURSOR-1;       (* THE END! *)
  IF BUF[ENDFILE-1] <> CHR(13) (* linefeed *) THEN
    BEGIN
      BUF[ENDFILE] :=   CHR(13);
      BUF[ENDFILE+1] := CHR(10);
      ENDFILE := ENDFILE + 1
    END;
  CBP := ENDFILE + 1;           (* NO MORE COPY BUFFER *)
  LASTLINE := LASTLINE - 1;     (* FUDGE IT APPROPRIATELY *)
END;

MODEND.

