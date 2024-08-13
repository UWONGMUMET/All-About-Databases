# 41. From the following table, write a  SQL query to find those employees who work in the department 
# 'Marketing'. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = 
	(SELECT DEPARTMENT_ID FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME = 'Marketing');

# 42. From the following table, write a  SQL query to find those employees who earn more than the
# minimum salary of a department of ID 40. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > ANY
	(SELECT SALARY FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 40);
    
# 43. From the following table, write a  SQL query to find those employees who joined after the 
# employee whose ID is 165. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE > 
	(SELECT HIRE_DATE FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 165);
    
# 44. From the following table, write a  SQL query to find those employees who earn less than the
# minimum salary of a department of ID 70. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY < ANY
	(SELECT SALARY FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 70);
    
# 45. From the following table, write a  SQL query to find those employees who earn less than the 
# average salary and work at the department where Laura (first name) is employed. Return first name, 
# last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY < 
	(SELECT AVG(SALARY) FROM EMPLOYEES)
AND DEPARTMENT_ID = 
	(SELECT DEPARTMENT_ID FROM EMPLOYEES
    WHERE FIRST_NAME = 'Laura');
    
# 46. From the following tables, write a  SQL query to find all employees whose department is 
# located in London. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM DEPARTMENTS
    WHERE LOCATION_ID = 
		(SELECT LOCATION_ID FROM LOCATIONS
        WHERE CITY = 'London'));
        
# 47. From the following tables, write a  SQL query to find the city of the employee of ID 134. 
# Return city.
SELECT CITY FROM LOCATIONS
WHERE LOCATION_ID IN 
	(SELECT LOCATION_ID FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = 
		(SELECT DEPARTMENT_ID FROM EMPLOYEES
        WHERE DEPARTMENT_ID =  134));

# 48. From the following tables, write a  SQL query to find those departments where maximum salary 
# is 7000 and above. The employees worked in those departments have already completed one or more 
# jobs. Return all the fields of the departments.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN
	(SELECT DEPARTMENT_ID FROM EMPLOYEES
    WHERE EMPLOYEE_ID IN 
		(SELECT EMPLOYEE_ID FROM JOB_HISTORY
        GROUP BY EMPLOYEE_ID
        HAVING COUNT(EMPLOYEE_ID) > 1)
	GROUP BY DEPARTMENT_ID 
    HAVING MAX(SALARY) > 7000);
    
# 49. From the following tables, write a  SQL query to find those departments where the starting 
# salary is at least 8000. Return all the fields of departments.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    HAVING MIN(SALARY) >= 8000);

# 50. From the following table, write a  SQL query to find those managers who supervise four or 
# more employees. Return manager name, department ID.
SELECT CONCAT(FIRST_NAME, '', LAST_NAME) AS MANAGER_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE EMPLOYEE_ID IN 
	(SELECT MANAGER_ID FROM EMPLOYEES
    GROUP BY MANAGER_ID
    HAVING COUNT(*) >= 4);