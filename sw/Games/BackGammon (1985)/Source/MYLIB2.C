/*
MYLIB2.C

These routines are CONDITIONALLY compiled; i.e., only as needed.

----------------------------------------------------------------------
Incorporates special mods used by my Backgammon game, BACKGMMN.C etc.
----------------------------------------------------------------------

A set of common I/O functions that seem to turn up a lot in my programs, 
including terminal functions for Kaypro 10, 4'84, 2X etc.

Uses Software Toolworks' C/80 3.1 compiler.  Place #include "mylib2.c" at the
end of your source file for correct CONDITIONAL COMPILATION. 

David C. Oshel
1219 Harding Ave.
Ames, Iowa 50010

Last modified:  March 25, 1986

-----------------------------------------------------------------------------
** WARNING ** These routines use direct console IO, bdos function 6!

         YOU MUST CALL INIT_LIB() BEFORE USING THESE ROUTINES!

                      ======= UTILITIES =======

 * init_lib()		- CALL THIS FIRST, OR THE RESULT WILL BE VERY STRANGE!
 *
 * puts(p)		- unformatted print, e.g., puts("Hello, sailor!\n");
 * gets(p,max)		- printable input only, no prompt character
 *
 * ask(p)		- demand Yes or No response to question p
 * random()		- effective random 16-bit integer IFF gets() is used
 * sleep(n)		- sleep n/10ths of a second, roughly (from C80.LIB)
 * rollup()		- roll up 23 lines of screen
 * ONscript()		- printer echo ON  for output via puts, chrout
 * OFFscript()		- printer echo OFF for output via puts, chrout
 * ONinterrupt()	- Ctl-C, Ctl-B cause program exit
 * OFFinterrupt()	- Ctl-C, Ctl-B cause comedy
 * hide_input(p,max)	- like gets, but used when entering passwords
 * chrout(c)		- if scripting, echo output also to LST:
 * putscreen(p)		- like puts, but always and only to screen


           ======= KAYPRO 10 TERMINAL/VIDEO FUNCTIONS =======

 * gotoxy(x,y)		- 0,0 is top left, horz <= 79 precedes vert <= 24,
 *                        where 0,24 is on the 25th, status, line.
 * beep()		- terminal bell
 * home()		- home cursor, do not clear screen
 * clr_screen()		- home and clear
 *
 * shadow_box(h,v,x1,y1,x2,y2) - like box, but with shadow, calls box
 * box(tlx,tly,brx,bry) - draw a line box, coords: topleft XY, bottomright XY
 *			  note that box calls ldraw(x1,y1,x2,y2), below
 *
 * clr_lend()		- clear from cursor to end of line
 * clr_send()		- clear from cursor to end of screen
 * rev_vid(),
 * nor_vid()		- reverse field 
 * dim_vid(),
 * bri_vid()		- low/high intensity
 * on_blink(),
 * off_blink()		- blinking chars
 * ul_start(),
 * ul_stop()		- start/stop underline
 * save_cursor(),
 * retn_cursor()	- remember/restore current cursor location
 * ins_line(),
 * del_line()		- insert/delete screen text line
 * on_cursor(),
 * off_cursor()		- hide/show cursor
 * vm_on(),
 * vm_off()		- "Video Mode" commands
 * pixel(x,y)		- draw pixel at x,y (video coords, x <= 159, y <= 99)
 * no_pixel(x,y)	- erase pixel at x,y
 * ldraw(x1,y1,x2,y2)  	- draw/ erase graphics line, see discussion for box
 * lwipe(x1,y1,x2,y2)	- range for video coordinates as for pixel
*/


#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif


/* hide this here so's not to worry about it elsewhere */
/* "printf.c" collides with one of these, can't remember which */
/* puts() takes longer to write, but executes faster */
extern char Cmode, IOpread[4], IOpwrit[4], IOpeof[4];

/* make these known only to what follows */
static int MYbstout, MYscrtp, MYretnirp; /* odd names mark semi-private   */
static unsigned RNDloc; /* effective random location, bumped by gets()    */
			/* and scrambled when the LCG random() is called  */
			/* makes a decent algorithm for interactive games */


