/*	zsmpp.c

	Source code preprocessor for the ZSM assembler.

	(C) 2015 FloppySoftware (Miguel I. Garcia Lopez, Spain).

	This program is free software; you can redistribute it and/or modify it
	under the terms of the GNU General Public License as published by the
	Free Software Foundation; either version 2 of the License, or (at your
	option) any later version.

	This program is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
	General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

	CONTACT:

	www.floppysoftware.vacau.com
	cpm-connections.blogspot.com
	floppysoftware@gmail.com

	USAGE:

	zsmpp source [> destination]

	TO COMPILE WITH MESCC:

	cc zsmpp
	ccopt zsmpp.zsm
	zsm zsmpp
	hextocom zsmpp

	REVISIONS:

	26 Mar 2015 : v1.00 : Initial version.
	04 Sep 2015 : v1.01 : Ammended some comments and messages.

	IMPLEMENTED COMMANDS:

	include filename

	NOTES:

	- Commands must be preceeded by blanks (spaces or tabs).

	TO DO & IDEAS:

	- Implement option to skip lines of comments (not for MESCC if optimizer will be used).
	- Implement option to skip empty lines.
	- Implement option to add output comments, before and after includes.
*/

/* MESCC DEFs
*/

#define CC_STDIO     /* Support for stdin, stdout, stderr */
#define CC_REDIR     /* Support for command line redirection */

#define CC_NO_SWITCH /* No switch */

/* MESCC libraries
*/

#include <mescc.h>
#include <conio.h>
#include <fileio.h>
#include <fprintf.h>
#include <string.h>
#include <redir.h>

/* ZsmPP DEFs & globals
*/

#define VERSION "1.01 / 04 Sep 2015\n\n(c) 2015 FloppySoftware"

#define BUF_LEN 127  /* Max. lenght for input buffer */
#define BUF_SIZ 128  /* Size for input buffer */

FILE *fp;	     /* Input file FP */

char buf[BUF_SIZ];   /* Input buffer */

/* Main
 */

main(argc, argv)
int argc, argv[];
{
	/* Show banner */

	fprintf(stderr, "ZsmPP v%s\n\n", VERSION);

	/* Check arguments */

	if(argc != 2)
	{
		fprintf(stderr, "Usage: zsmpp inputfile [> outputfile]\n");
		exit(1);
	}

	/* Process input file */

	procfile(argv[1]);
}

/* Process input file
*/

procfile(fn)
char *fn;
{
	int k;

	/* Open file */

	if((fp = fopen(fn, "r")) == NULL)
		error("Opening input file");

	/* Process file */

	while(1)
	{
		/* Read line */

		if(fgets(buf, BUF_SIZ, fp) == NULL)
			break;

		/* Check EOL */

		k = strlen(buf);

		if(buf[--k] != '\n')
			error("Line too long or missing newline");

		/* Clear LF and put a ZERO instead */

		buf[k] = 0;

		/* Process line */

		procline();
	}

	/* Close file */

	fclose(fp);
}

/* Process input line
*/

procline()
{
	char *p;

	/* Link to line */

	p = buf;

	/* Commands start with blanks */

	if(testblank(*p))
	{
		/* Skip spaces */

		p = skipspaces(p);

		/* Check command */

		if(testcommand("include", p))
		{
			/* Go for argument */

			p = skipcommand(p);

			/* Test argument */

			if(!testarg(p))
				error("Missing filename in include");

			/* Do include */

			doinclude(p);

			/* Done */

			return;
		}
	}

	/* Write line */

	puts(buf);	
}

/* Include
*/

doinclude(fn)
char *fn;
{
	FILE *fp;
	int c;

	/* Open file */

	if((fp = fopen(fn, "r")) == NULL)
		error("Opening include file");

	/* Process file */

	while((c = fgetc(fp)) != EOF)
		putchar(c);

	/* Close file */

	fclose(fp);
}

/* Skip command name and spaces before an argument
*/

skipcommand(s)
char *s;
{
	s = skipspaces(skipnonspc(s));
}

/* Skip spaces
*/

skipspaces(s)
char *s;
{
	while(testblank(*s))
		++s;

	return s;
}

/* Skip non-spaces
*/

skipnonspc(s)
char *s;
{
	while(!testblank(*s))
		++s;

	return s;
}

/* Test argument
*/

testarg(s)
char *s;
{
	return *s && *s != ';';
}

/* Test space or tab
*/

testblank(c)
int c;
{
	return c == ' ' || c == '\t';
}

/* Test command (with optional argument)
*/

testcommand(cmd, buf)
char *cmd, *buf;
{
	while(*cmd == *buf)
	{
		if(!(*cmd))
			break;

		++cmd; ++buf;
	}

	return !(*cmd) && (!(*buf) || testblank(*buf));
}

/* Print error and exit
*/

error(txt)
char *txt;
{
	fprintf(stderr, "ERROR: %s.\n", txt); exit(1);
}
