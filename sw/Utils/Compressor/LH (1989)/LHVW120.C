/*****************************************************************************
 *      v. 1.20 adds a "#define CPM" which, if defined, recognizes CP/M 
 * drive/user areas (DU:FILENAME.EXT), with both drive and user-area
 * arguments optional. Also adds compile-time selectable "int maxusr" and 
 * "int maxdrv" values to specify maximum drive/user areas for protection.
 * The maximum length of "char arc_name[]" was increased to accommodate
 * drive/user areas and a test added to check validity of lengths of this
 * string and "char filespec[]". V. 1.11 omitted this potential crash-
 * inducing check and would actually accept and execute a user request which
 * included a drive even when such overran the arc_name buffer. Lastly, a
 * check has been added to disallow display of .EXE, .COM, .OBJ and ambiguous
 * filenames if viewonly set to true.
 * 	For reasons noted in the update file, these modest changes were a real
 * struggle and (given those reasons) polish which could readily be made to 
 * changes are left to someone in a better position to do so. In the interim,
 * the program is significantly more functional tool, especially for RCP/Ms 
 * offering MS-DOS archives.
 *     Thanks to Bill Mattson for energies far beyond the original request to
 * "just" compile and link the new code, again as noted in the update file.
 *     Like predecessor contributors to this code, the latest changes are 
 * released into the public domain "as is," with a disclaimer of all 
 * warranties, expressed or implied. While I can't guarantee to take any 
 * particular action in response to bug reports, suggestions for improvements,
 * etc., such input is welcome and encouraged.
 *
 * 	-- J.W. Olsen, 4/5/90
 *	   Sysop, The Advocate RCP/M
 * 	   312.939.4411 (24 hrs., 300/1200/2400, 8/n/1)
 *	   Advocate Enterprises, Ltd.
 *	   117 W. Harrison Building
 *         6th Floor Mail Stop #A-408
 *	   Chicago, IL 60605
 *
 */
 
 /*
 * LHRD.C from LZHUFDEC.C for listing and extracting members of LHARC
 *  - (.LZH) files, v1.0  S. Greenberg 4/16/89.  v1.11 source released 5/28/89
 * LZHUFDEC.C from LZHUF10.C for CPM, Eugene Nolan 4/13/89
 * LZHUF.C English version 1.0 Based on Japanese version 29-NOV-1988
 * LZSS coded by Haruhiko OKUMURA
 * Adaptive Huffman Coding coded by Haruyasu YOSHIZAKI
 * Edited and translated to English by Kenji RIKITAKE
 */

/* To create a "view only" version (displays to console; will not write
 *  to disk)  un-comment the "#define viewonly" below.
 *
 * To create an MS-DOS version, un-comment "#define MSC" and "#pragma pack(1)"
 *  The resulting file should compile without error with Micrsoft 'C' 5.0.
 *  If MSC is not defined, the program compiles without error with Aztec 'C'
 *  v1.06d, to create a CP/M version. (This is how the .COM file included
 *  was created). ==> Please note the included COM file is CP/M, not MS-DOS !!
 *
 * Any responsible updates invited, I make no claims to or restrictions on the
 *  the sections of code I have written. (I also make no guarantees this code
 *  will perform a specific function and am not responsible for incidental or
 *  consequential damages arising from its use. This code is supplied 'as is')
 *
 *   Certain restrictions may apply to sections of code belonging to other
 *    authors listed above. Please consult them if if any questions arise.
 *
 *												- S. Greenberg  28 May 1989
 *****************************************************************************/

								/* comment out if file extraction desired */
#define viewonly
								/* not for user alteration */
#include "stdio.h"
#include "ctype.h"
#define EXIT_OK 0
#define EXIT_FAILED -1
				/* if CPM is defined, CP/M drive/user areas
				   will be recognized. if so, MSC & its pragma
  				   pack should be commented out */
#define CPM
                                       /* this line not for user alteration */
#ifdef CPM
						 /* set these if CPM defined */
int 		maxusr	=	8;		 /* maximum CP/M user area */
char		maxdrv	=	'C';	         /* maximum CP/M drive */
#endif
         				/* if defined, code is to be compiled
  		             		   with Microsoft 'C' for MS/PC-DOS */
/* #define MSC
* #pragma pack(1)
*/

/* END OF USER-ALTERABLE EQUATES ********************************************/

