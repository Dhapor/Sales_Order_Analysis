CREATE TABLE CustomerTable(
    Customer_ID INT PRIMARY KEY NOT NULL,
    Customer_Name VARCHAR (40) NOT NULL,
    Customer_Phone VARCHAR (40) NOT NULL
);


CREATE TABLE ProductTable(
    Product_ID INT PRIMARY KEY NOT NULL,
    Product_Name VARCHAR(20) NOT NULL,
    Product_Category VARCHAR (20) NOT NULL,
    Product_Price DECIMAL(10,2) NOT NULL CHECK(Product_Price > 0)
);


CREATE TABLE OrdersTable (
    Order_ID INT PRIMARY KEY,
    Quantity INT NOT  NULL,
    Order_Date DATE NOT NULL,
    total_amount INT NOT NULL,
    Customer_ID INT  NOT NULL,
    Product_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES CustomerTable(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES ProductTable(Product_ID)
    );

INSERT INTO CustomerTable VALUES
    (1, 'Alice', 08076567876),
    (2, 'Bob', 09087677654),
    (3, 'Charlie', 08035625378);


INSERT INTO ProductTable VALUES
    (1, 'Widget', 'Technology', 10.00),
    (2, 'Gadget', 'Bigger technology', 20.00),
    (3, 'Doohickey', 'small technology', 15.00);

INSERT INTO OrdersTable VALUES
(1, 10, '2021-01-01', 100, 1, 1),
(2, 5, '2021-01-02', 100, 1, 2),
(3, 3, '2021-01-03', 30, 2, 1),
(4, 7, '2021-01-04', 140, 2, 2),
(5, 2, '2021-01-05', 20, 2, 1),
(6, 3, '2021-01-06', 45, 3, 3);
    
CREATE DATABASE checkpoint6
SELECT* FROM CustomerTable
select * FROM ProductTable
select * FROM OrdersTable
-- Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, 
-- along with the total cost of the widgets and gadgets ordered by each customer. The cost of each item should be calculated by multiplying the quantity by the price of the product.

WITH Question1 AS(
SELECT CustomerTable.Customer_Name, ProductTable.Product_Name, SUM (Quantity * Product_Price) AS Cost_of_each_item
FROM OrdersTable
FULL OUTER JOIN ProductTable on ProductTable.Product_ID = OrdersTable.Order_ID
FULL outer join CustomerTable on CustomerTable.Customer_ID = OrdersTable.Customer_ID
GROUP by Customer_Name, Product_Name, total_amount)

SELECT * FROM Question1
WHERE Product_Name = 'widget' or Product_Name = 'gadget' 

-- Write a query to retrieve thAe names of the customers who have placed an order for at least one widget, along with the total cost of the widgets ordered by each customer.
WITH Question2 AS(
SELECT CustomerTable.Customer_Name, ProductTable.Product_Name, OrdersTable.total_amount FROM OrdersTable
FULL OUTER JOIN ProductTable on ProductTable.Product_ID = OrdersTable.Order_ID
FULL outer join CustomerTable on CustomerTable.Customer_ID = OrdersTable.Customer_ID
GROUP by Customer_Name, Product_Name, total_amount)

SELECT * FROM Question2
WHERE Product_Name = 'widget'

-- Write a query to retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.
WITH Question3 AS(
SELECT CustomerTable.Customer_Name, ProductTable.Product_Name, OrdersTable.total_amount FROM OrdersTable
FULL OUTER JOIN ProductTable on ProductTable.Product_ID = OrdersTable.Order_ID
FULL outer join CustomerTable on CustomerTable.Customer_ID = OrdersTable.Customer_ID
GROUP by Customer_Name, Product_Name, total_amount)

SELECT * FROM Question4
WHERE Product_Name = 'gadget'

-- Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.
WITH Question4 AS(
SELECT CustomerTable.Customer_Name, ProductTable.Product_Name, OrdersTable.total_amount FROM OrdersTable
FULL OUTER JOIN ProductTable on ProductTable.Product_ID = OrdersTable.Order_ID
FULL outer join CustomerTable on CustomerTable.Customer_ID = OrdersTable.Customer_ID
GROUP by Customer_Name, Product_Name, total_amount)

SELECT * FROM Question4
WHERE Product_Name = 'doohickey'

-- Write a query to retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.
WITH Question5 AS(
SELECT CustomerTable.Customer_Name, ProductTable.Product_Name, SUM(total_amount) FROM OrdersTable
FULL OUTER JOIN ProductTable on ProductTable.Product_ID = OrdersTable.Order_ID
FULL outer join CustomerTable on CustomerTable.Customer_ID = OrdersTable.Customer_ID
GROUP by Customer_Name, Product_Name, total_amount)

SELECT * FROM Question5
WHERE Product_Name = 'widget' or Product_Name = 'gadget'

-- Write a query to retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.
-- Write a query to retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.
-- Write a query to retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.
-- Write a query to retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.
