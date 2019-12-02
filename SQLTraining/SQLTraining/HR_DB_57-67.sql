-- 57. Write a query in SQL to display the first name, last name, department number, and department name for each employee.

--SELECT first_name
--	,last_name
--	,employees.department_id
--	,department_name
--FROM employees
--INNER JOIN departments ON employees.department_id = departments.department_id

-- 58. Write a query in SQL to display the first and last name, department, city, and state province for each employee.

--SELECT first_name
--	,last_name
--	,department_name
--	,city
--	,state_province
--FROM employees
--INNER JOIN departments ON employees.department_id = departments.department_id
--INNER JOIN locations ON departments.location_id = locations.location_id

-- 59. Write a query in SQL to display the first name, last name, salary, and job tittle for all employees.

--SELECT first_name
--	,last_name
--	,salary
--	,job_title
--FROM employees
--INNER JOIN jobs ON employees.job_id = jobs.job_id

-- 60. Write a query in SQL to display the first name, last name, department number and department name, for all employees for departments 80 or 40.

--SELECT first_name
--	,last_name
--	,employees.department_id
--	,department_name
--FROM employees
--INNER JOIN departments ON employees.department_id = departments.department_id
--WHERE employees.department_id IN (
--		40
--		,80
--		)


-- 61. Write a query in SQL to display those employees who contain a letter z to their first name and also display their last name, department, city, and state province.

--SELECT first_name
--	,last_name
--	,department_name
--	,city
--	,state_province
--FROM employees
--INNER JOIN departments ON employees.department_id = departments.department_id
--INNER JOIN locations ON departments.location_id = locations.location_id
--WHERE first_name LIKE '%z%'

-- 62. Write a query in SQL to display all departments including those where does not have any employee.

--SELECT first_name
--	,last_name
--	,employees.department_id
--	,department_name
--FROM employees
--FULL OUTER JOIN departments ON employees.department_id = departments.department_id

-- 63. Write a query in SQL to display the first and last name and salary for those employees who earn less than the employee earn whose number is 182.

--SELECT first_name
--	,last_name
--	,salary
--FROM employees
--WHERE salary < (
--		SELECT salary
--		FROM employees
--		WHERE emplyee_id = 182
--		)

-- 64. Write a query in SQL to display the first name of all employees including the first name of their manager.

--SELECT (E.first_name) AS employee_name
--	,(M.first_name) AS manager_name
--FROM employees E
--INNER JOIN employees M ON E.manager_id = M.emplyee_id

-- 65. Write a query in SQL to display the department name, city, and state province for each department.

--SELECT department_name
--	,city
--	,state_province
--FROM departments
--INNER JOIN locations ON departments.location_id = locations.location_id

-- 66. Write a query in SQL to display the first name, last name, department number and name, for all employees who have or have not any department.

--SELECT first_name
--	,last_name
--	,employees.department_id
--	,department_name
--FROM employees
--LEFT OUTER JOIN departments ON employees.department_id = departments.department_id

-- 67. Write a query in SQL to display the first name of all employees and the first name of their manager including those who does not working under any manager.

SELECT (E.first_name) AS employee_name
	,(M.first_name) AS manager_name
FROM employees E
LEFT OUTER JOIN employees M ON E.manager_id = M.emplyee_id
