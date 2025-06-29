READ.ME			November 1, 1983	 Version 2.2

     The minimum files necessary for CLIP to execute correctly are:

	CLIP.COM	CLIP.OVL	CLIERMSG.OVL

     CLIP creates the file CLIPSWAP.OVL on disk A: so you must leave
room for it (4K).

     If you want to use the on-line help files you must first
compile the help information with the help compiler.  With the
COPY of the distribution disk in B: and a fresh system disk in A:
type the following:

	A>B:HELPGEN CLIPHELP.MSG CLIPHELP.OVL VERBOSE

NOTE: Unless changed, CLIP looks for CLIPHELP.OVL on disk A:

     There are a few *.CLI files on this distribution disk.
These files are not necessary for the use of CLIP.  They have been
provided for you to use as guides for the building of your own .CLI
command files.

     The command file of most immediate use is the MENU.CLI file.
once you have placed CLIP on your system disk and have CLIP up and
running (See the Release notice for the details) type MENU at the
CLIP command prompt.  The *.CLI files must be present on your system
disk for the MENU command file to work properly.

     We hope you enjoy CLIP.  Please write and let us know how
you like CLIP.  If there are any commands that you would like to see
added - please let us know.  This latest version was a direct result
of user feedback.

		Thanks

		Programming Staff
		ARTISOFT, Inc.
