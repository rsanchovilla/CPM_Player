/****************************************
 *: CRAND.C -  Example of C/assembler interaction
 ****************************************
 *	As of 6 April 81 RJ
 *	Author Glen Fisher
 ****************************************
 */

#define NL	13	/* newline */

int rseed;		/* this is common to C and assembler */

/****************************************
 *: MAIN - prints random numbers (calls assembler)
 ****************************************
 *
 *	--- changes ---
 *	rseed
 */
main()
{	int i;

	rseed = 1;			/* initial seed */
	nl();
	i = 0;
	while(i < 10) { 		/* print 10 random numbers */
		putnum(rand(10));
		sp();
		i++;
		}
	nl();
	putnum(rseed);			/* final seed */
	nl();

	rseed = 1;			/* one more time... */
	nl();
	i = 0;
	while(i < 10) {
		putnum(rand2(20));	/*   using rand2 this time. */
		sp();
		i++;
		}
	nl();
	putnum(rseed);
	nl();
/* end main */}

/****************************************
 *: PUTNUM - print a number
 ****************************************
 *	--- passed ---
 *	n - number to be printed
 */

putnum(n)
int n;
{
	if(n<0){
		putchar('-');
		n = -n;
		if(n<0){
			puts("32768");
			return;
			}
		}
	if(n>9)
		putnum(n/10);
	putchar('0'+n%10);
/* end putnum */}

/****************************************
 *: NL - print a newline
 ****************************************
 */

nl()
{
	putchar(NL);
/* end nl */}



/****************************************
 *: SP - print a space
 ****************************************
 */

sp()
{
	putchar(' ');
/* end sp */}

/****************************************
 *: NEARABS - takes absolute value of a number
 ****************************************
 *
 *	--- passed ---
 *	n - number to take absolute value of
 */

nearabs(n)
int n;
{
	if(n<0)
		n = -n;
	if(n<0) 		/* if most negative number, ... */
		n = 32767;	/*    return most positive.	*/
	return n;
/* end nearabs */}

#asm
;***************************************
;*: RAND - asm function to generate random number	    
;****************************************
;	
;	Rand simply pops arguments off the stack (which
;	isn't how C functions do it).  This method
;	has the virtue of simplicity.
;
;	--- passed ---
;	the greatest possible random integer
;	--- returns ---
;	a random integer
;      --- uses ---
;	rseed
;	--- changes ---
;	rseed
;
QZRAND:
	POP	B	;Save return address
	POP	H	;Get arg
	SHLD	LIMIT	;Save it in a handy place
	PUSH	H	;Restore stack to what
	PUSH	B	;  it was before

	LHLD	QZRSEED ;Get seed (from C external variable)
	LXI	D,16381 ; times prime number
	CALL	CCMULT	;	(using the runtime library)
	LXI	D,43	; plus some odd thing
	DAD	D
	SHLD	QZRSEED ;Save result as next seed

	PUSH	H	;Take abs. value of seed (using C routine)
	CALL	QZNEARABS  ;(result comes back in HL)
	POP	B	; (throw away pushed arg)
	XCHG
	LHLD	LIMIT
	CALL	CCDIV	; mod the argument
	XCHG

	RET		;Pass the result (in HL) back to caller.
LIMIT:	DS	2	;(this location not accessable from C)

;****************************************
;*: rand2 - asm function accesses the argument like C functions do.
;****************************************
;*				      
;	rand2 does exactly the same thing as rand, except it
;	gets its argument using the same method that c functions
;	use.  The advantage of this method is that it can handle
;	any number of arguments. 
;
QZRAND2:
	LHLD	QZRSEED ;Get seed
	LXI	D,16381 ; times prime number
	CALL	CCMULT
	LXI	D,43	; plus some odd thing
	DAD	D
	SHLD	QZRSEED ;Save result as next seed

	PUSH	H	;Take abs. value of seed
	CALL	QZNEARABS
	POP	B	; (throw away pushed arg)
	XCHG		;Save the result
	LXI	H,2	;Get the argument
	DAD	SP	;    Add offset (on stack) of arg to stack ptr
	CALL	CCGINT	;    Get arg into HL
	CALL	CCDIV	;Find abs(rseed) mod the argument
	XCHG

	RET		;Pass the result (in HL) back to caller.
#endasm

/******************
 * end CRAND.C
 ******************/
	XCHG

	RET		;Pass the result (in HL) back to caller.
#endasm

/******