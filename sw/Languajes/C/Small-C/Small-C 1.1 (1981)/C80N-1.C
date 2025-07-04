/************************************************/
/*						*/
/*		small-c compiler		*/
/*						*/
/*		  by Ron Cain			*/
/*						*/
/************************************************/

#define BANNER  "* * *  Small-C  V1.1  * * *"

#define VERSION "CP/M Version N: April 1, 1981"

#define AUTHOR "       By Ron Cain"

/*	Define system dependent parameters	*/

/*	Stand-alone definitions			*/

#define NULL 0
#define eol 13

/*	UNIX definitions (if not stand-alone)	*/

/* #include <stdio.h>	*/
/* #define eol 10	*/

/*	Define the symbol table parameters	*/

#define	symsiz	14
#define	symtbsz	5040
#define numglbs 300
#define	startglb symtab
#define	endglb	startglb+numglbs*symsiz
#define	startloc endglb+symsiz
#define	endloc	symtab+symtbsz-symsiz

/*	Define symbol table entry format	*/

#define	name	0
#define	ident	9
#define	type	10
#define	storage	11
#define	offset	12

/*	System wide name size (for symbols)	*/

#define	namesize 9
#define namemax  8

/*	Define possible entries for "ident"	*/

#define	variable 1
#define	array	2
#define	pointer	3
#define	function 4

/*	Define possible entries for "type"	*/

#define	cchar	1
#define	cint	2

/*	Define possible entries for "storage"	*/

#define	statik	1
#define	stkloc	2

/*	Define the "while" statement queue	*/

#define	wqtabsz	100
#define	wqsiz	4
#define	wqmax	wq+wqtabsz-wqsiz

/*	Define entry offsets in while queue	*/

#define	wqsym	0
#define	wqsp	1
#define	wqloop	2
#define	wqlab	3

/*	Define the literal pool			*/

#define	litabsz	2000
#define	litmax	litabsz-1

/*	Define the input line			*/

#define	linesize 80
#define	linemax	linesize-1
#define	mpmax	linemax

/*	Define the macro (define) pool		*/

#define	macqsize 1000
#define	macmax	macqsize-1

/*	Define statement types (tokens)		*/

#define	stif	1
#define	stwhile	2
#define	streturn 3
#define	stbreak	4
#define	stcont	5
#define	stasm	6
#define	stexp	7

/* Define how to carve up a name too long for the assembler */

#define asmpref	7
#define asmsuff	7

/*	Now reserve some storage words		*/

char	symtab[symtbsz];	/* symbol table */
char	*glbptr,*locptr;		/* ptrs to next entries */

int	wq[wqtabsz];		/* while queue */
int	*wqptr;			/* ptr to next entry */

char	litq[litabsz];		/* literal pool */
int	litptr;			/* ptr to next entry */

char	macq[macqsize];		/* macro string buffer */
int	macptr;			/* and its index */

char	line[linesize];		/* parsing buffer */
char	mline[linesize];	/* temp macro buffer */
int	lptr,mptr;		/* ptrs into each */

/*	Misc storage	*/

int	nxtlab,		/* next avail label # */
	litlab,		/* label # assigned to literal pool */
	Zsp,		/* compiler relative stk ptr */
	argstk,		/* function arg sp */
	ncmp,		/* # open compound statements */
	errcnt,		/* # errors in compilation */
	errstop,	/* stop on error			gtf 7/17/80 */
	eof,		/* set non-zero on final input eof */
	input,		/* iob # for input file */
	output,		/* iob # for output file (if any) */
	input2,		/* iob # for "include" file */
	glbflag,	/* non-zero if internal globals */
	ctext,		/* non-zero to intermix c-source */
	cmode,		/* non-zero while parsing c-code */
			/* zero when passing assembly code */
	lastst,		/* last executed statement type */
	mainflg,	/* output is to be first asm file	gtf 4/9/80 */
	saveout,	/* holds output ptr when diverted to console	   */
			/*					gtf 7/16/80 */
	fnstart,	/* line# of start of current fn.	gtf 7/2/80 */
	lineno,		/* line# in current file		gtf 7/2/80 */
	infunc,		/* "inside function" flag		gtf 7/2/80 */
	savestart,	/* copy of fnstart "	"		gtf 7/16/80 */
	saveline,	/* copy of lineno  "	"		gtf 7/16/80 */
	saveinfn;	/* copy of infunc  "	"		gtf 7/16/80 */

char   *currfn,		/* ptr to symtab entry for current fn.	gtf 7/17/80 */
       *savecurr;	/* copy of currfn for #include		gtf 7/17/80 */
char	quote[2];	/* literal string for '"' */
char	*cptr;		/* work ptr to any char buffer */
int	*iptr;		/* work ptr to any int buffer */
/*	>>>>> start cc1 <<<<<<		*/

