USE employees;
DESCRIBE titles;
SELECT *
FROM titles
LIMIT 10;

-- 2. Find unique titles (7)
SELECT DISTINCT title
FROM titles;

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT DISTINCT last_name 
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT DISTINCT first_name,
				last_name
FROM employees
WHERE last_name LIKE 'e%e';

-- (Mine) 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code. (Chleq, Lindquist, Qiwen)
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%';

-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name. (547)
SELECT DISTINCT Count(last_name)
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%';

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. (M - 441 & F - 268)
SELECT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;


-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT lower(concat(substr(first_name, 1, 1), substr(last_name,1,4), "_", substr(birth_date,6,2), substr(birth_date,3,2))) as User_Name,
	first_name,
	last_name,
	birth_date
FROM employees;
	
