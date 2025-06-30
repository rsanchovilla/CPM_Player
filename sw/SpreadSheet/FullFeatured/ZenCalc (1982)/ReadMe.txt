http://heathkit.garlanger.com/library/TheSoftwareToolworks/software/zencalc.shtml

ZenCalc

Copyright (C) 1982 Knowledge Engineering Inc.

This simple, easy to use calculating tool can be used to compute your budget, record 
and project your investment returns, even do your taxes. ZenCalc provides the most 
important capabilities of a two-dimensional "What if?" calculator program, including 
formulas, lables, variable column width, and print to line printer or disk file. Yet 
ZenCalc is uniquely easy to use, with the cursor and function keys of the H89/Z89 or 
H19/Z19 providing a true full-screen editor "feel" in the worksheet manipulations. 
Simple keystroke commands allow operations on entire rows or columns to conveniently 
rearrange your data to suit your needs. ZenCalc avoid complex restrictions on internal 
cross-referencing found in other spreadsheet programs; compact internal data format 
stores more values. Manual includes a step-by-step "hands on" tutorial, making it 
easy to get started. Comes with "templates" which automatically compute your full 
IRS Form 1040 and itemized deduction Schedule A. Requires H89/Z89 or H19 terminal, 
and 48K of RAM (more recommended).


Help:

	   KEYPAD			    FUNCTION KEYS
ENTER	Begin prefixed command		f1	Page down
Up	Cursor/screen up		f2	Page right
Down	      "       down		f3	Go To <location>
Right	      "       right		f4	Page left
Left	      "       left		f5	Page up
Shift-arrow   "	  to   "  edge		Erase	Delete single entry
Home	Cursor to upper left screen	Blue	Pick up value only into buffer
IC	Insert column			Red	Pick up entry into buffer
DC	Delete column (save in buffer)	White	Put buffer
IL	Insert line
DL	Delete line (save in buffer)

		     ENTRY CONSTRUCTION
=	Begin formula			Bksp	Erase last char/function
-.0-9	Begin number			Return	End entry in place
"	Force label			Keypad/function  End entry; then
\	Begin prefixed command		  perform the function
>	Go To <location>		anything else  Begin label
!	Perform recalculation

		    ADDITIONAL HELP
ENTER ?	Prefixed commands		ENTER range ?  Ranged commands
=?	Formula Components	

FORMULAS

Operators:
    +		Add
    -		Subtract
    *		Multiply
    /		Divide
    ^	    	To the power of
    ()		Evaluate parenthesized subexpressions first

Functions:
    sin(x)	Sine of x		lsr(x,y) 	Lessor of x and y
    cos(x)	Cosine of x		gtr(x,y) 	Greater of x and y
    atan(x)	Arctangent of x		min(range)	Minimum over range
    ln(x)	Natural log of x	max(range)	Maximum over range
    log(x)	Log base 10 of x	sum(range)	Sum over range
    exp(x)	e^x			avg(range)	Average over range
    abs(x)	Absolute value of x	lookup(x,range) Lookup x over range;
    int(x)	Integer part of x			  return adjacent value
    sqrt(x)	Square root of x	npv(d,range)	Net present value of
							  range with discount d
 			  PREFIXED COMMANDS

Arrow .........	Begin keypad-created range (Move cursor to define range)
		After ENTER number: move in arrow direction number of times
> ............. Begin direct type-in range (Type: location...location)
A .............	Abort:  exit WITHOUT saving; Requests confirmation
B,Q ...........	Bye, Quit:  save to file & exit
C .............	Clear ENTIRE memory:  Requests confirmation
D+ ............	Decimal places: global, line, or column: 
		  0-13 fixed, Scientific, $, Graph, or Formulas
E .............	Edit (formula):  Return = finished   Bksp to start = abort edit
		  <--,--> = skip  IC,DC = insert/delete  Other = overwrite
K ............. toggle Keypad mode
P* ............	Output (text) to file
R .............	Read (data) from file
S* ............	Save (data) to file
T+ ............	fix Titles in place:  Both, Across, or Down
U .............	set Update parameters:	Auto or Manual
W*+ ...........	set column Width:  global or column:  0 - 77 chars

* = When command is preceded by a range, it operates over the range instead.
+ = Answering with Return resets to default parameter(s).
 			RANGED COMMANDS

A "range" specifies a group of entries which are to be manipulated with
the next command.  Some commands require linear ranges (e.g. only sublines
or subcolumns) while others allow ranges which define a rectangle of entries:

COMMAND 	TYPE RANGE			ACTION
Erase .......... rectangle ....	Delete all entries within range
Pick ............. none .......	Copy a single element into buffer
 "   ............ linear ......	Copy a subline or subcolumn into buffer
Put .............. none .......	"Copied" buffer : overwrite starting at cursor
				"Deleted" buffer: insert line or column
				  and replicate complete buffer
 "  ............. linear ......	"Copied" single element buffer: replicate
				  buffer entry across range
				linear buffer: (if buffer contains a line,
				  Put range should be a column and vice-versa.)
				  Put linear buffer across linear range.
 "  ............ rectangle ....	"Copied" single element buffer: replicate
				  buffer entry across range
Print .......... rectangle ....	Print only range entries to (text) file
Save ........... rectangle .... Save only range entries to (data) file
Width ........... linear ...... Set widths of all columns within range


