
GEMVIEW
=======
Created by Martin Hepperle, 2020


This is a small tool to read GEM metafiles and display them using a GSX driver.
It is written in Turbo Pascal 3.01 for CP/M 2.2 and uses the GSX-80 graphics extensions.

Command line:

GEMVIEW [-C] [-D:n] [-R] [-X:x]  [-Y:y] [-S:x] [-T:y] [-O id] file.gem

-C	enter long command line in extra line (circumvent Turbo Pascal bug)
-D:n	set debug level to 1 or 2
-R	redirect RDR, PUN, LST to the console (e.d. for DDHP7470 driver
-X:x	translate horizontally by x
-Y:y	translate vertically by y
-S:x	scale horizontally by x
-T:y	scale vertically by y
-O id	select driver with id from ASSIGN.SYS file
file.gem	the metafile to read, complete with extension
