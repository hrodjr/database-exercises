SHOW databases;
USE employees;
DESCRIBE employees;

-- 2. Employees with the first names 'Irena', 'Vidya', or 'Maya' using IN and ORDER BY: Irena Reutenauer. Vida Simmen.
SELECT first_name,
	last_name
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;
-- 3. ORDER BY first and Last - Irena Acton, Vidya Zweizig
SELECT first_name,
	last_name
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;
-- 4. ORDER BY last then first - Irena Acton, Maya Zyda
SELECT first_name,
	last_name
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;
-- 5. last names starts AND ends with "E" sorted by employee number? Results - 899, first emp_no - 10021, first and last name - Ramzi Erde, last emmployee Tadahiro Erde 499648
SELECT first_name,
	last_name,
	emp_no
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;
-- 6. last names starts AND ends with "E" sorted by hire_date? 899, Teiji Eldridge 1999-11-27, Sergi Erde 1985-02-02
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date DESC;
-- 7. employees hired in the 90s AND born on Christmas?
SELECT first_name,
	last_name,
	birth_date,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25'
	ORDER BY birth_date ASC, hire_date DESC;