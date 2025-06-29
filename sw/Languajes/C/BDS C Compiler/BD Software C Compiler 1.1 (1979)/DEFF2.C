
/*

	These are the fuctions missing from DEFF.CRL 
	Written by Roberto Sancho, Dec 2023
	calls bdos() function defined in DEFF3
        based on stdlib version 1.43
        These functions are the needed ones to compile the .C sample
        files. 
        
        Functions not rewritten (csw, outp, plot, setplot, line, clrplot)
        Don't know if the original library has more ...
  
*/

/* send char to console
   convert <LF> to <CR><LF>
*/   
putchar(c)
int c;
{
   if (c==10) conout(13);
   conout(c);
   return c;
}  

/* blocking read char from console
   char type is echoed
*/   
getchar(c)
int c; 
{
   c=bdos(1, 0);   /* bdos(1=conin) */ 
   if (c==3) exit(0);
   return c;
}

/* gets(buffer)
   Get a string from the console and put it and put it (null terminated)
   at the given buffer. Read up to 200 chars. return a pointer to start of tring
*/
gets(buffer)
char *buffer;
{
	char buf[203];
	int i,len; 
	
	buf[0]=199;      /* max console input */
	bdos(10, buf);   /* console input line */
	len=buf[1];      /* chars actualy read from console */
	for(i=0;i<len;i++) buffer[i]=buf[i+2];
	buffer[len]=0;   /* make result null terminated */
	return buffer;
}

/* kbhit();
   Returns true if a character is present on the console input;
   else returns false.
*/   
kbhit()
{
   return bdos(11, 0);   /* bdos(11=cstat) */ 
}

/* unlink("filename");
   Delete a file from the filesystem
   returns 0 on success, -1 on error
*/    
unlink(filename)
char *filename;
{
	int fcbaddr;
	int r; 
	
	fcbaddr=getfcb(filename);
	if (fcbaddr < 0) return -1; 

	r=bdos(19, fcbaddr);	/* delete */
	if (r==255) return -1; 

	return 0;
}

/* creat("filename");
   Create a new file on the filesystem,
   then, open it for output. File should not exist
   return -1 on error
   return 8..19 -> the number of file descriptor used for this file
*/
creat(filename)
char *filename;
{
	int fcbaddr; 
	int fd;
	int r;
	int *mem; char *memb;
	
	fcbaddr=getfcb(filename);
	mem=0x03fb; fd=*mem;
	if (fcbaddr < 0) return -1; 
	
	/* clear fcb */
	memb=fcbaddr+32; *memb=0;
	memb=fcbaddr+12; *memb++=0; *memb++=0; *memb++=0; *memb=0;
	r=bdos(22, fcbaddr);    /* create */
	if (r==255) return -1; 
	r=bdos(15, fcbaddr);	/* open file */
	if (r==255) return -1; 
	/*  store in fd table the status of file: 3 for read, 5 for write, 7 for both */
        memb=0x03e3+fd-8; *memb=7;
        return fd;	
}

/* open(filename,mode)
   Open a file for raw (non-bufferred) read (0), write(1), or both(2).
   File should exist
   return -1 on error
   return 8..19 -> the number of file descriptor used for this file   
*/
open(filename,mode)
char *filename;
int mode; 
{
	int fcbaddr;
	int fd; 
	int r; 
	int *mem; char *memb;
	
	fcbaddr=getfcb(filename);
	mem=0x03fb; fd=*mem;
	if (fcbaddr < 0) return -1; 

	/* clear fcb */
	memb=fcbaddr+32; *memb=0;
	memb=fcbaddr+12; *memb++=0; *memb++=0; *memb++=0; *memb=0;
	
	r=bdos(15, fcbaddr);	/* open file */
	if (r==255) return -1; 
	
	/* mode=read (0), write(1), or both(2) 
	   store in fd table the status of file: 3 for read, 5 for write, 7 for both */
        memb=0x03e3+fd-8; *memb=mode*2+3;
        return fd;	
}

