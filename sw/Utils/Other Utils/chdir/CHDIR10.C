/*
	Program:  CHDIR
	Author:  Richard Conn
	Version:  1.0
	Date:  22 Aug 82
	Previous Versions:  None
	Note:  This Program Must Be Compiled with NOBOOT or modified
		manually so that the Stack is not placed within the CCP
	Note:  After initially compiled, this program should be
		first run from a system user number with the /S
		option to set the system password (initially garbage)
		and the basic directory names

*/
#define	ver	10		/* Version Number */
#define	defname	"CHDIR.COM"	/* Default File Name */
#define	dirmax	64		/* Maximum Number of Directories Allowed */
#define	syspass	"chdir"		/* Password for Access to Change Capability */
#define	sysuser	10		/* Lowest System User Area */
#define	tryent	1		/* Number of Tries to Enter System Area */
#define	tryset	3		/* Number of Tries to Enter Setup Mode */
#define	exitcmd	""		/* Command to Execute on Password Exit */

/*

	CHDIR is a program which is used to impose a logical directory
structure onto the CP/M or CP/ZM Operating Systems.  CHDIR performs
three functions:

		1) CHDIR allows the user to enter one of the defined
directories; this form of the CHDIR command is
			CHDIR dirname
where 'dirname' is the name of the directory (up to 8 characters)
		2) CHDIR allows the user to define a new directory on
the fly; this form of the command is
			CHDIR dirname du
where 'dirname' is the name of the directory (up to 8 characters) and
'du' is the disk and user number the name applies to
		   Along the same lines, the CHDIR Setup option allows
the user to define or redefine a number of directories without invoking
CHDIR a number of times; this command is of the form
			CHDIR /SETUP
		3) CHDIR displays the names of the known directories to
the user; this form of the command is
			CHDIR /DISPLAY

*/

/*  Global Definitions and Variables  */
char spass[21];  /* Buffer for System Password After Init */
char pass[21];  /* Password is Global for Safety */
char directory[dirmax][9];  /* DIRMAX Directories of 8 Chars + NULL Each */
char dirdisk[dirmax];  /* DIRMAX Directory Disks */
int dirun[dirmax];  /* DIRMAX Directory User Numbers */
unsigned ccp;  /* Address of CCP */

/*  Main Program  */
main(argc,argv)
int argc;
char **argv;
{
	unsigned *bdptr;

	bdptr = 6;  /* Pt to Location 6 for BDOS Location */
	ccp = (((*bdptr/256)-8)*256) + 3;  /* Restart Location Within CCP */

	printf("CHDIR, Version %d.%d",ver/10,ver%10);
	switch (argc) {
		case 2 : if (*argv[1] == '/') option(argv[1]);
				else chdir(argv[1]);
			 break;
		case 3 : set(argv[1], argv[2]); break;
		default : help(); break;
		}
}

/*  Option Processor  */
option(ostr)
char *ostr;
{
	char *tstr;

	tstr = ostr;  /* assign temp ptr */
	printf("  -- Option: ");
	switch (*++tstr) {
		case 'D' : printf("Display Directory Names");
			   display(0); break;
		case 'S' : printf("Setup of Directory Names");
			   setup(); break;
		default  : printf("Help");
			   help(); break;
		}
}

/*  Help Message  */
help()
{
	printf("\n\tCHDIR Program Help Information\n");

	printf("\nCHDIR is a program used to impose a named directory");
	printf("\nstructure onto a CP/M or CP/ZM Operating System.  This");
	printf("\nallows the user to select directories (disk and user)");
	printf("\nby name (logically) rather than by letter/number.");
	printf("\n");

	printf("\nThe forms of this command are --");

	printf("\n\tCHDIR dirname\t<-- select directory");

	printf("\n\tCHDIR dirname du\t<-- name directory for disk d user u");

	printf("\n\tCHDIR /DISPLAY\t<-- display directory assignments");

	printf("\n\tCHDIR /SET\t<-- define several directories");

	printf("\n\tCHDIR //\t<-- print HELP information\n");
}

