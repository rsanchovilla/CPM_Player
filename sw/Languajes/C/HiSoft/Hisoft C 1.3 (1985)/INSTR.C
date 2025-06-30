#include  <stdio.h>
cls()
{
  printf("\n");
  printf("\n");
  printf("\n");
  printf("\n");
  printf("\n");
  printf("\n");
}
main()
{
  char  tecla;
  cls();
  cls();
  cls();
  cls();
  cls();
  printf("Este es un ejemplo de un programa hecho en C.\n");
  printf("\n");
  printf("Quizas al leerlo le parezca dificil, pues bien,\n");
  printf(" esta hecho con los comandos mas simples del lenguaje.\n\n");
  printf("El C es el lenguaje mas potente que existe, casi un 80 por cien,");
  printf(" de los compiladores y aplicaciones de gestion han sido");
  printf(" escritos en C.\n\n");
  printf("Si usted no es programador,o no tiene experiencia con el BASIC,");
  printf("con el PASCAL, con el COBOL o cualquier otro lenguaje de alto");
  printf(" nivel, sera mejor que olvide el C, esta hecho para programadores.");
  printf("\n\n");
  printf("Si usted sabe programar,comprese un libro de C y programe.\n\n");
  printf("Pulse <enter> para seguir.\n");  scanf("%c", &tecla);
  instr();
}

instr()
{
  char  tecla1;
  cls();
  cls();
  printf("Instrucciones de compilacion.\n\n\n\n\n\n");
  printf("1- Escriba el programa en C.\n\n\n");
  printf("2- Grabelo como <nombre.C>.\n\n\n");
  printf("3- Llame al CP/M como |CPM.\n\n\n");
  printf("4- Escriba:  HC nombre.c   y pulse ENTER.\n\n\n");
  printf("Despues de un rato, y si no ha salido ningun error,habra creado su");
  printf(" <nombre.com>. Para acceder meta NOMBRE  bajo CP/M.\n\n\n\n\n\n\n");
  printf("Pulse <ENTER> ");
  scanf("%c", &tecla1);
}

cls()
{
  printf("\n");
  printf("\n");
  printf("\n");
  printf("\n");
  printf("\n");
  printf("\n