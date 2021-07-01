USE employees;

-- Subquery exercise

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT first_name, last_name, hire_date # columns shown
FROM employees # from the employees table
WHERE hire_date IN ( # where the hire date equals the hire date in the employees table
		SELECT hire_date
		FROM employees
		WHERE emp_no = "101010");

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT title
FROM titles
WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE first_name = 'Aamod') 
	AND to_date > CURDATE(); #sets the current employees with these titles.

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 
SELECT emp_no
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM salaries
		WHERE to_date != CURDATE() ) ; # Retruns employees no longer employed 300024


-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, " ", last_name) AS Full_Name, gender
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM dept_manager
		WHERE to_date > CURDATE())
	AND gender = 'F'; # returns all current femal deptartment managers: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, and Hilary Kambil
		
-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT emp_no
FROM salaries
WHERE salary > 
		(SELECT AVG(salary)
		FROM salaries)
	AND to_date = '9999-01-01';

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT emp_no
FROM salaries
WHERE salary = (
		SELECT STD(salary)
		FROM salaries);
