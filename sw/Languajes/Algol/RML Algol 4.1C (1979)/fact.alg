'BEGIN' 'COMMENT' FACTORIALS; 
'INTEGER'   I; 
'REAL'      R; 
R:=1.0; 
'FOR' I:=1 'STEP' 1 'UNTIL' 10 'DO' 
'BEGIN' 
   R:=R*I; 
   RWRITE(1,R,8,0); SKIP(1); 
'END' 
'END' 
'FINISH'
