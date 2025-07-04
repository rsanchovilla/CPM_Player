                           Notes for                           
                FTL Modula-2 Editor/ToolKit disc                           
                     Workman & Associates

This disc contains the entire sources for the FTL Modula-2 editor and
a number of utilities which you may find useful.

NOTE: COMPDIR, COMPARE, COMPBIN, PATTERN, and TESTPAT are all in the library 
UTILITYS.LBR.  Use MLU to unpack them.  MLU.COM is on the FTL compiler disks; 
the source (MLU.MOD) is here in the Editor/ToolKit.

See the end of this file for more details on the utilities.  They are:

COMPDIR		a directory compare program.  This program is invaluable to
	software developers who need to ensure that their distribution
	discs are complete and contain the latest versions of files.
	See the file COMPDIR.MOD and instructions below.
COMPARE		an Ascii file comparison program.  This program does line-by-
	line comparisons of files.  It uses a powerful comparison
	method which rarely gets lost, and which can detect block
	moves.  See the file COMPARE.MOD and the documentation below.
CAT		a generalised listing module intended primarily for use on
	RCPMs.  It can do tab expansion, line numbering, string search,
	position by line number and wild cards.
	See the file CAT.MOD and the documentation below.
PATTERN		This is a pattern matching module which matches complex
	(even recursive!) patterns.  See PATTERN.DEF for description
	of use, and TestPat.MOD as an example.
SCREENIO	The screen input-output routines used by the editor.  The
	standard version of ScreenIO (SCREENIO.MOD), plus some memory
	mapped versions are supplied.  SCREENIO.OSB is for the Osborne
	1, SCREENIO.MBE is for the MicroBee, and SCREENIO.EAR is for
	the Earth Computers' Z80 Card.  To produce a memory mapped
	version, start with the MicroBee, as that is the most standard.
	To replace the standard version of ScreenIO by a memory mapped
	version, simply compile the memory mapped implementation module
	in place of the standard implementation module--no changes are
	needed in the definition module.  NOTE: the Osborne version is
	for Osborne Is only, NOT the Executive.  The Vixen is also different.

	Compiling the editor.
	*********************

The submit file RECMPED.SUB will recompile the editor:

	SUBMIT RECMPED

The distributed form of this file assumes that the files are all on the
current drive.  You may want to add "B:" in front the filenames being
compiled (or add whatever drive name you are using).  Note that SUBMIT only
works from drive A: on many computers.

	Mapping your keyboard.	**********************

If you want to modify the editor to use your keyboard arrow keys
and function keys, edit the module KEYBOARD.MOD,
then recompile the editor (see above).

	Editor Cook's Guide.

The main modules in the editor are:

ME		The top level module.
EDITCONT	Controls the screen display.
EDITDISP	Some other screen display procedures--essentially part
	of EDITCONT, kept separate for ease of maintenance.
MAKEEDIT	Performs the changes to the file(s) being edited.
KEYBOARD	Accepts input from the keyboard and calls appropriate
		routines to perform the requested edit functions.
DOMENU		Supports the options menu (that is, open file,
	comp/exit, etc).
EDITSTAT	Picks up the file position for a file when it's opened.
MACROS		Handles macro expansion and definition, including the
	learn mode.  Makes and saves them "on the fly" during edits, too.
SETUPCAL        Editor uses this module to call the compilers.  See
	also the module CHAIN for another example of this.
	Note for users or abusers of dumb terminals.

You must rename EDITCONT.DMB and EDITDISP.DMB to end in .MOD before
recompiling the dumb editor (without insert/delete line or clear to
end of line).  Mind you don't overwrite your only copy of ME.COM
while experimenting--and copy ME.COM from your original disks if
you have any doubts.
If strapped for room, or just experimenting, MACROS.MBE has no
function key code and therefore is smaller.  As before, rename
it to MACROS.MOD before recompiling.
		SAMPLE PROGRAM INSTRUCTIONS

		CAT.MOD
		=======

A file display program without the shortcomings of 'type'.  CAT can:
	Number output lines
	Page output
	Expand tabs to spaces
	Wrap lines for listing to terminals without auto-line wrap
	Reposition by line number or by string search
	Use wild cards on the command line
	See non-printing characters in hex (other than CR/LF/TAB)

CAT is not a CP/M implementation of the cat program on UNIX; it is more like
UNIX's MORE.

To run the program:

	CAT   file list /options
