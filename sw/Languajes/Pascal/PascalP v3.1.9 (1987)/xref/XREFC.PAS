PROGRAM xrefc(textfile, listfile, input, output);
(* non-standard Pascal features used, see {} or $s- in col. 1 *)
(* Created from "xref 2.3"                                    *)
(* ---------------------------------------------------------- *)
(*        CROSS-REFERENCE GENERATOR FOR C PROGRAMS            *)
(* Versions exist for Pascal, C, 8080/z80/8086 Assy languages *)
(* Execution time, (XREF) operating on own source code:       *)
(* (30 Oct. 80)       with run-time checks  on        off     *)
(*                                        ========  ========  *)
(*   HP3000 - CPU time -                    39 sec.   33 sec. *)
(*   RUNPCD 8080 interp, 518 ns. clock 16.4 min. 13.8 min.    *)
(*   8080 Native, 518 ns clk, 17 Oct. 81   3.5 min.           *)
(*                                                            *)
(*  by C.B.Falconer, 680 Hartford Tpk,                        *)
(*                   Hamden, Conn. 06517      (203) 281-1438  *)
(*                                                            *)
(* 30 Dec. 1986. Allowed for "" or <> include delimiters.     *)
(*   2.6         Input via readstring facility PascalP 3.1.8  *)
(*               No heap size report. Graceful heap o'flow.   *)
(* 18 Mar. 1986. Expanded table to full C reserved set.       *)
(*               Upper/lower case input distinguished.        *)
(*               Copyright message emitted.                   *)
(* 14 Jan. 1984. Using "c" flavor include commands. Follow is *)
(*               controlled by parm 100 digit.                *)
(* 31 Oct. 1983. Parm=100 (hundreds digit odd) causes all     *)
(*               includes ($i'fname') to be tracked.          *)
(* 17 Nov. 1982. "Full" xref ability. 1st crack at making     *)
(*               useful with non-std WordStar text files.     *)
(* 11 Nov. 1982. Added ability to cross-ref integer values.   *)
(*               First provisions for heap overflow made.     *)
(* 24 Oct. 1982. Segmented for maximum isolation.             *)
(* 17 Oct. 1982. Overflow on 95% hash table use.  Final sort  *)
(*               changed to quicksort.  Using std procs for   *)
(*               dater, getparm, filename, lsri (intrinsics)  *)
(*               Textfile close after reading complete.       *)
(* 12 Jun. 1982. Added ability to restrict identifiers used   *)
(*               to break up runs where heap space is         *)
(*               insufficient for a single pass.              *)
(* 12 Mar. 1982. Corrected table overflow detection.          *)
(* 2 Nov., 1980. Revised to further reduce hashtable size.    *)
(*               Only 2 include levels are now available.     *)
(*               "magic" is optimized at 6 for systems where  *)
(*               a heap assignment requires 2 words of over-  *)
(*               head.  If no overhead, then 4 is optimum.    *)
(*               This is based on cross-referancing the com-  *)
(*               piler source code.  The overhead will be     *)
(*               required when both systems handle dispose    *)
(*               and mark/release simultaneously.             *)
(* 30 Oct. 1980. Revised to use only text files and to        *)
(*               suppress multiple listings of line-nos.      *)
(*               Added output of heap usage, and changed      *)
(*               const "magic" from 5 to 4 to minimize        *)
(*               heap usage on the compiler source. Hash      *)
(*                table size was reduced from 1499 to 1201    *)
(* 30 Jul. 1980. Revised to use "getparm" and nest includes   *)
(* 15 Feb. 1980. For genesis, see credits below.              *)
(*                                                            *)
(*  This program has been constructed to minimize heap use    *)
(* and thus to allow large programs to be cross-referanced    *)
(* In addition, provisions have been made for input from      *)
(* variable record length ascii files, with leading line-     *)
(* numbers (8 digit field on the HP3000) and use of the "DLE" *)
(* indentation code at the start of lines.  The program will  *)
(* follow a sequence of "INCLUDE" files.  If input data is    *)
(* unnumbered, a numbered output listing is generated.        *)
(*                                                            *)
(* For comparison, on a large test source file,               *)
(*  lines processed versus maxdata parameter are:             *)
(*                                     (15 Feb. 80)           *)
(*    maxdata       original       this version vs "magic"    *)
(*    (hp3000)      version             3      4       5      *)
(*    =======       =======         =====  =====   =====      *)
(*       8000             0                          437      *)
(*      10000           441          1277            898      *)
(*      12000           910          1927           1738      *)
(*      14000          1367          2295           2139      *)
(*      16000          1867          3089           3059      *)
(*      20000                                       4709      *)
(*      30000          5675         >7000          >7000      *)
(* The "maxdata" parameter, on the HP3000, specifies the max- *)
(* imum data space, in 16 bit words, available. This includes *)
(* any space used for system buffers, etc (about 4000 words)  *)
(* The final result is capable of processing a file with in   *)
(* excess of 11000 occurences of identifier refs.  The limit  *)
(* has not been found, but is believed to be about 16000 to   *)
(* 18000 references, with 12 char. identifiers.               *)
(*                                                            *)
(* The program is organized to facilitate changes of input    *)
(* languages, basically by altering the input character set   *)
(* and reserved words (in initialize), and the structure of   *)
(* comments (in scaninput).  The "magic" parameter is usually *)
(* 2 for assembly language (i.e. definition and reference is  *)
(* most common), and 5 for Pascal. This heuristic appears to  *)
(* minimize memory requirements.                              *)
(*                                                            *)
(* The program assumes the ASCII char. set in several places  *)
(*                 W A R N I N G                              *)
(* UPPER and lower case characters occur in the source.  On   *)
(* an uppercase only printer the lower case characters will   *)
(* be mapped into upper case.                                 *)
(* ---------------------------------------------------------- *)

(* ---------------------------------------------------------- *)
(*                                                            *)
(* From "XREF"   -  Robert A Fraley, HP Labs  -   4 Oct 1978  *)
(*                                                            *)
(*   modified from a program by Bary Pollack, UBC, based on a *)
(*   program by N. Wirth  7.5.74                              *)
(*                                                            *)
(*  constant p determines max number of identifiers.          *)
(* ---------------------------------------------------------- *)

  (*  prime numbers for reference.  p must be prime.   *)
  (* 53 211 307 401 503 601 701 809 907 1009 1103 1201 *)
  (* 1301 1409 1499 1597 1699 1789 1889 1999 2099 2203 *)
  (* 2309 2411 2609 2797 2999 3203 3413 3607 3803 4001 *)

  CONST
    head        = 'XREFC (textfile, listfile, input, output) [parm]';
    ver         = ' Ver. 2.6, 30 Dec. 86';
    copyrite    = 'Copyright (c) 1980, 1986 by C.B. Falconer';
    p           = 1699;    (* prime =  size of hashtable  *)
    (* compiler contains approx. 1100 identifiers, so that *)
    (* this should keep table utilization below 95%        *)
    phash       = 13841;   (* constant FOR rehashing  *)
    phash2      = 14153;   (* second rehashing constant *)
    nkmax       = 38;      (* maximum  no. of keywords  *)

    debuga      = false;   (* for hashing debuggery *)
    debugb      = false;   (* include mechanism *)
    debugc      = false;
    debugd      = false;   (* pack *)
    debuge      = false;   (* unpack *)

    fnsize      = 28;      (* size of a filename, max *)

    alfalen     = 12;      (* max identifier length *)
    pklen       = 9;       (* 8 bit words for packed alfa *)
                           (* := 3*((alfalen+3) div 4) *)
    pkmax       = 64;      (* # char (64 max) in packed char set *)
    pkcharmax   = 63;      (* := pkmax -1 *)

(*$s-*)                     (* define limits of chars *)
    nul         = (:0:);
    tab         = (:9:);
    cr          = (:13:);
    rub         = (:127:);
(*$s+*)

    magic       = 5;       (* control heap use, maximize space *)
    (* optimum value depends on statistics of input file. 2 to 10 *)
    (* for assembly, most common case is a label and 1 referance, *)
    (* i.e. use 2; for Pascal the optimum appears to be about 5   *)

    (* numfield * perline + alfalen = output width required *)
    perline     = 11;      (* occurences per line of listing *)
    numfield    = 6;       (* size of line number list field *)

    (* for input system *)
    linemax     = 100;     (* MAX CHARACTERS PER INPUT LINE *)
    linmaxm2    = 98;      (* linemax-2 *)
    numlgh      = 8;       (* length of line number field *)
    indflag     = 16;      (* text indentation signal=dle *)
    indbase     = ' ';     (* base for blank count *)
    linetrunc   = 100;     (* truncate input lines here *)
    maxinclude  = 2;       (* see also incl1txt etc below *)
    heapmargin  = 256;     (* for graceful overflow *)

  TYPE
    alfa        = PACKED ARRAY[1..alfalen] OF char;
    pkalfa      = ARRAY[1..pklen] OF char;
    ascii       = nul..rub;  (* the char. set used *)
    index       = 0..p;
    line        = PACKED ARRAY[1..linemax] OF char;

    keyptr      = ^listhdr;
    listptr     = ^list;

    listhdr     = RECORD
      id          : pkalfa;
      last        : listptr;
      END; (* listhdr *)

    list        = RECORD
      linums      : ARRAY[1..magic] OF integer;
      next        : listptr;
      END; (* list *)

    pkval       = 0..pkcharmax;

    dltype      = PACKED ARRAY[1..15] OF char;     (* for dateline *)
    fntyp       = PACKED ARRAY[1..fnsize] OF char; (* for filename *)

  VAR
    n           : integer;      (* current line number  *)
    i           : integer;      (* handy *)
    totlines    : integer;      (* count of lines input *)

    idcount,
    refcount    : integer;      (* frequency counters  *)
    nc, nco     : integer;      (* number of collisions  *)

    a, blank    : alfa;         (* identifier buffer  *)
    apk         : pkalfa;       (* packed id buffer *)

    hashtbl     : ARRAY[index] OF keyptr;     (* hash table  *)

    nk          : integer;      (* reserved words in table *)
    rsdwd       : ARRAY[1..nkmax] OF pkalfa; (* reserved words *)

    letters,
    digits,
    alfamerics  : SET OF char;
    chscale     : ARRAY[ascii] OF pkval;
    chexpand    : ARRAY[pkval] OF char;

    (* for input buffering scheme *)
    textfile,
    incl1txt,
    incl2txt    : text;
    (* WARNING - number of files must agree with maxinclude *)
    (*           and with code in "getline"                 *)
    inclevel    : 0..maxinclude; (* 0 for master file *)
    listfile    : text;
    filebuff,
    inbuff      : line;
    chcnt       : integer;     (* character counter *)
    ch          : char;        (* last character *)
    numbered    : boolean;     (* front numbered source file*)
    linelen,                   (* current source length *)
    linewidth   : integer;     (* source line width *)
    moretext,
    eol         : boolean;     (* end of line/input flag *)
    mustlist,                  (* to force source list *)
    allowlist   : boolean;     (* to suppress listings *)
    firstchars  : SET OF char; (* if ids restricted *)
    follow,                    (* all include files *)
    full,                      (* xref all identifiers *)
    numerics,                  (* xref numeric constants *)
    restricted  : boolean;     (* to reduce identifiers *)
                               (* accepted, when heap space *)
                               (* is insufficient for full  *)
                               (* xref.  Allows multiple    *)
                               (* partial runs to complete  *)

  (* 1---------------1 *)

(*$s'outerblk'*)
  PROCEDURE packword(a : alfa; VAR apk : pkalfa);
  (* pack four chars into 3 bytes, preserve lex. order *)

    VAR
      i, j, k, l : integer;

    BEGIN (* packword *)
    k := 0; i := 0; l := 0;
    IF debugd THEN writeln(a);
    FOR j := 1 TO alfalen DO BEGIN
      k := lsl(k, 6) + chscale[a[j]];         (* insert 6 bits *)
      IF l <> 0 THEN BEGIN
        i := succ(i);               (* pick off the top 8 bits *)
        apk[i] := chr(mask(lsr(k, 6 - l), 255)); END;
      l := succ(succ(l));
      IF l = 8 THEN l := 0; END;
    IF debugd THEN BEGIN
      FOR j := 1 TO pklen DO write(ord(apk[j]) : 4);
      writeln; END;
    END; (* packword *)

  (* 1---------------1 *)

(*$s'nonbusyseg'*)
  PROCEDURE initialize;

    VAR
      c   : char;
      i   : integer;
     dl   : dltype;    (* for dateline *)
     fn   : fntyp;     (* for filename *)

    (* 2---------------2 *)

    PROCEDURE enterword(wd : alfa); (* into rsdwd table *)

      BEGIN (* enterword *)
      packword(wd, apk);
      nk := succ(nk); (* keep track of number entered *)
      rsdwd[nk] := apk;
      END; (* enterword *)

    (* 2---------------2 *)

    PROCEDURE setfirstchars;

      VAR
        ch, ch1  : char;
        i        : integer;
        accept   : boolean;
        theset   : SET OF char;

      (* 3---------------3 *)

      PROCEDURE readupshift(VAR c : char);

        BEGIN (* readupshift *)
        readln(c);
        IF c IN ['a'..'z'] THEN
          c := chr(ord(c) - ord('a') + ord('A'));
        END; (* readupshift *)

      (* 3---------------3 *)

      PROCEDURE downshift(VAR c : char);

        BEGIN (* downshift *)
        c := chr(ord(c) + ord('a') - ord('A'));
        END; (* downshift *)

      (* 3---------------3 *)

      BEGIN (* setfirstchars *)
      REPEAT
        prompt('Accept or reject ids with first chars (a/r)?');
        readupshift(ch);
      UNTIL ch in ['A', 'R'];
      accept := ch = 'A';
      REPEAT
        write('First char. to ');
        IF accept THEN prompt('accept ?')
        ELSE prompt('reject ?');
        readupshift(ch);
      UNTIL ch IN ['A'..'Z'];
      REPEAT
        write('Last char. to ');
        IF accept THEN prompt('accept ?')
        ELSE prompt('reject ?');
        readupshift(ch1);
      UNTIL (ch1 IN [ch..'Z']);
      theset := [ch..ch1];
      downshift(ch); downshift(ch1);
      theset := theset + [ch..ch1];
      IF accept THEN firstchars := theset
      ELSE firstchars := firstchars - theset;
      END; (* setfirstchars *)

    (* 2---------------2 *)

    BEGIN (* initialize *)
    writeln(head, ver);
    writeln(copyrite);
    IF getparm = 0 THEN BEGIN
      write('Parm=2/4 to suppress/force source list, ');
      writeln('else only un-numbered source listed');
      writeln('Add 10 to restrict identifiers, 20 for numeric values');
      writeln('Add 40 to include C reserved words');
      writeln('Add 100 to follow all #include files'); END;
    IF NOT exists(textfile) THEN BEGIN
      writeln('no source file'); terminate; END;
    rewrite(listfile); (* after opening textfile, protection *)
{}  i := getparm MOD 10;
    allowlist := NOT odd(i DIV 2); (* parm=2 to suppress *)
    mustlist := allowlist AND odd(i DIV 4); (* 4 forces *)
{}  i := (getparm DIV 10) MOD 10; firstchars := [nul..rub];
    restricted := odd(i);
    numerics   := odd(i DIV 2);
    full       := odd(i DIV 4);
    follow     := odd(getparm DIV 100);
    (* hundreds digit up available for further expansion *)
    IF restricted THEN setfirstchars;
    eol := true; inclevel := 0;
    ch := ' '; chcnt := 0; linelen := linemax;
    linewidth := linetrunc; (* ignore input past this column *)
{}  dater(dl); filename(textfile, fn);
    writeln(listfile);
    writeln(listfile, fn, '** CROSS-REFERENCE **', dl : 20);
    writeln(listfile);
    moretext := NOT eof(textfile);
    n := 0; idcount := 0; refcount := 0; nc := 0; nco := 0;
    totlines := 0;

    FOR i := 0 TO p DO hashtbl[i] := NIL;

    FOR i := 1 TO alfalen DO blank[i] := ' ';

    (* this controls the character set in identifiers *)
    (* W A R N I N G  depends on contiguous alpha character set *)
    digits := ['0'..'9']; letters := ['A'..'Z', 'a'..'z', '_'];
    alfamerics := letters + digits;

    (* this controls the apparent character ordering *)
    (* W A R N I N G  depends on contiguous alpha character set *)
    FOR c := nul TO rub DO chscale[c] := 0;
    chexpand[0] := ' ';
    FOR c := '0' TO '9' DO BEGIN
      chscale[c] := ord(c) - ord('0') + 1;
      chexpand[chscale[c]] := c; END;
{}  FOR c := 'A' TO 'Z' DO BEGIN
      chscale[c] := 2*(ord(c) - ord('A')) + 11;
      chexpand[chscale[c]] := c; END;
{}  FOR c := 'a' TO 'z' DO BEGIN (* lower case *)
      chscale[c] := 2*(ord(c) - ord('a')) + 12;
      chexpand[chscale[c]] := c; END;
    chscale['_'] := 63; chexpand[63] := '_';

    (* must modify length if alfalen changed *)
    nk := 0; (* allows easy reserved word list modification *)
    enterword('auto        ');  (* alphabetical order *)
    enterword('break       ');
    enterword('case        ');
    enterword('char        ');
    enterword('continue    ');
    enterword('default     ');
    enterword('do          ');
    enterword('double      ');
    enterword('else        ');
    enterword('entry       ');
    enterword('extern      ');
    enterword('float       ');
    enterword('for         ');
    enterword('goto        ');
    enterword('if          ');
    enterword('int         ');
    enterword('long        ');
    enterword('register    ');
    enterword('return      ');
    enterword('short       ');
    enterword('sizeof      ');
    enterword('static      ');
    enterword('struct      ');
    enterword('switch      ');
    enterword('typedef     ');
    enterword('union       ');
    enterword('unsigned    ');
    enterword('while       ');
    END; (* initialize *)

  (* 1---------------1 *)

(*$s'phase2'*)
  PROCEDURE printbl;

    VAR
      i, j, m : index;
      x,w     : keyptr;
      junk    : boolean; (* unused *)
      depth   : integer;

    (* 2---------------2 *)

    PROCEDURE printword(k : keyptr);

      VAR
        i   : 0..magic;
        l   : 0..perline;
        x   : listptr;
        a   : alfa;

      (* 3---------------3 *)
{}
      PROCEDURE unpackword(apk : pkalfa; VAR a : alfa);
      (* unpack four characters from 3 bytes *)

        VAR
          i, j, k, l :  integer;

        BEGIN (* unpackword *)
        IF debuge THEN BEGIN
          FOR i := 1 TO pklen DO write(ord(apk[i]) : 4);
          writeln; END;
        j := 0; k := 0; l := 0;
        FOR i := 1 TO pklen DO BEGIN
          k := k + ord(apk[i]);
          j := succ(j); l := succ(succ(l));
          a[j] := chexpand[mask(lsr(k, l), 63)];
          IF l = 6 THEN BEGIN
            j := succ(j); a[j] := chexpand[mask(k, 63)];
            l := 0; k := 0; END;
          k := lsl(k, 8); END;
        IF debuge THEN writeln(a);
        END; (* unpackword *)

      (* 3---------------3 *)

      BEGIN (* printword *)
      unpackword(k^.id, a);
      write(listfile, a);
      x := k^.last; l := 0; i := magic;
      REPEAT
        IF i = magic THEN BEGIN
          i := 1; x := x^.next; END
        ELSE i := succ(i);
        IF x^.linums[i] <> 0 THEN BEGIN
          IF l = perline THEN BEGIN
            l := 0; writeln(listfile);
            write(listfile, ' ' : alfalen); END;
          write(listfile, x^.linums[i] : numfield);
          l := succ(l); END;
      UNTIL (x = k^.last) AND (i = magic);
      writeln(listfile)
      END; (* printword *)

    (* 2---------------2 *)

    PROCEDURE sort(l, r : index);
    (* Quicksort, almost directly from Wirth *)

      VAR
        i, j     : integer; (* needs minindex-1..maxindex+1 *)

      BEGIN (* sort *)
      IF debugc THEN BEGIN
        depth := succ(depth);
        writeln(' ' : depth, 'sort(', l : 1,', ', r : 1, ')'); END;
      x := hashtbl[l]; i := l; j := r;
      REPEAT
        WHILE (x^.id > hashtbl[i]^.id) DO i := succ(i);
        WHILE (hashtbl[j]^.id > x^.id) DO j := pred(j);
        IF i <= j THEN BEGIN
          w := hashtbl[i]; hashtbl[i] := hashtbl[j];
          hashtbl[j] := w; i := succ(i); j := pred(j); END;
      UNTIL i > j;
      IF j - l < r - i THEN BEGIN
        IF l < j THEN sort(l, j);
        IF i < r THEN sort(i, r); END
      ELSE BEGIN
        IF i < r THEN sort(i, r);
        IF l < j THEN sort(l, j); END;
      IF debugc THEN depth := pred(depth);
      END; (* sort *)

    (* 2---------------2 *)

    BEGIN (* printbl *)
    m := pred(p); i := 0;
    WHILE i <= m DO BEGIN (* coalesce table *)
      IF hashtbl[i] = NIL THEN BEGIN
        WHILE (hashtbl[m] = NIL) AND (m > i) DO m := pred(m);
        hashtbl[i] := hashtbl[m];
        IF m > 0 THEN m := pred(m); END;
      i := succ(i); END;
    (* now only indices 0..m are in use *)
    depth := 0; sort(0, m);
    FOR i := 0 TO m DO printword(hashtbl[i]);
    END; (* printbl *)

  (* 1---------------1 *)

(*$s'phase1'*)
  PROCEDURE scaninput;

    (* 2---------------2 *)

    PROCEDURE nextch;
    (* Apart from dependence on the ASCII char set, this   *)
    (* should be the only area requiring alteration for    *)
    (* installation on other systems.  The following       *)
    (* constructs may create problems:                     *)
    (*     string[variable FOR constant] is a substring    *)
    (*     reset(f,name) opens external file "name"        *)
    (* Other constructs (i.e. $INCLUDE) are dependant on   *)
    (* on system conventions, and must be customized.      *)
    (*                                                     *)
    (* returns the next character of source text in "ch".  *)
    (* returns a blank for eol, and handles "INCLUDE" file *)
    (* access.  Indentation codes (i.e. DLE n) are ignored *)
    (* since they may only occur at the start of a line.   *)
    (* If the file is un-numbered, each line is listed     *)
    (* with the appropriate indentation.  "INCLUDE" files, *)
    (* if un-numbered, cause the line number to advance to *)
    (* the next multiple of 1000.  In addition, numbered   *)
    (* input lines will ignore the fractional portion      *)
    (* (to the HP3000 editor) of the line-number.  Thus    *)
    (* line number 1234.5 will be cross referanced as line *)
    (* 1234, etc.                                          *)

      LABEL 11;

      VAR
        tabfound : boolean; (* readaline/writeline interface *)

      (* 3---------------3 *)

      PROCEDURE writeline;

        VAR
          column, i : integer;
          ch        : char;

        BEGIN (* writeline *)
        IF mustlist OR (NOT numbered AND allowlist) THEN BEGIN
          write(listfile, n : 5, ' ');
          IF tabfound THEN BEGIN (* allow for source with tabs *)
            i := 1; column := 0; (* current column *)
            IF (linelen > 1) AND (inbuff[1] = chr(indflag)) THEN BEGIN
              column := ord(inbuff[2]) - ord(indbase);
              IF column > 0 THEN write(listfile, ' ' : column);
              i := 3; END;
            FOR i := i TO linelen DO BEGIN (* expanding tabs *)
              ch := inbuff[i];
              IF ch = tab THEN
                REPEAT (* ensure at least one space *)
                  write(listfile, ' '); column := succ(column);
                UNTIL column MOD 8 = 0
              ELSE BEGIN
                write(listfile, ch); column := succ(column); END;
              END;
            END
          ELSE IF (linelen < 2) OR (inbuff[1] <> chr(indflag)) THEN
            write(listfile, inbuff : linelen)
          ELSE BEGIN (* indent *)
            write(listfile, ' ' : (ord(inbuff[2]) - ord(indbase)));
  (*$s-*)   write(listfile, inbuff[3 FOR linmaxm2] : linelen-2); END;
  (*$s+*) writeln(listfile); END;
        END; (* writeline *)

      (* 3---------------3 *)

      PROCEDURE getline;

        LABEL 1, 3;

        VAR
          llen, i, j : integer;
          eofincl    : boolean;

        (* 4---------------4 *)

(*$x+,d-,n- no runtime checks here *)
        PROCEDURE numcheck;

          VAR
            j : integer;

          BEGIN (* numcheck *)
          j := 0;
          IF llen < numlgh THEN numbered := false
          ELSE
            REPEAT
              j := succ(j);
              numbered := filebuff[j] IN digits;
            UNTIL NOT numbered OR (j = numlgh);
          IF numbered THEN BEGIN
            n := 0; (* use input line number *)
            FOR j := 1 to 5 DO
              n := 10 * n + ord(filebuff[j]) - ord('0'); END
          ELSE n := succ(n);
          END; (* numcheck *)

        (* 4---------------4 *)

        PROCEDURE readaline(VAR f : text);

          VAR
            ch     : char;

          BEGIN (* readaline *)
          tabfound := false; (* so writeline knows about it *)
          IF eof(f) THEN BEGIN
            close(f); eofincl := true; END
          ELSE BEGIN
            eofincl := false;
            readln(f, filebuff); llen := length(filebuff);
            tabfound := scanfor(tab, filebuff, llen) > 0; END;
          END; (* readaline *)
(*$x- restore options *)

        (* 4---------------4 *)

        BEGIN (* getline *)
   1:   llen := 0;
        IF inclevel > 0 THEN BEGIN
          IF inclevel = 1 THEN readaline(incl1txt)
          ELSE readaline(incl2txt);
          IF eofincl THEN BEGIN
            IF debugb THEN BEGIN
              writeln('exit include at line ', n : 0); END;
            inclevel := pred(inclevel); GOTO 1; END;
          END
        ELSE IF eof(textfile) THEN GOTO 3
        ELSE readaline(textfile);
        numcheck; (* check FOR numbered FILE *)
        totlines := succ(totlines); eol := false;
        chcnt := 0; linelen := linewidth;
        IF numbered THEN BEGIN
          (* adjust parameters AND eol conditions *)
          llen := llen - numlgh;
          FOR i := 1 TO succ(llen) (* include eos mark *) DO
            inbuff[i] := filebuff[i + numlgh]; END
        ELSE inbuff := filebuff;
        IF llen < linewidth THEN linelen := llen;
        IF (inbuff[1] = '#') AND (linelen > 9) AND follow THEN BEGIN
          IF inbuff[9] = tab THEN inbuff[9] := ' ';
(*$s-*)   IF inbuff[1 FOR 9] = '#include ' THEN BEGIN
(*$s+*)     writeline;
            i := scanwhile(' ', inbuff[9], length(inbuff)-9) + 8;
            IF debugb THEN writeln('"', inbuff[i], '"@', i : 1);
            IF inbuff[i] IN ['"', '<'] THEN BEGIN (* strip delims *)
              IF inbuff[i] = '"' THEN
                j := scanfor('"', inbuff[succ(i)], length(inbuff) - i)
              ELSE
                j := scanfor('>', inbuff[succ(i)], length(inbuff) - i);
              IF debugb THEN writeln('"', inbuff[i+j], '"@', i+j : 1);
              IF j > 0 THEN inbuff[i+j] := nul; (* remark end of string *) 
              i := succ(i); END;
            IF inclevel = maxinclude THEN BEGIN
              writeln('too many nested includes, line ', n : 1);
              GOTO 1; END;
            inclevel := succ(inclevel);
            IF inclevel = 1 THEN BEGIN
(*$s-*)       reset(incl1txt, inbuff[i FOR 30]);
(*$s+*)       eofincl := eof(incl1txt); END
            ELSE BEGIN
(*$s-*)       reset(incl2txt, inbuff[i FOR 30]);
(*$s+*)       eofincl := eof(incl2txt); END;
            IF eofincl THEN BEGIN
              inclevel := pred(inclevel); GOTO 1; END;
            IF debugb THEN BEGIN
              writeln('enter include at line ', n : 1); END;
            GOTO 1; END;
          END;
        IF inbuff[1] = chr(indflag) THEN (* dle *)
          chcnt := 2; (* bypass indentation *)
   3:   END; (* getline *)

      (* 3---------------3 *)

(*$x+,d-,n- no run-time checks *)
      BEGIN  (* nextch *)
      IF eol THEN BEGIN
        IF inclevel = 0 THEN (* avoid eof causing get *)
          IF eof(textfile) THEN BEGIN
            moretext := false; GOTO 11; END;
        getline; writeline; END;
11:   ch := ' ';
      IF moretext THEN
        IF chcnt >= linelen THEN eol := true
        ELSE BEGIN
          chcnt := succ(chcnt);
          ch := chr(mask(ord(inbuff[chcnt]), 127)); END;
      END; (* nextch *)

    (* 2---------------2 *)

    FUNCTION notrsdwd(VAR x : pkalfa):  boolean;

      LABEL 1;

      VAR
        i, j, k   : integer;

      BEGIN (* notrsdwd *)
      IF NOT full THEN BEGIN
        notrsdwd := false;
        i := 1; j := nk;
        REPEAT
          k := (i+j) DIV 2;              (*  binary search  *)
          IF (rsdwd[k] > x) THEN j := pred(k)
          ELSE IF rsdwd[k] = x THEN GOTO 1
          ELSE i := succ(k);
        UNTIL i > j; END;
      notrsdwd := true;
  1:  END (* notrsdwd *) ;
(*$x- restore options *)

    (* 2---------------2 *)

    PROCEDURE insert;              (*  linear quotient hash search  *)

      LABEL 1;

      VAR
        d      : index;
        i      : 0..magic;
        found  : boolean;
        h      : integer;
        ct     : integer;
        x      : listptr;
        marg   : ARRAY[1..heapmargin] OF char;
        (* allows remainder of system to execute *)

      (* 3---------------3 *)

      FUNCTION alloc(VAR x : listptr) : boolean;
      (* returns true if successful new(x) executed *)

        BEGIN (* alloc *)
        allocate(x); alloc := x <> NIL;
        END; (* alloc *)

      (* 3---------------3 *)

      FUNCTION newrecord : boolean;

        VAR
          i   : integer;

        BEGIN (* newrecord *)
        IF alloc(x) THEN BEGIN
          newrecord := true; hashtbl[h]^.last := x; x^.linums[1] := n;
          x^.next := hashtbl[h]^.last;
          FOR i := 2 TO magic DO
            x^.linums[i] := 0; (* i.e. empty *) END
        ELSE newrecord := false;
        END; (* newrecord *)

      (* 3---------------3 *)

(*$s'outerblk'*)
      PROCEDURE fullup(VAR f : text);

        BEGIN (* fullup *)
        writeln(f);
        writeln(f, '*** TABLE 95% FULL ***');
        END; (* fullup *)

      (* 3---------------3 *)

(*$s'phase1'*)
      BEGIN  (* insert *)
      d := 0; (* flags not rehashing *)
{}    h := abs(mergebytes(ord(apk[1]), ord(apk[2])) MOD phash +
               mergebytes(ord(apk[3]), ord(apk[4])) MOD phash) MOD p;
      found := false; refcount := succ(refcount); ct := nc;
      REPEAT
        IF hashtbl[h] = NIL THEN BEGIN (* new entry *)
          new(hashtbl[h]); hashtbl[h]^.id := apk;
          IF NOT newrecord THEN BEGIN (* quit on overflow *)
            moretext := false; GOTO 1; END;
          found := true; idcount := succ(idcount);
          IF idcount >= p - p DIV 20 THEN BEGIN
            (* > trunc(0.95 * p); avoids use of real pkg *)
            (* hash algorithm very inefficient when full *)
            fullup(output); fullup(listfile); moretext := false; END;
          nco := nco + (nc-ct); END
        ELSE IF hashtbl[h]^.id = apk THEN BEGIN (* found *)
          WITH hashtbl[h]^ DO BEGIN
            i := 0;
            REPEAT  (* find an empty slot *)
              i := succ(i);
              IF last^.linums[i] = n THEN GOTO 1; (* already stored *)
            UNTIL (i = magic) OR (last^.linums[i] = 0);
            IF last^.linums[i] = 0 THEN (* room in this record *)
              last^.linums[i] := n
            ELSE (* a new record needed *)
              IF alloc(x) THEN BEGIN
                x^.next := last^.next;
                last^.next := x; last := x;
                x^.linums[1] := n;
                FOR i := 2 TO magic DO
                  x^.linums[i] := 0; (* i.e. empty *) END
              ELSE BEGIN (* quit on overflow *)
                moretext := false; GOTO 1; END;
            END; (* WITH hashtbl[h] *)
          found := true; END (* idisequal *)
        ELSE BEGIN (* collision *)
          nc := succ(nc);
          IF d = 0 THEN BEGIN (* first rehash *)
            IF debuga THEN BEGIN
              FOR i := 1 TO 6 DO write(ord(apk[i]) : 3);
              writeln(a : succ(alfalen)); END;
            d := (abs(mergebytes(ord(apk[1]), ord(apk[2])) MOD phash2 +
                      mergebytes(ord(apk[5]), ord(apk[6])) MOD phash2))
                 MOD p;
            IF d = 0 THEN d := 1; END;
          h := h + d;
          IF h >= p THEN h := h - p; END;
      UNTIL found;
1:    END; (* insert *)

    (* 2---------------2 *)

    PROCEDURE formid;

      VAR
        k : integer;

      BEGIN (* formid *)
      k := 0; a := blank;
      REPEAT
        IF k < alfalen THEN BEGIN
          k := succ(k); a[k] := ch; END;
        nextch;
      UNTIL NOT (ch IN alfamerics);
      packword(a, apk);
      END; (* formid *)

    (* 2---------------2 *)

    BEGIN (* scaninput *)
    (* alter definition of a comment here *)
    WHILE moretext DO BEGIN
      IF ch = ' ' THEN nextch
      ELSE IF ch IN letters THEN
        IF restricted THEN BEGIN
          IF ch IN firstchars THEN BEGIN
            formid;
            IF notrsdwd(apk) THEN insert; END
          ELSE
            REPEAT (* skip over id *)
              nextch;
            UNTIL NOT (ch IN digits); END
        ELSE BEGIN
          formid;
          IF notrsdwd(apk) THEN insert; END
      ELSE IF ch IN digits THEN BEGIN
        formid;
        IF numerics THEN insert; END
      ELSE IF ch = '''' THEN BEGIN  (* string constant *)
        REPEAT
          nextch;
        UNTIL (ch = '''') OR NOT moretext;
        IF moretext THEN nextch; END
      ELSE IF ch = '"' THEN BEGIN (* string constant *)
        REPEAT
          nextch;
        UNTIL (ch = '"') OR NOT moretext;
        IF moretext THEN nextch; END
      ELSE IF ch = '/' THEN BEGIN
        nextch;
        IF (ch = '*') AND NOT eol THEN BEGIN (* comment *)
          nextch;
          REPEAT
            WHILE (ch <> '*') AND moretext DO nextch;
            IF moretext THEN nextch;
          UNTIL (ch = '/') OR NOT moretext;
          IF moretext THEN nextch; END;
        END
      ELSE nextch; END; (* of main loop *)
    END; (* scaninput *)

  (* 1---------------1 *)

(*$s'phase2'*)
  PROCEDURE showstats(VAR f : text);

    BEGIN (* showstats *)
    writeln(f);
    writeln(f, idcount : 6,' Identifiers', refcount : 6,' Occurences');
    writeln(f, nco : 6, ' Collisions ', nc : 6, ' Misses');
    END; (* showstats *)

  (* 1---------------1 *)

(*$s'outerblk'*)
  BEGIN  (* xrefc *)
  initialize;
  IF NOT moretext THEN writeln('NO INPUT!!');
  scaninput; (* FILE FOR identifiers  *)
  close(textfile); (* allow others access *)
  writeln(totlines, ' lines read');
  writeln(listfile);
  IF alfalen > 7 THEN i := alfalen + 4
  ELSE i := 12;
  IF idcount > 0 THEN BEGIN
    writeln(listfile, 'IDENTIFIER', 'OCCURRENCES' : i);
    writeln(listfile, '==========', '===========' : i);
    printbl; END;
  showstats(listfile); showstats(output);
  END. (* xrefc *)
®&