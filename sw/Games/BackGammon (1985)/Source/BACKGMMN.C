/* backgmmn.c */

/***************************************************************************

   GAMMON IV, Version 2

   Author:  David C. Oshel
            1219 Harding Avenue
            Ames, Iowa 50010

   Date:    March 26, 1986

   Gammon IV is probably the best backgammon game currently available for
   CP/M.  I wrote it because I was disgusted with the price and dullness
   of all other programs which allegedly play backgammon on CP/M systems.

   This program has THREE DIFFERENT PLAYING STYLES, any one of which can
   consistently beat a novice player, and occasionally beat a good player.
   In all three levels, the computer's strategy can even seem brilliant;
   there is nothing routine about it.

   This version incorporates a few minor changes and bug fixes which make it
   different from previous editions which have appeared on various bulletin 
   boards and club offerings around the country.  This is a public domain
   program.  Feel free to distribute or improve it.  Credit to the original
   author (me) will be appreciated, but is not strictly required since the
   copyright owners are abnormally mild-mannered (and extremely distant;
   see Acknowledgments, below.)

   Version 2:

      a) Fixed the bug in which the doubling cube might revert to its
         default value if the computer took back a move, and if the cube
         had been doubled one or more times during the opening roll-off
         but not yet offered.

      b) Fixed an odd bug in the Arrange command which occasionally caused 
         stones to switch allegiance to the opponent's color, or else to
         mysteriously multiply to more than 15 on a side.

      c) An improved error handler now hints that BAR and HOME are words
         used in the game; also, slows down the incorrect entry routine so
         that it is less mysterious than before.  

      d) Added a Graphic toggle to main command line.  Same as Control-K,
         as in previous versions; turns on/off the Kaypro '84 video graphics;
         uses the alternate token set defined in the CRT module below.

      e) Changed the break character back to Control-C.  The proximity of
         the ESCAPE key to the 1 digit on the Kaypro keyboard sometimes
         caused a game to be inadvertently paused during play.

      f) There is no longer a sanction against cheating; if you type
         Control-C during play and re-Arrange the stones, your opponent
         does not change.

      g) As before, the computer will not always take (or find) a forced 
         move.  The rule is that the player must take both dice if possible,
         or the larger if both are possible singly but not together.
         The playing algorithm attempts to find the legally required move, 
         but will sometimes fail.  It is sometimes advantageous to avoid a
         forced move but the computer cannot make that distinction, in this
         version; the program allows the same lenience for the human player.

         The cube is doubled when doubles are thrown during the opening
         rolloff to decide who goes first.  However, if the cube reaches 8,
         further pairs on the dice during rolloff have no effect.

         Gammon IV knows all the other OFFICIAL rules of the game; 
         U.S. Navy and/or Saloon rules don't count.

      h) Improved coding in some routines, especially putstone(), which was
         far more baroque than necessary.  There is also some occasional 
         re-coding, where I could not prevent myself.  The game strategy
         has not been changed, mostly because I don't fully understand it
         anymore, even though the documentation there is better than usual.
         It was written months ago in a white heat of inspiration; but I
         feel reluctant to submit myself to that strain again, without the
         prospect of remuneration.


   Acknowledgments:

      The opening dialogue, in which you chose your computer opponent,
      is freely adapted from Alexei Panshin's long out-of-print, and
      now classic, "Star Well" travelogues.  Scholars of computer history 
      will recognize many allusions to this same opus in various passages 
      of Mike Goetz's 550-point Adventure (especially in the Ice Caverns!).  

      The Xochitl Sodality, which owns the copyright on Gammon IV, is a 
      philanthropic society first publicized by Panshin.  Persons who wish 
      to obtain information on site licensing for Gammon IV should contact 
      the Monist Association imaginary properties secretary at the following 
      address:
                         Monist Association I.P.S.
                         c/o Xochitl Sodality
                         Semichastny House
                         Delbalso, Nash. Emp.
 

   Special Instructions:

      Terminal must be Lear-Siegler ADM-3A compatible, or else have
      the same graphics capability as a Kaypro 10, 2X or 4'84.  This
      requirement is fully configurable in the video section below,
      however.

      This program requires the Software Toolworks' C/80 v3.1 compiler
      for CP/M 2.2.  C/80 has a configuration program.  C/80 must be
      configured as follows, or else this program WILL NOT compile:

      Symbol table size: 512
      String constant table: 3200
      Dump constants after each routine: YES
      Macro table size: 500
      Switch table size: 128
      Structure table size: 200
      Merge duplicate string constants: YES
NB:   Assembler: C/80's AS
      Initialize arrays to zero:  < 256 BYES ONLY
      Generate ROMable code in Macro-80: YES
      Screen size:  24 (doesn't matter)
      Generate slightly larger, faster code: NO
      Sign extension on char to int conversion: YES 
      Device for library files: A: (your choice)

   Compilation:
   
NB:   Microsoft's MACRO-80 assembler and LINK-80 linker are required,
      and are specified in the (-m) compiler switch!  This is a moderately
      complex compile, so the procedure is directed by batch SUBMIT files.
      Distribute files as follows:

            On Drive A:

            BACKGMMN.C, BACKGMMN.SUB, CLIBRARY.REL, GAMEPLAN.C, 
            GAMEPLAN.HDR, MYLIB2.C, PRINTF.C, STDLIB.REL, SUBMIT.COM

            On Drive B:

            C.COM, L80.COM, M80.COM, WS.COM, WSMSGS.OVR, WSOVLY1.OVR

     Then, SUBMIT BACKGMMN to compile, assemble & link the game.  You will
     need about 180k of free space on Drive A.

     You must pay strict attention to the Special Instructions above,
     regarding C/80 configuration.


   Absent Files:

     M80.COM and L80.COM are from Microsoft, and are not part
     of this distribution.  C.COM, STDLIB.REL, CLIBRARY.REL and
     PRINTF.C are from Software Toolworks, and are not part of
     this distribution either.  SUBMIT.COM is a CP/M transient
     command; it came with your computer when you bought it.


   Notes:

      Gammon IV is impossible to implement in any C which does not allow
      functions to be passed as parameters to another function -- K & R must
      be followed on this point!
   
      THIS CODE ASSUMES INTEL 8080 CPU.  Inline code simulates an old,
      archaic version of SetJump() and LongJump(), which are not features
      of C/80 3.1.  Use of inline code means you need 8080 compatibility.

      By isolating the game-playing algorithm into a separately compiled
      module, I have allowed for the possibility that someone else may come
      up with significant improvements in strategy, AND BE GIVEN CREDIT FOR
      THEM, without having to re-design primitive parts of the program.

      The single exception to this rule is the code which decides when the
      computer will offer, accept or reject the doubling cube; that is
      considered primitive, even though the cube is a major factor in human
      strategies when playing for blood or money.  Gammon IV always plays
      for the simple fun of aggravating humans, so cube tactics are neither
      daring nor profound.  Gammon IV does not bluff with the cube; if it
      offers the cube, it is almost sure to win.

*****************************************************************************/

#define TRUE 1
#define FALSE 0
#define ME 1
#define YU 2
#define YRBAR 0
#define MYBAR 25
#define YRHOME 26
#define MYHOME 27
#define ERROR 999  /* anything well out of range */
#define MYLEVEL 2

