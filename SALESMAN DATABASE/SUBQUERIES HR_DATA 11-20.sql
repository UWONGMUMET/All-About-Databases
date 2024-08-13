# 11. From the following tables, write a  SQL query to find those employees who do not work in the 
# departments where managers’ IDs are between 100 and 200 (Begin and end values are included.). 
# Return all the fields of the employeess.
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN 
	(SELECT DEPARTMENT_ID FROM DEPARTMENTS
    WHERE MANAGER_ID BETWEEN 100 AND 200);

# 12. From the following table, write a  SQL query to find those employees who get second-highest 
# salary. Return all the fields of the employees.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN 
	(SELECT EMPLOYEE_ID FROM EMPLOYEES
    WHERE SALARY = 
		(SELECT MAX(SALARY) FROM EMPLOYEES
        WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES))
	);

# 13. From the following tables, write a  SQL query to find those employees who work in the same 
# department as ‘Clara’. Exclude all those records where first name is ‘Clara’. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM EMPLOYEES
    WHERE FIRST_NAME = 'Clara')
AND FIRST_NAME != 'Clara';

# 14. From the following tables, write a  SQL query to find those employees who work in a department 
# where the employee’s first name contains the letter 'T'. Return employee ID, first name and 
# last name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '%T');

# 15. From the following tables, write a  SQL query to find those employees who earn more than the 
# average salary and work in the same department as an employee whose first name contains the 
# letter 'J'. Return employee ID, first name and salary.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE SALARY > 
	(SELECT AVG(SALARY) FROM EMPLOYEES)
AND DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '%J%');
    
# 16. From the following table, write a  SQL query to find those employees whose department is located at ‘Toronto’. 
# Return first name, last name, employee ID, job ID.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, JOB_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM DEPARTMENTS
    WHERE LOCATION_ID = 
		(SELECT LOCATION_ID FROM LOCATIONS
        WHERE CITY = 'Toronto'));

# 17. From the following table, write a  SQL query to find those employees whose salary is lower than that of 
# employees whose job title is ‘MK_MAN’. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE SALARY < ANY
	(SELECT SALARY FROM EMPLOYEES
    WHERE JOB_ID = 'MK_MAN');

# 18. From the following table, write a  SQL query to find those employees whose salary is lower than that of 
# employees whose job title is "MK_MAN". Exclude employees of Job title ‘MK_MAN’. Return employee ID, first name, 
# last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE SALARY < ANY
	(SELECT SALARY FROM EMPLOYEES
    WHERE JOB_ID = 'MK_MAN')
AND JOB_ID != 'MK_MAN';

# 19. From the following table, write a  SQL query to find those employees whose salary exceeds the salary of all 
# those employees whose job title is "PU_MAN". Exclude job title ‘PU_MAN’. Return employee ID, first name, last name, 
# job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE SALARY > ALL
	(SELECT SALARY FROM EMPLOYEES
    WHERE JOB_ID = 'PU_MAN')
AND JOB_ID != 'PU_MAN';

# 20. From the following table, write a  SQL query to find those employees whose salaries are higher than the average 
# for all departments. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE SALARY > ALL
	(SELECT AVG(SALARY) FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID)