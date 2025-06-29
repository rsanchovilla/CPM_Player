h14540
s 00197/00000/00000
d D 1.1 83/03/18 11:44:04 bog 1 0
c date and time created 83/03/18 11:44:04 by bog
e
u
4
U
t
T
I 1
#define INT32 long
#define INT16 int
#define BYTE char

#include "ratdef.c"

#define GR_TTY 3
#define GR_AUX 4
#define GR_LPT 5

static INT16 iosegbas = 0xffff;
static INT16 iosegoff = 0xffff;
struct regval {INT16 ax,bx,cx,dx,si,di,ds,es; };
struct regval regs;                /* declare structure for registers */

abs (value)   /* Compute absolute value */ 
INT16 value;
{
   if (value < 0) return (-value);
   else           return (value);
}
gimnmx (value, low, high)   /* Compute min/max */
INT16 value, low, high;
{
   if (value < low)       return (low);
   else if (value > high) return (high);
   else                   return (value);
}
mult (a, b)                 /* Multiply 2 16-bit numbers */
INT16 a, b;
{
   return (a*b);
}
min0 (x, y)                 /* Compute minimum of 2 16-bit numbers */
INT16 x, y;
{
   if (x < y) return (x);
   else       return (y);
}
max0 (x, y)                 /* Compute maximum of 2 16-bit numbers */
INT16 x, y;
{
   if (x > y) return (x);
   else       return (y);
}
divid (a, b, r)             /* Divide 2 16-bit numbers-return quotient */
			    /*   and remainder                         */
INT16 a, b, *r;
{
   INT16 t;

   t = a/b;
   *r = a - t*b;
   return (t);
}
ioini ()                    /* Initialize character i/o by calling GSX */
			    /* to determine where character i/o routines*/
			    /* are located in memory.                   */
{
   int peek(), sysint();

   regs.cx = 0x1673;                  /* call gsx to return layer info    */
   sysint (224, &regs, &regs);        /* es:bx is ptr to layer info       */

   iosegoff = peek (regs.bx + 1, regs.es);  /* get seg offset of i/o layer */
   iosegbas = peek (regs.bx + 3, regs.es);  /* get seg base of i/o layer   */

}
ttyinw (c)                  /* Read character from console without waiting */
BYTE *c;
{
   if (iosegbas == 0xffff) ioini ();  /* initialize io if necessary */
   *c = -1;
   regs.bx = GR_TTY + 0x0300;    /* set channel for graphic console input*/

   /* Call character I/O provided in GSX directly.  Segbas and offset */
   /* were previously set up by ioini.                                */

   farcall (iosegoff, iosegbas, &regs, &regs);

   if (regs.ax < 0) *c = regs.dx & 0xff;

   return;
}
ttyin (c)                   /* Read character from console with wait */
BYTE *c;
{
   if (iosegbas == 0xffff) ioini ();  /* initialize io if necessary */

   regs.bx = GR_TTY + 0x0200;         /* set channel to graphic console*/

   /* Call character I/O provided in GSX directly.  Segbas and offset */
   /* were previously set up by ioini.                                */

   farcall (iosegoff, iosegbas, &regs, &regs);

   *c = regs.dx & 0xff;
   return;
}
ttysot (n, c)               /* Output character string to console */
INT16 n;
BYTE *c;
{
   INT16 i;

   for (i=0; i<n; i++) {       /* output characters one at a time      */

      /* Call character output routine directly.  */

      ttyout (*c++);
      }

   return;
}
ttyout (c)                 /* Output character to console */
BYTE c;
{
   if (iosegbas == 0xffff) ioini ();  /* initialize io if necessary */
   regs.bx = GR_TTY + 0x0600;         /* set channel for graphic console writ*/
   regs.dx = c & 0xff;                /* set character to be output */

   /* Call character I/O provided in GSX directly.  Segbas and offset */
   /* were previously set up by ioini.                                */

   farcall (iosegoff, iosegbas, &regs, &regs);
   return;
}
gitoch (ival, buf, size, err)  /* Convert integer to character string */
INT16 ival, size, *err, *buf;
{

   INT16 i, n, divid(), *bptr, *eptr;

   if ((n = ival) < 0) n = -n;          /* make copy that is positive */
   *err = 0;                            /* initialize to no error     */
   bptr = buf;                          /* bptr = beginning of buffer */
   eptr = bptr + size - 1;              /* eptr = end of buffer       */

   do {                                 /* generate digits in reverse order */
      if (bptr <= eptr) {               /* is there room for this digit ?   */
         n = divid (n, 10, &i);         /* yes, get next digit              */
	 *bptr++ = i + DIG0;
	 }
      else {                            /* no , error out                   */
	 *err = 1;
	 return (0);
	 }
      } while (n != 0);                 /* done */

   if (ival < 0) {                      /* add minus sign */
      if (bptr <= eptr) *bptr++ = MINUS;
      else {                            /* not enough room, error out      */
	 *err = 1;
	 return (0);
	 }
      }

   i = bptr - buf;                      /* get length of string */

   bptr = buf;                          /* bptr pts to beginning of buffer */
   eptr = bptr + i - 1;                 /* eptr pts to last chr to switch  */
   while (bptr < eptr) {                /* reverse digits */
      n = *bptr;
      *bptr++ = *eptr;
      *eptr-- = n;
      }

   return(i);
}
gchtoi (buf, istart, ival, istop)   /* Convert character string to integer */
INT16 *buf, istart, *ival, *istop;
{
   INT16 j;
   INT16 sign, mult(), *bptr, *bstart;
 
   bptr = buf + istart;                          /* offset into buffer array */
   bstart = bptr;                                /* save start point in buf  */
   
   while (*bptr == BLANK || *bptr == TAB) {      /* skip white space */
      ++bptr;
      }

   sign = 0;                                     /* check for sign */
   if      (*bptr == MINUS) sign = 1;            /* negative number */
   else if (*bptr != PLUS) --bptr;
   ++bptr;					 /* skip sign data */

   for (j=0; *bptr >= DIG0 && *bptr <= DIG9; ) {
      j = mult (j, 10) + (*bptr++ - DIG0);
      }
   if (sign) j = -j;
   *ival = j;                                    /* return value */

   *istop = bptr - bstart + istart;              /* return last chr accessed */

   return;
}
E 1
