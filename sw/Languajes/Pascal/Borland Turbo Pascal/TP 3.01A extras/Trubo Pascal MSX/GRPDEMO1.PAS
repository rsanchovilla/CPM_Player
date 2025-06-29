program GRPDEMO1;       (* Grafikdemo 1: read und write im Grafikmodus *)


{$I KERNEL.GIC}



const
  prompt   = 'Ihre Eingabe bitte: ';            { Eingabe-Aufforderung       }
  maxinput = 10;                                { Maximale EingabelÑnge      }

  posX     = 10;                                { x-Position fÅr Eingabe     }
  posY     = 10;                                { y-Position fÅr Eingabe     }


var
  s: string[maxinput];                          { Variable zum Einlesen      }
  f: file;

begin
  CrtInit;                                      { Grafikpaket initialisieren }
  color (3, 0, 0);                              { Farbwahl                   }

  if MSX2                                       { Je nach Version...         }
  then screen(5)
  else screen(2);

  cwidth (8);                                   { Zeichenbreite 8 Pixel      }

  pencolor (12);                                { Eingabebereich einrahmen   }
  box(posX-2, posY-2,
      posX+8*(length(prompt)+maxinput)+2, posY+9);

  gotoXY (posX,posY);                           { Cursor positionieren       }
  BufLen := maxinput;                           { Eingabe max. 10 Zeichen    }
  write (prompt);                               { Prompt ausgeben            }

  pencolor (6);                                 { Farbwechsel fÅr Eingabe    }
  readln (s);                                   { Eingabe lesen              }

  gotoXY (10, 100);                             { Cursor positionieren       }
  pencolor (11);                                { wieder Farbwechsel         }
  writeln ('Ihre Eingabe war "', s, '"');       { Eingabe nachplappern       }

  readln;                                       { Warten auf RETURN-Taste    }

  CrtExit;                                      { Alles wieder auf Null      }

  assign (f, 'DEMO.COM');
  execute (f);                                  { ZurÅck zum MenÅ            }
end.


