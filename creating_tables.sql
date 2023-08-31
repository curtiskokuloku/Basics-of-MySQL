-- Creating a Student table that contains each student's id, name and major
CREATE TABLE sample.Student (
    student_id INT PRIMARY KEY, -- Unique column to identify each student
    name VARCHAR(100) NOT NULL,
    major VARCHAR(100)
    -- Can also use 'PRIMARY KEY(student_id)' to make each student_id unique
);

-- Can modify a desired table using 'ALTER TABLE'
ALTER TABLE sample.Student ADD COLUMN gpa DECIMAL(3, 2);

DESCRIBE sample.Student;    -- Describe everything available in this table

-- Can delete a specific column from the desired table
ALTER TABLE sample.Student DROP COLUMN gpa;

DROP TABLE sample.Student;  -- Delete the entire table from the database

-- Redefining the table with constraints
CREATE TABLE sample.Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    major VARCHAR(100) DEFAULT 'Undecided',
    gpa DECIMAL(3, 2) NOT NULL
);