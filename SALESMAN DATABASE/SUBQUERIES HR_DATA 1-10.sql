# 1. From the following table, write a  SQL query to find those employees who receive a higher 
# salary than the employee with ID 163. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE SALARY > 
	(SELECT SALARY FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 163);
    
# 2. From the following table, write a  SQL query to find out which employees have the same designation
# as the employee whose ID is 169. Return first name, last name, department ID and job ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES
WHERE JOB_ID = 
	(SELECT JOB_ID FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 169);
    
# 3. From the following table, write a  SQL query to find those employees whose salary matches the 
# lowest salary of any of the departments. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY IN 
	(SELECT MIN(SALARY) FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID);

# 4. From the following table, write a  SQL query to find those employees who earn more than the 
# average salary. Return employee ID, first name, last name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE SALARY > 
	(SELECT AVG(SALARY) FROM EMPLOYEES);

# 5. From the following table, write a  SQL query to find those employees who report to that manager
# whose first name is ‘Payam’. Return first name, last name, employee ID and salary.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, SALARY FROM EMPLOYEES
WHERE MANAGER_ID = 
	(SELECT EMPLOYEE_ID FROM EMPLOYEES
    WHERE FIRST_NAME = 'Payam');
    
# 6. From the following tables, write a  SQL query to find all those employees who work in the 
# Finance department. Return department ID, name (first), job ID and department name.
SELECT D.DEPARTMENT_ID, E.FIRST_NAME, E.JOB_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Finance';

# 7. From the following table, write a  SQL query to find the employee whose salary is 3000 and 
# reporting person’s ID is 121. Return all fields.
-- Selecting all columns (*) from the 'employees' table
SELECT * FROM EMPLOYEES
WHERE (SALARY, MANAGER_ID) = (SELECT 3000, 121);

# 8. From the following table, write a  SQL query to find those employees whose ID matches any of 
# the numbers 134, 159 and 183. Return all the fields. 
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (134, 159, 183);

# 9. From the following table, write a  SQL query to find those employees whose salary is in the 
# range of 1000, and 3000 (Begin and end values have included.). Return all the fields. 
-- Selecting all columns (*) from the 'employees' table
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN (SELECT 1000) AND 3000;

# 10. From the following table and write a  SQL query to find those employees whose salary 
# falls within the range of the smallest salary and 2500. Return all the fields.
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN (SELECT MIN(SALARY) FROM EMPLOYEES) AND 2500;