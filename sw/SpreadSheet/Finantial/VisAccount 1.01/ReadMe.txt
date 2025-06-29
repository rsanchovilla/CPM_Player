
VisAccount 1.01

Ready for VT-52/AMD3A/KAYPRO compatible terminal

To run:

   1) Copy files from DISKA-XXX to disk image to be inserted in A:
   2) Copy files from DISKB to disk image to be inserted in B:
   3) Mount in the emulator disk images A: and B:. The program
      requires program as A: and data disk as B:
   4) Start the emulator 
   5) In then A:> prompt type
   
      CRUN2 BIZMII


Escape sequences used:

   For ADM3A/Kaypro
   
      Clear screen: ^Z  
      Cursor Up   : ^K
      Cursor pos  : ESC = row+32 col+32
      
   For VT52
   
      Clear screen: ESC E
      Cursor Up   : ESC A
      Cursor pos  : ESC Y row+32 col+32

      
