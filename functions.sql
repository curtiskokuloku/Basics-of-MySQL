-- Functions help us make tasks easier; simpler queries
-- 'COUNT(...)' can be used to count number of values in a column
-- 'AVG(...)' can be used to calculate the average value of a column
-- 'SUM(...)' can be used to calculate the sum of all the values in a column

-- Find the number of employees
SELECT COUNT(*) AS '# of employees'
FROM Company.Employee;

-- Find the number of employees that have supervisors
SELECT COUNT(super_id) AS 'employees with supervisor'
FROM Company.Employee;

-- Find the number of female employees born after 1970
SELECT COUNT(E.emp_id) AS 'female employees born after 1970'
FROM Company.Employee E
WHERE E.sex = 'F' AND E.birth_date > '1970-01-01';

-- Find the names of female employees from the previous query
SELECT E.first_name AS Forename, E.last_name AS Surname, E.birth_date AS DOB
FROM Company.Employee E
WHERE E.sex = 'F' AND E.birth_date > '1970-01-01';

-- Find the average of all employee's salary
SELECT AVG(E.salary) as 'Average salary'
FROM Company.Employee E;

-- Find the name of employee (in sorted order) whose salary is higher than the average
SELECT E.first_name, E.last_name, E.salary
FROM Company.Employee E
WHERE E.salary > (
    SELECT AVG(E2.salary)       -- Queries can be nested; becomes complicated
    FROM Company.Employee E2)
ORDER BY E.first_name, E.last_name;

-- Find the sum of all employee's salary
SELECT SUM(E.salary) as 'Sum of salaries'
FROM Company.Employee E;

-- Find the sum of all male employee's salary who were born before 1970
SELECT SUM(E.salary) as "Sum of male employee's salaries born before 1970"
FROM Company.Employee E
WHERE E.sex = 'M' AND E.birth_date < '1970-01-01';

-- Aggregation is where we use the functions to display the result in a more helpful way
-- Keyword 'GROUP BY' can be used to group the result into different/desired columns
-- This is basically a way of looping through the table

-- Find out how many males and female employees there are
SELECT E.sex AS Gender, COUNT(E.sex) AS '#'
FROM Company.Employee E
GROUP BY E.sex;

-- Find the total sales of each salesman
SELECT E.emp_id AS 'Employee ID', SUM(E.total_sales) AS 'Total Sales'
FROM Company.Works_With E
GROUP BY E.emp_id;

-- Find the name of the employees from the previous query
SELECT E.first_name AS 'Forename', E.last_name AS 'Surname', SUM(E2.total_sales) AS 'Total Sales'
FROM Company.Employee E, Company.Works_With E2
WHERE E2.emp_id = E.emp_id
GROUP BY E2.emp_id;