#ifdef	MSC
#define read_access	     "rb"     /* to open input file (binary) with fopen */
#define write_access	     "wb"    /* likewise output file */
#define str_chr 	     strchr  /* find occurrence of substring in a string */
#define mem_move	     memmove /* memory to memory move */

#else
#define read_access	     "r"     /* these all correspond to the above */
#define write_access	     "w"
#define str_chr 	     index
#define mem_move	     movmem
                                       /* apparently AZTEC C has no ststr()
                                          --this protytpes my replacement fxn
                                          found at the end of this file */
#endif

FILE		*infile,
			*outfile;
long int	codesize,
			printcount;
int			linecount;
/*****************************************************************************/
/* This stuff is used to do file extent comparisons in the view-only mode,   */
/* to prevent attempts to display non-printable files. Such attempts will    */
/* surely drive your trusty computer berserk, and we can't have that. See    */
/* also the appropriate code down around line #860 or so for more........    */
/*                                                                           */
int             filelen;           /* used to get the length of filespec*/
char            extent[4];         /* used to hold  concatenated extent */
char            exe[] = {"EXE"};   /* used to hold "EXE" for comparison */
char            com[] = {"COM"};   /* used to hold "COM" for comparison */
char            obj[] = {"OBJ"};   /* used to hold "OBJ" for comparison */ 
char            amb[] = {"*.*"};   /* used to hold "*.*" for comparison */
char            astrsk[] = {"*"};  /* used to hold "*" for comparison   */
char            questn[] = {"?"};  /* used to hold "?" for comparison   */
int             exetst;            /* used to test for match with "EXE" */
int             comtst;            /* used to test for match with "COM" */ 
int             objtst;            /* used to test for match with "OBJ" */
int             ambtst;            /* used to test for match with "*.*" */
int             letter = 1;        /* flag for presence of "?" or "*"   */ 
/*                                                                           */
/*****************************************************************************/
char		hdrlen;
char		outfname[13];
char		comp_type[6];
int			crc;
long int	orig_tot,
			comp_tot;
int			num_files = 0;

struct archdr {
	char		hdr_len;		/* header length in bytes */
	char		checksum;		/* checksum of header only */
	char		stowage[5];		/* compression method- "-lh1-" or "-lh2-" */
	long int	comp_size;		/* size of compressed file in bytes */
	long int	orig_size;		/* size of the original file in bytes */
	int			file_time;		/* file's last mod time, MS-DOS format */
	int			file_date;		/* date, likewise */
	int			attrib;			/* file's attributes, bit mapped */
	char		fn_len;			/* #of characters in filename */
}		archdr;					/* (filename follows, variable length field) */

#define LINEFEED 0x0a			/* ascii linefeed character */

/* LZSS Parameters */
#define N 4096					/* Size of string buffer */
#define F 60					/* Size of look-ahead buffer */
#define THRESHOLD 2				
#define NIL N					/* End of tree's node */

unsigned char	text_buf[N + F - 1];

/* Huffman coding parameters */
#define N_CHAR (256 - THRESHOLD + F)

/* character code (= 0..N_CHAR-1) */
#define T (N_CHAR * 2 - 1)			/* Size of table */
#define R (T - 1)				/* root position */
#define MAX_FREQ 0x8000

/* update when cumulative frequency reaches to this value */
typedef unsigned char uchar;

/*
 * Tables for encoding/decoding upper 6 bits of sliding dictionary pointer
 */

/* decoder table */
uchar		d_code[256] = {
			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
			     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
			     0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
			     0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
			     0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
			     0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
			     0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			     0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			     0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			     0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			     0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
			     0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
			     0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A,
			     0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B,
			     0x0C, 0x0C, 0x0C, 0x0C, 0x0D, 0x0D, 0x0D, 0x0D,
			     0x0E, 0x0E, 0x0E, 0x0E, 0x0F, 0x0F, 0x0F, 0x0F,
			     0x10, 0x10, 0x10, 0x10, 0x11, 0x11, 0x11, 0x11,
			     0x12, 0x12, 0x12, 0x12, 0x13, 0x13, 0x13, 0x13,
			     0x14, 0x14, 0x14, 0x14, 0x15, 0x15, 0x15, 0x15,
			     0x16, 0x16, 0x16, 0x16, 0x17, 0x17, 0x17, 0x17,
			     0x18, 0x18, 0x19, 0x19, 0x1A, 0x1A, 0x1B, 0x1B,
			     0x1C, 0x1C, 0x1D, 0x1D, 0x1E, 0x1E, 0x1F, 0x1F,
			     0x20, 0x20, 0x21, 0x21, 0x22, 0x22, 0x23, 0x23,
			     0x24, 0x24, 0x25, 0x25, 0x26, 0x26, 0x27, 0x27,
			     0x28, 0x28, 0x29, 0x29, 0x2A, 0x2A, 0x2B, 0x2B,
			     0x2C, 0x2C, 0x2D, 0x2D, 0x2E, 0x2E, 0x2F, 0x2F,
			     0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
			     0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F,
};

