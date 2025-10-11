-- 12) Retrive the total number of books sold for each genre
SELECT b.genre, SUM(o.Quantity) AS total_book_sold 
FROM books AS b
JOIN orders AS o
ON o.book_id = b.book_id
GROUP BY b.genre
ORDER BY total_book_sold DESC;

-- 13) Find the average price of books in the "Fantasy" genre
SELECT Genre, avg(Price) AS averagePrice
FROM books
WHERE Genre = 'Fantasy'
GROUP BY Genre;


-- 14) List customers who have placed at least 2 orderes 
SELECT Customer_ID, COUNT(Order_ID) FROM orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID) >= 2;

-- 15) Find the most frequently ordered book
SELECT b.Title, o.Book_ID, count(o.Order_ID) AS order_count
FROM orders AS o
JOIN books AS b ON o.Book_ID = b.Book_ID
GROUP BY o.book_ID
ORDER BY order_count DESC 
LIMIT 1;

-- 16)  Show the top 3 most expensive books of "Fantasy" Genre
SELECT Title, Price FROM books
WHERE Genre ='Fantasy' 
ORDER BY Price DESC
LIMIT 3;

-- 17) Retrive the total quantity of books sold by each author 
SELECT b.Author, SUM(o.Quantity) FROM books as b
JOIN orders as o ON b.Book_ID = o.Book_ID
GROUP BY b.Author ;

-- 18) List the cities where customers who spent over $30 are located
SELECT DISTINCT c.City, o.Total_Amount FROM customers as c
JOIN orders as o ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > 30;

-- 19) Find the customer who spent the most on orderes
SELECT Customer_ID, SUM(Total_Amount) AS S from orders 
group by Customer_ID
ORDER BY S DESC LIMIT 1;

-- 20) calculate the stock remaining after fulfiling all orderes
SELECT b.book_ID, b.Title, b.Stock, COALESCE(SUM(o.Quantity),0) AS Order_quantity ,
b.Stock - COALESCE(SUM(o.Quantity),0) AS Remaining_quantity
FROM books as b
LEFT JOIN orders as o ON b.Book_ID = o.Book_ID
group by b.Book_ID
 

