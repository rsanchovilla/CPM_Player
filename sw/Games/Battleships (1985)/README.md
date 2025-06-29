# Battleships

CP/M port of the Unix game.

Copyright:
 * bs.c - original author: Bruce Holloway
 *              salvo option by: Chuck A DeGaul
 * with improved user interface, autoconfiguration and code cleanup
 *              by Eric S. Raymond <esr@snark.thyrsus.com>
 * v1.2 with color support and minor portability fixes, November 1990
 * v2.0 featuring strict ANSI/POSIX conformance, November 1993.
 * v2.1 for Linux, October 1994.
 * Slipstreamed in fixes to make it gcc -Wall clean, May '95.
 * fairly seriously hacked for Hitech C and CP/M, rjm 95/8/14
 
I found it as part of the ZCN repository: https://github.com/jamesots/zcn

The C source has been modified for VT100 compatibility and some minor
changes have been made by me (Anna Christina Naß <acn@acn.wtf>.

``bs.com`` is the compiled binary.

See the ``*.txt`` files for more information.

## Modes

* ``-b`` selects a "blitz" variant
* ``-s`` selects a "salvo" variant
* ``-c`` permits ships to be placed adjacently

The "blitz" variant allows a side to shoot for as long as
it continues to score hits.

The "salvo" game allows a player one  shot  per  turn  for
each  of his/her ships still afloat.  This puts a premium
scoring hits early and knocking out some ships   and  also
makes  much harder the situation where you face a superior
force with only your PT-boat.

## Keys

To position your ships: move the cursor to a spot, then type the first letter of a ship 
(using CAPITAL letters) type to select it, then type a direction ([hjkl] or [4862]),
indicating how the ship should be pointed.
You may also type a ship letter followed by `r' to position it randomly, or type `R' to
place all remaining ships randomly.

Navigation and aiming keys:

    yz k u    7 8 9
      \|/      \|/
     h-+-l    4-+-6
      /|\      /|\
     b j n    1 2 3

| Key   | Action                   | Key       | Action                   |
| ----- | ------------------------ | --------- | ------------------------ | 
| h / 4 | move left                | y / z / 7 | move up+left             |
| l / 6 | move right               | b / 1     | move down+left           |
| j / 2 | move down                | u / 9     | move up+right            |
| k / 8 | move up                  | n / 3     | move down+right          |
| r     | place this ship randomly | R         | place all ships randomly |
| ^L    | screen redraw            | Q         | quit game                |

## Compiling

HiTech C has been used to compile it, but it needs a lot of free memory (TPA).

For compiling, I used the command ``c bs.c`` in CP/M.

