# 11. From the following table, write a SQL query to find the employees and their managers. 
# Those managers do not work under any manager also appear in the list. Return the first name of the 
# employee and manager.
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

# 12. From the following tables, write a SQL query to find the employees who work in the same 
# department as the employee with the last name Taylor. Return first name, last name and department ID.
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID FROM EMPLOYEES E
JOIN EMPLOYEES E1 ON E.EMPLOYEE_ID = E1.EMPLOYEE_ID
WHERE E1.LAST_NAME = 'Taylor';

# 13. From the following tables, write a  SQL query to find all employees who joined on or after
# 1st January 1993 and on or before 31 August 1997. Return job title, department name, 
# employee name, and joining date of the job.
SELECT JOB_TITLE, DEPARTMENT_NAME, FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, START_DATE FROM JOB_HISTORY 
JOIN JOBS USING (JOB_ID) 
JOIN DEPARTMENTS USING (DEPARTMENT_ID) 
JOIN EMPLOYEES USING (EMPLOYEE_ID) 
WHERE START_DATE >= '1993-01-01' AND START_DATE <= '1997-08-31';

# 14. From the following tables, write a SQL query to calculate the difference between the 
# maximum salary of the job and the employee's salary. Return job title, employee name, 
# and salary difference.
SELECT JOB_TITLE, FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, MAX_SALARY - SALARY AS SALARY_DIFFERENCE 
FROM EMPLOYEES 
NATURAL JOIN JOBS;

# 15. From the following table, write a  SQL query to calculate the average salary,
# the number of employees receiving commissions in that department. Return department name,
# average salary and number of employees.
SELECT DEPARTMENT_NAME, AVG(SALARY), COUNT(COMMISSION_PCT) FROM DEPARTMENTS 
JOIN EMPLOYEES USING (DEPARTMENT_ID) 
GROUP BY DEPARTMENT_NAME;

# 16. From the following tables, write a SQL query to calculate the difference between the 
# maximum salary and the salary of all the employees who work in the department of ID 80. 
# Return job title, employee name and salary difference.
SELECT JOB_TITLE, FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, MAX_SALARY - SALARY AS SALARY_DIFFERENCE 
FROM EMPLOYEES 
NATURAL JOIN JOBS 
WHERE DEPARTMENT_ID = 80;

# 17. From the following table, write a  SQL query to find the name of the country, city, 
# and departments, which are running there.
SELECT COUNTRY_NAME, CITY, DEPARTMENT_NAME 
FROM COUNTRIES 
JOIN LOCATIONS USING (COUNTRY_ID) 
JOIN DEPARTMENTS USING (LOCATION_ID);

# 18. From the following tables, write a SQL query to find the department name and the 
# full name (first and last name) of the manager.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS MANAGER_NAME FROM EMPLOYEES E
JOIN DEPARTMENTS D ON D.MANAGER_ID = E.EMPLOYEE_ID;

# 19. From the following table, write a SQL query to calculate the average salary of employees for 
# each job title.
SELECT JOB_TITLE, AVG(SALARY) FROM EMPLOYEES 
NATURAL JOIN JOBS 
GROUP BY JOB_TITLE;

# 20. From the following table, write a  SQL query to find the employees who earn $12000 or more. 
# 20. From the following table, write a  SQL query to find the employees who earn $12000 or more. 
# Return employee ID, starting date, end date, job ID and department ID.
SELECT J.* FROM JOB_HISTORY J
JOIN EMPLOYEES E ON J.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE E.SALARY >= 12000;