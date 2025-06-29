;******************************************************************************
;                                                                             *
;                   CRLZH and UNCRLZH v2.0 Overlay File                       *
;                       (For user configuration)                              *
;                                                                             *
;******************************************************************************

        ORG     100H


NO      EQU     0               ; First, some definitions.
YES     EQU     0FFH            ;


JMPINS: DS      15H             ; Do not touch. Room for jump instruction,
                                ; Z3 environment descriptor, etc.

AMFLAG: DB      NO              ; "Archive  Mode  Flag". YES  will  cause  the
                                ; program  to  normally run in  the  "archive"
                                ; backup mode, unless toggled back off by  the
                                ; /A  command line option. Since this is  sort
                                ; of a specialty mode, this byte should  prob-
                                ; ably be left NO.

QMFLAG: DB      NO              ; "Quiet  Mode Flag". YES to have the  program
                                ; default to "quiet" mode, NO for normal "ver-
                                ; bose"  mode. In quiet mode the program  will
                                ; not display lots of churning numbers on  the
                                ; screen during operation. Corresponds to  the
                                ; /Q command line option which will toggle the
                                ; default mode defined here.

OVFLAG: DB      YES             ; "Overwrite  Without  Prompt Flag".  If  YES,
                                ; existing files will be overwritten without a
                                ; prompt;  NO to have the program  always  ask
                                ; for  confirmation befor doing this. The  de
                                ; fault mode defined here can be toggled  here
                                ; by the /O command line option.

TDFLAG: DB      NO              ; "Turbo-DOS  Flag". YES if running  Turbo-Dos
                                ; or other operating system which claims  CP/M
                                ; Plus compatibility but does not actually im-
                                ; plement multisector I/O properly.  Otherwise
                                ; use NO here.


TMFLAG: DB      NO              ; "Confirm  (tag) Mode Flag". YES to have  the
                                ; program  default to the "tag" mode of  oper-
                                ; ation  everytime  its is  invoked.  Normally
                                ; this  should be NO, and the mode can be  in-
                                ; voked  with the the /C (alternate: /T)  com-
                                ; mand line option.

WBFLAG: DB      NO              ; "Warm  Boot  Flag". YES if if you  want  the
                                ; program to perform a "warm boot", as opposed
                                ; to  a  return to the CCP, each time  its  is
                                ; run.  Normally NO, but included  for  people
                                ; running  systems who have reason to  believe
                                ; that the CCP will not remain resident (Note:
                                ; 2k CCP size assumed).

BFFLAG: DB      NO              ; "Bigger  File Flag". YES means  the  program
                                ; will NOT ask the question "Result file  lar-
                                ; ger  than  original. Keep it  anyway?"  (The
                                ; file  will always be kept). Normally NO;  in
                                ; v1.1,  this question is only asked when  the
                                ; destination  drive and user areas are  iden-
                                ; tical. See NOTES11.DOC for more information.

MAXUSR: DB      31              ; "Maximum User Code Allowed".  Similar to
                                ; MAXDRV, below. Note however that the command
                                ; line  parser will reject all  references  to
                                ; values  above  15 no matter  what.  In  this
                                ; case,  you don't even get an  "Invalid  User
                                ; Area"  message, you will get "Invalid  Argu-
                                ; ment". 31 user areas are NOT currently  sup-
                                ; ported. 


MAXDRV: DB      16              ; "Maximum  Drive allowed". The  default
                                ; value here is 16, effectively  dis-
                                ; abling  the feature. If you so  desire,  you
                                ; may  enter a value here ("A" = 2, "B"  =  3,
                                ; etc), in which case the program will  inter-
                                ; cept any references to higher drives (giving
                                ; an "Invalid Drive" error). This feature  has
                                ; very  little usefulness in practice. If  you
                                ; leave  this feature deactivated, your  oper-
                                ; ating system will gladly tell you about  the
                                ; invalid drive spec when it gets it.

SYSFL:	DB	NO		; Yes or no to include system files.

WILDEF: DB      'Y'             ; This is used by UNCRLZH (but
                                ; space is allocated for it in the CRLZH
                                ; program).  This parameter is used to
                                ; define what char to use as the middle char
                                ; of the extension when it is .* (???). 'Y' sez
                                ; try .?Y? only.  (UNCR was not configurable,
                                ; but ALWAYS used ?Z?)

;------------------------------------------------------------------------------

; Filetype Exclusion List (*USED* by CRLZH only, but present in UNCRLZH)

; The next 30 (decimal) bytes may contain up to 10 three-letter filename  suf-
; fixes.  When  encountered, no attempt will be made to compress  these  files
; unless  explicitly  specified; they will be either copied  or  ignored.  For
; further information, see PATCH11.DOC and NOTES11.DOC.

;------------------------------------------------------------------------------
;
; File type exclusion list. Fill in order, leave zeroes in unused locations!!
;
;              |  1  |  2  |  3  |  4  |  5  |
EXTBL:  DB      'ARC','ARK','LBR',0,0,0,0,0,0

;              |  6  |  7  |  8  |  9  |  10 |
        DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

; ***** End of user configuration area *****

        END
