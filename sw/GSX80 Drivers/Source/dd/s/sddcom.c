h55825
s 00034/00000/00000
d D 1.1 83/03/18 11:43:12 bog 1 0
c date and time created 83/03/18 11:43:12 by bog
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

/* DEVICE DRIVER COMMON FUNCTION COMMON AREA */

/*       ndclrf                  current fill area color */
/*       ndclrl                  current line color */
/*       ndclrm                  current marker color */
/*       ndclrp                  current pen station in use */
/*       ndclrt                  current text color */
/*       ndflpt                  current fill area pattern */
/*       ndfstl                  current fill interior style */
/*       ndlntp                  current line type (style) */
/*       ndmktp                  current marker type (style) */
/*       ndmkht                  current marker height  */
/*       ndotkt                  prompted output buffer counter */
/*       ndpnpr                  plotter pen prompt level (1=no, 2=yes) */
/*       ndtxrt                  current text rotation */
/*       ndtxsz                  current text x size for continuous devices */
/*       ndtysz                  current text y size for continuous devices */
/*       ndxpos                  last x coordinate */
/*       ndypos                  last y coordinate */
/*       ndlcmd                  current locator mode */
/*       ndvlmd                  current valuator mode */
/*       ndchmd                  current choice mode */
/*       ndstmd                  current string mode */
/*       ndwrmd                  current writing mode */
 
INT16 ndclrf, ndclrl, ndclrm, ndclrp, ndclrt, ndflpt, 
    ndfstl, ndlntp, ndmktp, ndmkht, ndotkt, ndpnpr, ndtxrt,
    ndtxsz, ndtysz, ndxpos, ndypos, ndlcmd, ndvlmd, ndchmd, ndstmd,
    ndwrmd;

E 1
