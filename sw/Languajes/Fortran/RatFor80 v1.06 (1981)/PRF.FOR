      programprint
      bytename(15)
      integergetarg,openr
      integeri,junk
      byteslist(5)
      dataslist/67,79,78,58,-2/
      continue
      i=1
23000 if(.not.(getarg(i,name,15).ne.-1))goto 23002
      if(.not.(openr(5,0,64,name,3hRAT).eq.0))goto 23003
      callcant(name)
23003 continue
      junk=openr(4,1,0,slist)
      callfprint(name,5)
23001 i=i+1
      goto 23000
23002 continue
      end
      subroutinefprint(name,fin)
      bytename(15),c
      bytegetch,map
      integermod
      integerfin,lineno,pageno,col
      pageno=0
      lineno=0
      col=1
      continue
23005 if(.not.(getch(c,fin).ne.-1))goto 23006
      if(.not.(lineno.eq.0))goto 23007
      pageno=pageno+1
      callhead(name,pageno)
      callskip(2)
      lineno=2+1
23007 continue
      if(.not.(c.eq.12))goto 23009
      lineno=58
      goto 23010
23009 continue
      if(.not.(c.eq.9))goto 23011
      continue
23013 continue
      callputc(32)
      col=col+1
23014 if(.not.(mod(col,8).eq.1))goto 23013
23015 continue
      goto 23012
23011 continue
      if(.not.(c.eq.13))goto 23016
      callputc(13)
      col=1
      lineno=lineno+1
      goto 23017
23016 continue
      callputc(c)
      col=col+1
23017 continue
23012 continue
23010 continue
      if(.not.(col.gt.80))goto 23018
      callputc(13)
      col=1
      lineno=lineno+1
23018 continue
      if(.not.(lineno.ge.58))goto 23020
      callputc(12)
      lineno=0
23020 continue
      goto 23005
23006 continue
      if(.not.(lineno.gt.0))goto 23022
      callputc(12)
23022 continue
      return
      end
      subroutineskip(n)
      integeri,n
      continue
      i=1
23024 if(.not.(i.le.n))goto 23026
      callputc(13)
23025 i=i+1
      goto 23024
23026 continue
      return
      end
      subroutinehead(name,pageno)
      bytename(15)
      integerlength,index
      integerpageno,i,n
      bytesfnam(11)
      bytedft(5)
      bytepage(6)
      datasfnam/70,105,108,101,110,97,109,101,58,32,-2/
      datadft/46,82,65,84,-2/
      datapage/80,97,103,101,32,-2/
      callputlin(sfnam,4)
      callputlin(name,4)
      n=length(name)
      if(.not.(index(name,46).eq.0))goto 23027
      callputlin(dft,4)
      n=n+4
23027 continue
      continue
      i=n+10
23029 if(.not.(i.lt.80-15))goto 23031
      callputc(32)
23030 i=i+1
      goto 23029
23031 continue
      callputlin(page,4)
      callputdec(pageno,1)
      callputc(13)
      return
      end
* �'R2o