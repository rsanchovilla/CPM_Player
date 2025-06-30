C
C
C     CPMINT.FOR
C
C     Library of CP/M Function Subroutines for
C     Microsoft FORTRAN-80.
C
C
C     Originally written:  November, 1981
C
C     Pre-release modifications:
C     Dec. 10, 1981 - Added EXIST routine
C     Dec. 18, 1981 - Revised options for INCHR and INKEY
C
C     Released to CP/M User's Group as:
C     Version 1.0
C     January 12, 1982
C
C     Author: William R. Brandoni
C
C     Language: Microsoft F80 (FORTRAN-80 compiler) Version 3.4 (26-Nov-80)
C
C
C
C
C + + + + + + + + + + + + + + HIGH LEVEL ROUTINES + + + + + + + + + + + + + +
C
C                             Primary Entry Points
C                             into the Library
C
C
C                             * * * * * * * * * *
C                             *                 *
C                             *    E R A S E    *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE ERASE ( NDRIVE, STRING, NBYTES )
C
C                NDRIVE = < integer >
C                STRING = < byte array >
C                NBYTES = < integer >
C
C     Erase a CP/M file.
C
C     The file being erased should be closed before this routine
C     is called.  Otherwise, duplicate FCB's will exist for the
C     file and unpredictable results may occur.
C
C     Input Arguments:
C     NDRIVE ... Drive number (1=A:, 2=B:, etc.)
C                If entered as zero, then the currently-logged
C                drive is used unless the STRING array contains
C                a drive specification in the file name.
C     STRING ... A byte array containing a valid CP/M file name.
C                The name may contain a drive specification if
C                desired.
C     NBYTES ... The number of bytes in the STRING array.
C                If entered as zero, the STRING will be assumed
C                to be 11 bytes long, with the file name blank
C                filled (in the same format as for a Microsoft
C                OPEN call).  In this mode, the drive cannot be
C                passed in the file name.
C
C     Note: The drive may be specified in several ways. If more
C           than one specification is used, they must all agree
C           or a DRIVE CONFLICT error will be generated.
C           If the file to be erased cannot be found,
C           a NO FILE error will be generated.
C
C     Output Arguments:
C         (none)
C
C
C     Examples of valid calls:
C
C         CALL ERASE ( 0, 'b:ab.x', 6 )
C         CALL ERASE ( 2, 'AB.X', 4 )
C         CALL ERASE ( 2, 'AB      X  ', 11 )
C         CALL ERASE ( NDR, FILNAM, NLONG )
C
C     Assuming that, in the last example, NDR = 2, FILNAM is a byte
C     array containing "ab.x", and NLONG = 4, then all of the
C     examples will erase the file AB.X on drive B:.
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
C
      DIMENSION FCB (36)
      DIMENSION STRING (1)
      DIMENSION SUBNAM (6)
C
      DATA SUBNAM / 'E','R','A','S','E',' ' /
C
C     The following data statement sets CERROR to 0FFH,
C     which is the return code for an error (file not found).
C
      DATA CERROR /.TRUE./
C
C                             Set Up the FCB
C
      LSTRNG = NBYTES
      IF ( NBYTES .EQ. 0 ) LSTRNG = 11
      CALL FCB$ ( STRING, LSTRNG, FCB )
C
C                             Get the drive number,
C                             set NDR to the maximum of these values,
C                             and test for any conflicts.
C
      NDRFCB = FCB(1)
      NDR    = MAX0 ( NDRIVE, NDRFCB )
      IF ( NDRFCB .LE. 0  .OR.  NDRIVE .LE. 0 ) GOTO 20
      IF ( NDRIVE .NE. NDRFCB ) GOTO 90
C
   20 FCB(1) = NDR
C
C                             Call BDOS function 19
C
      CALL CPMF19 ( FCB, CODE )
C
C                             Error Handling Routines
C
C         NO FILE TO ERASE error
      IF ( CODE .NE. CERROR ) GOTO 100
      CALL ERROR$ ( 1, SUBNAM, FCB )
      GOTO 100
C         DRIVE CONFLICT error
   90 CALL ERROR$ ( 3, SUBNAM, FCB )
