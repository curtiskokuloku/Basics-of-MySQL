-- UNION is a special operator we can use to combine the results of multiple queries
-- Rule 1: the number of columns in each query must be the same
-- Rule 2: columns in each query must be of the same type

-- Find a list of employee and branch names
SELECT E.first_name AS 'Employee/Branch Name'
FROM Company.Employee E
UNION
SELECT B.branch_name
FROM Company.Branch B;

-- Find a list of all clients and branch supplier names with the corresponding branch id
SELECT C.client_name AS 'Client/Supplier Name', C.branch_id AS 'Branch ID'
FROM Company.Client C
UNION
SELECT S.supplier_name, S.branch_id
FROM Company.Branch_Supplier S;

-- Find a list of all money spent or earned by the company
-- Money spent refers to the salary of employees; money earned refers to the total sales of each employee
SELECT E.salary AS 'Money Spent/Earned'
FROM Company.Employee E
UNION
SELECT W.total_sales
FROM Company.Works_With W;