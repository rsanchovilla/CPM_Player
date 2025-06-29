 /***************************************
  *: CDEMOA - Copies a disk file, and counts characters along the way.
  ***************************************
  *	As of April 2, 1981 R. Lum
  *	Author: Glen Fisher
  ***************************************
  *
  * Demonstration program that exercises the various I/O routines
  * in Small-C.  Reads an input ASCII file and copies it to an output
  * file.  Also counts the number of times that each ASCII character occurs
  * in the input.
  */

#define NULL	0
#define TAB	9
#define NL	13

/****************************************
 *: MAIN - does almost all the work...
 ****************************************
 */
main()
{	char infile[80], outfile[80];
	char *in, *out;
	int c, t, freq[128];

	puts("Input file?  ");
	gets(infile);
	in = fopen(infile,"r");
	if(in==NULL){
		puts("Can't read ");
		puts(infile);
		putchar('.');
		nl();
		return;
		}
	while(1){
		puts("Output file? ");
		gets(outfile);
		out = fopen(outfile,"r");
		if(out==NULL)
			break;
		else {	puts(outfile);
			puts(" already exists.");
			nl();
			}
		}
	out = fopen(outfile,"w");
	if(out==NULL){
		puts("Can't write ");
		puts(outfile);
		putchar('.');
		nl();
		return;
		}
	
	c = 0;
	while(c<128)
		freq[c++] = 0;

	while((c=getc(in))>=0){
		freq[c & 127]++;
		putc(c,out);
		}	

	fclose(in);
	fclose(out);

	c = 0;
	while(c<128){
		if(freq[c]!=0){
			if(c==127)
				puts("^?");
			else if(c<' '){
				putchar('^');
				putchar(c+'@');
				}
			else putchar(c);
			putchar(TAB);
			putnum(freq[c]);
			nl();
			}
		c++;
		}

	putnum(freq[NL]);
	puts(" lines copied");
	nl();
/* end main */}

/**************************************** 
 *: NL - puts out new line
 ****************************************
 */
nl()
{
	putchar(NL);
/* end nl */}

/****************************************
 *: PUTNUM - prints a number
 ****************************************
 *  
 *	--- passed ---
 *	n - number to print
 */
putnum(n)
int n;
{
	if(n>9)
		putnum(n/10);
	putchar('0'+(n%10));
/* end putnum */}

/**************   
 * end CDEMOA *
 **************/     
n>9)
		putnum(n/10);
	putchar('0'+(n%10));
/* end putnum */}

/**************   
 * end CDEMOA *
 *******