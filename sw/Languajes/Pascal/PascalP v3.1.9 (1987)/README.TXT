PascalP and it's companion programs are copyright (c), 1987
by C.B. Falconer.  They may be distributed on public systems,
and used for personal non-profit purposes.  They may not be
sold, nor included in packages for sale, without the express
written permission of C.B. Falconer.

This library directory is datestamped.

All files are protected by CCITCRC checksums, in both crunched
and uncrunched form.  Extract with LT (available separately).
After (optionally) customizing the timer systems in INTERPC and
INTERPCI, rename them to be RUNPCD and RUNPCDI respectively.

Use of the Profiler system requires a timer installation.

TEST319.PAS demonstrates some of the new features of PascalP
v 3.1.9.  This release includes generation of .COM files, which
requires SLRMAC (or Z80ASM) and SLRNK (or SLRNK+) from SLR systems.
The resultant code is 8080 executable (or on V20's or 8085s).  All
features of earlier documentation still apply, however compilation
is now much faster, and can execute in less memory.  (I compile
7000 lines of PascalP, with over 1200 identifiers, in a 63k CPM
system at 2.5 Mhz at up to 200 lines per minute).

PASCALP IS ISO/ANSI STANDARD - except for GOTO out of procedures
and passing functions/procedures as parameters.

L80/M80 is not presently supported, because a) library main-
tenance is impossible with LIB80 (it consistently looses the
last portion of large libraries), and b) the 6 character name
limitation can cause unexpected errors and c) it is slooow.

                 Contributions

Contributions are solicited.  Contributions of over $50 will
receive the full source code of the systems programs on (your
choice) Kaypro 4 format or IBM 9 sector DSDD format disks.

Contributions of $100 will also receive the full source of the
run-time library, allowing generation of ROM mounted systems
and custom I/O packages (e.g. A/D converters mapped into files
of reals, etc.).  This system is ideally suited to critical
processing, such as medical systems, since full overflow checks
are made, and complete run-time range checking is the default.
Note that CPM is simply one possible system under which this
can run.  Power-on and go dedicated systems can be routinely
created.

Commercial users should contact me directly for licencing.

C.B. Falconer, 680 Hartford Tpk., Hamden, Conn. 06517
(203) 281-1438.
á-