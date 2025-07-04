/* STATT BUFFLAE 512 */
/* C-SUPPORT ROUTINES V3.19 */
/* MI - C  v-3.183 (C) COPYRIGHT G. KERSTING / H. ROSE, 1983 */
/*   11/83  */

#DEFINE NULL	0
#DEFINE EOF	-1
#DEFINE UNGETCHAR XUNGE
#DEFINE _EXIT	XEXIT
#DEFINE STRNCMP	STNCMP
#DEFINE STRNCPY	STNCPY
#DEFINE STRNCAT	STNCAT

/*		*/
/*
WENN EIN LINKER, DER MEHR ALS 6 ZEICHEN EINES NAMENS BENUTZT,
VERWENDET WIRD, SIND DIE 16 FOLGENDEN ERSETZUNGEN NOETIG.
*/
/*
#DEFINE PUTCHAR	PUTCHA
#DEFINE GETCHAR GETCHA

#DEFINE FPRINTF	FPRINT
#DEFINE SPRINTF	SPRINT
#DEFINE ISALPHA	ISALPH
#DEFINE ISDIGIT	ISDIGI
#DEFINE ISLOWER	ISLOWE
#DEFINE ISSPACE ISSPAC
#DEFINE ISUPPER	ISUPPE
#DEFINE TOLOWER TOLOWE
#DEFINE TOUPPER	TOUPPE
#DEFINE ISALNUM	ISALNU
#DEFINE ISASCII	ISASCI
*/

/*		*/
/* MIT DEN BEIDEN FOLGENDEN ERSETZUNGEN KANN DIE EIN-
  AUSGABE ZUM TERMINAL VEAENDERT WEREN. 
	0X1A (^Z) LIEFERT DANN EOF ZURUECK
	BEI GETCHAR WIRD '\R' SOWIE '\N' ALS '\N'ERKANNT
	PUTCHAR GIBT '\N' ALS '\R' '\N' AUS

  WENN AUCH PRINTF UND SCANF DIESE AENDERUNGEN HABEN SOLLEN,
  MUSS STATTDESSEN DIE DATEI  CPM-CHAR.SUB  AUSGEFUEHRT WERDEN.

*/
/*#DEFINE GETCHAR	AGETCHAR*/
/*#DEFINE PUTCHAR	APUTCHAR*/
/*		*/
/*		*/
STATIC STRUCT STDSTRUCT {INT ART;} SSTDIN = 111;
STATIC STRUCT STDSTRUCT SSTDOUT = 112;
STATIC STRUCT STDSTRUCT *STDIN = &SSTDIN;
STATIC STRUCT STDSTRUCT *STDOUT = &SSTDOUT;
#DEFINE STDERR	STDOUT
/*	*/
TYPEDEF STRUCT FILESTRUCT {
	STRUCT SFCBTAB {
		INT ART;
		STRUCT SFCB
			{
			   CHAR DRIVE,
				NAME[8],
				TYPE[3],
				EXT,
				RESV[2],
				RC,
				SYDX[16],
				CR;
		       UNSIGNED RECORD;
			   INT OVERFL;
			} FCB;
		INT OFFSET;
		STRUCT FILESTRUCT *NEXT;
		       } FCBTAB;
			UNSIGNED FREC;	
			INT	FOVER;
			/* RANDOM 1. REC. IM PUFFER */
			    CHAR *POI;
			    CHAR *EPOI,
				 BUFF[512]; /* BUFFLAE */
			UNSIGNED FSIZE;
			INT	FOSIZE;
			 } FILE;
/*		*/
