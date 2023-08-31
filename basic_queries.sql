-- Queries help us retrieve specific information from the DBMS

-- SELECT: keyword that tells the dbms exactly what we want to get from it
-- '*': indicates that we want to retrieve EVERYTHING
-- <, >, <=, >=, <>, AND, OR are also allowed in the query

-- Select everything in the database
SELECT *
FROM Student;

-- Select all the names and corresponding major
SELECT name, major  -- student.name, student.major
FROM Student;

-- Select all the names and corresponding major in sorted order by name
SELECT name, major
FROM Student
ORDER BY name;  -- 'name DESC' to sort in descending order

-- Select all the names and corresponding major in sorted order by major in descending order
SELECT name, major
FROM Student
ORDER BY major DESC;

-- Select only two student names from the database
SELECT *
FROM Student
LIMIT 2;

-- Select the first student name with the lowest student id
SELECT student_id, name
FROM Student
ORDER BY student_id
LIMIT 1;

-- Select the names of students majoring in Comp Sci
SELECT name FROM Student WHERE major = 'Comp Sci';

-- Select only students having student id smaller than 3
SELECT * FROM Student WHERE student_id < 3;

-- Select only students having gpa above 3.00;
SELECT * FROM Student WHERE gpa > 3.00;

-- Select only students whose name is either Claire or Curtis
SELECT *
FROM Student
WHERE name in ('Claire', 'Curtis'); -- name = 'Claire' OR name = 'Curtis'

-- Select only students who is either majoring in Biochemistry or Math and has a gpa above 3.00
SELECT *
FROM Student
WHERE major in ('Biochemistry', 'Math') AND gpa > 2.50;