15th August, 1985                            By Donald Phillipson



                          CP/M SUMMARY                

             (Terms are indexed at end of document)

CP/M is the general operating system of just about all computers 
built around the 8080 or Z80 chip invented in the late 1970s. 
(Its initials stand for Control Programme for Microprocessors.) 
It is the control code which allows you to do everything else, 
from the simplest thing (e.g. putting in a new disc) to the most 
complex (using an advanced programme or writing your own.)

The CP/M manual provided free by Digital Research Ltd. with some 
computers is not a tutorial for beginners but is an advanced 
reference for people skilled in "assembly language." This text 
file is written to provide basic information for complete begin-
ners, but is obviously only a summary introduction.  The best 
"private enterprise" manuals for beginners are:

     --the OSBORNE CP/M GUIDE by Thom Hogan:  encyclopaedic but 
     requires no ability or interest in programming;

     --Dwyer and Critchfield's CP/M AND THE PERSONAL COMPUTER: 
     encyclopaedic in scope, tutorial in method, proceeding from 
     the simplest fundamentals to advanced programming.

     --CP/M PRIMER by Waite and Murtha, a tutorial for those who 
     want to learn assembly language from scratch.

What is characteristic of CP/M microcomputers, however, is that 
USERS DO NOT NEED TO LEARN ANYTHING ABOUT PROGRAMMING.   CP/M was 
invented in order to allow people to work on a computer (writing, 
accounts, etc.) with no requirement to learn programming.   

CP/M has a small set of built-in commands, listed below, and its 
own set of special programmes for tasks like formatting a new 
disc, copying files from one disc to another, etc. Thirdly, the 
programmes you use (e.g. WordStar, Perfect Writer, DBase 2 etc.) 
are "configured" to follow CP/M's methods (e.g. for writing 
material onto a disc.)

 This document has three sections:

      Starting up
      Built-in CP/M commands
      CP/M "Utility" programmes



Š                           STARTING UP


Start-up procedure is different for CP/M computers than for 
others (e.g. IBM and Apple). You must switch on (or off) with the 
disc drives EMPTY and only then put in a disc. (Being of earlier 
design, CP/M computers do not automatically protect their discs 
from stray electrical signals caused by turning the power on or 
off.) If you switch on or off with a disc in either drive, there 
is a good chance you will write something onto the disc that 
later causes a "Bad Sector" message.

CP/M is the "system code" which tells the Central Processing 
Unit (the "computer on a chip," which runs everything else) how 
to follow orders. In CP/M computers this code is not stored on a 
chip but on disc: in fact on every disc that you may ever want to 
put into the A-drive.

Starting up the computer is called "booting." Starting by first 
turning the power on is a "cold boot," as is using the RESET 
button on the back of the computer. What happens during a cold 
boot is that the computer reads CP/M system code off whatever 
disc is or is next put into the A drive, loads it into memory, 
and acts on it thereafter.

There is also a "Warm Boot" executed by typing the CONTROL and C 
keys simultaneously (usually abbreviated as CTRL--C or C--C or 
sometimes ^C.) This does not reload CP/M code afresh but resets 
the disc drives. You must always C--C whenever you put a fresh 
disc into either drive, or else the computer will not allow you 
to write new material onto that disc and will give you a message: 
"BDOS error--Bad Sector" (see below.) When you C--C you will see 
a confirming message, "Warm Boot" on the screen.



                     BUILT-IN CP/M COMMANDS

A>     

This is the "A Prompt", indicating the CP/M is waiting for a 
command and has "logged" the disc in the A drive. So you have two 
repertoires of commands: those of CP/M (this list) and the invo-
cation of any .COM file in the A drive, by keying its FILENAME.

To log to the B drive instead, key B:. The colon is ESSENTIAL. 
After you key B: to the A Prompt the screen will display B> 
indicating the computer has logged to the B disc.

The A> or B> indicate which is the "default" disc drive. (The 
word default is used in computing to indicate whatever is set to 
happen next, in the absence of any special instructions.) See 
below, in the discussion of ERA.Š

Warm Boot

"Booting" is starting up the computer. A "cold boot" starts from  
scratch, with RAM memory empty or emptied, as when first 
switching on or resetting with the rear-panel button.

A "Warm Boot" resets the disc drives without destroying pro-
grammes in memory. The keyboard command for a Warm Boot is 
CONTROL--C, i.e. the a CTRL and C keys pressed simultaneously. 
CP/M requires that a Warm Boot be performed EVERY TIME a fresh 
disc is put into the computer. If you forget this and attempt to 
write to the disc (which the operating system has not yet mapped) 
you will get a BDOS error report--see below.


