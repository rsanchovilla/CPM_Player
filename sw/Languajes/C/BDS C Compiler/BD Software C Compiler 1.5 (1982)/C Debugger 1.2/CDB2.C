#include "cdb2.h"

/* Copyright (c) 1982 by J. David Kirkland, Jr. */

/* cdb2 is the routine that initializes the package that is coresident in
 * memory with the target program.
 * "name" is the complete name of the COM file to be loaded.
 * "glob" is a pointer to the first global symbol table entry.
 * "loc"  is a pointer to the first local symbol table entry.
 */

cdb2 (name, glob, loc)  char *name, *glob, *loc; {
	char fcb[40], *p;
	int *q, i;

	COPYRIGHT;

	/* set up table pointers */
	localp = loc;
	globalp = fntabend = glob;
	fntab = CDB2ADDR;
	fntab--;

	trace_full = 0;		/* empty trace table */
	ntraces = 0;
	curfnt = fntab;
	cursn = 0;
	walkcount = 1;		/* will cause a break at first RST */
#ifdef DEBUG
	debug = 0;
#endif
	q = ORIGIN + 0x0006;	/* get BDOS address for top of  */
	i = *q;			/* debug stack */
	q = i+1;

	initrst(*q);

	clearbreaks();

	/* load target file */
	if (ERROR==setfcb(fcb,name) || 255==bdos(15,fcb) ) {
		printf("no target file on disk\n");
		exit();
		}

	for (p=ORIGIN + 0x0100; ; p+=128) {
		bdos(26,p);
		if (bdos(20,fcb))
			break;
		}

	globbase = externs();
	p = CCC_KHACK;		/* disable CCC's khack mechanism, which */
	*p = 0xc9;		/* sets the RST vector to a return      */

	call (ORIGIN + 0x0100); 	/* take off */
}
