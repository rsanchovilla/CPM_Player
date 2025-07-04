/*      ********
	* L2.C *	New linker for BDS C
	********
			Written 1980 by Scott W. Layson
			Modified 1982 by David Kirkland
			This code is in the public domain.

	This is an improved linker for BDS C CRL format.
	It supports the c debugger.

	Compilation instructions:
		cc l2.c -e4C00	     (use -e4900 if linking with L2.COM)
		cc chario.c

		clink l2 chario -ns
	  (or)	l2 l2 chario -ns
*/


/**************** Globals ****************/

/* The DEF_DRIVE macro is used to define the drive from which L2 will
 * load C.CCC, DEFF.CRL, DEFF2.CRL, and DEFF3.CRL (if it exists). The 
 * macro takes as an argument the filename and extension, and "returns"
 * the name with whatever drive designator is needed.  The macro also
 * encloses the name in quotes; thus, the argument when the macro is
 * invoked must NOT be within quotes.
 * That is, to open C.CCC on the proper drive, we use the C code
 *	if (ERROR==fopen(DEF_DRIVE(C.CCC), iobuf)) .....
 */
 
#define DEF_DRIVE(fn) "fn"    /* Make this "0/A:fn" for, say, user 0 on A */

#define SUB_FILE   "$$$.SUB"	/* submit file to delete on error exit...
				 * if you use SDOS, use "a:$$$$.sub"; if you've
				 * hacked your CCP, you may need to change the
				 * drive designator letter */

#define RST_NUM      	6	/* C debugger RST number. Should be identical
				   to the RSTNUM symbol in CCC.ASM      */

#define OVERLAYS		/* comment this out for shorter version */

/*
#define MARC			/* for MARC cross-linker version 
					(enables the "-marc" option) */
*/

#include <bdscio.h>	      /* for i/o buffer defs */

#define NUL		0
#define FLAG		char
#define repeat 	while (1)

#define STDOUT		1

/* Phase control */
#define INMEM		1	/* while everything still fits */
#define DISK1		2	/* overflow; finish building table */
#define DISK2		3	/* use table to do window link */
int phase;


/* function table */
struct funct {
	char fname[9];
	FLAG flinkedp;		/* in memory already? */
	FLAG fdebug; 		/* TRUE unless this routine required
				   only by a lib function after -s */
	char *faddr;		/* address of first ref link if not linked */
	} *ftab;
int nfuncts;			/* no. of functions in  table */
int maxfuncts;			/* table size */

#define LINKED		1	/* (flinkedp) function really here */
#define EXTERNAL	2	/* function defined in separate symbol table */

char fdir [512];		/* CRL file function directory */

/* command line parameters etc. */
int nprogs, nlibs;
char progfiles [30] [15];	/* program file names */
char libfiles [20] [15];	/* library file names */
int deflibindex;		/* index of first default (DEFF*) library */
FLAG symsp,			/* write symbols to .sym file? */
	appstatsp,		/* append stats to .sym file? */
	sepstatsp;		/* write stats to .lnk file? */

#ifdef MARC
FLAG maxmemp,			/* punt MARC shell? */
	marcp;			/* uses CM.CCC */
#endif

char mainfunct[10];
FLAG ovlp;			/* make overlay? */
char symsfile [15];		/* file to load symbols from (for overlays) */

/*  C debugger variables  */
FLAG Dflag;
FLAG SysStat;			/* TRUE if "-s" option given & now active */
int  SysNum;			/* index into libfiles of "-s", or -1 if none */

FLAG Tflag;			/* TRUE if "-t" option given	*/
unsigned Tval;			/* arg to "-t", if present	*/

/* useful things to have defined */
struct inst {
	char opcode;
	char *address;
	};

union ptr {
	unsigned u;		/* an int */
	unsigned *w;		/* a word ptr */
	char *b;		/* a byte ptr */
	struct inst *i;		/* an instruction ptr */
	};


/* Link control variables */

union ptr codend;		/* last used byte of code buffer + 1 */
union ptr exts;			/* start of externals */
union ptr acodend;		/* actual code-end address */
unsigned extspc;		/* size of externals */
unsigned origin;		/* origin of code */
unsigned buforg;		/* origin of code buffer */
unsigned jtsaved;		/* bytes of jump table saved */

