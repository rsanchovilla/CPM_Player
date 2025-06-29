Release A of the disk restoration utility library adds a new version 
of RESTORE that does much less disk reading and writing.  Plus, the 
original, fully-relocating version has been upgraded to handle the 
directory of almost any size disk, and a sorted directory is no 
longer mandatory before restoring the disk.  Both versions may be 
patched to automatically reset the drive to log in the new directory 
if running under ZRDOS 1.5 or later, and user patching is easier.
