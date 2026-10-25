USE projectdatabase;

## Question 1) Retrive all books from Fiction Genre
SELECT* FROM `books.csv`
WHERE Genre="Fiction";   

##2)  Find the books published after year 1950
SELECT * FROM `books.csv`
WHERE Published_Year>1950;  

##3)List all the customers from canada
SELECT * FROM `customers.csv`
WHERE Country = "Canada";

##4)Show all orders placed in november 2023
SELECT * FROM `orders.csv`
WHERE Order_Date BETWEEN "2023-11-01" AND "2023-11-30";

##5)Retrive the total stock of books available
SELECT SUM(Stock) AS Total_stock
 FROM `books.csv`;
 
 USE projectdatabase;
 
 ##6) Find the details of the most expensive book
SELECT * FROM `books.csv`
ORDER BY Price DESC LIMIT 1;

##7)Show all customers who ordered more than 1 quantity of a book
SELECT * FROM `orders.csv` 
WHERE Quantity> 1; 

##8)Retrive all orders where the total amount exceeds $20
SELECT * FROM `orders.csv`
WHERE Total_Amount > 20;

##9)List all genres available in books table
SELECT DISTINCT GENRE FROM `books.csv`;

##10)Find the book with lowest stock
SELECT * FROM `books.csv`
ORDER BY Stock LIMIT 1; 
 
 ##11) Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Revenue FROM `orders.csv`;

## Advance Questions 
##1)Retrive the total number of books sold for each genre
SELECT * FROM `orders.csv`; 

SELECT genre, SUM(Quantity) AS Total_books_sold
FROM `orders.csv` AS o
JOIN `books.csv` AS b
ON o.Book_ID=b.Book_ID
GROUP BY genre; 

##2) Find the average price of books in fantasy genre
SELECT AVG (Price) AS Average_price
FROM `books.csv`
WHERE Genre = "Fantasy"; 

##3)List the customers who have placed at least 2 orders
SELECT o.Customer_ID, c.Name, COUNT(o.Order_ID) AS Order_count
FROM `orders.csv` AS O
JOIN `customers.csv` AS c
ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID , c.Name
HAVING COUNT(o.Order_ID) >=2; 

##4)Find the  most frequently orderd book
SELECT o.Book_ID, b.Title,  COUNT(o.Order_ID) AS ORDER_COUNT 
FROM `orders.csv` AS o
JOIN  `books.csv` AS b
ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID , b.Title
ORDER BY ORDER_COUNT DESC LIMIT 1;

USE projectdatabase;

##5)Show the top 3 most expensive books of fantasy genre
SELECT * FROM `books.csv`
WHERE Genre = "Fantasy"
ORDER BY Price DESC LIMIT 3; 

##6)Retrive the total quantity of books sold by each author
SELECT b.Author , SUM(o.Quantity) AS Total_quantity_of_books
FROM `orders.csv` AS o
JOIN `books.csv` AS b
ON  o.Book_ID = b.Book_ID
GROUP BY b.Author;  

##7) List the cities where customers who spent $30 are located 
SELECT DISTINCT c.city , c.Name , c.Customer_ID, o.Total_Amount
FROM `orders.csv` AS o
JOIN `customers.csv` AS c
ON o.Customer_ID = c.Customer_ID
WHERE Total_Amount > 300;

##8) Find the customer who spent the most on orders: 
SELECT c.Customer_ID , c.Name, SUM(o.Total_Amount) AS Total_spent
FROM `orders.csv` AS o
JOIN`customers.csv` AS c
ON o.Customer_ID = c.Customer_ID 
GROUP BY c.Customer_ID , c.Name
ORDER BY Total_spent DESC LIMIT 1;

##9) Calculate the stock remaining after fulfilling all orders:
SELECT b.Book_ID , b.Title , b.Stock , 
COALESCE (SUM(o.Quantity),0) AS Order_quantity ,  b.Stock - 
COALESCE (SUM(o.Quantity),0) AS Reamaing_quentity
FROM `books.csv` AS b 
LEFT JOIN `orders.csv` AS o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID , b.Title , b.Stock 
ORDER BY b.Book_ID;  



