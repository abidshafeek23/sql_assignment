create database school;
use school;

CREATE TABLE teachers (id INT PRIMARY KEY,name VARCHAR(50),subject VARCHAR(50),experience INT,salary DECIMAL(10, 2));

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'ADAM', 'Mathematics', 5, 50000),
(2, 'BOB', 'Physics', 12, 70000),
(3, 'CHARLES', 'Chemistry', 8, 60000),
(4, 'SAM', 'Biology', 15, 75000),
(5, 'DAVID', 'History', 3, 40000),
(6, 'MULLER', 'Geography', 10, 55000),
(7, 'RIBERY', 'English', 2, 45000),
(8, 'KANE', 'Computer Science', 7, 65000);

DELIMITER $$
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
$$
DELIMITER ;

CREATE TABLE teacher_log (teacher_id INT,action VARCHAR(50),timestamp DATETIME);

DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with more than 10 years of experience';
    END IF;
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;
$$
DELIMITER ;




























