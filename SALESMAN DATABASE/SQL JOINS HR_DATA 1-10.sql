# 1. From the following tables, write a  SQL query to find the first name, last name, 
#  department number, and department name for each employee.
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

# 2. From the following tables, write a SQL query to find the first name, last name, department, city, 
# and state province for each employee.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY, L.STATE_PROVINCE FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

# 3. From the following table, write a SQL query to find the first name, last name, salary, 
# and job grade for all employees.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY, J.GRADE_LEVEL FROM EMPLOYEES E
JOIN JOB_GRADES J ON E.SALARY BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL;

# 4. From the following tables, write a  SQL query to find all those employees who work in 
# department ID 80 or 40. Return first name, last name, department number and department name.
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.DEPARTMENT_ID IN (40,80)
ORDER BY E.LAST_NAME;

# 5. From the following tables, write a SQL query to find those employees whose first name 
# contains the letter ‘z’. Return first name, last name, department, city, and state province.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY, L.STATE_PROVINCE FROM EMPLOYEES E
JOIN DEPARTMENTS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.FIRST_NAME LIKE '%z%';

# 6. From the following tables, write a SQL query to find all departments, including those without 
# employees. Return first name, last name, department ID, department name.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM EMPLOYEES E 
RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

# 7. From the following table, write a  SQL query to find the employees who earn less than the 
# employee of ID 182. Return first name, last name and salary.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY FROM EMPLOYEES E
JOIN EMPLOYEES E1 ON E.EMPLOYEE_ID < E1.EMPLOYEE_ID
AND E1.EMPLOYEE_ID = 182;

# 8. From the following table, write a SQL query to find the employees and their managers. 
# Return the first name of the employee and manager.
SELECT E.FIRST_NAME AS "EMPLOYEE_NAME", E1.FIRST_NAME AS "MANAGER_ID" FROM EMPLOYEES E
JOIN EMPLOYEES E1 ON E.MANAGER_ID = E1.EMPLOYEE_ID;

# 9. From the following tables, write a SQL query to display the department name, city, and 
# state province for each department.
SELECT D.DEPARTMENT_NAME, L.CITY, L.STATE_PROVINCE FROM DEPARTMENTS D
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

# 10. From the following tables, write a  SQL query to find out which employees have or do not have 
# a department. Return first name, last name, department ID, department name.
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
