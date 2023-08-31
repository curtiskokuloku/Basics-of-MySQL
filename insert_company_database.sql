-- Inserting employees into the database
-- Can use `INSERT IGNORE` to skip the insertion of duplicate records

-- Corporate branch (1)
INSERT IGNORE INTO Company.Employee VALUES(
    100,                -- emp_id
    'David',            -- first_name
    'Wallace',          -- last_name
    '1967-11-17',       -- birth_date
    'M',                -- sex
    250000,             -- salary
    NULL,               -- super_id
    NULL                -- branch_id; set to NULL initially because nothing has been inserted into Branch table
);

INSERT IGNORE INTO Company.Branch VALUES(
    1,                  -- branch_id
    'Corporate',        -- branch_name
    100,                -- mgr_id
    '2006-02-09'        -- mgr_start_date
);

-- We can now assign an employee to a branch
UPDATE Company.Employee SET branch_id = 1 WHERE emp_id = 100;

INSERT IGNORE INTO Company.Employee VALUES(
    101,
    'Jan',
    'Levinson',
    '1961-05-11',
    'F',
    110000,
    100,
    1
);

-- Scranton branch (2)
INSERT IGNORE INTO Company.Employee VALUES(
    102,
    'Michael',
    'Scott',
    '1964-03-15',
    'M',
    75000,
    100,
    NULL
);

INSERT IGNORE INTO Company.Branch VALUES (2, 'Scranton', 102, '1992-04-06');

UPDATE Company.Employee SET branch_id = 2 WHERE emp_id = 102;

INSERT IGNORE INTO Company.Employee VALUES
    (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
    (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2),
    (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford branch (3)
INSERT IGNORE INTO Company.Employee VALUES
    (106,'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL),
    (107,'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, NULL),
    (108,'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, NULL);

INSERT IGNORE INTO Company.Branch VALUES(3, 'Stamford', '106', '1998-02-13');

UPDATE Company.Employee SET branch_id = 3 WHERE (emp_id = 106 OR emp_id = 107 OR emp_id = 108);

-- Branch Supplier
INSERT IGNORE INTO Company.Branch_Supplier VALUES
--  (branch_id, supplier_name, supplier_type)
    (2, 'Hammer Mill', 'Paper'),
    (2, 'Uni-ball', 'Writing Utensils'),
    (3, 'Patriot Paper', 'Paper'),
    (2, 'J.T. Forms & Labels', 'Custom Forms'),
    (3, 'Uni-ball', 'Writing Utensils'),
    (3, 'Hammer Mill', 'Paper'),
    (3, 'Stamford Labels', 'Custom Forms');

-- Client
INSERT IGNORE INTO Company.Client VALUES
--  (client_id, client_name, branch_id)
    (400, 'Dunmore Highschool', 2),
    (401, 'Lackawana County', 2),
    (402, 'FedEx', 3),
    (403, 'John Daly Law, LLC', 3),
    (404, 'Scranton Whitepages', 2),
    (405, 'Times Newspaper', 3),
    (406, 'FedEx', 2);

-- Works With
INSERT IGNORE INTO Company.Works_With VALUES
--  (emp_id, client_id, total_sales)
    (105, 400, 55000),
    (102, 401, 267000),
    (108, 402, 22500),
    (107, 403, 5000),
    (108, 403, 12000),
    (105, 404, 33000),
    (107, 405, 26000),
    (102, 406, 15000),
    (105, 406, 130000);