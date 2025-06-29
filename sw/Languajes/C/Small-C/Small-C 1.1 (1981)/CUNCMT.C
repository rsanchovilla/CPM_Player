
/****************************************
 *: UNCMT.C - remove comments from assembler
 ****************************************
 *	As of: 6 April 81 RJ
 *	Author: Glen Fisher
 ****************************************
 * Warning: uncmt considers anything starting with a
 *	semicolon to be a comment, even if the
 *	semicolon is part of a character literal.
 */

#define NULL	0
#define NL	13
/****************************************
 *: MAIN - does the work.
 ****************************************
 * Reads an assembler file and gets rid of EVERYTHING that
 * follows a semicolon (including the semicolon).
 * Also deletes trailing blanks on a line.
 */
main()
{	char infile[80], outfile[80];
	char *inp, *outp;
	char line[256], *cp, *semic;
	int c, eof;

	putstr("uncmt: strip comments from assembler\","");

	putstr("Input file ? ",""); gets(infile);
	if((inp = fopen(infile,"r"))==NULL){
		putstr("Can't read %\",infile);
		return;
		}
	while(1){
		putstr("Output file? ",""); gets(outfile);
		outp = fopen(outfile,"r");
		if(outp==NULL) break;
		putstr("% already exists.\",outfile);
		}
	if((outp = fopen(outfile,"w"))==NULL){
		putstr("Can't write %\",outfile);
		return;
		}

	eof = 0;
	while(eof==0){	
		cp = line;
		*cp++ = '*';	/* non-blank or tab */
		semic = NULL;
		while((c=getc(inp))>=0){
			if(c==NL)
				break;
			if((c==';') & (semic==NULL))
				semic = cp;
			*cp++ = c;
			}
		eof = (c<0);
		if(semic!=NULL)
			cp = semic;
		while(--cp){		
			if((*cp!=' ') & (*cp!=9))
				break;
			}
		cp[1] = 0;
		if(cp>line){
			cp = line;
			while(*++cp)
				putc(*cp,outp);
			putc(NL,outp);
			}
		}

	fclose(inp);
	fclose(outp);
/* end main */}

/****************************************
 *: PUTSTR - put a string to console
 ****************************************
 *
 *	--- passed ---
 *	s   - The string to be printed
 *	arg - What we want printed where a '%' appears in s
 */

putstr(s,arg)				
char *s, *arg;
{
	while(*s){
		if(*s=='%')
			putstr(arg,"");
		else if(*s=='\')
			putchar(13);
		else	putchar(*s);
		s++;
		}
/* end putstr */}

/***************
 * end uncmt.c *
 ***************/
			putchar(13);
		else	putchar(*s);
		s++;
		}
/* end putstr */}

/*************