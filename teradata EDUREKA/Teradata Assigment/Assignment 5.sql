-----------Assignment 5 ------------
----Question 1
Write a query to identify customers whose age is above the average age of
customers from Customers table (Use subquery)

SELECT cust.cust_id,Coalesce(name.name_prefix,''),name.first_name, name.last_name FROM customer cust INNER JOIN customer_name name ON (name.cust_id=cust.cust_id)  WHERE cust.age>
(SELECT Avg(age) FROM customer);

----Qurestion2------

Write an UPSERT query to update/insert a new product into Product table

-----Question 3---
Write a query to extract Order_Id, Customer_Id, Order_Date, Order_Total and
Invoice_Range
From orders table. If the Order_Total is <= 200 then Invoice_Range is “Low
Range”, If between 201 and 500 then Invoice_Range is “Medium Range” and if
above 500 then Invoice_Range is “High Range”. (Use Case statement to derive
Invoice_Range)


-----Question 4 ------
 Write a query to identify top 3 selling products from Products table

--------Question 5 --------
Write a query to identify top selling products from each day

------Question 6------
Write a query to collect statistics on Orders_Dtl table on column Product_Id and
Customer_Id
--Question 7 -----
Write a query to collect summary statistics on Customer table