/*					*/
/*	Compiler begins execution here	*/
/*					*/
main()
	{
	glbptr=startglb;	/* clear global symbols */
	locptr=startloc;	/* clear local symbols */
	wqptr=wq;		/* clear while queue */
	macptr=		/* clear the macro pool */
	litptr=		/* clear literal pool */
  	Zsp =		/* stack ptr (relative) */
	errcnt=		/* no errors */
	errstop=	/* keep going after an error		gtf 7/17/80 */
	eof=		/* not eof yet */
	input=		/* no input file */
	input2=		/* or include file */
	output=		/* no open units */
	saveout=	/* no diverted output */
	ncmp=		/* no open compound states */
	lastst=		/* no last statement yet */
	mainflg=	/* not first file to asm 		gtf 4/9/80 */
	fnstart=	/* current "function" started at line 0 gtf 7/2/80 */
	lineno=		/* no lines read from file		gtf 7/2/80 */
	infunc=		/* not in function now			gtf 7/2/80 */
	quote[1]=
	0;		/*  ...all set to zero.... */
	quote[0]='"';		/* fake a quote literal */
	currfn=NULL;	/* no function yet			gtf 7/2/80 */
	cmode=1;	/* enable preprocessing */
	/*				*/
	/*	compiler body		*/
	/*				*/
	ask();			/* get user options */
	openout();		/* get an output file */
	openin();		/* and initial input file */
	header();		/* intro code */
	parse(); 		/* process ALL input */
	dumplits();		/* then dump literal pool */
	dumpglbs();		/* and all static memory */
	trailer();		/* follow-up code */
	closeout();		/* close the output (if any) */
	errorsummary();		/* summarize errors (on console!) */
	return;			/* then exit to system */
	}

/*					*/
/*	Abort compilation		*/
/*		gtf 7/17/80		*/
abort()
{
	if(input2)
		endinclude();
	if(input)
		fclose(input);
	closeout();
	toconsole();
	pl("Compilation aborted.");  nl();
	exit();
/* end abort */}

/*					*/
/*	Process all input text		*/
/*					*/
/* At this level, only static declarations, */
/*	defines, includes, and function */
/*	definitions are legal...	*/
parse()
	{
	while (eof==0)		/* do until no more input */
		{
		if(amatch("char",4)){declglb(cchar);ns();}
		else if(amatch("int",3)){declglb(cint);ns();}
		else if(match("#asm"))doasm();
		else if(match("#include"))doinclude();
		else if(match("#define"))addmac();
		else newfunc();
		blanks();	/* force eof if pending */
		}
	}
/*					*/
/*	Dump the literal pool		*/
/*					*/
dumplits()
	{int j,k;
	if (litptr==0) return;	/* if nothing there, exit...*/
	printlabel(litlab);col(); /* print literal label */
	k=0;			/* init an index... */
	while (k<litptr)	/* 	to loop with */
		{defbyte();	/* pseudo-op to define byte */
		j=10;		/* max bytes per line */
		while(j--)
			{outdec((litq[k++]&127));
			if ((j==0) | (k>=litptr))
				{nl();		/* need <cr> */
				break;
				}
			outbyte(',');	/* separate bytes */
			}
		}
	}
/*					*/
/*	Dump all static variables	*/
/*					*/
dumpglbs()
	{
	int j;
	if(glbflag==0)return;	/* don't if user said no */
	cptr=startglb;
	while(cptr<glbptr)
		{if(cptr[ident]!=function)
			/* do if anything but function */
			{outname(cptr);col();
				/* output name as label... */
			defstorage();	/* define storage */
			j=((cptr[offset]&255)+
				((cptr[offset+1]&255)<<8));
					/* calc # bytes */
			if((cptr[type]==cint)|
				(cptr[ident]==pointer))
				j=j+j;
			outdec(j);	/* need that many */
			nl();
			}
		cptr=cptr+symsiz;
		}
	}
/*					*/
/*	Report errors for user		*/
/*					*/
errorsummary()
	{
	/* see if anything left hanging... */
	if (ncmp) error("missing closing bracket");
		/* open compound statement ... */
	nl();
	outstr("There were ");
	outdec(errcnt);	/* total # errors */
	outstr(" errors in compilation.");
	nl();
	}