/* put CRT stuff first so version differences won't affect it */
#asm
;
;  Note: Assumes assembly by M80.COM
;
;  *========================= CRT Module =========================*
;  *                                                              *
;  * User Patch Area:  ALL DB STRINGS MUST TERMINATE WITH A NULL  *
;  * Use contiguous data area for all console functions, so user  *
;  * may configure the program for some terminal not a Kaypro 10  *
;  *                                                              *
;  * CLEAR SCREEN and GOTOXY are Required Minimum Functions       *
;  * CRTNIT, CRTXIT, CURSON, CURSOF are Optional and Recommended  *
;  *                                                              *
;  * The tokens TK1..TK4 comprise two sets each of playing tokens *
;  * for the computer & human player.  24 bytes are reserved for  *
;  * EACH token, so that users may turn on video enhancements --  *
;  * see the Kaypro '84 recommended settings for examples.        *
;  *                                                              *
;  * The tokens TK5..TK8 and the KRTNIT, etc. strings implement   *
;  * the Control-K command to toggle the Kaypro '84 display.      *
;  * These should only be patched if you are configuring for two  *
;  * levels of terminal characteristics, as vis-as-vis the "old"  *
;  * and "new" Kaypro terminals.  These two levels must use the   *
;  * same basic protocols for cursor address and clear screen.    *
;  *                                                              *
;  * Command Strings must terminate with 0, and the 0 byte CANNOT *
;  * be sent to the console.  0 is INCLUDED in the reserved area. *
;  *                                                              *
;  * GAMMON IV no longer uses any console command function not    *
;  * specifically mentioned here.  In particular, the clear-to-   *
;  * end-of-line function is now handled in a more general way.   *
;  *==============================================================*
;
;  Gammon IV.09 (Universal Version) User Patch Area, D.C.OSHEL, 6/15/85
;----------------------------------------------------------------------------
;
; * REQUIRED *
; reserve 24 bytes apiece for the players' tokens (must terminate with 0)
; these settings are recommended for Lear Siegler ADM-3A (old Kaypros)
;
	 DB 'USER PATCH AREA '
	 DB 'ALL STRINGS MUST HAVE ZERO TERMINATOR->'
	 DB 'TOKEN1:'
TK1:	 DB '(',')',0,0,0,0,0,0  	 ; computer's token, ()
	 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	 DB 'TOKEN2:'
TK2:	 DB '[',']',0,0,0,0,0,0  	 ; player's token, []
	 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	 DB 'TOKEN3:'
TK3:	 DB 'q','b',0,0,0,0,0,0  	 ; computer's token (alternate, qb )
	 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	 DB 'TOKEN4:'
TK4:	 DB 'C','3',0,0,0,0,0,0  	 ; player's token (alternate, C3 )
	 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;----------------------------------------------------------------------------
;
; * Optional *
; reserve 8 bytes apiece for the OPTIONAL console function strings
; patch the first byte to 0 for each function NOT implemented
;
	 DB 'CRTNIT:'
CRTNIT:  DB 0,0,0,0,0,0,0,0		 ; crt init, e.g., video mode on
	 DB 'CRTXIT:'
CRTXIT:  DB 0,0,0,0,0,0,0,0		 ; crt exit, e.g., video mode off
	 DB 'CURSON:'
CURSON:  DB 0,0,0,0,0,0,0,0		 ; cursor ON  (show cursor)
	 DB 'CURSOF:'
CURSOF:  DB 0,0,0,0,0,0,0,0		 ; cursor OFF (hide cursor)
;----------------------------------------------------------------------------
;
; * REQUIRED *
; clear screen and gotoxy (0,0 is top left of screen) are NOT optional
; default settings are for the Lear Siegler ADM-3A terminal (old Kaypros)
;
	 DB 'CLS->'
CLS: 	 DB 26,0,0,0,0,0,0,0		 ; clear screen command
	 DB 'GOTOXY->'
GOXY:	 DB 27,'=',0,0,0,0,0,0		 ; cursor address prefix
	 DB 'YB4X BYTE:'
YB4X:	 DB 1	;BYTE 1 = YX: Send Row, Then Col (ADM-3A); 0 = XY: Col, Row
	 DB 'XOFS BYTE:'
XOFS:	 DB 32	;BYTE offset to add to x in gotoxy sequence (ADM-3A = 20H)
	 DB 'YOFS BYTE:'
YOFS:	 DB 32	;BYTE offset to add to y in gotoxy sequence (ADM-3A = 20H)
;
; these strings must terminate with 0, and 8 bytes are reserved for each
;
;
;----------------------------------------------------------------------------
;: The following strings implement the Control-K command for Kaypro '84
;: video able terminals.  
;----------------------------------------------------------------------------
;:  
;: * Kaypro '84 *
;: recommended tokens for the video able Kaypro '84s (10s, 4'84s, etc)
;: the second set requires that "video mode" be set in the CRTNIT string
;: the first set uses Kaypro underline, inverse and low intensity commands
;: to form the players' stones (24 bytes are reserved for each token)
;:
	 DB 'ENHANCED ALTERNATES->'
	 DB 'TOKEN5:'
TK5:	 DB 27,'B1'	 ; computer's token
	 DB 27,'B0'
	 DB 27,'B3'
	 DB '><'
	 DB 27,'C3'
	 DB 27,'C0'
	 DB 27,'C1'
	 DB 0,0,0,0
	 DB 'TOKEN6:'
TK6:	 DB 27,'B3'	 ; player's token
	 DB 27,'B0'
	 DB '[]'
	 DB 27,'C0'
	 DB 27,'C3'
	 DB 0,0,0,0,0,0,0,0,0,0
	 DB 'TOKEN7:'
TK7:	 DB 128,233,129,150,0,0,0,0  	 	; computer's "black chiclet"
	 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	 DB 'TOKEN8:'
TK8:	 DB 128,253,129,190,0,0,0,0  	 	; player's "white chiclet"
	 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;
;----------------------------------------------------------------------------
;:
;: * Kaypro '84 *
;: recommended settings for Kaypro '84s (strings must terminate with 0)
;:
	 DB 'KRTNIT:'
KRTNIT:  DB 27,'B5',0,0,0,0,0		 ; crt init, e.g., video mode on
	 DB 'KRTXIT:'
KRTXIT:  DB 27,'C5',0,0,0,0,0		 ; crt exit, e.g., video mode off
	 DB 'KURSON:'
KURSON:  DB 27,'B4',0,0,0,0,0		 ; cursor ON  (show cursor)
	 DB 'KURSOF:'
KURSOF:  DB 27,'C4',0,0,0,0,0		 ; cursor OFF (hide cursor)
	 DB '<-END USER PATCH AREA'
;----------------------------------------------------------------------------
;	LOF LG
#endasm

static int kaypro;

get1tkn() {
#asm
	LXI H,TK1	;load string pointer for token 1
#endasm
}

get2tkn() {
#asm
	LXI H,TK2	;load string pointer for token 2
#endasm
}

get3tkn() {
#asm
	LXI H,TK3	;load string pointer for token 3
#endasm
}

get4tkn() {
#asm
	LXI H,TK4	;load string pointer for token 4
#endasm
}

get5tkn() {
#asm
	LXI H,TK5	;load string pointer for token 1
#endasm
}

get6tkn() {
#asm
	LXI H,TK6	;load string pointer for token 2
#endasm
}

get7tkn() {
#asm
	LXI H,TK7	;load string pointer for token 3
#endasm
}

get8tkn() {
#asm
	LXI H,TK8	;load string pointer for token 4
#endasm
}

getcls() {
#asm
	LXI H,CLS
#endasm
}

getcini() {
#asm
	LXI H,CRTNIT
#endasm
}

getcxit() {
#asm
	LXI H,CRTXIT
#endasm
}

getcof() {
#asm
	LXI H,CURSOF
#endasm
}

getcon() {
#asm
	LXI H,CURSON
#endasm
}

getkini() {
#asm
	LXI H,KRTNIT
#endasm
}

getkxit() {
#asm
	LXI H,KRTXIT
#endasm
}

getkof() {
#asm
	LXI H,KURSOF
#endasm
}

getkon() {
#asm
	LXI H,KURSON
#endasm
}

