---------------------------------------------------------------------
---- NAME:FINANCIAL.customer_segment---------------------------------
---------------------------------------------------------------------

CREATE SET TABLE FINANCIAL.customer_segment ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      CUSTOMER_ID INTEGER,
      CUSTOMER_FNAME CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUSTOMER_LNAME CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUSTOMER_TYPE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUSTOMER_SEGMENT_VALUE CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC
,
      SEGMENT_START_DT DATE FORMAT 'yyyy-mm-dd',
      SEGMENT_END_DT DATE FORMAT 'yyyy-mm-dd')
UNIQUE PRIMARY INDEX ( CUSTOMER_ID );