DIR = Directory

DIR produces a directory of the files on the disc to which you 
are logged. If logged to A, the command DIR B: produces the 
director for the B disc. The built-in directory does not indicate 
the size of files or how much of the disc is vacant.

In all these CP/M commands, it makes no difference whether you 
key capital or lower-case letters: but the colon must be 
accurately typed.


ERA = Erase

To delete a file, key ERA FILENAME.TYP. To delete a file from 
the disc to which you are not currently logged, insert the 
drivename A: or B: e.g. ERA B:FILENAME.TYP.

CP/M does not confirm that a file has been found and deleted: it 
only reports NO FILE if for some reason (usually a typing error 
or the wrong disc) it cannot find the designated file. If it 
finds and deletes the file, it merely presents another Prompt.

The way CP/M works, the ERA function does not literally erase 
all of a file from the disc. It merely alters a single prefix 
byte to the file's entry on the disc directory track (track no. 
1). This means that it is possible to "unerase" a file, provided 
no new data has been written onto any of its blocks. There are 
automatic programmes to do this, such as UNERASE.COM, or a Disk 
Utility can be used to summon up the file directory and alter the 
prefix byte back from e5 to 00 (see DDT below.)

.paŠREN = Rename a file

Any file can be renamed by the following usage:

     REN NEWNAME.TYP=OLDNAME.TYP

This usage follows standard CP/M syntax, with "desti-nation" 
first, an = sign, and then the "source." (IBM syntax is the other 
way around!)


SAVE = Create a file