gotoxy(x,y) int x,y; {  /* this is solid gold! */
#asm
	POP H		; get return address
	POP D		; get Y
	POP B		; get X
	PUSH B  	; restore all to keep C happy
	PUSH D		; ditto
	PUSH H		; ditto
;
	LXI H,GOXY	; blast out the prefix 
	CALL STOUT
;
	LDA YB4X	; sending row, i.e. Y, first?
	ORA A
	JZ @X1		; no, do it the other way
;
	LDA YOFS	; yes indeed, here's Y
	ADD E
	CALL COUT
;
	LDA XOFS	; and here's X
	ADD C
	CALL COUT
	RET		; thank you very much, we're done
	
@X1:	LDA XOFS	; your weird terminal wants X first?  ok
	ADD C
	CALL COUT
;
	LDA YOFS	; now Y
	ADD E
	CALL COUT
	RET		; tyvm, we done
;
STOUT:	MOV A,M		; string pointer in HL on entry, trash A, HL
	ORA A
	RZ
	CALL COUT
	INX H
	JMP STOUT
;
COUT:	PUSH H		; char in A on entry, disturb nothing
	PUSH D
	PUSH B
	PUSH PSW
	MVI C,6
	MOV E,A
	CALL 5
	POP PSW
	POP B
	POP D
	POP H
	RET
#endasm
/* using this C code instead of inline will slow things down perceptibly */
/*	puts( getprfx() );
	if  ( ybefore() ) {
		putc(y + getyofs(),0); putc(x + getxofs(),0);
	}
	else {
		putc(x + getxofs(),0); putc(y + getyofs(),0);
	}
*/
} /* end: gotoxy */


crtinit()     { 
	if (kaypro) puts( getkini() );
	else puts ( getcini() ); 
}  /* here, turn 2 byte graph chars on */

crtexit()     { 
	if (kaypro) puts( getkxit() );
	else puts ( getcxit() ); 
}  /* and off again on exit...         */

clr_screen()  { puts ( getcls() );  }  /* standard */

on_cursor()   { 
	if (kaypro) puts( getkon() );
	else puts ( getcon() );  
}  /* optional "hide cursor" command   */

off_cursor()  { 
	if (kaypro) puts( getkof() );
	else puts ( getcof() );  
}  /* optional "show cursor" command   */


#include "printf.c"

extern char *bgversion;

char *backtalk[] = {
	"VILLIERS:  At your service!",
	"LOUISA:  Delighted!",
	"TORVE:  Is interesting line of occurrence.  Thurb!",
	"Copyright (c) 1985 by The Xochitl Sodality Wonders & Marvels Committee",
	};

int list[2][28];  /* two dice, two lists */

struct board { 
	int stones,  /* number of stones on that point */
	    owner,   /* and whose they are */
	    x,y,         /*  x and y coordinates of point base */
	    lastx,lasty, /* last location drawn on this point */
	    cx,cy;       /* coordinates for column numbers */
	}
	point[28], bdsave[28]; /* 24 points, plus 2 bars, 2 homes */


struct { int cube, whosecube; } doubles;


struct { int fr,to,flag; } pending;


int level, dice[2], myscore, yrscore, player, movesleft, cantuse, myturns,
    swapped, tswap, deciding, expert, tone, show, moremsgline, 
    firstmove, helpdisabled, yrdice, lookforit, startcubevalue;

char *token1, *token2, chatter[80], buzzard[8];

/*======================================================================

  OPPONENT -- A little scenario, in which to select level of play

========================================================================*/


char *chooseplayer() {
int ch; char *q;

	dissemble();
loo:	ch = getkey();
	switch (ch) {
		case 'A':
		case 'V': { level = 0; break; }
		case 'L':
		case 'P': { level = 1; break; }
		case 'T': { level = 2; break; }
		default:  goto loo;
	}
	q = backtalk[ level ];
	clr_screen(); draw_board(q);
	return(q);

} /* end: chooseplayer */

/*====================================================================
                              MAIN
======================================================================*/

main() {
static int ch;
static char *p1 = "P(lay, R(everse, S(wap, A(rrange, N(ew, G(raphic, Q(uit ",
	    *p2 = "U(se %s dice, O(pponent, X(pert, B(eep, C(ount, Z(ero ",
	    *myline;

	level = MYLEVEL + 1; /* fetch copyright notice */
	setup(); 
        hint();

	while (TRUE) {
		moremsgline = FALSE;  /* show first command line on entry */
		debug(""); /* erase messages */
		myline = backtalk[ level ];  /* did level change? */
		msg( myline );
		firstmove = TRUE;
		newboard(); /* note, sets starting cube value to 1 */

		deciding = TRUE;
		while (deciding) {

		/* display command line */

		off_cursor(); 
		if (show) { mytotal(); yrtotal(); }
		else { gotoxy(0,3); puts("   "); gotoxy(0,19); puts("   "); }
		if (tone) beep();
		if (expert) msg("Your pleasure? ");
		else {
			msg("Select:  ");
			if (moremsgline) printf(p2,(yrdice? "my": "your")); 
			else printf(p1); 
		}

		/* get response and do it */


		ch = getkey();
		switch (ch) {
			case 'Q': {  /* quit play, exit to CP/M */
				finishup(); 
				break; 
				}
			case 'A': {  /* arrange stones (or cheat?) */
                                /* play is suspended, so don't use the long */
                                /* messages that assist game play */
				helpdisabled = TRUE;
				arrange();
                                update();
                                debug("");
				break;
				}
			case 'R': {  /* mirror board image */
				reverse();
				update();
				break;
				}
			case 'C': {  /* show mytotal, yrtotal counts */
				show ^= TRUE;
				break;
				}
			case 'S': {  /* SWAP Command - exchange stones */
				swaptokens();
				update(); 
				break;
				}
			case 'B': { /* kill the beep */
				tone ^= TRUE; break;
				}
                        case 'X': /* expert mode toggle(s) */ 
			case 27 : {
				expert ^= TRUE; 
				break;
				}
			case 'D': {  /* use my dice or your dice? */
			case 'U':
				yrdice ^= TRUE;
				break;
				}
			case 'O': {  /* change opponents and skill level */
				myline = chooseplayer();
				deciding = FALSE;
				break;
				}
			case 'P': {  /* play the game as board is arranged */
				helpdisabled = FALSE;
				if (level > MYLEVEL ) {
					myline = chooseplayer();
					update();
				}
				play(); 
				break;
				}
                        case 'G':  /* graphic screen switch, same as: */
			case 11: { /* control-K, toggle Kaypro '84 display */
				crtexit();
				kaypro ^= TRUE;
				crtinit();
				swaptokens(); swaptokens();
				swaptokens(); swaptokens();
				update();
				break;
			}
			case 'N': {  /* abandon game without quitting */
				deciding = FALSE; player = 0;
				break;
				}
			case 'Z': { /* zero the score */
				myscore = yrscore = 0; putscore();
				break;
				}
			default:  { moremsgline ^= TRUE; break; }
		}}
	}
} /* end: main */




/*=======================================================================

   PLAY Command - this is the command that initiates the 2-player game

=========================================================================*/

play() {

/* any vars here MUST be STATIC */

#asm
	MOV	B,H	;set up to exit this function by saving caller's
	LXI	H,0	;stack pointer for use in deeply-nested scope
	DAD	SP	;WARNING: this function must not use dynamic variables
	SHLD	_fool	;CAUTION: risky business if called with parameters??
	MOV	H,B	;HL is restored on general principles, BC is trashed
#endasm

	whofirst(); 
	taketurns();

} /* end: play */



whofirst() {
int ch, myval, yrval;

	if (yrdice || (player < 0)) {        /* board has been re-arranged */
		msg("Is it my "); puts(token1);
		puts(" turn or your "); puts(token2);
		puts(" turn? ");
	loo:	ch = toupper(getc(0));
		if (!(ch == 'M' || ch == 'Y')) goto loo;
		if (ch == 'M') player = YU;  /* player says Me, of course! */
		else player = ME;
		rolldice(player);
	}

	else if (player == 0) {  /* fresh start, roll the dice */
		barcube();
	zoo:	debug("Tossing for first turn...");
		wipedice();
		rolldice(ME);
		myval = dice[0];
		rolldice(YU);  
		yrval = dice[0];
		if (myval == yrval) {
			if (tone) beep();
                        off_cursor();
                        gotoxy(37,11); puts("[___]"); sleep(3);
                        startcubevalue *= 2;
                        if (startcubevalue > 8) startcubevalue = 8;
			doubles.cube = startcubevalue;
			gotoxy(37,11);
			if (doubles.cube < 16) printf("[ %d ]",doubles.cube);
			else printf("[%03d]",doubles.cube); 
                        if (startcubevalue < 9) {
			    msg("Double the cube!");
			    sleep(20);
                        }
			goto zoo;
		}
		else if (myval < yrval) player = YU;
		else player = ME;
		dice[0] = max(myval,yrval); dice[1] = min(myval,yrval);
	}
	/* otherwise, continue with last dice rolled as play is resumed */

} /* end: whofirst */


