create database DATA;
USE DATA;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2,1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES 
(1, 'USA', 331000500, 9833517),
(2, 'Canada', 37708000, 9984670),
(3, 'UK', 67800460, 243610),
(4, 'India', 1393409038, 3287263),
(5, 'Australia', 25600850, 7692024),
(6, 'Germany', 83102900, 357022),
(7, 'France', 652001800, 551695),
(8, 'Japan', 126000750, 377975),
(9, 'China', 1444216107, 9596961),
(10, 'Brazil', 213009450, 8515767);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES

(1, 'ROHAN', 'SHARMA', 331000000, 4.2, 1, 'USA'),
(2, 'FATIMA', 'ALI', 37700000, 4.6, 2, 'Canada'),
(3, 'ETHAN', 'THOMPSON', 67800000, 3.9, 3, 'UK'),
(4, 'MANDEEP', 'SINGH', 1393409038, 4.8, 4, 'India'),
(5, 'TENZIN', 'WANGYAL', 25600000, 4.0, 5, 'Australia'),
(6, 'OMAR', 'KHAN', 83100000, 4.5, 6, 'Germany'),
(7, 'AISHWARYA', 'RAO', 65200000, 4.3, 7, 'France'),
(8, 'GURPREET', 'SINGH', 126000000, 3.7, 8, 'Japan'),
(9, 'PASANG', 'LAMA', 1444216107, 4.9, 9, 'China'),
(10, 'SARAH', 'TAYLOR', 213000000, 4.1, 10, 'Brazil');
SELECT DISTINCT Country_name FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';