/*
 * sample 5
 */

#ifndef REL		/* not needed if linking assembler used */
#include "crunt2.c"	/* not needed if linking assembler used */
#include "func.c"	/* not needed if linking assembler used */
#include "stdio.c"	/* not needed if linking assembler used */
#include "alloc.c"	/* not needed if linking assembler used */
#include "formatio.c"	/* not needed if linking assembler used */
#endif			/* not needed if linking assembler used */

extern	int	errno;

#define	RECSIZ	128
#define	ERROR	(-1)

main(argc,argv)
 int argc;
 char **argv;
{
	register char *filename;
	int mode, fd, rec;
	char ch, instr[80], buffer[RECSIZ+1];

	if(argc==2)
		filename = argv[1];
	else {
		puts("Usage: samp5 filename");
		return 1;
	}

	if((fd=open(filename,2))==ERROR) {
		printf("\nCan't open file %s (errno is %d)\n",filename,errno);
		return 0;
	}

	for(;;) {
		printf("Enter %d byte sector number (RETURN to exit): ",RECSIZ);
		gets(instr);
		puts("\n");

		switch(*instr) {
		case 'C'-'@':
		case '\0':
			break;
		default:
			rec = atoi(instr);
			if(seek(fd, rec*RECSIZ, 0)==ERROR) {
				printf("No such place in this file\n\n");
				printf("(Errno is %d)\n", errno);
			} else {
				if(read(fd,buffer,RECSIZ)!=RECSIZ)
					printf("Can't read (errno is %d)\n",errno);

				buffer[RECSIZ]=0;
				puts("<<");
				puts(buffer);
				puts(">>\n\n");
			}
			continue;
		}
		break;
	}
}
eeded if linking assembler used */

extern	int	errno;

#define	RECSIZ	128
#define	ERROR	(-1