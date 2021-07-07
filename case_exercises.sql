-- case_exercises
SHOW databases;
USE employees;

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
SELECT emp_no
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM dept_no 
		WHERE );

SELECT first_name, dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

SELECT *,
	IF (to_date > CURDATE(), TRUE, FALSE) AS is_current_employee
FROM employees.dept_emp;


-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT last_name,
	CASE last_name
		 WHEN ('A%', 'B%', 'C%', 'D%', 'E%', 'F%', 'G%', 'H%') THEN 'A-H'
		WHEN ('i%', 'j%', 'k%', 'l%', 'm%', 'n%', 'o%', 'p%', 'q%') THEN 'I-Q'
		WHEN ('r%', 's%', 't%', 'u%', 'v%', 'w%', 'x%', 'y%', 'z%') THEN 'R-Z'
		ELSE last_name
		END AS alpha_group
FROM employees
LIMIT 10;

-- 3. How many employees (current or previous) were born in each decade?

-- BONUS: What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?