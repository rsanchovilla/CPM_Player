PASSWORDS
       STOCKROOM          10  10   317-54-7674
       SHIPPING           20  20   SECRET
       ORDER PROCESSING   30  30   MAILROOM
       NEW ACCOUNTS       20  40   IGLOO
       PURCHASING         30  50   317-742-7388
RECORD CUSTOMER           20  30
ITEM   CNAME    CHAR  30  20  40
ITEM   CNUMBER  BIN    2  20  40
ITEM   STREET   CHAR  20  20  40
ITEM   CITY     CHAR  20  20  40
ITEM   STATE    CHAR    2  20  40 
ITEM   ZIP      CHAR   5  20  40
RECORD SUPPLIER           10  50
ITEM   SNAME    CHAR  30  10  50
ITEM   SNUMBER  BIN    2  10  50
ITEM   STREET   CHAR  30  10  50
ITEM   CITY     CHAR  20  10  50
ITEM   STATE    CHAR   2  10  50
ITEM   ZIP      CHAR   5  10  50
RECORD PART               10  10
ITEM   PNUMBER  BIN    2  10  50
ITEM   DESCR    CHAR  20  10  50
ITEM   PRICE    REAL   8  30  50
ITEM   ONHAND   BIN    2  10  10
ITEM   REORDER  BIN    2  10  50
RECORD ORDER              20  20
ITEM   ONUMBER  BIN       20  30
ITEM   RECEIVED BIN    2  20  30
ITEM   SHIPPED  BIN    2  20  20
RECORD QUANTITY           10  30
ITEM   QORDERED BIN    2  10  30
SET    SET1     MAN  1:N  20  30
                             SORTED   ONUMBER
OWNER  CUSTOMER
MEMBER ORDER
SET    SET2     MAN  1:N  20  30
                             FIFO
OWNER  ORDER
MEMBER QUANTITY
SET    SET3     MAN  1:N  10  50
                             SORTED   PNUMBER
OWNER  SUPPLIER
MEMBER PART
SET    SET4     MAN  1:N  10  30
                             IMMAT
OWNER  PART
MEMBER QUANTITY
SET    CUSTNAME AUTO 1:N  20  40
                             SORTED   CNAME
OWNER  SYSTEM
MEMBER CUSTOMER
SET    SUPLNAME AUTO 1:N  10  50
                             SORTED   SNUMBER
OWNER  SYSTEM
MEMBER SUPPLIER
SET    PARTDESC AUTO 1:N  10  50
                             SORTED   DESCR
OWNER  SYSTEM
MEMBER PART
SET    PARTNUM  AUTO 1:N  10  50
                             SORTED   PNUMBER
OWNER  SYSTEM
MEMBER PART
SET    ORDERS   AUTO 1:N  20  30
                             SORTED   RECEIVED
OWNER  SYSTEM
MEMBER ORDER
END
