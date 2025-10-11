-- Creating database
CREATE DATABASE bookStore;

-- creating tables books, customers and orderes
DROP TABLE IF EXISTS Books;
CREATE TABLE BOOKS(
Book_ID	SERIAL PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50), 
Published_Year INT,
Price NUMERIC(10,2),
Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE CUSTOMERS(
Customer_ID	SERIAL PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),	
City VARCHAR(100),
Country VARCHAR(100)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE ORDERS(
Order_ID	SERIAL PRIMARY KEY,
Customer_ID INT REFERENCES Customers(Customer_ID),
Book_ID INT REFERENCES Books(Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
);

 -- Import the data from boos.csv, customers.csv, orderes.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Books.csv' 
INTO TABLE books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv' 
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID,	Name,	Email,	Phone,	City,	Country);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv' 
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID,	Customer_ID, Book_ID, Order_Date, Quantity,	Total_Amount);