#ifneed init_lib
init_lib() {

	MYretnirp = fopen("LST:","w");
	OFFscript();
	ONinterrupt();
	Cmode = 0;
	IOpread[0] = 6; IOpwrit[0] = 6;

} /* end: init_lib */
#endif



 
#ifneed random
random() {  	/* depends on effective random location spun by gets() */

	RNDloc = 2053 * RNDloc + 13849;
	return (RNDloc);
}
#endif



#ifneed ONscript
ONscript() {

	MYscrtp = TRUE; 

}
#endif
#ifneed OFFscript
OFFscript() {

	MYscrtp = FALSE; 

}
#endif


#ifneed ONinterrupt
ONinterrupt() {

	MYbstout = TRUE;

}
#endif
#ifneed OFFinterrupt
OFFinterrupt() {

	MYbstout = FALSE;

}
#endif


#ifneed ask
ask(p) char *p; {

char ch, resp[2];

loo:	puts(p);
	gets(resp,1);
	ch = toupper( *resp );
	if ( !( ch == 'Y' || ch == 'N' )) {
		puts("Please answer the question, Yes or No.\n");
		goto loo;
	}
	return (ch == 'Y');

} /* end: ask */
#endif


#ifneed rollup
rollup() {

int i;

	for (i=0; i<23; i++) puts("\n");

} /* end: rollup */ 
#endif


#ifneed sleep
sleep( n )  int n;  {		/* sleep for n/10 seconds, 0 <= n < 256 */

	n;			/* get n into HL */
#asm
	MOV	B,L		;delay B/10ths of a second
__DL0:	MVI	A,100		;100 milliseconds, 1/10 second
__DL1:	MVI	C,249		;1 millisecond per unit of A at 4 MHz
__DL2:	DCR	C		;Leventhal, Z80 Assembly Language Programming
	JNZ	__DL2
	DCR	A
	JNZ	__DL1
	DCR	B
	JNZ	__DL0		;on exit, HL has FALSE if n was 0, else TRUE
#endasm
} /* end: sleep */
#endif


/*========================================*/
/*  GETS(p, maxinput)                     */
/*  Local getline function with special   *---* WARNING:                    */
/*  input handling,  1 <= len <= maxinput *---* Execute INIT_LIB() first !! */
/*  Updates effective random, RNDloc,     */
/*  Forces input from CONSOLE only!       */
/*========================================*/ 

#ifneed gets
gets(p,maxinput) char *p; int maxinput; {

/* This function depends on BDOS Function #6.  Init_lib() sets Cmode=0 and
   IOpread[0]=6 and IOpwrit[0]=6 (courtesy of and peculiar to C/80 3.1)
   YOU must ensure that the target string is long enough to collect the
   entire maximum input allowed and specified, INCLUDING FINAL NULL!    */

static int len;
static char ch;

	len = -1;
	if (maxinput < 1 || maxinput > 127) maxinput = 79;

        /*--------------------------------*/
        /* SPECIAL ROUTINE FOR BACKGAMMON */
        /*--------------------------------*/

loo:	while ( !(ch = getc(0)) ) acg(); /* keep the game lively */

	if (len < 0) len = 0;	/* don't destroy prompt by backing up */
	if (ch == '\n') {  	/* end of line?  don't store newline */
		*p = '\0';	/* mark it with a B for baby and me */
		/* chrout('\n'); */ /* but DON'T echo newline */
		return ( len ); /* <--- HERE IS THE FUNCTION EXIT! */
	}
	else if (ch == '\b' || ch == 0x7F) {  	/* backspace? rubout? */
		if (len--) {			/* where's the prompt?  */
			puts("\008 \008");	/* we're ok, echo erase */
			p--;			/* delete from string */
		}
	}

        /*--------------------------------*/
        /* SPECIAL ROUTINE FOR BACKGAMMON */
        /*--------------------------------*/

	else if (ch == '\003') {  /* user bailout key is Ctrl-C, not ESC */
		if (MYbstout) exit();
		else {
                     haltgame(); /* sets whofirst flag and does jumpjack() */
		}
	}

	else if (ch == '\025' || ch == '\030') {  /* Ctl-U, Ctl-X */
		while (len--) {
			p--;
			puts("\008 \008");
		}
	}
	else if (len == maxinput) { /* test specials before testing len */
		chrout('\007');
	}
	else if (ch > 31 && ch < 127) { /* printable char? */
		chrout(ch);		/* yes, echo it */
		*p++ = ch;		/* collect it */
		len++;			/* keep track of it */
	}
	else {  			/* control chars? */
		chrout('\007');
	}		
	goto loo;

} /* end: gets */
#endif




