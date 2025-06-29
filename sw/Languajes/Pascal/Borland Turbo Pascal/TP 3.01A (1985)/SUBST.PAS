PROGRAM substitute(input, output);
CONST
  version     = 'SUB V1.04 (21-Oct-85)';
  bufferSize  = 128;
  bufferBytes = 16384; (* bufferSize*128 *)
  maxLen      = 120;
  eofChar     = #26;
  CR          = #13;
  LF          = #10;
  TAB         = #9;
  DEL         = #127;
  BS          = #8;

TYPE
  bufferedFile =
    RECORD
      f       : FILE;
      remrecs : integer;
      buffer  : ARRAY [1..bufferBytes] OF char;
      iop     : 0..bufferBytes
    END;
  line = string [maxLen];
  fileName = string [14];


FUNCTION min(a, b : integer):integer;
  BEGIN
    IF a<b THEN
      min:=a
    ELSE
      min:=b
  END;

PROCEDURE getBuffer(VAR f : bufferedFile);
  VAR
    recs : integer;

  PROCEDURE endBuffer(pos : integer);
    BEGIN
      f.buffer[pos]:=eofChar;
      f.buffer[pos+1]:=LF;
      f.buffer[pos+2]:=eofChar
    END;

  BEGIN
    recs:=min(f.remrecs, bufferSize); f.iop:=1;
    IF recs=0 THEN
      endBuffer(1)
    ELSE
      BEGIN
        f.remrecs:=f.remrecs-recs; blockread(f.f, f.buffer, recs);
        IF (f.remrecs=0) AND (recs<bufferSize) THEN
          endBuffer(recs*128+1)
      END
  END;

PROCEDURE openRead(VAR f : bufferedFile; name : fileName);
  BEGIN
    assign(f.f, name); reset(f.f); f.remrecs:=fileSize(f.f); f.iop:=0
  END;

PROCEDURE openWrite(VAR f : bufferedFile; name: fileName);
  BEGIN
    assign(f.f, name); rewrite(f.f); f.iop:=0
  END;

PROCEDURE putBuffer(VAR f : bufferedFile);
  BEGIN
    WHILE f.iop MOD 128<>0 DO
      BEGIN
        f.iop:=f.iop+1; f.buffer[f.iop]:=eofChar
      END;
    blockwrite(f.f, f.buffer, f.iop DIV 128); f.iop:=0
  END;

PROCEDURE closeWrite(VAR f : bufferedFile);
  BEGIN
    putBuffer(f); close(f.f)
  END;

PROCEDURE writeChar(VAR f : bufferedFile; ch : char);
  BEGIN
    IF f.iop=bufferBytes THEN
      putBuffer(f);
    f.iop:=f.iop+1; f.buffer[f.iop]:=ch
  END;

PROCEDURE writeLine(VAR f : bufferedFile; l : line);
  VAR
    i : integer;
  BEGIN
    FOR i:=1 TO length(l) DO
      writeChar(f, l[i])
  END;

FUNCTION isEof(VAR f : bufferedFile):boolean;
  BEGIN
    IF f.iop=0 THEN
      getBuffer(f);
    isEof:=f.buffer[f.iop]=eofChar
  END;

PROCEDURE readChar(VAR f : bufferedFile; VAR ch : char);
  BEGIN
    IF f.iop=0 THEN
      getBuffer(f);
    ch:=f.buffer[f.iop];
    IF f.iop=bufferBytes THEN
      f.iop:=0
    ELSE
      f.iop:=f.iop+1
  END;

FUNCTION normal(x :char):char;
  BEGIN
    IF x>=#128 THEN
      normal:=chr(ord(x)-128)
    ELSE
      normal:=x
  END;

PROCEDURE readLine(VAR f : bufferedFile; VAR l : line);
  VAR
    ch : char;
  BEGIN
    l:='';
    REPEAT
      readChar(f, ch); l:=l+ch
    UNTIL normal(ch)=LF
  END;

PROCEDURE outCh(ch : char; blank:boolean);
  BEGIN
    ch:=normal(ch);
    IF ch=CR THEN
      write('CR')
    ELSE IF ch=LF THEN
      write('LF')
    ELSE IF ch=TAB THEN
      write('TAB')
    ELSE IF ch=DEL THEN
      write('DEL')
    ELSE IF ch<' ' THEN
      write('^',chr(ord(ch)+64))
    ELSE
      write(ch);
    IF blank THEN
      write(' ')
  END;

PROCEDURE display(l : line; blank:boolean);
  VAR
    i : integer;
  BEGIN
    FOR i:=1 TO length(l) DO
      IF blank OR (l[i]<>LF) AND (l[i]<>CR) THEN
        outCh(l[i], blank)
  END;

PROCEDURE getLine(VAR l : line; prompt : line);
  VAR
    ch : char;
    finis, ctrlp : boolean;
  BEGIN
    l:=''; finis:=FALSE; ctrlp:=FALSE; write(prompt);
    REPEAT
      read(kbd, ch);
      IF ((ch=BS) OR (ch=DEL)) AND NOT ctrlp THEN
        BEGIN
          IF length(l)>0 THEN
            BEGIN
              delete(l, length(l), 1); write(CR, prompt); display(l,TRUE);
              clrEol
            END
        END
      ELSE IF (ch=CR) AND NOT ctrlp THEN
        finis:=TRUE
      ELSE IF length(l)<maxLen THEN
        BEGIN
          IF (ch=^P) AND NOT ctrlp THEN
            ctrlp:=TRUE
          ELSE
            BEGIN
              ctrlp:=FALSE; l:=l+ch; outCh(ch, TRUE)
            END
        END
    UNTIL finis
  END;

