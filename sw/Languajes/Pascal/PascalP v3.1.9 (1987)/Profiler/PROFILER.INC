(* Ver 2.0 - independant operator interaction files          *)
(* Ver 1.9 - using h+ option for global declarations, for    *)
(*           PascalP 3.1.5 up only.  Avoids extra writing    *)

(* This subsystem allows run-time profiling of Pascal or of  *)
(* assembly language programs (e.g. PCD interpreter) on      *)
(* CPM computer systems.   It is dependant on the specific   *)
(* hardware installed, i.e. the interval timer which creates *)
(* a periodic interrupt, and on installation of the profile  *)
(* intrinsic routines.  The latter examines the current line *)
(* number (for Pascal) or PC value (for 8080 assy), and      *)
(* increments the appropriate location in the record pointed *)
(* to by "storeptr".  Note that Pascal programs must be com- *)
(* piled with the N+ option to use this system, and that     *)
(* memory must be available to create the storeptr^ RECORD   *)
(* in the heap.  The intrinsic "stoptimer" halts operation.  *)
(* Final data output is to file "PROFDATA", and there is no  *)
(* user control of this file name.  If the profiled program  *)
(* desires it may compare "eventcount" against the value of  *)
(* "storeptr.events", and decide to terminate profiling at   *)
(* an appropriate point.                                     *)

(* For assy, location counter is right shifted by squeeze    *)
(* (thus truncating) before indexing into the storage array  *)
(*                                                           *)
(* REQUIRES global declarations for:                         *)
(*                                                           *)
(*    CONST                                                  *)
(*      minln        = ????;                                 *)
(*      maxln        = ????;                                 *)
(*      profileit    : boolean; {allow code suppression}     *)
(*                                                           *)

(*$x+,h+ allowing injected global variables *)
    TYPE
      storagep     = ^pstorage;
      pstorage     = RECORD
        squeeze      : integer;
        minline      : integer;
        maxline      : integer;
        events       : integer;
        data         : ARRAY[minln..maxln] OF integer;
        END;
(* minline and maxline allow the intrinsic to know           *)
(* the declared limits for data.  The initializing           *)
(* code must set these values before startprofiler is called *)
(*                                                           *)
(* eventcount allows for termination of continuous programs  *)
(*                                                           *)
    VAR
      eventcount    : integer;
      storeptr      : storagep;
(*$x-                                                        *)
(* For a usage example see PROGRAM testprf                   *)

{ PROCEDURE startprofiler(interval : integer;   (* time, millisec *) }
{                         where    : storagep); (* store results *)  }
  (* interval actually consists of two single byte modula,   *)
  (* packed together.  Each is in the range 1 to 256, with 0 *)
  (* representing 256.  The product of the two is the actual *)
  (* time interval, in 5 millisecond units.  See above for   *)
  (* global types required.  Cannot be used simultaneously   *)
  (* with "startinttimer", since hardware is identical.      *)

  (* 1----------------1 *)

  PROCEDURE initprofiler(VAR storeptr : storagep;
                         VAR eventcount : integer);
  (* enter and leave with readln executed, but no  *)
  (* referances to eof, eoln, input^ made to force *)
  (* actual physical input from the next line.     *)

    LABEL 100;

    CONST
      version    = '2.0';
      confilein  = 'CON ';  (* for access to console on startup *)
      confileout = 'CON ';

    VAR
      interval,
      i, m       : integer;
      ch         : char;
      query,               (* needed to ensure access to console *)
      con        : text;   (* when input/output redirected       *)

    (* 2----------------2 *)

    FUNCTION getvalue(default, min, max : integer) : integer;
    (* enter and leave with readln executed, but no  *)
    (* referances to eof, eoln, input^ made to force *)
    (* actual physical input from the next line.     *)

      VAR
        val    : integer;
        bad    : boolean;

      BEGIN (* getvalue *)
      IF profileit THEN BEGIN (* else suppress all code *)
        prompt(query, ' (default ', default:1, ')=?');
        getvalue := default;
        REPEAT
          IF eoln(con) THEN BEGIN (* leave default *)
            bad := false; readln(con); END
          ELSE BEGIN
            bad := readx(con, val); readln(con);
            bad := bad OR (val > max) OR (val < min);
            IF bad THEN
              prompt(query, min:1, '..', max:1, ', re-enter ?')
            ELSE getvalue := val; END;
        UNTIL NOT bad; END;
      END; (* getvalue *)

    (* 2----------------2 *)

    BEGIN (* initprofiler *)
    IF profileit THEN BEGIN (* can suppress all code *)
