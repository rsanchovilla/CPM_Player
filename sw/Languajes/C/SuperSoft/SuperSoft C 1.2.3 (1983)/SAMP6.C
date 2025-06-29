/*
 * sample 6
 */

#ifndef REL		/* not needed if linking assembler used */
#include "crunt2.c"	/* not needed if linking assembler used */
#include "func.c"	/* not needed if linking assembler used */
#include "stdio.c"	/* not needed if linking assembler used */
#include "alloc.c"	/* not needed if linking assembler used */
#include "formatio.c"	/* not needed if linking assembler used */
#endif			/* not needed if linking assembler used */

#include "stdio.h"

#define d1	10
#define d2	2*d1
int arr[d1][d2];

char *fmt[11];

int printf(.), execl(.);	/* declare as list functions */

main()
{
	printf("Sample program 6: array indexing,\n");
	printf("formatted input/output, exec, and execl .\n");
printf(
"\n\nTest A: test 2 dimensional arrays (silent unless it fails)\n");
	test_2d_arrays();
	init_fmt();

printf(
"\n\nTest B: prints two strings plus the value 1 in various ways:\n\n");
	testprintf("CON:",1);

printf(
"\n\nTest C: prints two strings plus the value -2 in various ways:\n\n");
	testprintf("CON:",-2);

printf(
"\n\nTest D: prints the same using the hex value 0x8000:\n\n");
	testprintf("CON:",0x8000);
printf(
"\n\nThese next set of tests demostrate the aspects of symmetry between\n");
printf(
"printf format strings and scanf format strings\n");
printf(
"\n\nTest E: is like Test B, except that it does formatted file output\n");
printf(
"on the value 1, formatted file input on it, and then prints the result\n");
printf(
"on the console:\n\n");
	testprintf("$$",1);
	testScanf("$$");

printf(
"\n\nTest F: is like test C, except that it does formatted file output\n");
printf(
"on the value -2, formatted file input on it, and then prints the result\n");
printf(
"on the console (only the numbers on the first line will be output as -2\n");
printf(
"in the appropriate base, because of imperfect symmetry between printf and scanf\n");
printf(
"format strings):\n\n");
	testprintf("$$",-2);
	testScanf("$$");

printf(
"\n\nTest G: is like test D, except that it does formatted file output\n");
printf(
"on the value 0x8000, formatted file input on it, and then prints the result\n");
printf(
"on the console (only the numbers on the first line will be output as 0x8000\n");
printf(
"in the appropriate base, because of imperfect symmetry between printf and scanf\n");
printf(
"format strings):\n\n");
	testprintf("$$",0x8000);	/* hex 8000 */
	testScanf("$$");

printf(
"\n\nTest H: ");
	testexec();
}

init_fmt()
{
	fmt[0]="This is a format with no arguments\n";
	fmt[1]="%s\n";
	fmt[2]="%%o\t%o\t%%d\t%d\t%%u\t%u\t%%x\t%x\n";
	fmt[3]="%%3o\t%3o\t%%3d\t%3d\t%%3u\t%3u\t%%3x\t%3x\n";
	fmt[4]="%%6o\t%6o\t%%6d\t%6d\t%%6u\t%6u\t%%6x\t%6x\n";
	fmt[5]="%%06o\t%06o\t%%06d\t%06d\t%%06u\t%06u\t%%06x\t%06x\n";
	fmt[6]="%%07o\t%07o\t%%07d\t%07d\t%%07u\t%07u\t%%07x\t%07x\n";
	fmt[7]="%%-6o\t%-6o\t%%-6d\t%-6d\t%%-6u\t%-6u\t%%-6x\t%-6x\n";
	fmt[8]="%%-7o\t%-7o\t%%-7d\t%-7d\t%%-7u\t%-7u\t%%-7x\t%-7x\n";
	fmt[9]="%%-06o\t%-06o\t%%-06d\t%-06d\t%%-06u\t%-06u\t%%-06x\t%-06x\n";
	fmt[10]="%%-07o\t%-07o\t%%-07d\t%-07d\t%%-07u\t%-07u\t%%-07x\t%-07x\n";
}

