# 21. From the following tables write a SQL query to find all those salespeople whose names appear 
# alphabetically lower than the customer’s name. Return salesman_id, name, city, commission.
SELECT * FROM SALESMAN S
WHERE EXISTS 
	(SELECT SALESMAN_ID FROM CUSTOMER C
    WHERE S.NAME < C.CUST_NAME);

# 22. From the following table write a SQL query to find all those customers with a higher grade than 
# all the customers alphabetically below the city of New York. Return customer_id, cust_name, city, 
# grade, salesman_id.
SELECT * FROM CUSTOMER
WHERE GRADE > ANY 
	(SELECT GRADE FROM CUSTOMER
    WHERE CITY < 'New York');
    
# 23. From the following table write a SQL query to find all those orders whose order 
# amount exceeds at least one of the orders placed on September 10th 2012. 
# Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT * FROM ORDERS
WHERE PURCH_AMT > ANY
	(SELECT PURCH_AMT FROM ORDERS
    WHERE ORD_DATE = '2012-10-10');

# 24. From the following tables write a SQL query to find orders where the order amount is less 
# than the order amount of a customer residing in London City. Return ord_no, purch_amt, 
# ord_date, customer_id and salesman_id.
SELECT * FROM ORDERS 
WHERE PURCH_AMT < ANY 
	(SELECT PURCH_AMT FROM ORDERS O, CUSTOMER C
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
    AND C.CITY = 'London');

# 25. From the following tables write a SQL query to find those orders where every order 
# amount is less than the maximum order amount of a customer who lives in London City. 
# Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT * FROM ORDERS
WHERE PURCH_AMT < ANY 
	(SELECT MAX(PURCH_AMT) FROM ORDERS O, CUSTOMER C
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
    AND C.CITY = 'London');

# 26. From the following tables write a SQL query to find those customers whose grades are higher 
# than those living in New York City. Return customer_id, cust_name, city, grade and salesman_id.
SELECT * FROM CUSTOMER
WHERE GRADE > ALL
	(SELECT GRADE FROM CUSTOMER
    WHERE CITY = 'New York');
    
# 27. From the following tables write a SQL query to calculate the total order amount generated 
# by a salesperson. Salespersons should be from the cities where the customers reside. 
# Return salesperson name, city and total order amount.
SELECT SALESMAN.NAME, SALESMAN.CITY, SUBQUERY1.TOTAL_AMT
FROM SALESMAN, 
    (SELECT SALESMAN_ID, SUM(ORDERS.PURCH_AMT) AS TOTAL_AMT 
    FROM ORDERS 
    GROUP BY SALESMAN_ID) SUBQUERY1
WHERE SUBQUERY1.SALESMAN_ID = SALESMAN.SALESMAN_ID
AND SALESMAN.CITY IN (SELECT DISTINCT CITY FROM CUSTOMER);

# 28. From the following tables write a  SQL query to find those customers whose grades are not the 
# same as those who live in London City. Return customer_id, cust_name, city, grade and salesman_id.
SELECT * FROM CUSTOMER
WHERE GRADE != ALL 
	(SELECT GRADE FROM CUSTOMER
    WHERE CITY = 'London' AND GRADE IS NOT NULL);
    
# 29. From the following tables write a  SQL query to find those customers whose grades are different
# from those living in Paris. Return customer_id, cust_name, city, grade and salesman_id.
SELECT * FROM CUSTOMER
WHERE GRADE NOT IN 
	(SELECT GRADE FROM CUSTOMER
    WHERE CITY = 'Paris');

# 30. From the following tables write a SQL query to find all those customers who have different 
# grades than any customer who lives in Dallas City. Return customer_id, cust_name,city, 
# grade and salesman_id.
SELECT * FROM CUSTOMER
WHERE NOT GRADE = ANY
	(SELECT GRADE FROM CUSTOMER
    WHERE CITY = 'Dallas');
