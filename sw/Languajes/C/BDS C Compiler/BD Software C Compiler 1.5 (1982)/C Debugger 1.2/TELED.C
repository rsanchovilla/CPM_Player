/*
	TELEDIT.C	v1.3		(see TELEDIT.DOC)

	Modified for BDS C v1.50 by Leor Zolman, 10/82, 2/83

	A telecommunications program using Ward Christensen's
	"MODEM" File Transfer Protocol.

 	Modified by Nigel Harrison and Leor Zolman from XMODEM.C,
	which was written by:  Jack M. Wierda,
               modified by Roderick W. Hart and William D. Earnest

	Note that the Modem port interfaces are defined in BDSCIO.H,
	which must be configured with the correct values for your system.

	TELED now knows distinguishes between several different modes of
	operation: "terminal" mode (full duplex), "host" mode, and 
	"half-duplex" mode, as follows (designed by Stephen Stuvner):
	----------------------------------------------------------------
	TERMINAL MODE:		keyboard(char) ---> MoDem

				MoDem(char)    ---> CRT
	----------------------------------------------------------------
	ECHO (HOST) MODE:	keyboard(char) ---> MoDem
						`---> CRT
			If (char == CR).... LF ---> MoDem
						`---> CRT

				MoDem(char)    ---> CRT
						`---> MoDem
			If (char == CR).... LF ---> CRT
						`---> MoDem
	----------------------------------------------------------------
	1/2 DUPLEX MODE:	keyboard(char) ---> MoDem
						`---> CRT
			If (char == CR).... LF ---> CRT

				MoDem(char)    ---> CRT
	----------------------------------------------------------------
*/

#include <bdscio.h>
#include <hardware.h>

/*
	The following three defines must be customized by the user:
*/
#define HC	"\33H*"			/* Home cursor and print a "*"	*/
#define	SPECIAL	'^'-0x40		/* Gets out of terminal mode	*/
#define	CPUCLK 4			/* CPU clock rate, in MHz 	*/
#define BELL 7				/* ASCII bell 			*/

/*
	The rest of the defines need not be modified
*/

#define	SOH 1
#define	EOT 4
#define	ACK 6
#define	ERRORMAX 10
#define	RETRYMAX 10
#define	LF 10
#define	CR 13
#define	SPS 1500           		/*loops per second */
#define	NAK 21
#define	TIMEOUT -1
#define	TBFSIZ NSECTS*SECSIZ
#define	ML 1000				/* maximum source lines */
#define SEARCH_FIRST	17		/* BDOS calls */
#define SEARCH_NEXT	18

char linebuf[MAXLINE];			/* string buffer */
char fnambuf[50];			/* name of file for text collection */
int nlines, nl;				/* number of lines	*/
int linect;				/* current line	*/
char fflg;				/* text collection file flag */
char halfdup;				/* half-duplex mode	*/
char hostflg;				/* true in host mode	*/
char sflg;				/* transmit flag	*/


int kbhit()	/* test for console character available: */
{
	return bios(2);
}

int getch()	/* get char from console raw, no echo */
{
	while (!kbhit());
	return bios(3) & 0x7f;
}

int getchar()	/* get console char with echo, expand CR to CRLF locally: */
{
	char c;

	putchar(c = getch());
	if (c == '\r')
		putchar('\n');	
	return c;
}

putchar(c)	/* write char to console, expand LF to CRLF: */
{
	if (c == '\n') putchar('\r'); 
	bios(4,c);
}

send(data)	/* send char to modem */
char data;
{
	while(!MOD_TBE)
		;
	MOD_TDATA(data);
}