test_2d_arrays()
{
	register int i;
	int j;
	int *p;

	for(j=0; j<20; ++j)
		for(i=0; i<d1; ++i)
			arr[i][j] = -2;

	for(p=arr; p<=&arr[d1-1][d2-1]; ++p)
		*p = -1;

	for(i=0; i<d1; ++i)
		for(j=0; j<d2; ++j)
			arr[i][j] = (j<<8)|i;

	for(p=arr; p<=&arr[d1-1][d2-1]; ++p)
		if(*p==-1)
			puts("Bad array value\n");
}

testprintf(s,i)
 char *s;
 int i;
{
	register int fd;

	fd = fopen(s,"w",128);
	if(fd==NULL) {
		printf("Can't open %s\n",s);
		return;
	}

	fprintf(fd, fmt[0]);
	fprintf(fd, fmt[1],  "This is one string argument");
	fprintf(fd, fmt[2],  i, i, i, i);
	fprintf(fd, fmt[3],  i, i, i, i);
	fprintf(fd, fmt[4],  i, i, i, i);
	fprintf(fd, fmt[5],  i, i, i, i);
	fprintf(fd, fmt[6],  i, i, i, i);
	fprintf(fd, fmt[7],  i, i, i, i);
	fprintf(fd, fmt[8],  i, i, i, i);
	fprintf(fd, fmt[9],  i, i, i, i);
	fprintf(fd, fmt[10], i, i, i, i);

	if(isatty(fileno(fd)))
		fflush(fd);/* leaving this open for no particular good reason */
	else
		fclose(fd);
}

testScanf(s)
 char *s;
{
	register int fd;
	char str[100];
	int i, j, k, l;

	fd = fopen(s,"r",128);
	if(fd==NULL) {
		printf("Can't open %s\n",s);
		return;
	}

	if(fscanf(fd,"%[^\n]s",str)==ERROR)
		return;

	printf(   "%s\n",str);

	if(fscanf(fd,"%[^\n]s\n",str)==ERROR)
		return;

	printf(   "%s\n",str);

	do_one(fd,2);
	do_one(fd,3);
	do_one(fd,4);
	do_one(fd,5);
	do_one(fd,6);
	do_one(fd,7);
	do_one(fd,8);
	do_one(fd,9);
	do_one(fd,10);

#ifdef XXXX
	printf("\n---the following was not read from %s---\n",s);

	for(;;){
		i = getc(fd);
		if(i==-1 || i==0x1a)
			return;
		putchar(i);
	}
#endif
}

do_one(fd, n)
 int fd;
 int n;
{
	int i, j, k, l;

	i = j = k = l = -1;
	fscanf(fd,fmt[n], &i, &j, &k, &l);
	printf(   fmt[n],  i,  j,  k,  l);
}

testexec()
{
	puts("Now, test execl.  Look for samp5.com on this disk:\n");
	execl("samp5.com","samp5.hex",0);
	/*
	 * if we can't find samp5.com,
	 * try other programs:
	 */
	puts("Couldn't find samp5.com, try to find another sample program.\n");
	exec("samp4.com");
	exec("samp3.com");
	exec("samp2.com");
	exec("samp1.com");

	/*
	 * if we can't find samp?.com,
	 * try a few prime user numbers
	 * on the current drive:
	 */
	puts("Still can't find a sample program, try a different user no.\n");
	exec("/1:samp3.com");
	exec("/3:samp3.com");
	exec("/5:samp3.com");
	exec("/7:samp3.com");
	exec("/11:samp3.com");
	exec("/13:samp3.com");
	puts("Can't exec a sample program");
}
intf("\n---the following was not read from %s---\n",s);
