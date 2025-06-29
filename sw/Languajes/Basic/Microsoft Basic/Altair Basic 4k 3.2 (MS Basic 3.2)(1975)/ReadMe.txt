Micro-Soft Altair BASIC 3.2 (4K) 
	
Copyright 1975, Bill Gates, Paul Allen, Monte Davidoff
Source: http://altairbasic.org/ compiled by Reuben Harris
Additional cleanup, relocation by Charles Mangin, March, 2019
patched to run on CP/M-80 By Roberto Sancho, Dec 2019

Ported to CP/M By Roberto Sancho in Dec 2019

Changes:

    - uses m80 syntax
    - uses CPM BDOS for console i/o
    - convert console typed chars to uppercase
    - fix parity flag to allow working on z80 using code from Patches to Altair 
      Extended BASIC 4.0 to allow it to run on a Z80, by Mike Douglas, June 16, 2013 
    - allow ^H (BackSpace) to delete last type char
    - SYSTEM command to return to CP/M
    - LOAD "file.ext" to load a progran from cp/m ascii file
      on files, allow lowercase chars. Basic commands must be in uppercase
      if file not found, prints "?IO ERROR"
    - No save command!

The original altair basic is patched to allow new funcionality. z80 code
is not too optimized (sorry, i'm not a z80 expert), but who cares? plenty
of memory available and fast cpu emulation

On staring basic, SIN? question still there. User can answer Y or N, but 
no extra mem will be available.