/*  Change Directory to Name Specified  */
chdir(dirname)
char *dirname;
{
	int dir, index;
	unsigned udflag;

	index = -1;
	for (dir=0; dir < dirmax; dir++)
		if (strcmp(directory[dir],dirname) == 0) index = dir;
	if (index == -1) {
		printf("\nError -- Can't Find Directory Name");
		display(0);
		return(-1);
		}
	if (dirun[index] >= sysuser) password(tryent);  /* Require PW System */
	udflag = dirun[index] << 4;  /*  Implant the User Number  */
	udflag |= dirdisk[index] - 'A';  /*  Implant the Disk Number  */
	call(ccp,0,0,udflag,0);  /*  Reenter the CCP  */
}

/*  Convert String to Integer  */
tonum(str)
char *str;
{
	int value, digit;
	char *tstr;

	tstr = str;
	value = 0;
	while (*tstr != '\0') {
		digit = *tstr++ - '0';  /* Convert to binary */
		if ((digit < 0) || (digit > 9)) return(-1);  /*  Error  */
		value = value*10 + digit;
		}
	return(value);
}

/*  Display Directory Names and Definitions  */
display(flag)
int flag;  /* If flag==0, only display system files if in system dir */
{
	int count, dir, user;

	user = bdos(32,0xff);  /* Get current user number */
	printf("\nDefined Directory Names --");
	count = 0;
	for (dir = 0; dir < dirmax; dir++) {
		if ((directory[dir][0] != '\0') &&
		((user >= sysuser) || (flag != 0) || (dirun[dir] < sysuser))) {
			if (count%4 == 0) printf("\n");
			printf("\t%c%d: %s",dirdisk[dir],dirun[dir],
				directory[dir]);
			}
		if (directory[dir][0] != '\0') count++;
		}
	printf("\n%d Directory Names Defined, Space Left for %d More Names\n",
		count, dirmax-count);
	disp2();
}

/*  Display Current Directory Assignment  */
disp2()
{
	int un, defined, dir;
	char disk;

	printf("\nCurrent Directory --");
	un = bdos(32,0xff);  /* Get current user number */
	disk = bdos(25,0) + 'A';  /* Get current disk letter */
	defined = 0;  /* Directory Not Defined */
	for (dir=0; dir < dirmax; dir++)
		if ((dirdisk[dir] == disk) && (dirun[dir] == un)) {
			printf("\t%c%d: %s",disk,un,directory[dir]);
			defined = 1;  /* Directory Defined */
			}
	if (defined == 0) printf(" Not Defined by Name");
	printf("\n");
}

/*  Set up Mnemonic Names  */
setup()
{
	char cmd, fname[40];
	int i,j,fd;
	unsigned base;

	printf("\nCHDIR Setup Subsystem");
	password(tryset);  /* Ask for password */
	do {
		printf("\nSetup Command (? for Help)? ");
		cmd = toupper(getchar());  /* Get Response */
		switch (cmd) {
			case 'D' : printf("\nSystem Password is %s",spass);
				   display(1); break;
			case 'I' : initdir(); break;
			case 'N' : printf("\nSystem User Areas start at %d",
					sysuser);
				   while (setdir() == 0); break;
			case 'P' : printf("\nNew System Password? ");
				   dots(20);
				   scanf("%s",spass);
				   break;
			case 'Q' : printf("\tVerify Abort (Y/N)? ");
					if (toupper(getchar()) == 'Y')
						return(-1);
					break;
			case 'S' : sort(); printf("\nSort Complete"); break;
			case 'X' : break;
			default  : sethlp(); break;
			}
	} while (cmd != 'X');
	printf("\tWrite New File (Y/N)? ");
	if (toupper(getchar()) != 'Y') return(-1);
	printf("\nName of File (RETURN = %s)? ",defname);
	dots(12);
	scanf("%s",fname); strcap(fname);  /* Input and Capitalize File Name */
	if (strlen(fname) == 0) strcpy(fname,defname);  /* Set FN if none */
	if (strscan(fname) == 0) strcat(fname,".COM");  /* Make type COM */
	writepgm(fname);  /* Write Program to Disk */
}

