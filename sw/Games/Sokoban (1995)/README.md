# Sokoban

CP/M port of a Unix curses clone of sokoban
 
I found it as part of the ZCN repository: https://github.com/jamesots/zcn

The C source has been modified for VT100 compatibility, and some unused variables have been removed :)

``sokoban.com`` is the compiled binary.

To run it, the files ``sokoban.com`` and ``soklevls.dat`` are needed
The help file, ``sokoban.hlp``, is not used in this version.
You find the contents below.

See the ``readme.*`` files for more information.

## Commands

| Key   | Action              | Key    | Action         | Key | Action              |
| ----- | ------------------- | ------ | -------------- | --- | ------------------- |
| h     | move/push left      | H      | run/push left  | ^H  | run left to object  |
| l     | move/push right     | L      | run/push right | ^L  | run right to object |
| j     | move/push down      | J      | run/push down  | ^J  | run down to object  |
| k     | move/push up        | K      | run/push up    | ^K  | run up to object    |
| u     | undo last move/push | U      | undo all                | |            |
| c / s | temporary save      | ^U / r | reset to temporary save | |            |
| ^R    | Refresh screen      | q      | quit                    | |            |

## The game

Characters on screen are:

| Symbol | Meaning                    | Symbol | Meanging                   |
| ------ | -------------------------- | ------ | -------------------------- |
| ``@@`` | player                     | ``++`` | player on saving position  |
| ``..`` | saving position for packet | ``$$`` | packets                    |
| ``**`` | saved packet               | ``##`` | wall                       |

Your goal is to move all packets to the saving position by pushing them.

As you could see you can make a temporary save. This is useful if you think
that all the moves/pushes you have made are correct, but you don't know how
to go on. In this case you can temporary save (using the c command). If you
then get stucked you need not undo all (using U), you can reset to you
temporary save.

If you have restored a saved game, a temporary save is automatically made
at the start.

## Compiling

HiTech C has been used to compile it, it is placed in the directory ``HitechC``.

To compile Sokoban, I used the command ``c -O sokoban.c`` in CP/M.

