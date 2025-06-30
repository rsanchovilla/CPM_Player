
VCCP is a CP/M shell for Personal CP/M on Sharp MZ-800

To be run on vanilla CP/M it must be patched. Sharp MZ-800.
has no character mode, only hi res scren 640x200 at $8000

The patches allows to send the windows frames as ascii 
chars + - | \ instead of drawind them as bitmap. 

the only dependance on Personal-CP/M is the use of BDOS 
function 113 to turn on/off the cursor. 


VCCP-ORG.COM is the original file 
VCCP-ORG.ASM is the disassembled original program
VCCP.COM     is the patched CP/M

To generate VCCP.COM, execute 00_PATCH_VCCP.SUB in patch\ folder
on CPM Player emulator


How to use VCCP:

Return Selects and executes.     
Comma  Selects.      
Space  Moves to next item.                         
Arrow  Keys move up,down,left,right
Ctrl-C Move between file window and command window.
Ctrl-D Display help text.       
Ctrl-Q Deselect all files.

The following commands are built in. 

	Help,Dir,Drive,User,Run,Search
	Rename,Erase,Type,Print,Make,Quit            

Other 9 commands can be added in the VCCP.CFG file   

