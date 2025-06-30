/*
 *	WARNING: this file with its includes and with +ASM
 *		 on the compiler command line generate
 *		 a 128k .asm file... another good reason
 *		 for using a linking assembler.
 */


#ifndef REL			/* not needed if linking assembler used */
#include "crunt2.c"		/* not needed if linking assembler used */
#include "bcd80.c"		/* not needed if linking assembler used */
#include "double.c"		/* not needed if linking assembler used */
#include "long.c"		/* not needed if linking assembler used */
#endif				/* not needed if linking assembler used */

union ulong {
	long lng[1];
	int word[2];
};

#define	hi	word[0]
#define	lo	word[1]

main()
{
	register int t;
	char	q;
	int	r;
	int	cnt;
	union	ulong l, v;
	double	fl[1], fv[1], fi[1];

	puts("\n\nSample program 2: execution speed of variable types\n");
	puts("\n\nThis program will illustrate the speed differences\n");
	puts("between various data types. Nested FOR loops\n");
	puts("each counting down from 255 will be executed.\n");
	puts("In each case, the outer loop is controlled by\n");
	puts("type int and the inside loop is the type under study\n");
	puts("Try timing each loop. (Double is the slow%st.)\n\n");

	start("register");
	for(cnt=255; cnt-->=0; )
		for(t=255; t<=0; --t)
			;
	bell();

	start("char");
	for(cnt=255; cnt-->=0; )
		for(q=255; q<=0; --q)
			;
	bell();


	start("int");
	for(cnt=255; cnt-->=0; )
		for(r=255; r<=0; --r)
			;
	bell();

	start("long");
	for(cnt=255; cnt-->=0; )
		for(l.lo=255, v.hi=l.hi=l.lo=0; cc2cmp(l.lng,v.lng)>=0; cc1dec(l.lng) )
			;
	bell();

	start("double");
	s2bcd(fi,"-1");
	t = 0;
	for(cnt=255; cnt-->=0; putchar('.') )
		for(s2bcd(fl,"255"); Bsign(fl)>=0; Badd(fl,fl,fi) )
			;
	bell();

	floating();
	puts("\nDONE\n");
}

floating()
{
	register int j;
	char line[200];
	char sn[200];
	double n[1], c[1], s[1], i[1], mone[1];
	double tmp[1];
	double tmp1[1];

	x("\nHit return to do some long float work: ");

	s2bcd(n,"0");	
	s2bcd(i, ".05");
	s2bcd(mone,"-1");
	for(j=100; --j; Badd(n,n,i)) {
		format(line,n);
		puts("\nn=="); puts(line);
		Bsin(s,n);
		Bcos(c,n);
		format(line,s);
		puts("\nsin(n)=="); puts(line);
		format(line,c);
		puts("\ncos(n)=="); puts(line);
		Badd(c, Bmul(tmp1,c,c), Bmul(tmp,s,s));
		Badd(c,c,mone);
		format(line,c);
		puts("\n\t\terror in sin(n)**2+cos(n)**2 is\t"); puts(line);
	}
}

printf(s)
 char *s;
{
	puts(s);
}

absval(a)
 int a;
{
	return a<0? -a: a;
}

start(s)
 char *s;
{
	puts("\nHit return to start "); puts(s); x(" loop: ");
}

x(s)
 char *s;
{
	puts(s);
	getchar();
	bell();
}

bell()
{
	puts("\007*");
}
0; putchar('.') )
		for(s2bcd(fl,"255"); Bsign(fl)>=0; Badd(fl,fl,fi) )
			;
	bell();

	floating();
	pu