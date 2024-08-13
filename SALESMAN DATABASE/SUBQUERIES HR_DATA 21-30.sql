# 21. From the following table, write a  SQL query to check whether there are any employees with 
# salaries exceeding 3700. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE EXISTS 
	(SELECT * FROM EMPLOYEES
    WHERE SALARY > 3700);

# 22. From the following table, write a  SQL query to calculate total salary of the departments where 
# at least one employee works. Return department ID, total salary.
SELECT DEPARTMENTS.DEPARTMENT_ID, RESULT1.TOTAL_AMT
FROM DEPARTMENTS,  
  (SELECT EMPLOYEES.DEPARTMENT_ID, SUM(EMPLOYEES.SALARY) TOTAL_AMT  
   FROM EMPLOYEES  
   GROUP BY DEPARTMENT_ID
  ) RESULT1 
WHERE RESULT1.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

# 23. Write a query to display the employee id, name ( first name and last name ) and the job id 
# column with a modified title SALESMAN for those employees whose job title is ST_MAN and DEVELOPER 
# for whose job title is IT_PROG.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,  
  CASE JOB_ID  
    WHEN 'ST_MAN' THEN 'SALESMAN'  
    WHEN 'IT_PROG' THEN 'DEVELOPER'  
    ELSE JOB_ID  
  END AS DESIGNATION,  
  SALARY 
FROM EMPLOYEES;

# 24. Write a query to display the employee id, name ( first name and last name ), salary and the 
# SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is 
# more than and less than the average salary of all employees.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY,
	CASE WHEN SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES) THEN "HIGH"
    ELSE "LOW"
    END AS SALARY_STATUS
FROM EMPLOYEES;

# 25. Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, 
# AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a 
# title HIGH and LOW respectively for those employees whose salary is more than and less than 
# the average salary of all employees.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY AS SALARYDRAWN,  
  ROUND((SALARY - (SELECT AVG(SALARY) FROM EMPLOYEES)), 2) AS AVGCOMPARE,  
  CASE 
    WHEN SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES) THEN 'HIGH'  
    ELSE 'LOW'  
  END AS SALARYSTATUS 
FROM EMPLOYEES;

# 26. From the following table, write a  SQL query to find all those departments where at least one
# employee is employed. Return department name.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN 
	(SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES);
    
# 27. From the following tables, write a  SQL query to find employees who work in departments 
# located in the United Kingdom. Return first name.
SELECT FIRST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM DEPARTMENTS
    WHERE LOCATION_ID IN
		(SELECT LOCATION_ID FROM LOCATIONS
        WHERE COUNTRY_ID = 
			(SELECT COUNTRY_ID FROM COUNTRIES
            WHERE COUNTRY_NAME = 'United Kingdom')));
		
# 28. From the following table, write a  SQL query to find out which employees are earning more
# than the average salary and who work in any of the IT departments. Return last name.
SELECT LAST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
	(SELECT DEPARTMENT_ID FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME LIKE '%IT%')
AND SALARY > 
	(SELECT AVG(SALARY) FROM EMPLOYEES);
	
# 29. From the following table, write a  SQL query to find all those employees who earn more 
# than an employee whose last name is 'Ozer'. Sort the result in ascending order by last name. 
# Return first name, last name and salary.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > 
	(SELECT SALARY FROM EMPLOYEES
    WHERE LAST_NAME = 'Ozer')
ORDER BY LAST_NAME ASC;

# 30. From the following tables, write a  SQL query find the employees who report to a 
# manager based in the United States. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEES 
WHERE MANAGER_ID IN 
  (SELECT EMPLOYEE_ID 
   FROM EMPLOYEES 
   WHERE DEPARTMENT_ID IN 
     (SELECT DEPARTMENT_ID 
      FROM DEPARTMENTS 
      WHERE LOCATION_ID IN 
        (SELECT LOCATION_ID 
         FROM LOCATIONS 
         WHERE COUNTRY_ID='US')
     )
);
