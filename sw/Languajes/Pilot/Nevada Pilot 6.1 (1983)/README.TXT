Configure terminal with

   CONFIG NVPILOT 

command

This file will be used to provide update information that may
be required between printings of the PILOT reference manual.

The method of configuring NVPILOT for a specific terminal
has been changed.  Type "CONFIG NVPILOT" to obtain the choices
described in Section 2 of the manual.  Your configured version
will retain the name "NVPILOT" at this stage.  Then type
"NVPILOT" and you will be offered choices about an author or
student version and whether DIR should show all files or just
PILOT files.  The final result will be creation of PILOT.COM
on the default drive.

When you have a version working on your computer and terminal,
you may run the additional program PLTKEY if you wish to
change the keyboard keys used for specific edit functions.
The program will prompt you how to proceed.

Some of the included test programs require a display of at
least 64 characters per line.  Shorter displays such as that
with the unmodified Apple will not display all the text.
For example:   C:A=PEEK(28000)  puts the value at location
28000 (6D60H) into numeric variable A.
POKE is used in the form  POKE:<address>,<expression>
For example:   POKE:28000,95  will put the value 95 (5FH) into
location 28000 (6D60H).  The expression must be in the range
0-255 (0-FFH).  For addresses greater than 32767 decimal, use
a negative value after subtracting from 65536.  For example,
POKE:-4075,95   will place 95 (5FH) into 61461 (F015H).

The XS: statement has been improved to allow PILOT to control
a sequence of program operation, including return to PILOT.
Within the limits of a single line, multiple CP/M commands may
be entered, separated by semicolons.

Some of the included test programs require a display of at
least 64 characters per line.  Shorter displays such as that
with the unmodified Apple will not display all the text.
 statement may be used after OPENF to retain any existing
information in the file, moving the point at which WRITE will
add information to the current end-of-file location.

An additional PILOT statement DIR has been added to
display file directory information.  It may be used in either
immediate or run mode.  It displays either all files or just
.PLT files as determined during the installation process.

An additional PILOT statement XS (EXECUTE SYSTEM)
has been added to allow
overlay and execution of a CP/M program.  Usage is:
XS: <CP/M file name> [<optional parameters>]

An additional PILOT statement RL has been added to
provide scrolling of screen information during PILOT program
execution.  Usage is: RL:n  (n=no. of lines scrolled)

An additional PILOT statement READ has been added to
allow reading a line of data into the entry buffer and into a
string variable.  After OPENing the file, usage is:
READ:<expression>[,$LABEL]
<expression> refers to file number, the optional $LABEL is the
string variable name.

For keyboards that do not provide a backward slash (\), CTL-F
may be used to force immediate execution or abort operation.
