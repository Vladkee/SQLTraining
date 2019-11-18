-- Задание 22
-- Write a query to display the employee number and name( first name and last name ) for all employees who work in a department with any employee whose name contains a T.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--FROM employees
--WHERE department_id IN (
--		SELECT department_id
--		FROM employees
--		WHERE first_name LIKE '%T%'
--		)

-- Задание 23
-- Write a query to display the employee number, name( first name and last name ), and salary for all employees who earn more than the average salary and who work in a department with any employee with a J in their name.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,salary
--FROM employees
--WHERE salary > (
--		SELECT AVG(salary)
--		FROM employees
--		)
--	AND department_id IN (
--		SELECT department_id
--		FROM employees
--		WHERE first_name LIKE '%J%'
--		)

-- Задание 24
-- Display the employee name( first name and last name ), employee id, and job title for all employees whose department location is Toronto.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,job_title
--FROM employees
--	,jobs
--WHERE employees.job_id = jobs.job_id
--	AND emplyee_id IN (
--		SELECT emplyee_id
--		FROM employees
--		WHERE department_id IN (
--				SELECT department_id
--				FROM employees
--				WHERE department_id IN (
--						SELECT department_id
--						FROM departments
--						WHERE location_id IN (
--								SELECT location_id
--								FROM locations
--								WHERE city LIKE 'Toronto'
--								)
--						)
--				)
--		)

-- Задание 25
-- Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,job_title
--FROM employees
--	,jobs
--WHERE employees.job_id = jobs.job_id
--	AND salary < (
--		SELECT MIN(salary)
--		FROM employees
--		WHERE salary IN (
--				SELECT salary
--				FROM employees
--				WHERE job_id LIKE 'MK_MAN'
--				)
--		)

-- Задание 26
-- Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN. Exclude Job title MK_MAN.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,job_title
--FROM employees
--	,jobs
--WHERE employees.job_id = jobs.job_id
--	AND salary < (
--		SELECT MIN(salary)
--		FROM employees
--		WHERE salary IN (
--				SELECT salary
--				FROM employees
--				WHERE job_id LIKE 'MK_MAN'
--				)
--			AND job_title NOT LIKE 'MK_MAN'
--		)

-- Задание 27
-- Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is more than any salary of those employees whose job title is PU_MAN. Exclude job title PU_MAN.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,job_title
--FROM employees
--	,jobs
--WHERE employees.job_id = jobs.job_id
--	AND salary > ALL(
--		SELECT salary
--		FROM employees
--		WHERE salary IN (
--				SELECT salary
--				FROM employees
--				WHERE job_id LIKE 'PU_MAN'
--				)
--			AND job_title NOT LIKE 'PU_MAN'
--		)

-- Задание 28
-- Write a query to display the employee number, name( first name and last name ) and job title for all employees whose salary is more than any average salary of any department.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,job_title
--FROM employees
--	,jobs
--WHERE employees.job_id = jobs.job_id
--	AND salary > ALL (
--		SELECT AVG(salary)
--		FROM employees
--		GROUP BY department_id
--		)

-- Задание 29
-- Write a query to display the employee name( first name and last name ) and department for all employees for any existence of those employees whose salary is more than 3700.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,department_id
--FROM employees
--WHERE EXISTS (
--		SELECT salary
--		FROM employees
--		WHERE salary > 3700
--		)

-- Задание 30
-- Write a query to display the department id and the total salary for those departments which contains at least one employee.

--SELECT departments.department_id
--	,self_table.total_salary
--FROM departments
--	,(
--		SELECT SUM(salary) AS total_salary
--			,department_id
--		FROM employees
--		GROUP BY department_id
--		) AS self_table
--WHERE departments.department_id = self_table.department_id

--SELECT department_id, SUM(salary) AS total_salary
--FROM employees
--GROUP BY department_id

-- Задание 31
-- Write a query to display the employee id, name ( first name and last name ) and the job id column with a modified title SALESMAN for those employees whose job title is ST_MAN and DEVELOPER for whose job title is IT_PROG.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,job_id
--	,CASE job_id
--		WHEN 'ST_MAN'
--			THEN 'SALESMAN'
--		WHEN 'IT_PROG'
--			THEN 'DEVELOPER'
--		ELSE job_id
--		END AS designation
--FROM employees

-- Задание 32
-- Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) full_name
--	,emplyee_id
--	,salary
--	,CASE
--		WHEN salary > (SELECT AVG(salary) FROM employees)
--			THEN 'HIGH'
--		WHEN salary < (SELECT AVG(salary) FROM employees)
--			THEN 'LOW'
--		END AS SalaryStatus
--FROM employees

-- Задание 33
-- Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) AS full_name
--	,emplyee_id
--	,(
--		salary - (
--			SELECT AVG(salary)
--			FROM employees
--			)
--		) AS AvgCompare
--	,CASE 
--		WHEN salary > (
--				SELECT AVG(salary)
--				FROM employees
--				)
--			THEN 'HIGH'
--		WHEN salary < (
--				SELECT AVG(salary)
--				FROM employees
--				)
--			THEN 'LOW'
--		END AS SalaryDrawn
--FROM employees

-- Задание 34
-- Write a subquery that returns a set of rows to find all departments that do actually have one or more employees assigned to them.

--SELECT department_name
--FROM departments
--	,employees
--WHERE departments.department_id = employees.department_id
--GROUP BY department_name
--HAVING COUNT(emplyee_id) >= 1

-- Задание 35
-- Write a query that will identify all employees who work in departments located in the United Kingdom.

