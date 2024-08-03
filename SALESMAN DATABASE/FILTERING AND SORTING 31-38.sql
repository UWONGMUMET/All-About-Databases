# 31. From the following table, write a  SQL query to find the departments where more than ten 
# employees receive commissions. Return department id.
SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(COMMISSION_PCT) > 10;

# 32. From the following table, write a  SQL query to find those employees who have completed 
# their previous jobs. Return employee ID, end_date.
-- Selecting 'employee_id' and the maximum 'end_date'
SELECT EMPLOYEE_ID, MAX(end_date)
FROM JOB_HISTORY
WHERE EMPLOYEE_ID IN (
    SELECT EMPLOYEE_ID
    FROM JOB_HISTORY
    GROUP BY 1
    HAVING COUNT(EMPLOYEE_ID) > 1
)
GROUP BY 1;

# 33. From the following table, write a SQL query to find those employees who do not have 
# commission percentage and have salaries between 7000, 12000 (Begin and end values are included.) 
# and who are employed in the department number 50. Return all the fields of employees.
SELECT * FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL AND SALARY BETWEEN 7000 AND 12000 AND DEPARTMENT_ID = 50;

# 34. From the following table, write a  SQL query to compute the average salary of each job ID. 
# Exclude those records where average salary is on or lower than 8000. Return job ID, average salary.
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 8000;

# 35. From the following table, write a  SQL query to find those job titles where maximum salary 
# falls between 12000 and 18000 (Begin and end values are included.). Return job_title, 
# max_salary-min_salary.
SELECT JOB_TITLE, MAX_SALARY - MIN_SALARY AS SALARY_DIFFERENCE
FROM JOBS
WHERE MAX_SALARY BETWEEN 12000 AND 18000;

# 36. From the following table, write a SQL query to find the employees whose first or last name 
# begins with 'D'. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'D%' OR LAST_NAME LIKE 'D%';

# 37. From the following table, write a  SQL query to find details of those jobs where the minimum 
# salary exceeds 9000. Return all the fields of jobs.
SELECT * FROM JOBS
WHERE MIN_SALARY > 9000;

# 38. From the following table, write a SQL query to find those employees who joined after 7th 
# September 1987. Return all the fields.
SELECT * 
FROM EMPLOYEES
WHERE HIRE_DATE > '1987-09-07';