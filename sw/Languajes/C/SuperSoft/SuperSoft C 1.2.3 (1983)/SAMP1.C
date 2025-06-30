/*
 * sample 1
 */

#ifndef REL		/* not needed if linking assembler used */
#include "crunt2.c"	/* not needed if linking assembler used */
#include "func.c"	/* not needed if linking assembler used */
#endif			/* not needed if linking assembler used */

main()
{
	register char ch;
	char instring[80], secstr[80];
	int	isalnum()
		,isascii()
		,iscntrl()
		,ispunct()
		,isprint()
		,isspace()
		,isalpha()
		,isupper()
		,islower()
		,isdigit()
		,iswhite();

	puts("\nSample program 1: the string and character functions\n");
	puts("\n   The functions to be demonstrated include:\n\n");
	puts("   toupper   	tolower		isalpha		isdigit\n");
	puts("   gets		puts		strcpy		strcat\n");
	puts("   strcmp       isupper         islower\n");

	puts("\n\nEnter a string: ");	gets(instring);
	puts("Here is the string you entered: ");
	puts(instring);
	puts("\nEnter a second string to compare with the first: ");
	gets(secstr);
	puts(strcmp(secstr,instring)? "strings differ\n": "strings are equal\n");
	puts("\nNow let's put the first string together with the second\n");
	strcat(instring,secstr);
	puts(instring);
	puts("\n\nNext let's copy the second string into the first:\n");
	strcpy(instring,secstr);
	puts(instring);
	puts("\n\n");
	
	puts("Next we will demonstrate some character commands\n");
	do{
		puts("\ntype a 0 to move on: ");
		ch = getchar();
		if(islower(ch)) 
			dolower(ch);
		else if(isupper(ch))
			doupper(ch);
		else if(isdigit(ch))
			dodigit(ch);
	} while (ch!='0');

	for(puts("\n\nEnter a line, end with a return:");;) {
		puts("\n\n\t");
		gets(instring);
		if(instring[0]=='\0')
			break;

		str_tr(isascii,"isascii",instring);
		str_tr(isprint,"isprint",instring);
		str_tr(isalnum,"isalnum",instring);
		str_tr(isalpha,"isalpha",instring);
		str_tr(islower,"islower",instring);
		str_tr(isupper,"isupper",instring);
		str_tr(isdigit,"isdigit",instring);
		str_tr(ispunct,"ispunct",instring);
		str_tr(iswhite,"iswhite",instring);
		str_tr(isspace,"isspace",instring);
		str_tr(iscntrl,"iscntrl",instring);
	}
}

dolower(ch)
 char ch;
{
	puts(" lower case char --> upper: ");
	putchar(toupper(ch));
}

doupper(ch)
 char ch;
{
	puts(" upper case char --> lower: ");
	putchar(tolower(ch));
}

dodigit(ch)
 char ch;
{
	register int tt;

	puts(" squared is ");
	tt = ch-'0';
	putdec(tt*tt);
}

str_tr(fn,fnname,ss)
 char (*fn)();
 char *fnname;
 char *ss;
{
	register char *s;

	puts(fnname); putchar('\t');
	for(s=ss; *s; ++s)
		putchar((*fn)(*s)? 'X': ' ');

	puts("\n");
}
urn:");;) {
		puts("\n\n\t");
		gets(instring);
		if(instring[0]=='\0')
		