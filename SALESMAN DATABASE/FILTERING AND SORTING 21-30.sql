# 21. From the following table, write a  SQL query to find the employees whose department numbers are 
# included in 30, 40, or 90. Return employee id, first name, job id, department id.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 40, 90);

# 22. From the following table, write a  SQL query to find those employees who worked more than two 
# jobs in the past. Return employee id.
SELECT EMPLOYEE_ID FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(*) >= 2;

# 23. From the following table, write a SQL query to count the number of employees, the sum of 
# all salary, and difference between the highest salary and lowest salaries by each job id. 
# Return job_id, count, sum, salary_difference.
SELECT JOB_ID, COUNT(*), SUM(SALARY), MAX(SALARY) - MIN(SALARY) AS SALARY_DIFFERENCE FROM EMPLOYEES
GROUP BY JOB_ID;

# 24. From the following table, write a  SQL query to find each job ids where two or more employees 
# worked for more than 300 days. Return job id.
SELECT JOB_ID FROM JOB_HISTORY
WHERE END_DATE - START_DATE > 300
GROUP BY JOB_ID
HAVING COUNT(*) >= 2;

# 25. From the following table, write a  SQL query to count the number of cities in each country. 
# Return country ID and number of cities.
SELECT COUNTRY_ID, COUNT(*) FROM LOCATIONS
GROUP BY COUNTRY_ID;

# 26. From the following table, write a SQL query to count the number of employees worked under each 
# manager. Return manager ID and number of employees.
SELECT MANAGER_ID, COUNT(*) FROM EMPLOYEES
GROUP BY MANAGER_ID;

# 27. From the following table, write a  SQL query to find all jobs. Sort the result-set in 
# descending order by job title. Return all fields.
SELECT * FROM JOBS
ORDER BY JOB_TITLE DESC;

# 28. From the following table, write a SQL query to find all those employees who are either 
# Sales Representatives or Salesmen. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE JOB_ID IN ('SA_REP', 'SA_MAN');

# 29. From the following table, write a  SQL query to calculate the average salary of employees who 
# receive a commission percentage for each department. Return department id, average salary.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID;

# 30. From the following table, write a  SQL query to find the departments where any manager 
# manages four or more employees. Return department_id.
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, MANAGER_ID
HAVING COUNT(EMPLOYEE_ID) >= 4;