/*					*/
/*	Get options from user		*/
/*					*/
ask()
	{
	int k,num[1];
	kill();			/* clear input line */
	outbyte(12);		/* clear the screen */
	nl();nl();		/* print banner */
	pl(BANNER);
	nl();
	pl(AUTHOR);
	nl();nl();
	pl("Distributed by: The Code Works(tm)");
	pl("                Box 550, Goleta, CA 93116");
	nl();
	pl(VERSION);
	nl();
	nl();
	/* see if user wants to interleave the c-text */
	/*	in form of comments (for clarity) */
	pl("Do you want the c-text to appear (y,N) ? ");
	gets(line);		/* get answer */
	ctext=0;		/* assume no */
	if((ch()=='Y')|(ch()=='y'))
		ctext=1;	/* user said yes */
	/* see if the user is compiling everything at once */
	/*	(as is usually the case) - gtf 4/9/80 */
	pl("Are you compiling the whole program at once (Y,n) ? ");
	gets(line);
	if((ch()!='N')&(ch()!='n')){	/* single file - assume... */
		glbflag=1;	/* define globals */
		mainflg=1;	/* first file to assembler */
		nxtlab =0;	/* start numbers at lowest possible */
		}
	else {		/* one of many - ask everything */
	 	/* see if user wants us to allocate static */
	 	/*  variables by name in this module	*/
	 	/*	(pseudo external capability)	*/
	 	pl("Do you want the globals to be defined (y,N) ? ");
	 	gets(line);
	 	glbflag=0;
	 	if((ch()=='Y')|(ch()=='y'))
	 		glbflag=1;	/* user said yes */
	 	/* see if we should put out the stuff	*/
	 	/*	needed for the first assembler	*/
	 	/*	file. - gtf 4/9/80		*/
		pl("Is the output file the first one the assembler will see (y,N) ? ");
	 	gets(line);
	 	mainflg=0;
	 	if((ch()=='Y')|(ch()=='y'))
	 		mainflg=1;	/* indeed it is */
	 	/* get first allowable number for compiler-generated */
	 	/*	labels (in case user will append modules) */
	 	while(1){
	 		pl("Starting number for labels (0) ? ");
	 		gets(line);
	 		if(ch()==0){num[0]=0;break;}
	 		if(k=number(num))break;
	 		}
	 	nxtlab=num[0];
		}
	/* see if user wants to be sure to see all errors */
	pl("Should I pause after an error (y,N) ? ");
	gets(line);
	errstop=0;
	if((ch()=='Y')|(ch()=='y'))
		errstop=1;

	litlab=getlabel();	/* first label=literal pool */ 
	kill();			/* erase line */
	}
/*					*/
/*	Get output filename		*/
/*					*/
openout()
	{
	kill();			/* erase line */
	output=0;		/* start with none */
	pl("Output filename? "); /* ask...*/
	gets(line);	/* get a filename */
	if(ch()==0)return;	/* none given... */
	if((output=fopen(line,"w"))==NULL) /* if given, open */
		{output=0;	/* can't open */
		error("Open failure!");
		}
	kill();			/* erase line */
}
/*					*/
/*	Get (next) input file		*/
/*					*/
openin()
{
	input=0;		/* none to start with */
	while(input==0){	/* any above 1 allowed */
		kill();		/* clear line */
		if(eof)break;	/* if user said none */
		pl("Input filename? ");
		gets(line);	/* get a name */
		if(ch()==0)
			{eof=1;break;} /* none given... */
		if((input=fopen(line,"r"))!=NULL)
			newfile();			/* gtf 7/16/80 */
		else {	input=0;	/* can't open it */
			pl("Open failure");
			}
		}
	kill();		/* erase line */
	}

/*					*/
/*	Reset line count, etc.		*/
/*			gtf 7/16/80	*/
newfile()
{
	lineno  = 0;	/* no lines read */
	fnstart = 0;	/* no fn. start yet. */
	currfn  = NULL;	/* because no fn. yet */
	infunc  = 0;	/* therefore not in fn. */
/* end newfile */}

/*					*/
/*	Open an include file		*/
/*					*/
doinclude()
{
	blanks();	/* skip over to name */

	toconsole();					/* gtf 7/16/80 */
	outstr("#include "); outstr(line+lptr); nl();
	tofile();

	if(input2)					/* gtf 7/16/80 */
		error("Cannot nest include files");
	else if((input2=fopen(line+lptr,"r"))==NULL)
		{input2=0;
		error("Open failure on include file");
		}
	else {	saveline = lineno;
		savecurr = currfn;
		saveinfn = infunc;
		savestart= fnstart;
		newfile();
		}
	kill();		/* clear rest of line */
			/* so next read will come from */
			/* new file (if open */
}

/*					*/
/*	Close an include file		*/
/*			gtf 7/16/80	*/
endinclude()
{
	toconsole();
	outstr("#end include"); nl();
	tofile();

	input2  = 0;
	lineno  = saveline;
	currfn  = savecurr;
	infunc  = saveinfn;
	fnstart = savestart;
/* end endinclude */}