C
C                             Return to calling program
C
  100 RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *    E X I S T    *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE EXIST ( NDRIVE, STRING, NBYTES, IOK )
C
C                NDRIVE = < integer >
C                STRING = < byte array >
C                NBYTES = < integer >
C                IOK    = < integer >
C
C     Test to see if a file exists.
C
C
C     Input Arguments:
C     NDRIVE ... Drive number (1=A:, 2=B:, etc.)
C                If entered as zero, then the currently-logged
C                drive is used unless the STRING array contains
C                a drive specification in the file name.
C     STRING ... A byte array containing a valid CP/M file name.
C                The name may contain a drive specification if
C                desired.
C     NBYTES ... The number of bytes in the STRING array.
C                If entered as zero, the STRING will be assumed
C                to be 11 bytes long, with the file name blank
C                filled (in the same format as for a Microsoft
C                OPEN call).  In this mode, the drive cannot be
C                passed in the file name.
C
C     Note: The drive may be specified in several ways. If more
C           than one specification is used, they must all agree
C           or a DRIVE CONFLICT error will be generated.
C           If the file to be erased cannot be found,
C           a NO FILE error will be generated.
C
C     Output Arguments:
C     IOK ...... Returned value:
C                0 = file doesn't exist
C                1 = file exists
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
      DIMENSION FCB (36)
      DIMENSION STRING (1)
      DIMENSION SUBNAM (6)
      DATA CERROR /.TRUE./
      DATA SUBNAM / 'E','X','I','S','T',' ' /
C
C                             Set Up the FCB
C
      LSTRNG = NBYTES
      IF ( NBYTES .EQ. 0 ) LSTRNG = 11
      CALL FCB$ ( STRING, LSTRNG, FCB )
C
C                             Get the drive number,
C                             set NDR to the maximum of these values,
C                             and test for any conflicts.
C
      NDRFCB = FCB(1)
      NDR    = MAX0 ( NDRIVE, NDRFCB )
      IF ( NDRFCB .LE. 0  .OR.  NDRIVE .LE. 0 ) GOTO 20
      IF ( NDRIVE .NE. NDRFCB ) GOTO 90
C
   20 FCB(1) = NDR
C
C                             Call BDOS function 17
C
      CALL CPMF17 ( FCB, CODE )
      IOK    = 1
      IF ( CODE .EQ. CERROR ) IOK = 0
      GOTO 100
C
C                             Error Handling Routines
C
C         DRIVE CONFLICT error
   90 CALL ERROR$ ( 3, SUBNAM, FCB )
C
C                             Return to calling program
C
  100 RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *   G E T C M D   *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE GETCMD ( ARRAY )
C
C                ARRAY  = < byte array >
C
C     This routine will get the "command line tail" and pass it
C     into the calling program.
C     Leading blanks are stripped off.
C
C     The "tail" is that part of the command line that follows
C     the program name.  For example, if the following line
C     were typed at the console following a CP/M prompt:
C
C            b:foo options:a,c,d,f,l
C
C     the system would load program FOO.COM from drive B: and the
C     "tail" would be the character string OPTIONS:A,C,D,F,L.
C
C     CP/M will always map the command line to upper case.
C
C     The user's program must interpret the "tail". All this
C     routine does is pass it to the FORTRAN program, after 
C     leading blanks are stripped off.
C
C     Some other considerations:
C
C         You MUST get the "tail" before any disk operations
C         are performed in the program.  Otherwise, CP/M may
C         overwrite the command line buffer during a disk
C         operation.  Thus, you should call this routine as
C         one of the first activities in your program.
C
C         You should scan the "tail" carefully, watching out
C         for trailing and imbedded blanks.  The line
C         will be passed exactly as typed except for mapping
C         to upper case.
C
C     Input arguments:
C         (none)
C
C     Output arguments:
C     ARRAY .... This is a byte array, which must be dimensioned
C                in the calling program to a length sufficient to
C                hold the entire "tail".  Otherwise, important
C                data or program instructions may be overwritten
C                by the command line information.  Dimensioning
C                the variable to 80 bytes is usually sufficient.
C                The FIRST BYTE of the returned array will contain
C                the number of characters to follow.  Only these
C                characters are valid.  The remainder of the array
C                will be unchanged from its original contents, or
C                will contain "garbage".
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
      DIMENSION ARRAY (1)
      DATA BLANK / ' ' /
      DATA ONE  / 1 /
      DATA ZERO / 0 /