char *lspace;			/* space to link in */
char *lspcend;			/* end of link area */
char *lodstart;			/* beginning of current file */


/* i/o buffer */
struct iobuf {
	int fd;
	int isect;		/* currently buffered sector */
	int nextc;		/* index of next char in buffer */
	char buff [128];
	} ibuf, obuf;

/* BDS C i/o buffer */
char symbuf[BUFSIZ];

/* seek opcodes */
#define ABSOLUTE 0
#define RELATIVE 1

#define INPUT 0

#define TRUE (-1)
#define FALSE 0
#define NULL 0

/* 8080 instructions */
#define LHLD 0x2A
#define LXISP 0x31
#define LXIH 0x21
#define SPHL 0xF9
#define JMP  0xC3
#define CALL 0xCD

/* strcmp7 locals, made global for speed */
char _c1, _c2, _end1, _end2;

/**************** End of Globals ****************/


main (argc, argv)
	int argc;
	char **argv;
{
	puts ("Mark of the Unicorn Linker ver. 2.2.2\n");
	setup (argc, argv);
	linkprog();
	linklibs();
	if (phase == DISK1) rescan();
	else wrtcom();
	if (symsp) wrtsyms();
	}


setup (argc, argv)		/* initialize function table, etc. */
	int argc;
	char **argv;
{
	symsp = appstatsp = sepstatsp = FALSE;	/* default options */
#ifdef MARC
	marcp = maxmemp = FALSE;
#endif
	ovlp = FALSE;
	nprogs = 0;
	nlibs = 0;
	strcpy (&mainfunct, "MAIN");	/* default top-level function */
	origin = 0x100;			/* default origin */
	maxfuncts = 200;		/* default function table size */
	Tflag = FALSE;			/* no "-t" given yet	*/
	SysStat = FALSE;
	SysNum = -1;
	Dflag = FALSE;
	cmdline (argc, argv);
	ftab = endext();
	lspace = ftab + maxfuncts;
	lspcend = topofmem() - (1024 + 2100);
	if (lspace > lspcend)
		Fatal ("Insufficient memory to do anything at all!\n");
	loadccc();
	nfuncts = 0;
#ifdef OVERLAYS
	if (ovlp) loadsyms();
#endif
	intern (&mainfunct);
	phase = INMEM;
	buforg = origin;
	jtsaved = 0;
	}