/*					*/
/*	Close the output file		*/
/*					*/
closeout()
{
	tofile();	/* if diverted, return to file */
	if(output)fclose(output); /* if open, close it */
	output=0;		/* mark as closed */
}
/*					*/
/*	Declare a static variable	*/
/*	  (i.e. define for use)		*/
/*					*/
/* makes an entry in the symbol table so subsequent */
/*  references can call symbol by name	*/
declglb(typ)		/* typ is cchar or cint */
	int typ;
{	int k,j;char sname[namesize];
	while(1)
		{while(1)
			{if(endst())return;	/* do line */
			k=1;		/* assume 1 element */
			if(match("*"))	/* pointer ? */
				j=pointer;	/* yes */
				else j=variable; /* no */
			 if (symname(sname)==0) /* name ok? */
				illname(); /* no... */
			if(findglb(sname)) /* already there? */
				multidef(sname);
			if (match("["))		/* array? */
				{k=needsub();	/* get size */
				if(k)j=array;	/* !0=array */
				else j=pointer; /* 0=ptr */
				}
			addglb(sname,j,typ,k); /* add symbol */
			break;
			}
		if (match(",")==0) return; /* more? */
		}
	}
/*					*/
/*	Declare local variables		*/
/*	(i.e. define for use)		*/
/*					*/
/* works just like "declglb" but modifies machine stack */
/*	and adds symbol table entry with appropriate */
/*	stack offset to find it again			*/
declloc(typ)		/* typ is cchar or cint */
	int typ;
	{
	int k,j;char sname[namesize];
	while(1)
		{while(1)
			{if(endst())return;
			if(match("*"))
				j=pointer;
				else j=variable;
			if (symname(sname)==0)
				illname();
			if(findloc(sname))
				multidef(sname);
			if (match("["))
				{k=needsub();
				if(k)
					{j=array;
					if(typ==cint)k=k+k;
					}
				else
					{j=pointer;
					k=2;
					}
				}
			else
				if((typ==cchar)
					&(j!=pointer))
					k=1;else k=2;
			/* change machine stack */
			Zsp=modstk(Zsp-k);
			addloc(sname,j,typ,Zsp);
			break;
			}
		if (match(",")==0) return;
		}
	}
/*	>>>>>> start of cc2 <<<<<<<<	*/

/*					*/
/*	Get required array size		*/
/*					*/
/* invoked when declared variable is followed by "[" */
/*	this routine makes subscript the absolute */
/*	size of the array. */
needsub()
	{
	int num[1];
	if(match("]"))return 0;	/* null size */
	if (number(num)==0)	/* go after a number */
		{error("must be constant");	/* it isn't */
		num[0]=1;		/* so force one */
		}
	if (num[0]<0)
		{error("negative size illegal");
		num[0]=(-num[0]);
		}
	needbrack("]");		/* force single dimension */
	return num[0];		/* and return size */
	}
/*					*/
/*	Begin a function		*/
/*					*/
/* Called from "parse" this routine tries to make a function */
/*	out of what follows.	*/
newfunc()
	{
	char n[namesize];	/* ptr => currfn,  gtf 7/16/80 */
	if (symname(n)==0)
		{error("illegal function or declaration");
		kill();	/* invalidate line */
		return;
		}
	fnstart=lineno;		/* remember where fn began	gtf 7/2/80 */
	infunc=1;		/* note, in function now.	gtf 7/16/80 */
	if(currfn=findglb(n))	/* already in symbol table ? */
		{if(currfn[ident]!=function)multidef(n);
			/* already variable by that name */
		else if(currfn[offset]==function)multidef(n);
			/* already function by that name */
		else currfn[offset]=function;
			/* otherwise we have what was earlier*/
			/*  assumed to be a function */
		}
	/* if not in table, define as a function now */
	else currfn=addglb(n,function,cint,function);

	toconsole();					/* gtf 7/16/80 */
	outstr("====== "); outstr(currfn+name); outstr("()"); nl();
	tofile();

	/* we had better see open paren for args... */
	if(match("(")==0)error("missing open paren");
	outname(n);col();nl();	/* print function name */
	argstk=0;		/* init arg count */
	while(match(")")==0)	/* then count args */
		/* any legal name bumps arg count */
		{if(symname(n))argstk=argstk+2;
		else{error("illegal argument name");junk();}
		blanks();
		/* if not closing paren, should be comma */
		if(streq(line+lptr,")")==0)
			{if(match(",")==0)
			error("expected comma");
			}
		if(endst())break;
		}
	locptr=startloc;	/* "clear" local symbol table*/
	Zsp=0;			/* preset stack ptr */
	while(argstk)
		/* now let user declare what types of things */
		/*	those arguments were */
		{if(amatch("char",4)){getarg(cchar);ns();}
		else if(amatch("int",3)){getarg(cint);ns();}
		else{error("wrong number args");break;}
		}
	if(statement()!=streturn) /* do a statement, but if */
				/* it's a return, skip */
				/* cleaning up the stack */
		{modstk(0);
		zret();
		}
	Zsp=0;			/* reset stack ptr again */
	locptr=startloc;	/* deallocate all locals */
	infunc=0;		/* not in fn. any more		gtf 7/2/80 */
	}
