SHOW databases;
USE employees;
DESCRIBE employees;

-- 2. Employees with the first names 'Irena', 'Vidya', or 'Maya' using IN - 709
SELECT first_name
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya');
-- 3. Using OR instead of IN: Do numbers match? - 709 they match
SELECT first_name
FROM employees 
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';
-- 4. Who are male - 0 
SELECT first_name
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
AND gender = 'male';
-- 5. Employees last names start with an "E" - 7330
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%';
-- 6a. Starts OR ends with "E"? 30723 Ends with an "E" only? 
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%'
	OR last_name LIKE '%E';
-- 6b. Ends with an "E" only? 23393
SELECT last_name
FROM employees
WHERE last_name LIKE '%E'
	AND last_name NOT LIKE 'E%';
-- 7a. last names starts AND ends with "E"? 899
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E';
-- 7b. last names ends with "E" regardless of how it starts? 24292
SELECT last_name
FROM employees
WHERE last_name LIKE '%E';
-- 8. employees hired in the 90's. 135214
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 9. employees born on christmas? 842
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';
-- 10. employees hired in the 90s AND born on Christmas? 362
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25';
-- 11. Employees with a "Q" in their last name? 1873
SELECT * 
FROM employees
WHERE last_name LIKE '%q%';
-- 12. Employees with a "Q" in their last name, but not "QU"? 547
SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';