/*	c_main.h

	Mike's Enhanced Small C Compiler for Z80 & CP/M

	Main header.

	Copyright (c) 1999-2015 Miguel I. Garcia Lopez

	This program is free software; you can redistribute it and/or modify it
	under the terms of the GNU General Public License as published by the
	Free Software Foundation; either version 2, or (at your option) any
	later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

	Revisions:

	17 Jan 2001 : Last revision.
	16 Apr 2007 : GPL'd.
	31 Jul 2014 : String pool resized to 9K (was 6000 bytes before).
	31 Jul 2014 : v1.02
	17 Feb 2015 : v1.03
	10 Apr 2015 : v1.04
	11 May 2015 : v1.05
	14 Aug 2015 : v1.06
	16 Aug 2015 : Removed TURBO C and PCC support.
	16 Aug 2015 : v1.07
	04 Sep 2015 : v1.08
*/

#ifndef C_MAIN_H

#define C_MAIN_H

/*	OPTIONAL DEFS

	You can define the following:

	C_USEPRINTF	If you want use printf/fprintf/sprintf in
			console/file/mem output functions.
*/

/* #define C_USEPRINTF */

/*	COMMON DEFS.
*/

#define VERSION	"Mike's Enhanced Small C Compiler v1.08 - 04 Sep 2015"
#define COPYRGT "(c) 1999-2015 FloppySoftware"

#define ERCONST	"Must be constant"

#define ERARRSZ "Illegal array size"
#define ERARRPT "Illegal *[]"
#define ERARGNB "Illegal arguments number"
#define ERARGNM	"Need argument name"

/*#define ERNEGSZ	"Illegal negative size"*/ /* VER */


/*#define ERILDEC "Illegal declaration"*/

#define ERFUNDE	"Illegal function declaration"
/*#define ERARGIN	"Illegal argument name"*/ /* VER */
/*#define ERARGTY	"Illegal number or argument type"*/ /* VER */
#define ERSYMNM	"Illegal symbol name"

#define ERALDEF	"Already defined"
#define EROFGLB	"Global symbol table full"
#define EROFLOC	"Local symbol table full"
#define ERTMWHI	"Too many active while's"
#define ERNOWHI	"No active while's"
#define EREXWHI	"Need a while"
#define ERLTLNG	"Line too long"
#define ERTMCAS	"Too many active case's"

#define OUT_PRG 0
#define OUT_LIB 1
#define OUT_ASM 2

/*	STRING POOL
*/

#define STRBUF_SIZ 9216

/*	INPUT LINE
*/

#define LN_SIZ	256
#define LN_MAX	255

/*	SYMBOL TABLE FORMAT
*/

#define SY_NAME		0
#define SY_IDENT	12
#define SY_TYPE		13
#define SY_STORAGE	14
#define SY_OFFSET	15

#define SYMSIZE		17

/*	SYMBOL NAME SIZE
*/

#define NAME_SIZ	12
#define NAME_MAX	11

/*	IDENT
*/

#define ID_VAR	1
#define ID_ARR	2
#define ID_PTR	3
#define ID_FUN	4

/*	TYPE
*/

#define TY_CHAR		1
#define TY_INT		2
#define TY_UCHAR	5
#define TY_UINT		6

/*	STORAGE
*/

#define ST_EXTERN	1
#define ST_STATIK	2
#define ST_STKLOC	3

#endif
