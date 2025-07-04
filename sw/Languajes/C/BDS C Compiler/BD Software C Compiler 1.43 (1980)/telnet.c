

#define TITLE "BDS Telnet version 2.3		(July 1980)"

/*

	Written by Leor Zolman and Leo Kenen
	December 1979, March 1980, May 1980, July 1980

	This version has been modified to obtain all hardware-
	dependent information from bdscio.h, which must	contain
	the correct hardware specifications for your modem port.
	It is also no longer necessary to alter #define statements
	in this file to reflect CP/M system size; the "topofmem()"
	function is now used to determine the amount of memory 
	available for the text collection buffer.

	If you intend to use this program for high speed
	(i.e, greater than 300 baud) data transfers, such as
	maybe over RS232 lines between two machines directly,
	then the speed of transfer will be limited by the
	processors involved instead of the baud rate;
	UNDER SUCH CIRCUMSTANCES, A TRANSFER WILL ONLY WORK IF
	THESE TWO CONDITIONS ARE MET:

		1) The transfer must always performd in BINARY
		   mode, never in TEXT mode, and
		2) The receiving processor must be as fast or
		   FASTER than the transmitting processor. That
		   is, a 2 MHz machine may transmit to a 4 MHz
		   machine at, say, 9600 baud, BUT NOT VICE-
		   VERSA.

	See the write up by Leo for more details than are
	presented here.

	******************************************
	* Telnet assumes that your CP/M console  *
	* I/O device is much faster than your	 *
	* modem. On a 2MHz 8080, the modem can	 *
	* be receiving at up to 300 baud as long *
	* as your console whips along (at the	 *
	* very least) at about 1200. 4 MHz mach- *
	* ines might be able to get away with	 *
	* slower terminals, but not much slower. *
	******************************************

"Telnet" is a program which interacts with a modem to turn
 your microcomputer into a very versatile terminal. Special
 commands are entered to the program by typing the character
 you designate as "SPECIAL", i.e, some character (such as the
 null or ^A ) which you wouldn't be likely to need transmitted,
 and then entering the appropriate command letter. Incoming
 data may be buffered up in RAM memory and dumped to disk
 whenever you desire (via the "o", "d", "c" and "k" commands),
 data may be transmitted from disk to modem (via "t" and "a"),
 or files can be formally transferred in an alternate
 "checksum" mode which handles handshaking and buffering
 automatically when interacting with the same program on
 the other end of the line. During file transfers, you
 may temporarily pause and later resume the transmission
 (via the "p" and "r" commands.) There are also various
 options you can control (see "n", "7", "h" and "l") to
 adapt operation toward the type of file you wish to
 transfer. The "q" command closes the output file (if open)
 and quits to CP/M. The "s" command displays the status of
 the program. "z" clears the console screen. Any other
 command letter (such as, for example, "?") causes a list
 of legal commands to be displayed.

In order to transmit or receive files in the checksum
mode, both parties must make sure that their modems are
operating in FULL-DUPLEX. When you are in full duplex,
then what you type will NOT come right back at you from the
modem; the only input you see from the modem is the data
transmitted by the machine on the OTHER end of the line.

This program considers "half duplex" to be any situation
in which the data you transmit comes right back at you;
whether it is your modem that is performing the ehoing
or a computer system far away doesn't really matter. In any
case, checksumming and handshaking is not allowed under half-
duplex operation, since erroneous characters would be received.
When you run telnet, it will ask you whether
or not you are in half-duplex, and perform accordingly. If
you switch from half to full or vice-versa while running the
program, use the "h" option to inform telnet of the fact.

To perform checksummed file transfer, a connection must
first be established between the two parties. If both
parties are operating in full duplex, one originating and the
other answering, then telnet will both display what each
types to the console and send it to the modem. If a file
then needs to be transferred, then one user would give the
"t" command (to transmit) and the other would give the "o"
command (to open an output file.) If both users indicate
checksum mode (rather than only one specifing checksum mode
which will abort almost immediatly), then telnet will take
it from there and perform the transfer. If the sender
(transmitter) wants to suspend the transfer temporarily and
continue later, he can use the "p" command. When the receiver
sees that transmission has been suspended (when no data has
been sent for a long time), then HE gives the "p" command also,
and both users may type to each other. When ready to resume,
the "r" command must be given by the RECEIVER first, and
then the sender, to prevent data from being lost.

*/

#include "bdscio.h"	/* System, h'ware constants	*/

