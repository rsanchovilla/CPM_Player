/********************************************************/
/*							*/
/*		Q/C Compiler Version 3.0		*/
/*			(Part 1)			*/
/*							*/
/*     Copyright (c) 1983 Quality Computer Systems	*/
/*							*/
/*			05/06/82			*/
/********************************************************/

#include "qstdio.h"
#include "cstddef.h"
#include "cglbdef.c"

static int locspace;

main(argc, argv)
int argc;
char *argv[];
	{
	init();
	getoptions(argc,argv);	/* get user options */
	zeromem();
	getinfil();
	getoutfil();
	gettable();		/* get table space */
	kill();
	parse();
	dumplits();		/* dump literal pool for last func */
	closeout();
	summary();
	exit(errcnt);
	}
/* Zero free memory space */
zeromem()
	{
	static char *freespace, *ptr;
	auto char stack;
/* WARNING: Don't use any register variables in this function or the
		calling function's registers will be zeroed */
	freespace = malloc(0);		/* beginning of free space */
	ptr = &stack;			/* stack is on stack */
	while (ptr > freespace)
		*--ptr = 0;
	}
/* Get table space and initialize globals */
gettable()
	{
	/* Obtain compiler table space from free space */
	peepbuf = malloc(LINESIZE);
	line =	malloc(LINESIZE);
	mline = malloc(LINESIZE);
	pcasetab =
	casetab =
		malloc(ncases * size(casetab+1, casetab));
	pswq =
	swq =
		malloc(nswq * size(swq+1, swq));
	typelist = malloc(n_types * size(typelist+1, typelist));
	symtab = malloc(nsym * size(symtab+1, symtab));
	plitpool =
	litpool =
		malloc(litpsize);
	pmacdef = malloc(macpsize);
	macpool = pmacsym = pmacdef + macpsize - MACSIZE;
	if (symtab == NULL || plitpool == NULL || pmacdef == NULL) {
		puts("Not enough table space");
		exit(1);
		}
	glbptr = STARTGLB;
	locptr = STARTLOC;
	inittypes();		/* initialize type table */
	lit_sym.st_type = ptrto(chartype); /* "symbol" for literal pool */
	reftype(lit_sym.st_type);
	if (trace)		/* force loading of "puts()" */
		addglb("puts", functype, SC_EXTERN, ID_VAR, DECL_LOC);
	}
/* Compute size in bytes between two pointers (simulated "sizeof") */
size(p, q)
char *p, *q;
	{
	return (p - q);
	}
/* Process all input text */
parse()
	{
	int sc;
	struct typeinfo *type;
	for(;;) {
		blanks();
		if (eof)
			break;
		if (isdecl(&sc, &type)) {	/* is it a declaration? */
			switch (sc) {		/* check storage class */
			case SC_REG: case SC_AUTO:
				scerr();	/* invalid storage class */
			case SC_NONE:		/* use default */
				sc = SC_GLOBAL;
				break;
			case SC_STATIC:
				sc = SC_ST_GLB;
				break;
				}
			declglb(sc, type);
			}
		else		/* must be a function definition */
			newfunc();
		}
	if (ncmp)		/* anything left hanging? */
		error("Unbalanced braces");
	if (ifdepth)
		error("Missing #endif");
	}
/* Dump the literal pool */
dumplits()
	{
	register char *ptr;
	if (plitpool == litpool)
		return; 	/* if nothing there, exit...*/
	if (romflag)
		codeseg();	/* put in ROM so strings are initialized */
	else
		dataseg();
	linelabel(lit_sym.st_info); /* print literal label */
	initted = 0;
	for (ptr = litpool; ptr < plitpool; ++ptr)
		initbyte(*ptr);
	newline();		/* end last line if not full */
	minlit = imin(minlit, litpsize-initted); /* record space left */
	plitpool = litpool;	/* reset for next function */
	lit_sym.st_info = getlabel();
	}
/* Report statistics and errors */
summary()
	{
	register char *p;
	char errnum[7], *itob();
	p = malloc(0);		/* beginning of free space */
	while (*++p == 0);	/* look for bottom of stack */
	printf("Symbol table entries left: %d\n", minsym);
	printf("Type table entries left:   %d\n", mintype);
	puts("Space left (bytes)");
	printf("Literals: %d  Macros: %d  Memory: %d\n",
		minlit, pmacsym - pmacdef + MACSIZE, p - malloc(0));
	printf("%s error%s found",
		(errcnt == 0) ? "No": itob(errcnt, errnum, -10),
		(errcnt == 1) ? "": "s");
	}