getmove() {  
static int i, ch, temp, happy;

	cantuse = ERROR;  /* important for human player in tellmove */
	movesleft = 2;
	if (dice[0] == dice[1]) movesleft += 2;
	temp = movesleft;		

	getlist(); saveboard(); lookforit = TRUE;

	if ( nomove() ) {
		debug("All "); 
		if (player == ME) puts("my"); else puts("your");
		puts(" moves are blocked!");
		if (player == YU) sleep(20);
		return;
	}


	if (player == ME) {
		/* handle doubles as two consecutive, independent moves */
		setchat("I move"); debug(chatter);
		if (movesleft == 4) myturns = 2; else myturns = 1;
		clrpend();
		while (myturns > 0) {
			cantuse = ERROR;
			movesleft = 2;
			while (movesleft > 0) { getlist(); mymove(); }
			myturns--;
		}
		strcat(chatter,"\008."); debug(chatter);
	}
	else {  /* allow the human to take back a bad board position */
		happy = FALSE;
		while (!happy) {
			while (movesleft > 0) { getlist(); yrmove(); }
			msg("All ok?  Y/N ");
			do {
				ch = getkey();
			} while (ch != 'N' && (ch != 'Y' && ch != '\n'));
			if ( ch == 'N' ) {
				msg("Ok, as it was...");
				restoreboard();
				update();
				movesleft = temp;
				cantuse = ERROR;
			}
			else happy = TRUE;
			debug("");
		}
	}

} /* end: getmove */



taketurns() { 

	while (TRUE) {  /* NO EXIT!  Only a Win or player ESC can exit */

		getmove();
		player = other(player);
		if ( player == ME ) {
			if ( endgame() ) {
				if (topstone(ME) < 6 && cubeval()) idouble();
				else if ( mytotal() < (yrtotal() - 8) ) {
					idouble();
				}
			}
			else if ( bearoff() ) idouble();
		}
		rolldice (player); 
	}

} /* end: taketurns */





/*=============================================*/
/*     Y O U R   M O V E                       */
/*=============================================*/

tellmove() {  /* show what the player's current dice are */
int k,n;

	n = movesleft;
	debug("You "); 
	if (!expert) { puts(token2); puts(" "); }
	puts("have "); 
	while (n--) {
		if (dice[0] == dice[1]) k = dice[0];  /* doubles? */

		else if (cantuse == 1) k = dice[0];
		else if (cantuse == 0) k = dice[1];
		else if (n == 1) k = dice[1];	/* 2 of 2? */
		else k = dice[0];		/* 1 of 2? */

		printf("[%d] ",k);
	}
	puts("left");
	if (expert) puts("."); else puts(", moving from high to low.");

} /* end: tellmove */



yrmove() {

	if ( nomove() ) {
		debug("You have no more moves in this line of play.");
		movesleft = 0;
		return;
	}
	else {
loo:		tellmove();
		if (!getyrmove()) {
                     hint(); 
                     goto loo;
                }
		debug("");
	}

} /* end: yrmove */



hint() {
    if (!expert) { 
        debug("HELP, BAR and HOME are useful words in this game.");
        sleep(10);
    }
} /* end: hint */



nomove() {
int i,j;
	for (i = 0; i < 2; i++)
		for (j = 0; j < 28; j++)
			if (list[i][j] != ERROR) return (FALSE);
	return (TRUE);
} /* end: nomove */



getyrmove() {  
int fpoint, tpoint;


	firstmove = FALSE; /* I got it, I got it! */

	msg("Move from? ");
	fpoint = getpt(YRBAR,YRHOME);
	if ( fpoint == ERROR ||
	     (list[0][fpoint] == ERROR && list[1][fpoint] == ERROR)) {
			return (FALSE);
	}
	puts(" To? ");
	tpoint = getpt(YRBAR,YRHOME);
	if ( tpoint == ERROR || 
	     (list[0][fpoint] != tpoint && list[1][fpoint] != tpoint)) {
			return (FALSE);
	}

	movestone( fpoint, tpoint );
	if (movesleft < 2) {
		if (list[0][fpoint] == tpoint) cantuse = 0;
		else cantuse = 1;
	}
	return (TRUE);

} /* end: getyrmove */



/*====== Functions That Make The Selected Move ======*/


setchat( p ) char *p; {
	strcpy(chatter,p);
} /* end: setchat */



putdice( f,t) int f,t; {
static char q[15];
	if (t == MYHOME) sprintf(q," %d to Home,",25 - f);
	else if (f == MYBAR) sprintf(q," Bar to %d,",25 - t);
	else sprintf(q," %d to %d,",25 - f, 25 - t);
	strcat(chatter,q);
	debug(chatter);  /* avoid using save_cursor() */
} /* end: putdice */



lurch( f, t, zlist ) int f, t, zlist; {
	movestone( f, t );   /* move the stone */
	putdice(f,t); 	     /* tell user, the action is a bit fast */
	if (movesleft < 2) cantuse = zlist;
} /* end: lurch */



/*****************************/
/* must LINK to GAMEPLAN.REL */
/*****************************/



/*==========================================================================

  GETLIST -- Find the possible moves for any particular throw of the dice

===========================================================================*/


checkpips( whichlist, ptimon, pips, tops ) 
int whichlist, ptimon, pips, tops; {
static int j,k;

	if ( !ptimon ) {
		j = whosebar(player); 	/* 0 if you, 25 if me  */
		k = abs(j - pips);
	}
	else if (player == ME) {
		j = ptimon;
		k = j - pips;
		if (k < 1) k = MYHOME;
	}
	else {
		j = 25 - ptimon;
		k = j + pips;
		if (k > 24) k = YRHOME;
	}

	if (point[j].stones > 0 && point[j].owner == player) {

		/* no move to a blocked point */
		if (point[k].owner != player && point[k].stones > 1)
			return;

		/* no move home if i can't bear off yet */
		if (k == whosehome(player) && cantbearoff(j,pips,tops)) 
			return;

		/* no other move is allowed if i'm on the bar */
		if (tops == 25 && j != whosebar(player))
			return;

		/* the move is legal (but maybe not optimal) */
		list [whichlist] [j] = k;
	}

} /* end: checkpips */



build( whichlist, pips ) int whichlist, pips; {
int i, tops;

	if (whichlist == cantuse) return;
	tops = topstone(player);
	for (i = 0; i < 25; i++) checkpips( whichlist, i, pips, tops );

} /* end: build */



getlist() {  /* find all legal moves using these dice */
static int i, j;

	for (i = 0; i < 2; i++)  /* initialize the lists */
		for (j = 0; j < 28; j++)
			list [i] [j] = ERROR;

	build( 0, dice[0] ); /* usually the low die  */
	build( 1, dice[1] ); /* usually the high die */

} /* end: getlist */



/*==========================================================================

  EVALUATE UTILITIES -- Functions for legal and/or best play, telling who's
			who, who's ahead, who won, etc. etc.

============================================================================*/



mytotal() {
int i, cnt;

	cnt = 0;
	for (i = 0; i < 26; i++) {
		if (point[i].owner == ME) cnt += point[i].stones * i;
	}
	if (show) {
	gotoxy(0,3); printf("%03d",cnt); 
	}
	return (cnt);

} /* end: mytotal */


yrtotal() {
int i, cnt;

	cnt = 0;
	for (i = 0; i < 26; i++) {
		if (point[i].owner == YU) cnt += point[i].stones * (25 - i);
	}
	if (show) {
	gotoxy(0,19); printf("%03d",cnt); 
	}
	return (cnt);

} /* end: yrtotal */



