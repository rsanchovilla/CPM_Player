		INPUT/OUTPUT

The input and output facilities of TARBELL BASIC were designed
to create a new standard of flexibility.  Essentially, commands
are provided to allow any output statement to transfer data
to most output devices, and any input statement to transfer data
from most input devices.  In order to do this, devices are
grouped into logical devices and physical devices.  Logical
devices are those that are activated by the input and output
commands, and are listed in the table on the left.  Physical
devices are actual pieces of hardware, such as a CRT, printer,
cassette, and disk.  There is a table, called the MODES table,
which remembers the assignment of physical devices to logical
devices.  The MODES table has ten bytes, numbered from 0 to 9.
Each byte represents a corresponding I/O device driver in the
I/O section.  Each bit in each byte corresponds to one of the
eight possible logical devices, numbered from 0 to 7.  The
table below shows the logical and physical devices, and their
default assignments for TARBELL CASSETTE BASIC:

Logical Device	Number		Physical Device		Number

INPUT		0		Console Keyboard	0
PRINT		1		Console Printer		1
CLOAD		2		Cassette Input		2
CSAVE		3		Cassette Output		3
BGET & BLOAD	4		Cassette Input		2
BPUT & BSAVE	5		Cassette Output		3
Spare		6		Spare Input/Output	4
Spare		7		Listing Device Output	5
				Reader Input		6
				Punch Output		7
				Disk Input		8
				Disk Output		9

The current assignments may be viewed by entering the
CHANNEL statement.  Every place an X occurs, an assignment
exists between the physical device to the left and the logical
device above.  The ASSIGN and DROP statements can be used to
set and reset bits in the table, respectively.

To get an idea of how this works, just type DROP 1,1.
This will drop the console output device as the PRINT device.
Don't worry!  Nothing's wrong.  Your keyboard is still feeding
commands to the console INPUT device, you just can't see the 
echo.  Now simply say ASSIGN 1,1 and you'll be back in business.

Note that the I/O section (see seperate listing)
creates the default assignments by transfering ten bytes
to the MODES table.  If you wish to change the default
assignments, just change these ten bytes (at IMODES).



				E









