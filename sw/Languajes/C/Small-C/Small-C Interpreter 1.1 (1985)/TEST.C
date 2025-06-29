
	/*************************************************
	 *        Kernighan & Ritchie test program       *
	 *                                               *
	 * counts the number of characters typed on the  *
	 * keyboard until ^Z is typed                    *
	 *************************************************/

/* standard header file */
#include "a:stdio.h"


main()
{
	/* long (32 bit) integers are not available */
	int nc;

	/* introduction - printf() not yet available
	   note that this function prints a newline at the end of
	   the string */
	puts("Character counting program - type ^Z to exit");

	nc= 0;
	while(getchar() != EOF)
		++nc;			/* same as nc= nc +1; */

	/* end of file (^Z) detected - print result 
	   note the use of escape characters for newlines and tab */
 	fputs("\n\nThe number of characters was\t", stdout);

	/* call a function to print the number */
	outdec(nc);

	/* and finish with another newline */
	putchar('\n');
}


/* this function prints out a decimal number */

outdec(number)
int number;
{
	int k, zs;
	char c, *q, *r;

	/* set up "not a leading zero" flag and value of most 
	   significant digit of the 16 bit integer */
	zs= FALSE;
	k= 10000;

	/* deal with the minus sign */
	if(number < 0) {
		number= (-number);
		putchar('-');
	}

	/* do each digit in turn */
	while(k >= 1) {

		/* note that q and r are dealt with as unsigned
		   integers since they are defined as pointers */
		q= 0;
		r= number;

		/* set up q to be the value of the current digit */
		while(r >= k) {
			++q;
			r -= k;		/* same as r = r - k; */
		}

		/* make digit ascii and print if not a leading zero */
		c= q + '0';
		if( (c != '0') || (k==1) || zs ) {
			zs= TRUE;
			putchar(c);
		}

		/* set up for the next digit */
		number= r;
		k /= 10;
	}
}
