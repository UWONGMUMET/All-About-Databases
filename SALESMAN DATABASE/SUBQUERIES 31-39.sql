# 31. From the following tables write a SQL query to calculate the average price of each manufacturer's 
# product along with their name. Return Average Price and Company.
SELECT AVG(I.PRO_PRICE), C.COM_NAME FROM ITEM_MAST I, COMPANY_MAST C
WHERE I.PRO_COM = C.COM_ID
GROUP BY C.COM_NAME;

# 32. From the following tables write a SQL query to calculate the average price of each manufacturer's 
# product of 350 or more. Return Average Price and Company.
SELECT AVG(I.PRO_PRICE), C.COM_NAME FROM ITEM_MAST I, COMPANY_MAST C
WHERE I.PRO_COM = C.COM_ID
GROUP BY C.COM_NAME
HAVING AVG(I.PRO_PRICE) >= 350;

# 33. From the following tables, write a SQL query to find the most expensive product of each 
# 3company. Return Product Name, Price and Company.
SELECT I.PRO_NAME, I.PRO_PRICE, C.COM_NAME FROM ITEM_MAST I, COMPANY_MAST C
WHERE I.PRO_COM = C.COM_ID
AND I.PRO_PRICE = 
	(SELECT MAX(I2.PRO_PRICE) FROM ITEM_MAST I2
    WHERE I2.PRO_COM = C.COM_ID);

# 34. From the following tables write a SQL query to find employees whose last name is Gabriel or Dosio. 
# Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT * FROM EMP_DETAILS
WHERE EMP_LNAME IN ('Gabriel', 'Dosio');

# 35. From the following tables, write a SQL query to find the employees who work in department 89 or 63. 
# Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT * FROM EMP_DETAILS
WHERE EMP_DEPT IN (89, 63);

# 36. From the following tables write a SQL query to find those employees who work for the department where the
# departmental allotment amount is more than Rs. 50000. Return emp_fname and emp_lname.
SELECT EMP_FNAME, EMP_LNAME FROM EMP_DETAILS
WHERE EMP_DEPT IN 
	(SELECT DPT_CODE FROM EMP_DEPARTMENT
    WHERE DPT_ALLOTMENT > 50000);

# 37. From the following tables write a SQL query to find the departments whose sanction amount is higher than the 
# average sanction amount for all departments. Return dpt_code, dpt_name and dpt_allotment.
SELECT * FROM EMP_DEPARTMENT
WHERE DPT_ALLOTMENT > 
	(SELECT AVG(DPT_ALLOTMENT) FROM EMP_DEPARTMENT);

# 38. From the following tables write a SQL query to find which departments have more than two employees. 
# Return dpt_name.
SELECT DPT_NAME FROM EMP_DEPARTMENT
WHERE DPT_CODE IN 
	(SELECT EMP_DEPT FROM EMP_DETAILS
    GROUP BY EMP_DEPT
    HAVING COUNT(*) >= 2);
    
# 39. From the following tables write a SQL query to find the departments with the second lowest sanction amount. 
# Return emp_fname and emp_lname.
SELECT EMP_FNAME, EMP_LNAME FROM EMP_DETAILS
WHERE EMP_DEPT IN 
	(SELECT DPT_CODE FROM EMP_DEPARTMENT
    WHERE DPT_ALLOTMENT = 
		(SELECT MIN(DPT_ALLOTMENT) FROM EMP_DEPARTMENT
        WHERE DPT_ALLOTMENT > 
			(SELECT MIN(DPT_ALLOTMENT) FROM EMP_DEPARTMENT)));