The SAVE command writes to the logged or designated disc drive a 
file of set size and name, containing all the material from the 
base of RAM memory (position 100 hex of the "Transient Programme 
Area".)

The size is set in "pages" of 256 bytes (i.e. a quarter of 1K). 
Thus the command

        SAVE 40 B:THISNAME.1

makes a new file on the B disc, named THISNAME.1, 10K long,
containing the first 10K contents of RAM.

The SAVE command is convenient for transforming into a file 
programme instructions that have been written in RAM--an advanced 
use of the computer. But it can also be used to make labels of 
dummy files. The command SAVE 0 -EDIT.010 writes in the directory 
of the A disc a file with no contents and the name -EDIT.010. 
Some people use this to identify their discs.


TYPE = Display on screen

TYPE presents the content of any file on the screen, scrolling 
from beginning to end. Of course only text files are readable.

The display scrolls up the screen too fast to read carefully, 
but can be "frozen" at any instant by keying CTRL--S. Keying any 
other key resumes scrolling.


^C

CTRL--C is the Warm Boot command; see above. Another use for it 
is to cancel any other CP/M command or programme execution.

^S
 
CTRL--S stops (temporarily) most CP/M functions such as
TYPE (see above.)Š
^P

CTRL--P sends console output to the printer. It is a "toggle" 
switch, i.e. one ^P turns the printer on and a second ^P is 
needed to turn the printer off again.

There are several other CTRL--key commands in CP/M, such as ^Z 
(to clear the screen): see your manual.


* and ?

These symbols are "wild cards" in CP/M syntax. The asterisk * 
stands for anything at all, of one or none or several characters, 
either side of the period in a filename. Thus *.* means all 
files, *.COM means all .COM files and DATA.* means all files with 
the filename DATA.

The question mark ? stands for one or more characters. Thus 
*.?Q? indicates all files with a Q as the second letter of the 
typename (i.e. "squeezed" files). A command for DATA?.* will 
cover all filenames such as DATA1, DATA2.ABC, DATAXYZ, etc.


BDOS error

"BDOS error" messages are common in CP/M, especially for begin-
ners who may make mistakes. Unfortunately they do not always mean 
what they say.

Common types are "BDOS error: Bad Sector" which suggests a disc 
has been damaged and "BDOS error on C: Select" which says you 
have invoked a C disc drive which does not exist. In fact the 
commonest cause of a "Bad Sector" error signal is simply failing 
to Warm Boot when putting a new disc in the computer, or else 
trying to write to a file made Read-Only by STAT (see below) or 
to a disc with its "Write Protect" notch covered. Real Bad 
Sectors are nowadays extremely rare. (The writer has experienced 
two in two year's full-time work, using about 40 discs.)

The reasons for this are historical. Every operating system 
needs some sort of error message and a diagnosis is helpful. When 
the CP/M code was first invented, in 1973, the BDOS error code 
was the best that could be done. Disks and computers have been 
improved since then, making errors much less common, but there 
seemed no point in rewriting the error code just for the sake of 
it. Thus, for example, the commonest cause of a "Select" error 
message is a drive door left open. This is just something CP/M 
users have to put up with.


Š                     CP/M 'UTILITY' PROGRAMS

Typical CP/M System Discs will have the following programmes, 
which you can copy to other discs as is convenient.

          PIP       
          STAT
          COPY
          FORMAT
          SUBMIT
          SYSGEN
          CONFIG
          ASM
          LOAD
          DDT       

All these are not built-in CP/M commands but separate .COM 
programmes, stored on disc. In order to be used, they must be on 
the disc to which you are currently logged. If you want to use 
PIP, use DIR or DIR B: to find PIP.COM listed on one of your 
discs, and invoke it by keying A>PIP or A>B:PIP.

(Because CP/M is so strictly literal minded, there must be no 
space between the B: and the PIP. On the other hand, CP/M is 
indifferent whether CP/M commands are in upper case (capital 
letters) or lower. Some other manufacturers' programmes provide 
for this while others from the same manufacturer may not. CP/M is 
always the same.)


PIP (= Peripheral Interchange Programme)

The commonest use of PIP is to copy files from one disc to 
another. It is a fast and flexible programme with many options 
(see manuals). When you invoke PIP by itself, it loads into 
memory and then provides its own prompt marker * at the left end 
of a new line.   Typical uses include:

* A:=B:THISFILE.TYP to copy a file called THISFILE.TYP from disc 
B to disc A. CP/M syntax is DESTINATION disc first, SOURCE disc 
second. (IBM's is the opposite!) It makes no difference whether 
you key as above or A:THISFILE.TYP=B:

* A:=B:*.DOC copies to A all files on B with the typename .DOC. 
I.e. the CP/M "wild cards" * and ? function in CP/M programmes 
(and some others) just as in CP/M system commands.

After such a transaction PIP remains active and shows you its 
prompt *. To return to CP/M, just C--C.

To copy a single file, one can use a single command such as PIP 
A:=B:THATFILE.TYP. When the copying is finished, PIP then returns 
you to the A>ŠOther uses of PIP include deliberate alteration of a file during 
copying, renaming, and PIPping to the printer or some other 
"output device." For all the available options, see the manual. 
Examples:

PIP A:ALPHA.DOC=B:BETA.DOC[Z] finds a file called BETA.DOC on B 
and copies it to the A disc, simultaneously zeroing the "8th bit" 
of each byte. The Z option is useful if you want to eliminate 
WordStar formatting code (all done with 8-bit rather than 7-bit 
code.)

PIP LST:=CON: allows you to type directly from the keyboard to 
the printer, to send either control codes (for fancy printing) or 
readable text, one line at a time.

Note that PIP can be used to copy only named files. In order to 
copy CP/M system code, use SYSGEN (see below).


STAT (= STATistics)

STAT.COM is concerned with the input/output system and has two 
types of use. It provides INFORMATION about disc space and file 
characteristics and it can CONTROL both file characteristics and 
certain input/output port settings (which need not concern the 
beginner at this stage.)

Simply to see how much vacant space is available on a disc, 
simply key STAT (or STAT B:). Other parameters allow you to 
direct STAT to particular files--but this sort of information is 
more conveniently got from SD or some other directory programme.

The command STAT *.* (or STAT B:*.*) summons statistics for all 
files on a disc in the form of a table like:

    RECS   BYTS   EX   ACC   D   FILENAME.TYP
     7      4K    1    R/W   B    THISFILE.MSS

You can also invoke STAT for all files with a common filename or 
typename, as in STAT B:FILENAME.*.

"RECS" indicates the number of 128 byte records used by the file 
and "BYTS" means the length of the file in bytes. The fourth 
entry "ACCess" shows the status of each file as R/W (OK both to 
write to and to read from) or R/O (read only.) You cannot write 
to, and thus you cannot alter a R/O file.

You can however set any file to R/O or R/W with the command: 
STAT B:THISFILE.TYP $R/O or something similar, as appropriate. 
The $ sign is the CP/M symbol indicating selection of a 
particular option. There are other options in STAT (e.g. $SYS to 
make it a "system" file, not listed in the file directory, and 
$DIR to make it a directory file again.)Š

COPY and FORMAT

Older CP/M computers usually had separate COPY and FORMAT 
programmes. Newer ones usually have a single programme named COPY 
with both functions.

FORMAT is used primarily for formatting a blank disc, i.e. 
preparing it for use and copying CP/M system code onto its system 
tracks. During the process the programme automatically verifies 
the disc for "Bad Sectors." Special options include reformatting 
a single track of a disc, etc.

COPY duplicates a disc. Its display menu will tell you whether 
it can format the disc beforehand or not.


SYSGEN (CP/M SYStem GENerator)

SYSGEN is used to copy CP/M system code from one disk to 
another. It is the only way to transfer special configurations 
(e.g. of the keypad or other keys) from one disc to another. 
Other than this, its main use is to restore system code on a disc 
that will not boot up, for whatever reason. A special programme 
is needed since ordinary CP/M programmes cannot read the "system 
tracks" of a disc.

Invoking SYSGEN produces a simple questionnaire, asking which 
disc is to be the source of the system code and which the desti-
nation. It takes 10 to 30 seconds to copy system code from one 
disc to another.


CONFIG = Configuration

CONFIG can be used to alter the settings of the computer's keys 
and several other items recorded in the CP/M system code of an 
individual disc. For example the keypad can be altered to have 
ASCII values different from those of the similar numeral keys on 
the main keyboard. This comes in handy in conjunction with 
programmes such as SMARTKEY, which allow a single key to present 
a whole string of characters.

Alterations are made from a self-explanatory menu. Key values 
are reset in hexadecimal code, which may be unfamiliar to 
beginners but is manageable. (To reset the numerals to the same 
values as before, but in the "high bit" range of ASCII code, 
settings are B0, B1, B2, etc.)



ŠASM = Assembly program 
LOAD = Loader

New computer programmes can be written in various programming 
languages. The most fundamental of these is binary code, i.e. 
strings of zeroes and ones, representing individual electrical 
signals. Since this is unreasonably laborious, the next level of 
complexity above this is "Assembly Language," a special code of 
highly technical semi-English, different for each type of CPU 
chip.
 
Assembly language code looks like this:

         ORG 100         
         CALL READSEC
         LXI D,128
         MOV A,C         

Programmes in assembly language use hundreds or thousands of 
lines of code, but they are reduced to much smaller .COM files by 
a two-step process.

ASM converts them to hexadecimal code (i.e. the shortest 
feasible version of bit code). It reports errors if it finds any 
in translating assembly language mnemonics into hex code instruc-
tions, and its options include writing a .PRN file which shows 
the line numbers of every item of assembly-language code.

LOAD then reads the .HEX file and converts it into a .COM file 
which will run by simply invoking its filename. A .COM file based 
on an .ASM file 100K long may be only 10K long.

These programmes are useful primarily for people who know the 
assembly language for their own computers and write their own 
programmes. But programmes are sometimes distributed as .ASM 
files, and anyone can ASM and LOAD by following the instructions 
in the CP/M manual.


DDT ( = Dynamic Debugging Tool)

This is a programme to alter other programmes: interesting, 
intricate, convenient in customizing programmes essential for the 
"hacker", but beyond the beginner's immediate horizon. Other 
similar programmes include DU and EDFILE, which do not have all 
the capacities of DDT (e.g. they cannot test-run a programme you 
have just altered) but are simpler to use. In particular, DU 
allows the user to "unerase" a deleted file.




Š"SELF DOCUMENTATION"

A notable development in recent programming style is for utili-
ties to include instructions within a programme.   This is com-
monly done in one of two ways.   The programme may present a menu 
of things to do.   Or, if it requires a command line with one or 
more "parameters" (special instructions), keying the programme 
name with no parameters may produce a brief message with sample 
command lines.

Either way, when encountering any .COM file that has no separate 
instructions for its use, the best thing to do is simply to key 
the filename, in case it presents a menu or brief explanation of 
what it does and how.


          This file of documentation was written in July, 
          1985, by Donald Phillipson, Ottawa Kaypro User's 
          Group, based initially on the file KAYPRO.LRN 
          written by Perfect Software Co.

.paŠ
                              INDEX

                  CP/M "resident" functions &c.

        BDOS error..............................  2, 5
        DIR.....................................  2, 5, 7
        ERA.....................................  2, 3
        RAM.....................................  2, 4
        REN.....................................  4
        SAVE....................................  4
        "Self documentation"....................  10
        TYPE....................................  4
        Warm Boot...............................  2, 4, 5
        "Wild cards"............................  5, 6


                  CP/M Utility .COM programmes

        ASM.....................................  5, 8
        CONFIG..................................  5, 7
        COPY....................................  5, 7
        DDT.....................................  3, 5, 8
        FORMAT..................................  5, 7
        LOAD....................................  5, 8
        PIP.....................................  5, 6
        STAT....................................  5, 6, 7
        SUBMIT..................................  5
        SYSGEN..................................  5, 6, 7

