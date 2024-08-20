# 21. From the following tables, write a SQL query to find out which departments have at least two 
# employees. Group the result set on country name and city. Return country name, city, and number.
SELECT COUNTRY_NAME, CITY, COUNT(DEPARTMENT_ID) FROM COUNTRIES
JOIN LOCATIONS USING (COUNTRY_ID)
JOIN DEPARTMENTS USING (LOCATION_ID)
WHERE DEPARTMENT_ID IN 
    (SELECT DEPARTMENT_ID FROM EMPLOYEES 
     GROUP BY DEPARTMENT_ID 
     HAVING COUNT(DEPARTMENT_ID) >= 2)
GROUP BY COUNTRY_NAME, CITY;

# 22. From the following tables, write a SQL query to find the department name, full name 
# (first and last name) of the manager and their city.
SELECT DEPARTMENT_NAME, FIRST_NAME || ' ' || LAST_NAME AS NAME_OF_MANAGER, CITY FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.MANAGER_ID = E.EMPLOYEE_ID
JOIN LOCATIONS L USING (LOCATION_ID);

# 23. From the following tables, write a SQL query to calculate the number of days worked by 
# employees in a department of ID 80. Return employee ID, job title, number of days worked.
SELECT EMPLOYEE_ID, JOB_TITLE, END_DATE - START_DATE AS DAYS FROM JOB_HISTORY
NATURAL JOIN JOBS
WHERE DEPARTMENT_ID = 80;

# 24. From the following tables, write a SQL query to find full name (first and last name), 
# and salary of all employees working in any department in the city of London.
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID)
JOIN LOCATIONS USING (LOCATION_ID)
WHERE CITY = 'LONDON';

# 25. From the following tables, write a SQL query to find full name (first and last name), 
# job title, start and end date of last jobs of employees who did not receive commissions.
SELECT CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS EMPLOYEE_NAME, J.JOB_TITLE, H.* FROM EMPLOYEES E
JOIN (SELECT MAX(START_DATE) AS START_DATE, MAX(END_DATE) AS END_DATE, EMPLOYEE_ID FROM JOB_HISTORY
		GROUP BY EMPLOYEE_ID) H ON E.EMPLOYEE_ID = H.EMPLOYEE_ID
JOIN JOBS J ON J.JOB_ID = E.JOB_ID
WHERE E.COMMISSION_PCT = 0;

# 26. From the following tables, write a SQL query to find the department name, department ID, 
#and number of employees in each department.
SELECT D.DEPARTMENT_NAME,E.* FROM DEPARTMENTS D
JOIN (SELECT COUNT(EMPLOYEE_ID) AS EMPLOYEE_COUNT, DEPARTMENT_ID FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID) E USING (DEPARTMENT_ID);

# 27. From the following tables, write a SQL query to find out the full name (first and last name)
# of the employee with an ID and the name of the country where he/she is currently employed.
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, EMPLOYEE_ID, COUNTRY_NAME FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID)
JOIN LOCATIONS USING (LOCATION_ID)
JOIN COUNTRIES USING (COUNTRY_ID);