uchar		d_len[256] = {
			      0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
			      0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
			      0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
			      0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03,
			      0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			      0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			      0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			      0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			      0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			      0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
			      0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			      0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			      0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			      0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			      0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			      0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
			      0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			      0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			      0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			      0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			      0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			      0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
			      0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
			      0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
};

unsigned	freq[T + 1];			/* cumulative freq table */

/*
 * pointing parent nodes. area [T..(T + N_CHAR - 1)] are pointers for leaves
 */

int		prnt[T + N_CHAR];

/* pointing children nodes (son[], son[] + 1) */
int		son[T];
unsigned	getbuf = 0;
uchar		getlen = 0;

/* Display specified message and abort the program */
void
Error0(message)
	char	       *message;
{
	printf(message);
	exit(EXIT_FAILED);
}

/* Like above, used when message has an argument */
void
Error1(message, string)
	char	       *message;
	char	       *string;
{
	printf(message, string);
	exit(EXIT_FAILED);
}

/* Output one character to the output file (or console in 'view' version) */
void
Output(ch)
	char		ch;
{
#ifndef viewonly
	putc(ch, outfile);						/* simple enough */

#else
	if (ch != 0x1A) {						/* Don't type the EOF */
		putc((ch & 0x7F), stdout);			/* strip any hi-bits */
		if (ch == LINEFEED) {				/* count linefeeds */
			if (linecount++ == 22) {		/* 22 lines yet? */
				linecount = 0;				/* reset line count */
				printf("[More]");			/* wait for <rtn> */
				if ((getc(stdin)) == 0x0B)	/* ^K aborts [doesn't work!] */
					Error0("++ Abort ++");	/* supposed to abort! */
			}
		}
	}
#endif
}

/* get one bit */
int
GetBit()
{
	static int	i;

	while (getlen <= 8) {
		if ((i = getc(infile)) < 0)
			i = 0;
		getbuf |= i << (8 - getlen);
		getlen += 8;
	}
	i = getbuf;
	getbuf <<= 1;
	getlen--;
	return (i < 0);
}

/* get a byte */
int
GetByte()
{
	static unsigned i;

	while (getlen <= 8) {
		if ((i = getc(infile)) < 0)
			i = 0;
		getbuf |= i << (8 - getlen);
		getlen += 8;
	}
	i = getbuf;
	getbuf <<= 8;
	getlen -= 8;
	return i >> 8;
}

/* initialize freq tree */
void
StartHuff()
{
	static int	i,
			j;

	for (i = 0; i < N_CHAR; i++) {
		freq[i] = 1;
		son[i] = i + T;
		prnt[i + T] = i;
	}
	i = 0;
	j = N_CHAR;
	while (j <= R) {
		freq[j] = freq[i] + freq[i + 1];
		son[j] = i;
		prnt[i] = prnt[i + 1] = j;
		i += 2;
		j++;
	}
	freq[T] = 0xffff;
	prnt[R] = 0;
}

/* reconstruct freq tree */
void
reconst()
{
	static int	i,
			j,
			k;
	static unsigned f,
			l;

	/* halven cumulative freq for leaf nodes */
	j = 0;
	for (i = 0; i < T; i++) {
		if (son[i] >= T) {
			freq[j] = (freq[i] + 1) / 2;
			son[j] = son[i];
			j++;
		}
	}

	/* make a tree : first, connect children nodes */
	for (i = 0, j = N_CHAR; j < T; i += 2, j++) {
		k = i + 1;
		f = freq[j] = freq[i] + freq[k];
		for (k = j - 1; f < freq[k]; k--);
		k++;
		l = (j - k) * 2;

		mem_move(&freq[k], &freq[k + 1], l);
		freq[k] = f;
		mem_move(&son[k], &son[k + 1], l);

		son[k] = i;
	}

	/* connect parent nodes */
	for (i = 0; i < T; i++) {
		if ((k = son[i]) >= T) {
			prnt[k] = i;
		} else {
			prnt[k] = prnt[k + 1] = i;
		}
	}
}