#define SPECIAL 0x1B	/*  The character you type to
			   signal a Telnet command
			   (should be obscure...I use
			    a ESC                       */


/*
	The following #defines need not be changed:
*/

#define	ACK	0x11	/* Ascii XON for handshaking	*/
#define	NAK	0x13    /* Ascii XOFF for handshaking   */
#define	EOT	0x04	/* End of transmission		*/
#define	ETX	0x03	/* Abort Transmission		*/


/*
	External variable declarations:
*/

char rflag;		/* receiving file open flag	*/
char tflag;		/* transmitting file open flag	*/
char chflag;		/* checksumming enabled flag	*/
char cflag;		/* text-collection enabled flag */
char pflag;		/* pausing flag 		*/
char spflag;		/* stripping parity bit flag	*/
char lflag;		/* list device enabled flag	*/
char nflag;		/* recognizing nulls flag	*/
char fflag;		/* true if changing CR-LF's into
			    just CR when transmitting	*/
char lastc;		/* last char xmitted		*/
char dodflag;		/* true if displaying outging
			   data				*/
char didflag;		/* true if displaying incoming
			   data				*/
char hdflag;		/* true if effectively working
			   in half-duplex		*/
char abortf;		/* true when file I/O aborted	*/
char rbuf[BUFSIZ]; 	/* file I/O buffer for incoming
			   data file			*/
char tbuf[SECSIZ]; 	/* sector buffer for file being
			   transmitted			*/
char rname[20]; 	/* name of receiving file	*/
char tname[20]; 	/* name of transmitting file	*/
int rfd, tfd;		/* file descriptors		*/

char *cptr;		/* pointer to free space in buf */
unsigned free;		/* number of bytes free in buf	*/
int bcount;		/* counts bytes in current block
			   when checksumming		*/
int scount;		/* Number of sectors
				 sent/received		*/
int checksum;		/* the checksum value itself	*/
char timoutf;		/* true if time-out happens
			   while waiting for modem data	*/
char *i;		/* odd-job char pointer 	*/

int dod_sav, did_sav;	/* scratch variables		*/

unsigned bufspace;	/* # of bytes available for text
			   collection buffer in ram	*/

char *buf;		/* text collection pointer; will
			   point to the location just
			   after itself			*/

char toupper();		/* This makes for better code
			   than if we let it default
			   to "int"			*/

/*
	Routine to return true if input is present on
	the modem:
*/

miready()
{
	return (inp(MSTAT) & MIMASK) == (MAHI ? MIMASK : 0);
}


/*
	Routine to return true if modem is ready to output
	a byte:
*/

moready()
{
	return (inp(MSTAT) & MOMASK) == (MAHI ? MOMASK : 0);
}


main()
{
	char c, c2;
	int n;

	init();

  loop:	if (abortf) {
		if (rflag) rclose();
		if (tflag) tabort();
		abortf = 0;
	}

	if (tflag && xmit()) {
			printf("\nTransmission complete.\n");
			close(tfd);
			reset();
		    }
	if (abortf) goto loop;
	if (miready()) {
	  c = c2 = getmod();
	  if (spflag) c &= 0x7f;
	  if (tflag && (c == ETX)) {
		printf("Reciever has aborted;\n");
		abortf = 1;
		goto loop;
		}
	  if (didflag && (c || nflag) && (c != CPMEOF))
			display(c);
	  if (cflag && !pflag) {
	    if (c || nflag)
	      if (!free) printf("**BUFFER FULL**\007\007");
	      else { *cptr++ = c; free--; }
	    if (chflag) {
		checksum += c2;
		bcount++;
		if (bcount == SECSIZ) {
		  bcount = 0;
		  outmod(checksum >> 8);
		  outmod(checksum);
		  checksum = 0;
		  c = getmod();
		  if (c == EOT) {
			rdump(0); rclose();
			printf("\n%s recieved OK\n",rname);
		   }
		  else if (c == ACK) {
			if (cptr > buf+1000) rdump(0);
			if (!didflag) printf("Good sector <%d>\n",++scount);
			outmod(0xFD);
		   }
		  else  {
		    cptr -= SECSIZ;
		    free += SECSIZ;
		    printf("\nChecksum error. Retrying <%d>\n",scount+1);
		    outmod(0xFD);
		    timoutf = 0;
		  }

		}
	      }
	  }
	}

	if (kbready()) {
	  c = getch();
	  if (c != SPECIAL) {
	    if (pflag || (!tflag && !(rflag && chflag))) {
		outmod(c);
		if (dodflag) display(c);
	      }
	   }
	  else special();
	 }
	goto loop;
}


/*
	Handle special Telnet command:
*/

special()
{
	    char c;
	    int n;

	    printf("\nSpecial: ");
	    if ( (c = getchar()) != '\n') printf("  ");
	    switch (toupper(c)) {
		case '\n':  return;
		case SPECIAL: outmod(SPECIAL);
			      printf("Special char sent\n");
			      break;

		case '7':  spflag = ask("Strip parity");
			   break;

		case 'N':  nflag = ask("Recognize incoming nulls");
			   break;

		case 'F':  fflag = ask("Transmit CR-LF pairs as CR only");
			   break;

		case 'H':  if (rflag || tflag)  { printf(
			    "Must abort transfer first\n");
			    break;
			    }
			   printf("\nAre you either at half");
			   printf("-duplex or getting an ");
			   hdflag = ask ("echo");
			   reset();
			   break;

		case 'L':  lflag = ask("List incoming data");
			   break;

		case 'Z':  printf(CLEARS);
			   break;

		case 'P':  if (pflag) printf("Already pausing");
			   else if (!(tflag || rflag))
				  printf("Not transmitting or receiving");
			   else {
				pflag = 1;
				dod_sav = dodflag;
				did_sav = didflag;
				dodflag = !hdflag;
				didflag = 1;
				printf("Ok, pausing from %s", tflag ?
				        "transmission" : "collection");
			   }
			   goto lf;

		case 'R':  if (!pflag) printf("Not pausing");
			   else {
				pflag = 0;
				dodflag = dod_sav;
				didflag = did_sav;
				printf("%s now enabled again.", tflag ?
				       "transmission" : "collection");
			   }
			   goto lf;

		case 'K':  printf("Text buffer !ZAPPED!");
			   free = bufspace;
			   cptr = buf;
			   goto lf;

		case 'V':  if (rflag) {
				putchar('\n');
				i = buf;
				while (i < cptr) putchar(*i++);
				printf("\n%u bytes free",free);
			    }
			   else printf("No recieving file open");
			   goto lf;

		case 'O':  if (rflag) rclose();
			   if (tflag) tabort();
			   printf("\nOutput filename? ");
			   gets(rname);
			   rflag = 1;
			   if (!askstuff()) {
				rflag = 0;
				return;
			   }
			   printf("Creating %s...",rname);
			   rfd = fcreat(rname,rbuf);
			   if (rfd == ERROR) {
				printf("Cannot create %s\n",rname);
				reset();
				break;
			    }
			   putchar('\n');
			   cptr = buf;
			   free = bufspace;
			   rflag = cflag = 1;
			   pflag = checksum = bcount = 0;
			   if (chflag) {
				printf("Trying to link...");
				do {
				  c = getmod();
				  if (abortf) {
				    printf("aborting...\n");
				    unlink(rname);
				    reset();
				    return;
				  }
				  timoutf = 0;
				} while (c & 0x7f);
				printf("linked.\n");
				outmod(0);
			    }
			   break;

		case 'D':  if (rflag) rdump(1);
			   else printf("No output file");
			   goto lf;

		case 'C':  if (rflag) rclose();
			   else printf("No output file");
			   goto lf;

		case 'Q':  if (tflag) tabort();
			   if (rflag) rclose();
			   exit();

		case 'A':  if (tflag || rflag) {
  					 if (chflag) outmod(ETX);
					 abortf = 1;
 				         break;
				     }
			   printf("No transfer to abort.\n");
			   goto lf;

		case 'T':  if (tflag) tabort();
			   if (rflag) rclose();
			   printf("\nFile to transmit? ");
			   gets(tname);
			   tflag = 1;
			   if (!askstuff()) {
				tflag = 0;
				return;
			   }
			   tfd = open(tname,0);
			   if (tfd == ERROR) {
				printf("Cannot open %s\n",tname);
				reset();
				goto lf;
			    }
			   pflag = checksum = bcount = 0;
			   if (read(tfd,tbuf,1) <=0) {
			    printf("Read error from %s\n",
					tname);
			    abortf = 1;
			    return;
			   }
			   if (chflag) {
			    printf("Trying to link...");
			    while (1) {
			     outmod(0);
			     for (n=0; n<5000; n++)
				if (miready()) {
				 if( !(getmod() & 0x7f)) {
					printf("linked.\n");
					return;
				  }
				 }
				else if (kbabort()) {
					printf("aborting.\n");
					return;
				     }
			     }
			    }
			break;

		case 'S':  dostat();
			   goto lf;

		default:   prcoms();

	  lf:	   putchar('\n');
	}
}

/*
	Print out legal Telnet commands:
*/

prcoms()
{
	printf("\nBDS Telnet commands are:\n");
	printf("Double SPECIAL: send SPECIAL\n");
	printf("o: Open output file, start collection\n");
	printf("p: Pause (suspend collection or transmission)\n");
	printf("r: Resume after pausing\n");
	printf("d: Dump (append) text buffer to output file\n");
	printf("c: Close output file (after dumping buffer)\n");
	printf("v: View contents of text buffer\n");
	printf("k: Kill (erase) contents of text buffer\n");
	printf("t: Transmit a file to modem\n");
	printf("a: Abort transfer of file\n");
	printf("n: accept or ignore Nulls\n");
	printf("7: select policy regarding Parity bits\n");
	printf("f: select whether to transmit CR-LF as just CR\n");
	printf("h: set Half/full duplex mode\n");
	printf("l: control CP/M List device\n");
	printf("z: clear console terminal screen\n");
	printf("s: display Status of Telnet\n");
	printf("q: dump & close output file (if open) and Quit to CP/M");
}



/*
	Print opening message and initialize program:
*/

init()
{
	printf(TITLE);
	timoutf = cflag = nflag = lflag = pflag = abortf = fflag = 0;
	spflag = 1;
	lastc = 0;
	buf = &buf + 1;
	bufspace = buf + 500 - topofmem();   /* compute space available */
	bufspace = -bufspace;		     /* for text collection buf */
	printf("\n\nAnswer `y' if either your modem is set to half-duplex,\n");
	printf("or you expect an echo from the system on the");
	printf(" other end\n");
	printf("of the line; else answer `n':\n");
	hdflag = ask("Do you expect an echo");
	reset();
	printf("OK; you're on line...\n\n");
}


/*
	Get all the info pertinent to a file transfer; i.e,
	whether or not the file is text (and needs parity
	stripped, nulls ignored, echoing to console, etc.),
	whether or not checksumming and handshaking are
	required (they always go together), and make sure
	the user is in full duplex mode.
*/

askstuff()
{
	printf("\n%s ",rflag ? "recieving" : "transmitting");
	if (ask("text (y) or binary data (n)  ")) {
		nflag = 0;
		spflag = didflag = 1;
		dodflag = !hdflag;
		printf("Stripping parity, ignoring nulls,\n");
		printf("  %sdisplaying %s data.\n",
		(rflag ? didflag : dodflag) ? "" : "not ",
			rflag ? "incoming" : "outgoing");
	}	
	else {
		spflag = didflag = dodflag = 0;
		nflag = 1;
		printf("%s all data verbatim, and not\n",
			rflag ? "Recieving" : "Sending");
		printf("displaying it on the console.\n");
	 }

	putchar('\n');
	printf("Handshaking & checksumming can only happen\n");
	printf("if the other computer has this same program\n");
	printf("running. Do you want handshaking & checksumming");
	chflag = ask("");
	if (chflag && hdflag) {
		printf("Can't do it unless you can eliminate");
		printf(" the echo! Aborting.\n");
		return 0;
	}
	scount = 0;
	return ask("OK...type y to begin, n to abort:");
}

/*
	Routine to print out a string and return true
	if the user responds positively
*/

int ask(s)
char *s;
{
	char c;
	while (1)
	{
		printf("%s ",s);
		printf("(y/n)? ");
		c = toupper(getchar());
		if (c == 'Y')
		{ 
			printf("es\n");	
			return 1;
		}
		else if (c == 'N')
		{
			printf("o\n");
			return 0;
		}
		else putchar('\n');
	}
}


/*
	Print out state of Telnet program:
*/

dostat()
{

	   putchar('\n');

	   if (rflag) {
		printf("Output file = %s\n",rname);
		printf("Text buffer has %u bytes free",
			free);
		printf("\nText collection: ");
		  if (cflag) if (pflag) printf("on, but pausing\n");
			     else printf("on\n");
		  else printf("off\n");
	    }
	   else printf("No output file\n");
	
	   if (tflag) {
		printf("Transmitting: %s ",
				tname);
		if (pflag) printf("(but pausing)");
		putchar('\n');
	    }
	   else printf("Not transmitting any file\n");
	
	   printf("Incoming nulls are being %s\n",
		 nflag ?"collected" : "ignored");
	
	   printf("Parity bits are being %s\n",
		 spflag ?"stripped" : "preserved");
	
	   printf("Half-duplex mode: %s",
		hdflag ? "on" : "off");
}


/*
	Routine to dump contents of the memory text buffer
	to the output file and clear the buffer for more
	data:
	(Note that the "else putchar('\0');" clause may not
	be necessary on your system; this is here only to
	make up for a strange "feature" of Lifeboat's 
	Northstar CBIOS where disk polling happens during
	console output, potentially causing bytes to be 
	missed from the modem.)
*/

rdump(n)
{
	for (i=buf; i<cptr; i++) putc(*i,rbuf);
	cptr = buf;
	free = bufspace;
	if (n) printf("\nBuffer written\n");
	else putchar('\0');
}


/*
	Routine to dump and close the output file:
*/

rclose()
{
	rdump(1);
	printf(" Closing %s ",rname);
	if (!chflag) putc(CPMEOF,rbuf);
	fflush(rbuf);
	close(rfd);
	reset();
	putchar('\n');
}

/*
	Routine to reset telnet
*/

reset()
{
	timoutf = rflag = tflag = chflag = cflag = 0;
	scount = 0;
	spflag = 1;
	dodflag = !hdflag;
	didflag = 1;
}


/*
	Get a byte from the modem:
*/

getmod()
{
	char c;
	unsigned n;
	if (timoutf) return;
	for (n=20000; !miready() && n; n--)
	   if (kbabort()) return;
	if (!n) {
	    timoutf = 1;
	    return 1;
	 }
	c = inp(MDATA);
	if (MRESET) outp(MSTAT,MRESETVAL);
	return c;
}


/*
	Output a byte to the modem:
*/


outmod(c)
char c;
{
	while (!moready())
	    if (kbabort()) return;
	outp(MDATA,c);
}

kbready()
{
	return bios(2);
}



/*
	Get a character from the keyboard:
	(Uses a direct BIOS instead of going through
	the BDOS. By naming this the same as the library
	version of "getchar", we insure that THIS version
	is used by things like "gets" instead of the library
	version.)
*/

getchar()
{
	char c;
	c = getch();
	if (c == '\r') c = '\n';
	putchar(c);
	return c;
}


getch()
{
	return bios(3);
}



/*
	Return true if keyboard hit and SPECIAL
	typed:
*/

kbabort()
{
	if (kbready() && getch() == SPECIAL) {
		abortf = 1;
		return 1;
	}
	return 0;
}


/*
	Write a character to the console.
*/

putchar(c)
char c;
{
	if (c == '\n') putch2('\r');
	putch2(c);
}

putch2(c)
char c;
{
	bios(4,c);
}


/*
	Write character to console display, and also to
	system list device if that is enabled:
*/

display(c)
char c;
{
	if (c==CPMEOF) return;
	putch2(c);
	if (lflag) bdos(5,c);
}


xmit()
{
	int incheck;
	int n;
	char c;
	if (pflag || !moready()) return 0;
	c = tbuf[bcount++];
	checksum += c;
	if ((!(spflag && (c&0x7f)==CPMEOF && !chflag)) &&
	    (!(!chflag && c=='\n' && lastc=='\r' &&
	      !nflag && fflag))) outmod(c);
	lastc = c;
	if (dodflag) display(c);
	if (bcount != SECSIZ) return 0;
	bcount = 0;
	if (!chflag) return !read1();
	incheck = (getmod() << 8) + getmod();
	if (incheck != checksum) {
		for (n=0; n<20000; n++); 	/* let line settle down */
		printf("\nError. Resending sector %d...\n",scount+1);
		outmod(NAK);
	}
	else if (read1()) {
		if (!dodflag) printf("Good sector <%d>\n",++scount);
		outmod(ACK);
	}
          else { outmod(EOT); return 1; }

	checksum = 0;
	if (getmod() != 0xFD) {
			printf("\nPhase error; aborting...");
			abortf = 1;
			}
	return 0;
}


/*
	Read a sector of the transmission file:
*/

read1()
{
	int i;
	i = read(tfd, tbuf, 1);
	if ( i == ERROR) {
		printf("\nRead error from %s; Aborting.\n",
			tname);
		tabort();
	 }
	return i;
}

tabort()
{
	if (chflag)  while (bcount++ != 133) outmod(ETX);
	printf("\nTransmission of %s aborted.\n",tname);
 	close(tfd);
	reset();
}

