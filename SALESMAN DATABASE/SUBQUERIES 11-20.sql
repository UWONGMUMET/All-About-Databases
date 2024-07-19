# 11. From the following tables write a  SQL query to find salespeople who had more than one 
# customer. Return salesman_id and name.
SELECT SALESMAN_ID, NAME FROM SALESMAN S
WHERE 1 < 
	(SELECT COUNT(*) FROM CUSTOMER
    WHERE S.SALESMAN_ID = SALESMAN_ID);

# 12. From the following tables write a SQL query to find those orders, 
# which are higher than the average amount of the orders. 
# Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT * FROM ORDERS O
WHERE PURCH_AMT > 
	(SELECT AVG(PURCH_AMT) FROM ORDERS O1
    WHERE O1.CUSTOMER_ID = O.CUSTOMER_ID);

# 13. From the following tables write a  SQL query to find those orders that are equal or 
# higher than the average amount of the orders. Return ord_no, purch_amt, 
# ord_date, customer_id and salesman_id.
SELECT * FROM ORDERS O
WHERE PURCH_AMT >=
	(SELECT AVG(PURCH_AMT) FROM ORDERS O1
    WHERE O1.CUSTOMER_ID = O.CUSTOMER_ID);

# 14. Write a query to find the sums of the amounts from the orders table, 
# grouped by date, and eliminate all dates where the sum was not at least 1000.00 
# above the maximum order amount for that date.
SELECT O.ORD_DATE, SUM(O.PURCH_AMT) 
FROM ORDERS O
GROUP BY O.ORD_DATE
HAVING SUM(O.PURCH_AMT) > 
    (SELECT 1000.00 + MAX(O2.PURCH_AMT)
     FROM ORDERS O2
     WHERE O2.ORD_DATE = O.ORD_DATE);

# 15. Write a query to extract all data from the customer table if and only if one or more of the 
# customers in the customer table are located in London.
SELECT * FROM CUSTOMER
WHERE EXISTS 
    (SELECT * FROM CUSTOMER
     WHERE CITY = 'London');

# 16. From the following tables write a  SQL query to find salespeople who deal with multiple 
# customers. Return salesman_id, name, city and commission.
SELECT * FROM SALESMAN S
WHERE SALESMAN_ID IN 
	(SELECT DISTINCT SALESMAN_ID FROM CUSTOMER C
    WHERE EXISTS
		(SELECT * FROM CUSTOMER C1
        WHERE C1.SALESMAN_ID = C.SALESMAN_ID
        AND C1.CUST_NAME != C.CUST_NAME));

# 17. From the following tables write a  SQL query to find salespeople who deal with a 
# single customer. Return salesman_id, name, city and commission.
SELECT * FROM SALESMAN S
WHERE SALESMAN_ID IN 
	(SELECT DISTINCT SALESMAN_ID FROM CUSTOMER C
    WHERE NOT EXISTS
		(SELECT * FROM CUSTOMER C1
        WHERE C1.SALESMAN_ID = C.SALESMAN_ID
        AND C1.CUST_NAME != C.CUST_NAME));

# 18. From the following tables, write a  SQL query to find the salespeople who deal the 
# customers with more than one order. Return salesman_id, name, city and commission.
SELECT * 
FROM salesman a 
WHERE EXISTS     
   (SELECT * FROM customer b     
    WHERE a.salesman_id = b.salesman_id     
	 AND 1 <             
	     (SELECT COUNT(*)              
		  FROM orders o            
		  WHERE o.customer_id = b.customer_id)
   );
   
# 19. From the following tables write a  SQL query to find all salespeople who are 
# located in any city where there is at least one customer. Return salesman_id, name, 
# city and commission.
SELECT * FROM SALESMAN
WHERE CITY = ANY 
	(SELECT CITY FROM CUSTOMER);

# 20. From the following tables write a  SQL query to find salespeople whose place of 
# residence matches any city where customers live. Return salesman_id, name, city and commission.
SELECT * FROM SALESMAN
WHERE CITY IN
	(SELECT CITY FROM CUSTOMER);