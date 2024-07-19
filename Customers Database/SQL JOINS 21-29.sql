# 21. From the following tables write a  SQL query to select all rows from both participating 
# tables as long as there is a match between pro_com and com_id.
SELECT * FROM COMPANY_MAST C
INNER JOIN ITEM_MAST I ON I.PRO_COM = C.COM_ID;

# 22. Write a  SQL query to display the item name, price, and company name of all the products.
SELECT I.PRO_NAME, I.PRO_PRICE, C.COM_NAME FROM COMPANY_MAST C
INNER JOIN ITEM_MAST I ON I.PRO_COM = C.COM_ID;

# 23. From the following tables write a  SQL query to calculate the average price of items of each 
# company. Return average value and company name.
SELECT AVG(I.PRO_PRICE), C.COM_NAME FROM COMPANY_MAST C
INNER JOIN ITEM_MAST I ON I.PRO_COM = C.COM_ID
GROUP BY C.COM_NAME;

# 24. From the following tables write a  SQL query to calculate and find the average price of 
# items of each company higher than or equal to Rs. 350. Return average value and company name.
SELECT AVG(I.PRO_PRICE), C.COM_NAME FROM COMPANY_MAST C
INNER JOIN ITEM_MAST I ON I.PRO_COM = C.COM_ID
GROUP BY C.COM_NAME
HAVING AVG(I.PRO_PRICE) >= 350;

# 25. From the following tables write a  SQL query to find the most expensive product of each 
# company. Return pro_name, pro_price and com_name.
SELECT I.PRO_NAME, I.PRO_PRICE, C.COM_NAME
FROM COMPANY_MAST C
INNER JOIN ITEM_MAST I ON I.PRO_COM = C.COM_ID
WHERE I.PRO_PRICE = (
    SELECT MAX(I2.PRO_PRICE)
    FROM ITEM_MAST I2
    WHERE I2.PRO_COM = C.COM_ID
);

# 26. From the following tables write a  SQL query to display all the data of employees 
# including their department.
SELECT * FROM EMP_DEPARTMENT E
INNER JOIN EMP_DETAILS D ON D.EMP_DEPT = E.DPT_CODE;

# 27. From the following tables write a  SQL query to display the first and last names of each
# employee, as well as the department name and sanction amount.
SELECT D.EMP_FNAME, D.EMP_LNAME, E.DPT_NAME, E.DPT_ALLOTMENT FROM EMP_DEPARTMENT E
INNER JOIN EMP_DETAILS D ON D.EMP_DEPT = E.DPT_CODE;

# 28. From the following tables write a  SQL query to find the departments with budgets
# more than Rs. 50000 and display the first name and last name of employees.
SELECT D.EMP_FNAME, D.EMP_LNAME FROM EMP_DEPARTMENT E
INNER JOIN EMP_DETAILS D ON D.EMP_DEPT = E.DPT_CODE
AND E.DPT_ALLOTMENT > 50000;

# 29. From the following tables write a  SQL query to find the names of departments 
# where more than two employees are employed. Return dpt_name.
SELECT E.DPT_NAME FROM EMP_DEPARTMENT E
INNER JOIN EMP_DETAILS D ON D.EMP_DEPT = E.DPT_CODE
GROUP BY E.DPT_NAME
HAVING COUNT(*) > 2;
