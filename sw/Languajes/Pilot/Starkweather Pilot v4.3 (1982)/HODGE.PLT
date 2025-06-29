    R: HODGE PODGE HOMONYMES  S.WILLIAMS & K.ANDERSON
    R: MOD 5/75 & 10/77, J. STARKWEATHER
   CH:
*START
C:A=0
C:B=0
C:C=0
C:D=0
C:E=0
C:F=0
C:G=0
C:H=0
C:I=0
C:J=0
C:L=1
C:X=0
U(P):*DISPLAY
J(P):*PASS
C:P=1
   CA:2,48
T:
   CA:5
T:THIS PROGRAM WILL SHOW YOU ROWS OF LETTERS.
T:
T:PRESS 'RETURN' TO SEE THEM.
  INMAX:1
  A:
U:*DISPLAY
PA:5
   CH:
   CA:3
T:YOU WILL TRY TO FIND WORDS THAT ARE IN PAIRS - HOMONYMS.
T:
T:THE WORDS SOUND THE SAME, BUT THEY HAVE DIFFERENT MEANING.
T:
T:ONE OF EACH PAIR IS WRITTEN ACROSS, THE OTHER UP AND DOWN.
T:
T:LOOK FIRST FOR THE WORDS ACROSS.
T:
T:I SAW THE WORDS 'HOUR' ACROSS, AND 'OUR' READING DOWN.
T:
T:       PRESS "RETURN" AND I WILL SHOW YOU.
A:
C:Y=8
U:*DISPLAY
U:*BLINK
*PASS
   CA:11
T:TYPE THE WORDS YOU SEE.
T:TRY AGAIN AND AGAIN - I AM KEEPING SCORE TO SEE HOW MANY
T:YOU CAN FIND IN 18 TRIES.    THERE ARE 18 WORDS.
T:TYPE ONLY ONE WORD AT AT TIME, AND THEN PRESS 'RETURN'.
T:YOU CAN ERASE BAD TYPING WITH THE 'DEL' KEY.
T:   NOW PRESS 'RETURN' TO START.
   CA:16,33
A:  
   CA:11
   CE:

*ANS
   CA:12
   CL:
INMAX:64
A:  
C:A=A+1
U:*TEST
C:K=A-17
J(K):*DONE
J:*ANS
    
*DONE
   CA:11
   CE:
T:YOU HAVE HAD 18 TRIES, PRESS "RETURN" AND
T:I WILL SHOW YOU YOUR SCORE.
A:
   CA:11
   CE:
T:YOUR SCORE IS #X OUT OF A POSSIBLE 18.
T:PRESS "\" TO QUIT, OR "RETURN" TO TRY AGAIN.
   CA:12,55
INMAX:1
A:  
   CH:
J:*START
    
*DISPLAY
   CH:
   CA:1,36
T:X Q R A U N T T N R Z U C Q
   CA:2,36
T:V V A N E V W Z H O U R P O
   CA:3,36
T:E U V A X Y Z I I N Q R R U
   CA:4,36
T:I P Q N R S T N U V B Y I R
   CA:5,36
T:N W X T Y Z A N M E E T N E
   CA:6,36
T:Q C D Q F G R H I J B K C M
   CA:7,36
T:O W R A P L A M S S U N I E
   CA:8,36
T:P Q R S T U P V Q E Y W P A
   CA:9,36
T:P R I N C I P L E E X Y A T
   CA:10,36
T:S C E N E Z A B N N C D L T
   R: AUNT/ANT - VANE/VEIN - HOUR/OUR - PRINCIPLE/PRINCIPAL
   R: SEEN/SCENE
   R: WRAP/RAP - BY/BUY - LITE/LIGHT - IN/INN
E:  
    
*BLINK
   CA:2,50
T:. . . .
   CA:2,62
T:. 
   CA:3,62
T:. 
   CA:4,62
T:. 
U:*NULL
   CA:2,50
T:H O U R
   CA:2,62
T:O 
   CA:3,62
T:U 
   CA:4,62
T:R 
U:*NULL
C:Y=Y-1
J(Y):*BLINK
E:  
    
*TEST
*M1 M:AUNT
JN:*M2
   CA:1,42
T:. . . .
J(B):*M1A
C:B=L
C:L=L+1
*M1A CA:B
T:AUNT
J:*EOT
    
*M2 M:VANE
JN:*M3
   CA:2,38
T:. . . .
J(C):*M2A
C:C=L
C:L=L+1
*M2A CA:C
T:VANE
J:*EOT
    