main(argc,argv)
char **argv;
{
	int i, j, k, l;			/* scratch integers */
	char *lineptr[ML];		/* allow ML source lines */
	char *inl[ML];			/* inserted line pointers */
	char *p;			/* scratch pointer */
	char buf[BUFSIZ];		/* i/o buffer	*/
	int  in;			/* collect characters at in */
	char *alloc();			/* storage allocator */
	char *getm();			/* memory procuror */
	int baudrate;

	_allocp = NULL;			/* initialize alligator */

	linect = nlines = i = 0;
	fflg = hostflg = halfdup = FALSE;
	lineptr[i] = NULL;

	baudrate = 0;			/* unknown baud rate */

   while(1)
   {
	puts(CLEARS);
	printf("Teledit ver 1.3 \n\n");

	printf("T: Terminal mode - no text collection\n");
	printf("X: terminal mode with teXt collection\n");
	printf("       In terminal mode:\n");
	printf("   	SPECIAL (control-^): return to menu\n");
	printf("   	control-E: enter editor\n");
	printf("H: toggle Host mode (for user-user typing) (currently: %s)\n",
					hostflg ? "ENABLED" : "disabled");
	printf("G: toGgle half-duplex system mode (currently: %s duplex)\n",
					halfdup ? "HALF" : "full");
	printf("E: Edit collected text\n");
	printf("F: Flush text buffer to text collection file\n");
	printf("C: flush and Close text collection file\n");
	printf("U: select cp/m User area\n");
	printf("V: select cp/m driVe\n");
	printf("D: print Directory for current drive and user area\n");
	printf("S: Send a file, MODEM protocol\n");
	printf("R: Receive a file, MODEM protocol\n");   
	printf("B: select Baud rate (currently ");
		if (baudrate)
			printf("running at %d baud",baudrate);
		else
			printf("unchanged from last usage");
		puts(")\n");

	printf("Q: quit\n");
	printf("SPECIAL: send SPECIAL char to modem\n");
	printf("\nCommand: ");

	in = toupper(getchar());
	putchar('\n');

     switch(in)
     {
	case 'U':
		printf("Switch to user area: ");
		bdos(32,atoi(gets(linebuf)));
		break;

	case 'V':
		printf("Switch to drive: ");
		bdos(14,toupper(getchar()) - 'A');
		break;

	case 'D':
		dodir();
		goto wait;

	case SPECIAL:
		send(SPECIAL);
		break;

	case 'T':
	   terminal();
	   break;

	case 'X':
     if (fflg)
	printf("Text collection already in effect (filename '%s')\n", fnambuf);
     else
     {
	puts("Collection text filename = ");
	getname(fnambuf);

	puts("Wait...");
	if (fopen(fnambuf,buf) == ERROR)	/* if it already exists, */
		goto newfile;			/* go create it 	 */
	else					/* else query further	 */
	{
		printf("\nFile already exists; do you want to ");
		if(ask("overwrite it"))
		{
	 newfile:  if (fcreat(fnambuf, buf) == ERROR)   /* Make new version */
		   {
			printf("\nCan't create %s", fnambuf);
			goto wait;
		   }
		}
		else if (ask("Do you want to append to it")) /* append to it */
		{
		   if (fappend(fnambuf,buf) == ERROR)
		   {
			printf("\nCan't append for some reason\n");
			goto wait;
		   }
		}
		else
		{
			printf("File operations aborted.\n");
			goto wait;
		}
	}
	
	fflg = TRUE;
     }
	printf("\nReady\n");

	while(1)
	{	if(MOD_RDA)
		{	putchar (in = MOD_RDATA & 0x7F);
			if (hostflg)
			{
				send(in);
				if (in == '\r')
				{
					send('\n');
					putchar('\n');
				}
			}

			if(in >= ' ')
				linebuf[i++] = in;
			else
			{	if(in == '\n') continue;
				if(in == CR)
				{	linebuf[i++] = '\n';
					linebuf[i] = NULL;
					p = getm(linebuf);
					if(p == NULL) continue;
					lineptr[nlines++] = p;
					lineptr[nlines] = NULL;
					if(nlines > 500) putchar(BELL);
					i = 0;
				}
				else if(in == '\t' || in == '\f')
					linebuf[i++] = in;
				else
					continue;
			}
		}
		if(kbhit())
		{
			in = getch();
			if(in == SPECIAL)
				break;
			else if (in == ('E' & 037))
			{
				ed(lineptr);
				printf("Terminal mode:\n\n");
			}
			else
				send(in);
			if (hostflg || halfdup)
			{
				putchar(in);
				if (in == '\r')
				{
					putchar('\n');
					if (hostflg)
						send('\n');
				}
			}	
		}
	}
	break;

     case 'S':
     case 'R':
	printf("File to %s = ", (in == 'S') ? "send" : "receive");
	getname(linebuf);

	if(in == 'R')
		readfile(linebuf);
	else
	{
		if(fopen(linebuf, buf) == ERROR)
		{	printf("Can't open %s\n", linebuf);
			goto wait;
		}
		sendfile(linebuf);
	}
	putchar(BELL);			/* beep when done */
	goto wait;

     case 'E':
	ed(lineptr);
	break;

     case 'D':
	dump(lineptr, buf);
	goto wait;

     case 'G':
	if (halfdup = !halfdup)
	{
		puts("Going into half duplex mode\n");
		if (hostflg) {
			puts("(HOST mode is being automatically disabled)\n");
			hostflg = FALSE;
		}
		goto wait;
	}
	goto Hterm;

     case 'H':
	if (hostflg = !hostflg)
	{
		puts("Going into HOST (user-user communication) mode\n");
		if (halfdup)
		{
		  puts("(HALF DUPLEX mode is being automatically disabled)\n");
			halfdup = FALSE;
		}
		goto wait;
	}

	Hterm:	puts("Going back to normal terminal mode\n");
		goto wait;

     case 'B':	/**** This section is left for the user to configure ****
		* 1) ask the user what baudrate to switch to,		*
		* 2) make the "baudrate" variable equal the new rate    *
		* 3) actually set the baudrate in whichever way is	*
		*    appropriate to your hardware.			*
		* Note that the "baudrate" variable comes up equal to	*
		* 0 to indicate that no explicit baud rate has been	*
		* selected by the user (i.e., the baudrate is in what-	*
		* ever state it was in before TELED was invoked)	*
		*********************************************************/

	puts("Baudrate selection is left for the user to configure.\n");
	goto wait;

     case 'Q':
	if (fflg)
	{
		printf("\nSave file \"%s\" to ",fnambuf);
		if (ask("disk"))
		{	dump(lineptr, buf);
			putc(CPMEOF, buf);
			fclose(buf);
		}
	}
	exit(0);

     case 'C':
	if (fflg)
	{
		printf("Closing %s...",fnambuf);
		dump(lineptr, buf);
		putc(CPMEOF, buf);
		fclose(buf);
		fflg = FALSE;
	}
	else puts("No currently active text collection file\n");

 wait: 	puts("\n\nHit any key to return to menu: ");
	getchar();
     }
   }
}

dodir()
{
	char dmapos;		/* value returned by search calls */
	char first_time;	/* used in search routine */
	char tmpfn[20];		/* temp filename buffer */
	char fcb[36];
	int colno;		/* column count */
	int i;

	char name[15];
	int drive;
		
	bdos(26,BASE+0x80);	/* ensure default DMA after read/write */
	printf("\nFiles = ");
	if (getline(name,15) < 2)
		setfcb(fcb,"*.*");
	else 
		setfcb(fcb,name);

	drive= (fcb[0]==0 ? bdos(25) : fcb[0]-1 ) ;

	puts(CLEARS);
	printf("Directory for Drive %c, user area %d:\n\n",
			drive+'A', bdos(32,0xff));

	colno = 1;
	first_time = TRUE;
	while (1) {
		dmapos = bdos(first_time ? SEARCH_FIRST : SEARCH_NEXT,fcb);
		if (dmapos == 255) break;
		first_time = FALSE;
		hackname(tmpfn,(BASE + 0x80 + dmapos * 32));
		puts(tmpfn);
		for (i = strlen(tmpfn); i < 15; i++) putchar(' ');
		if ((colno += 15) > 65)
		{
			putchar('\n');
			colno =1;
		}
	}
}


hackname(dest,source)
char *dest, *source;
{
	int i,j;

	j = 0;

	for (i = 1; i < 9; i++)
	{
		if (source[i] == ' ') break;
		dest[j++] = source[i];
	}
	if (source[9] != ' ')
		dest[j++] = '.';

	for (i = 9; i < 12; i++)
	{
		if (source[i] == ' ') break;
		dest[j++] = source[i];
	}
	dest[j] = '\0';
	return dest;
}

