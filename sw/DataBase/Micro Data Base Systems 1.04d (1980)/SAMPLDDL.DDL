FILES  A:SAMPLEDB.DB 1    512
DRIVE  1     50
PASSWORDS
       USER                        PASSWORD
RECORD BOOK
ITEM   BOOK     CHAR  30
ITEM   AUTHOR   CHAR  20
RECORD KEYWORD
ITEM   KEYWORD  CHAR  10
SET    BOOKS    AUTO 1:N
                             SORTED   BOOK
OWNER  SYSTEM
MEMBER BOOK
SET    KEYWORDS AUTO 1:N
                             SORTED   KEYWORD
OWNER  SYSTEM
MEMBER KEYWORD
SET    LINK     MAN  N:M
       SORTED   BOOK         SORTED   KEYWORD
OWNER  BOOK
MEMBER KEYWORD
END
ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