C
C                             Get the command line as typed
C
      CALL CPMFNA ( ARRAY )
C
C                             Strip off leading blanks
C                             by shifting contents left one byte.
C
  100 IF ( ARRAY(1) .LE. ONE   ) GOTO 500
      IF ( ARRAY(2) .NE. BLANK ) GOTO 500
      ARRAY(1) = ARRAY(1) - ONE
      NBYTES   = ARRAY(1)
      DO 200 N = 1, NBYTES
      N1 = N + 1
      N2 = N + 2
  200 ARRAY(N1) = ARRAY(N2)
      GOTO 100
C
C                             Return, making sure a one-character
C                             command isn't a blank.
C
  500 CONTINUE
      IF ( ARRAY(1) .NE. 1 ) GOTO 550
      IF ( ARRAY(2) .EQ. BLANK ) ARRAY(1) = ZERO
  550 RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *    I N C H R    *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE INCHR ( NOPT, CHAR )
C
C                NOPT   = < integer >
C                CHAR   = < byte >
C
C     This subroutine reads a character from the console.
C     The character is immediately echoed to the console.
C     It is also returned as the value of the argument CHAR.
C
C     If no character is pending at the console, execution
C     halts until a character is typed.
C
C     The character is transmitted as soon as it is typed.
C     The RETURN or ENTER key is not required to complete the 
C     entry.
C
C     Input Arguments:
C     NOPT ..... Option for interpretation of input character.
C                (Add the following values together to determine
C                 the value to use.)
C                0 = (no option)
C                1 = (no option)
C                2 = map lower case alphabet to upper case
C                4 = stop execution if ctrl-C
C
C     Output Arguments:
C     CHAR ..... The resulting character.
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
C
      DATA CTRLC  / 3 /
C
      CALL CPMF1 ( A )
      CHAR   = A
      IF ( NOPT .AND. 2 )  CALL MAP$ ( A, CHAR )
      IF ( (NOPT .AND. 4) .AND. (A .EQ. CTRLC) ) STOP
      RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *    I N K E Y    *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE INKEY ( NOPT, CHAR )
C
C                NOPT   = < integer >
C                CHAR   = < byte >
C
C     This function reads a character from the console.
C     The character is not echoed to the console.
C     It is returned as the value of the argument CHAR.
C
C     If no character is pending at the console, the
C     NUL character (ASCII 0) is returned and execution
C     of the program continues.
C
C     The character is transmitted as soon as it is typed.
C     The RETURN or ENTER key is not required to complete the 
C     entry.
C
C     Input Arguments:
C     NOPT ..... Option for interpretation of input character.
C                (Add the following values together to determine
C                 the value to use.)
C                0 = (no option)
C                1 = wait for a character to be typed
C                2 = map lower case alphabet to upper case
C                4 = stop execution if ctrl-C
C
C     Output Arguments:
C     CHAR ..... The resulting character.
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
C
      DATA CTRLC  / 3 /
      DATA FF  /.TRUE./
      DATA ZERO   / 0 /
C
   10 CALL CPMF6 ( FF, A )
      IF ( (NOPT .AND. 1) .AND. (A .EQ. ZERO) )  GOTO 10
      CHAR   = A
      IF ( NOPT .AND. 2 ) CALL MAP$ ( A, CHAR )
      IF ( (NOPT .AND. 4) .AND. (A .EQ. CTRLC) ) STOP
      RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *   R E N A M E   *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE RENAME ( NDRIVE, FNOLD, FNNEW, NBOLD, NBNEW )
