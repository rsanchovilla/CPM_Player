FILES  A:SAMPLEDB.DB 1    512
DRIVE  1     50
PASSWORDS
       USER                        PASSWORD
RECORD BOOK
ITEM   TITLE    CHAR  30
ITEM   AUTHOR   CHAR  20
RECORD KEYWORD
ITEM   KEYWORD  CHAR  10
SET    BOOKS    AUTO 1:N
                             SORTED   TITLE
OWNER  SYSTEM
MEMBER BOOK
SET    KEYWORDS AUTO 1:N
                             SORTED
OWNER  SYSTEM
MEMBER KEYWORD
SET    LINK     MAN  N:M
       SORTED   TITLE        SORTED
OWNER  BOOK
MEMBER KEYWORD
END
����������� MAN  N:M*0180        SORTED   TITLE        SORTED0190 OWNER  BOOK0200 MEMBER KEYWORD
0210 END             �  	 �              �                                                                                                                                                                                                                                                                                                                                                                                 