/*					*/
/*	Declare argument types		*/
/*					*/
/* called from "newfunc" this routine adds an entry in the */
/*	local symbol table for each named argument */
getarg(t)		/* t = cchar or cint */
	int t;
	{
	char n[namesize],c;int j;
	while(1)
		{if(argstk==0)return;	/* no more args */
		if(match("*"))j=pointer;
			else j=variable;
		if(symname(n)==0) illname();
		if(findloc(n))multidef(n);
		if(match("["))	/* pointer ? */
		/* it is a pointer, so skip all */
		/* stuff between "[]" */
			{while(inbyte()!=']')
				if(endst())break;
			j=pointer;
			/* add entry as pointer */
			}
		addloc(n,j,t,argstk);
		argstk=argstk-2;	/* cnt down */
		if(endst())return;
		if(match(",")==0)error("expected comma");
		}
	}
/*					*/
/*	Statement parser		*/
/*					*/
/* called whenever syntax requires	*/
/*	a statement. 			 */
/*  this routine performs that statement */
/*  and returns a number telling which one */
statement()
{
	if(cpm(11,0) & 1)	/* check for ctrl-C		gtf 7/17/80 */
		if(getchar()==3)
			abort();

	if ((ch()==0) & (eof)) return;
	else if(amatch("char",4))
		{declloc(cchar);ns();}
	else if(amatch("int",3))
		{declloc(cint);ns();}
	else if(match("{"))compound();
	else if(amatch("if",2))
		{doif();lastst=stif;}
	else if(amatch("while",5))
		{dowhile();lastst=stwhile;}
	else if(amatch("return",6))
		{doreturn();ns();lastst=streturn;}
	else if(amatch("break",5))
		{dobreak();ns();lastst=stbreak;}
	else if(amatch("continue",8))
		{docont();ns();lastst=stcont;}
	else if(match(";"));
	else if(match("#asm"))
		{doasm();lastst=stasm;}
	/* if nothing else, assume it's an expression */
	else{expression();ns();lastst=stexp;}
	return lastst;
}
/*					*/
/*	Semicolon enforcer		*/
/*					*/
/* called whenever syntax requires a semicolon */
ns()	{if(match(";")==0)error("missing semicolon");}
/*					*/
/*	Compound statement		*/
/*					*/
/* allow any number of statements to fall between "{}" */
compound()
	{
	++ncmp;		/* new level open */
	while (match("}")==0) statement(); /* do one */
	--ncmp;		/* close current level */
	}
/*					*/
/*		"if" statement		*/
/*					*/
doif()
	{
	int flev,fsp,flab1,flab2;
	flev=locptr;	/* record current local level */
	fsp=Zsp;		/* record current stk ptr */
	flab1=getlabel(); /* get label for false branch */
	test(flab1);	/* get expression, and branch false */
	statement();	/* if true, do a statement */
	Zsp=modstk(fsp);	/* then clean up the stack */
	locptr=flev;	/* and deallocate any locals */
	if (amatch("else",4)==0)	/* if...else ? */
		/* simple "if"...print false label */
		{printlabel(flab1);col();nl();
		return;		/* and exit */
		}
	/* an "if...else" statement. */
	jump(flab2=getlabel());	/* jump around false code */
	printlabel(flab1);col();nl();	/* print false label */
	statement();		/* and do "else" clause */
	Zsp=modstk(fsp);		/* then clean up stk ptr */
	locptr=flev;		/* and deallocate locals */
	printlabel(flab2);col();nl();	/* print true label */
	}
/*					*/
/*	"while" statement		*/
/*					*/
dowhile()
	{
	int wq[4];		/* allocate local queue */
	wq[wqsym]=locptr;	/* record local level */
	wq[wqsp]=Zsp;		/* and stk ptr */
	wq[wqloop]=getlabel();	/* and looping label */
	wq[wqlab]=getlabel();	/* and exit label */
	addwhile(wq);		/* add entry to queue */
				/* (for "break" statement) */
	printlabel(wq[wqloop]);col();nl(); /* loop label */
	test(wq[wqlab]);	/* see if true */
	statement();		/* if so, do a statement */
	Zsp = modstk(wq[wqsp]);	/* zap local vars: 9/25/80 gtf */
	jump(wq[wqloop]);	/* loop to label */
	printlabel(wq[wqlab]);col();nl(); /* exit label */
	locptr=wq[wqsym];	/* deallocate locals */
	delwhile();		/* delete queue entry */
	}
/*					*/
/*	"return" statement		*/
/*					*/
doreturn()
	{
	/* if not end of statement, get an expression */
	if(endst()==0)expression();
	modstk(0);	/* clean up stk */
	zret();		/* and exit function */
	}
