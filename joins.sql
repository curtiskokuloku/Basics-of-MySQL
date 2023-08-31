-- A join operator is used to combine rows from two or more tables based in a related column between them

-- First, we are going to add a new branch into the Branch table
-- INSERT IGNORE INTO Company.Branch VALUES (4, 'Buffalo', NULL, NULL);

-- There are 3 basic types of joins:
-- JOIN         - considered as an inner join which basically combines rows based on a shared attribute
-- LEFT JOIN    - basically includes all the rows from the left table (FROM statement)
-- RIGHT JOIN   - does the opposite of LEFT JOIN; includes rows from the right table

-- Find all branches and the names of their managers
-- We know that a manager is also an employee, identified by their id
-- We can join the Branch table with the Employee table based on their id to make the query easier
SELECT E.emp_id, E.first_name, E.last_name, B.branch_name
FROM Company.Employee E
JOIN Company.Branch B
ON E.emp_id = B.mgr_id;

-- resulting table will include all employees;
-- employees who are not a manager of a branch will have a NULL in the branch_name column
SELECT E.emp_id, E.first_name, E.last_name, B.branch_name
FROM Company.Employee E
LEFT JOIN Company.Branch B
ON E.emp_id = B.mgr_id;

-- resulting table will include all branches;
-- branches with no manager will have a NULL in the emp_id, first_name and last_name columns
SELECT E.emp_id, E.first_name, E.last_name, B.branch_name
FROM Company.Employee E
RIGHT JOIN Company.Branch B
ON E.emp_id = B.mgr_id;

-- There is a 4th join operator, but cannot be done in MySQL:
-- FULL OUTER JOIN - does a left and right join; include all rows from the tables specified