(*$x+,s- non-standard here *)
      reset(con, confilein); rewrite(query, confileout);
(*$x- restore option settings *)
      writeln(query);
      storeptr := NIL; (* in case suppressed *) eventcount := 0;
      writeln(query, 'Profiler subsystem V ', version);
100:  prompt(query, 'Machine or Pcode(m/p) profile (cr inhibits)?');
      IF eoln(con) THEN BEGIN (* profile suppressed *)
        IF storeptr <> NIL THEN release(storeptr);
        readln(con); storeptr := NIL; END
      ELSE BEGIN
        readln(con, ch);
        IF storeptr = NIL THEN new(storeptr);
        WITH storeptr^ DO BEGIN
          (* setting the defaults *)
          (* -16 < squeeze <= -1 defines Assy language profile *)
          (* squeeze=0 defines Pascal profile                  *)
          (* later squeeze > 0 squeezes lines as above, and    *)
          (* squeeze DIV 16, if > zero, selects segments.      *)
          IF NOT (ch IN ['m','M','p','P']) THEN BEGIN
            writeln(query, 'Illegal response'); GOTO 100; END
          ELSE IF (ch IN ['p','P']) THEN squeeze := 0
          ELSE BEGIN (* machine code initialization *)
            prompt(query, 'bit count to shift off');
            squeeze := getvalue(1, 1, 14);
            m := lsl(1, squeeze); squeeze := -squeeze; END;
          writeln(query, 
             'single cr''s use default values, entries decimal');
          prompt(query, 'Sample interval in 0.1 sec. units');
          interval := getvalue(1, 1, 127);
          prompt(query, 'Events to record');
          eventcount := getvalue(1000, 100, maxint);
          IF squeeze < 0 THEN (* machine code profile *)
            writeln(query, 'Following limits will be multiplied by ',
                     m : 1, ' at execution');
          prompt(query, 'minline to profile');
          minline := getvalue(minln, 1, maxint);
          prompt(query, 'maxline to profile');
          maxline := getvalue(minline-minln+maxln,
                              succ(minline), minline-minln+maxln);
          (* now the profiler thinks data is array[minline..maxline] *)
          (* corrections have to be performed in dumping             *)
          FOR i := minln TO maxln DO data[i] := 0;
          events := 0;
          startprofiler(256*interval+20, storeptr); END;
        END;
      (* leave with readln executed *) END;
    END; (* initprofiler *)

  (* 1----------------1 *)

  PROCEDURE dumprofile(from : storagep);

    CONST
      perline  = 5;
      profdata = 'PROFDATA '; (* id of storage file *)

    VAR
      offset,
      i, j        : integer;
      f           : text;

    BEGIN (* dumprofile *)
    IF profileit THEN
      IF from <> NIL THEN BEGIN
        stoptimer; (* insurance *)
(*$s-*) rewrite(f, profdata);
(*$s+*) WITH from^ DO BEGIN
          offset := minline-minln;
          writeln(f, squeeze:7, ':', events :6);
          (* squeeze is 0 for Pascal profiles *)
          j := 0;
          FOR i := minln TO maxln DO BEGIN
            IF data[i] <> 0 THEN BEGIN
              IF j >= perline THEN BEGIN
                writeln(f); j := 1; END
              ELSE j := succ(j);
              write(f, i + offset : 7, ':', data[i] : 6); END;
            END;
          (* system fclose appends final eoln *) END;
        writeln('Profile stored in textfile ', profdata); END;
    END; (* dumprofile *)
(*$x- restore options *)

  (* 1----------------1 *)

ñ^