cmdline (argc, argv)		/* process command line */
	int argc;
	char **argv;
{
	int i, progp, syslib;

	if (argc == 1) {
		puts ("Usage is:\n");
		puts ("  l2 {program files} [-l {library files} ] ");
		puts ("[-s {library files} ]\n");
		puts ("\t[-m <main_name>] [-f <maxfuncts>] [-org <addr>]");
		puts (" [-t <addr>]\n");
		puts ("\t[-d] [-ns] [-w | -wa | -ws]\n");
#ifdef OVERLAYS
		puts ("\t[-ovl <rootname> <addr>]");
#endif
#ifdef MARC
		puts ("\t[-marc]");
#endif
		lexit (1);
		}
	syslib = TRUE;
        progp = TRUE;
	for (i=1; i < argc; ++i) {
		if (argv[i][0] == '-') {
			if (!strcmp (argv[i], "-F")) {
				if (++i>=argc) Fatal ("-f argument missing.\n");
				sscanf (argv[i], "%d", &maxfuncts);
				}
			else if (!strcmp (argv[i], "-L")) progp = FALSE;
			else if (!strcmp (argv[i], "-S")) {
				progp = FALSE;
				SysNum = nlibs;
				}
			else if (!strcmp (argv[i], "-M")) {
				if (++i>=argc) Fatal ("-m argument missing.\n");
				strcpy (&mainfunct, argv[i]);
				}
#ifdef MARC
			else if (!strcmp (argv[i], "-MARC")) {
				maxmemp = TRUE;
				marcp = TRUE;
				}
#endif
			else if (!strcmp (argv[i], "-ORG")) {
				if (++i>=argc) Fatal ("-org argument missing.\n");
				sscanf (argv[i], "%x", &origin);
				}
			else if (!strcmp (argv[i], "-T")) {
				if (++i >= argc) 
					Fatal ("-t argument missing.\n");
				Tflag = TRUE;
				sscanf (argv[i], "%x", &Tval);
				}
#ifdef OVERLAYS
			else if (!strcmp (argv[i], "-OVL")) {
				ovlp = TRUE;
				if (i + 2 >= argc) 
					Fatal ("-ovl argument missing.\n");
				strcpy (&symsfile, argv[++i]);
				sscanf (argv[++i], "%x", &origin);
				}
#endif
			else if (!strcmp (argv[i], "-D")) Dflag = TRUE; 
			else if (!strcmp (argv[i], "-W")) symsp = TRUE;
			else if (!strcmp (argv[i], "-WA")) 
				symsp = appstatsp = TRUE;
			else if (!strcmp (argv[i], "-WS")) 
				symsp = sepstatsp = TRUE;
			else if (!strcmp (argv[i], "-NS")) syslib = FALSE;
			else printf ("Unknown option: '%s'\n", argv[i]);
			}
		else {
			if (progp) strcpy (&progfiles[nprogs++], argv[i]);
			else strcpy (&libfiles[nlibs++], argv[i]);
			}
		}
	if (ovlp)
		strcpy(&mainfunct, &progfiles[0][2*(progfiles[0][1]==':')] );
	if (Dflag || !syslib || SysNum!=-1)
		Dflag = symsp = TRUE;
	if (syslib && SysNum == -1)
		SysNum = nlibs;
#define NDEFF	3
	deflibindex = nlibs;
#ifdef MARC
	strcpy (&libfiles[nlibs++], marcp ? "DEFFM" : "DEFF");
	strcpy (&libfiles[nlibs++], marcp ? "DEFF2M" : "DEFF2");
	strcpy (&libfiles[nlibs++], marcp ? "DEFF3M" : "DEFF3");
#else
	strcpy (&libfiles[nlibs++], DEF_DRIVE(DEFF) );
	strcpy (&libfiles[nlibs++], DEF_DRIVE(DEFF2) );
	strcpy (&libfiles[nlibs++], DEF_DRIVE(DEFF3) );
#endif
	}


loadccc()			/* load C.CCC (runtime library) */
{
	union ptr temp;
	unsigned len;

	codend.b = lspace;
	if (!ovlp) {
#ifdef MARC
		if (copen (&ibuf, marcp ? "CM.CCC" : "C.CCC") < 0)
#else
		if (copen (&ibuf, DEF_DRIVE(C.CCC) ) < 0)
#endif
			Fatal ("Can't open %s\n",DEF_DRIVE(C.CCC));
		if (cread (&ibuf, lspace, 128) < 128)	/* read a sector */
			Fatal ("%s: read error!\n",DEF_DRIVE(C.CCC));
		temp.b = lspace + 0x17;
		len = *temp.w;				/* how long is it? */
		cread (&ibuf, lspace + 128, len - 128);	/* read rest */
		codend.b += len;
		cclose (&ibuf);
		}
	else codend.i++->opcode = JMP;
	}


linkprog()				/* link in all program files */
{
	int i;
	union ptr dirtmp;
	struct funct *fnct;

	for (i=0; i<nprogs; ++i) {
		makeext (&progfiles[i], "CRL");
		if (copen (&ibuf, progfiles[i]) < 0) {
			printf ("Can't open %s\n", progfiles[i]);
			continue;
			}
		printf ("Loading  %s\n", &progfiles[i]);
		readprog (i==0);
		for (dirtmp.b=&fdir; *dirtmp.b != 0x80;) {
			fnct = intern (dirtmp.b);	/* for each module */
			skip7 (&dirtmp);		/* in directory */
			if (!fnct->flinkedp)
				linkmod (fnct, lodstart + *dirtmp.w - 0x205);
			else if (phase != DISK2) {
				puts ("Duplicate program function '");
				puts (&fnct->fname);
				puts ("', not linked.\n");
				}
			dirtmp.w++;
			}				/* intern & link it */
		cclose (&ibuf);
		}
	}