/* Check for declarations
 * Used by:
 *	parse (externals)
 *	procarg (arguments)
 *	procdecl (locals)
 */
isdecl(sc, type)
int *sc;
struct typeinfo **type;
	{
	register holdtype, holdsc, rtype, rsc;
	register struct typeinfo *stype;
	holdtype = holdsc = 0;
	do {
		if (rsc = getsc()) {		/* storage class? */
			if (holdsc == 0)	/* first one? */
				holdsc = rsc;	/* remember it */
			else
				scerr();
			}
		if (rtype = gettype()) {
			if (holdtype == 0)
				holdtype = rtype;
			else
				typerr();
			}
		} while (rsc || rtype); 	/* loop if either found */
	switch (holdtype) {
	case T_STRUCT:
	case T_UNION:
		stype = decltag(holdtype);
		break;
	case T_UNSIGN:
		stype = unsgntype;
		break;
	case T_CHAR:
		stype = chartype;
		break;
	case T_NONE:
	case T_INT:
		stype = inttype;
		break;
		}
	*sc = holdsc;
	*type = stype;
	return (holdsc || holdtype);
	}
/* Declare a global variable */
declglb(sc, type)
int sc;
struct typeinfo *type;
	{
	register struct typeinfo *t;
	register struct st *p;
	char sname[NAMESIZE];
	int info;
	if (matchc(';'))
		return; 		/* probably struct template */
	do {
		t = declvar(sname, type, sc, &info);
		addglb(sname, t, sc, ID_VAR, DECL_GLB);
		unreftype(t);		/* eliminate extra reference */
		} while (matchc(','));
	ns();	/* check for semicolon */
	}
/*	Declare local variables 	*/
declloc(sc, type)
register int sc;
struct typeinfo *type;
	{
	register locsc;
	int info;
	char sname[NAMESIZE];
	register struct typeinfo *t;
	if (matchc(';'))
		return; 	/* probably struct template */
	do {
		t = declvar(sname, type, sc, &info);
		if (findloc(sname))
			multidef(sname);
		locsc = (t->t_code == T_FUNC) ? SC_EXTERN: sc;
		switch (locsc) {
		case SC_EXTERN:
			addglb(sname, t, SC_EXTERN, ID_VAR, DECL_LOC);
			break;
		case SC_REG:
			if (info = needreg(t))
				break;		/* ok to go in reg */
			else
				locsc = SC_AUTO;
		case SC_AUTO:
			info = locspace;
			locspace += t->t_size;	/* space used */
			break;
			}
		addloc(sname, t, locsc, ID_VAR, info);
		unreftype(t);		/* eliminate extra reference */
		} while (matchc(','));
	ns();				/* check for semicolon */
	}
/* Get required array size */
arraysize()
	{
	struct operand cexp;
	register size;
	if(matchc(']'))
		return -1;		/* null size */
	if (constexp(&cexp) != CONSTANT) {
		cexperr();		/* not a constant expression */
		size = 1;
		}
	else {
		size = cexp.op_val;
		if (size < 0) {
			error("Negative array size illegal");
			size = -size;
			}
		}
	needpunc(']');
	return size;
	}
