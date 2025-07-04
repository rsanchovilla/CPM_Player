%File:  CLES4.ALG  (c)        10/30/79              The Soft Warehouse %


LINELENGTH (78)$  #ECHO: ECHO$  ECHO: TRUE$

%   This is the fourth of a sequence of muMATH calculator-mode lessons.

    There  are some other algebraic control variables  besides  PWREXPD, 
NUMNUM,  DENDEN,  and  DENNUM;  and  they are occasionally  crucial  for 
achieving a desired effect.   One of these,  named NUMDEN,  provides the 
logical completion of the latter three,  by controlling the distribution 
of factors in numerators over the terms of denominator sums.   NUMDEN is 
initially  0,  but  integer numerators are distributed over  denominator 
sums  when  NUMDEN  is  a  positive  integer  multiple  of  2,  monomial 
numerators  are  distributed  over denominator sums  when  NUMDEN  is  a 
positive integer multiple of 3,  and numerator sums are distributed over 
denominator  sums when NUMDEN is a positive integer multiple of 5.   For 
example:  %

NUMNUM: DENDEN: DENNUM: 0 $  NUMDEN: 30 $
X / (X^3 + X + 1) / (Y + 1) ;  EG: (X+Y) / (1+X+Y) / (Y+1) ;
%    Isn't that intriguing?   It yields a sort  of  "continued-fraction" 
representation.   Now  for  the  reverse  direction,  which  performs  a 
denesting  of  denominators which is less drastic than a  single  common 
denominator:  %

NUMDEN: -6 $  Z + 1 / (1/X + 1/Y) / (1+Y) ;
%    See if you can devise examples exhibiting dramatic  simplifications 
arising  from either direction for this novel transformation.   The fact 
that  it so naturally complements NUMNUM,  DENDEN,  and DENNUM  suggests 
that it must be useful for something!  %  RDS: FALSE $
%    Another  control variable named BASEXP controls distribution  of  a 
BASe over terms in an EXPonent which is a sum,  or controls the  reverse 
process  which is collection of similar factors.   As might be expected, 
integer  bases  are  distributed over exponent sums  when  BASEXP  is  a 
positive  integer  multiple of 2,  monomial bases are  distributed  over 
exponent sums when BASEXP is a positive integer multiple of 3,  and base 
sums  are  distributed  over  exponent sums when BASEXP  is  a  positive 
integer multiple of 5.  Morever, the corresponding negative values cause 
collection  of similar factors having the corresponding types of  bases.  
BASEXP  is initially -30.   However,  distribution (followed perhaps  by 
collection)  is  sometimes  necessary to let some of  the  terms  in  an 
exponent sum combine with the base.  For example:  %

EG: 2^(2+X) / 4 ;  BASEXP: 2 ;  EVAL (EG) ;
%    See  if  you  can devise an example which  requires  evaluating  an 
expression  first with sufficiently positive BASEXP,  then  reevaluating 
with sufficiently negative BASEXP, or vice-versa:  %  RDS: FALSE $
%    Another control variable named EXPBAS controls the distribution  of 
EXPonents  over  BASes  which  are  PRODUCTS.    Integer  exponents  are 
distributed  over  base  products  when EXPBAS  is  a  positive  integer 
multiple  of 2,  monomial exponents are distributed over  base  products 
when  EXPBAS is a positive integer multiple of 3,  and exponent sums are 
distributed  over  base  products  when EXPBAS  is  a  positive  integer 
multiple of 5.   Naturally, the corresponding negative multiples request 
collection of bases which have similar exponents of the indicated  type.  
The  initial value is 30,  and here are some examples where distribution 
permits net simplification:  %

(X^(1/2) * Y) ^ 2 ;  (X*Y)^2 - X^2*Y^2 ;  (4*X^2*Y) ^ (1/2) ;
%    However,  the user should beware that as with  manual  computation, 
distribution of noninteger exponents is not always valid.  Consequently, 
conservative  users may prefer to generally operate with EXPBAS being 2.  
Moreover, distribution of exponents tends to make expressions more bulky 
when no cancellations occur.  For example %

(X * Y * Z) ^ (1/2) ;
%   In fact,  there are instances where negative settings of EXPBAS  are 
necessary to acheive a desired result.  For example:  %

