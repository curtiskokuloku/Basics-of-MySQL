-- We can create constraints to make inserting into the table easier
-- NOT NULL        - the value must always be fill with a valid information (not empty)
-- UNIQUE          - the value must vary from other values in a column
-- PRIMARY KEY     - value that is both NOT NULL and UNIQUE
-- DEFAULT [value] - provides a default value for information that has not been provided
-- AUTO_INCREMENT  - automatically increments a value in the table; does not need to be specified when inserting

CREATE TABLE sample.Sample_Table (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    major VARCHAR(100) DEFAULT 'Undecided',
    gpa DECIMAL(3, 2) NOT NULL
);