create DATABASE MANAGERS;
USE MANAGERS;
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
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 37700000, 9984670),
(3, 'UK', 67800000, 243610),
(4, 'India', 1393409038, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83100000, 357022),
(7, 'France', 65200000, 551695),
(8, 'Japan', 126000000, 377975),
(9, 'China', 1444216107, 9596961),
(10, 'Brazil', 213000000, 8515767);      

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES

(1, 'RAHUL', 'SHARMA', 331000000, 4.2, 1, 'USA'),
(2, 'KARO', 'PATEL', 37700000, 4.6, 2, 'Canada'),
(3, 'ARJUN', 'SINGH', 67800000, 3.9, 3, 'UK'),
(4, 'ROHAN', 'GUPTA', 1393409038, 4.8, 4, 'India'),
(5, 'KAVIN', 'RAO', 25600000, 4.0, 5, 'Australia'),
(6, 'SUMIT', 'KHAN', 83100000, 4.5, 6, 'Germany'),
(7, 'PRIYA', 'JAIN', 65200000, 4.3, 7, 'France'),
(8, 'RISHI', 'DESAI', 126000000, 3.7, 8, 'Japan'),
(9, 'VIJAY', 'MEHTA', 1444216107, 4.9, 9, 'China'),
(10, 'SONIA', 'CHOPRA', 213000000, 4.1, 10, 'Brazil');

  SELECT LEFT(Country_name, 3) AS First_Three_Chars FROM Country;    
  SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;
  SELECT COUNT(DISTINCT Country_name) AS Unique_Countries FROM Persons;
  SELECT MAX(Population) AS Max_Population FROM Country;
  SELECT MIN(Population) AS Min_Population FROM Persons;
  INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES 
(11, 'ARADHANA', NULL, 50000000, 3.5, 2, 'Canada'),
(12, 'MARIYA', NULL, 60000000, 4.2, 4, 'India');

SELECT COUNT(Lname) AS Count_Lname FROM Persons;
SELECT COUNT(*) AS Total_Rows FROM Persons;
SELECT Population FROM Country LIMIT 3;
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

  