C
C                NDRIVE = < integer >
C                FNOLD  = < byte array >
C                FNNEW  = < byte array >
C                NBOLD  = < integer >
C                NBNEW  = < integer >
C
C     Rename a CP/M file.
C
C     The file being renamed should be closed before this routine
C     is called.  Otherwise, duplicate FCB's will exist for the
C     file and unpredictable results may occur.
C
C     Input Arguments:
C     NDRIVE ... Drive number (1=A:, 2=B:, etc.)
C                If entered as zero, then the currently-logged
C                drive is used unless the FNOLD or FNNEW array
C                contains a drive specification in the file name.
C     FNOLD .... A byte array containing a valid CP/M file name.
C     FNNEW .... A byte array containing a valid CP/M file name.
C                The name may contain a drive specification if
C                desired.
C                FNOLD is the old name; FNNEW is the new name.
C     NBOLD ... The number of bytes in the FNOLD array.
C     NBNEW ... The number of bytes in the FNNEW array.
C                If entered as zero, the array will be assumed
C                to be 11 bytes long, with the file name blank
C                filled (in the same format as for a Microsoft
C                OPEN call).  In this mode, the drive cannot be
C                passed in the file name.
C
C     Note: The drive may be specified in several ways. If more
C           than one specification is used, they must all agree
C           or a DRIVE CONFLICT error will be generated.
C           If the new file name already exists, a FILE ALREADY
C           EXISTS error will be generated.  If the old file 
C           cannot be found, a NO FILE error will be generated.
C
C     Output Arguments:
C         (none)
C
C
C     Examples of valid calls:
C
C         CALL RENAME ( 0, 'b:ab.x', 'cd.y', 6, 4 )
C         CALL RENAME ( 0, 'ab.x', 'b:cd.y', 4, 6 )
C         CALL RENAME ( 2, 'ab.x', 'cd.y', 4, 4 )
C         CALL RENAME ( 2, 'AB      X  ', 'CD      Y  ', 0, 0 )
C         CALL RENAME ( NDR, FIL1, FIL2, NB1, NB2 )
C
C     Assuming that, in the last example, NDR = 2, FIL1 is a byte
C     array containing "ab.x", FIL2 is a byte array containing
C     "cd.y", NB1 = 4, and NB2 = 4,  then all of the
C     examples will rename the file AB.X to CD.Y on drive B:.
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
C
      DIMENSION FCB (36)
      DIMENSION FNOLD (1)
      DIMENSION FNNEW (1)
      DIMENSION SUBNAM (6)
C
      DATA SUBNAM / 'R','E','N','A','M','E' /
      DATA ONE    / 1 /
      DATA ZERO   / 0 /
C
C     The following data statement sets CERROR to 0FFH,
C     which is the return code for an error (file not found).
C
      DATA CERROR /.TRUE./
C
C
C
C                             Get the drive info from each string,
C                             set NDR to the maximum of these values,
C                             and test for any conflicts.
C
      CALL FNAME$ ( FNOLD, NBOLD, NDROLD, FCB )
      CALL FNAME$ ( FNNEW, NBNEW, NDRNEW, FCB )
      NDR    = MAX0 ( NDRIVE, NDROLD, NDRNEW )
      DRIVES = ZERO
      IF ( NDROLD .GT. 0      ) DRIVES = DRIVES + ONE
      IF ( NDRNEW .GT. 0      ) DRIVES = DRIVES + ONE
      IF ( NDRIVE .GT. 0      ) DRIVES = DRIVES + ONE
      IF ( DRIVES .LE. ONE    ) GOTO 20
      IF ( NDRIVE .LE. 0      ) GOTO 10
C         NDRIVE was specified, so compare to it
      DRIVES = DRIVES - ONE
      IF ( NDROLD .LE. 0      ) GOTO  5
      IF ( NDRIVE .NE. NDROLD ) GOTO 90
    5 IF ( NDRNEW .LE. 0      ) GOTO 10
      IF ( NDRIVE .NE. NDRNEW ) GOTO 90
C         See if the two string drives need to be tested
C         and do it.
   10 IF ( DRIVES .LE. ONE    ) GOTO 20
      IF ( NDROLD .NE. NDRNEW ) GOTO 90
C
C                             See if the New File already exists
C
   20 CONTINUE
      CALL FCB$ ( FNNEW, NBNEW, FCB )
      FCB(1) = NDR
      CALL CPMF17 ( FCB, CODE )
      IF ( CODE .NE. CERROR ) GOTO 80