/* Declare (or find) a structure/union tag */
decltag(typecode)
int typecode;	/* T_STRUCT or T_UNION */
	{
	char tag[NAMESIZE], var[NAMESIZE];
	struct typeinfo *vartype;
	int varsc, info;
	register struct st *tp, *mp;
	register struct typeinfo *type, *vt;
	register int size, offset, hastag;

	type = NULL;
	tp = NULL;
	hastag = FALSE;
	if (!nextc('{')) {		/* tag name */
		if (!symname(tag))
			illname();
		else {
			tp = findtag(tag);
			hastag = TRUE;
			}
		}
	if (!matchc('{')) {
		if (!hastag)
			error("No tag or template");
		else if (tp == NULL)
			error("Undeclared tag");
		else type = tp->st_type;
		}
	else {	/* template follows */
		type = uniquetype(typecode,NULL,0);

		if(!hastag)
			;
		else if (tp!=NULL)
			multidef(tag);
		else if (infunc)
			tp = addloc(tag,type,SC_TYPE,ID_STRUCT,0);
		else	tp = addglb(tag,type,SC_TYPE,ID_STRUCT,DECL_GLB);

		size = offset = 0;
		while (isdecl(&varsc, &vartype)) {
		    if (varsc != SC_NONE)
			error("Member can't have storage class");
		    do {
			vt = declvar(var,vartype,SC_MEMBER,&info);
			if (mp=findtag(var)) {
				if (mp->st_type != vt ||
				    mp->st_info != offset )
					error("Member has another meaning");
				}
			else if (vt == type || vt->t_code == T_FUNC) {
				error("Can't be structure member");
				continue;
				}
			else {
			    if (infunc)
				addloc(var,vt,SC_MEMBER,ID_STRUCT,offset);
			    else
				addglb(var,vt,SC_MEMBER,ID_STRUCT,offset);
			    }
			if (typecode == T_STRUCT)
				offset = size += vt->t_size;
			else		/* union */
				size = imax(size, vt->t_size);
			unreftype(vt);	/* eliminate extra reference */
			} while(matchc(','));
		    ns();
		    }
		needpunc('}');
		type->t_size = size;	 /* fill in structure size */
		}
	if(type==NULL)	/* in case of error, hand back new structure type */
		type = uniquetype(typecode,NULL,0);
	return type;
	}
/* Declare a variable */
declvar(sname, type, sc, info)
char sname[];
register struct typeinfo *type;
register int sc;
int *info;
	{
	struct typestack ts[TSSIZE];
	register struct typestack *p;
	register putds, size;

	type = initts(ts,type); 	/* init local type table */
	dodecl(sname);			/* analyze the declarator */
	initted = 0;
	putds = FALSE;
	if((sc==SC_GLOBAL || sc==SC_ST_GLB)
	   && ts[0].t_code!=T_FUNC) {
		dataseg();
		glblabel(sname, sc);
		putds = TRUE;
		}
	else if (sc == SC_STATIC) {
		dataseg();
		linelabel(*info = getlabel());
		putds = TRUE;
		}
	for (p=tsptr; --p>=ts;){ /* add current type info to type table */
		switch(p->t_code) {
		case T_PTR:
			type = ptrto(type);
			break;
		case T_FUNC:
			if (type->t_code<=T_NONE || type->t_code>T_SIMPLE) {
				error("Function can't return aggregate");
				type = inttype;
				}
			type = addtype(T_FUNC,type,S_FUNC);
			break;
		case T_ARRAY:
			if (type->t_code == T_FUNC) {
				error("No arrays of functions");
				type = ptrto(type);
				}
			if (p->t_size == -1 && p != ts) {
				sizerr();
				size = type->t_size;
				}
			else if (p->t_size == -1)
				size = -1;
			else size = p->t_size * type->t_size;
			type = addtype(T_ARRAY,type,size);
			break;
			}
		}
	reftype(type);		/* preserve type during initialization */
	if (matchc('=')) {
	    if (!putds)
		error("Can only initialize global and static variables");
	    else {
		if (type->t_code==T_UNION)
			error("Can't initialize unions");
		doinit(type);
		}
	    }
	else if (putds) {	/* default initialization */
		size = type->t_size;
		if (size <= INITSIZE || initflag == TRUE )
			definit(elemsize(type), size);
		else {		/* -I switch says don't initialize */
			defstorage();
			outdec(size);
			nl();
			}
		}
	newline();			/* end last line if necessary */
	if (type->t_code == T_ARRAY && type->t_size <= 0
	   && sc != SC_EXTERN && sc != SC_ARG) {
		sizerr();
		type->t_size = S_INT;
		}
	return type;
	}
/* Initialize a type parsing stack */
initts(ts,type)
struct typestack ts[];
struct typeinfo *type;
	{
	register struct typeinfo *tp;
	register struct typestack *p;

	tslim = &ts[TSSIZE];
	tsptr = ts;

	for(tp = type; tp!=NULL && tp->t_base!=NULL; tp = tp->t_base)
		++tsptr;	/* find how ornate (deep) "type" is */
	p = tsptr;
	for(tp=type; tp!=NULL && tp->t_base!=NULL; tp=tp->t_base){
		--p;		/* copy "type" table entry to local */
		p->t_code = tp->t_code; 	/* type stack */
		p->t_size = tp->t_size;
		}
	return tp;
	}
