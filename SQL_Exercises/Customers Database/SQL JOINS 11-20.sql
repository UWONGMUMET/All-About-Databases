# 11. SQL statement to generate a report with customer name, city, order number, order date, order 
# amount, salesperson name, and commission to determine if any of the existing customers have not 
# placed orders or if they have placed orders through their salesman or by themselves.
SELECT C.CUST_NAME AS CUSTOMER_NAME, C.CITY AS CUSTOMER_CITY, O.ORD_NO AS ORDER_NUMBER,
O.ORD_DATE AS ORDER_DATE, O.PURCH_AMT AS ORDER_AMOUNT, S.NAME AS SALESPERSON_NAME,
S.COMMISSION AS SALESPERSON_COMMISSION
FROM CUSTOMER C
LEFT OUTER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT OUTER JOIN SALESMAN S ON O.SALESMAN_ID = S.SALESMAN_ID
ORDER BY C.CUST_NAME, O.ORD_DATE;

# 12. Write a SQL statement to generate a list in ascending order of salespersons who 
# work either for one or more customers or have not yet joined any of the customers.
SELECT DISTINCT S.SALESMAN_ID, S.NAME AS SALESPERSON_NAME
FROM SALESMAN S
RIGHT JOIN CUSTOMER C ON S.SALESMAN_ID = C.SALESMAN_ID
ORDER BY S.SALESMAN_ID;

# 13. From the following tables write a SQL query to list all salespersons along with customer name, 
# city, grade, order number, date, and amount. Condition for selecting list of salesmen : 
# 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under 
# any customer, Condition for selecting list of customer : 3. placed one or more orders, or 4. 
# no order placed to their salesman.
SELECT C.CUST_NAME, C.CITY, C.GRADE, S.NAME AS SALESMAN, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT
FROM SALESMAN S
LEFT JOIN CUSTOMER C ON S.SALESMAN_ID = C.SALESMAN_ID
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
ORDER BY S.NAME, C.CUST_NAME, O.ORD_DATE;

# 14. Write a SQL statement to make a list for the salesmen who either work for one or 
# more customers or yet to join any of the customer. The customer may have placed, 
# either one or more orders on or above order amount 2000 and must have a grade, 
# or he may not have placed any order to the associated supplier.
SELECT C.CUST_NAME, C.CITY, C.GRADE, S.NAME AS "SALESMAN", O.ORD_NO, O.PURCH_AMT
FROM SALESMAN S
LEFT JOIN CUSTOMER C ON S.SALESMAN_ID = C.SALESMAN_ID
LEFT JOIN ORDERS O ON S.SALESMAN_ID = O.SALESMAN_ID
WHERE O.PURCH_AMT >= 2000 AND C.GRADE IS NOT NULL;

# 15.For those customers from the existing list who put one or more orders, or which orders have 
# been placed by the customer who is not on the list, create a report containing the customer 
# name, city, order number, order date, and purchase amount
SELECT C.CUST_NAME, C.CITY, O.ORD_DATE, O.PURCH_AMT FROM CUSTOMER C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

# 16. Write a SQL statement to generate a report with the customer name, city, order no. order date, 
# purchase amount for only those customers on the list who must have a grade and placed one or 
# more orders or which order(s) have been placed by the customer who neither is on the list 
# nor has a grade.
SELECT C.CUST_NAME, C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT AS "ORDER AMOUNT"
FROM CUSTOMER C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.GRADE IS NOT NULL;

# 17. Write a SQL query to combine each row of the salesman table with each row of the customer 
# table.
SELECT * FROM SALESMAN S 
CROSS JOIN CUSTOMER C;

# 18. Write a SQL statement to create a Cartesian product between salesperson and customer, 
# i.e. each salesperson will appear for all customers and vice versa for that salesperson who 
# belongs to that city.
SELECT * FROM SALESMAN S
CROSS JOIN CUSTOMER C 
WHERE S.CITY IS NOT NULL;

# 19. Write a SQL statement to create a Cartesian product between salesperson and customer, 
# i.e. each salesperson will appear for every customer and vice versa for those salesmen who 
# belong to a city and customers who require a grade.
SELECT * FROM SALESMAN S
CROSS JOIN CUSTOMER C 
WHERE S.CITY IS NOT NULL AND C.GRADE IS NOT NULL;

# 20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. 
# each salesman will appear for all customers and vice versa for those salesmen who must belong 
# to a city which is not the same as his customer and the customers should have their own grade.
SELECT * FROM SALESMAN S
CROSS JOIN CUSTOMER C 
WHERE S.CITY IS NOT NULL AND C.GRADE IS NOT NULL AND S.CITY != C.CITY;
