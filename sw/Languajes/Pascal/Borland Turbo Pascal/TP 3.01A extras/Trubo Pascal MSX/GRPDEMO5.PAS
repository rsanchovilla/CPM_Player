program grpdemo5;    (* Beispiel f�r Zeichensatzdefinition *)


{$I KERNEL.GIC   }
{$I CPATTERN.GIC }


var c: char;
    f: file;


begin
  CrtInit;

  width(40);

  writeln ('Wir machen aus dem "Klammeraffen"');
  writeln ('     ein Copyright-Zeichen!      ');
  writeln;
  writeln ('      @ Uwe Schr�der 1989        ');
  writeln;
  write   ('Taste dr�cken f�r Neudefinition: ');
  read (kbd, c);

(* Zeichensatz-Definition:

  '@'  .����...          $78
       �....�..          $84
       �.��.�..          $B4
       �.�..�..          $A4
       �.��.�..          $B4
       �....�..          $84
       .����...          $78
       ........          $00  *)

  DefCharacter ('@', #$78#$84#$B4#$A4#$B4#$84#$78);

  write (#13'Taste dr�cken f�r Programm-Ende: ');
  read (kbd, c);

  CrtExit;

  assign (f, 'DEMO.COM');
  execute (f);              (* zur�ck zum Men� *)
end.