C
C                             Perform the RENAME operation
C                             by setting up the proper format
C                             for the FCB.
C
      LSTRNG = NBOLD
      IF ( NBOLD .EQ. 0 ) LSTRNG = 11
      CALL FCB$ ( FNOLD, LSTRNG, FCB )
      LSTRNG = NBNEW
      IF ( NBNEW .EQ. 0 ) LSTRNG = 11
      CALL FNAME$ ( FNNEW, NBNEW, NDRNEW, FCB(17) )
      FCB(17) = ZERO
C
C                             Call BDOS function 23
C
      CALL CPMF23 ( FCB, CODE )
C
C                             Error handling routines
C
C         RENAME function error
      IF ( CODE .NE. CERROR ) GOTO 100
      CALL ERROR$ ( 1, SUBNAM, FCB )
      GOTO 100
C         NEW FILE EXISTS error
   80 CALL ERROR$ ( 2, SUBNAM, FCB )
      GOTO 100
C         DRIVE CONFLICT error
   90 CALL ERROR$ ( 3, SUBNAM, FCB )
C
C                             Return to calling program
C
  100 RETURN
      END
C
C
C + + + + + + + + + + + + + + LOW  LEVEL ROUTINES + + + + + + + + + + + + + +
C
C                             Service Routines for
C                             High-Level Routines
C
C
C
C                             * * * * * * * * * *
C                             *                 *
C                             *     F C B $     *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE FCB$ ( STRING, LSTRNG, FCB )
C
C                STRING = < byte array >
C                LSTRNG = < integer >
C                FCB    = < byte array >
C
C     Subroutine to build a valid File Control Block (FCB)
C
C     Input arguments:
C     STRING ... Input string ( a byte array ) of length LSTRNG
C     LSTRNG ... Integer value is length of STRING array in bytes.
C
C     Output arguments:
C     FCB ...... The completed FCB ( a byte array ) which must
C                be 36 bytes long.  The first 12 bytes will be
C                initialized to the drive and file specified
C                in STRING. The remainder will be zeroed.
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
      DIMENSION STRING(LSTRNG)
      DIMENSION FCB(36)
      DATA ZERO   / 0 /
C
C                             Zero the FCB array
C
      DO 100 K = 1, 36
  100 FCB(K) = ZERO
C
C                             Fill out the file information
C
      CALL FNAME$ ( STRING, LSTRNG, NDRIVE, FCB )
C
C                             That's all, folks.
C
      RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *   F N A M E $   *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE FNAME$ ( STRING, LSTRNG, NDRIVE, FILNAM )
C
C                STRING = < byte array >
C                LSTRNG = < integer >
C                NDRIVE = < integer >
C                FILNAM = < byte array >
C
C     Subroutine to extract a CP/M file name from an input
C     character string.
C     Complete error trapping is NOT included in this routine.
C     Thus, the programmer should excercize some caution in
C     the use of this routine.
C     Asterisks (*) are expanded into questions for the file
C     name and file type, and drive information is extracted
C     if it is included in the string as the first character
C     followed by a colon (:).
C     Thus, all valid CP/M file descriptions will be handled
C     properly.
C
C     Input Arguments:
C     STRING ... Input string ( a byte array ) of length LSTRNG
C     LSTRNG ... Integer value is length of STRING array in bytes.
C
C     Output Arguments:
C     NDRIVE ... Integer value of drive number:
C                0 = logged in drive
C                1 = drive A:
C                2 = drive B:
C                etc.
C     FILNAM ... Output string ( a byte array ) of length 12.
C                The first byte duplicates the drive value in
C                NDRIVE.  The remaining bytes are the name and
C                extension, blank-filled to exactly 11 characters.
C
C     The format of the output arguments is such that they serve
C     two purposes:
C
C     1) To construct a Microsoft FORTRAN call to the OPEN subroutine,
C        use the form:
C            CALL OPEN ( lun, FILNAM(2), NDRIVE )
C        where 'lun' is the unit number.  Specifying FILNAM(2) in
C        the argument list passes the address of the second element
C        which is the first character of the 11-byte file name.
C
C     2) To construct a CP/M file control block (FCB), use the
C        FILNAM array as the first 12 bytes of the FCB, and the
C        drive specification will be placed in the first byte as
C        required.
C
C
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
C
C
      DIMENSION FILNAM(12)
      DIMENSION STRING(LSTRNG)
      DIMENSION WORKER(14)
