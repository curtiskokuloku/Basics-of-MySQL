-- Nested query is where we used multiple SELECT statements in the query to retrieve data
-- The result of one SELECT statement is used in the other SELECT statement
-- The nested query is first executed

-- Find the names of all employees who have sold over $30,000 to a single client
SELECT E.first_name, E.last_name
FROM Company.Employee E
WHERE E.emp_id IN (
    SELECT W.emp_id
    FROM Company.Works_With W
    WHERE W.total_sales > 30000
);

-- Find all clients who are handles by the branch that Michael Scoot manages
-- Assume Michael's ID is known (102)
SELECT C.client_name
FROM Company.Client C
WHERE C.branch_id = (
    SELECT B.branch_id
    FROM Company.Branch B
    WHERE B.mgr_id = 102
    LIMIT 1 -- insure we get only 1 result; efficient when using equality
);