/* update freq tree */
void
	update(c) int	c;

{
	static int	i,
			j,
			k,
			l;

	if (freq[R] == MAX_FREQ) {
		reconst();
	}
	c = prnt[c + T];
	do {
		k = ++freq[c];

		/* swap nodes to keep the tree freq-ordered */
		if (k > freq[l = c + 1]) {
			while (k > freq[++l]);
			l--;
			freq[c] = freq[l];
			freq[l] = k;
			i = son[c];
			prnt[i] = l;
			if (i < T)
				prnt[i + 1] = l;
			j = son[l];
			son[l] = i;
			prnt[j] = c;
			if (j < T)
				prnt[j + 1] = c;
			son[c] = j;
			c = l;
		}
	} while ((c = prnt[c]) != 0);		/* do it until reaching the
						 * root */
}

unsigned	code,
		len;
int
DecChar()
{
	static unsigned c;

	c = son[R];

	/*
	 * start searching tree from the root to leaves. choose node #(son[])
	 * if input bit == 0 else choose #(son[]+1) (input bit == 1)
	 */
	while (c < T) {
		c += GetBit();
		c = son[c];
	}
	c -= T;
	update(c);
	return c;
}

int
DecPosition()
{
	static unsigned i,
			j,
			c;

	/* decode upper 6 bits from given table */
	i = GetByte();
	c = (unsigned) d_code[i] << 6;
	j = d_len[i];

	/* input lower 6 bits directly */
	j -= 2;
	while (j--) {
		i = (i << 1) + GetBit();
	}
	return c | i & 0x3f;
}

/* Decoding/Uncompressing */
void
Decode()
{
	static int	i,
			j,
			k,
			r,
			c;
	static long int count;

	if (archdr.orig_size == 0)
		return;
	StartHuff();
	for (i = 0; i < N - F; i++)
		text_buf[i] = ' ';
	r = N - F;
	for (count = 0; count < archdr.orig_size;) {
		c = DecChar();
		if (c < 256) {
			Output(c);
			text_buf[r++] = c;
			r &= (N - 1);
			count++;
		} else {
			i = (r - DecPosition() - 1) & (N - 1);
			j = c - 255 + THRESHOLD;
			for (k = 0; k < j; k++) {
				c = text_buf[(i + k) & (N - 1)];
				Output(c);
				text_buf[r++] = c;
				r &= (N - 1);
				count++;
			}
		}
#ifndef viewonly
		if (count > printcount) {
			printf("%4dk\r", count / 1024);		/* display progress each 1k  */
			printcount += 1024;
		}
#endif
	}
	printf("      \r");					/* clear last 'progress display' */
	fseek(infile, -1L, 1);				/* back up one byte */
}

/* list a member file */
void
Listent()
{

	int		yr,
			mo,
			dy;
	int		hh,
			mm,
			ss;
	int		ratio;

	printf("  %-14s%8ld  %8ld  ", outfname, archdr.orig_size, archdr.comp_size);

	/*
	 *  Compute compression ratio, in tenths of a percent.
	 *  Display percent & tenths later using divide and modulus separately.
	 *  The roundabout technique avoids calling in the floating point stuff.
	 */
	
	ratio = (1000 * archdr.comp_size) / archdr.orig_size;

	yr = (archdr.file_date >> 9) & 0x7f;	/* extract date from bit mapped fields */
	mo = (archdr.file_date >> 5) & 0x0f;
	dy = archdr.file_date & 0x1f;

	hh = (archdr.file_time >> 11) & 0x1f;	/* likewise the time */
	mm = (archdr.file_time >> 5) & 0x3f;
	ss = (archdr.file_time & 0x1f) * 2;

	printf("%3d.%1d%%", ratio / 10, ratio % 10);	/* percent & tenths */
	printf("  %2d-%02d-%02d", (yr + 80) % 100, mo, dy);		/* date */
	printf("  %2d:%02d:%02d  ", hh, mm, ss);				/* time */
	printf("%5s  %04x\n", comp_type, crc);			/* comp. method & CRC */
}

