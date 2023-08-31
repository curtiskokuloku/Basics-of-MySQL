-- Wildcards are basically a way of defining different patterns that we want to match specific pieces of data
-- % = any # characters
-- _ = one character

-- Find any client who are an LLC
SELECT *
FROM Company.Client C
WHERE C.client_name LIKE '%LLC%';

-- Find any branch suppliers who are in the label business
SELECT *
FROM Company.Branch_Supplier B
WHERE B.supplier_name LIKE '%Label%';

-- Find any employee born in October (10th month)
SELECT *
FROM Company.Employee E
WHERE E.birth_date LIKE '____-10%';

-- Find all the employees whose forename begins with 'A' (in sorted order)
SELECT *
FROM Company.Employee E
WHERE E.first_name LIKE 'A%'
ORDER BY E.first_name, E.last_name;

-- Find any client who are schools
SELECT *
FROM Company.Client C
WHERE C.client_name LIKE '%school%';