/*					*/
/*	"break" statement		*/
/*					*/
dobreak()
	{
	int *ptr;
	/* see if any "whiles" are open */
	if ((ptr=readwhile())==0) return;	/* no */
	modstk((ptr[wqsp]));	/* else clean up stk ptr */
	jump(ptr[wqlab]);	/* jump to exit label */
	}
/*					*/
/*	"continue" statement		*/
/*					*/
docont()
	{
	int *ptr;
	/* see if any "whiles" are open */
	if ((ptr=readwhile())==0) return;	/* no */
	modstk((ptr[wqsp]));	/* else clean up stk ptr */
	jump(ptr[wqloop]);	/* jump to loop label */
	}
/*					*/
/*	"asm" pseudo-statement		*/
/*					*/
/* enters mode where assembly language statement are */
/*	passed intact through parser	*/
doasm()
	{
	cmode=0;		/* mark mode as "asm" */
	while (1)
		{inline();	/* get and print lines */
		if (match("#endasm")) break;	/* until... */
		if(eof)break;
		outstr(line);
		nl();
		}
	kill();		/* invalidate line */
	cmode=1;		/* then back to parse level */
	}
/*	>>>>> start of cc3 <<<<<<<<<	*/

/*					*/
/*	Perform a function call		*/
/*					*/
/* called from heir11, this routine will either call */
/*	the named function, or if the supplied ptr is */
/*	zero, will call the contents of HL		*/
callfunction(ptr)
	char *ptr;	/* symbol table entry (or 0) */
{	int nargs;
	nargs=0;
	blanks();	/* already saw open paren */
	if(ptr==0)zpush();	/* calling HL */
	while(streq(line+lptr,")")==0)
		{if(endst())break;
		expression();	/* get an argument */
		if(ptr==0)swapstk(); /* don't push addr */
		zpush();	/* push argument */
		nargs=nargs+2;	/* count args*2 */
		if (match(",")==0) break;
		}
	needbrack(")");
	if(ptr)zcall(ptr);
	else callstk();
	Zsp=modstk(Zsp+nargs);	/* clean up arguments */
}
junk()
{	if(an(inbyte()))
		while(an(ch()))gch();
	else while(an(ch())==0)
		{if(ch()==0)break;
		gch();
		}
	blanks();
}
endst()
{	blanks();
	return ((streq(line+lptr,";")|(ch()==0)));
}
illname()
{	error("illegal symbol name");junk();}
multidef(sname)
	char *sname;
{	error("already defined");
	comment();
	outstr(sname);nl();
}
needbrack(str)
	char *str;
{	if (match(str)==0)
		{error("missing bracket");
		comment();outstr(str);nl();
		}
}
needlval()
{	error("must be lvalue");
}
findglb(sname)
	char *sname;
{	char *ptr;
	ptr=startglb;
	while(ptr!=glbptr)
		{if(astreq(sname,ptr,namemax))return ptr;
		ptr=ptr+symsiz;
		}
	return 0;
}
findloc(sname)
	char *sname;
{	char *ptr;
	ptr=startloc;
	while(ptr!=locptr)
		{if(astreq(sname,ptr,namemax))return ptr;
		ptr=ptr+symsiz;
		}
	return 0;
}
addglb(sname,id,typ,value)
	char *sname,id,typ;
	int value;
{	char *ptr;
	if(cptr=findglb(sname))return cptr;
	if(glbptr>=endglb)
		{error("global symbol table overflow");
		return 0;
		}
	cptr=ptr=glbptr;
	while(an(*ptr++ = *sname++));	/* copy name */
	cptr[ident]=id;
	cptr[type]=typ;
	cptr[storage]=statik;
	cptr[offset]=value;
	cptr[offset+1]=value>>8;
	glbptr=glbptr+symsiz;
	return cptr;
}
addloc(sname,id,typ,value)
	char *sname,id,typ;
	int value;
{	char *ptr;
	if(cptr=findloc(sname))return cptr;
	if(locptr>=endloc)
		{error("local symbol table overflow");
		return 0;
		}
	cptr=ptr=locptr;
	while(an(*ptr++ = *sname++));	/* copy name */
	cptr[ident]=id;
	cptr[type]=typ;
	cptr[storage]=stkloc;
	cptr[offset]=value;
	cptr[offset+1]=value>>8;
	locptr=locptr+symsiz;
	return cptr;
}
/* Test if next input string is legal symbol name */
symname(sname)
	char *sname;
{	int k;char c;
	blanks();
	if(alpha(ch())==0)return 0;
	k=0;
	while(an(ch()))sname[k++]=gch();
	sname[k]=0;
	return 1;
	}