/*  Set Mnemonic Name for a Directory  */
setdir()
{
	int i, un, repl, dir;
	char disk, name[20];

	printf("\n\tDisk Letter and User (RETURN=Done or A-P 0-15, like ");
		printf("A10)? ");
	scanf("%s",name);  /* Get response */
	if (strlen(name) == 0) return(-1);  /* Done */
	disk = toupper(name[0]);  /* Get disk letter */
	if ((disk < 'A') || (disk > 'P')) { /* disk is out of range */
		printf("\n\tInvalid Disk Letter");
		return(0);
		}
	if ((un = tonum(name+1)) == -1) /* RETURN was specified */
		return(-1);
	if ((un < 0) || (un > 15)) {  /* User Number is Out of Range */
		printf("\n\tInvalid User Number");
		return(0);
		}
	do {
		printf("\tDirectory Name (RETURN = Delete Old Name)? ");
		dots(8);
		scanf("%s",name); strcap(name);  /* Get and Capitalize Name */
		if (strlen(name) > 8)
			printf("\t\tDirectory Name is too Long -- Reenter\n");
	} while (strlen(name) > 8);
	repl = 0;  /* No Replacement */
	for (dir=0; dir < dirmax; dir++)
		if ((dirdisk[dir] == disk) && (dirun[dir] == un)) {
			repl = dir;  /* Replacement */
			directory[dir][0] = '\0';  /* Null Out Old Name */
			}
	if (repl == 0) {
		repl = finddir();  /* Search for Empty Directory Name */
		if (repl == -1) {
			printf("\nError -- Directory Name Buffer Full");
			return(-1);
			}
		}
	dirdisk[repl] = '\0';
	dirun[repl] = 0;
	if (strlen(name) != 0) {
		dirdisk[repl] = disk;  /* Set Disk Name */
		dirun[repl] = un;  /* Set User Number */
		strcat(directory[repl],name);  /* Make entry in array */
		return(0);  /* Continue Flag */
		}
	printf("\n\t\tDirectory Name for %c%2d: Deleted",disk,un);
	return(0);  /* Continue Flag */
}

/*  Initialize directory  */
initdir()
{
	int i;
	char ans;

	printf("\tVerify Initialization (Y/N)? ");
	if (toupper(getchar()) != 'Y') {
		printf("\nInitialization Aborted");
		return(-1);
		}
	strcpy(spass,syspass);  /* Init System Password */
	for (i=0; i<dirmax; i++) {
		directory[i][0] = '\0';
		dirdisk[i] = '\0';
		dirun[i] = 0;
		}
	printf("\nAll Directory Names Cleared");
}

/*  Set Directory Name for specified disk/user number  */
set(dirname,duser)
char *dirname, *duser;
{
	char disk, *dutemp;
	int un, dir;

	dutemp = duser;
	disk = *duser;
	if ((disk < 'A') || (disk > 'P')) {
		printf("\nError -- Invalid Disk Letter (not A-P)");
		return(-1);
		}
	un = tonum(*++dutemp);
	if ((un < 0) || (un > 31)) {
		printf("\nError -- Invalid User Number (not 0-31)");
		return(-1);
		}
	if (scandir(dirname) == -1) {
		printf("\nError -- Duplicate Directory Name");
		return(-1);
		}
	if (un >= sysuser) password(tryset);  /* Ask for Password */
	dir = finddir();  /* Find available directory entry */
	if (dir == -1) {
		printf("\nError -- Directory Buffer Full");
		return(-1);
		}
	strcpy(directory[dir],dirname);  /* Set Name */
	dirdisk[dir] = disk;
	dirun[dir] = un;
	writepgm(defname);  /* Write Program to Disk */
	return(0);
}

/*  Write Program to Disk Under Passed Name  */
writepgm(fname)
char *fname;
{
	int fd;
	unsigned cend;

	printf("\nSorting Directory by Disk and User Number");
	sort();
	printf("\nWriting File %s to Disk ...",fname);
	fd = creat(fname);  /* Delete old file and open new one */
	if (fd == -1) {
		printf("\nError -- Can't Create File %s",fname);
		return(-1);
		}
	cend = codend()/128+(dirmax*12)/128;  /* Determine size of code */
	write(fd,0x100,cend);  /* Write file to disk */
	close(fd);  /* Close file -- done */
	printf(" File %s Written to Disk\n",fname);
}

