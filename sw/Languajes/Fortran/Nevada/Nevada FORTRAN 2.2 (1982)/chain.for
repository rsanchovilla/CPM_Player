C
C THIS ROUTINE DEMOSTRATES THE 'CHAIN' FUNCTION, ALL IT
C DOES IS REQUEST THE NAME OF THE PROGRAM TO CHAIN TO
C AND THEN CHAIN.
	DIMENSION IF(3)
	TYPE 'FILE?'
C
C GET THE FILENNAME TO CHAIN TO
C
	READ (0,1) IF
1	FORMAT (3A6)
C
C CHAIN	TOO IT
C
	CALL CHAIN (IF,IER)
C
C ONLY GETS HERE IF AN ERROR HAPPENS
C
	TYPE 'ERROR FROM CHAIN = ',IER
	CALL EXIT
	END
