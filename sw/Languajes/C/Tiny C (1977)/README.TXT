
http://primepuzzle.com/tiny-c/README.TXT - 3/28/2008, 9/16/2012 - Herb
Johnson. Edits and additions by Lee Bradley.

Getting started with tiny-c (CP/M version)

Extract all the files in this archive into a folder on your
hard disc and run the MYZ80 emulator.

7:31 C0>>

Run the interpreter and launch the program preparation system via

7:31 C0>>tc
 ***  TINY-C   VERSION 1.0  ***

COPYRIGHT 1977, T A GIBSON

>>>.r pps
>>>.g
 ***  TINY-C   VERSION 1.0  ***

COPYRIGHT 1977, T A GIBSON

[To list the contents of the current drive, use the .dir *.* command.]

>.dir *.*
[filenames]

>.dir *.tc
[filenames with .TC extension]

[The PPS lets you edit, recall, save and run programs. To load a .TC
program file:]

>.r programname

  LLLL
  N MM PPPP RRRR
>

[N is the first line number, MM the last line number, PPPP the total
chars in the buffer, RRRR the total unused chars.]

[Repeated uses of ".r" will load more programs AFTER the previous ones.]

[To run the program, name the "main" or topmost procedure to run in the
program, preceded by a ".".]

>.procedurename

[The program will run until it quits or ends, and then return to the PPS
prompt.]

>

[To exit the PPS, use the .x command.]

>.x

DONE
>>>

[You are now in the system loader, which has the >>> prompt. Exit by
another .x command:]

>>>.x

7:32 C0>>

Exit back to DOS via exit.

7:32 C0>>exit

There are many "dot" commands in the PPS which supports text editing and
other capabilities. Here are some of them.

.[number] - the current line is line [number]

./ - print current line number, total lines, total chars in buffer, total
unused chars

.p - print current line

.p n - print n lines

.d, .d n - delete current or n lines

+, +n - move one or n lines forward

-, -n - move one or n lines backward

.l text - locate a line with "text"

.c text newtext - current line, replace "text" with "newtext"

.r filename - read filename, append to end of last line in buffer

.w filename - write filename

[Most users will use the editing capabilities of the PPS infrequently,
preferring to use a full-featured external editor for their tiny-c
program files.]

[Error codes are reported with "DONE ee aaaa" where ee is the error
number 1-26 and aaaa the memory address. There are some file messages
like "improper drive" and "???".]

Error codes follow:

1 Illegal statement
2 Cursor ran off end of program. Look for missing ] or )
3 Symbol error. A name was expected. For example, 10 + +
5 Right parenthesis missing, as in x = (x+a*b
6 Subscript out of range
7 Using a pointer as a variable or vice versa
9 More expression expected, as in x = x +
14 Illegal equal sign as in 7=2
16 Stack overflow. Either an expression is too tough or you are deeply
nested in functions or a recursion has gone too deep.
17 Too many active functions
18 Too many active variables
19 Too many active values. Values share space with program text. Remove
comments and spaces, shorten variable names, settle for fewer features
or buy more memory.
20 Startup error. Caused by "garbage" line outside of all [ ] ie. where
globals are declared. A missing [ or ] can cause this.
21 Number of arguments needed and number given don't agree
22 A function body must begin with [
24 An illegal invocation of MC
26 Undefined symbol. Perhaps name is misspelled or you need an int or
char statement for it or the function isn't loaded.

Update per Herb Johnson 5/29/14

The MYZ80 "export" command will extract files from the virtual disk and
put them into the MS-DOS directory. The default is the local MS-DOS
directory where MYZ80 is executed. If you just enter the command
"export", it responds with use details. There's also an "import"
command.

The tiny c sources are in MYZ80 "disk" B1:. Other files are in C0:.

Response by Lee Bradley

To make things easier for those like you who are interested in source
mostly, I have exported all files that are in B1: and C0: and repacked this
archive. Thank you Herb.

http://primepuzzle.com/tiny-c/tiny-c.zip

Lee

