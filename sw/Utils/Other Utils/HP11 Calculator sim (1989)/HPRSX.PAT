=================================================================

                            H P R S X

              A Programmer's Integer RPN Calculator
                      CP/M 2.2 RSX Version

                  Version 1.0    July 20, 1989

                       Copyright (c) 1989
                               by
                           Terry Hazen
                      21460 Bear Creek Road
                       Los Gatos, CA 95030

                 Voice.......... (408) 354-7188
                 Saratoga RBBS.. (408) 354-5934
                 Zee-Machine.... (408) 245-1420


  HPRSX and its documentation may not be circulated in any
  incomplete or modified form without written permission of the
  author.  Any commercial use of HPRSX where the user receives
  revenue by duplicating or distributing HPRSX by itself or in
  conjunction with any hardware or software product is expressly
  prohibited unless authorized in writing by the author.  All
  rights reserved.

=================================================================

HPRSX.COM has several locations that can be patched using DDT,
PATCH, ZPATCH, etc, to alter the operation of the program to suit
the user.  The following tables list their locations and the
distribution defaults.


Intercept Character
-------------------

Eric Meyer's HP+ CP/M 3.0 RSX uses ^^ as an intercept character.
However ZDE uses that command to toggle character case, so I
chose to use ^@ as the default intercept character instead.  This
character may be patched to any other CONTROL character (1Fh or
less) if you desire.

Location    Default      Purpose
=================================================================
  011Dh     00h (^@)     Intercept character to invoke HP11 RSX.


Program Name
------------

If you are operating in a ZCPR3 environment, the name by which
HPRSX was invoked will automatically appear as the RSX ID, in the
command line HELP message, and in the load messages, and no
patching need be done.

If you are primarily operating in a non-ZCPR3 environment and
rename HPRSX, the program name, 'HPRSX', may be patched to the
new name, which will then automatically appear at the proper
places in the command line HELP message when it is called and as
the RSX ID when loaded.  A maximum of eight characters are
available.  Fill the unused positions with space characters, as
spaces in any of the eight locations will be ignored.  For
example, to change the name of the program from HPRSX to RSX, you
may simply patch the 'HP' in 'HPRSX   ' to space characters
(20H), the HELP message will display 'RSX' with no leading
spaces, and the loaded RSX will have the ID '  RSX   '.

HPRSX checks the installed RSX's for their ID to see if it is
already installed.  If you wish to have 2 versions in memory (for
example, one that clears the display line on exit and one that
doesn't), one of the versions must have a different RSX ID name.
Note that both versions must also have different intercept
characters.  If you do have 2 versions in memory, avoid problems
by not calling one from within the other.

Location  Default        Function
=================================================================
  0135h   'HPRSX   '     Program name for use in command line
 -013Ch                  help screen, load message, and RSX ID.
                         Needed only in non-ZCPR3 enviornments.
                         8 characters maximum.


Clear Display on Exit
---------------------

The HP11 RSX clears it's display on exit.  If you wish, you may
patch HPRSX.COM so that the HP11 RSX will leave its display on
the screen after exit.

Location    Default      Purpose
=================================================================
  05BEh     D0h          Start of clear line routine.  Patch this
                         byte to DFh to bypass the clear line
                         routine and leave the HP11 RSX display
                         on the screen after exit.

=================================================================


