/* xlsubr - xlisp builtin functions */

#ifdef AZTEC
#include "a:stdio.h"
#else
#include <stdio.h>
#endif

#include "xlisp.h"

/* external variables */
extern int (*xlgetc)();
extern struct node *xlstack;

/* local variables */
static char *sgetptr;

/* xlsubr - define a builtin function */
xlsubr(sname,subr)
  char *sname; struct node *(*subr)();
{
    struct node *sym;

    /* enter the symbol */
    sym = xlenter(sname);

    /* initialize the value */
    sym->n_symvalue = newnode(SUBR);
    sym->n_symvalue->n_subr = subr;
}

/* xlsvar - define a builtin string variable */
xlsvar(sname,str)
  char *sname,*str;
{
    struct node *sym;

    /* enter the symbol */
    sym = xlenter(sname);

    /* initialize the value */
    sym->n_symvalue = newnode(STR);
    sym->n_symvalue->n_str = strsave(str);
}

/* xlarg - get the next argument */
struct node *xlarg(pargs)
  struct node **pargs;
{
    struct node *arg;

    /* make sure the argument exists */
    if (*pargs == NULL)
	xlfail("too few arguments");

    /* get the argument value */
    arg = (*pargs)->n_listvalue;

    /* move the argument pointer ahead */
    *pargs = (*pargs)->n_listnext;

    /* return the argument */
    return (arg);
}

/* xlmatch - get an argument and match its type */
struct node *xlmatch(type,pargs)
  int type; struct node **pargs;
{
    struct node *arg;

    /* get the argument */
    arg = xlarg(pargs);

    /* check its type */
    if (type == LIST) {
	if (arg != NULL && arg->n_type != LIST)
	    xlfail("bad argument type");
    }
    else {
	if (arg == NULL || arg->n_type != type)
	    xlfail("bad argument type");
    }

    /* return the argument */
    return (arg);
}

/* xlevarg - get the next argument and evaluate it */
struct node *xlevarg(pargs)
  struct node **pargs;
{
    struct node *oldstk,val;

    /* create a new stack frame */
    oldstk = xlsave(&val,NULL);

    /* get the argument */
    val.n_ptr = xlarg(pargs);

    /* evaluate the argument */
    val.n_ptr = xleval(val.n_ptr);

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the argument */
    return (val.n_ptr);
}

/* xlevmatch - get an evaluated argument and match its type */
struct node *xlevmatch(type,pargs)
  int type; struct node **pargs;
{
    struct node *arg;

    /* get the argument */
    arg = xlevarg(pargs);

    /* check its type */
    if (type == LIST) {
	if (arg != NULL && arg->n_type != LIST)
	    xlfail("bad argument type");
    }
    else {
	if (arg == NULL || arg->n_type != type)
	    xlfail("bad argument type");
    }

    /* return the argument */
    return (arg);
}

/* xllastarg - make sure the remainder of the argument list is empty */
xllastarg(args)
  struct node *args;
{
    if (args != NULL)
	xlfail("too many arguments");
}

/* assign - assign a value to a symbol */
static assign(sym,val)
  struct node *sym,*val;
{
    struct node *lptr;

    /* check for a current object */
    if ((lptr = xlobsym(sym)) != NULL)
	lptr->n_listvalue = val;
    else
	sym->n_symvalue = val;
}

/* set - builtin function set */
static struct node *set(args)
  struct node *args;
{
    struct node *oldstk,arg,sym,val;

    /* create a new stack frame */
    oldstk = xlsave(&arg,&sym,&val,NULL);

    /* initialize */
    arg.n_ptr = args;

    /* get the symbol */
    sym.n_ptr = xlevmatch(SYM,&arg.n_ptr);

    /* get the new value */
    val.n_ptr = xlevarg(&arg.n_ptr);

    /* make sure there aren't any more arguments */
    xllastarg(arg.n_ptr);

    /* assign the symbol the value of argument 2 and the return value */
    assign(sym.n_ptr,val.n_ptr);

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the result value */
    return (val.n_ptr);
}

/* setq - builtin function setq */
static struct node *setq(args)
  struct node *args;
{
    struct node *oldstk,arg,sym,val;