topstone( who )  int who; {
static int i,j;

	if (point[ whosebar( who ) ].stones > 0) i = 25;
	else {
		i = 24;
		while (i > 0) {
			if (who == ME) j = i; else j = 25 - i;
			if (point[j].stones > 0 &&
			    point[j].owner == who) return (i);
			--i;
		}
	}
	return (i);  /* return normalized value, 1 - 25, 0 is home */

}  /* end: topstone */



cantbearoff( mypt, pips, tops ) int mypt, pips, tops; {

	/* My destination is Home, but can I do it??? */
	if (mypt > 6) mypt = 25 - mypt;  /* normalize inner table */

	/* I can't bear off if there's anybody still not in my inner table */
	if (tops > 6) return (TRUE);

	/* If I'm the highest blot in my own table, I CAN bear off */
	if (tops == mypt) return (FALSE);

	/* If I'm NOT high, I have to have an exact roll to get away with it */
	return ( (mypt != pips) );

} /* end: cantbearoff */



whosebar( who ) int who; {
	return ( (who == ME? MYBAR: YRBAR) );
}



whosehome( who ) int who; {
	return ( (who == YU? YRHOME: MYHOME) );
}



checkwin() {  
	if (mytotal() == 0) winner(ME, topstone(YU));
	if (yrtotal() == 0) winner(YU, topstone(ME));
} /* end: checkwin */


other( color ) int color; {

	if (color == ME) return (YU); else return (ME);

} /* end: otherplayer */




winner( who, high ) int who, high; {
int gammon; char ch;

	if (tone) beep();
	if (point[ whosehome( other(who) )].stones > 0) gammon = 1;
	else gammon = 2;			/* nothing off is a gammon! */
	if (high == 0) gammon = 1;		/* someone doubled */
	else if (high > 18) gammon = 3; 	/* backgammon! */


	debug("");
	if (who == ME) puts("I"); else puts("You"); puts(" win"); 
	switch (gammon) {
		case 1: { puts("!"); break; }
		case 2: { puts(" a Gammon!"); break; }
		case 3: { puts(" a Backgammon!"); break; }
	}
	gammon *= doubles.cube;
	switch (who) {
		case ME: { myscore += gammon; break; }
		case YU: { yrscore += gammon; break; }
	}
	putscore();
	msg("Hit ESC to resume play"); 
	loo:  ch = getc(0); if (ch != 27) goto loo;
	player = 0;
	reverse(); deciding = FALSE; jumpjack();

} /* end: winner */


putscore() {
	gotoxy(39,0); blanks(39); gotoxy(53,0);
	printf("SCORE:  You %d, Me %d",yrscore,myscore);
} /* end: putscore */




/*========================================================================

  REVERSE Command - allow player to take the opponent's viewpoint of the
                    board layout, mirror the board.  Returns board layout
		    to the arranged position as seen from opposite side.

==========================================================================*/

reverse() {
int cnt1, cnt2, cnt3, cnt4;

	off_cursor();
	cnt1 = point[MYHOME].stones;  /* save counts for erase */
	cnt2 = point[YRHOME].stones;
	cnt3 = point[MYBAR].stones;
	cnt4 = point[YRBAR].stones;

	putstone( MYHOME, 0, 0);  /* erase old trays before update */
	putstone( YRHOME, 0, 0);

	halfswap(1); halfswap(13);

	gotoxy(0,11);  puts("    ");  /* erase HOME message */
	gotoxy(75,11); puts("    ");
	if (point[1].x < 40) {
		point[MYHOME].x = point[YRHOME].x = 0;
	}
	else {
		point[MYHOME].x = point[YRHOME].x = 75;
	}

	point[MYHOME].owner  = point[MYBAR].owner = ME; /* restore counts */
	point[YRHOME].owner  = point[YRBAR].owner = YU;
	point[MYHOME].stones = cnt1;
	point[YRHOME].stones = cnt2;
	point[MYBAR].stones  = cnt3;
	point[YRBAR].stones  = cnt4;

} /* end: reverse */


#asm
	DB 'Gammon IV concept & text graphic rendition by David C. Oshel',0
	DB 'MidSummer''s Day, June 21, 1985',0
	DB 'To Whomever Destroys This Notice -- Nothing Shall Happen, Forever',0
#endasm


halfswap( n ) int n; {
static int i, j, k, o;

	o = n + 6;
	for (i = n; i < o; i++) {
		j = ((o * 2) - 1) - i;
		k = point[i].x;
		point[i].cx = point[i].x = point[j].x;
		point[j].cx = point[j].x = k;
	}

} /* end: halfswap */





getkey() {
int ch;
	ch = getc(0); /* keybounce? */
	while ( (ch = toupper(getc(0))) == 0 ) acg(); return (ch);
} /* end: getkey */


wipedice() {
static char *s = "                  ";

	off_cursor();
	gotoxy(47,11); puts(s);	 /* erase dice roll messages */
	gotoxy(12,11); puts(s);	

} /* end: wipedice */



update() {
int i, x, c;

	for (i = 1; i < 25; i++) {
		gotoxy(point[i].cx,point[i].cy);
		printf("%2d",25 - i);
	}
	if (doubles.whosecube == YU) yrcube(doubles.cube); 
	else if (doubles.whosecube == ME) mycube(doubles.cube);
	else barcube();
	for (i = 0; i < 28; i++) {
		x = point[i].stones;
		c = point[i].owner;
		putstone(i,x,c);
	}
	if (point[1].x < 40) x = 0; else x = 75;
	gotoxy(x,11); puts("HOME");

	putscore(); mytotal(); yrtotal();

} /* end: update */


dissemble() {

	clr_screen();  

puts("You are a passenger in the \"Orion\" bound for STAR WELL, a slightly disreputable\n");
puts("planetoid in the Flammarion Rift, where you have a scheduled layover of several\n");
puts("hours.  You enter the Casino there, desperately bored.  Your attention is \n");
puts("immediately drawn to an unusual trio.  Your instinct for good company (they \n");
puts("are playing Backgammon) leads you easily into a round of introductions:\n");
puts("\n");
puts("LOUISA PARINI -- A young woman who gives you the uncomfortable feeling that she\n");
puts("is even younger than she looks.  In fact, she is the offspring of a clan of\n");
puts("noted interstellar jewel thieves and con artists, on her way to a famous\n");
puts("girl's finishing school on Nashua.  She has larceny in her soul, but she is on\n");
puts("holiday.  Do not underestimate her.  (But you will, of course.  You must.)\n");
puts("\n");
puts("ANTHONY VILLIERS -- A mysterious young fop with impeccable manners, and (you\n");
puts("notice) an even more impeccable dueling saber at his side.  There is something\n");
puts("between Louisa and him.  His conversation is light, witty and just slightly\n");
puts("cynical, but you are not wrong to conclude that this is someone you can trust.\n");
puts("\n");
puts("TORVE THE TROG --  This blue-eyed, golden-furred entity is a member of the most\n");
puts("dangerous and unpredictable race in the galaxy (aside from humans).  You are \n");
puts("amazed that this one is allowed to travel. (In fact, Torve's papers were forged\n");
puts("by a member of Louisa's family and procured for him by Villiers).  Torve is\n");
puts("lost in some inner rapture, emitting soft \"Thurb\"-like noises.\n");
puts("\n(Hit any key to continue)");
getkey();
puts("\015You suggest a friendly game of backgammon, at small stakes, and your\n");
puts("companions agree instantly.  Who will be your opponent?  (L, V, or T) ");

} /* end: dissemble */


/*======================================================================

  ARRANGE Command:  Move stones around in the playing area.  Play will
		    commence with this final arrangement.  Notice, this
		    command allows for cheating because the line input
                    function traps Ctrl-C and executes jumpjack().  Player
		    returns to the command line with the game frozen, may
                    re-arrange as desired, then resume play.  The Ctrl-C
                    trap will increment play level by 1.  The sufficiently
                    stupid player will not notice, and so may lose anyway.
                    Trap implemented in MYLIB2.C, not here.

========================================================================*/


