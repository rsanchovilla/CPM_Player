itle	'JOB 1.5 (86/10/15)'
An improved submit facility for CP/m systems.
   evolved from public domain supersub by Ron Fowler

copyright (c) 1983,1984,1986
By C.B. Falconer,
   680 Hartford Tpk, Hamden, CT 06517. (203) 281-1438
released to the public domain 

JOB allows parameters to be terminated by commas, thus a pair
(i.e. ",,") can specify a null parameter.  In addition, parameters
can be "quoted strings", to allow any input whatsoever.  In a quoted
string a quote must be represented by two quotes.  JOB also accepts
empty input lines (e.g. PIP exit command).

JOB creates the $$$.SUB file on drive A, (user 0 as of JOB15) and
thus can be executed with any setting of the default drive.  In
addition JOB searches both the default and A drives for the .JOB
file when no drive is specified in the command line, and (ver 1.4)
if no .JOB file has yet been found searches default and system disks
for a component of JOBS.LBR file.

Thus a set of small .JOB files can be packed into JOBS.LBR and
executed directly.  When many .JOB files are used this can
significantly reduce disk storage

An initial line in the .JOB file beginning with ";;" (double
semi-colon) signifies that the line specifies a default set of
parameters ($0 thru $9). These are only used when the execution
command line does not supply parameters.

JOB does not arbitrarily upshift anything, however an unmodified CCP
will probably upshift all input lines.  CCPLUS can be set to avoid
this upshifting.

JOB will accept most files created for SUBMIT, unless supplied
parameters include commas and quotes.  Since the reverse is not true
JOB expects its' input files to be of type .JOB.

JOB15 up is organized to co-operate with CCP+ and execute jobs thru
changes in user number.  To perform correctly, a minor patch to BDOS
is required, listed below.

A test file to demonstrate JOB appears below (note null line):

testingjob parm1, "parm2",, parm4 parm5, ," parm ""7"", "
null defaults for parm3, parm6, parm8, parm9
1;

2;
3,$4,$5,$6;
7;
8;
9;
0; <<end of test file>>

try A>JOB TESTJOB
       where testjob is the above file from the ";;"
This simply shows a set of comment commands on the console.

Revision history
================

1.5	86/10/15 (cbf) Forced $$$.SUB file on user 0. After all, CPM
is a single user system.  Cooperates with CCP+ v21 up.
A patch for cpm2.2 for submit jobs to execute while changing
user numbers.  This co-operates with CCP+ v2.1 and JOB v1.5.

All values are shown for an unrelocated BDOS.  marked bytes
may be different by a constant

Location
(from start
of BDOS)	Was	Becomes	Comment
06DE		3e	7e	mvi a,0e5 --> mov a,m
06DF		e5	fe
06E0		be	e5	cmp m 	  --> cpi 0e5
06E1		ca
06E2		d2		  jz ...   unchanged
06E3		06 *
06E4		3a	18	lda usrno --> jr $+3
06E5		41	01
06E6		03 *		(code byte skipped)
06E7		be	b7	cmp m     --> ora a
	
The WAS items marked by '*' will vary with the location of
the CPM system, and should not be altered.  The patch uses
the Z80 JR instruction, so for Z80 systems only.  This has
been carefully designed to be position independant.

When completed, the original CCP will no longer execute
SUBMIT jobs when the user number is non-zero. It would never
allow a submit job to change users, which can now be done
when using CCP+ and JOB15.  (earlier versions of JOB will
work if the job is started on user 0 only.)

This causes BDOS to return 0ffh for call 13 (reset disks)
whenever a '$*.*' file exists on user 0.  This flag is
used by CCP+, ZCPR, and the original CCP to decide whether
to bother searching for the $$$.SUB file.  The original
code only returned 0ffh when the file existed on the current
user.

1.4	84/06/23 (cbf) Added library file search 