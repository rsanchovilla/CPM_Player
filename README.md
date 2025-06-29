# CPM_Player

CP/M player allows to run CP/M `.COM` programs. 

It does not simulates the whole HW. It just simulates CP/M at BIOS/BDOS call level, using native Windows files. A CP/M disk maps to a windows folder.

There are many CP/M simulators that follow this approach. Why a new one?
Cool Features:
* Support for several CP/M flavors: 
  * CP/M 2.2, CP/M 3.1 (CP/M Plus)
  * Personal CP/M, Cromenco CDOS 2.01
* Enhanced text terminal support: 
  * ANSI/VT100/VT52/ADM-3A/Televideo 9XX
  * Can define a Custom terminal 
  * Support for original charset (Osborne/H19/Z19 terminal)
  * Support for displaying blocky graphics (Kaypro/Osborne/WaveMate Terminal-125/IMSAI VIO)
  * Support for loading fonts (Orborne)
* Support for graphics terminal: 
  * TV Cromenco Dazzler (including Joysticks)
  * Tektronix 4010/4014
  * VT100 + Digital Engeneering RG512 Retro-Graphics card 
  * Generic Color GSX terminal
* Support for running `.SUB` files, enhanced with some additional handly automation commands

This proyect was started back in 2006 based on Takeda Toshiya CP/M Player for Win32 dated 2004.03.08. 
It was quite modified and enhanced.

# CP/M Software

All these features allows to run the SW I collected over time by just dragging and dropping 
the `00_RUN.SUB` (or `00_TEST.SUB` or `00_DEMO.SUB`) file on the simulator's main window.

All the collection can be found in [sw](https://github.com/rsanchovilla/CPM_Player/blob/master/sw) folder.

Some cool programs to try out:

* BLS Pascal 1.0 (1981): The ancestor of Turbo Pascal, ported to CP/M from NASCOM
* GrafTalk 1.1 (1982): Configured to run on RG512 Retrographics
* DR Logo 2.0 (1983): Ported from Amstrad, runs on CP/M 2.2 with GSX standard driver
* TeleDraw (1983): An early version of Dr Draw bundled with Televideo 803, runs on CP/M 2.2 with GSX standard driver
* Sargon Chess 1.0 (1978): Original program using WaveMate Jupiter III Terminal-125 for board graphics
* SubLOGIC Flight Simulator FS1 (1979): Ported from TRS-80. Runs on CP/M 2.2 with simulated Terminal-125 (has same blocky semigraphics as TRS-80). Also available a very cool fictional vector graphics HiRes version
* Micro-Soft Altair BASIC 3.2 (1975): Ported to CP/M 

Enjoy
