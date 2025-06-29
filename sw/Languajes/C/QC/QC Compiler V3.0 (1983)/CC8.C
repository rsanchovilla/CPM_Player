/********************************************************/
/*							*/
/*		Q/C Compiler Version 3.0		*/
/*			(Part 8)			*/
/*							*/
/*     Copyright (c) 1983 Quality Computer Systems	*/
/*							*/
/*			04/30/83			*/
/********************************************************/

/* NOTE: This module becomes part of the free space after it
 *		is used if you link Q/C using PLINK-II
 */
#include "qstdio.h"
#include "cstddef.h"
#include "cglbdecl.c"

/* Initialization code */
init()
	{
	extern char _patch;	/* patch bdos() for non-CP/M systems */
	_patch = 0x26;		/* see User's Manual Appendix F */

	printf("%s%s%s\n", signon, version, copyright);
	moat(500);		/* set free space to reserve for stack */
	mintype = n_types;	/* init minimum type entries */
	minsym = nsym;		/*	symbol table entries */
	minlit = litpsize;	/*	literal pool size */
	lit_sym.st_sc = SC_STATIC; /* special "symbol" for literal pool */
	lit_sym.st_idset = ID_VAR;
	lit_sym.st_info = getlabel();
	strcpy(lit_sym.st_name, "$LITPOOL");
	}
/* Get options from command line */
getoptions(argc, argv)
int argc;
char *argv[];
	{
	register char *p;
	char *index();
	static int rename = FALSE;

	if(argc < 2)			/* must have at least "cc" + */
		usagerr();		/*	one input file name */
	infilptr = argv + 1;
	while (--argc) {
		if (**++argv == '-')
			break;		/* stop at options */
		++ninfils;
		}
	if (ninfils == 0)
		usagerr();		/* must have an input file */
	getfilname(*infilptr, infil, "C");
	while (argc--) {		/* look for options */
		p = *argv++;
		if (*p == '-') {
		    while (*++p) {
			switch (chlower(*p)) {
#if Z80 == FALSE
			case 'a':	/* generate code for RMAC */
				codeflag = 'a';
				strcpy(defext, "ASM");
				continue;
#endif
			case 'c':	/* commented asm listing */
				fullist = TRUE;
				continue;
			case 'd':	/* output to console (debug) */
				output = stderr;
				continue;
			case 'i':	/* toggle initialization of */
				initflag = !initflag; /* arrays>INITSIZE */
				continue;
			case 'l':	/* generate a library */
				libflag = TRUE;
				continue;
#if Z80 == FALSE
			case 'm':	/* generate code for M80 */
				codeflag = 'm';
				strcpy(defext, "MAC");
				continue;
#endif
			case 'o':	/* rename output file */
				rename = 1;
				continue;
			case 'r':	/* toggle redirection flag */
				redirect = !redirect;
				continue;
			case 's':	/* set SP for ROMable code */
				romflag = TRUE;
				lptr = p + 1;
				spaddr = gethex();
				break;
			case 't':	/* generate trace messages */
				trace = TRUE;
				continue;
			case 'v':	/* toggle verbose/terse */
				verbose = !verbose;
				continue;
			default:
				usagerr();
				}
			break;		/* break out of -S switch */
			}
		    }
		else if (rename == 1) { /* should be new output file name */
		    if (p[1] == ':' && p[2] == '\0') {
			strcpy(outfil, p); /* build drive:infil.defext */
			strcat(outfil, (infil[1]==':') ? infil+2 : infil);
			*(index(outfil, '.') + 1) = '\0';
			strcat(outfil, defext);
			}
		    else
			getfilname(p, outfil, defext);
		    if (streq(infil, outfil)) {
			puts("Output file name same as input");
			exit(1);
			}
		    rename = 2; 	/* remember we did it */
		    }
		else
			usagerr();
		}
	if (!rename && output == 0) {	/* use infil.defext as output */
		strcpy(outfil, infil);
		*(index(outfil, '.')+1) = '\0'; /* end name after '.' */
		strcat(outfil, defext); /* add default extension */
		}
	else if (rename == 1)		/* new file name not found */
		usagerr();
	}
usagerr()
	{
#if Z80
	puts("Usage:cc infile ... -cdilortv -sxxxx outfile");
#else
	puts("Usage:cc infile ... -acdilmortv -sxxxx outfile");
#endif
	exit(1);
	}
/* end of CC8.C */
