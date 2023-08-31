-- Inserting a new student into the table
INSERT INTO Student VALUES (
    1,          -- student_id
    'Jack',     -- name
    'Biology',  -- major
    3.00        -- gpa
);

-- New student
INSERT INTO Student VALUES (2, 'Kate', 'Sociology', 3.00);

-- Modify/update the information of a student
UPDATE Student SET gpa = 3.50 WHERE name = 'Kate';

-- New student with no major
-- Specify the information to insert into the table via TableName(...)
INSERT INTO Student(student_id, name, gpa) VALUES (3, 'Claire', 4.00);

-- Note that you cannot insert duplicate keys in the table (id must be unique)

INSERT INTO Student VALUES (4, 'Jack', 'Mathematics', 3.69);
INSERT INTO Student VALUES (5, 'Curtis', 'Computer Science', 3.34);

INSERT INTO Student VALUES (6, 'Hannah', 'Chemistry', 2.99);