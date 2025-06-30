
/*
	Tabify.c	written by Leor Zolman

	This filter takes sequences of spaces in a file and turns
	them, whenever possible, into tabs. Usage:

		A>tabify oldfile newfile <cr>

	Quoted strings are not processed, but there should NOT be
	any `lone' double quotes within the file being tabified.
*/

#include "bdscio.h"

main(argc,argv)
char **argv;
{
	int scount, column, ifd, ofd, i;
	int c;
	char ibuf[BUFSIZ], obuf[BUFSIZ];

	if (argc != 3) {
		printf("usage: tabify oldfile newfile\n");
		exit();
	}
	ifd = fopen(argv[1],ibuf);
	ofd = fcreat(argv[2],obuf);
	if (ifd == ERROR || ofd == ERROR) {
		printf("Can't open file(s)\n");
		exit();
	}

	scount = column = 0;

	do {
		c = getc(ibuf);
		if (c == ERROR) {
			putc(CPMEOF,obuf);
			break;
		 }
		switch(c) {
		   case '\r':	putc1(c,obuf);
				scount = column = 0;
				break;
		   case '\n':	putc1(c,obuf);
				scount = 0;
				break;
		   case ' ':	column++;
				scount++;
				if (!(column%8)) {
				   if (scount > 1)
					putc1('\t',obuf);
				   else
					putc1(' ',obuf);
					scount = 0;
				 }
				break;
		   case '\t':	scount = 0;
				column += (8-column%8);
				putc1('\t',obuf);
				break;
		   case '"':	putc1('"',obuf);
				do {
				   c = getc(ibuf);
				   if (c == ERROR) {
				    printf("Quote error.\n");
				    exit();
				   }
				   putc1(c,obuf);
				} while (c != '"');
				do {
					c = getc(ibuf);
					putc1(c,obuf);
				} while (c != '\n');
				column = scount = 0;
				break;
		   case 0x1a:	putc(CPMEOF,obuf);
				break;
		   default:	for (i=0; i<scount; i++)
					putc1(' ',obuf);
				scount = 0;
				column++;
				putc1 (c,obuf);
		 }
	 } while (c != CPMEOF);

	fflush(obuf);
	fclose(ibuf);
	fclose(obuf);
}

putc1(c,buf)
char c;
{
	putchar(c);
	if (putc(c,buf) < 0) {
		printf("putc just retured an error!\n");
		exit();
	}
}

