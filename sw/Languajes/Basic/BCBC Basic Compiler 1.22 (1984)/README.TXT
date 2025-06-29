Added information for BCBC users:

     There are some undocumented features in BCBC.
Unfortunately, these features were added after the
manual was written, or were overlooked while writing
the manual.  Sorry!
     You may include the whole library (all functions)
by including a line in your BASIC program that reads
#ALL
     You may include a selected library routine with
the preprocessor directive #INCLUDE N, where N is the
number of the routine to include.
     You may insert assembler code directly in the
body of your program with the directive
#ASM
which must be all alone on a line (the line need not
be numbered).  All lines following this directive will
be passed through without parsing or translation until
a line containing the directive
#ENDASM
is encountered.  #ENDASM should also be on its own line.
The assembler routine can be called as a subroutine, or
may be the object of a GOTO.  Please let me know of any
bugs in BCBC!

Bruce Tonkin
6/1/84