/* Return next avail internal label number */
getlabel()
{	return(++nxtlab);
}
/* Print specified number as label */
printlabel(label)
	int label;
{	outasm("cc");
	outdec(label);
}
/* Test if given character is alpha */
alpha(c)
	char c;
{	c=c&127;
	return(((c>='a')&(c<='z'))|
		((c>='A')&(c<='Z'))|
		(c=='_'));
}
/* Test if given character is numeric */
numeric(c)
	char c;
{	c=c&127;
	return((c>='0')&(c<='9'));
}
/* Test if given character is alphanumeric */
an(c)
	char c;
{	return((alpha(c))|(numeric(c)));
}
/* Print a carriage return and a string only to console */
pl(str)
	char *str;
{	int k;
	k=0;
	putchar(eol);
	while(str[k])putchar(str[k++]);
}
addwhile(ptr)
	int ptr[];
 {
	int k;
	if (wqptr==wqmax)
		{error("too many active whiles");return;}
	k=0;
	while (k<wqsiz)
		{*wqptr++ = ptr[k++];}
}
delwhile()
	{if(readwhile()) wqptr=wqptr-wqsiz;
	}
readwhile()
 {
	if (wqptr==wq){error("no active whiles");return 0;}
	else return (wqptr-wqsiz);
 }
ch()
{	return(line[lptr]&127);
}
nch()
{	if(ch()==0)return 0;
		else return(line[lptr+1]&127);
}
gch()
{	if(ch()==0)return 0;
		else return(line[lptr++]&127);
}
kill()
{	lptr=0;
	line[lptr]=0;
}
inbyte()
{
	while(ch()==0)
		{if (eof) return 0;
		inline();
		preprocess();
		}
	return gch();
}
inchar()
{
	if(ch()==0)inline();
	if(eof)return 0;
	return(gch());
}
inline()
{
	int k,unit;
	while(1)
		{if (input==0)openin();
		if(eof)return;
		if((unit=input2)==0)unit=input;
		kill();
		while((k=getc(unit))>0)
			{if((k==eol)|(lptr>=linemax))break;
			line[lptr++]=k;
			}
		line[lptr]=0;	/* append null */
		lineno++;	/* read one more line		gtf 7/2/80 */
		if(k<=0)
			{fclose(unit);
			if(input2)endinclude();		/* gtf 7/16/80 */
				else input=0;
			}
		if(lptr)
			{if((ctext)&(cmode))
				{comment();
				outstr(line);
				nl();
				}
			lptr=0;
			return;
			}
		}
}
/*	>>>>>> start of cc4 <<<<<<<	*/

keepch(c)
	char c;
{	mline[mptr]=c;
	if(mptr<mpmax)mptr++;
	return c;
}
preprocess()
{	int k;
	char c,sname[namesize];
	if(cmode==0)return;
	mptr=lptr=0;
	while(ch())
		{if((ch()==' ')|(ch()==9))
			{keepch(' ');
			while((ch()==' ')|
				(ch()==9))
				gch();
			}
		else if(ch()=='"')
			{keepch(ch());
			gch();
			while(ch()!='"')
				{if(ch()==0)
				  {error("missing quote");
				  break;
				  }
				keepch(gch());
				}
			gch();
			keepch('"');
			}
		else if(ch()==39)
			{keepch(39);
			gch();
			while(ch()!=39)
				{if(ch()==0)
				  {error("missing apostrophe");
				  break;
				  }
				keepch(gch());
				}
			gch();
			keepch(39);
			}
		else if((ch()=='/')&(nch()=='*'))
			{inchar();inchar();
			while(((ch()=='*')&
				(nch()=='/'))==0)
				{if(ch()==0)inline();
					else inchar();
				if(eof)break;
				}
			inchar();inchar();
			}
		else if(alpha(ch()))	/* from an(): 9/22/80 gtf */
			{k=0;
			while(an(ch()))
				{if(k<namemax)sname[k++]=ch();
				gch();
				}
			sname[k]=0;
			if(k=findmac(sname))
				while(c=macq[k++])
					keepch(c);
			else
				{k=0;
				while(c=sname[k++])
					keepch(c);
				}
			}
		else keepch(gch());
		}
	keepch(0);
	if(mptr>=mpmax)error("line too long");
	lptr=mptr=0;
	while(line[lptr++]=mline[mptr++]);
	lptr=0;
	}
addmac()
{	char sname[namesize];
	int k;
	if(symname(sname)==0)
		{illname();
		kill();
		return;
		}
	k=0;
	while(putmac(sname[k++]));
	while(ch()==' ' | ch()==9) gch();
	while(putmac(gch()));
	if(macptr>=macmax)error("macro table full");
	}
putmac(c)
	char c;
{	macq[macptr]=c;
	if(macptr<macmax)macptr++;
	return c;
}
findmac(sname)
	char *sname;
{	int k;
	k=0;
	while(k<macptr)
		{if(astreq(sname,macq+k,namemax))
			{while(macq[k++]);
			return k;
			}
		while(macq[k++]);
		while(macq[k++]);
		}
	return 0;
}
/* direct output to console		gtf 7/16/80 */
toconsole()
{
	saveout = output;
	output = 0;
/* end toconsole */}

