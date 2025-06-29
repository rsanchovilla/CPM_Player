/* Q/C Compiler Version 3.0
 *	Global Declarations
 *	Copyright (c) 1983 Quality Computer Systems
 *	04/24/83
 */
extern
int	segtype,
	fullist,
	mainflag,
	libflag,
	trace,
	genflag,
	romflag,
	spaddr,
	cmode,
	midline,
	pregflag,
	retvalue,
	testdone,
	eof,
	stopeol,
	infunc,
	textline;
extern
struct typeinfo
	*typelist,
	*basetypes[],
	*functype,
	*labeltype,
	*chartype,
	*inttype,
	*unsgntype;
extern
struct typestack
	*tsptr,
	*tslim;
extern
struct st
	*symtab,
	*glbptr,
	*locptr;
extern
struct st
	lit_sym;
extern
char	*litpool,
	*plitpool;
extern
char	*macpool,
	*pmacsym,
	*pmacdef;
extern
struct swq
	*swq,
	*pswq;
extern
struct case_table
	*casetab,
	*pcasetab;
extern
char	*line,
	*lptr,
	*mline,
	*mptr;
extern
unsigned
	mintype,
	minsym,
	minlit;
extern
char	infil[],
	outfil[],
	inclfil[];
extern
FILE	*input,
	*output,
	holdinput[];
extern
int	ninfils,
	*infilptr,
	lineno,
	incldepth,
	holdlineno[],
	holdfil[],
	ifdepth,
	holdif[],
	holdelse[],
	condif,
	condelse,
	nxtlab,
	retlab,
	argcnt,
	initted,
	nregvar,
	ncmp,
	errcnt;
extern
int	peepflag,
	testflag,
	jcondlabel,
	jumplabel;
extern
char	*peepbuf,
	peepsym[];
extern
int	peepoffset;
extern
char	copyright[],
	signon[],
	version[];
extern
int	nsym,
	n_types,
	nswq,
	ncases,
	litpsize,
	macpsize,
	pausecnt,
	initflag,
	verbose,
	redirect,
	codeflag;
extern
char	defext[];
