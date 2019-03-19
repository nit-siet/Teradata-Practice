---------------------------------------------------------------------
---- NAME:FINANCIAL.customer_STG---------------------------------
---------------------------------------------------------------------

CREATE SET TABLE FINANCIAL.customer_STG ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      CUST_ID INTEGER,
      FIRST_NAME CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAST_NAME CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      DOB DATE FORMAT 'yyyy-mm-dd',
      CITY CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      STATE CHAR(02) CHARACTER SET LATIN NOT CASESPECIFIC,
      PHONE_NO VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC)
UNIQUE PRIMARY INDEX ( CUST_ID );
