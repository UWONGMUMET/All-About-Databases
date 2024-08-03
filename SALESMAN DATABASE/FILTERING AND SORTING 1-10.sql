# 1. From the following table, write a SQL query to find those employees whose salaries are less than 
# 6000. Return full name (first and last name), and salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME FROM EMPLOYEES
WHERE SALARY < 6000;

# 2. From the following table, write a SQL query to find those employees whose salary is higher than 
# 8000. Return first name, last name and department number and salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 8000;

# 3. From the following table, write a SQL query to find those employees whose last name is "McEwen".
# Return first name, last name and department ID.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE LAST_NAME = "McEwen";

# 4. From the following table, write a SQL query to identify employees who do not have a department 
# number. Return employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,
# commission_pct, manager_id and department_id.
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

# 5. From the following table, write a SQL query to find the details of 'Marketing' department. 
# Return all fields.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Marketing';

# 6. From the following table, write a SQL query to find those employees whose first name does not 
# contain the letter ‘M’. Sort the result-set in ascending order by department ID. Return full 
# name (first and last name together), hire_date, salary and department_id.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE '%M%'
ORDER BY DEPARTMENT_ID;

# 7. From the following table, write a SQL query to find those employees who earn between 8000 and 
# 12000 (Begin and end values are included.) and get some commission. These employees joined before 
# ‘1987-06-05’ and were not included in the department numbers 40, 120 and 70. Return all fields.
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 8000 AND 12000 AND COMMISSION_PCT IS NOT NULL
OR HIRE_DATE < '1987-06-06' AND DEPARTMENT_ID NOT IN (40, 120, 70);

# 8. From the following table, write a SQL query to find those employees who do not earn any 
# commission. Return full name (first and last name), and salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, SALARY FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

# 9. From the following table, write a SQL query to find the employees whose salary is in the range 
# 9000,17000 (Begin and end values are included). Return full name, contact details and salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, CONCAT(PHONE_NUMBER, ' - ', EMAIL) 
AS CONTACT_DETAILS, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 17000;

# 10. From the following table, write a SQL query to find the employees whose first name ends with 
# the letter ‘m’. Return the first and last name, and salary.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%m';