/* Process a declarator */
dodecl(name)
register char *name;
	{
	if(matchc('*')){
		dodecl(name);
		pushtype(T_PTR,1);
		return;
		}		
	if(matchc('(')){
		dodecl(name);
		needpunc(')');
		}
	else if (name != NULL)	/* no name for abstract declarator */
		symname(name);
	if(matchc('(')){
		needpunc(')');
		pushtype(T_FUNC,1);
		}
	else while(matchc('['))
		pushtype(T_ARRAY,arraysize());
	return;
	}
pushtype(code,itemct)
int code, itemct;
	{
	if (tsptr < tslim) {
		tsptr->t_code = code;
		tsptr->t_size = itemct;
		++tsptr;
		}
	else
		error("This type is too ornate");
	}
/* Allocate a register if possible */
needreg(type)
struct typeinfo *type;
	{
	register int t_code;

	t_code = type->t_code;
	if (t_code != T_PTR && t_code != T_INT && t_code != T_UNSIGN
	   || nregvar >= MAXREG)
		return 0;
	else
		return ++nregvar;
	}
/* Do initialization for one variable */
doinit(tp)
register struct typeinfo *tp;
	{
	register size;

	size = tp->t_size;
	if (matchc('{'))
		initbrace(tp, size == -1);
	else if (ch() == '"')
		initstr(tp);
	else
		initvar(tp);
	definit(elemsize(tp), size - initted); /* init anything left */
	}
initstr(tp)
register struct typeinfo *tp;
	{
	register c, size, warned;
	if(tp->t_code == T_ARRAY && tp->t_base->t_code == T_CHAR) {
		size = tp->t_size;
		warned = FALSE;
		gch();			/* strip leading quote */
		do {
			c = getstring();
			if (initted == size && !warned) {
				error("String is bigger than array");
				warned = TRUE;
				}
			else
				initbyte((c == -1)? '\0': c);
			} while (c != -1);
		if (size == -1) 	/* fix up type table */
			tp->t_size = initted;
		}
	else
		initvar(tp);
	}
initvar(tp)
struct typeinfo *tp;
	{
	if (elemsize(tp) == S_INT)
		inititem();
	else
		initchar();
	if (!nextc(',') && !chkeyword() && isletter(ch())) {
		needpunc(',');	/* looks like another variable */
		putback(',');	/* supply missing comma */
		}
	}
/* Calculate the base size to initialize */
elemsize(tp)
struct typeinfo *tp;
	{
	register struct typeinfo *base;

	for (base = tp; base->t_code == T_ARRAY; base = base->t_base)
		;
	return ((base->t_size == S_INT) ? S_INT: S_CHAR);
	}
inititem()
	{
	struct operand cexp;
	switch (constexp(&cexp)) {
	case CONSTANT:
	case CONSTADDR:
		initword(cexp.op_sym, cexp.op_val);
		break;
	default:
		initerr();
		initword(NULL, 0);
		break;
		}
	}
initchar()
	{
	struct operand cexp;
	register val;
	switch (constexp(&cexp)) {
	case CONSTADDR:
		error("Char cannot hold address");
		val = 0;
		break;
	case CONSTANT:
		val = cexp.op_val;
		break;
	default:
		initerr();
		val = 0;
		break;
		}
	initbyte(val);
	}
initbrace(tp, resize)
register struct typeinfo *tp;
	{
	register struct typeinfo *tpb;
	register init1, warned, needbrace, ischar, base;

	warned = FALSE;
	needbrace = TRUE;
	ischar = ((base=elemsize(tp)) == S_CHAR);
	init1 = initted;
	if (tp->t_code == T_STRUCT)
		error("Can't initialize structures yet");
	for (;;) {
		if (matchc('{')) {
		    tpb = tp->t_base;
		    if (tpb == NULL ||
		       (tpb->t_code!=T_STRUCT && tpb->t_code!=T_ARRAY)) {
			error("Only aggregates can be initialized this way");
			initbrace(tp, FALSE);
			}
		    else
			initbrace(tpb, FALSE);
		    }
		else if (ischar)
			initchar();
		else
			inititem();
		if (initted-init1 > tp->t_size && !resize && !warned) {
			error("Too many initializers");
			warned = TRUE;
			}
		/* check for punctuation after constant expr */
		if (matchc(','))
			continue; /* more inits for this var */
		if (ch() == '}' || ch() == ';' || chkeywrd())
			break;	/* end of inits for this variable */
		if (isdigit(ch())) {
			needpunc(',');	/* looks like more inits */
			continue;
			}
		if (isletter(ch())) {	/* is this another var? */
			needpunc('}');
			needbrace = FALSE;
			needpunc(',');
			putback(',');	/* supply missing comma */
			break;
			}
		while (ch() != ',' && !endst() && ch() != '}')
		       gch();	/* get rid of whatever is left */
		break;		/* and quit */
		}
	if (needbrace)
		needpunc('}');	/* skip ending delimiter if any */
	if (resize)		/* fix size in type table */
		tp->t_size = initted - init1;
	else			/* default init if any left */
		definit(base, (tp->t_size - (initted - init1)));
	}
