PROGRAM testprf(input, output);
(* test profiler subsystem, and demonstration *)
(* of profiler incorporation in application   *)

  LABEL 1; (* available to kill and dump profile *)

  CONST
    looplength = 1000;
    loopcount  = 20;

(* THIS following 3 lines added for profiler operation *)
    minln      = 20;
    maxln      = 500;
    profileit  = true; (* false suppresses all profiler code *)

  VAR
    i, j       : integer;

  (* 1-------------1 *)

  PROCEDURE junkproc;
  (* part of application program.  Used in demo so that *)
  (* some interrupts will be at different line numbers  *)

    VAR
      k   : integer;

    BEGIN (* junkproc *)
    k := 2 * 3; (* wasting time here *)
    END; (* junkproc *)

  (* 1-------------1 *)

(* force the include files line numbers up out of range *)
09000000(*$i'profiler.inc'*)    (* THIS inclusion is required *)
00036000(* and restore the basic source file line number sequence *)

  BEGIN (* testprf *)
  (* unprofiled initialization code executed here *)

(* THIS is the added line to start profiling *) 
  IF profileit THEN initprofiler(storeptr, eventcount);

  (* Now all code until "stoptimer" call is profiled *)
  (* Do not "release" to any marker formed before    *)
  (* the "initprofiler" call until "dumprofile" has  *)
  (* been executed.                                  *)
  FOR i := 1 TO loopcount DO BEGIN
    writeln(i);
    FOR j := 1 TO looplength DO
      junkproc;
      END;
1:
  IF profileit THEN stoptimer; (* callable in any procedure *)
  (* unprofiled termination code executed here *)

(* THIS line needed to keep the results *)
  IF profileit THEN dumprofile(storeptr);

  (* More unprofiled termination code executed here *)
  END. (* testprf *)
