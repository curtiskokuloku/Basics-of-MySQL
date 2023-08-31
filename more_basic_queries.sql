-- Find all employees
SELECT *
FROM Company.Employee;

-- Find all employees ordered by salary
SELECT *
FROM Company.Employee
ORDER BY salary DESC;

-- Find all employees ordered by sex then name
SELECT *
FROM Company.Employee
ORDER BY sex, first_name, last_name;

-- Find all employees ordered by their names in ascending order
SELECT *
FROM Company.Employee
ORDER BY first_name, last_name;

-- Find the first five employees
SELECT *
FROM Company.Employee
LIMIT 5;

-- Find the first and last names, in sorted order
SELECT E.first_name, E.last_name
FROM Company.Employee E
ORDER BY E.first_name, E.last_name;

-- Find the forenames and surnames of male employees
-- The resulting table will have columns 'forename' and 'surname'
SELECT E.first_name AS Forename, E.last_name AS Surname
FROM Company.Employee E
WHERE E.sex = 'M';

-- Find all the different genders
-- Keyword 'DISTINCT' can be used to select unique values from the table
SELECT DISTINCT sex AS Gender
FROM Company.Employee;

-- Find all employees that make $100,000 or more
SELECT *
FROM Company.Employee E
WHERE E.salary >= 100000;

-- Find all the different clients
SELECT DISTINCT C.client_name as Clients
FROM Company.Client C;