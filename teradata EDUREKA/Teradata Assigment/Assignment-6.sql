Create views for Customer, Customer_Addr, Product, Product_Style, Orders and
Orders_Dtl tables

----ANSWER1 ----

REPLACE VIEW CUSTOMER_V 
AS
LOCK ROW FOR ACCESS 
(SELECT * FROM CUSTOMER
);

CREATE VIEW CUSTOMER_ADDR_V
AS 
LOCK ROWS FOR 
(
SELECT * FROM CUSTOMER_ADDR
);

CREATE VIEW PRODUCT_V
AS
LOCK ROW FOR ACCESS 
(SELECT * FROM PRODUCT);

CREATE VIEW PRODUCT_STYLE_V
AS
LOCK ROW FOR ACCESS 
(SELECT * FROM PRODUCT_STYLE);

CREATE VIEW ORDER_V
AS
LOCK ROW FOR ACCESS 
(SELECT * FROM ORDER);

CREATE VIEW ORDER_DTL_V
AS 
LOCK ROW FOR ACCESS 
(SELECT * FROM ORDER_DTL);
LO



Create a Macro that will accept the values and insert into Product table
------ANSWER2------

Created a table product 
CREATE TABLE FINANCIAL.PRODUCT 
(PRODUCT_ID INTEGER,
PRODUCT_DESC VARCHAR(30),
PRODUCT_COLOR VARCHAR(10)
)

Created a macro to insert values in prodcut table

CREATE MACRO PRODUCT_MACRO(ID INTEGER, P_DESC VARCHAR(30),COLOR VARCHAR(10))
AS
(
INSERT INTO FINANCIAL.PRODUCT 
(PRODUCT_ID,PRODUCT_DESC,PRODUCT_COLOR)VALUES 
(:ID,
:P_DESC,
:COLOR);
);

inserting values in proDut table using the macro

exec PRODUCT_MACRO(123,'Parker Pen','Black');

--worked from terminal but did not worked from Teradata Assist




Create a Stored procedure that will accept product id and year as input and return
sales for that product id & year from Orders table.
---------------------------
ANSWER3


REPLACE PROCEDURE PROC2(IN ID INTEGER, OUT COL VARCHAR(20))
BEGIN
SELECT PRODUCT_COLOR INTO COL FROM PRODUCT WHERE PRODUCT_ID=ID;
END

------CALLING A PROCEDURE
CALL PROC2(123,A);




Create a Multi-Table join index joining Customer and Customer_Addr tables
---------ANSWER 4 -----------

--Multi table join index---
CREATE JOIN INDEX CUSTOMER_AND_ADDRESS
AS
Select A.CUSTOMER_ID, A.CUSTOMER_NAME,B.CUSTOMER_ADDRESS
FROM CUSTOMER A INNER JOIN CUSTOMER_ADDR B ON (A.CUSTOMER.ADDRESS_ID=B.CUSTOMER_ADDR.ADDRESS_ID)
PRIMARY INDEX(CUSTOMER_NAME);


Create a copy of Products table (Product_Bkup) with fallback and compare the
space occupied by these 2 tables

-------ANSWER5-------
CREATE TABLE PRODUCT_BKUP AS (SELECT * FROM PRODUCT) WITH DATA

Calculating space occupied by these tables
product table: 
SELECT tablename,Sum(currentperm) FROM dbc.tablesize WHERE tablename='product' AND databaseName='financial'
GROUP BY tablename

result:PRODUCT                       	2,560.00


Table:product_bkup

SELECT tablename,Sum(currentperm) FROM dbc.tablesize WHERE tablename='product_bkup' AND databaseName='financial'
GROUP BY tablename

Result:
PRODUCT_BKUP                  	2,560.00


Create an aggregate join index on Products table by aggregating sales per
product id, Year and Month (Use Orders and Orders_Dtl table)

--------- ANSWER 6 ------------

CREATE JOIN INDEX AGGR_JOIN_INDEX
AS 
SELECT PROD.PRODUCT_ID,EXTRACT(YEAR FROM O.ORDER_DATE) YR,EXTRACT(MONTH FROM O.ORDER_DATE) MTH, SUM(OL.ORDERED_QUANTITY*PROD.STANDARD_PRICE) 
FROM CUSTOMER_T CUST 
INNER JOIN  ORDER_T O ON(CUST.CUSTOMER_ID=O.CUSTOMER_ID)
INNER JOIN  ORDER_LINE_T OL ON(O.ORDER_ID=OL.ORDER_ID)
INNER JOIN  PRODUCT_T PROD ON(PROD.PRODUCT_ID=OL.PRODUCT_ID)
GROUP BY 
1,2,3
PRIMARY INDEX(YEAR,MONTH)



Create a single table join index on Product table with Customer_ID as Primary
Index

------ANSWER 7-------------
CREATE JOIN INDEX SINGLE_TBL_JOIN_INDEX
AS 
SELECT PRODUCT_ID, PRODUCT_NAME, CUSTOMER_ID  FROM PRODUCT 
PRIMARY INDEX (CUSTOMER_ID)












