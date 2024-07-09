# 1. From the following tables write a SQL query to find the salesperson and customer who reside 
# in the same city. Return Salesman, cust_name and city.
SELECT S.NAME AS "SALESMAN", C.CUST_NAME, C.CITY 
FROM SALESMAN S, CUSTOMER C
WHERE S.CITY = C.CITY;

# 2. From the following tables write a SQL query to find those orders where the order amount 
# exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT O.ORD_NO, O.PURCH_AMT, C.CUST_NAME, C.CITY 
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTOMER_ID  = C.CUSTOMER_ID
AND O.PURCH_AMT BETWEEN 500 AND 2000;

# 3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) 
# he represents. Return Customer Name, city, Salesman, commission.
SELECT C.CUST_NAME AS "CUSTOMER NAME", C.CITY, S.NAME AS "SALESMAN", S.COMMISSION
FROM SALESMAN S 
JOIN CUSTOMER C 
ON S.SALESMAN_ID = C.SALESMAN_ID;

# 4. From the following tables write a SQL query to find salespeople who received 
# commissions of more than 12 percent from the company. Return Customer Name, customer city, 
# Salesman, commission.  
SELECT C.CUST_NAME AS "CUSTOMER NAME", C.CITY, S.NAME AS "SALESMAN", S.COMMISSION
FROM SALESMAN S
JOIN CUSTOMER C
ON S.SALESMAN_ID = C.SALESMAN_ID
WHERE S.COMMISSION > 0.12; 

# 5. From the following tables write a SQL query to locate those salespeople who do not live in 
# the same city where their customers live and have received a commission of more than 
# 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.
SELECT C.CUST_NAME AS "CUSTOMER NAME", C.CITY, S.NAME AS "SALESMAN", S.COMMISSION
FROM SALESMAN S
JOIN CUSTOMER C
ON S.SALESMAN_ID = C.SALESMAN_ID
WHERE S.CITY != C.CITY
AND S.COMMISSION > 0.12;   

# 6. From the following tables write a SQL query to find the details of an order. 
# Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. Go to the editor
SELECT O.ORD_NO, O.ORD_DATE, O.PURCH_AMT, C.CUST_NAME AS "CUSTOMER NAME", C.GRADE, 
S.NAME AS "SALESMAN", S.COMMISSION 
FROM ORDERS O
JOIN CUSTOMER C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN SALESMAN S ON O.SALESMAN_ID = S.SALESMAN_ID;

# 7. Write a SQL statement to join the tables salesman, customer and orders so that the same 
# column of each table appears once and only the relational rows are returned. 
SELECT S.SALESMAN_ID, S.NAME AS SALESMAN, S.CITY AS SALESMAN_CITY, S.COMMISSION,
C.CUSTOMER_ID, C.CUST_NAME AS CUSTOMER, C.CITY AS CUSTOMER_CITY, C.GRADE, O.ORD_NO, 
O.PURCH_AMT, O.ORD_DATE 
FROM SALESMAN S
JOIN CUSTOMER C ON S.SALESMAN_ID = C.SALESMAN_ID
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

# 8. From the following tables write a SQL query to display the customer name, customer city, 
# grade, salesman, salesman city. The results should be sorted by ascending customer_id. 
SELECT C.CUST_NAME AS "CUSTOMER NAME", C.CITY AS "CUSTOMER CITY", C.GRADE, S.NAME AS "SALESMAN", 
S.CITY AS "SALESMAN CITY"
FROM CUSTOMER C
LEFT JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID
ORDER BY C.CUSTOMER_ID ASC;

# 9. From the following tables write a SQL query to find those customers with a grade less than 300. 
# Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by 
# ascending customer_id. 
SELECT C.CUST_NAME AS "CUSTOMER NAME", C.CITY AS "CUSTOMER CITY", C.GRADE, 
S.NAME AS "SALESMAN", S.CITY AS "SALESMAN CITY"
FROM CUSTOMER C
LEFT JOIN SALESMAN S ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE C.GRADE < 300
ORDER BY C.CUSTOMER_ID ASC;

# 10. Write a SQL statement to make a report with customer name, city, order number, order date,
# and order amount in ascending order according to the order date to determine whether any of 
# the existing customers have placed an order or not.
SELECT C.CUST_NAME AS "CUSTOMER NAME", C.CITY, O.ORD_NO, 
O.ORD_DATE, O.PURCH_AMT
FROM CUSTOMER C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
ORDER BY O.ORD_DATE ASC;