dump(lineptr, buf)	/* dump text buffer	*/
char **lineptr, *buf;
{
	int i;

	for(i = 0; lineptr[i] != NULL; i++)
		if(fputs(lineptr[i], buf) == ERROR)
			printf("\n\7Error writing txt, disk full?\n");

	lineptr[0] = linect = nlines = _allocp = 0;
}

ed(lineptr)	/* editor */
char **lineptr;
{
	char in, *inl[ML], *p, buf[BUFSIZ];
	int i, j, k, l;
	char *getm(), *alloc();

	if(!fflg)
	{	printf("\n\7No text buffer to edit.\n");
		return;
	}

	printf("\nedit\n*");
	nl = 22;

	while (in = getchar())
	   switch (tolower(in)) {
		case 'a':
			puts("Filename to yank = ");
			if(fopen(getname(linebuf), buf) == ERROR) {
				printf ("\r  Cannot open %s.\r*", linebuf);
				continue;
			}

			for(i = 0; fgets(linebuf, buf); i++) {
				inl[i] = getm(linebuf);
				if(inl[i] == NULL) break;
			}

			inl[i] = NULL;
			iblock(lineptr, inl, linect);
			show (lineptr, linect, nl);
			continue;
		case 'b':
			linect = 0;
			show (lineptr, linect, nl);
			continue;
		case 'q':
			printf(CLEARS);
			return;
		case 'f':
			gets(linebuf);
			if((i = find(lineptr, linect)) >= 0) {
				linect = i;
				show (lineptr, linect, nl);
			}
			else if((i = find(lineptr, 0)) >= 0) {
				linect = i;
				show (lineptr, linect, nl);
			}
			else
			{
				printf(HC);
				printf("  not found\r*");
			}
			continue;
		case 'i':
			j = min(linect, 5);
			if(j == 0)
				printf(CLEARS);
			else {
				show(lineptr, (linect - j), j);
				j++;
				printf("\b ");
				for(; j; j--)
					putchar('\n');
			}
			while(1) {
				gets(linebuf);
				for(i = 0; linebuf[i]; i++)  
					if(linebuf[i] == CPMEOF)  
						break;
				if(linebuf[i] == CPMEOF) break;
				linebuf[i++] = '\n';
				linebuf[i] = NULL;
				inl[j++] = getm(linebuf);
			}
			inl[j] = NULL;
			iblock(lineptr, inl, linect);
			show (lineptr, linect, nl);
			continue;
		case 'k':
			putchar('\n');
			show1(lineptr, linect);
			kill(lineptr, linect, 1);
			continue;
		case 'l':
			gets(linebuf);
			if((i = lfind(lineptr, linect)) >= 0) {
				linect = i;
				show(lineptr, linect, nl);
			}
			else if((i = lfind(lineptr, 0)) >= 0) {
				linect = i;
				show(lineptr, linect, nl);
			}
			else {
				printf(HC);
				printf("  not found\r*");
			}
			continue;
		case 'o':
			putchar('\n');
			i = linect;
			while(gets(linebuf)) {
				for(j = 0; linebuf[j]; j++)
					if(linebuf[j] == CPMEOF) break;
				if(linebuf[j] == CPMEOF) break;
				linebuf[j++] = '\n';
				linebuf[j] = NULL;
				if(lineptr[i])
					free(lineptr[i]);
				lineptr[i++] = getm(linebuf);
				if(i > nlines) lineptr[++nlines] = NULL;
			}
			show (lineptr, linect, nl);
			continue;
		case 'p':
			linect = min((linect + nl), nlines);
			show (lineptr, linect, nl);
			continue;
		case 's':
			gets(linebuf);
			nl = max((atoi(linebuf)), 1);
			show (lineptr, linect, nl);
			continue;
		case 'z':
			linect = nlines;
			show(lineptr, linect, nl);
			continue;
		case '1': case '2': case '3': case '4': case '5':
		case '6': case '7': case '8': case '9': case '-':
			linebuf[0] = in;
			for (i = 1; (isdigit(in = getchar())); i++)
				linebuf[i] = in;
			linebuf[i] = NULL;
			i = atoi(linebuf);
			if (i < 0)
				j = max((linect + i), 0);
			else
				j = min((linect + i), nlines);
			in = tolower(in);
			if(j > linect && in == 'k')
				kill(lineptr, linect, (j - linect));
			else
				linect = j;
			if (in == 'p') linect = max((linect-nl), 0);
			show (lineptr, linect, nl);
			continue;
		case '#':
			printf (" of lines: %d\r*", nlines);
			continue;
		case '\n':
			if (lineptr[linect] != NULL) {
				show1(lineptr, linect);
				linect++;
			}
			else
				printf (HC);
			continue;
		case ' ':
			if(linect)
				linect--;
			show(lineptr, linect, nl);
			continue;
		case ('E'&037):
			send(in);
			printf("\n^E sent\n");
			return;
		default:
			printf(" ?\r*");
		}
}

