-- Create the database
CREATE DATABASE IF NOT EXISTS Company;

-- Employee table
CREATE TABLE IF NOT EXISTS Company.Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

-- Branch table
CREATE TABLE IF NOT EXISTS Company.Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
    -- FOREIGN KEY used to create a relationship between the Branch table and
    -- Employee table; a manager is also an employee
);

-- Update the Employee table to have references to the Branch table
-- Each employee belongs to a branch in the company
ALTER TABLE Company.Employee
ADD FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL;

-- Each supervisor is also an employee
ALTER TABLE Company.Employee
ADD FOREIGN KEY(super_id) REFERENCES Employee(emp_id) ON DELETE SET NULL;

-- Client table
CREATE TABLE IF NOT EXISTS Company.Client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);

-- Works_With table - describes which employee is working with which client
CREATE TABLE IF NOT EXISTS Company.Works_With (
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id, client_id),    -- Composite key (made up of multiple columns)
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);

-- Branch Supplier table - describes the supply name and type associated with each branch
CREATE TABLE IF NOT EXISTS Company.Branch_Supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supplier_type VARCHAR(40),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);