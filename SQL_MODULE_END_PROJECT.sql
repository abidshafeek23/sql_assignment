CREATE DATABASE library;

USE library;

CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(255),
  Contact_no VARCHAR(20)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 KK STREET, Coimbatore', '0422-122336'),
(2, 102, '456 MG ROAD, Bangalore', '080-770112'),
(3, 103, '789 NSR ROAD, Chennai', '044-549090');

CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(255),
  Position VARCHAR(100),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'John Smith', 'Manager', 50000.00, 1),
(102, 'Jane Doe', 'Assistant Manager', 40000.00, 2),
(103, 'Bob Johnson', 'Branch Manager', 60000.00, 3),
(104, 'Alice Williams', 'Sales Executive', 30000.00, 1),
(105, 'Mike Davis', 'Customer Support', 25000.00, 2);

CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(100),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(10),
  Author VARCHAR(255),
  Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES

('56355461234', 'HISTORY', 'SOCIAL SCIENCE', 24.00, 'yes', 'PETER', 'INDIA Books');
('1234567890', 'To Kill a Mockingbird', 'Fiction', 20.00, 'yes', 'Harper Lee', 'Penguin Books'),
('2345678901', '1984', 'Dystopian', 25.00, 'yes', 'George Orwell', 'Penguin Books'),
('3456789012', 'The Great Gatsby', 'Classic', 30.00, 'no', 'F. Scott Fitzgerald', 'Scribner'),
('4567890123', 'The Catcher in the Rye', 'Young Adult', 20.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('5678901234', 'The Hitchhiker''s Guide to the Galaxy', 'Science Fiction', 25.00, 'yes', 'Douglas Adams', 'Pan Books');

CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(255),
  Customer_address VARCHAR(255),
  Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Emily Chen', '123 KK STREET, Coimbatore', '2022-01-01'),
(2, 'David Lee', '456 MG ROAD, Bangalore', '2022-02-01'),
(3, 'Sophia Patel', '789 NSR ROAD, Chennai', '2022-03-01'),
(4, 'Oliver Brown', '901 Park Ave, New York', '2022-04-01'),
(5, 'Ava White', '234 Oxford St, London', '2022-05-01');

CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(255),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';



SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;







SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;





SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;


SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;



SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);



SELECT B.Branch_no, COUNT(*) AS Total_Employees
FROM Branch B
JOIN Employee E ON B.Branch_no = E.Branch_no
GROUP BY B.Branch_no;




SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;




SELECT Book_title
FROM Books
WHERE Book_title LIKE '%HISTORY%';


SELECT B.Branch_no, COUNT(*) AS Total_Employees
FROM Branch B
JOIN Employee E ON B.Branch_no = E.Branch_no
GROUP BY B.Branch_no
HAVING COUNT(*) > 5;

SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;


SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;