/* direct output back to file		gtf 7/16/80 */
tofile()
{
	if(saveout)
		output = saveout;
	saveout = 0;
/* end tofile */}

outbyte(c)
	char c;
{
	if(c==0)return 0;
	if(output)
		{if((putc(c,output))<=0)
			{closeout();
			error("Output file error");
			abort();			/* gtf 7/17/80 */
			}
		}
	else putchar(c);
	return c;
}
outstr(ptr)
	char ptr[];
 {
	int k;
	k=0;
	while(outbyte(ptr[k++]));
 }

/* write text destined for the assembler to read */
/* (i.e. stuff not in comments)			*/
/*  gtf  6/26/80 */
outasm(ptr)
char *ptr;
{
	while(outbyte(raise(*ptr++)));
/* end outasm */}

nl()
	{outbyte(eol);}
tab()
	{outbyte(9);}
col()
	{outbyte(58);}
bell()				/* gtf 7/16/80 */
	{outbyte(7);}
/*				replaced 7/2/80 gtf
 * error(ptr)
 *	char ptr[];
 * {
 *	int k;
 *	comment();outstr(line);nl();comment();
 *	k=0;
 *	while(k<lptr)
 *		{if(line[k]==9) tab();
 *			else outbyte(' ');
 *		++k;
 *		}
 *	outbyte('^');
 *	nl();comment();outstr("******  ");
 *	outstr(ptr);
 *	outstr("  ******");
 *	nl();
 *	++errcnt;
 * }
 */

error(ptr)
char ptr[];
{	int k;
	char junk[81];

	toconsole();
	bell();
	outstr("Line "); outdec(lineno); outstr(", ");
	if(infunc==0)
		outbyte('(');
	if(currfn==NULL)
		outstr("start of file");
	else	outstr(currfn+name);
	if(infunc==0)
		outbyte(')');
	outstr(" + ");
	outdec(lineno-fnstart);
	outstr(": ");  outstr(ptr);  nl();

	outstr(line); nl();

	k=0;	/* skip to error position */
	while(k<lptr){
		if(line[k++]==9)
			tab();
		else	outbyte(' ');
		}
	outbyte('^');  nl();
	++errcnt;

	if(errstop){
		pl("Continue (Y,n,g) ? ");
		gets(junk);		
		k=junk[0];
		if((k=='N') | (k=='n'))
			abort();
		if((k=='G') | (k=='g'))
			errstop=0;
		}
	tofile();
/* end error */}

ol(ptr)
	char ptr[];
{
	ot(ptr);
	nl();
}
ot(ptr)
	char ptr[];
{
	tab();
	outasm(ptr);
}
streq(str1,str2)
	char str1[],str2[];
 {
	int k;
	k=0;
	while (str2[k])
		{if ((str1[k])!=(str2[k])) return 0;
		k++;
		}
	return k;
 }
astreq(str1,str2,len)
	char str1[],str2[];int len;
 {
	int k;
	k=0;
	while (k<len)
		{if ((str1[k])!=(str2[k]))break;
		if(str1[k]==0)break;
		if(str2[k]==0)break;
		k++;
		}
	if (an(str1[k]))return 0;
	if (an(str2[k]))return 0;
	return k;
 }
match(lit)
	char *lit;
{
	int k;
	blanks();
	if (k=streq(line+lptr,lit))
		{lptr=lptr+k;
		return 1;
		}
 	return 0;
}
amatch(lit,len)
	char *lit;int len;
 {
	int k;
	blanks();
	if (k=astreq(line+lptr,lit,len))
		{lptr=lptr+k;
		while(an(ch())) inbyte();
		return 1;
		}
	return 0;
 }
blanks()
	{while(1)
		{while(ch()==0)
			{inline();
			preprocess();
			if(eof)break;
			}
		if(ch()==' ')gch();
		else if(ch()==9)gch();
		else return;
		}
	}
/* output a decimal number - rewritten 4/1/81 gtf */
outdec(n)
int n;
{
	if(n<0)
		outbyte('-');
	else	n = -n;
	outint(n);
/* end outdec */}

outint(n)	/* added 4/1/81 */
int n;
{	int q;

	q = n/10;
	if(q) outint(q);
	outbyte('0'-(n-q*10));
/* end outint */}

/* return the length of a string */
/* gtf 4/8/80 */
strlen(s)
char *s;
{	char *t;

	t = s;
	while(*s) s++;
	return(s-t);
/* end strlen */}

/* convert lower case to upper */
/* gtf 6/26/80 */
raise(c)
char c;
{
	if((c>='a') & (c<='z'))
		c = c - 'a' + 'A';
	return(c);
/* end raise */}
