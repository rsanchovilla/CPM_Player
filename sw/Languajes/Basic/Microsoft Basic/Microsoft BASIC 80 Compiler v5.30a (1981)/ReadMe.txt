
Para compilar el programa HOLA.BAS:
ejecutar:

   BASCOM =HOLA
   L80 HOLA,BASLIB/S,HOLA/N/E
   
   esto genera HOLA.COM compilado y
   ejecutable. Requiere BRUN.COM al
   ejecutarse

se puede borrar el fichero intermedio:

   ERA HOLA.REL

Se puede lanzar todo esto con el comando

   SUBMIT BASCOM HOLA


Para compilar el programa y que no pida
el BRUN.COM, hacer:

   BASCOM =HOLA/O
   L80 HOLA,OBSLIB/S,HOLA/N/E

o bien

   SUBMIT BASCOM2 HOLA