    /* create a new stack frame */
    oldstk = xlsave(&arg,&sym,&val,NULL);

    /* initialize */
    arg.n_ptr = args;

    /* get the symbol */
    sym.n_ptr = xlmatch(SYM,&arg.n_ptr);

    /* get the new value */
    val.n_ptr = xlevarg(&arg.n_ptr);

    /* make sure there aren't any more arguments */
    xllastarg(arg.n_ptr);

    /* assign the symbol the value of argument 2 and the return value */
    assign(sym.n_ptr,val.n_ptr);

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the result value */
    return (val.n_ptr);
}

/* load - direct input from a file */
static struct node *load(args)
  struct node *args;
{
    struct node *fname;

    /* get the file name */
    fname = xlevmatch(STR,&args);

    /* make sure there aren't any more arguments */
    xllastarg(args);

    /* direct input from the file */
    xlfin(fname->n_str);

    /* return the filename */
    return (fname);
}

/* defun - builtin function defun */
static struct node *defun(args)
  struct node *args;
{
    struct node *oldstk,arg,sym,fargs,fun;

    /* create a new stack frame */
    oldstk = xlsave(&arg,&sym,&fargs,&fun,NULL);

    /* initialize */
    arg.n_ptr = args;

    /* get the function symbol */
    sym.n_ptr = xlmatch(SYM,&arg.n_ptr);

    /* get the formal argument list */
    fargs.n_ptr = xlmatch(LIST,&arg.n_ptr);

    /* create a new function definition */
    fun.n_ptr = newnode(LIST);
    fun.n_ptr->n_listvalue = fargs.n_ptr;
    fun.n_ptr->n_listnext = arg.n_ptr;

    /* make the symbol point to a new function definition */
    assign(sym.n_ptr,fun.n_ptr);

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the function symbol */
    return (sym.n_ptr);
}

/* sgetc - get a character from a string */
static int sgetc()
{
    if (*sgetptr == 0)
	return (-1);
    else
	return (*sgetptr++);
}

/* read - read an expression */
static struct node *read(args)
  struct node *args;
{
    struct node *val;
    int (*oldgetc)();

    /* save the old input stream */
    oldgetc = xlgetc;

    /* get the string or file pointer */
    if (args != NULL) {
	sgetptr = xlevmatch(STR,&args)->n_str;
	xlgetc = sgetc;
    }

    /* make sure there aren't any more arguments */
    xllastarg(args);

    /* read an expression */
    val = xlread();

    /* restore the old input stream */
    xlgetc = oldgetc;

    /* return the expression read */
    return (val);
}

/* fwhile - builtin function while */
static struct node *fwhile(args)
  struct node *args;
{
    struct node *oldstk,farg,arg,*val;

    /* create a new stack frame */
    oldstk = xlsave(&farg,&arg,NULL);

    /* initialize */
    farg.n_ptr = arg.n_ptr = args;

    /* loop until test fails */
    val = NULL;
    for (; TRUE; arg.n_ptr = farg.n_ptr) {

	/* evaluate the test expression */
	if (!testvalue(xlevarg(&arg.n_ptr)))
	    break;

	/* evaluate each remaining argument */
	while (arg.n_ptr != NULL)
	    val = xlevarg(&arg.n_ptr);
    }

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the last test expression value */
    return (val);
}

/* frepeat - builtin function repeat */
static struct node *frepeat(args)
  struct node *args;
{
    struct node *oldstk,farg,arg,*val;
    int cnt;

    /* create a new stack frame */
    oldstk = xlsave(&farg,&arg,NULL);

    /* initialize */
    arg.n_ptr = args;

    /* evaluate the repeat count */
    cnt = xlevmatch(INT,&arg.n_ptr)->n_int;

    /* save the first expression to repeat */
    farg.n_ptr = arg.n_ptr;

    /* loop until test fails */
    val = NULL;
    for (; cnt > 0; cnt--) {

	/* evaluate each remaining argument */
	while (arg.n_ptr != NULL)
	    val = xlevarg(&arg.n_ptr);

	/* restore pointer to first expression */
	arg.n_ptr = farg.n_ptr;
    }

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the last test expression value */
    return (val);
}

/* foreach - builtin function foreach */
static struct node *foreach(args)
  struct node *args;
{
    struct node *oldstk,arg,sym,list,code,oldbnd,*val;

