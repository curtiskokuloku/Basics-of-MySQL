-- Modify the name of majors
UPDATE Student
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE Student
SET major = 'Comp Sci'
WHERE major = 'Computer Science';

UPDATE Student
SET major = 'Math'
WHERE major = 'Mathematics';

UPDATE Student
SET major = 'Comp Sci'
WHERE student_id = 3;

UPDATE Student
SET major = 'Chem'
WHERE major = 'Chemistry';

UPDATE Student
SET major = 'Socio'
WHERE major = 'Sociology';

UPDATE Student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chem';

UPDATE Student
SET name = 'Tom', major = 'Undecided', gpa = 3.78
WHERE student_id = 1;

DELETE FROM Student
WHERE student_id = 6;

UPDATE Student          -- Change every major to Undecided
SET major = 'Undecided';

DELETE FROM Student;    -- Delete all rows from Student