C
C
      DATA BLANK  / ' ' /
      DATA COLON  / ':' /
      DATA PERIOD / '.' /
      DATA QUEST  / '?' /
      DATA STAR   / '*' /
C
C                             First, transfer STRING to WORKER array
C                             and map any lower case to upper case.
C
C         Blank-fill WORKER
C         Blank-fill FILNAM
C
      NDRIVE  = 0
C
      DO 10 K = 1, 12
      WORKER(K)  = BLANK
   10 FILNAM(K)  = BLANK
C
      WORKER(13) = BLANK
      WORKER(14) = BLANK
      FILNAM( 1) = NDRIVE
C
C         Search for first non-blank in STRING
C
      KSTART = 0
C
      DO 20 K = 1, LSTRNG
      IF ( STRING(K) .EQ. BLANK ) GOTO 20
      KSTART = K
      GOTO 50
   20 CONTINUE
C
      GOTO 300
C
C         Transfer STRING into WORKER
C         starting at first non-blank.
C         Mapping to upper case takes place here.
C         Also, search for PERIOD character.
C
   50 KOUNT  = 0
      KDOT   = 0
C
      DO 100 K = KSTART, LSTRNG
      KOUNT  = KOUNT + 1
      IF ( KOUNT .GT. 14 ) GOTO 110
      WORKER(KOUNT) = STRING(K)
      IF ( WORKER(KOUNT) .EQ. PERIOD ) KDOT   = KOUNT
      CALL MAP$ ( WORKER(KOUNT), WORKER(KOUNT) )
 100  CONTINUE
C
C                             Then, check for drive specification.
C                             This is true only if the second character
C                             is a colon.
C
  110 NDRIVE = 0
      KSTART = 1
      IF ( WORKER(2) .NE. COLON ) GOTO 200
      KSTART = 3
C
C     Drive is specified.  Convert as follows:
C
C         A:  or  0:  set to  1
C         B:  or  1:  set to  2
C         C:  or  2:  set to  3
C         D:  or  3:  set to  4
C
      IF ( WORKER(1) .GE. 65 ) WORKER(1) = WORKER(1) - 17
      NDRIVE = WORKER(1) - 47
C
C                             Set up the FILNAM vector.
C
 200  CONTINUE
      FILNAM(1) = NDRIVE
C
C         Transfer the file name (first 8 characters).
C         Test to see if first character is a star (*).
C         If so, make file name all questions (?).
C
      KOUNT  = 1
      KSTOP  = KSTART + 7
      QSTAR  = .FALSE.
      IF ( WORKER(KSTART) .EQ. STAR ) QSTAR = .TRUE.
C
      DO 210 K = KSTART, KSTOP
      KOUNT  = KOUNT + 1
      KSAVE  = K
      IF ( QSTAR ) GOTO 205
      IF ( WORKER(K) .EQ. PERIOD ) GOTO 220
      FILNAM(KOUNT) = WORKER(K)
      GOTO 210
  205 FILNAM(KOUNT) = QUEST
  210 CONTINUE
C
C         Transfer the file type (last 3 characters).
C         Test to see if first character is a star (*).
C         If so, make file type all questions (?).
C
  220 KOUNT  = 9
      KSTART = KSAVE + 1
      IF ( KDOT .GT. 0 ) KSTART = KDOT + 1
      KSTOP  = KSTART + 2
      QSTAR  = .FALSE.
      IF ( WORKER(KSTART) .EQ. STAR ) QSTAR = .TRUE.
C
      DO 250 K = KSTART, KSTOP
      KOUNT  = KOUNT + 1
      IF ( QSTAR ) GOTO 240
      FILNAM(KOUNT) = WORKER(K)
      GOTO 250
  240 FILNAM(KOUNT) = QUEST
  250 CONTINUE
C
C                             That's all, folks!
C
 300  CONTINUE
      RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *     M A P $     *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE MAP$ ( AIN, AOUT )
