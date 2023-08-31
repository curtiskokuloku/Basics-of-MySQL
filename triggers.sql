-- A trigger is basically a block of code that defines a certain action that
-- should happen when a certain operation is executed on a database
-- Triggers should be executed in the command line

CREATE TABLE IF NOT EXISTS Company.Trigger_Test (
    -- This table is used to demonstrate what is happening (not required)
    message VARCHAR(250)
);

-- Make sure to run the following the command line
DELIMITER $$  -- Change delimiter to handle trigger body

-- Before each item/row is inserted into the employee table, we will insert a message
-- into the trigger table
CREATE TRIGGER my_trigger BEFORE INSERT ON Company.Employee
    FOR EACH ROW
    BEGIN
        INSERT INTO Company.Trigger_Test VALUES ('Added a new employee');
    END$$

DELIMITER ;  -- Reset delimiter

INSERT IGNORE INTO Company.Employee VALUES
    (109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM Company.Trigger_Test;

-- We can instead add an attribute of the employee into the trigger table
DELIMITER $$
CREATE TRIGGER my_trigger BEFORE INSERT ON Company.Employee
    FOR EACH ROW
    BEGIN
        INSERT INTO Company.Trigger_Test VALUES (NEW.emp_id);
    END$$
DELIMITER ;

INSERT IGNORE INTO Company.Employee VALUES
    (110, 'Kevin', 'Malone', '1978-02-11', 'M', 110000, 100, 2);

-- To delete a trigger
DROP TRIGGER IF EXISTS Company.my_trigger;
DROP TRIGGER IF EXISTS Company.my_trigger2;

-- We can go further and add conditions to the trigger
DELIMITER $$
CREATE TRIGGER my_trigger BEFORE INSERT ON Company.Employee
    FOR EACH ROW
    BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO Company.Trigger_Test VALUES ('Added a male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO Company.Trigger_Test VALUES ('Added a female employee');
        ELSE
            INSERT INTO Company.Trigger_Test VALUES ('Added other employee');
        END IF;
    END$$
DELIMITER ;

INSERT IGNORE INTO Company.Employee VALUES
    (111, 'Pam', 'Beesly', '1988-10-28', 'F', 80000, 100, 1);

-- This trigger runs after an insertion operation on a table.
DELIMITER $$
CREATE TRIGGER after_insert_trigger AFTER INSERT ON Company.Employee
    FOR EACH ROW
    BEGIN
        INSERT INTO Company.Trigger_Test VALUES ('Employee inserted');
    END$$
DELIMITER ;

-- This trigger runs before an update operation on a table.
DELIMITER $$
CREATE TRIGGER before_update_trigger BEFORE UPDATE ON Company.Employee
    FOR EACH ROW
    BEGIN
        INSERT INTO Company.Trigger_Test VALUES ('Employee update about to occur');
    END$$
DELIMITER ;

-- This trigger runs after a deletion operation on a table.
DELIMITER $$
CREATE TRIGGER after_delete_trigger AFTER DELETE ON Company.Employee
    FOR EACH ROW
    BEGIN
        INSERT INTO Company.Trigger_Test VALUES ('Employee deleted');
    END$$
DELIMITER ;

-- This trigger can prevent the insertion of certain data based on validation conditions.
DELIMITER $$
CREATE TRIGGER before_insert_validation_trigger BEFORE INSERT ON Company.Employee
    FOR EACH ROW
    BEGIN
        IF NEW.salary < 50000 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Salary too low';
        END IF;
    END$$
DELIMITER ;

-- This trigger can prevent deletion of a record if it's referenced in another table.
DELIMITER $$
CREATE TRIGGER before_delete_dependency_trigger BEFORE DELETE ON Company.Branch
    FOR EACH ROW
    BEGIN
        DECLARE count_clients INT;
        SELECT COUNT(*) INTO count_clients FROM Company.Client WHERE branch_id = OLD.branch_id;
        IF count_clients > 0 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Cannot delete branch with active clients';
        END IF;
    END$$
DELIMITER ;