or
	CAT   file list [options

The options may also be omitted.  The "file list" is a list of file names or
wild cards which match file names.  For example:

	CAT b:*.def b:*.mod
will list the definition files, then the module files.

An option is zero or more alphabetics.  Some of the alphabetics may be
followed by a number.  If a number is included, it must immediately follow
the option character--it must not be separated.

The options are:

	P - use page mode.  At the end of every page of output, CAT will
prompt for a command (see below).  The option may be followed by the number
of lines to a page.  Default length is 24.	W - Set software line wrap.  
Lines longer than the line width will be
wrapped around by the software.  This is useful if your terminal will not
perform hardware line wraps.  It also prevents any text falling off the top
of screen as the result of hardware line wraps.  "W" may be followed by the
number of columns on the screen.  Default width is 80.
	I - Expand tabs.  Tabs are expanded to an appropriate number of spaces.
	N - Number lines. Each line is preceded by a line number.

Examples:

	CAT  b:*.def/NP

Use page mode and number the lines.

	CAT  b:*.def/P16W64N

Use page mode and software wrap with pagelength 16 and width 64.

		CAT Commands

At the end of a page of output in page mode, Cat will stop and ask for a
command.  You may then enter any of the commands described below.
In fact, you can enter a command character at any time.  When Cat determines
that a character has been typed, it will bring up the 'Command  :' prompt,
display the character you typed, and go into page mode.  Multiple commands may
be placed on a line.  The commands are:
?              Display some help information.
number         Restart listing from given line number.
+ or - number  Advance (or retire) by the given number of lines.
/string/       Restart listing from next occurence of string. The delimiters
	can be any printing non-alphanumeric character.

A number and a search string can be combined to search from a
given line number.  If no string is entered ("//"), the
previously entered string is searched for again.

N		Toggle line numbering option.
I		Toggle tab expansion option.
W		Toggle software line wrap option.  If the W is followed by a
	number, the number resets the screen width.
P		Toggle page mode. If the P is followed y a number, it resets
	the page length.  Note that the first P on any command line
	always causes page mode to be cleared, as page mode is always
	enabled when the command line is processed.  Hence, to just
	change the page length, you must do P20P (say).
Q		Quit this file.
Ctrl C		Return to CP/M.


		Compare
		=======

This program compares two ASCII files and displays the differences between
them.  It presents the output in a reasonably readable form.  The program is
based on a method described by Paul Heckel in 'A Technique for Isolating
Differences between Files', Communications of the ACM, Vol 21
No 4, April 1978, pp 264-268.  To run the program:
	COMPARE old file,new file,[List file]

The third file is optional.  If omitted, the output is to the printer.  You
can use device names (e.g. TTY) or filenames.

The two files are compared line by line.  Lines which have been deleted from
the old file are printed in italics.  Inserted lines are printed in bold.
Lines which have been moved to a new position are printed in their new
position surrounded by lines of asterisks.  You may need to patch the printer
control codes for your printer; they are near the top of the
program (see the .MOD file).  Each control code can be up to 8 characters long
and is terminated by a value of 0 if less than characters are required.
Naturally, you may also change the .COM file.
The control characters in the supplied program are set for a STAR DPS510,
which is supposed to be Epson compatible, so the program may well run 'as is'
on Epsons and Epson clones.

How the program works
=====================

For each line, a hash total is calculated.  Then the unique lines in each file
are identified.  When a unique line matches a unique line in the second file,
the two lines are cross-linked.

Next, lines adjacent to cross-linked lines are compared and, if identical,
they are linked.  This grows the area of linking outwards from pairs of 
matching unique lines (and also from the beginning and end of the files) until
as many lines as possible have been cross-linked.

Finally the text is scanned and printed out.  Lines in the new file which are
not linked to anything in the old file are insertions.  Unlinked lines in the
old file are deletions.  Lines in the new file which link to out-of-order old
file lines are parts of a block move.

Further Work:

A number of things can be done with this program:

	1/  Make it work on three files.
Often, a new version of a program is created (say, for another machine) and
then the original version is modified.  The problem is then inserting the
new changes to the original file into the other version, while retaining
any changes made toproduce that version.  Probably fairly difficult to do. 
	2/   Make it work across machines.
Sometimes, one of the files is on another machine.  It would be nice to
have the old file on the remote machine and only transfer the checksums and
the lines which have been deleted across the link.  Fairly easy, but
reliability of the link will cause problems.
	3/   Write a pair of extract/merge programs.
Continuing on from point 2, write a program to create a differences file
and another to merge the differences on a remote machine.  This should be
quite easy, given 2.

Altogether, these three extensions would be about right for a term project for
one student.  Of course, if anyone out there wants to do this, we'll happily
give author's credit.

	CompDir - Compare two directories
	=================================

CompDir compares disc directories.  The comparison may use the full file
name, just the base name, or (not very useful) just the extension.
Optionally, you may create a file containing a list of the file names added,
deleted or matching.

The command to call the program takes the form:

	COMPDIR wild card, wild card [, list file] [/options]

Where each wild card produces one of the lists to compare.

To compare two discs:

	COMPDIR a:*.* b:*.*

Options are any of the following:

T	Compare only file extension (by default, the whole name is compared).
N	compare only file name--base name, minus the extension.

T and N are mutually exclusive.

C	If file names match, compare the file contents as well.
E	Output file names which match to list file.
A	Output file names which have been added to the second list.
D	Output file names which have been deleted from the first list.
M	Output file names which differ in contents.

These options may be combined.  Examples:

To check that every '.mod' file has a '.rel' file:
	Compdir b:*.mod b:*.rel/n

To write the deleted names to a file so that the missing  '.rel'
files may be discovered:

	Compdir b:*.mod b:*.rel b:comps.sub/nd

If you intend to regenerate those files, edit the file to add "M2 " to the
start of each line.  If you are using the Modula-2 editor, do one in learn
mode and then do the rest with a repeated execution of the defined macro.

To create a list of all definition and implementation modules on disc B:

	Compdir b:*.mod b:*.def t.lst/ade

	Happy Modulating!!
                       