---------------------------------------------------------------------
---- NAME:FINANCIAL.accounts-----------------------------------------
---------------------------------------------------------------------

CREATE SET TABLE FINANCIAL.accounts ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      CUST_ID INTEGER,
      ACCOUNT_ID INTEGER,
      ACCOUNT_OPEN_DT DATE FORMAT 'yyyy-mm-dd',
      ACCOUNT_CLOSE_DT DATE FORMAT 'yyyy-mm-dd',
      ACCOUNT_TYPE_CD BYTEINT,
      ACCOUNT_BALANCE INTEGER)
UNIQUE PRIMARY INDEX ( ACCOUNT_ID )
INDEX ( CUST_ID );