arrange() {  /* whoever calls arrange() must also call update() next */

/* any vars here MUST be STATIC */

#asm
	MOV	B,H	;set up to exit this function by saving caller's
	LXI	H,0	;stack pointer for use in deeply-nested scope
	DAD	SP	;WARNING: this function must not use dynamic variables
	SHLD	_fool	;CAUTION: risky business if called with parameters??
	MOV	H,B	;HL is restored on general principles, BC is trashed
#endasm

        moveabout();

} /* end: arrange */



moveabout() { 

	player = -1;  /* flag to ask who moves first */
	if (!expert)
	   debug("Type BAR or HOME, or the Number of a Point.");

	while ( TRUE ) { /* exit via jumpjack() by typing Control-C   */
           mytotal();
           yrtotal();
           revise();
        }

}  /* end: moveabout */



getpt(b,h) int b,h; {
static char ans[6], *p; int x, d1, d2, look, try;

	on_cursor();
	gets(ans,5);
	p = ans;
	while (*p) *p = toupper(*p++);  /* capitalize string */
 	off_cursor();

	if (!helpdisabled && ((index(ans,"HEL") != -1) || 
			   (index(ans,"?") != -1))) {
		x = ERROR;
		msg("");
		if (point[ whosebar(player) ].stones > 0) {
			puts("You're on the Bar, so let's move that one!  BAR ");
			x = b;
		}
		else {
			puts("Are you ");
			if (cantuse != 0 && cantuse != 1) puts("REALLY ");
			puts("blocked?  Try moving From ");
			look = 24;
			while (look > 0) {
				try = list[0][look];
				if (try == ERROR) try = list[1][look];
				if ( try != ERROR ) {
					printf("%d To ",25-look);
					if (try == YRHOME) printf("HOME");
					else printf("%d",25-try);
					look = 0;
				}
				look--;
			}
			sleep(40);
		}
	}
	else if (index(ans,"B") != -1) x = b;
	else if (index(ans,"H") != -1) x = h;
	else {
		x = atoi( ans );
		if (x < 1 || x > 24) x = ERROR;
		else x = 25 - x;  /* translate human to computer view */
	}
	return (x);

} /* end: getpt */


whoseit(p,a,b) char *p; int a,b; {
int ch;

	if (point[a].stones > 0 && point[b].stones > 0) {
		debug("Whose "); puts(p); puts("?  1 = "); 
		puts(token1);
		puts("  2 = "); puts(token2); puts(" ");
	loo:	ch = getkey();
		if (!(ch == '1' || ch == '2')) goto loo; 

		debug("From "); 
		if (ch == '1') { ch = a; puts(token1); }
		else { puts(token2); ch = b; }
		puts("'s "); puts(p);
		return ( ch );
	}
	else if (point[a].stones > 0) return (a);
	else if (point[b].stones > 0) return (b);
	else return (ERROR);

} /* end: whoseit */



revise() {
	do {
		setchat("Move a Stone From? ");
		msg(chatter);
	}
	while ( !delightful() );

} /* end: revise */


delightful() {
static int from, to, fcnt, tcnt, fcolor, tcolor; 

	from = getpt(MYBAR,MYHOME);

	sprintf(buzzard,"%d",abs(25 - from));

	if (from == MYBAR) {
		from = whoseit("bar",MYBAR,YRBAR);
		strcpy(buzzard,"BAR");
	}

	if (from == MYHOME) {
		from = whoseit("home",MYHOME,YRHOME);
		strcpy(buzzard,"HOME");
	}

	if (from == ERROR) {
                debug("Type Control-C to quit.");
		return( FALSE );
	}

        /*-----------------------------------------------------*/
        /* establish the color of the stones on the from point */
        /*-----------------------------------------------------*/
	fcolor = point[from].owner;

        /*--------------------------------------------------*/
        /* establish the number of stones on the from point */
        /*--------------------------------------------------*/
        fcnt = point[from].stones;

	if (fcnt == 0) {
		debug("What's the point?"); 
                return(FALSE);
	}

	strcat(chatter,buzzard);  /* this avoids use of save_cursor() */
	strcat(chatter," To? ");
	msg(chatter);

	to = getpt(MYBAR,MYHOME);

	sprintf(buzzard,"%d",abs(25 - to));


	if (to == MYBAR) {
		if (fcolor == YU) to = YRBAR;
		strcpy(buzzard,"BAR");
	}

	if (to == MYHOME) {
		if (fcolor == YU) to = YRHOME;
		strcpy(buzzard,"HOME");
	}
	
	if (to == ERROR) {  
		debug("Type Control-C to quit.");
                return(FALSE);
	}

	if (from == to) {
		debug("Quite easily done!"); 
                return(FALSE);
	}

	strcat(chatter,buzzard);

        /*---------------------------------------------------*/
        /* establish the color of the stones on the to point */
        /*---------------------------------------------------*/
	tcolor = point[to].owner;

        /*------------------------------------------------*/
        /* establish the number of stones on the to point */
        /*------------------------------------------------*/
	tcnt = point[to].stones;

	if (fcolor == tcolor || tcolor == 0) {
		msg(chatter);
                --fcnt;
                ++tcnt;
		putstone(from, fcnt, fcolor);  /* one less */
		putstone(to,   tcnt, fcolor);  /* one more */
		debug("");
		return (TRUE);
	}
	else {
		debug("Evict the other stone");
		if (tcnt > 1) puts("s");
		puts(" first!");
		return (FALSE);
	}

} /* end: delightful */


/*==========================================================================

  INITIALIZATION and NEWBOARD commands -- start of a new game, or cold

===========================================================================*/


wipeout() {
static int i;

	player = 0;
	barcube();
	for (i = 0; i < 28; i++) {
		point[i].stones = point[i].owner = 0;
	}
	update();

} /* end: wipeout */


setup() {
static int i, j, k, copyright;

	myscore = yrscore = player = dice[0] = dice[1] = 0;
	kaypro = swapped = tswap = expert = helpdisabled = yrdice = FALSE;
	show = moremsgline = tone = TRUE;

	init_lib();
	OFFinterrupt();  /* enable jumpjack() on ctl-c */
	crtinit();         /* Kaypro video mode on (2-byte graphics) */
	off_cursor();
	token1 = getAtkn();
	token2 = getBtkn();
	copyright = backtalk[ MYLEVEL + 1 ];
	draw_board( copyright );

	for (i = 0; i < 28; i++) {
		point[i].stones = point[i].owner = 0;
		point[i].x = point[i].y = point[i].lastx = point[i].lasty = 0;
		point[i].cx = point[i].cy = 0;
	}

	k = 68;
	for (i = 1; i < 13; i++ ) { /* establish xy coords for the points */
		j = 25 - i;
		point[i].cx = point[j].cx = point[i].x = point[j].x = k; 
		k -= 5;
		point[i].y = 4;
		point[j].y = 18;
		point[i].cy = 2;
		point[j].cy = 20;
		if (k == 38) k -= 5; /* skip over bar */
	}

	point[MYBAR].x  = point[YRBAR].x  = 38;
	point[MYHOME].x = point[YRHOME].x = 75;

	point[MYBAR].y  = point[MYHOME].y =  5;
	point[YRBAR].y  = point[YRHOME].y = 17;

} /* end: setup */



newboard() {
static int i;  

        startcubevalue = 1;
	wipedice(); wipeout();

	putstone( MYHOME, 15, ME  );
	putstone( YRHOME, 15, YU );

	putstone( YRHOME, 13, YU );
	putstone(  1, 2, YU );

	putstone( YRHOME, 8, YU );
	putstone( 12, 5, YU );

	putstone( YRHOME, 5, YU );
	putstone( 17, 3, YU );

	putstone( YRHOME, 0, 0 ); 
	putstone( 19, 5, YU );

	putstone( MYHOME, 10, ME );
	putstone(  6, 5, ME  );

	putstone( MYHOME,  7, ME );
	putstone(  8, 3, ME  );

	putstone( MYHOME,  2, ME );
	putstone( 13, 5, ME  );

	putstone( MYHOME, 0, 0 );
	putstone( 24, 2, ME  );

} /* end: newboard */