/* tell(fd);
   Return position of r/w pointer associated with a particular file
   return -1 if file not open or invalid fd
*/   
tell(fd)
int fd; 
{
	int fcbaddr;
	char *memb;
	int cr,ex,s1,rec;

        if ((fd<8) || (fd>19)) return -1; /* invalid fd */
        memb=0x03e3+fd-8; if (*memb==0) return -1; /* file not open */
	
	/* read cr ex s1 bytes from fcb to figure out current record position on file */ 
	fcbaddr=0x011d+(fd-8)*36;
	memb=fcbaddr+32; cr=*memb & 0x7f; 
	memb=fcbaddr+12; ex=*memb & 0x1f; 
	memb=fcbaddr+13; s1=*memb; 
	rec=cr + (ex << 7) + (s1 << 12);
	return rec;
}   


/* seek(fd, offset, origin);
   Seek to a particular sector in an open file, where the new sector
   address is:
	offset		if origin == 0
	current+offset	if origin == 1
   return -1 if file not open or invalid fd
   if success, return current file record number 
*/
seek(fd, offset, origin)
int fd; 
int offset;
int origin;
{
	int fcbaddr;
	char *memb;
	int cr,ex,s1,rec,a;

        rec=tell(fd);
        if (rec<0) return -1; 
        if (origin) {rec=rec+offset;} else {rec=offset;}
        if (rec < 0) return -1; 
	
        /* calculate cr, ex, s1 bytes */
	cr=rec & 0x7f; a=rec >> 7;
	ex=  a & 0x1f; s1= a >> 5;
	
	/* save cr ex s1 bytes into fcb to set the new file position*/ 
	fcbaddr=0x011d+(fd-8)*36;
	memb=fcbaddr+32; *memb=cr;
	memb=fcbaddr+12; *memb=ex;
	memb=fcbaddr+13; *memb=s1; 
	
	return rec;
}

/* read(fd, buf, nbl)
   Reads nbl sectors into buffer
   returns number of records successfully read 
*/
read(fd, buf, nbl)
int fd;
int buf;
int nbl;
{
	int fcbaddr;
	char *memb;
	int r; 
	int nread;

        if ((fd<8) || (fd>19)) return 0; /* invalid fd */
        memb=0x03e3+fd-8; if (((*memb) & 2)==0) return 0; /* file not r/o or r/w */
        
	fcbaddr=0x011d+(fd-8)*36;
	nread=0;
	
	while(1) {
	   bdos(26, buf); /* 26=set DMA */
	   r=bdos(20, fcbaddr); /* 20=read next record */
	   if (r) break; /* error: 1=EOF, >1 other errors */
	   nread++; nbl--; buf=buf+128;
	   if  (nbl==0) break; 
	}
	return nread;  	
}

write(fd, buf, nbl)
int fd;
int buf;
int nbl;
{
	int fcbaddr;
	char *memb;
	int r; 
	int nwrite;

        if ((fd<8) || (fd>19)) return 0; /* invalid fd */
        memb=0x03e3+fd-8; if (((*memb) & 4)==0) return 0; /* file not r/w */
        
	fcbaddr=0x011d+(fd-8)*36;
	nwrite=0;
	
	while(1) {
	   bdos(26, buf); /* 26=set DMA */
	   r=bdos(21, fcbaddr); /* 21=write next record */
	   if (r) break; /* error: 1=dir full, 2=disk full, >2 other errors */
	   nwrite++; nbl--; buf=buf+128;
	   if  (nbl==0) break; 
	}
	return nwrite;  	
}

setmem(addr, len, val)
char * addr;
int len;
int val; 
{
	while (len--) addr++=val; 
}

srand(n)
int n;
{
	int *seed;
	seed=0x03d4;
	if (n) {
	   *seed=n;
	   return;
	}
	puts("Wait a few seconds, and type a CR: ");
	while (kbhit()==0) *seed=*seed+3;
	getchar(); /* get the <CR> typed in console */
}

rand(n)
int n;
{
	int *seed;
	seed=0x03d4;
	
	*seed = *seed ^ (*seed << 7);
	*seed = *seed ^ (*seed >> 9);
	*seed = *seed ^ (*seed << 8);
	*seed = *seed & 0x7fff;
	return *seed; 
}

