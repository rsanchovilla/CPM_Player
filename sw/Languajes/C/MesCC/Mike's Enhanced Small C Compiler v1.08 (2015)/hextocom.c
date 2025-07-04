/*	hextocom.c

	Converts an HEX file into a COM file for CP/M.

	(C) 2007-2015 FloppySoftware (Miguel I. Garcia Lopez, Spain).

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

	To compile with MESCC:

	cc hextocom
	ccopt hextocom.zsm
	zsm hextocom
	hextocom hextocom

	Revisions:

	(hextobin.c)

	18 Apr 2007 : v1.00 :
	21 Apr 2007 :       : Shows first and last addresses, code size.
	29 Apr 2007 : v1.01 : Bug showing code size upper than 0x8000 (shows
	                      negative number). Changed %d to %u to solve this bug.
	15 May 2007 : v1.02 : Change usage text.

	(hextocom.c)

	13 Nov 2014 : v1.03 : Modified to generate COM files for CP/M.
	04 Sep 2015 : v1.04 : Modified some comments and messages.
*/

#include <mescc.h>

#include <printf.h>
#include <fileio.h>
#include <string.h>

#define VERSION "1.04 / 04 Sep 2015\n\n(c) 2007-2015 FloppySoftware"

FILE	*fpi,	/* HEX - Input file  */
	*fpo;	/* COM - Output file */

BYTE chksum;	/* Checksum of current line */

WORD	adr,		/* Load address */
	ladr,		/* Load address of current line */
	first_adr;	/* First address */

int	lbytes,		/* Number of data bytes of current line */
	line,		/* Number of current line */
	run,		/* Zero to exit program */
	flag_adr;	/* Zero if load address undefined */

char fn_hex[15], /* D:FILENAME.EXT */
     fn_com[15];

/* Show error and exit
*/

error(txt)
char *txt;
{
	printf("ERROR: %s.\n", txt);
	exit(1);
}

/* Show error with line number and exit
*/

errorln(txt)
char *txt;
{
	printf("ERROR in line %d: %s.\n", line, txt);
	exit(1);
}

/* Read hex nibble
*/

BYTE getnib()
{
	int c;

	c=fgetc(fpi);

	if(c>='0' && c<='9')
		return c-'0';
	
	if(c>='A' && c<='F')
		return c-'A'+10;

	if(c==EOF)
		error("Unexpected EOF");

	error("Bad hexadecimal digit");
}

/* Read two hex nibbles
*/

BYTE gethex()
{
	BYTE nib, hex;

	nib=getnib();

	chksum+=(hex=(nib << 4) + getnib());

	return hex;
}

/* Write byte
*/

putbyte(byte)
BYTE byte;
{
	if(fputc(byte, fpo)==EOF)
		error("Writing binfile");
}

/* Main
 */

main(argc, argv)
int argc, argv[];
{
	printf("HexToCom v%s\n\n", VERSION);

	if(argc!=2)
	{
		printf("Usage: hextocom hexfile\n");
		exit(1);
	}

	if(strchr(argv[1], '.') != NULL)
		error("Bad filename (no type, please)");

	if(strlen(argv[1]) > 10) /* D:FILENAME */
		error("Bad filename (too long)");

	strcat(strcpy(fn_hex, argv[1]), ".HEX");
	strcat(strcpy(fn_com, argv[1]), ".COM");

	if((fpi=fopen(fn_hex, "r"))==NULL)
		error("Opening HEX file");

	if((fpo=fopen(fn_com, "wb"))==NULL)
		error("Opening COM file");

	first_adr=adr=0; /* Load address */
	line=run=1;      /* Line number and loop variable */
	flag_adr=0;      /* Load address undefined */

	while(run)
	{
		if(fgetc(fpi) != ':')
			errorln("Missing colon");

		chksum=0;

		lbytes=gethex(); /* Bytes per line */

		ladr=gethex();
		ladr=(ladr<<8)+gethex(); /* Load adress */

		switch(gethex()) /* Line type */
		{
			case 0 : /* Data */
				if(!lbytes)
				{
					run = 0;
					break;
				}

				if(!flag_adr)
				{
					if((first_adr=adr=ladr) != 0x0100)
						error("Start address must be 0100H");

					++flag_adr;
				}
				else if(adr<ladr)
				{
					while(adr!=ladr)
					{
						putbyte(0);
						++adr;
					}
				}
				else if(adr>ladr)
					errorln("Bad address");

				adr+=lbytes;

				while(lbytes--)
					putbyte(gethex()); 
				break;
			case 1 : /* End */
				run=0;
				break;
			default :
				errorln("Unknown record type");
		}

		gethex(); /* Checksum */

		if(chksum)
			errorln("Bad checksum");

		if(fgetc(fpi)!='\n')
			errorln("Missing newline");

		++line;
	}

	if(fclose(fpi))
		error("Closing HEX file");

	if(fclose(fpo))
		error("Closing COM file");

	printf("First address: %04x\n", first_adr);
	printf("Last address:  %04x\n", adr-1);
	printf("Size of code:  %04x (%u dec) bytes\n", adr-first_adr, adr-first_adr);

}