#ifneed hide_input
hide_input(s,len) char *s; int len; {

/* receive at most len chars in s buffer, 
   terminate string with zero, 
   but echo each char with 1, 2, or 3 meaningless dots */

char ch; int num;

	if ((len < 1) || (len > 127)) len = 127;
	num = 0;
	for (;;) { /* forever */ 
	while ((ch = getc(0)) == 0) /* bdos 6 does not wait, so we do */
	;
	if ((ch == '\r') || (ch == '\n') || (num++ > len)) { 
		/* not sure what the CR key actually is to bdos 6 & C/80 */
		*s++ = '\0';
		return;  /* this way out */
	}
	if ((num % 2) == 0) putc('.',0); /* deception, illusion */
	if ((num % 5) == 0) putc('.',0);
	putc('.',0);
	*s++ = ch;
	}

} /* end: hide_input */
#endif




/*------------------------ kpro stuff -------------------------*/

#ifneed shadow_box
/* like box, but with horizontal & vertical displacement for shadow */
shadow_box(h,v,x1,y1,x2,y2) int h,v,x1,y1,x2,y2;
{
	box(x1+h,y1+v,x2+h,y2+v);   /* draw the shadow  */
	box(x1,y1,x2,y2);	    /* draw the box     */
	ldraw(x1+h,y1+v,x1,y1);     /* draw the corners */
	ldraw(x2+h,y2+v,x2,y2);
	ldraw(x2+h,y1+v,x2,y1);
	ldraw(x1+h,y2+v,x1,y2);
}
#endif


#ifneed box
/* parameters are topleft X,Y and bottomright X,Y 
   X ranges from 0 to 159, Y ranges from 0 to 99, top left is 0,0
   */
box(x1,y1,x2,y2) int x1,y1,x2,y2; {
	ldraw(x1,y1,x1,y2);
	ldraw(x1,y2,x2,y2); /* appears to draw the box anticlockwise */ 
	ldraw(x2,y1,x2,y2);
	ldraw(x1,y1,x2,y1);
}
#endif



#ifneed gotoxy
gotoxy (xpos,ypos) int xpos,ypos; {  /* 0,0 is top left corner */
	putscreen("\033=");
	putc(ypos+' ',0);
	putc(xpos+' ',0);
	}
#endif


#ifneed beep
beep()		{ putc(7,0); } 	/* send bell character */
#endif

#ifneed home
home()		{ putc(30,0); }	/* home cursor to top left */
#endif

#ifneed clr_screen
clr_screen() 	{ putc(26,0); }	/* home and erase screen */
#endif


#ifneed clr_lend
clr_lend() 	{ putc(24,0); }	/* clear to end of line */
#endif

#ifneed clr_send
clr_send() 	{ putc(23,0); }	/* clear to end of screen */
#endif



#ifneed rev_vid
rev_vid() 	{ putscreen ("\033B0"); }	/* reverse background */
#endif

#ifneed nor_vid
nor_vid() 	{ putscreen ("\033C0"); }
#endif



#ifneed dim_vid
dim_vid() 	{ putscreen ("\033B1"); }	/* low intensity */
#endif

#ifneed bri_vid
bri_vid() 	{ putscreen ("\033C1"); }
#endif



#ifneed on_blink
on_blink()	{ putscreen ("\033B2"); }    /* blinking characters */
#endif