linklibs()				/* link in library files */
{
	int ifile;

	for (ifile=0; ifile<nlibs; ++ifile) {
		if (ifile==SysNum) SysStat = TRUE;
		scanlib (ifile);
		}
	while (missingp()) {
		puts ("Enter the name of a file to be searched or CR: ");
		gets (&libfiles[nlibs]);
		if (libfiles[nlibs][0]) {
			SysStat = FALSE;
			scanlib (nlibs);
			}
		else {
			if (SysNum!=-1)
				SysStat = TRUE;
			for (ifile=0; ifile<NDEFF; ++ifile)
				scanlib (deflibindex + ifile);
			}
		}
	acodend.b = codend.b - lspace + buforg;		/* save that number! */
	if (!exts.b) exts.b = acodend.b;
	}


missingp()		/* are any functions missing?  print them out */
{
	int i, foundp;

	foundp = FALSE;
	for (i=0; i<nfuncts; ++i)
		if (!ftab[i].flinkedp) {
			if (!foundp) puts ("*** Missing functions:\n");
			puts (&ftab[i].fname);
			puts ("\n");
			foundp = TRUE;
			}
	return (foundp);
	}


rescan()		/* perform second disk phase */
{
	int i;
	
	for (i=0; i < nfuncts; ++i)
		if (ftab[i].flinkedp == LINKED) ftab[i].flinkedp = FALSE;
	phase = DISK2;
	buforg = origin;
	puts ("\n\n**** Beginning second disk pass ****\n");
	if (!ovlp) makeext (&progfiles[0], "COM");
	else makeext (&progfiles[0], "OVL");
	ccreat (&obuf, &progfiles[0]);
	loadccc();
	hackccc();
	linkprog();
	linklibs();
	if (cwrite (&obuf, lspace, codend.b - lspace) == -1
	    ||  cflush (&obuf) < 0) Fatal ("Disk write error!\n");
	cclose (&obuf);
	stats (STDOUT);
	}



readprog (mainp)			/* read in a program file */
	FLAG mainp;
{
	char extp;				/* was -e used? */
	char *extstmp;
	union ptr dir;
	unsigned len;

	if (cread (&ibuf, &fdir, 512) < 512)		/* read directory */
		Fatal ("-- read error!\n");
	if (phase == INMEM  &&  mainp) {
		cread (&ibuf, &extp, 1);
		cread (&ibuf, &extstmp, 2);
		cread (&ibuf, &extspc, 2);
		if (extp) exts.b = extstmp;
		else exts.b = 0;		/* will be set later */
		}
	else cseek (&ibuf, 5, RELATIVE);
	for (dir.b=&fdir; *dir.b != 0x80; nextd (&dir));  /* find end of dir */
	++dir.b;
	len = *dir.w - 0x205;
	readobj (len);
	}


readobj (len)			/* read in an object (program or lib funct) */
	unsigned len;
{
	if (phase == DISK1  ||  codend.b + len >= lspcend) {
		if (phase == INMEM) {
			puts("\n** Out of memory--switching to disk mode **\n");
			phase = DISK1;
			}
		if (phase == DISK2) {
			if (cwrite (&obuf, lspace, codend.b - lspace) == -1)
				Fatal ("Disk write error!\n");
			}
		buforg += codend.b - lspace;
		codend.b = lspace;
		if (codend.b + len >= lspcend)
			Fatal ("Module won't fit in memory at all!\n");
		}
	lodstart = codend.b;
	if (cread (&ibuf, lodstart, len) < len) Fatal ("-- read error!\n");
	}


scanlib (ifile)
	int ifile;
{
	int i;
	union ptr dirtmp;

	makeext (&libfiles[ifile], "CRL");
	if (copen (&ibuf, libfiles[ifile]) < 0) {
		if (ifile != deflibindex + (NDEFF-1))
			printf ("Can't open %s\n", libfiles[ifile]);
		return;
		}
	printf ("Scanning %s\n", &libfiles[ifile]);
	if (cread (&ibuf, &fdir, 512) < 512)	/* read directory */
		Fatal ("-- Read error!\n");
	for (i=0; i<nfuncts; ++i) {		/* scan needed functions */
		if (!ftab[i].flinkedp
		    && (dirtmp.b = dirsearch (&ftab[i].fname))) {
			readfunct (dirtmp.b);
			linkmod (&ftab[i], lodstart);
			}
		}
	cclose (&ibuf);
	}