/* Default initialization */
definit(size, amt)
int size, amt;
	{
	for ( ; amt > 0; amt -= size ) {
		if (size == 2)
			initword(NULL, 0);
		else
			initbyte(0);
		}
	}
/* Initialize a byte */
initbyte(val)
int val;
	{
	++initted;
	if (initted % 10 == 1 || !midline)
		defbyte();	/* start new line */
	else
		outbyte(',');	/* separate bytes */
	outdec(val & 0xFF);	/* insure value is single byte */
	if (initted % 10 == 0)
		nl();		/* filled this line */
	}
/* Initialize a word */
initword(sym, val)
struct st *sym;
int val;
	{
	static charcnt;
	if (!midline || initted == 0 || charcnt > 70) {
		if (initted)	/* start new line if necessary */
			newline();
		defword();
		charcnt = 16;
		}
	else
		outbyte(',');	/* more room on the current line */
	charcnt += 5;
	if (sym) {
		charcnt += strlen(sym->st_name);
		prtsymname(sym, val);
		}
	else
		outdec(val);
	initted += 2;
	}
/* Build a function */
newfunc()
	{
	char funcname[NAMESIZE];
	register c;
	register char *p;
	if(!symname(funcname)) {
		error("Illegal function or declaration");
		kill();
		return;
		}
	if (verbose)
		printf("=== %s()\n", funcname);
	dumplits();		/* dump literals for last function */
	infunc = TRUE;
	addglb(funcname, functype, SC_GLOBAL, ID_VAR, DECL_GLB);
	locptr = STARTLOC;	/* clear local symbols */
	locspace =		/* amount of local stack space */
	nregvar = 0;		/* # of register variables used */
	if (libflag) {		/* is this a library generation */
		closeout();	/* close last module file */
		if (p = index(outfil, ':'))/* build new output filename */
			++p;
		else
			p = outfil; /* no drive specified */
		getfilename(funcname, p, defext);
		while (p = index(p, '_')) /* no underscore in filename */
			*p = '1';
		getoutfil();
		}
	if(astreq(funcname, "main", 4)) {
		mainflag = TRUE;
		shell();	/* parse command line */
		}
	codeseg();
	glblabel(funcname, SC_GLOBAL); /* print function name */
	needpunc('(');		/* look for args */
	procarg();
	needpunc('{');		/* function must begin with { */
	procdecl();		/* process local declarations */
	codeseg();
	prologue(funcname);	/* beginning code for function */
	compound();		/* evaluate all statments */
	epilogue(funcname);	/* ending code for function */
	infunc = FALSE;
	}
/* Process all args for a function */
procarg()
	{
	int sc;
	struct typeinfo *type;
	char name[NAMESIZE];
	argcnt = 0;
	while (!matchc(')') && !endst()) {
		if (symname(name)) {
			if (findloc(name)) /* already defined? */
				multidef(name);
			else {	/* add arg to symbol table */
				addloc(name, NULL, SC_ARG, ID_VAR, 0);
				++argcnt;
				}
			}
		if (!nextc(')') && !matchc(','))
			error("Expected comma");
		}
	while (isdecl(&sc, &type)) {	/* look for arg declarations */
		if (sc == SC_STATIC || sc == SC_EXTERN) {
			scerr();	/* invalid storage class */
			sc = SC_ARG;
			}
		declarg((sc==SC_NONE)? SC_ARG: sc, type);
		}
	}