draw_board( c ) char *c; {
static int line;
static char *m = "     ", *picture[] = {
"The Peelgrunt Game of GAMMON IV%s\n\n\n",
":=================================o=================================:\n",
":: ..   \\/   ..   \\/   ..   \\/   |||  ..   \\/   ..   \\/   ..   \\/  ::\n",
"::                               |||                               ::\n",
":: /\\   ..   /\\   ..   /\\   ..   |||  /\\   ..   /\\   ..   /\\   ..  ::\n"
};

	clr_screen();
	off_cursor();
	msg( c );
	off_cursor();
	gotoxy(0,0);
	puts(m); printf(picture[0],bgversion);
	puts(m); puts(picture[1]);
	for (line = 0; line < 6; line++) { 
		puts(m); puts(picture[2]);
	}
	puts(m); puts(picture[3]);
	puts(m); puts(picture[3]);
	puts(m); puts(picture[3]);
	for (line = 0; line < 6; line++) {
		puts(m); puts(picture[4]);
	}
	puts(m); puts(picture[1]);

} /* end: draw_board */


/*=========================================================================

  DICE Commands:  How to roll the dice

===========================================================================*/


peek() {
	if (yrdice) return;  /* you know your own dice, probably...? */
	if (expert) debug("");
	else debug("The Dice will Rattle until you Roll.  Now on ");
	getdice();
	printf("[%d] [%d] ...",dice[0],dice[1]);
} /* end: peek */


getonedie() {
	return ( (abs(acg()) % 6) + 1 );
} /* end: getonedie */


fixup() {	/* ensure that the low die is in dice[0] */
int d,e;
	if (player == 0) return;  /* whofirst?  don't mess with the odds */
	d = min(dice[0],dice[1]);
	e = max(dice[0],dice[1]);
	dice[0] = d;
	dice[1] = e;
} /* end: fixup */


getdice() {
int ch;

        /* if it's MY dice we're using, generate random dice... */
	if (!yrdice) {
		dice[0] = getonedie(); 
		acg();    /* bounce a little for luck */
		dice[1] = getonedie();
		fixup();
		return;
	}

        /* but if it's YOUR dice, then ask about the roll... */
zoo:	msg("<> ");
	if (player == ME) puts("My"); else puts("Your");
	puts(" roll: ");
	if (!expert) puts("\008\008, using your dice: ");
	puts(" First? ");
loo:	while ( (ch = getc(0)) == 0 );  /* don't bother acg */
	if (ch == 3) haltgame();
	ch -= '0';
	if (ch < 1 || ch > 6) goto loo;
	putc( ch + '0',0);
	dice[0] = ch;

	puts("  Second? ");
	while ( (ch = getc(0)) == 0 );
	if (ch == 3) haltgame();
	ch -= '0';
	if (ch < 1 || ch > 6) goto zoo;
	putc( ch + '0',0);
	dice[1] = ch;

	puts("  All Ok? ");
roo:	while ( (ch = toupper(getc(0))) == 0 );  /* don't bother acg */
        if (ch == 3) haltgame();
	if (ch != 'N' && ch != 'Y') goto zoo;
	fixup();

} /* end: getdice */



haltgame() {
        player = -1;  /* if play resumes, ask whose roll it is */
        hint();
        jumpjack(); 

} /* end: haltgame */



rolldice( who ) int who; {
int waiting;

	setchat("Your Turn: ");
	if (!expert) {
		if (!yrdice) strcat(chatter," P(eek,"); 
		strcat(chatter," D(ouble, Q(uit, or <AnyKey> to Roll ");
	}
	if (player == YU) {  /* not executed if player == 0, i.e., whofirst */
		waiting = TRUE; 
		while (waiting) {
			msg(chatter);
			switch ( getkey() ) {
                            /* bailout is Ctrl-C instead of ESCape */
				case  3 : { haltgame(); break; }
				case 'P': { peek(); break; }
				case 'D': { udouble(); break; }
				case 'Q': { winner(ME,topstone(YU)); break; }
				default : waiting = FALSE;
		}	}
		off_cursor(); debug(""); msg("");
	}
	highroller(who);

} /* end: rolldice */

highroller( who ) int who; {  /* parameter is not redundant */
static int y = 11;
static int xme, xyu;

	/* get the values for two dice, either yours or mine */

	getdice();

	/* display the values of the dice in the board area */

	off_cursor();
	xme = 47; xyu = 12;    /* decide which half to show the values in */ 
	if (point[1].x > 40) { 
		xme = 12; 
		xyu = 47; 
	}
	if (player) {
		gotoxy(xyu,y); blanks(18); /* erase, if not whofirst */
		gotoxy(xme,y); blanks(18);
	}
	if (who == ME) {
		gotoxy(xme,y); puts("My");
	}
	else {
		gotoxy(xyu,y); puts("Your");
	}
	printf(" Roll> [%d] ",dice[0]);
	if (player) printf("[%d] ",dice[1]); /* whofirst doesn't show this */

} /* end: highroller */





/*========================================================================

  MAJOR UTILITIES -- Miscellaneous functions sans which the game will not
                     proceed so well as otherwise..........

========================================================================*/

jumpjack() {	/* Much too simple-minded LONGJUMP.  (But it IS simple!)
		   CAUTION: C/80 has no idea what's going on here! 
		   The in-line assembly which sets _fool MUST NOT be in
		   a function which uses dynamic variables, or the stack 
		   will be disrupted.  See arrange() and play() herein. */
#asm
	LHLD	_fool	;Retrieve old stack status...
	SPHL		;...diddle stack pointer
	RET		;...and execute the ad hoc jump back to outer loop

_fool:	DS	2	;stack pointer is saved by doit(), read and used here

#endasm
} /* end: jumpjack */



acg() {  /* additive congruential generator for pseudo-random numbers */
static int arg[] = {
		4292,	60,	4947,	3972,	4489,
		1917,	3916,	7579,	3048,	6856,
		1832,	7589,	1798,	4954,	2880,
		5142,	5187,	3045,	1529,	3110,
		4333,	167,	5556,	7237,	5906,
		5419,	6632,	5833,	3760,	1081,
		1434,	80,	6212,	344,	7303,
		3044,	7675,	5420,	457,	3434,
		2657,	700,	6777,	4436,	620,
		2129,	629,	3550,	1639,	4546,
		1220,	6469,	862,	3280,	4664
	};
static int rp1 = 0, rp2 = 32;

	rp1++; 
	rp2++;  
	rp1 %= 55; 
	rp2 %= 55;
	arg[rp1] ^= arg[rp2];
	return ( arg[rp1] );
	
} /* end: acg */

finishup() {
	crtexit(); on_cursor(); /* restore for user */
	exit();
}

saveboard() {
int i;
	for (i = 0; i < 28; i++) {
		bdsave[i].stones = point[i].stones;
		bdsave[i].owner  = point[i].owner;
	}
} /* end: saveboard */

restoreboard() {
int i;
	for (i = 0; i < 28; i++) {
		point[i].stones = bdsave[i].stones;
		point[i].owner  = bdsave[i].owner;
	}
} /* end: restoreboard */


getAtkn() {
	if (kaypro) return( get5tkn() );
	else return( get1tkn() );
}
getBtkn() {
	if (kaypro) return( get6tkn() );
	else return( get2tkn() );
}
getCtkn() {
	if (kaypro) return( get7tkn() );
	else return( get3tkn() );
}
getDtkn() {
	if (kaypro) return( get8tkn() );
	else return( get4tkn() );
}

swaptokens() {
char *temp;

	swapped ^= TRUE;
	if (swapped) {
		temp = token1;
		token1 = token2;
		token2 = temp;
	}
	else {
		tswap ^= TRUE;
		if (tswap) {
			token1 = getCtkn();
			token2 = getDtkn();
		}
		else {
			token1 = getAtkn();
			token2 = getBtkn();
		}
	}

} /* end: swaptokens */


