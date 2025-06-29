/********************************************************/
/*							*/
/*		Q/C Compiler Version 3.0		*/
/*		   Global Definitions			*/
/*							*/
/*     Copyright (c) 1983 Quality Computer Systems	*/
/*							*/
/*			04/30/83			*/
/********************************************************/

int	segtype = CODE, 	/* record whether code or data segment */
	fullist = FALSE,	/* commented listing? */
	mainflag = FALSE,	/* has main() been defined? */
	libflag = FALSE,	/* is library being generated? */
	trace = FALSE,		/* print trace messages? */
	genflag = TRUE, 	/* FALSE to suppress code generation */
	romflag = FALSE,	/* generating ROMable code? */
	spaddr, 		/* if romflag==TRUE, addr to init SP */
	cmode = TRUE,		/* parsing C or passing asm thru? */
	midline = FALSE,	/* at beginning of output line? */
	pregflag = FALSE,	/* does preg contain curr val of expr? */
	retvalue = FALSE,	/* is return value in preg? */
	testdone = FALSE,	/* was a test (e.g. ==) just done? */
	eof = FALSE,		/* reached end-of-file? */
	stopeol = FALSE,	/* TRUE if parser must stop at end of */
				/*	line when skipping white space */
	infunc = FALSE, 	/* compiling a function? */
	textline = FALSE;	/* printing a C text line? */
/*
 *	Compiler tables & pointers
 */
struct typeinfo
	*typelist,		/* the type table */
	*basetypes[T_MAX],	/* heads of each base-type list */
	*functype,		/* constant 'function returning int' */
	*labeltype,		/* constant 'statement label' */
	*chartype,		/* constant 'char'	*/
	*inttype,		/* constant 'int'	*/
	*unsgntype;		/* constant 'unsigned'	*/

struct typestack
	*tsptr, 	/* type stack top */
	*tslim; 	/* type stack limit */
/*
 *	Symbol table
 */
struct st
	*symtab,	/* beginning of symbol table */
	*glbptr,	/* next global sym table entry */
	*locptr;	/* next local sym table entry */
/*
 *	Literal pool
 */
struct st
	lit_sym;	/* special "symbol" for literal pool */
char	*litpool,	/* beginning of literal pool */
	*plitpool;	/* next char in literal pool */
/*
 *	Macro pool
 */
char	*macpool,	/* beginning of macro pool */
	*pmacsym,	/* next macro pool sym entry */
	*pmacdef;	/* next macro pool def entry */
/*
 *	Switch/loop queue
 */
struct swq
	*swq,		/* start of switch/loop queue */
	*pswq;		/* next switch/loop entry */
/*
 *	Switch/case table
 */
struct case_table
	*casetab,	/* start of switch case table */
	*pcasetab;	/* next switch case entry */

char	*line,		/* parsing buffer */
	*lptr,		/* parsing line buffer */
	*mline, 	/* temp macro buffer */
	*mptr;		/* temp macro line buffer */

unsigned
	mintype,	/* record minimum type table space */
	minsym, 	/*		symbol table space */
	minlit; 	/*		literal pool space */
/*
 *	Misc variables
 */
char	infil[FILNAMSIZE + 1],	 /* input file name */
	outfil[FILNAMSIZE + 1],  /* output file name */
	inclfil[MAXINCL * (FILNAMSIZE + 1)];
			/* hold input file name during #include */

FILE	*input, 	/* iob for current input file */
	*output,	/* iob for output file (if any) */
	holdinput[MAXINCL]; /* hold input file iob during #include */

int	ninfils,	/* # of input files */
	*infilptr,	/* name of current input file */
	lineno, 	/* line number in current input file */
	incldepth,	/* current depth of #include nesting */
	holdlineno[MAXINCL], /* hold input file line no during #include */
	holdfil[MAXINCL] = {	/* ptrs to nested #include file names */
		&inclfil[0 * FILNAMSIZE],
		&inclfil[1 * FILNAMSIZE],
		&inclfil[2 * FILNAMSIZE]
		},
	ifdepth = 0,	/* current depth of #if nesting */
	holdif[MAXIF],	/* hold process status of nested #if */
	holdelse[MAXIF],/* record presence of #else for nested #if */
	condif=PROCESS, /* records whether #if says to PROCESS or SKIP */
	condelse=FALSE, /* records whether matching #else was found */
	nxtlab, 	/* next avail label */
	retlab, 	/* label # of return for current function */
	argcnt, 	/* number of arguments in current function */
	initted,	/* # of bytes initialized for current var */
	nregvar,	/* # of register variables in current function */
	ncmp,		/* # open compound statements */
	errcnt; 	/* # errors in compilation */
/*
 *	Peephole optimization variables
 */
int	peepflag,	/* type of pattern (if any) */
	testflag,	/* = TESTED, REGH, or REGL */
	jcondlabel,	/* label on last conditional jump */
	jumplabel;	/* label on following unconditional jump */
char	*peepbuf,	/* buffer for patterns */
	peepsym[NAMESIZE]; /* name of symbol currently in preg */
int	peepoffset;	/* offset from symbol currently in preg */

/********************************************************/
/*	Global variables referenced by QRESET		*/
/*							*/
/* If you change the compiler and you still want QRESET */
/* to work, this code must remain unchanged.		*/
/********************************************************/

#asm
	CSEG
#endasm
char	copyright[] = " Copyright (c) 1983 Quality Computer Systems";
char	signon[] = "Q/C Compiler ";

#if Z80
char	version[] = "V3.0 (Z80)";
#else
char	version[] = "V3.0 (8080)";
#endif

int	nsym = 200,		/* size of symbol table */
	n_types = 35,		/* size of type table */
	nswq = 10,		/* max entries in switch/loop queue */
	ncases = 50,		/* max entries in switch case table */
	litpsize = 1000,	/* size of literal pool */
	macpsize = 1000,	/* size of macro (#define) pool */
	pausecnt = 6,		/* pause after this many errors on screen */
	initflag = TRUE,	/* TRUE if all arrays get initialized */
				/* FALSE: don't do default init */
				/*	of arrays > INITSIZE */
	verbose = FALSE,	/* TRUE to chat during compile */
	redirect = FALSE,	/* TRUE if redirection requested */
	codeflag = DEFASM;	/* default assembler: 'm'-M80, 'a'-RMAC */
#if DEFASM == 'm'
char	defext[] = "MAC";
#else
char	defext[] = "ASM";
#endif

/********************************************************/
/*	End of global variables referenced by QRESET	*/
/********************************************************/

/* end of CGLBDEF.C */