C
C                AIN    = < byte >
C                AOUT   = < byte >
C
C     Map a lower case character to upper case.
C
C     If the input character is not a lower case alphabet
C     character, no mapping takes place.
C
C     Input Arguments:
C     AIN ..... The one-byte value to be mapped.
C
C     Output Arguments:
C     AOUT .... The one-byte value mapped to u.c.
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
C
      DATA ALOWER / 'a' /
      DATA AOFSET /  32 /
      DATA ZLOWER / 'z' /
C
      IF ( AIN .LT. ALOWER ) GOTO 100
      IF ( AIN .GT. ZLOWER ) GOTO 100
      AOUT = AIN - AOFSET
 100  RETURN
      END
C                             * * * * * * * * * *
C                             *                 *
C                             *   E R R O R $   *
C                             *                 *
C                             * * * * * * * * * *
C
C
      SUBROUTINE ERROR$ ( NERROR, ANAME, ARRAY )
C
C                NERROR = < integer >
C                ANAME  = < byte array >
C                ARRAY  = < byte array >
C
C
C     Error printing routine.
C
C     Input Arguments:
C     NERROR ... Number of the error message to print.
C     ANAME .... A six-byte name for the routine which called
C                the error.
C     ARRAY .... A byte array, the contents of which depend on
C                the error being processed.
C
C     Output Arguments:
C         (none)
C
      IMPLICIT LOGICAL*1 ( A-H, O-Z ), INTEGER ( I-N )
      DIMENSION ANAME(6), ARRAY(1)
C         The ALPHA variable maps the drive number to upper
C         case alphabet.
      DATA ALPHA / 64 /
C         The LIO variable defines the output device for error
C         messages.  Device 3 is the default device used by
C         Microsoft for FORTRAN run-time errors.
      DATA LIO  / 3 /
C         The NMAX variable defines the maximum error code
C         available in this version.
      DATA NMAX / 3 /
      DATA ZERO / 0 /
C
C
      IF ( NERROR .LT. 1  .OR.  NERROR .GT. NMAX ) GOTO 500
      GOTO ( 10, 20, 30 ), NERROR
C
C                             FILE NOT FOUND error
C
   10 IF ( ARRAY(1) .EQ. ZERO ) GOTO 11
      DRIVE = ARRAY(1) + ALPHA
      WRITE ( LIO, 9010 )  (ANAME(J), J = 1, 6), DRIVE,
     A                     (ARRAY(J), J = 2, 12)
      GOTO 1000
   11 WRITE ( LIO, 9011 )  (ANAME(J), J = 1, 6),
     A                     (ARRAY(J), J = 2, 12)
      GOTO 1000
C
C                            FILE ALREADY EXISTS error
C
   20 IF ( ARRAY(1) .EQ. ZERO ) GOTO 21
      DRIVE = ARRAY(1) + ALPHA
      WRITE ( LIO, 9020 )  (ANAME(J), J = 1, 6), DRIVE,
     A                     (ARRAY(J), J = 2, 12)
      GOTO 1000
   21 WRITE ( LIO, 9021 )  (ANAME(J), J = 1, 6),
     A                     (ARRAY(J), J = 2, 12)
      GOTO 1000
C
C                             DRIVE CONFLICT error
C
   30 WRITE ( LIO, 9030 ) (ANAME(J), J = 1, 6)
      GOTO 1000
C
C                             Undefined Error
C
  500 WRITE ( LIO, 9500 )  (ANAME(J), J = 1, 6)
C
C                             Return to calling routine
C
 1000 RETURN
C
C                             Formats
C
 9010 FORMAT (1X, 6A1, ' error - no file ', A1, ': ', 11A1 )
 9011 FORMAT (1X, 6A1, ' error - no file ', 11A1 )
 9020 FORMAT (1X, 6A1, ' error - ', A1, ':',
     A        11A1, ' already exists.')
 9021 FORMAT (1X, 6A1, ' error - ',
     A        11A1, ' already exists.')
 9030 FORMAT (1X, 6A1, ' error - drive conflict.')
 9500 FORMAT (1X, 6A1, ' - undefined error.')
      END
