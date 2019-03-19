---------------------------------------------------------------------
---- NAME:FINANCIAL.ACCOUNT_TYPE.DDL---------------------------------
--------------------------------------------------------------------- 

CREATE SET TABLE FINANCIAL.ACCOUNT_TYPE ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      ACCOUNT_TYPE_CD BYTEINT,
      ACCOUNT_TYPE_DESC CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC)
UNIQUE PRIMARY INDEX ( ACCOUNT_TYPE_CD );