EG: 2^X * 3^X  + (1+X)^(1/2) * (1-X)^(1/2) - (1-X^2)^(1/2) ;
EXPBAS: -6 ;  NUMNUM: 30 ;  EVAL (EG) ;
%    See  if  you  can devise an example which  requires  evaluating  an 
expression  first with sufficiently positive EXPBAS,  then  reevaluating 
with sufficiently negative EXPBAS,  or vice-versa,  in order to simplify 
acceptably:  %  RDS: FALSE $
%    The  variable named PBRCH,  already discussed in  conjunction  with 
fractional powers of numbers,  also controls transformations of the form  
u^v^w --> u^(v*w).   PBRCH is initially TRUE,  but when PBRCH is  FALSE, 
the   transformation   occurs  only  for  integer  w.    Otherwise   the 
transformation occurs for any w.   The user should be aware that in some 
circumstances  the selected branch is an inappropriate one,  so that  it 
may sometimes be necessary to set PBRCH to FALSE.  See if you can devise 
such an instance:  %  RDS: FALSE $
%  Now, try the examples  0^X and X^0, to see what happens:  %
RDS: FALSE $
%   The reason that 0^X is not automatically simplified to  ;) $  O
.	� 
�.^0^0�0 1 5�6�6 6�6 7�[�\ a �                                                                                                                                                                               ' '��' '��' 'r7�' 'X7� ' '��(' '��0' '��8' '��@' '��H' '��P' 'J�X' '  `' 'oh' '�p' '�x' '�&�' '�1�' '�<�' '�C�' '�M�' 'T�' '\�' 'g�' '%r�' '�y�' ')��' '/��' '���' 'N��' 'O��' '5��' '�� ( '�( '� �( '� �( '�� ( '.!�(( '��0( 'k�8( '@�@( 'w�H( '��P( '��X( '
�`( '%

h( 'X
p( 'u
x( '�
%�( '�
,�( '�9�( '�A�( 'L�( 'HR ' 'q[8* 'a�( '�h�( '7o ' ' 7z ' '���( '��( '��0 '��( '0��( 'H� ) '\� ' '��) ' �) '<� ) '��() ' �0) 'd �8) ';�@) ''�H) '[P) '<	X) '�`) '�h) 'o!"p) '�!(x) '�8 1�) '�1�) '�
1�) '�1�) '�1�) '�1�) '�1�) '�1 ' '� 1�)X]=%1�) '7-1(] '�418* '�81�) '�<1�) '�A1�) '�7R1�) '�Z1�` '&8^1* '�h1* '�m1* '�u1 * '�~1(* '��10* '8�18* '��1@* '��1H* '��1P* ':8�1X* '��1`* '�;�1h* '��1p* '��1x*�_��1�*�\��1�* '�8�1�*�]��1�*�`��1�* '��1�* '��1�* '�9�1�* '&: 2�* '�	2�* '^:2�* '�2�* '�:2�* '�:$2�* '�:-2�* '�72�* '�<2 ' '�B2+ '�HF2+ '�H2�0 '�J2 + '�L2(+ ':Aa20+ '~Ac28+0]BFe2@+ 'LFg2H+P]�Hi2P+ '�Hk2X+ 'zIm2`+ '`<o2h+ 'n<x2p+ '��2x+ '�<�2 ' '��2�+ '�?�2�+ '�@�2�+ 'r@�2�+ '?�2�+ '��2�+ '0?�2�+ '@?�2�+ 'T?�2�+ 'd?�2�+ '�?�2�+ '�?�2�+ '�?�2�+ '�?�2�+ '�?�2�+ '$@�2 , '8@�2, 'V@�2, '�@ 3, ' A3 , '�A
3(, '�A30, '"C38, '�A3@, 'B3H, 'NB"3P, 'jB&3X, '�B,3`,@]�B23h,H] C73p, 'C=3x, '>CC3�, 'XCK3�, '�CQ3�, '�CX3�, 'Ea3�, 'zEk3�, '�u3�, '�z3�, '�E3�, 'F�3�, 'hF�3�, '.G�3�, '��3�, 'jH�3�, '�H�3�, '��3�, '�Q�3 - '$I�3 ' '��3' '��3�0 '��3�0 '��30- '��30- '��3�\ '@[4@- '�4H- '�
4P- '�4X- '�4`- '�S4' '�4p- '`L4x- '�U%4�- '�L+4�- '�M44�\ '�=4�- 'ND4�- '�I4�- '�M4�- '�Q4�- '`OU4�\ '�Z4�- '�`4�- '�Od4�- 'zPk4�- '�Pr4�- '�t4�- '�y4�- '��4 . '0Q�4v0 'R�4v0 '<R�4. '`R�4 . '��4(. '�R�4v0 'HS�4�0 'lS�4j0 '�U�4p0 'lU�4P. '�U�4�0 '��4`. '�U�4h. '�V�4p. ' W�4x. 'XW�4�. 'RX�4�. 'jX�4�. '�X5�. '�Z5�. '�Z5�. '�Z5�. '[5�. '�5�. '�5INFIX LBP MATCHNOP PREFIX RBP USED AS OPERATOR READLIST READREST . PUTPARSE PROPERTY DEFFUN IDENTITY WHENPARSE WHEN BLOCK ERR ?  @  *** SYNTAX ERROR:   < > + - * / ^ PRTSPACE PRTPAREN LOP1 PRTLIST POINT NUMBER DEN NUM PRTDIG ��
��w+�+��
��> �+���6*�%4�F�Nx��I�>���i��i�#���,xH���IAO�:�%�2�%��*�%qy�O7?�\��w+�+�X��s� w+�i�*�%��5�w��*�%6�;� �;�>��2�%7��^0 '�6d0'�6j0'�6p0 '�6v0 '�6|0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0'�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6�0 '�6PARSE MUS RPAR ) LPAR ( COMMA , BELL PRTMATH MAKDEF EX1 EX2 LEX1  *** REDEFINED:  PUTPROP EX3 DELIMITER EXIT ENDLOOP ENDBLOCK ENDFUN ENDSUB TERMINATOR ; $ & MATCH DELIM SYNTAX NOT FOUND MISSING COMMA INFIX LBP MATCHNOP PREFIX RBP USED AS OPERATOR READLIST READREST . PUTPARSE PROPERTY DEFFUN IDENTITY WHENPARSE WHEN BLOCK ERR ?  @  *** SYNTAX ERROR:   < > + - * / ^ PRTSPACE PRTPAREN LOP1 PRTLIST POINT NUMBER DEN NUM PRTDIG ARITH MULTIPLE POSMULT NEGMULT SUB EVSUB SUM PRODUCT POWER RECIP NEGCOEF MKSUM MKPROD NUM1 DEN1 MIN SIMPU ARGEX ABS GCD LCM CODIV COEFF BASE EXPON DENOM ARGLIST MKRAT RATSUM ADDTERMS INJECTERM MERGETERM LEX2 LEX3 MERGESUM SUMLEX MULTFACTS MERGEFACT EX4 MERGEPROD PRODLEX  *** WARNING:   SQUARE EXPT ZEROBASE ZEROEXPT TRGEXPD LOGEXPD LOGBAS #E FLAGS #I COS SIN LOG *^ PBRCH BASE^ BASE* PRTMATH* PRTMATH^ PRIMES ROOT EX5 EX6 EX7 FREE PION2 #PI EXPON* EXPON^ ! STOP ALGEBRA ARI PRTMATH+ NUMNUM DENNUM DISTRIB LEX4 *+ DENDEN NUMDEN BASEXP EXPBAS EXPON+ PWREXPD BASE+ EXPAND CONTENT CONTENT1 CANCEL CANCEL1 FACTOR +* +^ EXPD FCTR  =   �TpThTdTZTVT:T6T2T�(�(�(�-CT>T�(+QTFT�)+�-�-'�'�)8*�(�-!(+`T)�)�( (�(lT)+�T|TvT?PzT�(!(+`T�'�)@*�T�RzT( +�T(8Q�T?P2T!(�)�Ty)PQ�-!(�)�T?P�TVT�T�T�T�(+	(P�)�(�T)+!( +!(�(!(�(�)'�)4U.UzT*UUzT�T�TzT!(�( '1)UU U�(9QUU�(�(U	(�(�(1)$UUVT�( Ui)�)'U�'�)�( +!( +'7U) +'�SHUBU�(�)�)QULUq(�)�'�)'�S