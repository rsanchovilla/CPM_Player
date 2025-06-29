
               A note to CP/M-80 muLISP-83 Users


     The 64K address space of the 8080 and Z80 microprocessors 
imposes a very severe restriction on the maximum size of LISP 
programs.  To ameliorate this problem two versions of the muLISP-83 
interpreter have been included on the muLISP Master Diskette:  a 
full feature version and a smaller, limited feature version.

     The file MULISP.COM contains all the primitive LISP functions 
and features as described in the muLISP-83 Reference Manual.  The 
only exception is the GCD (greatest common divisor) function.  If 
necssary, GCD can be defined as follows:

          (PUTD 'GCD '(LAMBDA (N M)
            ((AND (NUMBERP N) (NUMBERP M))
              (LOOP
                ((ZEROP M)
                  ((PLUSP N) N)
                  (MINUS N) )
                (SETQ M (REMAINDER N (SETQ N M))) ) )
            (NONNUMERIC 'GCD (LIST N M)) ))


     The file ML.COM is the limited feature version of the muLISP 
interpreter.  By pruning out some of the less used LISP functions, 
ML.COM provides more than 1K of additional memory for user defined 
functions and data.  muLISP-80 users will note that it contains 
essentially all the primitively defined functions provided in the 
'80 version of muLISP.  The following is a list of the functions and 
features that have been left out of ML.COM:

1.  List processing functions:  NTH, LCONC  (These functions can be 
    defined as shown in Chapter 5 of the manual).

2.  Numerical functions:  EVEN, GCD  (These functions can be defined 
    as shown in Chapter 5 of the manual).

3.  String functions:  SUBSTRING, FINDSTRING.

4.  Random file I/O functions:  READPTR, WRITEPTR.

5.  Read table function:  CHARTYPE  (The default read table, located 
    in the 8080 Base Page, can be modified manually).

6.  Read and splice macros  (The quote mark can still be used as an 
    abbreviation for QUOTE as described in Section 5.15 of the 
    manual).
 
7.  Hardware interface functions:  PORTIO, REGISTER, CALL.

8.  Apple II SoftCard graphics functions:  TEXT, GRAPHICS, PLOT, 
    PADDLE, BEEP.

9.  Comment function:  COMMENT  (This function can be defined as 
    shown in Section 5.15 of the manual).

10. Garbage collection statistics when RECLAIM is NIL (See Section 
    5.16 of the manual).

11. The "Are you sure (Y/N)?" confirmation query presented after 
    typing Ctrl-C or taking the "Restart" or "System" break option 
    (See Section 4.3 of the manual).


     Apple II SoftCard users, who have not already done so, may want 
to obtain a recently released software upgrade kit from Microsoft or 
your SoftCard dealer.  The upgrade provides a 60K CP/M system rather 
than a 56K system allowing 4K more memory for running muLISP.
