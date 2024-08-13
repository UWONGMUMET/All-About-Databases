# 51. From the following table, write a  SQL query to find employees who have previously worked as 
# 'Sales Representatives'. Return all the fields of jobs.
SELECT * FROM JOBS 
WHERE JOB_ID IN 
    (SELECT JOB_ID FROM EMPLOYEES 
     WHERE EMPLOYEE_ID IN 
        (SELECT EMPLOYEE_ID FROM JOB_HISTORY 
         WHERE JOB_ID = 'SA_REP')
    );


# 52. From the following table, write a  SQL query to find those employees who earn the second-lowest 
# salary of all the employees. Return all the fields of employees.
SELECT * FROM EMPLOYEES E
WHERE 2 = (SELECT COUNT(DISTINCT SALARY) FROM EMPLOYEES
			WHERE SALARY <= E.SALARY);

# 53. From the following table, write a  SQL query to find the departments managed by Susan.
# Return all the fields of departments.
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IN 
	(SELECT EMPLOYEE_ID FROM EMPLOYEES
    WHERE FIRST_NAME = 'Susan');

# 54. From the following table, write a  SQL query to find those employees who earn the highest 
# salary in a department. Return department ID, employee name, and salary.
SELECT DEPARTMENT_ID, CONCAT(FIRST_NAME , '', LAST_NAME) AS EMPLOYEE_NAME, SALARY FROM EMPLOYEES E
WHERE SALARY = 
	(SELECT MAX(SALARY) FROM EMPLOYEES
    WHERE DEPARTMENT_ID = E.DEPARTMENT_ID);

# 55. From the following table, write a  SQL query to find those employees who have not had a job in 
# the past. Return all the fields of employees.
SELECT * FROM EMPLOYEES 
WHERE EMPLOYEE_ID NOT IN 
    (SELECT EMPLOYEE_ID FROM JOB_HISTORY);

