SHOW databases;
USE employees;
DESCRIBE employees;

-- 2. Example
SELECT DISTINCT last_name
FROM employees 
ORDER BY last_name DESC
LIMIT 10;
-- 3. 5 employees
SELECT first_name,
	last_name,
	birth_date,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25'
	ORDER BY hire_date
	LIMIT 5;
-- 4. LIMIT and OFFSET tenth page
SELECT first_name,
	last_name,
	birth_date,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25'
	ORDER BY hire_date
	LIMIT 5 OFFSET 45;