CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Orders (
  Order_Id INT PRIMARY KEY UNIQUE NOT NULL,
  Customer_name VARCHAR(255) NOT NULL,
  Product_Category VARCHAR(100) NOT NULL,
  Ordered_item VARCHAR(255) NOT NULL,
  Contact_No VARCHAR(15) NOT NULL
);

ALTER TABLE Orders
ADD order_quantity INT NOT NULL;

INSERT INTO Orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES 
(1, 'aslam', 'Electronics', 'Laptop', '9207008578', 2),
(2, 'alfas', 'Fashion', 'Dress', '9876545625', 1),
(3, 'david', 'Home Goods', 'Sofa', '9551234567', 1),
(4, 'ronald', 'Electronics', 'Smartphone', '9012345678', 1),
(5, 'sreekuttan', 'Sports', 'Basketball', '9112223333', 2),
(6, 'sachin', 'Fashion', 'Shoes', '9945556666', 1),
(7, 'ben', 'Home Goods', 'TV', '9778889999', 1),
(8, 'Sophi', 'Electronics', 'Tablet', '9334445555', 2),
(9, 'dan', 'Sports', 'Golf Clubs', '9667778888', 1),
(10, 'patel', 'Fashion', 'Handbag', '9990001111', 1);


SELECT Customer_name, Ordered_item 
FROM orders;

UPDATE orders 
SET Ordered_item = 'airpod' 
WHERE Order_Id = 4;

DROP TABLE orders;
