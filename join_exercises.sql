-- Employees Database: 1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
-- Join table showing dept manager salary 
USE employees;

SELECT CONCAT(first_name, " ", last_name) AS full_name, dept_manager.dept_no, departments.dept_name, salaries.salary
FROM employees
JOIN dept_manager USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_manager.to_date > CURDATE() AND salaries.to_date > CURDATE();

-- Department average salary
SELECT departments.dept_name AS department, AVG(salaries.salary) AS salary
FROM employees
JOIN salaries USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE() AND dept_emp.to_date > CURDATE()
GROUP BY department;     

-- Temporary Table 
USE germain_1459;

SELECT *
FROM dept_manager_salary;
DESCRIBE dept_manager_salary;
-- Temporary table displaying dept manager salaries
CREATE TEMPORARY TABLE dept_manager_salary AS
SELECT CONCAT(first_name, " ", last_name) AS full_name, dept_manager.dept_no, departments.dept_name, salaries.salary
FROM employees.employees
JOIN employees.dept_manager USING(emp_no)
JOIN employees.salaries USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE dept_manager.to_date > CURDATE() AND salaries.to_date > CURDATE();

ALTER TABLE dept_manager_salary ADD dept_average_salary DECIMAL (6,2);

-- second temporary table for average employee salary by departments
USE germain_1459; 
SELECT * 
FROM dept_average_salary;

CREATE TEMPORARY TABLE dept_average_salary AS
SELECT departments.dept_name AS department, AVG(salaries.salary) AS salary
FROM employees.employees
JOIN employees.salaries USING(emp_no)
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE salaries.to_date > CURDATE() AND dept_emp.to_date > CURDATE()
GROUP BY department;
-- created a join to compare dept manager salary to department aerage salary.
SELECT full_name, dept_no, dept_name, dept_manager_salary.salary, dept_average_salary.salary
FROM dept_manager_salary
JOIN dept_average_salary ON dept_manager_salary.dept_name = dept_average_salary.department
ORDER BY dept_manager_salary.salary DESC;

-- World database questions.
SHOW databases;
USE world;
DESCRIBE countrylanguage;
-- What languages are spoken in Santa Monica?
SELECT countrylanguage.language AS Language, countrylanguage.percentage AS Percentage
FROM city
#Created joins to filter out languages spoken in the Santa Monica (many-to-many) 
JOIN country ON city.countrycode = country.code # created join to relate primary keys for city's country code to country's code
JOIN countrylanguage USING(countrycode)
WHERE city.name = 'Santa Monica'
ORDER BY Percentage;

-- How many different countries are in each region?
SELECT region AS Region, COUNT(code) AS num_countries
FROM country
GROUP BY region
ORDER BY num_countries;

