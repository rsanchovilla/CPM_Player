/*	name...
		args

	purpose...
		to fetch arguments from the command line

	note...
		Delete the memory allocation (DW directive)
		for stdin and stdout before assembly.

	history...
	26 Jul 84  Not opening files until entire command line
		has been scanned & arguments stored. ">>"
		implemented (appends to existing file).
	26 Jul 84  No longer redirecting output to CONSOLE or
		LIST, or input to CONSOLE. args[] is declared
		globally.
	from ddj n 74 p 62, by Jan-Henrik Johansson
*/
#include iolib.h

#define EOF -1
#define NULL 0
#define CR 13
#define SPACE 32
#define BELL 7

int stdin,	/* input unit # - external (in IOLIB) */
stdout,		/* output unit # - external (in IOLIB) */
argcnt,		/* # arguments on command line */
argv[10];	/* pointers to arguments in args[] */
char *args;	/* stored arguments */

getarg(n,s,size) /* places in s the n-th argument (assumes s 
			has "size" bytes). Returns s.	*/
int n; char *s; int size;
{	char *str;
	int i;

	if(n<0|n>=argcnt) return EOF;
	i=0;
	str=argv[n];
	while(i<size-1)
		{if(str[i]==NULL) break;
		s[i]=str[i];
		i++;
		}
	s[i]=NULL;
	return s;
}
setargs()			/* fetch arguments */
{	int error; /* # errors encountered */
	char *inname,*outname, /* file names from command line */
	*count,	/* *count is # characters in command line */
	*ptr,	/* *ptr is next character in command line */
	*lastc,	/* points to last character in command line */
	*mode,	/* mode for output file */
	*next;	/* where the next byte goes into args[] */

	count=128;	/* CP/M command buffer */
	ptr=count+1;
	lastc=ptr+*count;
	*lastc=SPACE;		/* place a sentinal */
	args=alloc(*count);	/* allocate the buffer */
	argv[0]=args;
	args[1]=NULL;
	next=args+2;
	argcnt=1;
	inname=outname=error=0;
	while(++ptr<lastc)
		{if(*ptr==SPACE) continue;
		if(*ptr == '<')		/* redirect input */
			{while(*++ptr==SPACE){}
			inname=next;
			}
		else if(*ptr == '>')	/* redirect output */
			{if(ptr[1]=='>') {++ptr; *mode='a';}
			else *mode='w';
			while(*++ptr==SPACE){}
			outname=next;
			}
		else			/* argument */
			{argv[argcnt++]=next;
			}
		while(*ptr!=SPACE) *next++=*ptr++;
		*next++=NULL;
		}
	if(inname)
		{stdin=fopen(inname,"r");
		if(stdin==0)
			{putc("\n Can't open ",STDERR);
			putc(inname,STDERR);
			++error;
			}
		}
	if(outname)
		{stdout=fopen(outname,mode);
		if(stdout==0)
			{putc("\n Can't open ",STDERR);
			putc(outname,STDERR);
			++error;
			}
		}
	args[0]='*';		/* place 0-th argument */
	if(error) exit(BELL);
}
