Ashton-Tate                             FPL Ver. 3.0-47- 220  1/17/83 # 10000    @�47    CONFIG.FPL                     Section Required                       Invalid Section                        Invalid Item                                   You can't delete from Change           Duplicate entry                        Line number cannot exceed 32000                OLD cannot be greater than New         OLD cannot be greater than New         $(save and) Delete text; then proceed           Syntax error                           Cannot add item                        Overflow table full                            Months cannot be a variable            Invalid Start Parameter                From file does not exist [cr]                  Incorrect definition file [cr]         Value out of range [cr]                incorrect rule & -                             &Row (column) in Mathrow (Mathcol) [cr]  Invalid Expression Left of '=' &       Nothing right of '=' &                         Parenthesis error &                    Operator Error &                       I don't understand &                           %You can't have rows,cols in same stmt  Invalid Precision Factor               !Print parameters are inconsistent              Too many rules in this section         &IF logic only allowed in Rules Section !Missing parameters in input stmt.              (You can only input to a cell or variabl!Colon required after the filename      Missing right bracket                          Loop statement has a problem           Unrecognized keyword                   #DIF,PDIF,CUM,PV not allowed in Loop            Too many functions in Section          &Only one IRR per MATH* section allowed                                                 Line number required                   '1st char of name must be capital letterIllegal Character                              Name too long                          Illegal Filename                       &DSS not found. Change disks;press [cr]         &EDI not found. Change disks;press [cr] 'BEGIN not found.Change disks,press [cr]no CONFIG FILE.                                JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC FIRST SECOND THIRD FOURTH                                                       JANUARYFEBRUARYMARCHAPRILMAYJUNEJULYAUGUSTSEPTEMBEROCTOBERNOVEMBERDECEMBER                                                       ����
���A� �#r%(�)�+.�0�1(5�6278p;�>
?�@fBRNpOQ~R�SGU�UxWZY�[=]
_`a�b]cd�d^f�fhgMhlOmWnbo4p�q2s[t          #D�j*nD��|��"_��_kD!����"_��ʑ*AD|��._��a_��_kD!����@_���*AD|��L_��a_��_kD!����^_��@_*D��|�n_)҅_! ���!LD�L#D�**DRIVE:MODEL NAME
VALID RESPONSES:

[cr]   If a model name is displayed in the upper right corner of a
       screen, that name will be used.  

name   The model name may be up to eight characters long.  The first
       character must be upper case alphabetic; other characters may be
       numbers or letters.  A drive designator may precede the name (i.e.
       A:, B:, etc.).

Q      Terminates the session.
**NEW MODEL, OK?
This message is displayed only if FPL cannot find the model named on
your disk.

VALID RESPONSES:

Y      OK for FPL to create a new model by this name.

N      Not OK to create a new model by this name.  FPL will ask you for a
       new model name.
**WORKFILES SELECTION MENU
This menu allows you to change the names of the files that comprise your
model.  If for any reason the default names listed are unsatisfactory, 
you can change them (see below).  Press your Return key to approve the
filenames as shown.

If two models have the same structure, change the MC file of the second
to point to the MC file of the first. If their rules are the same, change
the CA file of the second to point to the CA file of the first.
 
Enter the line number corresponding to the file whose name you want to 
change.  
**LINE TO CHANGE OR [cr]
VALID RESPONSES:

[cr]     Approves the name on the screen and displays the next prompt 
	 message.

Q        Re-displays the menu with the current file names.

d:       Appends the drive designator to the filename.  d may be any 
         drive legal within your operating system (A,B, etc.).  If you 
         enter an illegal drive designator, FPL will cease processing 
         when it tries to use that filename.

d:*      Appends the drive designator to all filenames on the menu.
 
-        Removes any drive designator from the filename, leaving the 
         filename intact.

-*       Removes the drive designator from all filenames on the
         menu.


         
**PLANNING MENU
Enter 1 to call the Editor to enter a new model definition or to
        modify an old one.  
Enter 2 to call DSS, to process the model and produce reports.
Enter 3 to change the names of the files within your model.  This
        selection is useful for putting part of the model on one
        drive and part on another, or for creating versions of the
        model.
Enter 4 to erase your Config file, to reconfigure FPL for a new
        terminal or to recover from an abnormal end that left the
        input buffer corrupted.
Enter 5 to change models, when you are working on one to change
        to another.
Enter 6 to terminate the FPL session.
**EDITOR
VALID COMMANDS ARE:
   ADD [section] [item name]...Adds or inserts new statements.
   CHANGE section [item name]..Changes statements.
   DEFINE [section]............Processes the description into a model.  
   DELETE [section]............Deletes statements from the description.
   DSS ........................Calls Decision Support System.
   EXIT........................Terminates FPL session, returning 
                               control to operating system.
   FROM filename...............Takes commands from file.
   HELP........................Displays this list.
   HOLD........................Freezes top portion of screen.
   INIT........................Clears definition file of all entries.
   LIST [section] [itemlist] [TO device]
                               Lists any section, or the entire descrip
                               tion to terminal, printer, or named file.
   LOWER.......................Allow lower case letters to be entered.
   Q...........................Terminates Editor, returning to 
                               Planning Menu.
MORE ([cr] or Q) 
   RENUMBER [section] [old,new,increment]
                               Renumbers data ,rules or text section.
   STET........................Restores description to its contents at 
                               the beginning of the session; deletions 
                               are restored,additions are removed, and 
                               changes are negated.
   UPPER.......................Any lower case letters keyed in will
                               be translated to upper case.
**SUBSTITUTE S(kip) or Q(uit)
You have entered a change command, followed by the section within which 
the changes are to be made, and perhaps followed by a list of items to 
be changed.  Editor has displayed one for changing and awaits your 
direction.

You may enter:

S..........To skip the statement displayed, ignoring any changes made, 
           and bring up the next one in your list.
Q..........Terminate the change procedure ignoring any changes made to 
           the displayed item, and ignoring any remaining items in the 

           list.
[cr].......Press the return button to store the statement as currently 
           displayed and bring up the next item in the  list.
<old string>/<new string>[!]
           <old string> is any string of characters within the item.
           <new string> is any string of characters to replace it with.
           /    the slash separates the old from the new.
           !    The exclamation point, if entered, the substitution will 
                be applied to all the items in your list.
MORE ([cr] or Q)  
EXAMPLE:
    *CHANGE ROWS R1,R3-R5,R2,    five rows to change.
    R1 ROW ONE                   Editor displays first one.
    RO/                          replace the first RO with
                                 nothing', ie delete it.
    R1 W ONE                     Editor displays changed line.
                                 [cr]  Done with this line.
**HOLD
The Hold command reezes the top portion of the screen (above the Hold command) 
so scrolling will take place below.  This enables you to have reference 
material displayed in the upper portion while working in the lower.

EXAMPLE:

     *HOLD

 


***DATA
You are entering the DATA section of your description.  The section 
consists of statements, each statement has the form:

   line number  item = valuelist         where:

   line number    May be any number between 0 and 32767.
                  It must be unique.  Lines need not be
                  entered in order.

   item           May be any row name, column name,
                  variable name or cell name (row\column)

   valuelist      Is a list of values to be assigned to the
                  item.  Values are entered as numbers or as
                  data generation functions.
   EXAMPLE:
      DATA
      100 R0 = 1,2,3,4,5
      110 ROW JUN,JUL,AUG
      130 R0=600,700,800
***RULE
You are entering the RULES section of your description.  The section 
consists of statements, each statement has the form:

   line number   item = expression          where:


   line number    May be any number between 0 and 32767.  It must be 
                  unique.  Lines need not be entered in order.
   item           May be any row name, column name, variable name or 
                  cell name (row\column).
   expression     A computation to be performed expressed in terms of 
                  items, constants and operators.
   EXAMPLE:
      RULES
      100 MATHROW
      110   R3=R2 + R1
      120   R4=.52 * R37
      130 MATHCOL
      140   Q1=JAN+FEB+MAR
**ROW
The ROWS section of your description is composed of statements; each
statement establishing a single row of the model.  Each statement has 
the form:

   rowname  row title  [row bracket item]  where:

   rowname     Is required, may be up to 8 characters long and must
               consist of upper case letters,numbers or the follo-
               wing characters: % # $ or .
   row title   Is optional, may be up to 100 characters long.
               Use the slash to break between title lines.
   row         Is used to control appearance and spacing of data in a row.
   bracket     Enter an edit control string to establish overlines, under-
   item        lines, dollar signs, percent signs, etc.  See EDIT.

   EXAMPLE
      ROWS
      R0 ROW ZERO [$OA -(]
      R1 ROW ONE
      R2 ROW TWO [--Z*]
**COLUMNS
You are entering the Columns section of your description.  The section 
is composed of statements, each statement establishing a single column 
for the model.  Each statement has the form:

   colname  col title  [col bracket item]   where:

   col name     Is required, may be up to eight characters
                long, may consist of upper case letters, 
                numbers, and the following characters: $ % # or .
   col title    Is optional, may be up to 100 characters
                long.  Use slash to break between title lines.
   col          Is used to control appearance and width of
   bracket      data in a column.  Enter an edit control string
   item         to establish width, decimal places, percents,etc.

   EXAMPLE
     COLUMNS
     JANB JANUARY/BUDGET
     FEBB FEBRUARY/BUDGET [W8]

     MARB MARCH/BUDGET [$-C.2]
**VARIABLES
You are establishing Variables in your model. Variables are single 
values used to store numbers to be changed during calculations, such as 
rates, prices or other single values.  The variable name can be 8 chara
cters long, must consist of upper case letters, numbers and the four 
characters $ % # and .

EXAMPLE
  VARIABLES

  P1PRICE
  INFLATN
  COMMRT
**ADD
Add commands are used to enter new statements into the description.  Add 
comands may be used to append new statements to the bottom of a section, 
or to insert them in the middle.

Add commands take the form:

[ADD]  section  [item name (or number)]

[ADD]    is optional.  The command will work in all cases with just the 
         section name (ROWS, COLUMNS, VARIABLES, DATA, RULES or TEXT).  

section  Must be one of the keywords above.

itemname Is optional.  In ROWS, COLUMNS and VAriables the itemname
         positions the entries for insertion.

EXAMPLE
  ADD RULES
  ADD ROWS TOTSALES   Entries will be inserted before TOTSALES.
**CHANGE
Use CHANGE to alter existing statements.  Its form is:

CHANGE  section  [itemlist]       where:

CHANGE     is the required keyword.

section    is the section in which to make the changes.  Valid sections
           are ROWS, COLUMNS, DATA, VARIABLES, RULES and TEXT.

itemlist   is the list of items to change.  Each item will be displayed 
           individually for changing.

EXAMPLE
  CHANGE ROWS R0-R9,R15
  CHANGE COLUMNS JUN,SEP,OCT
**DELETE
Use DELETE to remove statements from the description.
The DELETE command takes the form:

DELETE   section   [itemlist]         where:


DELETE     is the required command.

section    is required.

itemlist   is the list of items in the section to be deleted.  If no 
           itemlist is entered, the entire section will be deleted.

EXAMPLE:

  DELETE ROWS
  DELETE ROWS R1,R5-R9
  DELETE RULES 100-625
**RENUMBER
Use Renumber to renumber the lines of a Rules section, a Data section or 
a Text section.  The Renumber command takes the form:

RENUMBER    section   [old] ,  [new] ,  [increment]

RENUMBER    is the required command.

section     is required, must be one of the keywords above.

[old]       is the place in the section to begin renumbering.  If no old 
            is included, renumbering will begin at the beginning.

[new]       is the new line number to assign old.

[increment] is the amount to add to generate each succeeding line number.

EXAMPLE
  RENUMBER RULES
  RENUMBER TEXT 100,1000,10
**LIST
Use LIST to print part or all of the description to an output device.  
The form of the List command is:

LIST [section]  [itemlist]  [TO device]

LIST      is the required command.

section   is the section to list.  If no section is included, the entire 
          description will be listed.  Valid descriptions are ROWS, 
          COLUMNS, DATA,VARIABLES, RULES and TEXT.

device    is the output device.  Valid devices are T (terminal), P 
          (printer) or a filename.  If no device is specified, LIST 
          directs its output to the terminal.

EXAMPLE
  LIST
  LIST ROWS TO P
  LIST RULES 1000-3000 TO PARTRULES
**EXIT
Use the EXIT command to terminate the session, store your work away and 

return to the operating system.  The EXIT command takes the form 

*EXIT
END FPL SESSION (Y or N) Y
A>  ................ The operating system prompts for input.

or,

COMMAND  EXIT
END FPL SESSION (Y or N) Y
**RESERVE
Use RESERVE to establish a model quickly, with repetitive row name (ie 
PROJ1 thru PROJ8) or repetitive column names.It takes the form:
*ADD section
1> RESERVE  n  ['string1'] ["string2"]  
	RESERVE     is the required command.
	n           is the number of items to reserve
	'string1'   is a string of characters to be inserted into the
                    item name.  The single quotes are required.
        "string2"   is a string of characters to be inserted into the 
                    item title.  The double quotes are required.
EXAMPLE:
     *AR
     1>RESERVE 5...............creates five rows names R1-R5.  or,

     *AC
     1>RESERVE 6 'ORG' "ORGANIZATION/"
                ...............creates six columns named ORG1-ORG6 entitled
                               ORGANIZATION/1, ORGANIZATION/2...etc.
     


**DEFINE
When your description is completed, use the DEFINE command to create a 
model out of it.  The form of the DEFINE command is:

DEFINE  [section]

DEFINE     is the required command.

section    may be either DATA or RULES.  If no section is included, 
           the entire model will be DEFINed.

EXAMPLE:
  DEFINE RULES
  DEFINE DATA
  DEFINE
**INIT
Use INIT to completely wipe out an existing model to allow re-entry from 
the keyboard or from a file.  The INIT command takes the form:

*INIT
**STET
Use STET to reset the description to its contents at the beginning of 
the Editor session.  STET restores all deletions,removes all additions, 

and undoes all  changes.  The STET command takes the form:

STET
**TEXT
Use the text area of Editor to enter a series of commands which will be 
processed as a unit.  Thus use Text to store one or more report descrip
tions, or to store a group of data assignments or calculations to be 
used all at once. Entries to Text are stored on the disk under a name 
you assign.  They are read into TEXT, or into FPL as commands by use of 
the FROM command.
EXAMPLE:
 *  ADD TEXT ...................... Enter text statements.
 >100 PAGESIZE 66,80 ......... First report descriptor.
 110> TITLE .................. Second report descriptor.
 120> THIS IS AN EXAMPLE
 130> BLANK
 140> Q
 150> SHOW FAM,DAD,MOM,SIS
 160> EDITING W9
 170> PRINT .................. Command to initiate printing.
 180> C
 190> Q .......................... Done entering text.
 * LIST TEXT TO REPORT1 .......... Store text named diskfile.
**MONTHS
Use the Months function to generate automatically a number of rows and 
columns representing the months of the year.  MONTHS can be used to 
generate any number of months, beginning in any month.  Its form is:

                                            [NOTOTALS]
MONTHS n [START=mmm] [YEAR=yyyy] [QUARTERS] [FISCAL] ['string1'] ["string2"]

EXAMPLES"

1>MONTHS 12 ............... creates twelve months starting in January.
13>MONTHS 12 START=JUL .... creates twelve months starting in July.
4>MONTHS 24 QUARTERS ...... creates 24 months starting in January with 
                            intervening quarters every third month.
1>MONTHS 24 START=APR FISCAL ... creates 24 months starting in April with 
                          year breaks every 12 months (instead of every 
                          December).
**DSS
Use the DSS command to move directly from Editor to DSS"

EXAMPLE
*DSS
**Q
Use the Q command to return to the Planning Menu.

EXAMPLE:

     *Q

Q may also be entered during most automatic processes to halt, for instance
listing of sections, creation of items during Reserve and Months execution
and changing of items.

***HELP
Use the Help command to print a list of Editor commands and a short 
description of the use of each.  A fuller explanation of each command is 
available by entering a question mark followed by the command."
**FROM
Use the FROM command to direct FPL to take commands from a named file.  
If you have procedures that involve several commands, and you use the 
procedures as a set fairly often it is useful to store the commands in a 
TEXT file and use FROM to execute them.  The form of the FROM command is

*FROM filename     where:

filename  is the name of the text file.
**DSS HELP
VALID COMMANDS ARE
  CLEAR               Set screen for data entry mode.
  COLUMN [list]       Define a partial column for processing.
  COMPUTE             Use Rules section of description to compute the 
                      model.
  DATA                Enter data assignment statements for immediate 
                      execution.
  nD                  Move the screen down n rows.
  DEFINE [section]    Redefine Data, Rules, or the entire
                      model.
  .n                  Sets precision factor to n for the 
                      screen and reports.
  EDITING string      Sets edit control string for report.
  EDITOR              Calls the Editor.
  EXIT                Terminates session.
  FOOTNOTES           Enter footnotes for report.
  FROM                Takes commands from a file.
  H                   Moves screen to upper left corner of model (Home 
                      position).
  HELP                Displays this list.
  nL                  Moves screen left n columns.
MORE ([cr] OR Q) 
  LOWER               Allow lower case letters to be entered.
  MARGIN.B            Sets bottom margin for reports.
  MARGIN.T            Sets top margin for reports.
  NAMES [ONLY]        Controls display of names, titles
                      or both on screen.
  OPTIONS             Displays table of current print
                      options.
  OUTPUT device       Directs print output to Terminal,
                      Printer or named disk file.
  OVER n              Sets left margin for reports.
  PAGENO Y/N          Whether page number is printed on reports.
  PAGESIZE x,y        Sets size of paper for reports, x 
                      lines long, y characters wide.
  PRINT               Print reports as currently defined.
  Q                   Terminate DSS Session.
  nR                  Move screen n columns to the right.
  ROW [list]          Define partial row for processing.
  RULES               Uses rules section of description to
                      perform calculations on data.

MORE ([cr] or Q)   
  SHOW [list]         Controls which rows and columns are
                      printed and displayed.
  SPACE n             Sets inter-columns spacing to n.
  TITLE               Enters a title for the report.
  nU                  Moves screen n rows up.
  VARIABLES           Displays names and current value of
                      variables.
  WHATIF              Enter change data values, perform computations 
                      immediately.
  UPPER               Any lower case letters keyed in will be 
                      changed to upper case.
  VERSION Y/N         Controls whether model Version number is printed 
                      on reports.
  Wn                  Sets column width for screen and reports.
  MODEL name          Save the current model and bring the named one in 
                      for processing.  The named model must be on line 
                      and must be defined.
**UPPER
When lower case letters are entered from the keyboard, FPL translates 
them to upper case automatically.  Use LOWER command to inhibit 
automatic translation.  Use UPPER to start translation again.

EXAMPLE

*UPPER              or
COMMAND  UPPER      or
COMMAND  LOWER
**CALC
Use WHATIF to enter calculation rules and see them take effect immediately on 
the screen.  
EXAMPLE:
  COMMAND  WHATIF
  RULE  R3=R0+R1+R2
  RULE  R4=.52*R3
  RULE  READ MYFILE: R7-R13,R15
  RULE  R16=R13-R15+R4
  RULE  WRITE HISFILE: R16
VALID KEYWORDS ARE:
  MATHROW [itemlist]          MATHCOL [itemlist]
  READ filename: [itemlist]   WRITE filename: [itemlist]
  INPUT itemname,prompt string
**ROW
Use ROW to establish a 'window' in your model for DATA and CALC to work 
in.  If you have entered a ROW command, all following DATA and CALC 
commands will be applied only within the columns named.
EXAMPLE:
  COMMAND  ROW C6,C8,C12-C15,C2
  COMMAND  ROW ....... Resets "window" to entire model.
  COMMAND  ROW ? ..... Displays current ROW setting.
**COLUMN
Use COLUMN to establish a 'window' in your model for DATA and CALC to 
work in.  If you have entered a COLUMN command, all following DATA and 
WHATIF commands will be applied only within the rows named.


EXAMPLE:
  COMMAND  COLUMN R6,R8,R12-R15,R2
  COMMAND  COLUMN  ..... Resets "window" to entire model.
  COMMAND  COLUMN  ..... Displays current COLUMN setting.
**RULES
Use the COMPUTE command to apply the rules section of your description.  
Until a COMPUTE command is processed, the model contains only the data 
values from the Data section (plus any changes you may have made).  After
COMPUTE has been processed, the model contains the computed values.
EXAMPLE
  COMMAND  COMPUTE
**DEFINE
Use DEFINE DATA to restore the model to its original
data values.
EXAMPLE
  COMMAND  DEFINE DATA
**NAMES
Use NAMES to control whether the screen shows item names
or item titles, or both.  

If the screen           NAMES will display titles.
shows names

If the screen           NAMES will display both names
shows titles            and titles.

If the screen           NAMES will display titles only.
shows both names 
and titles

To show names only      Enter NAMES ONLY

EXAMPLE
  COMMAND  NAMES 
  COMMAND  NAMES ONLY
**Width command
Use the W command to control the width of all columns on the screen, 
regardless of any width controls in bracket items.  Bracket items only 
control column width on printed reports.  The W command controls the 
column width of all columns in printed reports, except those specifically
edited with a bracket item controlling their width.

EXAMPLE
  COMMAND  W9 ..... Columns will be displayed 9 wide.
  COMMAND  W3 ..... Columns will be displayed 3 wide.
**DECIMAL PLACES
Use the decimal command to control the number of decimal places 
displayed on the screen, regardless of any bracket items controlling 
decimal places.  The bracket items only control decimal places on prnted 
reports.  The decimal command controls the decimal display of all co
lumns in printed reports except those specifically edited with a bracket 
item controlling their display precision.

EXAMPLE
  COMMAND .3  ..... Data will be dispayed with 3 decimal

                    places.
  COMMAND .0  ..... DATA will be displayed with no 
                    decimal places.
**SHOW
Use the SHOW command to control which rows and which columns will be 
displayed, and will be printed.  A single SHOW command will control rows 
or columns; to control both, use two SHOW commands.

EXAMPLE
  COMMAND  SHOW DEC,JAN-JUN,AUG
  COMMAND  SHOW R0,R9,R2-R7
  COMMAND  SHOW   .................resets display to entire
                                   model.
**MOVEMENT COMMANDS
Four commands are available to enable you to move the screen around the 
model.

   nL    moves the screen n columns to the Left.
   nR    moves the screen n columns to the Right.

   nD    moves the screen n rows Down.
   nU    moves the screen n rows Up.

H moves the screen to the Home position, the upper left corner of the 
model.
 EXAMPLE
   COMMAND  3D   ..... Move 3 rows down.
   COMMAND  5R   ..... Move 5 columns to the right.
**CLEAR
Use CLEAR to remove the data from the screen, making  it available to 
view your lines of input.  When entering title and footnote instructions,
for instance, you may wish to view the entire title as you are entering 
it.
EXAMPLE
   COMMAND  CLEAR
**SPACE
Use the SPACE command to set the space between columns.   Normally, 2 
spaces are printed between each column on the screen and on your re
ports, but you may set this to any positive number, or zero.
EXAMPLE
  COMMAND  SPACE 1
**TITLE
Use the TITLE command to enter up to ten lines of title for
your reports.  The lines will be printed at the top of each
page of the reports.
EXAMPLE
  COMMAND  TITLE
  TITLE 0  FIRST LINE OF TITLE
  TITLE 1  THESE LINES ARE CENTERED
  TITLE 2  LEFT
  TITLE 2  THIS LINE WILL BE LEFT JUSTIFIED
  TITLE 3  SO WILL THIS ONE
  TITLE 4  RIGHT
  TITLE 4  THIS LINE WILL BE RIGHT JUSITIFIED
  TITLE 5  SO WILL THIS ONE

  TITLE 6  Q
  COMMAND
**FOOTNOTES
Use the FOOTNOTES command to enter up to ten lines of footnotes for your 
reports.  The syntax is the same as that for titles.
**PRINT
Use the PRINT command to direct FPL to print the report.  The report 
will be controlled by any print control or option commands you have entered.
EXAMPLE
  COMMAND  PRINT
**EDITOR
Use the EDITOR command to move from DSS to the Editor without having to 
go through the Planning Menu.
EXAMPLE
  COMMAND  EDITOR
**PAGESIZE ::::::::::::::::::::::::::
Use the PAGESIZE command to tell FPL size of the paper in your printer.  
The default is 66 long by 132 wide, but you can set it to any length, 
and up to 255 characters
wide.
EXAMPLE
  COMMAND  PAGESIZE ? ......  To view the present pagesize
                              parameters.
  COMMAND  PAGESIZE 66,80 ..  To reset the pagesize to 66
                              long and 80 wide.
**OPTIONS
Use the OPTIONS command to view the current settings of the print con
trol options (margins, date, version number, pagenumber print flag,etc.)
**Q
Use the Q command to terminate the DSS session and return to the 
Planning Menu.
EXAMPLE
  COMMAND  Q
**model
Use the model command to change models.  If you are working on model 
BRANCH1 and you want to begin processing model BRANCH2 you can use the 
model command to make the change.

EXAMPLE:

COMMAND MODEL BRANCH2

**EDITING
Use the Editing command to enter an edit control string to control the 
entire report.  The Edit control string supersedes any W or . commands 
entered, but is overridden by any bracket items.
EXAMPLE
 COMMAND  EDITING [W9.3-C]     or            3>R3 ROW 3 [.3C]
Editing Symbols:

Wn   Print column n characters wide.

O    Overline row      D    Double overline     S    Space before row
U    Underline row     E    Double underline    A    Space after row


$    Dollar Sign       P    Percent Sign        Z,   No commas
Zc   Zero values to be displayed as any character c.

++   Trailing plus            +(    Positive numbers in parentheses
--   Trailing minus           +C    Positive numbers followed by CR  
                      
                              -(    Negative numbers in parentheses
                              -C    Negative numbers followed by CR
                                    Positive numbers followed by DR
**VARIABLES
Use the Variables command to view the names and current values of your 
variables.  When the Variables command is entered, the screen clears and
DSS attempts to display all of your variables on the screen.  Enter [cr] to
bring the matrix back to the screen.
EXAMPLE
  COMMAND  VARIABLES
**MARGIN.T
Use the T.MARGIN command to reset the top margin of the reports.  If no 
T.MARGIN command is given, three lines of top margin are provided.  
Hint:  When printing reports to the terminal, set the margins to zero.

EXAMPLE

  COMMAND  T.MARGIN 6
**MARGIN.B
Use the B.MARGIN command to reset the bottom margin of the reports.  If 
no B.MARGIN command is given, three lines of bottom margin is provided.  
Hint:  When printing reports to the terminal, set the margins
to zero.

EXAMPLE

  COMMAND  B.MARGIN 0
**OVERR
Use the OVER command to move the report over n spaces on the page.  OVER 
establishes a left margin of n blank spaces.  

EXAMPLE

  COMMAND  OVER 3   ...... Moves the report over 3 spaces.
**VERSION 59
Use the Version command to print the Model Version Number in the report.
Version is an internal counter FPL maintains, incremented once each 
time the Rules are executed and reset to zero when the model is defined.  
With Version on, you can look at the report and know when it was produced.

EXAMPLE

  COMMAND  VERSION YES
**OUTPUT 60
The OUTPUT command conrols the destination of the reports printed.  Using 
this command, reports can be directed to the Terminal (OUTPUT T), The 
Printer (OUTPUT P) or a file on the disk (OUTPUT A:MYFILE.PRT).
EXAMPLE
  COMMAND  OUTPUT T

  COMMAND  OUTPUT PROFORMA.PRT

Note that Output does not in itself produce the report.  It just 
determines the destination when the PRINT command is issued.
**PAGENO 62
Use the PAGENO command to turn on or off the printing of the page 
numbers on the second and higher pages of the report.  If PAGENO is YES, 
page numbers will be printed; if it is NO, they will not be printed on
the report.


EXAMPLE

  COMMAND  PAGENO YES
  COMMAND  PAGENO NO
**STUBS
Use the Stubs command to control the width of the row titles on reports and
on the screen.  If no Stubs command is entered, the row titles will be set
to the width of the longest row title in the model.  But you can set the width
as your needs dictate.  For instance,

COMMAND  STUBS 18

sets the stubs width to 18.  Any stubs longer than 18 will be truncated.

COMMAND  STUBS 0

is a special case.  It will print row titles only on the first page of your
reports.  All other pages will have data only.






                      ********************                                                                                                            