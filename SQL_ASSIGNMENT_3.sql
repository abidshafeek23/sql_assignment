CREATE DATABASE managers_table;
use managers_table;
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age > 18),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL);
    
    select * from managers;
    
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'AKBAR', 'KHAN', '1985-04-12', 39, 'M', 'IT', 30000),
(2, 'EMMA', 'SAM', '1990-08-20', 34, 'F', 'HR', 27000),
(3, 'Aaliya', 'SHAIKH', '1988-11-01', 36, 'F', 'Finance', 32000),
(4, 'STEPHEN', 'SMITH', '1980-06-15', 44, 'M', 'IT', 28000),
(5, 'OLIVIR ', 'GIROUD', '1992-03-10', 32, 'F', 'Sales', 25000),
(6, 'DAVID', 'BEKHAM', '1983-02-28', 41, 'M', 'IT', 26000),
(7, 'SOPHY', 'ROY', '1986-12-24', 37, 'F', 'IT', 35000),
(8, 'MICHEAL', 'ARTETA', '1995-07-18', 29, 'M', 'Marketing', 24000),
(9, 'EMIL', 'BENNY', '1989-05-05', 35, 'F', 'IT', 21000),
(10, 'DANI', 'ALVES', '1987-09-25', 37, 'M', 'HR', 22000);

SELECT First_name, Last_Name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

 SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;

SELECT *
FROM Managers
WHERE First_name != 'Aaliya';

SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;


SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;

 