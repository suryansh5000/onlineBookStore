-- 1) Retrive all the books in the fiction genre
SELECT * FROM books
WHERE Genre = "Fiction";

-- 2) Find the books published after the year 1950
SELECT * FROM books
WHERE Published_Year > 1950;

-- 3) List all customers from Canada
SELECT * FROM customers
WHERE Country = 'Canada';

-- 4) Show orderes placed in November 2023
SELECT * FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) RETRIVE THE TOTAL STOCK OF BOOK AVAILABLE
Select SUM(Stock) as Total_Stock from books;

-- 6) Find the details of the most expensive book
-- select max(Price) as Book_price from books;
SELECT * FROM books 
ORDER BY Price DESC 
LIMIT 1;

-- 7)  Show all customers who ordered more than 1 quantity of a book
SELECT * FROM orders
WHERE Quantity > 1;

-- 8) Retrive all orderes where the total amount exceeds $20
SELECT * FROM orders
WHERE Total_Amount > 20;

-- 9) List all genres available in Book table
SELECT DISTINCT Genre FROM books;

-- 10) Find the books with the lowest stock
SELECT * FROM books 
ORDER BY Stock 
LIMIT 1;

-- 11) Calculate the total revenue generated from all orderes 
SELECT SUM(Total_Amount) as Revenue FROM orders;
