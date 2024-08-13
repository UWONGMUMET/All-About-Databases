# 31. From the following tables, write a  SQL query to find those employees whose salaries exceed 
# 50% of their department's total salary bill. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES E1
WHERE SALARY > 
	(SELECT SUM(SALARY) * 0.5 FROM EMPLOYEES E2
    WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID);

# 32. From the following tables, write a  SQL query to find those employees who are managers. 
# Return all the fields of employees table.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN 
	(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES);

# 33. From the following table, write a  SQL query to find those employees who manage a department. 
# Return all the fields of employees table.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = ANY 
	(SELECT MANAGER_ID FROM DEPARTMENTS);

# 34. From the following table, write a  SQL query to search for employees who receive such a salary, 
# which is the maximum salary for salaried employees, hired between January 1st, 2002 and December 
# 31st, 2003. Return employee ID, first name, last name, salary, department name and city.
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.LAST_NAME, A.SALARY, B.DEPARTMENT_NAME, C.CITY  
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C  
WHERE A.SALARY =  
  (SELECT MAX(SALARY) 
   FROM EMPLOYEES 
   WHERE HIRE_DATE BETWEEN '01/01/2002' AND '12/31/2003') 
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID 
AND B.LOCATION_ID = C.LOCATION_ID;

# 35. From the following tables, write a  SQL query to find those departments that are located in 
# the city of London. Return department ID, department name.
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS
WHERE LOCATION_ID = 
	(SELECT LOCATION_ID FROM LOCATIONS
    WHERE CITY = 'London');

# 36. From the following table, write a SQL query to find those employees who earn more than the 
# average salary. Sort the result-set in descending order by salary. Return first name, last name, 
# salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY DESC;

# 37. From the following table, write a  SQL query to find those employees who earn more than the 
# maximum salary for a department of ID 40. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > ALL 
	(SELECT SALARY FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 40);

# 38. From the following table, write a  SQL query to find departments for a particular location.
# The location matches the location of the department of ID 30. Return department name and 
# department ID.
SELECT DEPARTMENT_NAME, DEPARTMENT_ID FROM DEPARTMENTS
WHERE LOCATION_ID = 
	(SELECT LOCATION_ID FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = 30);

# 39. From the following table, write a SQL query to find employees who work for 
# the department in which employee ID 201 is employed. Return first name, last name, salary, and 
# department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 
     (SELECT DEPARTMENT_ID 
      FROM EMPLOYEES 
      WHERE EMPLOYEE_ID = 201);

# 40. From the following table, write a  SQL query to find those employees whose salary matches 
# that of the employee who works in department ID 40. Return first name, last name, salary, and 
# department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE SALARY IN (
	SELECT SALARY FROM EMPLOYEES 
    WHERE DEPARTMENT_ID = 40);