readfunct (direntry)			/* read a function (from a library) */
	union ptr direntry;
{
	unsigned start, len;

	skip7 (&direntry);
	start = *direntry.w++;
	skip7 (&direntry);
	len = *direntry.w - start;
	if (cseek (&ibuf, start, ABSOLUTE) < 0) Fatal (" -- read error!");
	readobj (len);
	}


linkmod (fnct, modstart)		/* link in a module */
	struct funct *fnct;
	union ptr modstart;		/* loc. of module in memory */

{
	union ptr temp,
			jump,		/* jump table temp */
			body,		/* loc. of function in memory */
			code,		/* loc. of code proper in mem. */
			finalloc;	/* runtime loc. of function */
	unsigned flen, nrelocs, jtsiz, offset;

	fnct->flinkedp = LINKED;
	if (phase != DISK2) {
		finalloc.b = codend.b - lspace + buforg;
		if (phase == INMEM) chase (fnct->faddr, finalloc.b);
		fnct->faddr = finalloc.b;
		}
 	else finalloc.b = fnct->faddr;
	body.b = modstart.b + strlen(modstart.b) + 3; /* loc. of fn body */
	jump.i = body.i + (*modstart.b ? 1 : 0);
	for (temp.b = modstart.b; *temp.b; skip7(&temp)) {
		jump.i->address = intern (temp.b);
		++jump.i;
		}
	++temp.b;
	flen = *temp.w;
	code.b = jump.b;
	temp.b = body.b + flen;		/* loc. of reloc parameters */
	nrelocs = *temp.w++;
	jtsiz = code.b - body.b;
	if (Dflag && fnct->fdebug) {
		if (phase!=DISK1) {
			codend.i->opcode = (0307 + (8*RST_NUM));
			codend.i->address = 0;
			finalloc.b += 3;
			}
		codend.b += 3;
		}
	offset = code.b - codend.b;
	if (phase != DISK1)
		while (nrelocs--) relocate (*temp.w++, body.b, jtsiz,
						   finalloc.b, offset, flen);
	flen -= jtsiz;
	if (phase != DISK2) jtsaved += jtsiz;
	if (phase != DISK1) movmem (code.b, codend.b, flen);
	codend.b += flen;
	}


relocate (param, body, jtsiz, base, offset, flen)	/* do a relocation!! */
	unsigned param, jtsiz, base, offset, flen;
	union ptr body;
{
	union ptr instr,			/* instruction involved */
			ref;			    /* jump table link */
	struct funct *fnct;

/*	if (param == 1) return;			/* don't reloc jt skip */*/
	instr.b = body.b + param - 1;
	if (instr.i->address >= jtsiz)
		instr.i->address += base - jtsiz;	/* vanilla case */
	else {
		ref.b = instr.i->address + body.u;
		if (instr.i->opcode == LHLD) {
			instr.i->opcode = LXIH;
			--ref.b;
			}
		fnct = ref.i->address;
		instr.i->address = fnct->faddr;		/* link in */
		if (!fnct->flinkedp  &&  phase == INMEM)
			fnct->faddr = instr.b + 1 - offset;  /* new list head */
		}
	}


intern (name)			/* intern a function name in the table */
	char *name;
{
	struct funct *fptr;

	if (*name == 0x9D) name = "MAIN";		/* Why, Leor, WHY??? */
	for (fptr = &ftab[nfuncts-1]; fptr >= ftab; --fptr) 
		if (!strcmp7 (name, fptr->fname)) break;
	if (fptr < ftab) {
		if (nfuncts >= maxfuncts)
			Fatal("Too many functions (limit is %d)!\n", maxfuncts);
		fptr = &ftab[nfuncts];
		strcpy7 (fptr->fname, name);
		str7tont (fptr->fname);
		fptr->flinkedp = FALSE;
		fptr->faddr = NULL;
		fptr->fdebug = !SysStat;
		++nfuncts;
		}
	return (fptr);
	}