/* extract an uncompressed file (flagged "-lh0-") */
void
Copy()
{
	static long int count;

	for (count = 0; count < archdr.orig_size; count++) {
		Output(getc(infile));					/* easy enough */
#ifndef viewonly
		if (count > printcount) {
			printf("%4dk\r", count / 1024);		/* progress reports */
			printcount += 1024;
		}
#endif
	}
	printf("      \r");
}

/*
 * match() compares a pattern with a string.  Wildcards accepted in the
 * pattern are:  "*" for zero or more arbitrary characters;  "?" for any one
 * characters.	Unlike the MS-DOS wildcard match, "*" is correctly handled
 * even if it isn't at the end of the pattern. ".' is not special.
 *
 * Originally written by Jeff Damens of Columbia University Center for Computing
 * Activities.	Taken from the source code for C-Kermit version 4C.
 */

/* Note: I left this routine intact, but did add a "." character to either
 * a filename or match pattern that originally had a blank extension (done
 * elsewhere, before this routine is called). This provides a minimum
 * expected compatibility with MS-DOS conventions, eg that "*.*" refers to
 * all files, not all files except those with blank extensions. - SGG
 */

int
match(string, pattern)
	register char	*string,
					*pattern;
{
	char			*psave,
					*ssave;			/* back up pointers for failure */

	psave = ssave = ((char *) 0);
	while (1) {
		for (; *pattern == *string; pattern++, string++)	/* skip first */
			if (*string == '\0')
				return (1);	/* end of strings, succeed */
		if (*string != '\0' && *pattern == '?') {
			pattern++;		/* '?', let it match */
			string++;
		} else if (*pattern == '*') {	/* '*' ... */
			psave = ++pattern;	/* remember where we saw it */
			ssave = string; 	/* let it match 0 chars */
		} else if (ssave != ((char *) 0) && *ssave != '\0') {	/* if not at end  */
			/* ...have seen a star */
			string = ++ssave;	/* skip 1 char from string */
			pattern = psave;	/* and back up pattern */
		} else
			return (0);		/* otherwise just fail */
	}
}

/* Open an output file with a specified name. If a file with that name
 * already exists, prompt the user before overwriting it.
 */
 
FILE
* Openfile(fn)
	char	       *fn;
{
	FILE	       *handle;

#ifndef viewonly

/* there is no doubt a more straightforward way to do this! */
#ifdef	MSC
	if (access(fn, 0) == 0) {					/* does file exist? */
		printf(" File exists- overwrite?");		/* yes, prompt */
		if (toupper(getc(stdin)) == 'Y') {		/* yes? */
			if ((handle = fopen(fn, write_access)) == NULL)	/* open if poss */
				Error1("Can't open: %s\n", outfname);		/* else fatal err */
		} else
			handle = 0;							/* if he said no, rtn null */
	} else {
		if ((handle = fopen(fn, write_access)) == NULL)	/* doesn't exist...*/
			Error1("Can't open: %s\n", outfname);		/* ...open if poss */
	}

/* do it without the benifit of the 'access' function... */
#else
	if ((handle = fopen(fn, "x")) == NULL) {  /* open in no-overwrite mode */
		if ((handle = fopen(fn, read_access)) != NULL) { /* fail, try read */
			close(handle);	/* that worked, must have failed due to existance */
			handle = 0;		/* close, didn't really want to read it anyway! */
			printf(" File exists- overwrite?");	/* ask */
			if (toupper(getc(stdin)) == 'Y') {	/* well? */
				if ((handle = fopen(fn, write_access)) == NULL)	/* write over! */
					Error1("Can't open: %s\n", outfname);	/* random failure */
			}
		}
	}
#endif

#else
	handle = stdout;
#endif

	printf("\n");
	return (handle);
}

int
	main(argc, argv) int argc;
	char	       *argv[];