FUNCTION segment(x : line; s,e : integer):line;
  BEGIN
    segment:=copy(x, s, e-s+1)
  END;

CONST
  maxSub   = 16;
  maxNames = 16;

VAR
  inFile, outFile : bufferedFile;
  inputLine, normalLine : line;
  finis : boolean;
  subFrom, subTo : ARRAY [1..maxSub] OF line;
  num : 0..maxSub;
  h, i, j, spos, offset, delta, lenN, lenF, lt, change, total,
  lineCount : integer;
  inNames : ARRAY [1..maxNames] OF fileName;
  n : 0..maxNames;
  success : ARRAY [1..maxSub, 1..maxNames] OF integer;
  changed : ARRAY [1..maxNames] OF boolean;

PROCEDURE initFlags;
  VAR i,j:integer;
  BEGIN
    FOR i:=1 TO maxSub DO
      FOR j:=1 TO maxNames DO
        success[i,j]:=0;
    FOR i:=1 TO maxNames DO
      changed[i]:=FALSE
  END;

PROCEDURE normalize;
  VAR
    i : integer;
  BEGIN
    normalLine:=inputLine; lenN:=length(normalLine);
    FOR i:=1 TO lenN DO
      normalLine[i]:=normal(normalLine[i]);
    offset:=0
  END;

BEGIN
writeln(version); writeln; n:=0; finis:=FALSE; initFlags; lineCount:=0;
REPEAT
  write('Eingabe: '); readln(inputLine);
  IF inputLine='' THEN
    finis:=TRUE
  ELSE IF n<maxNames THEN
    IF inputLine[1]='@' THEN
      BEGIN
        openRead(inFile, segment(inputLine, 2, length(inputLine)));
        WHILE NOT isEof(inFile) AND (n<maxNames) DO
          BEGIN
            readLine(inFile, inputLine);
            n:=n+1; inNames[n]:=segment(inputLine, 1, length(inputLine)-2);
            writeln('         ',inNames[n])
          END;
        close(inFile.f)
      END
    ELSE
      BEGIN
        n:=n+1; inNames[n]:=inputLine
      END
UNTIL finis;
finis:=FALSE; num:=0;
REPEAT
  getLine(inputLine, 'Ersetze: '); writeln;
  IF inputLine='' THEN
    finis:=TRUE
  ELSE
    BEGIN
      num:=num+1; subFrom[num]:=inputLine; getLine(subTo[num], '  Durch: ');
      writeln
    END
UNTIL (num=maxSub) OR finis;
FOR j:=1 TO n DO
  BEGIN
    openRead(inFile, inNames[j]); openWrite(outFile, '$$$.OUT');
    REPEAT
      readLine(inFile, inputLine); lineCount:=lineCount+1; normalize;
      FOR i:=1 TO num DO
        BEGIN
          h:=pos(subFrom[i], normalLine);
          IF h>0 THEN
            BEGIN
              changed[j]:=TRUE;
              lenF:=length(subFrom[i]); lt:=length(subTo[i]); delta:=lt-lenF;
              REPEAT
                success[i,j]:=success[i,j]+1;
                write(inNames[j], ' '); display(inputLine, FALSE); writeln;
                inputLine:=concat(
                segment(inputLine, 1, h+offset-1),
                subTo[i],
                segment(inputLine,h+offset+lenF,length(inputLine)));
                h:=h+lenF; spos:=pos(subFrom[i], segment(normalLine, h, lenN));
                IF spos>0 THEN
                  h:=h+spos-1;
                offset:=offset+delta
              UNTIL spos=0;
              normalize
            END
        END;
      writeLine(outFile, inputLine)
    UNTIL isEof(inFile);
    close(inFile.f);
    IF changed[j] THEN
      BEGIN
        closeWrite(outFile); erase(inFile.f); rename(outFile.f, inNames[j])
      END
    ELSE
      BEGIN
        close(outFile.f); erase(outFile.f)
      END
  END;
writeln; change:=0;
FOR i:=1 TO n DO
  IF changed[i] THEN
    change:=change+1;
IF change>0 THEN
  BEGIN
    IF change=1 THEN
      writeln('Folgende Datei wurde geaendert: ')
    ELSE
      writeln('Folgende Dateien wurden geaendert: ');
    FOR i:=1 TO n DO
      IF changed[i] THEN
        writeln('    ', i:2, ': ', inNames[i]);
    writeln;
    FOR i:=1 TO num DO
      BEGIN
        display(subFrom[i], TRUE); total:=0; write('  :  ');
        FOR j:=1 TO n DO
          IF success[i, j]>0 THEN
            BEGIN
              total:=total+success[i,j]; write(success[i,j],'(',j,')  ')
            END;
        IF total>0 THEN
          writeln('Total: ',total)
        ELSE
          writeln('Keine Ersetzung')
      END
    END
  ELSE
    writeln('Keine Ersetzung');
writeln; writeln('Verarbeitete Zeilen: ',lineCount)
END.