dirsearch (name)			/* search directory for a function */
	char *name;
{
	union ptr temp;

	for (temp.b = &fdir; *temp.b != 0x80; nextd (&temp))
		if (!strcmp7 (name, temp.b)) return (temp.b);
	return (NULL);
	}


nextd (ptrp)			/* move this pointer to the next dir entry */
	union ptr *ptrp;
{
	skip7 (ptrp);
	++(*ptrp).w;
	}


chase (head, loc)		/* chase chain of refs to function */
	union ptr head;
	unsigned loc;
{
	union ptr temp;

	while (head.w) {
		temp.w = *head.w;
		*head.w = loc;
		head.u = temp.u;
		}
	}


wrtcom()			/* write out com file (from in-mem link) */
{
	hackccc();
	if (!ovlp) makeext (&progfiles[0], "COM");
	else makeext (&progfiles[0], "OVL");
	if (!ccreat (&obuf, &progfiles[0]) < 0
	    ||  cwrite (&obuf, lspace, codend.b - lspace) == -1
	    ||  cflush (&obuf) < 0)
		Fatal ("Disk write error!\n");
	cclose (&obuf);
	stats (STDOUT);
	}


hackccc()			/* store various goodies in C.CCC code */
{
	union ptr temp;
	struct funct *fptr;

	temp.b = lspace;
	fptr = intern (&mainfunct);
	if (!ovlp) {
#ifdef MARC
		if (!marcp) {
#endif
		  	if (!Tflag) {
				temp.i->opcode = LHLD;
				temp.i->address = origin - 0x100 + 6;
				(++temp.i)->opcode = SPHL;
				}
			else {
				temp.i->opcode = LXISP;
				temp.i->address = Tval;
				}
			temp.b = lspace + 0xF;	    /* main function address */
			temp.i->address = fptr->faddr;
#ifdef MARC
			}
#endif
		temp.b = lspace + 0x15;
		*temp.w++ = exts.u;
		++temp.w;
		*temp.w++ = acodend.u;
		*temp.w++ = exts.u + extspc;
		}
	else temp.i->address = fptr->faddr;		/* that's a JMP */
#ifdef MARC
	if (maxmemp) {
		temp.b = lspace + 0x258;
		temp.i->opcode = CALL;
		temp.i->address = 0x50;
		}
#endif
	}


wrtsyms()					/* write out symbol table */
{
	int i, fd, compar();
	
	qsort (ftab, nfuncts, sizeof(*ftab), &compar);
	makeext (&progfiles[0], "SYM");
	if (fcreat (&progfiles[0], &symbuf) < 0)
		Fatal ("Can't create .SYM file\n");
	for (i=0; i < nfuncts; ++i) {
		puthex (ftab[i].faddr, &symbuf);
		putc (' ', &symbuf);
		fputs (&ftab[i].fname, &symbuf);
		if (i % 4 == 3) fputs ("\n", &symbuf);
		else {
			if (strlen (&ftab[i].fname) < 3) putc ('\t', &symbuf);
			putc ('\t', &symbuf);
			}
		}
	if (i % 4) fputs ("\n", &symbuf);	
	if (appstatsp) stats (&symbuf);
	putc (CPMEOF, &symbuf);
	fflush (&symbuf);
	fclose (&symbuf);
	if (sepstatsp) {
		makeext (&progfiles[0], "LNK");
		if (fcreat (&progfiles[0], &symbuf) < 0)
			Fatal ("Can't create .LNK file\n");
		stats (&symbuf);
		putc (CPMEOF, &symbuf);
		fflush (&symbuf);
		fclose (&symbuf);
		}
	}


compar (f1, f2)			/* compare two symbol table entries by name */
	struct funct *f1, *f2;
{
/*	return (strcmp (&f1->fname, &f2->fname));	alphabetical order */
	return (f1->faddr > f2->faddr);			/* memory order */
	}


