USE join_example_db;
DESCRIBE roles;
DESCRIBE users;
# Join example databse
-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
SELECT *
FROM roles
JOIN users ON roles.id = users.id;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT *
FROM roles
LEFT JOIN users ON roles.id = users.id;

SELECT *
FROM roles
RIGHT JOIN users ON roles.id = users.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT roles.name AS Role_Name, COUNT(role_id) AS Number_Users
From users
RIGHT JOIN roles ON roles.id = users.role_id 
GROUP BY Role_Name;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name AS Department_Name, # selects the department name, renames and puts it in the first column
	CONCAT(first_name, " ", last_name) AS Department_Manager # Concates first and last name from employees table and puts it in the second column
FROM departments 
JOIN dept_manager #Joins departments table to the dept_manager table
	ON departments.dept_no = dept_manager.dept_no # bridges primary keys from the two tables
JOIN employees # Joins employee table to the dept_manger table
	ON employees.emp_no = dept_manager.emp_no # bridges primary keys from the two tables
WHERE dept_manager.to_date > CURDATE() # selects to current manager from the dept_manager table
ORDER BY Department_Name; # Orders by deartment name

-- 3. Find the name of all departments currently managed by women.
SELECT dept_name AS Department_Name, # selects the department name, renames and puts it in the first column
	CONCAT(first_name, " ", last_name) AS Manager_Name, # Concates first and last name from employees table and puts it in the second column
	gender # just a double check for myself to ensure the results are only female
FROM departments 
JOIN dept_manager #Joins departments table to the dept_manager table
	ON departments.dept_no = dept_manager.dept_no # bridges primary keys from the two tables
JOIN employees # Joins employee table to the dept_manger table
	ON employees.emp_no = dept_manager.emp_no # bridges primary keys from the two tables
WHERE dept_manager.to_date > CURDATE() AND employees.gender = 'F'# selects to current manager from the dept_manager table and filters for female managers
ORDER BY Department_Name; # Orders by deartment name

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT title AS Title, COUNT(dept_name) AS Count
FROM titles
JOIN dept_emp
	ON dept_emp.emp_no = titles.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Customer Service' AND dept_emp.to_date > CURDATE() AND titles.to_date > CURDATE()
GROUP BY Title
ORDER BY Title; 

-- 5. Find the current salary of all current managers.
SELECT dept_name AS Department_Name, CONCAT(first_name, last_name) AS Name, salary AS Salary
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
JOIN employees ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date > CURDATE() AND salaries.to_date > CURDATE()
ORDER BY Department_Name;

-- (MINE) 6. Find the number of current employees in each department.
SELECT departments.dept_no, dept_name, COUNT(employees.emp_no) AS num_employees
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date > CURDATE()
GROUP BY departments.dept_no;
# NOTES: 
# 1. Identify TABLES needed.
# 2. Identify JOINER TABLE if no direct relationship
# 3. Identify RELATIONSHIPS (Columns in Tables)
# 4. Identify COLUMNS needed.
# SELECT * FROM first table
# JOIN Tables
# Filter (i.e. WHERE)
# Change SELECT * to identified Columns -- insert CONCAT or COUNTS etc... AS WELL as GROUP BY etc...

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT dept_name, AVG(salary) AS average_salary
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date > CURDATE()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1; 

-- 8. Who is the highest paid employee in the Marketing department? Akemi Warwick
SELECT first_name, last_name
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
JOIN dept_emp ON dept_emp.emp_no = salaries.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Marketing' AND salaries.to_date > CURDATE() AND dept_emp.to_date > CURDATE()
ORDER BY salary DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?
SELECT first_name, last_name, salary, dept_name
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_name = 'Marketing' AND salaries.to_date > CURDATE() AND dept_manager.to_date > CURDATE();

-- 10. Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(employees.first_name, " ", employees.last_name) AS Employee_Name, dept_name AS Department_Name, CONCAT(me.first_name, " ", me.last_name) AS Manager_Name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees AS me ON me.emp_no = dept_manager.emp_no # Created an alias to join employees table on itself to create Manager_Name column
WHERE dept_emp.to_date > CURDATE() AND dept_manager.to_date > CURDATE();

-- 11. Bonus Who is the highest paid employee within each department.

