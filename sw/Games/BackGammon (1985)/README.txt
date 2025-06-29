
GAMNIV20.LBR
------------
Gammon IV, Version 2.0, April 1, 1986.  Full-screen backgammon for CP/M.

This is the April Fool's Day (1986) edition of Gammon IV, the first major
update in many months.

BACKGMMN.COM is the compiled and ready-to-run object file.  It requires
either an ADM-3A compatible terminal ("old" Kaypro) or a screen with video
characteristics exactly like the Kaypro 2X, 4'84 or 10.  However, this
version has the same CRT Module as formerly, including a clearly-marked user
patch area for non-Kaypro terminals.

Improvements for Version 2.0 include:

a)  Several bugs and poltergeists, especially in the Arrange command, have
    been completely exorcised.  No bugs have been found in the Play command
    for months; but, as before, Gammon IV will not invariably recognize a
    forced move, either in your play or in its own.  Gammon IV knows and
    obeys all other official rules of backgammon.

b)  There are no "hidden" commands anymore.  All commands are now shown in
    the command lines, including X(pert and G(raphic.  The G(raphic command
    turns on the Kaypro video-able display.

c)  Input error handling now documents the BAR, HOME and HELP commands, so
    first-time players do not need to read anything else in order to play
    the game successfully.  The X(pert mode dispenses with these messages,
    so X(pert actually does mean expert, now!

d)  The "break" command is Control-C again, instead of ESCAPE.  It was
    all too easy to hit ESC instead of 1 on the Kaypro keyboard, leading to
    an inadvertently paused game.

e)  The sanction against cheating (your opponent became Torve) has been
    removed.

f)  If the cube is doubled during the opening rolloff to see who goes
    first, and the cube value reaches 8, additional pairs on the dice 
    have no further effect.  The cube's opening value will not go above 8.

The computer's three styles of play have not been changed.  Judging from the
feedback I've received, Gammon IV plays acceptably well at the current
levels.  All information needed to re-compile the program is included in the
BACKGMMN.C file, including the details of C/80 3.1 configuration.  The
compile and link steps are governed by BACKGMMN.SUB.

This program is in the public domain, so distribute it freely.

Enjoy!

David C. Oshel
1219 Harding Ave.
Ames, Iowa 50010