#ifneed off_blink
off_blink() 	{ putscreen ("\033C2"); }
#endif



#ifneed ul_start
ul_start() 	{ putscreen ("\033B3"); }	/* underline */
#endif

#ifneed ul_stop
ul_stop() 	{ putscreen ("\033C3"); }
#endif


#ifneed save_cursor
save_cursor()	{ putscreen ("\033B6"); }  /* remember cursor position */
#endif
#ifneed retn_cursor
retn_cursor()	{ putscreen ("\033C6"); }  /* return to remembered pos */
#endif


#ifneed on_status
on_status()	{ putscreen ("\033B7"); }    /* status line preservation on */
#endif
#ifneed off_status
off_status()	{ putscreen ("\033C7"); }
#endif


#ifneed ins_line
ins_line() {				/* insert text line */
	putscreen("\033R");
	}
#endif
#ifneed del_line
del_line() {				/* delete text line */
	putscreen("\033E");
	}
#endif


#ifneed on_cursor
on_cursor() 	{ putscreen ("\033B4"); }	/* (in)visible cursor */
#endif
#ifneed off_cursor
off_cursor() 	{ putscreen ("\033C4"); }
#endif



/* Video Mode ON/OFF: video WORD, 8 bit video if 15 and 7 are both high */
/*                    VM-ON 10000001 11111111 VM-OFF                    */
/*                          ^video ^x^video                             */
/* otherwise, video BYTE, high bit 7 interprets bits 0-6 as screen dots */
/*                    11111111                                          */
/*                    ^video                                            */
/* e.g.,                                                                */
/*        Non-VideoMode                 VideoMode                       */
/*    xx     1 11:0     where % is    1 01:0  1 11:0      xx            */
/*    xx     3 11 2     the video     3 00 2  3 11 2      xx            */
/*    xx     5 11 4     flag bit,     5 00 4  5 11 4      xx            */
/*     x     7:%1 6     x is pixel    7:%0 6  7:%1 6      xx            */
/*             ^                        ^       ^                       */
/* to set the pixels, first do a gotoxy to character screen position    */
/* this mode is faster than Pixel ON/OFF if values are drawn from table */
#ifneed vm_on
vm_on()		{ putscreen ("\033B5"); }	/* video mode on */
#endif
#ifneed vm_off
vm_off()	{ putscreen ("\033C5"); }
#endif


#ifneed pixel
pixel(x,y) int x,y; {			/* x <= 159, y <= 99 */
	putscreen("\033*");
	putc(y+' ',0); putc(x+' ',0);
}
#endif

#ifneed no_pixel
no_pixel(x,y) int x,y; {		/* x <= 159, y <= 99 */
	putscreen("\033 ");
	putc(y+' ',0); putc(x+' ',0);
}
#endif


#ifneed ldraw
/* use x1 <= x2, y1 <= y2, order is significant (Kaypro bug?) */
ldraw(x1,y1,x2,y2) int x1,x2,y1,y2; {	/* x <= 159, y <= 99 */
	putscreen("\033L");
	putc(y1+' ',0); putc(x1+' ',0); 
	putc(y2+' ',0); putc(x2+' ',0);
}
#endif


#ifneed lwipe
lwipe(x1,y1,x2,y2) int x1,x2,y1,y2; {	/* x <= 159, y <= 99 */
	putscreen("\033D");
	putc(y1+' ',0); putc(x1+' ',0); 
	putc(y2+' ',0); putc(x2+' ',0);
}
#endif


#ifneed putscreen
putscreen(p) char *p; {

	while (*p) putc(*p++,0);

} /* end: putscreen */
#endif


#ifneed puts
puts(p) char *p; {

	while (*p) chrout(*p++);

} /* end: puts */
#endif


#ifneed chrout
chrout(c) char c; {  /* SPECIAL FOR SCRIPT OPTION WITH LST: */

	putc(c,0);
	if ( MYscrtp ) putc(c,MYretnirp);

} /* end: chrout */
#endif

/* end: MYLIB.C */