shocrt(sec,try,tot)
int sec,try,tot;
{
	if(sflg)
		printf("Sending #%d (Try=%d Errs=%d)  \r", sec, try, tot);
	else
		printf("Awaiting #%d (Try=%d, Errs=%d)  \r", sec, try, tot);

	if(try && tot) putchar('\n');
}

receive(seconds)
int seconds;
{ char data;
    int lpc,seccnt;
    for (lpc = 0; lpc < CPUCLK; lpc++)
        { seccnt = seconds * SPS;
          while (!MOD_RDA && seccnt--);
          if(seccnt >= 0)
              { data = MOD_RDATA;   
                return(data);
              }
        }
    return(TIMEOUT);
}

char *getname(linbuf)		/* get a reasonable filename from user */
char *linbuf;
{
	int i;
	char c;

	while (1)
	{
		gets(linbuf);
		if (!*linbuf)		/* reject null filename */
			goto reject;
		for (i = 0; c = linbuf[i]; i++)
		{
			if (c < ' ' || c > 0x7F)
				goto reject;
		}
		break;
    reject:	puts("\nFilename = ");
		continue;
	}
	return linbuf;
}

	
purgeline()
{ while (MOD_RDA)
      MOD_RDATA;	/* purge the receive register	*/
}

readfile(file)
char *file;
{ int j, firstchar, sectnum, sectcurr, sectcomp, errors;
  int toterr,checksum;
  int errorflag, fd;
  int bufctr;
  char buffer[BUFSIZ];

  sflg = FALSE;
  fd = creat(file);

  if(fd == -1)
  {	printf("Teledit: cannot create %s\n", file);
	return;
  }

  printf("\nReady to receive %s\n", file);
  sectnum = 0;
  errors = 0;
  toterr = 0;
  bufctr = 0;
  purgeline();
  shocrt(0,0,0);
  do
      { errorflag = FALSE;
        do
            firstchar = receive (10);
        while(firstchar != SOH && firstchar != EOT && firstchar != TIMEOUT);

        if(firstchar == TIMEOUT)
            errorflag = TRUE;
        if(firstchar == SOH)
            { sectcurr = receive (1);
              sectcomp = receive (1);
              if((sectcurr + sectcomp) == 255)
                  { if(sectcurr == ((sectnum + 1) & 0xFF))
                        { checksum = 0;
                          for(j = bufctr;j < (bufctr + SECSIZ);j++)
                              { buffer[j] = receive (1);
                                checksum = (checksum + buffer[j]) & 0xff;
                              }
                          if(checksum == receive (1))
                              { errors = 0;
                                sectnum = sectcurr;
                                bufctr = bufctr + SECSIZ;
                                if(bufctr == TBFSIZ)
                                    { bufctr = 0;
				      write(fd, buffer, NSECTS);
                                    }
                                shocrt(sectnum,errors,toterr);
				send(ACK);
                              }
                          else
                              errorflag = TRUE;
                        }
                    else
                        if(sectcurr == sectnum)
                            { do;
                              while(receive (1) != TIMEOUT) 
					;
			      send(ACK);
                            }
                        else
                            errorflag = TRUE;
                  }
              else
                  errorflag = TRUE;
            }
        if(errorflag == TRUE)
            { errors++;
              if(sectnum)
                  toterr++;
              while(receive (1) != TIMEOUT);
              shocrt(sectnum,errors,toterr);
	      send(NAK);
            }
      }
  while(firstchar != EOT && errors != ERRORMAX);

  if((firstchar == EOT) && (errors < ERRORMAX))
      { send(ACK);
	bufctr = (bufctr + SECSIZ - 1) / SECSIZ; 
	write(fd, buffer, bufctr);
        close(fd);
	printf("\nDone -- returning to menu:\n");
      }
  else
	printf("\n\7Aborting\n\n");
}