    /* create a new stack frame */
    oldstk = xlsave(&arg,&sym,&list,&code,&oldbnd,NULL);

    /* initialize */
    arg.n_ptr = args;

    /* get the symbol to bind to each list element */
    sym.n_ptr = xlmatch(SYM,&arg.n_ptr);

    /* save the old binding of the symbol */
    oldbnd.n_ptr = sym.n_ptr->n_symvalue;

    /* get the list to iterate over */
    list.n_ptr = xlevmatch(LIST,&arg.n_ptr);

    /* save the pointer to the code */
    code.n_ptr = arg.n_ptr;

    /* loop until test fails */
    val = NULL;
    while (list.n_ptr != NULL) {

	/* check the node type */
	if (list.n_ptr->n_type != LIST)
	    xlfail("bad node type in list");

	/* bind the symbol to the list element */
	sym.n_ptr->n_symvalue = list.n_ptr->n_listvalue;

	/* evaluate each remaining argument */
	while (arg.n_ptr != NULL)
	    val = xlevarg(&arg.n_ptr);

	/* point to the next list element */
	list.n_ptr = list.n_ptr->n_listnext;

	/* restore the pointer to the code */
	arg.n_ptr = code.n_ptr;
    }

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* restore the old binding of the symbol */
    sym.n_ptr->n_symvalue = oldbnd.n_ptr;

    /* return the last test expression value */
    return (val);
}

/* fif - builtin function if */
static struct node *fif(args)
  struct node *args;
{
    struct node *oldstk,arg,testexpr,thenexpr,elseexpr,*val;
    int dothen;

    /* create a new stack frame */
    oldstk = xlsave(&arg,&testexpr,&thenexpr,&elseexpr,NULL);

    /* initialize */
    arg.n_ptr = args;

    /* evaluate the test expression */
    testexpr.n_ptr = xlevarg(&arg.n_ptr);

    /* get the then clause */
    thenexpr.n_ptr = xlmatch(LIST,&arg.n_ptr);

    /* get the else clause */
    if (arg.n_ptr != NULL)
	elseexpr.n_ptr = xlmatch(LIST,&arg.n_ptr);
    else
	elseexpr.n_ptr = NULL;

    /* make sure there aren't any more arguments */
    xllastarg(arg.n_ptr);

    /* figure out which expression to evaluate */
    dothen = testvalue(testexpr.n_ptr);

    /* default the result value to the value of the test expression */
    val = testexpr.n_ptr;

    /* evaluate the appropriate clause */
    if (dothen)
	while (thenexpr.n_ptr != NULL)
	    val = xlevarg(&thenexpr.n_ptr);
    else
	while (elseexpr.n_ptr != NULL)
	    val = xlevarg(&elseexpr.n_ptr);

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the last value */
    return (val);
}

/* quote - builtin function to quote an expression */
static struct node *quote(args)
  struct node *args;
{
    /* make sure there is exactly one argument */
    if (args == NULL || args->n_listnext != NULL)
	xlfail("incorrect number of arguments");

    /* return the quoted expression */
    return (args->n_listvalue);
}

/* fexit - get out of xlisp */
fexit()
{
    exit();
}

/* testvalue - test a value for true or false */
static int testvalue(val)
  struct node *val;
{
    /* check for a nil value */
    if (val == NULL)
	return (FALSE);

    /* check the value type */
    switch (val->n_type) {
    case INT:
	    return (val->n_int != 0);
    case STR:
	    return (strlen(val->n_str) != 0);
    default:
	    return (TRUE);
    }
}

/* xlinit - xlisp initialization routine */
xlinit()
{
    /* enter a copyright notice into the oblist */
    xlenter("Copyright-1983-by-David-Betz");

    /* enter the builtin functions */
    xlsubr("set",set);
    xlsubr("setq",setq);
    xlsubr("load",load);
    xlsubr("read",read);
    xlsubr("quote",quote);
    xlsubr("while",fwhile);
    xlsubr("repeat",frepeat);
    xlsubr("foreach",foreach);
    xlsubr("defun",defun);
    xlsubr("if",fif);
    xlsubr("exit",fexit);
}
                    