/*  Ask for password n times and abort if not matched by then  */
password(n)
int n;
{
	int i;

	if (bdos(32,0xff) >= sysuser) return(0);  /* Pass if system */
	printf("\n\n** System Password Required for Access/Permission **");
	for (i=0; i<n; i++) {
		printf("\n\tSystem Password? ");
		dots(20);
		scanf("%s",pass);
		if (strlen(pass) > 20) {
			printf("\n** Violation Attempt **");
			exit(-1);
			}
		if (strcmp(spass,pass) == 0) {
			printf("\t** Access Granted **");
			return(0);
			}
		printf("\tInvalid Password Given");
		}
	printf("\n\t** Access Denied **");
	if (strlen(exitcmd) == 0) exit(-1);  /* Abort to OS if no command */
	exec(exitcmd);  /* Execute Command on Exit */
}

/*  Sort Directory by Disk and User Number  */
sort()
{
	int i, j;

	for (i=0; i<dirmax; i++)
		for (j=i+1; j<dirmax; j++)
			if ((dirdisk[i] != '\0') && (dirdisk[j] != '\0'))
				compare(i,j);
}

/*  Compare Directory Entry I to Directory Entry J and Swap if I > J  */
compare(i,j)
int i,j;
{
	if (dirdisk[i] < dirdisk[j]) return(0);  /* J > I */
	if (dirdisk[i] > dirdisk[j]) {  /* I>J so Swap */
		swap(i,j);
		return(0);
		}
	if (dirun[i] > dirun[j]) swap(i,j);  /* I>J so Swap */
	return(0);
}

/*  Swap Directory Entries I and J  */
swap(i,j)
int i,j;
{
	char disk, name;
	int un, k;

	disk = dirdisk[i]; dirdisk[i] = dirdisk[j]; dirdisk[j] = disk;
	un = dirun[i]; dirun[i] = dirun[j]; dirun[j] = un;
	for (k=0; k<9; k++) {
		name = directory[i][k];
		directory[i][k] = directory[j][k];
		directory[j][k] = name;
		}
}


/*  Find an Empty Directory Entry -- Return -1 if Not Found  */
finddir()
{
	int dir;

	for (dir=0; dir < dirmax; dir++)
		if (directory[dir][0] == '\0') return(dir);
	return(-1);
}

/*  Scan Directory Name Buffer for Duplicate Name */
scandir(name)
char *name;
{
	int dir;

	for (dir=0; dir < dirmax; dir++)
		if (strcmp(directory[dir],name) == 0) return(-1);
	return(0);
}

/*  Capitalize String  */
strcap(str)
char *str;
{
	char *tstr;

	tstr = str;
	while (*tstr != '\0') {
		*tstr = toupper(*tstr);
		tstr++;
		}
}

/*  Help File for Interactive Setup Commands  */
sethlp()
{
	printf("\nCHDIR Setup Subsystem Command Summary");
	printf("\n\tD -- Display Currently-Defined Directory Names");
	printf("\n\tI -- Initialize and Clear All Directory Names");
	printf("\n\tN -- Create a New Directory Name");
	printf("\n\tP -- Set System Password");
	printf("\n\tQ -- Quit without Changing Program on Disk");
	printf("\n\tS -- Sort Directory by Disk and User Number");
	printf("\n\tX -- Exit and Update Program on Disk");
}

/*  Print num dots followed by num <BS> on screen  */
dots(num)
int num;
{
	int i;

	for (i=0; i<num; i++) putchar('.');
	for (i=0; i<num; i++) putchar('\010');
}

/*  Scan passed string for a decimal and return zero if not found  */
strscan(str)
char *str;
{
	char *tstr;

	tstr = str;  /* pt to first char */
	while (*tstr != '\0')
		if (*tstr++ == '.') return (-1);
	return(0);  /* Didn't find dot */
}