/* Add arguments to local symbol table */
declarg(sc, type)
register int sc;
struct typeinfo *type;
	{
	int info;
	char sname[NAMESIZE];
	register struct st *sym;
	register struct typeinfo *t;
	struct typeinfo *ptrtype;

	do {
		t = declvar(sname, type, SC_ARG, &info);
		if (t->t_code == T_ARRAY) { /* chg array-of-x to ptr-to-x */
			reftype(ptrtype = ptrto(t->t_base));
			unreftype(t);
			t = ptrtype;
			}
		else if (t->t_code > T_SIMPLE) {
			error("Argument can't be that type");
			continue;
			}
		if (sc == SC_REG && !(info=needreg(t)))
			sc = SC_ARG;	/* can't put in register */
		if ((sym=findloc(sname)) == NULL)
			error("Name not in argument list");
		else if (sym->st_type != NULL)
 			multidef(sname);
		else {			/* fill in symbol table info */
			sym->st_type = t;
			sym->st_sc = sc;
			if (sc == SC_REG)
				sym->st_info = info;
			}
		} while(matchc(','));
	ns();
	}
/* Do local declarations */
procdecl()
	{
	int sc, type;
	while (isdecl(&sc, &type))
		/* if storage class not set, use default */
		declloc((sc==SC_NONE) ? SC_AUTO: sc, type);
	}
/* Do function begin code */
prologue(funcname)
char *funcname;
	{
	register int offset, regno;
	register struct st *p;
	struct operand arg;
	if (trace)
		gentrace('>', funcname);
	if (locspace == 0) {		/* generate call to appropriate */
		if (nregvar == 0) {	/* entry routine */
			if (argcnt != 0)
				callib("en"); /* just set stk frame */
			/* else nothing to do */
			}
		else
			callib("enr");	/* save registers */
		}
	else	{
		if (nregvar == 0)
			callib("ens");	/* alloc stk space for locals */
		else
			callib("ensr"); /* alloc stk space & save reg */
		defword();	/* specify how much stk space needed */
		outdec(-locspace);
		nl();
		}
	offset = locspace + ((Z80) ? 6: 4);	/* fix arg offsets */
	for (p=STARTLOC+1-argcnt; p<= STARTLOC; ++p) {
		if (p->st_type == NULL) 	/* undeclared args */
			reftype(p->st_type=inttype);/* default to int */
		regno = (p->st_sc == SC_REG)? p->st_info: 0;
		p->st_sc = SC_AUTO;
		p->st_info = offset;
		if (regno) {			/* register assigned? */
			initop(&arg, p, p->st_type, LOADVALUE);
			pregflag = FALSE;
			rvalp(&arg);		/* copy arg into preg */
			p->st_sc = SC_REG;
			p->st_info = regno;
			arg.op_sym = p;
			store(&arg);
			unreftype(p->st_type);
			}
		offset += 2;	/* offset from local stk frame pointer */
		}
	retvalue = retlab = 0;	/* signal no return statement found */
	}
/* Do function end code */
epilogue(funcname)
char *funcname;
	{
	register struct st *sym;
	register struct typeinfo *type;
	if (retlab)			/* was an early return found? */
		linelabel(retlab);	/* if so, print return label */
	if (retvalue)			/* is there a return value? */
		dotest();		/* if so, test for zero */
	minsym = imin(minsym, locptr - glbptr);/* remember symtab space */
	if (trace)
		gentrace('<', funcname);
	if (locspace == 0) {		/* generate call to exit routine */
		if (nregvar == 0) {
			if (argcnt != 0)
				restsfp(); /* just restore stk frame */
			/* else nothing to do */
			cret();
			}
		else
			callib("exr");	/* restore registers */
		}
	else	{
		if (nregvar == 0)
			callib("exs");	/* clean up stack only */
		else
			callib("exrs"); /* restore regs & clean up stk */
		defword();	/* specify how much stk space to clear */
		outdec(locspace);
		nl();
		}
	for (sym = STARTLOC; sym > locptr; --sym) {
		type = sym->st_type;
		if (type->t_code == T_LABEL && sym->st_sc == SC_NONE)
			errname("Undefined label", sym->st_name);
		unreftype(type);
		if (libflag) {			/* library gen run? */
			if (sym->st_sc == SC_EXTERN /* declare EXTs */
			   && !streq(sym->st_name, funcname))
				declext(sym->st_name);
			else if (sym->st_sc == SC_REG)
				declext(regname(sym->st_info));
			}
		}
	}
/* end of CC1.C */
