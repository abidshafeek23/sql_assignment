use workers;
select * from worker;
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 

(11, 'Alice', 'Smith', 60000, '2024-02-01', 'Marketing'),
(3, 'Bob', 'Johnson', 45000, '2023-12-10', 'IT'),
(4, 'Emily', 'Davis', 70000, '2024-03-05', 'Finance'),
(5, 'Michael', 'Brown', 55000, '2023-11-20', 'HR'),
(6, 'Sarah', 'Wilson', 80000, '2024-01-25', 'Marketing'),
(7, 'David', 'Martinez', 52000, '2024-02-15', 'IT'),
(8, 'Jessica', 'Garcia', 48000, '2023-10-05', 'Finance'),
(9, 'Chris', 'Taylor', 67000, '2024-03-01', 'HR'),
(10, 'Sophia', 'Lee', 62000, '2023-12-30', 'Marketing');

DELIMITER $$

CREATE PROCEDURE AddWorker(IN p_Worker_Id INT,IN p_FirstName CHAR(25),iN p_LastName CHAR(25),IN p_Salary INT,IN p_JoiningDate DATETIME,IN p_Department CHAR(25))
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;
CALL AddWorker(1, 'John', 'Doe', 50000, '2024-01-15', 'HR');

DELIMITER $$

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;


SET @salary = 0;
CALL GetSalary(1, @salary);
SELECT @salary;


DELIMITER $$

CREATE PROCEDURE UpdateDepartment(IN p_Worker_Id INT, IN p_Department CHAR(25))
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

CALL UpdateDepartment(1, 'Finance');

DELIMITER $$

CREATE PROCEDURE CountWorkers(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

SET @workerCount = 0;
CALL CountWorkers('Finance', @workerCount);
SELECT @workerCount;

DELIMITER $$

CREATE PROCEDURE AverageSalary(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(15,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

SET @avgSalary = 0;
CALL AverageSalary('Finance', @avgSalary);
SELECT @avgSalary;