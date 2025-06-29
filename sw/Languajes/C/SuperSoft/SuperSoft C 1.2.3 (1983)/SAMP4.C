/*
 * sample 4
 */

#ifndef REL		/* not needed if linking assembler used */
#include "crunt2.c"	/* not needed if linking assembler used */
#include "func.c"	/* not needed if linking assembler used */
#endif			/* not needed if linking assembler used */

#define COL 6

main()
{
	register int n;
	int i,j,space;
	int aa[30],bb[30];
	char instr[80];

	puts("\n\nSample program 4: Pascal's triangle\n");

	do {
		puts("Enter a number greater than zero but less than 16: ");
		gets(instr);
		n=atoi(instr);
	} while(n<0 || n>15);
	puts("\n");

	space = n*COL/2;
	aa[0]=0; aa[1]=1;
	for(j=1; j<=n; ++j) {
		space=space-COL/2;
		for(i=0; i<=space; ++i) putchar(' ');
		for(i=1; i<=j; ++i) {
			bb[i]=aa[i-1]+aa[i];
		}
		aa[j+1]=0;
		for(i=1; i<=j; ++i) {
			print(bb[i],COL);
			aa[i]=bb[i];
		}
		puts("\n");
	}
}

print(num,ic)
 int num, ic;
{
	register int i;
	int j;

	for(i=0,j=num; j!=0; ++i)
		j /= 10;

	if(i>ic)
		for(i=1; i++<=ic; ) putchar('*');
	else
		for(j=1; j++<=ic-i; ) putchar(' ');

	putdec(num);
}
d if linking assembler used */
#include "crunt2.c"	/* not needed if linking as