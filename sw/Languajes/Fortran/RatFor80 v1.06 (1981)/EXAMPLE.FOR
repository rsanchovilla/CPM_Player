      bytechar
      bytegetc
      callremark(29henter <inputfile >outputfile.)
      callinitio
      continue
23000 if(.not.(getc(char).ne.-1))goto 23001
      callputc(char)
      goto 23000
23001 continue
      callputc(-1)
      stop
      end
                                                                                                                         