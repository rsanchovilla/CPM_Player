
Command Line Turbo Pascal 3.0 compiler

http://www.cirsovius.de/CPM/Projekte/Disassembler/TURBO/command/TURBOcommand-en.html

The usual way to compile a program is: 

   1.Create the source using an editor
   2.Create the object codes invoking the compiler
   3.Create the executable program using a linker and the Run Time Library

As is well-known TURBO PASCAL is written as a development system made of the following modules: 

   1.Run Time Library
   2.Menu
   3.Editor
   4.Compiler

Therefore only one program is needed - instead of the three ones listed above. 

I assembled a new compiler version to be invoked by a CP/M command line, using the modules 
Run Time Library and Compiler. For it I wrote a module which serves as an interface between CP/M 
and the real compiler. This version of TURBO PASCAL does not allow running programs in memory but 
only generating .COM or .CHN files. 

Invoke it as follows: 

   TURBOCOM SOURCE_file{.PAS} {/Start_address} {/End_address} {/H}} 

The options are defined as follows: 

   Option /Saaaa defines a start address 
   Option /Eaaaa defines an end address 
   Option /H selects a chain file 


Compile

   generate TURBOCOM.ASM replacing includes by its contentes

   M80 =TURBOCOM.ASM /Z/C/L/M
   L80 TURBOCOM,TURBOCOM/N/E