blanks( n ) int n; {
	while (n--) putc(' ',0);
} /* end: blanks */


msg(p) char *p; {
	on_cursor(); 
	gotoxy(5,23); blanks(74);
	gotoxy(5,23); puts(p); 
}

debug(p) char *p; {
	on_cursor(); 
	gotoxy(5,22); blanks(74);
	gotoxy(5,22); puts(p); return(FALSE);
}


nxtyp(i) int i; {
	if (i > 9) return ( i - 1 ); else return ( i + 1 );
}


isbar(p) int p; {
   return (( p == MYBAR ) || ( p == YRBAR ));
}

ishome(p) int p; {
   return (( p == MYHOME ) || ( p == YRHOME ));
}


putstone( pt, cnt, color ) int pt, cnt, color; {
int i, xp, yp, slack;
char *background, *token;


	if (cnt < 1) { /* empty point has neither stones nor owner */
            cnt   = 0; 
            color = 0;  
        }

	point[pt].stones = cnt;    /* number of stones on this point */
	point[pt].owner  = color;  /* and whose they are */

        /* stack stones 5 high in the home tray, 6 high on the points */
	if (isbar(pt) || ishome(pt)) slack = 5; else slack = 6;

        /* locate the base address of the point for animation */
	xp = point[pt].x;  
	yp = point[pt].y; 


        /* decide on the background pattern to be used for empty places */
	if (pt > 12) background = "/\\  ";  
	else background = "\\/  ";

	if (point[1].x < 40) {
		if ((pt % 2) == 1) background = "..  ";
	}
	else if ((pt % 2) == 0) background = "..  ";

	if (ishome(pt))    background = "    ";
	if (isbar(pt))     background = "||| ";

        /* get the token pattern to be used */
	if (color == ME) {
		token = token1;  
	}
	else {
		token = token2;
	}

        /* draw the entire point with token and background patterns */
	off_cursor();

	/* first erase all blots from this point (draw the background) */
		for (i = 0; i < slack; i++) {
			gotoxy(xp,yp);
			puts(background);     /* string has point's width */
			point[pt].lastx = 0;  /* future, not implemented */
                        point[pt].lasty = 0;
			yp = nxtyp(yp);
		}

	/* now draw all the blots there are on this point onto the point */
		for (i = 0; i < cnt; i++) {
			xp = point[pt].x + (i / slack);
			if ((i % slack) == 0) yp = point[pt].y;
			gotoxy(xp, yp);
			puts(token);
			point[pt].lastx = xp;  /* future, not implemented */
			point[pt].lasty = yp;
			yp = nxtyp(yp);
		}

} /* end: putstone */



hitblot( from, color ) int from, color; {
static int barpt, addone;

	if (tone) beep();
	barpt = whosebar( color );
	putstone(from, 0, 0);
	addone = point[barpt].stones + 1;
	putstone( barpt, addone, color );

} /* end: hitblot */



movestone( from, to) int from, to; {
static int opponent, subone, addone;


	opponent = other( player );
	if (point[to].owner == opponent) hitblot(to, opponent);

	subone = point[from].stones - 1;
	addone = point[to].stones + 1;

	putstone(from, subone, player);
	putstone(to, addone, player);

	--movesleft;
	checkwin();  /* never but NEVER let a win go unnoticed! */

} /* end: movestone */



/*========================================================================

  CUBE Commands -- commands related to the cube, doubling, etc.

=========================================================================*/

notyrcube() {
	gotoxy(75,19); blanks(5);
	gotoxy(75,20); blanks(5);
} /* end: notyrcube */


notmycube() {
	gotoxy(75,2); blanks(5);
	gotoxy(75,3); blanks(5);
} /* end: notmycube */


barcube() {
        /* startcubevalue is normally 1, but it may have doubled */
        /* if the opening rolloff for first turn came up doubles */
	doubles.cube = startcubevalue;
	doubles.whosecube = 0;
	notmycube(); notyrcube();
        gotoxy(37,11);
        if (startcubevalue == 1) puts("[BAR]");
	else if (doubles.cube < 16) printf("[ %d ]",doubles.cube);
	else printf("[%03d]",doubles.cube); 
} /* end: barcube */



notbarcube() {
	gotoxy(37,11); puts(" BAR ");
} /* end: notbarcube */


mycube(value) int value; {
	notbarcube(); gotoxy(75,2); puts("CUBE");
	gotoxy(75,3); 
	sprintf(buzzard,"[%d]",value); 
	printf("%-5s",buzzard);
	doubles.whosecube = ME;

} /* end: mycube */



yrcube(value) int value; {
	notbarcube; gotoxy(75,19); puts("CUBE");
	gotoxy(75,20); sprintf(buzzard,"[%d]",value); 
	printf("%-5s",buzzard);
	doubles.whosecube = YU;

} /* end: yrcube */


idouble() {
static int ch;

	if (doubles.whosecube == YU) return;  /* not mine, can't double! */
	if (doubles.cube > 256) return;    /* maximum, don't consider it */
	notbarcube();
	if (tone) beep();
	debug("I double.  Will you accept the cube ");
	printf("at %d points? ",doubles.cube * 2);
	loo: 	while ((ch = getc(0)) == 0);
		if (toupper(ch) == 'Y') {
			notmycube();
			doubles.cube *= 2;
			yrcube(doubles.cube);
			off_cursor();
		}
		else if (toupper(ch) == 'N') winner(ME,0);
		else goto loo;

} /* end: idouble() */




backgame() {
int max, barred, count, i;
	if (topstone(YU) < 12 && topstone(ME) > 18) {
		if (mytotal() < yrtotal() + 4) return (TRUE);
		max = barred = count = 0;
		i = 24;
		while (i > 18) {
			if (point[i].owner == ME) {
				max = i;
				if (point[i].stones > 1) barred++;
				count += point[i].stones;
			}
			i--;
		}
		return ((max < topstone(YU) + 1) && (barred > 1 && count < 7));
	}
	else return ( mytotal() < yrtotal() + 24 );

} /* end: backgame */



cubeval() {
int ineed, yuneed, yrtop, mytop;

	if (endgame()) {

		/* calculate the number of dice that are required to end */
		/* the game, with appropriate fudge factors for position */

		yrtop = topstone(YU);
		mytop = topstone(ME);

		ineed = 15 - point[MYHOME].stones;
		yuneed = 15 - point[YRHOME].stones;

		if (yrtop < 4 && yuneed < 3) return (FALSE); /* obvious */

		/* topstones still running?  use a different method */
		if (mytop > 6 || yrtop > 6) {
			ineed  = 2 * (mytotal() / 8) + 1; /* number of dice */
			yuneed = 2 * (yrtotal() / 8) + 1;
		}

		/* count the stones on point 6 twice, they're losers */
		yuneed += point[6].stones;
		ineed  += point[6].stones;

		/* you doubled, so you have the roll */
		yuneed -= 2;

		/* odd number left? */
		if (ineed  % 2) ineed++;
		if (yuneed % 2) yuneed++;

		/* is the one point empty? */
		if (ineed  > 4 && mytop > 3 && point[24].stones == 0) ineed++;
		if (yuneed > 4 && yrtop > 3 && point[ 1].stones == 0) yuneed++;

		if (mytop < yrtop && ineed < yuneed) return (TRUE);
		if (yrtop < 5 && yuneed < ineed) return (FALSE);
		return ( yuneed >= ineed );
	}
	else return ( backgame() );

} /* end: cubeval */



testcube() {

	if (cubeval()) {
		debug("I accept the cube.");
		notyrcube();
		doubles.cube *= 2;
		mycube(doubles.cube);
	}
	else winner(YU,0);

} /* end: testcube */



udouble() {

	if (doubles.whosecube == ME) {
		if (tone) beep();
		debug("It's MY cube, dummy!"); 
	}
	else testcube();

} /* end: udouble */


#include "mylib2.c"

