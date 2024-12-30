CREATE DATABASE Product;
USE Product;


CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Email VARCHAR(100),
Phone_no VARCHAR(15),
Address VARCHAR(255),
City VARCHAR(50),
State VARCHAR(50),
Zip_code VARCHAR(10),
Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id,First_name,Last_name,  Email,Phone_no,Address,City,State,Zip_code,Country)
VALUES
  (1, 'Emily', 'Davis', 'emilydavis@gmail.com', '9076543210', '1555 Broadway', 'New York', 'NY', '10019', 'USA'),
  (2, 'Michael', 'Brown', 'michaelbrown@yahoo.com', '7654321098', '123 Main St', 'Los Angeles', 'CA', '90012', 'USA'),
  (3, 'Sophia', 'Patel', 'sophiapatel@hotmail.com', '5432109876', '456 Elm St', 'Chicago', 'IL', '60611', 'USA'),
  (4, 'William', 'Lee', 'williamlee@aol.com', '9876543210', '789 Oak St', 'Houston', 'TX', '77002', 'USA'),
  (5, 'Olivia', 'Martin', 'oliviamartin@gmail.com', '7765432109', '901 5th Ave', 'Seattle', 'WA', '98104', 'USA'),
  (6, 'James', 'Hall', 'jameshall@yahoo.com', '6543210987', '3456 Maple St', 'Miami', 'FL', '33101', 'USA'),
  (7, 'Ava', 'Garcia', 'avagarcia@hotmail.com', '5432109876', '2345 Pine St', 'San Francisco', 'CA', '94105', 'USA'),
  (8, 'Robert', 'Harris', 'robertharris@aol.com', '9876543210', '6789 Cedar St', 'Boston', 'MA', '02215', 'USA'),
  (9, 'Isabella', 'Taylor', 'isabellataylor@gmail.com', '7765432109', '456 Spruce St', 'Denver', 'CO', '80202', 'USA'),
  (10, 'Richard', 'Walker', 'richardwalker@yahoo.com', '6543210987', '1234 Walnut St', 'Philadelphia', 'PA', '19107', 'USA');

CREATE VIEW customer_info_2 AS SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email FROM Customer;

SELECT * FROM customer_info_2;

CREATE VIEW US_Customers_2 AS SELECT * FROM Customer WHERE Country = 'US';

CREATE VIEW Customer_details_2 AS SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State FROM Customer;

UPDATE Customer SET Phone_no = 'NewPhoneNumber' WHERE State = 'California';

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details_2
GROUP BY State;

SELECT * 
FROM Customer_details_2
ORDER BY State ASC;
