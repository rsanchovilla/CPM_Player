Allows run-time execution profiling of Pascal programs

This system has been upgraded to match the PascalP 3.1.9 release,
where interpreters show library version 2.6.2 when run with parm=1

     runpcd progname [1]

(and progname may be omitted if PCDHELP.PCD is on line).

To avoid confusion, I am now including a pre-patched version of
RUNPCDP for systems with no timers.  Read the documentation etc.
if you have a timer that can generate a periodic interrupt.

DO NOT use RUNPCDP as your general system, the faked timer 
interrupt slows it down by about 10%.

For a simple demonstration execute:

  runpcdp testprf         (take the default responses, EXCEPT answer)
                          (P to the "machine or pcode profile" prompt)
                          (and wait till it completes 20 cycles)
  runpcdp plotprof        (or "runpcdp plotprof (,con)")
  type outfile            (you can use runpcd for plotprof)

which will show a large peak in execution time at line 51, with a
small peak at lines 29 and 30.  More detailed data will be left in
"profdata", which can be typed.  You can also read the file
TESTPRF.PAS, whose execution has just been profiled.

C.B. Falconer, 87/01/10
ö