# cpmtris

A Tetris clone for Z80-based CP/M machines
(c) 1996,1999 Russell Marks, GPLv2

Originally part of the ZCN repository: https://github.com/jamesots/zcn

I modified cpmtris so that "vt100" and "8 MHz" are the default values.

``cpmtris.com`` is the assembled binary that uses these settings.

See README.orig for full documentation.

## Commands

| Action     | Key |
| ---------- | --- |
| Rotate     | s   |
| Left/Right | k/l |
| Drop       | d   |

## Command-Line Options

``cpmtris [termtype [mhz*10]]``

``termtype`` specifies the terminal type:

| Type | Terminal                    |
| ---- | --------------------------- |
| 0    | as defined in patch area    |
| 1    | VT100 (default)             |
| 2    | VT52 (PCW, +3, etc.)        |
| 3    | ZCN (this is auto-detected) |
| 4    | VC404                       |

``mhz*10`` defines the speed of the machine "times 10", e.g. for a
3.5 MHz machine, use "35" or for 8 MHz (default) use "80".

E.g.: ``cpmtris 1 80`` for a VT100 8 MHz machine, which is the default.

## ZMAC

The ZMAC Z80 macro assembler, which is used for cpmtris, is also available in the ``zmac/`` folder.
When assembling cpmtris using the Makefile, zmac is used (but needs to be compiled first)