{
	char	arc_name[17];
	char	filespec[13];
	int		ksize;
	int		rat_tot;
        int        i;

#ifdef CPM
	char 	*p;
	char 	*q;
	char	du[5];
#endif
	
	comp_type[5] = 0;
	comp_tot = 0;
	orig_tot = 0;

#ifndef viewonly
	printf("\nLHRD  v. 1.20  (3/10/90) JWO\n\n");
#else
	printf("\nLHVW  v. 1.20  (3/10/90) JWO\n\n");
#endif

	if ((argc != 3) && (argc != 2)) {
#ifndef viewonly
		printf("Usage: LHRD  <filename>  [<afn>]\n\n");
		printf("where <filename> is an LHARC file (default extension .LZH or .LHC).\n");
		printf("Members matching <afn> are extracted to the current drive.\n");
		printf("If <afn> is absent, member names are displayed.\n");
		return EXIT_FAILED;
#else
		printf("Usage: LHVW  <filename>  [<afn>]\n\n");
		printf("where <filename> is an LHARC file (default extension .LZH or .LHC).\n");
		printf("Contents of member(s) matching <afn> will be displayed to the console.\n");
		printf("If <afn> is absent, member names are displayed.\n");
		return EXIT_FAILED;
#endif

         }

         i=0;                                    /* kludge a CP/M strupr() */
         while(argv[1][i]) {                     /* need caps for maxdrv check */
                   arc_name[i]=toupper(argv[1][i]);
                   ++i;
                   }
         arc_name[i]='\0';
	if (argc > 2) {
		   strcpy(filespec, argv[2]);
                      }
#ifdef	MSC
	strupr(arc_name);
	if (argc > 2)
		strupr(filespec);
#endif

#ifdef CPM
      /* Check for drive/user area in arc_name in form DU:FILENAME (both drive
       *  and user area are optional). Strip out any user area and, if valid,
       *  use BDOS call to set it for read/write. Ensure arc_name contains only
       *  filename and optional drive w/out user area when done 	*/
      p=str_chr(arc_name,':');			/* colon in arc_name? */
	if (p) {			/* if so, parse it, else do nada */
		if ((p-arc_name)>3) {			/* DU: too long? */
			*(p+1)='\0';	/* yep, so report it & bad entry */
			Error1("Invalid DU: %s",arc_name);
			}
		for (i=0;i<=(p-arc_name);i++) du[i]=arc_name[i];	/* no, so parse */
		du[i-1]='\0';
		if (isalpha(arc_name[0])) 		/* put arc_name in form [D:]FILENAME */
			q=arc_name+1;
		else {
			q=arc_name;
			p++;
			}
		strcpy(q,p);
		if(isalpha(du[0])) {			   /* does DU: contain a drive? */
			if (du[0]>maxdrv) {	           /* yep, so check maximum drive */
				Error0("Invalid drive");
				}
			q=du+1;		                   /* & point to byte after it */
			}
		else q=du;                                 /* nope, so point to beginning */
		if (isdigit(*q)) {			   /* got a number? */
			if (atoi(q) > maxusr)		   /* yep, so check max. user area */
				Error1("Invalid user area %s",q);
			bdos(32,atoi(q));                  /* & read/write user area */
			}
		}
#endif

	if ((argc > 2) && (str_chr(filespec, '.')) == NULL)
		strcat(filespec, ".");
	if (str_chr(arc_name, '.') == NULL)
		strcat(arc_name, ".LHC");

if (strlen(arc_name)>16) Error0("Arcname too long");
if ((argc>2)&&(strlen(filespec))>12) Error0("Arc member filename too long");

	if ((infile = fopen(arc_name, read_access)) == NULL) {
		strcpy((arc_name + strlen(arc_name) - 3), "LZH");
		if ((infile = fopen(arc_name, read_access)) == NULL)
			Error1("Not found: %s\n", arc_name);
	}
	printf("File: %-13s\n\n", arc_name);

	if (argc == 2) {
		printf("  Name          Original    Packed   Ratio    Date      Time    Type   CRC\n");
		printf("--------------  --------  --------  ------  --------  --------  -----  ----\n");
	}
	while ((hdrlen = getc(infile)) != 0) {

		fread(&archdr.checksum, 1, sizeof archdr - 1, infile);
		strncpy(comp_type, archdr.stowage, 5);
		if ((strcmp(comp_type, "-lh1-") != 0) &&
		    (strcmp(comp_type, "-lh0-") != 0))
			Error0("Unsupported storage method encountered. \n");
		ksize = (archdr.orig_size + 1023) / 1024;
		comp_tot += archdr.comp_size;
		orig_tot += archdr.orig_size;
		num_files++;

		if (archdr.fn_len > 12)
			Error0("Invalid filename encountered.\n");
		fread(outfname, 1, archdr.fn_len, infile);	/* read in the filename */
		outfname[archdr.fn_len] = 0;	/* null terminate */
		if ((hdrlen - archdr.fn_len) == 22)
			fread(&crc, sizeof(crc), 1, infile);	/* read CRC if it exists */
		else
			crc = 0;		/* default display value if
						 * no CRC support */

		if (argc == 2) {
			Listent();
			fseek(infile, archdr.comp_size, 1);
		} else {

			if (str_chr(outfname, '.') == NULL)
				strcat(outfname, ".");

		if (match(outfname, filespec)) {

/*****************************************************************************/
/* Let's parse up the requested filename and strip off the extent so that we */
/* can examine it for nasty stuff like EXE, COM, OBJ, *.*, ?, and *. This is */
/* necessary because printing these files will frequently hang your computer */

                      filelen=(strlen(filespec));             /* Get length  */
                      extent[0] = filespec[filelen - 3];      /* of each char*/
                      extent[1] = filespec[filelen - 2];      /* in the input*/
                      extent[2] = filespec[filelen - 1];      /* file extent */
                      exetst = strcmp(extent,exe);       /* Compare with EXE */
                      comtst = strcmp(extent,com);       /* COM, OBJ and *.* */
                      objtst = strcmp(extent,obj);       /* Value becomes 0  */
                      ambtst = strcmp(extent,amb);       /* if match is true */
                      if(extent[0] == astrsk[0]) letter = 0; /* Now check on */
                      if(extent[1] == astrsk[0]) letter = 0; /* each letter  */
                      if(extent[2] == astrsk[0]) letter = 0; /* of the extent*/
                      if(extent[0] == questn[0]) letter = 0; /* for ? and *, */
                      if(extent[1] == questn[0]) letter = 0; /* set letter to*/
                      if(extent[2] == questn[0]) letter = 0; /* 0 if matched */
                      printf("\n");
/*                                                                           */
/*****************************************************************************/

#ifndef viewonly
			printf("Extracting: %-13s (%dk)", outfname, ksize);
#else

/*****************************************************************************/
/* Back to viewonly mode, and if we found a nasty value, we'll tell you so:  */

                           if (exetst == 0) goto enterr; /* Don't bitch about*/
                           if (comtst == 0) goto enterr; /* the goto's!!!    */
                           if (objtst == 0) goto enterr; /* enterr: is at    */
                           if (ambtst == 0) goto enterr; /* line #927        */
                           if (letter == 0) goto enterr; /* 0 means found it!*/

/* By going down and getting a special error message, before going to "skip" */
/*****************************************************************************/

			   printf("Viewing: %-13s (%dk)", outfname, ksize);
#endif
				codesize = 0;
				printcount = 0;
				getbuf = 0;
	 			getlen = 0;

				if ((outfile = Openfile(outfname)) != 0) {

					if (comp_type[3] == '0')
						Copy(); /* if file is
							 * uncompressed */
					else if (comp_type[3] == '1')
						Decode();	/* if file is compressed */
					if (outfile != stdout)	/* don't close stdout ! */
						fclose(outfile);
				} else
					fseek(infile, archdr.comp_size, 1);
			} else {

/*****************************************************************************/
/*                                Here is skip                               */
skip:			printf("Skipping:   %-13s (%dk)\n", outfname, ksize);
/*                     We got here from line # 945                           */
/*****************************************************************************/

				fseek(infile, archdr.comp_size, 1);
			}
		}
	}

	close(infile);

	if (argc == 2) {
		rat_tot = (1000 * comp_tot) / orig_tot;
		printf("--------------  --------  --------  ------\n");
		printf("  %4d files    %8ld  %8ld  %3d.%1d%%\n", num_files, orig_tot, comp_tot, rat_tot / 10, rat_tot % 10);
	} else
		printf("\nEnd of archive.\n");
	return EXIT_OK;
        
/*****************************************************************************/
/*                              Here is enterr                               */
/*                     We got here from lines #891-895                       */
enterr: printf("Error: EXE, COM, OBJ, *.*, ?, and * are illegal file extents when viewing!");
               printf("\n");
               goto skip;                                     
/*                            skip is at line #921                           */
/*****************************************************************************/
}