sendfile(file)
char *file;
{ char *npnt;
  int j, sectnum, sectors, attempts;
  int toterr,checksum;
  int bufctr, fd;
  char buffer[BUFSIZ];

  sflg = TRUE;
  fd = open(file,0);

  if(fd == -1)
      { printf("\nTeledit: %s not found\n", file);
	return;
      }
  else
	printf("\nFile is %d sectors long.\n",cfsize(fd));

  purgeline();
  attempts=0;
  toterr = 0;
  shocrt(0,0,0);

  while((receive (10) != NAK) && (attempts != 8))
      { attempts++;
        shocrt(0,attempts,0);
      }
  if (attempts == 8)
      { printf("\nTimed out awaiting initial NAK\n");
	return;
      }
  attempts = 0;
  sectnum = 1;

  while((sectors = read(fd, buffer, NSECTS)) && (attempts != RETRYMAX))
      { if(sectors == -1)
            { printf("\nFile read error.\n");
              break;
            }
        else
            { bufctr = 0;
              do
                  { attempts = 0;
                    do
                        { shocrt(sectnum,attempts,toterr);
			  send(SOH);
			  send(sectnum);
			  send(-sectnum-1);
                          checksum = 0;
                          for(j = bufctr;j < (bufctr + SECSIZ);j++)
			      { send(buffer[j]);
                                checksum = (checksum + buffer[j]) & 0xff;
                              }
			  send(checksum);
                          purgeline();
                          attempts++;
                          toterr++;
                        }
                    while((receive (10) != ACK) && (attempts != RETRYMAX));
                    bufctr = bufctr + SECSIZ;
                    sectnum++;
                    sectors--;
                    toterr--;
                  }
              while((sectors != 0) && (attempts != RETRYMAX));
            }
      }
        if(attempts == RETRYMAX)
            printf("\nNo ACK on sector, aborting\n");
        else
            { attempts = 0;
              do
		  { send(EOT);
                    purgeline();
                    attempts++;
                  }
              while((receive (10) != ACK) && (attempts != RETRYMAX));
              if(attempts == RETRYMAX)
                  printf("\nNo ACK on EOT, aborting\n");
            } 
  close(fd);
  printf("\nDone -- Returning to menu:\n");
}