#ifdef OVERLAYS
loadsyms()			/* load base symbol table (for overlay) */
{				    /* symbol table must be empty! */
	int nread;
	FLAG done;
	char *c;
	
	makeext (&symsfile, "SYM");
	if (fopen (&symsfile, &symbuf) < 0) 
		Fatal ("Can't open %s.\n", &symsfile);
	done = FALSE;
	while (!done) {
		nread = 
		   fscanf (&symbuf, "%x %s\t%x %s\t%x %s\t%x %s\n", 
			   &(ftab[nfuncts].faddr), &(ftab[nfuncts].fname),
			   &(ftab[nfuncts+1].faddr), &(ftab[nfuncts+1].fname),
			   &(ftab[nfuncts+2].faddr), &(ftab[nfuncts+2].fname),
			   &(ftab[nfuncts+3].faddr), &(ftab[nfuncts+3].fname));
		nread /= 2;
		if (nread < 4) done = TRUE;
		while (nread-- > 0) ftab[nfuncts++].flinkedp = EXTERNAL;
		}
	fclose (&symbuf);
	}
#endif


stats (chan)				/* print statistics on chan */
	int chan;
{
	unsigned temp, *tptr;

	tptr = 6;
	fprintf (chan, "\n\nLink statistics:\n");
	fprintf (chan, "  Number of functions: %d\n", nfuncts);
	fprintf (chan, "  Code ends at: 0x%x\n", acodend.u);
	fprintf (chan, "  Externals begin at: 0x%x\n", exts.u);
	fprintf (chan, "  Externals end at: 0x%x\n", exts.u + extspc);
	fprintf (chan, "  End of current TPA: 0x%x\n", *tptr);
	fprintf (chan, "  Jump table bytes saved: 0x%x\n", jtsaved);
	temp = lspcend;
	if (phase == INMEM)
		fprintf (chan,
		   "  Link space remaining: %dK\n", (temp - codend.u) / 1024);
	}


makeext (fname, ext)		/* force a file extension to ext */
	char *fname, *ext;
{
	while (*fname && (*fname != '.')) {
		*fname = toupper (*fname);		/* upcase as well */
		++fname;
		}
	*fname++ = '.';
	strcpy (fname, ext);
	}


strcmp7 (s1, s2) char *s1, *s2; {

   	/* compare two strings, either bit-7-terminated or null-terminated */

	for (; (_c1 = *s1) == *s2; s1++, s2++)
		if ( (0x80 & _c1) || !_c1) return 0;

	if ((_c1 &= 0x7F) < (_c2 = 0x7F & *s2)) return -1;
	if (_c1 > _c2) return  1;

	_end1 = (*s1 & 0x80) || !*(s1+1);
	_end2 = (*s2 & 0x80) || !*(s2+1);
	if (_end2  &&  !_end1) return 1;
	if (_end1  &&  !_end2) return -1;
	/* if (_end1  &&  _end2) */ return 0;
}

strcpy7 (s1, s2)			/* copy s2 into s1 */
	char *s1, *s2;
{
	do {
		*s1 = *s2;
		if (!*(s2+1)) {			/* works even if */
			*s1 |= 0x80;			/* s2 is null-term */
			break;
			}
		++s1;
		} while (!(*s2++ & 0x80));
	}


skip7 (ptr7)				/* move this pointer past a string */
	char **ptr7;
{
	while (!(*(*ptr7)++ & 0x80));
	}


str7tont (s)				/* add null at end */
	char *s;
{
	while (!(*s & 0x80)) {
		if (!*s) return;		/* already nul term! */
		s++;
		}
	*s = *s & 0x7F;
	*++s = NUL;
	}


puthex (n, obuf)			/* output a hex word, with leading 0s */
	unsigned n;
	char *obuf;
{
	int i, nyb;
	
	for (i = 3; i >= 0; --i) {
		nyb = (n >> (i * 4)) & 0xF;
		nyb += (nyb > 9) ? 'A' - 10 : '0';
		putc (nyb, obuf);
		}
	}


Fatal (arg1, arg2, arg3, arg4)	/* lose, lose */
	char *arg1, *arg2, *arg3, *arg4;
{
	printf (arg1, arg2, arg3, arg4);
	lexit (1);
	}


lexit (status)				/* exit the program */
	int status;
{
	if (status == 1)
		unlink (SUB_FILE);
	exit();					/* bye! */
	}



/* END OF L2.C */
