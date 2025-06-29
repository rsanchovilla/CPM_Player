/* Hello World program */

struct FILE {
	int fd;
	int nleft;
	char *nextp;
	char buff[128];
 };

struct FILE f1;

fprt(s, file)
char* s;
struct FILE *file;
{
	while (*s) putc (*s++, file);
}

main() 
{
int r; 
int c;

    printf("Hola \n");
    
    r=fcreat("TEST.TXT", f1);
    if (r<0) { printf("fcreat error \n"); exit(1); }
    fprt("Hola que tal", f1);     /* write string into file */
    putc (13, f1); putc (10, f1); /* add end of line as <CR><LF> pair */
    putc (0x1A, f1);              /* add CP/M text end of file char */
    fflush(f1);                   /* should manuall flush r/w files before closing */
    fclose(f1);
    
    r=fopen("TEST.TXT", f1);
    if (r<0) { printf("fopen error \n"); exit(1); }
    while (1) {
       c=getc(f1);
       if (c<0) { printf("getc error \n"); exit(1); }
       if (c==0x1A) break;
       putchar(c);                /* dump file to console until char $1a is found */
    } 
    fclose(f1);
    
    unlink("TEST.TXT");
    
    printf("adios \n");
}