ask(s)
char *s;
{

	char c;

again:	printf("%s (y/n)? ", s);
	c = tolower(getchar());
	if(c == 'y') {
		puts("es\n");
		return 1;
	}

	else if(c == 'n')
		puts("o\n");
	else
	{
		printf("  \7Yes or no, please...\n");
		goto again;
	}
	return 0;
}

find(lineptr, linect)	/*Find a line having the pattern in linebuf        */
char *lineptr[];
int linect;
{
	int i;

	for(i = linect; lineptr[i] != NULL; i++)
		if(pat(lineptr[i], linebuf) >= 0)
			return(i);
	return(-1);
}

kill(lineptr, linect, nl)	/* erase lines */
char *lineptr[];
int linect, nl;
{
	int i, j;

	for (i = linect; lineptr[i] != NULL && nl > 0; i++, nl--) {
		free(lineptr[i]);
		nlines--;
	}
	lineptr[linect] = NULL;
	if(lineptr[i] != NULL) {
		j = (nlines - linect) * 2;
		movmem(&lineptr[i], &lineptr[linect], j + 2); 
	}
}

lfind(lineptr, linect) 		/* find pattern at beginning of a line */
char *lineptr[];
int linect;
{
	int i, j;
	char line[MAXLINE];

	j = strlen(linebuf);
	for (i = linect; lineptr[i] != NULL; i++) {
		strcpy(line, lineptr[i]);
		line[j] = NULL;
		if(strcmp(line, linebuf) == 0)
			return i;
	}
	return -1;
}
	

pat(s, t)	/* pattern match..*/
char s[], t[];
{
	int i, j, k;

	for(i = 0; s[i] != '\0'; i++)
	   {
		for(j = i, k=0; t[k] != '\0' && s[j] == t[k]; j++, k++)
			;
		if(t[k] == '\0')
			return(i);
	   }
	return(-1);
}

show (lineptr, linect, nl)	/* screen current frame */
char *lineptr[];
int linect, nl;
{
	int i;

	printf (CLEARS);
	putchar('\n');

	for (i = linect; i < (linect+nl) && lineptr[i] != NULL; i++)
		printf("%s", lineptr[i]);
	printf (HC);
	return(i);
}

show1(lineptr, linect)
char **lineptr;
int linect;
{
	int i;

	for(i = 0; i < nl; i++)
		putchar('\n');

	if((linect + nl) >= nlines)
		putchar('\n');
	else
		printf("%s", lineptr[linect+nl]);

	printf(HC);

	for(i = 0; i < 78; i++)
		putchar(' ');

	printf("\r*");
}

terminal()	/* terminal mode, no text */
{
	int in;

	while(1)
	{
		if(MOD_RDA)
		{
			putchar(in = MOD_RDATA);
			if (hostflg)
			{
				send(in);
				if (in == '\r')
				{
					send('\n');
					putchar('\n');
				}
			}
		}			
			
		if(kbhit())
		{
			in = getch();
			if (in == SPECIAL)
				return;
			else
				send(in);

			if (hostflg || halfdup)
			{
				putchar(in);
				if (in == '\r')
				{
					putchar('\n');
					if (hostflg)
						send('\n');
				}
			}
		}
	}
}

char *getm(line)	/* get memory for line, store it, return pointer */
char line[];
{
	char *p, *alloc();

	if ((p = alloc(strlen(line) + 1)) != NULL)
		strcpy(p, line);
	return(p);
}

iblock(rb, ib, cl)		/* insert block ib into rb at cl */
char *rb[], *ib[];
int cl;
{
	int i, j;

	j = 0;
	if (rb[cl]) {
		for (i = 0; ib[i]; i++)
			;
		j = (nlines - cl) * 2;
		movmem (&rb[cl], &rb[cl+i], j + 2);
	}
	for (i = 0; ib[i]; i++, cl++)
		rb[cl] = ib[i];
	if(!j) rb[cl] = NULL;
	nlines += i;
	return cl;	/* return new current line */
}