*M3 M:HOUR
JN:*M4
   CA:2,52
TY:. . . .
J(D):*M3A
C:D=L
C:L=L+1
*M3A CA:D
T:HOUR
J:*EOT
    
*M4 M: IN ,
JN:*M5
   CA:3,52
T:. .
J(E):*M4A
C:E=L
C:L=L+1
*M4A CA:E
T:IN
J:*EOT
    
*M5 M:BY
JN:*M6
   CA:4,56
T:. .
J(F):*M5A
C:F=L
C:L=L+1
*M5A CA:F
T:BY
J:*EOT
    
*M6 M:MEET
JN:*M7
   CA:5,52
T:. . . .
J(G):*M6A
C:G=L
C:L=L+1
*M6A CA:G
T:MEET
J:*EOT
    
*M7 M:WRAP
JN:*M8
   CA:7,37
T:. . . .
J(H):*M7A
C:H=L
C:L=L+1
*M7A CA:H
T:WRAP
J:*EOT
    
*M8 M:PRINCIPLE
JN:*M9
   CA:9,36
T:. . . . . . . . .
J(I):*M8A
C:I=L
C:L=L+1
*M8A CA:I
T:PRINCIPLE
J:*EOT
    
*M9 M:SCENE
JN:*M10
   CA:10,36
T:. . . . .
J(J):*M9A
C:J=L
C:L=L+1
*M9A CA:J
T:SCENE
J:*EOT
    
*M10

*MD1 M:ANT
JN:*MD2
   CA:3,42
T:. 
   CA:4,42
T:. 
   CA:5,42
T:. 
   CA:3,20
J(B):*MD1A
C:B=L
C:L=L+1
*MD1A CA:B,20
T:ANT
J:*EOT

*MD2 M:VEIN
JN:*MD3
   CA:2,36
T:. 
   CA:3,36
T:. 
   CA:4,36
T:. 
   CA:5,36
T:. 
   CA:2,20
J(C):*MD2A
C:C=L
C:L=L+1
*MD2A CA:C,20
T:VEIN
J:*EOT

*MD3 M: OUR
JN:*MD4
   CA:2,62
T:. 
   CA:3,62
T:. 
   CA:4,62
T:. 
   CA:2,20
J(D):*MD3A
C:D=L
C:L=L+1
*MD3A CA:D,20
T:OUR
J:*EOT

*MD4 M:INN
JN:*MD5
   CA:3,50
T:.
   CA:4,50
T:.
   CA:5,50
T:.
   CA:6,50
J(E):*MD4A
C:E=L
C:L=L+1
*MD4A CA:E,20
T:INN
J:*EOT

*MD5 M:BUY
JN:*MD6
   CA:6,56
T:. 
   CA:7,56
T:. 
   CA:8,56
T:. 
   CA:6,20
J(F):*MD5A
C:F=L
C:L=L+1
*MD5A CA:F,20
T:BUY
J:*EOT

*MD6 M:MEAT
JN:*MD7
   CA:6,62
T:. 
   CA:7,62
T:. 
   CA:8,62
T:. 
   CA:9,62
T:. 
   CA:6,20
J(G):*MD6A
C:G=L
C:L=L+1
*MD6A CA:G,20
T:MEAT
J:*EOT

*MD7 M:RAP
JN:*MD8
   CA:6,48
T:. 
   CA:7,48
T:. 
   CA:8,48
T:. 
   CA:6,20
J(H):*MD7A
C:H=L
C:L=L+1
*MD7A CA:H,20
T:RAP
J:*EOT

*MD8 M:PRINCIPAL
JN:*MD9
   CA:2,60
T:.
   CA:3,60
T:. 
   CA:4,60
T:. 
   CA:5,60
T:. 
   CA:6,60
T:.
   CA:7,60
T:. 
   CA:8,60
T:. 
   CA:9,60
T:. 
   CA:10,60
T:. 
   CA:2,20
J(I):*MD8A
C:I=L
C:L=L+1
*MD8A CA:I,20
T:PRINCIPAL
J:*EOT

*MD9 M:SEEN
JN:*MD10
   CA:7,54
T:. 
   CA:8,54
T:. 
   CA:9,54
T:. 
   CA:10,54
T:. 
   CA:7;20
J(J):*MD9A
C:J=L
C:L=L+1
*MD9A CA:J,20
T:SEEN

J:*EOT
*MD10    R: NO MATCH FOUND */
E:

*EOT     R: A MATCH WAS FOUND */
C:X=X+1
E:  
    
*NULL E:
 
*NULL E:
