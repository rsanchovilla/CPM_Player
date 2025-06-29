(Retrieved from CrompuPro Disk)

Microsoft MS-COBOL Compiler
Release 4.67 Update Notice
October 17, 1983


          The MS-COBOL compiler for the 8080  microprocessor
     release   4.67   contains   several   enhancements  and
     corrections to the previous release, 4.66.

Enhancements

     **   The decimal to  binary  conversion  algorithm  has
          been   altered,   so   that  in  cases  where  the
          conversion overflows, the result is  the  original
          number,   with  the  offending  high-order  digits
          truncated  off.  For  example,  64123   would   be
          converted to 4123, with overflow.

     **   A limitation that existed in the size of  an  item
          subordinate  to an OCCURS clause has been removed.
          (Previous size limit was 2048 bytes).

     **   The maximum number of files that can be open in  a
          "run-unit"  has been increased to 40. A "run-unit"
          consists  of  a  program  and   subprograms.   The
          individual  program  limit  of 14 files each still
          exists.

     **   A step count has been added  to  the  single  step
          command in the debugger.  Specifying a number with
          the "S" command  now  instructs  the  debugger  to
          execute  that  many  instructions before stopping.
          The default value is 1,  equivalent  to  a  single
          step.

     **   An  interrupt  capability  has  been  added   when
          programs  are  run under the debugger. The program
          can be interrupted  at  any  time  by  pressing  a
          predefined  key  (defined  in  the CRT driver), at
          which point control returns to the debugger at the
          next  line.   (See  the  CRT driver update notice,
          below.)

Corrections

     **   A bug has been fixed where a label in  an  overlay
          referenced  from  outside the overlay would not be
          resolved correctly at link time if the  label  had
          been  referenced  more  than  twice  prior  to its
          definition within the overlay.

     **   A bug has been corrected where a  subprogram  with
          both a linkage section and more than 4096 bytes of
          working storage would not be called properly.

     **   A bug has been corrected  in  which  the  compiler
          would  allow  a  17 character filename as a quoted
          VALUE OF FILE ID, but would truncate off the  last
          character.  The  compiler now flags filenames over
          16 characters.

     **   A bug has been  corrected  where  an  overflow  in
          certain types of numeric conversions would disable
          leading zero suppression entirely until  the  same
          type   of  conversion  was  performed  again,  and
          succeeded without overflow.

     **   Moves involving COMP-3 variables with no digits to
          the left of the decimal point have been corrected.
          Previous  action  was  unpredicatable  and   often
          seemingly unrelated.

     **   Passing of subscripted items to CALLed program has
          been  corrected.  If an item was subscripted using
          variables in the call, they would  not  be  passed
          correctly.   In  addition,  occasional  errors  in
          program flow would occur,  resulting  in  Run-Time
          object-code errors.

     **   The  debugger  has  been  corrected   to   operate
          properly in a program/subprogram environment.

     **   Accept will  now  allow  unchanged  acceptance  of
          updated   numeric  fields,  as  well  as  complete
          replacement. Screen attributes  are  now  left  on
          during interactive accepts.

     **   Attempts to position the  cursor  outside  of  the
          screen limits will now generate a run-time error.

     **   Open Extend has been corrected to fix intermittent
          errors  dealing  with boundaries on sequential and
          line sequential files.

     **   The compiler will now flag as an error attempts to
          use  an ACCESS MODE other than SEQUENTIAL when the
          ORGANIZATION is declared as SEQUENTIAL.

     **   The compiler will now flag  as  an  error  numeric
          PICTUREs  that  are  greater  than  18  digits  in
          length. PIC X is then assumed.

     **   The compiler will now trap attempts to use a VALUE
          clause on a group item having an OCCURS clause.

     **   A problem in which the  program  could  mistakenly
          believe  that there was a declaratives section, or
          became  confused  about  the   location   of   the
          declaratives   section,   after   a   CALL   to  a
          subprogram, has been corrected.

     **   UNSTRING has been  modified  to  correctly  handle
          POINTERs that are initially out of range.

     **   A bug has been fixed in the ISAM file handler that
          would  prevent  a  record  from  being  physically
          removed from the disk after having  been  deleted.
          It could no longer be referenced, but continued to
          take up disk space.

     **   The compiler now converts all external  references
          to upper case. The result is that a CALL to "test"
          and a CALL to "TEST" are equivalent.

     **   A bug in CHAIN parameter passing when the debugger
          was active has been corrected.

     **   An INSPECT of a numeric  item  with  SIGN  LEADING
          SEPARATE now works properly.

     **   The compiler no longer crashes if a quoted literal
          is improperly continued in area A.

     **   Line numbers  output  by  the  compiler  in  error
          messages  generated at procedure header lines have
          been corrected.

     **   The compiler now correctly handles continuation of
          quoted  literals when the character on either side
          of  the  continuation  break  is  itself  a  quote
          character.

     **   The  compiler  now  detects   a   null   procedure
          division, and issues a warning.

     **   Certain  illegal  REDEFINES  constructs  are   now
          flagged as errors by the compiler.

     **   A compiler crash that occurred  when  defining  an
          exceptionally large data item has been corrected.

     **   COMP-0  items  now  correctly  handle  the   value
          -32768.

     **   A bug in ISAM file  handling  has  been  corrected
          that  cause  added  records to become inaccessible
          under  certain  circumstances.  If  a  number   of
          records next to each other were deleted, and a new
          record added in their place, the record  could  at
          times, no longer be found.

CRT Driver Update

     The CRT drivers have been  updates  to  include  a  new
parameter.  If  you  have  modified your CRT driver, or have
written your own, you will need to include a  definition  of
the following form:

             ENTRY   $BREAK
     $BREAK: DB      03H     ;Debugger Interrupt

This location defines the key which will cause the  debugger
to  intercept  control  at  the  next line executed. In this
example we've defined the key to be  CTRL-C  (control  'C'),
whose normal value is 3.

     The $BREAK symbol is only required when the debugger is
to be used.  If it is not defined, and the debugger is used,
an unresolved external reference will be  generated  by  the
linker, and the interrupt feature will not work.
