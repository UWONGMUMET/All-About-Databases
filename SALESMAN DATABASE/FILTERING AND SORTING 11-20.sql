# 11. From the following table, write a SQL query to find those employees whose salaries are not 
# between 7000 and 15000 (Begin and end values are included). Sort the result-set in ascending 
# order by the full name (first and last). Return full name and salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, SALARY FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 7000 AND 15000;

# 12. From the following table, write a SQL query to find those employees who were hired 
# between November 5th, 2007 and July 5th, 2009. Return full name (first and last), job id and 
# hire date.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2007-11-05' AND '2009-07-05';

# 13. From the following table, write a SQL query to find those employees who work either in
# department 70 or 90. Return full name (first and last name), department id.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (70, 90);

# 14. From the following table, write a SQL query to find those employees who work under a manager. 
# Return full name (first and last name), salary, and manager ID.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, SALARY, MANAGER_ID FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

# 15. From the following table, write a SQL query to find the employees who were hired before June 
# 21st, 2002. Return all fields.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE < '2002-06-21';

# 16. From the following table, write a SQL query to find the employees 
# whose managers hold the ID 120, 103, or 145. Return first name, last name, email, salary and
# manager ID.
SELECT FIRST_NAME, LAST_NAME, EMAIL, SALARY, MANAGER_ID FROM EMPLOYEES
WHERE MANAGER_ID IN (120, 103, 145);

# 17. From the following table, write a SQL query to find employees whose first names contain the 
# letters D, S, or N. Sort the result-set in descending order by salary. Return all fields.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%D%' OR FIRST_NAME LIKE '%S%' OR FIRST_NAME LIKE '%N%'
ORDER BY SALARY DESC;

# 18. From the following table, write a SQL query to find those employees who earn above 11000 or 
# the seventh character in their phone number is 3. Sort the result-set in descending order by 
# first name. Return full name (first name and last name), hire date, commission percentage, 
# email, and telephone separated by '-', and salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME, CONCAT(PHONE_NUMBER, ' - ', EMAIL) 
AS CONTACT_DETAILS, SALARY FROM EMPLOYEES
WHERE SALARY > 11000 OR PHONE_NUMBER LIKE '______3%'
ORDER BY FIRST_NAME DESC;

# 19. From the following table, write a SQL query to find those employees whose first name 
# contains a character 's' in the third position. Return first name, last name and department id.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES WHERE FIRST_NAME LIKE '__s%';

# 20. From the following table, write a SQL query to find those employees work in the departments 
# that are not part of the department 50 or 30 or 80. Return employee_id, first_name,job_id, 
# department_id.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES WHERE DEPARTMENT_ID NOT IN (50, 30, 80);