--SELECT first_name
--FROM employees
--WHERE department_id IN (
--		SELECT department_id
--		FROM departments
--		WHERE location_id IN (
--				SELECT location_id
--				FROM locations
--				WHERE country_id = (
--						SELECT country_id
--						FROM countries
--						WHERE country_name = 'United Kingdom'
--						)
--				)
--		)

-- Задание 36
-- Write a query to determine who earns more than Mr. Ozer.

--SELECT first_name
--FROM employees
--WHERE salary > (
--		SELECT salary
--		FROM employees
--		WHERE last_name = 'Ozer'
--		)

-- Задание 37
-- Write a query to find out which employees have a manager who works for a department based in the US.

--SELECT first_name
--	,last_name
--	,manager_id
--FROM employees
--WHERE manager_id IN (
--		SELECT manager_id
--		FROM employees
--		WHERE department_id IN (
--				SELECT department_id
--				FROM departments
--				WHERE location_id IN (
--						SELECT location_id
--						FROM locations
--						WHERE country_id = 'US'
--						)
--				)
--		)
--	AND manager_id != 0

-- Задание 38
-- Write a query which is looking for the names of all employees whose salary is greater than 50% of their department’s total salary bill.

--SELECT first_name
--	,last_name
--FROM employees
--WHERE salary IN (
--		SELECT (SUM(salary) / 2)
--		FROM employees
--		GROUP BY department_id
--		)

-- Задание 39
-- Write a query to get the details of employees who are managers.

--SELECT *
--FROM employees
--WHERE EXISTS (
--		SELECT *
--		FROM departments
--		WHERE manager_id = emplyee_id
--		)

-- Задание 40
-- Write a query to get the details of employees who manage a department.

--SELECT *
--FROM employees
--WHERE emplyee_id = ANY (
--		SELECT manager_id
--		FROM departments
--		)

-- Задание 41
-- Write a query to display the employee id, name ( first name and last name ), salary, department name and city for all the employees who gets the salary as the salary earn by the employee which is maximum within the joining person January 1st, 2002 and December 31st, 2003.

--SELECT CONCAT (
--		first_name
--		,' '
--		,last_name
--		) AS full_name
--	,emplyee_id
--	,salary
--	,department_name
--	,city
--FROM employees
--	,departments
--	,locations
--WHERE salary IN (
--		SELECT MAX(salary)
--		FROM employees
--		WHERE hire_date BETWEEN '2002-01-01'
--				AND '2003-12-31'
--		)
--	AND employees.department_id = departments.department_id
--	AND departments.location_id = locations.location_id

-- Задание 42
-- Write a query in SQL to display the department code and name for all departments which located in the city London.

--SELECT department_id
--	,department_name
--FROM departments
--WHERE location_id IN (
--		SELECT location_id
--		FROM locations
--		WHERE city LIKE 'London'
--		)

-- Задание 43
-- Write a query in SQL to display the first and last name, salary, and department ID for all those employees who earn more than the average salary and arrange the list in descending order on salary.

--SELECT first_name
--	,last_name
--	,salary
--	,department_id
--FROM employees
--WHERE salary > (
--		SELECT AVG(salary)
--		FROM employees
--		)
--ORDER BY salary DESC

-- Задание 44
-- Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn more than the maximum salary of a department which ID is 40.

--SELECT first_name
--	,last_name
--	,salary
--	,department_id
--FROM employees
--WHERE salary > (
--		SELECT MAX(salary)
--		FROM employees
--		WHERE department_id = 40
--		)

-- Задание 45
-- Write a query in SQL to display the department name and Id for all departments where they located, that Id is equal to the Id for the location where department number 30 is located.

--SELECT department_name
--	,department_id
--FROM departments
--WHERE location_id = (
--		SELECT location_id
--		FROM departments
--		WHERE department_id = 30
--		)

-- Задание 46
-- Write a query in SQL to display the first and last name, salary, and department ID for all those employees who work in that department where the employee works who hold the ID 201.

--SELECT first_name
--	,last_name
--	,salary
--	,department_id
--FROM employees
--WHERE department_id = (
--		SELECT department_id
--		FROM employees
--		WHERE emplyee_id = 201
--		)

-- Задание 47
--  Write a query in SQL to display the first and last name, salary, and department ID for those employees whose salary is equal to the salary of the employee who works in that department which ID is 40.

--SELECT first_name
--	,last_name
--	,salary
--	,department_id
--FROM employees
--WHERE salary = (
--		SELECT salary
--		FROM employees
--		WHERE department_id = 40
--		)

-- Задание 48
-- Write a query in SQL to display the first and last name, and department code for all employees who work in the department Marketing.

--SELECT first_name
--	,last_name
--	,department_id
--FROM employees
--WHERE department_id IN (
--		SELECT department_id
--		FROM departments
--		WHERE department_name LIKE 'Marketing'
--		)

-- Задание 49
-- Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn more than the minimum salary of a department which ID is 40.

--SELECT first_name
--	,last_name
--	,salary
--	,department_id
--FROM employees
--WHERE salary > (
--		SELECT min(salary)
--		FROM employees
--		WHERE department_id = 40
--		)

-- Задание 50
-- Write a query in SQL to display the full name,email, and designation for all those employees who was hired after the employee whose ID is 165.

SELECT CONCAT (
		first_name
		,last_name
		) AS full_name
	,email
	,hire_date
FROM employees
WHERE hire_date > (
		SELECT hire_date
		FROM employees
		WHERE emplyee_id = 165
		)



