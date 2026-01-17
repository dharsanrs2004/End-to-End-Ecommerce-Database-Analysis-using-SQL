-- BASIC SELECT AND FILTERING--
-- ------------------------------------------------------------------------
-- 1.Write a Query to Display all the products with price and stock.
SELECT PRODUCT_NAME, PRICE, STOCK FROM products;

-- 2.Write a Query to Find products costing more than RS.5000
SELECT * FROM products
WHERE price>5000;

-- 3.Write a Query to Display ORDERS that are delivered.
SELECT * FROM orders
WHERE status="Delivered";

-- 4.Write a Query to Display ORDERS that are Cancelled.
SELECT * FROM orders
WHERE status="Cancelled";

-- 5.Write a Query to Display Orders placed after 1st April 2024
SELECT  * FROM orders
WHERE order_date='2024-04-01';

-- 6.Write a Query to Display distinct product categories
SELECT DISTINCT category_name
FROM categories;

-- 7.Write a Query to Display Products priced between 1000 and 5000
SELECT product_name
FROM products
WHERE price BETWEEN 1000 AND 5000;

-- 8.Write a Query to Display Orders sorted by latest date
SELECT * FROM orders
ORDER BY order_date DESC ;

-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- AGGREGATE FUNCTION ---
------------------------------------------------------------
-- 9. Write a Query to Display total number of orders
SELECT COUNT(*) AS TOTAL_NUMBER_OF_ORDERS
FROM orders;

-- 10.Write a Query to display Total revenue from completed payments
SELECT SUM(payments.amount) AS TOTAL_REVENUE
FROM payments
WHERE payment_status='COMPLETED';

-- 11.Write a Query to display Average product price
SELECT AVG(products.price) AS AVG_PRODUCT_PRICE
FROM products;

-- 12.Write a Query to display Highest product price
SELECT MAX(products.price) AS HIGHEST_PRODUCT_PRICE
FROM products;

-- 13.Write a Query to display Lowest product price
SELECT MIN(products.price) AS LOWEST_PRODUCT_PRICE
FROM products;

-- 14.Write a Query to display Total quantity sold
SELECT SUM(order_items.quantity) AS TOTAL_QTY
FROM order_items;

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

-- GROUPBY CLAUSE AND HAVING CLAUSE
-- -----------------------------------------
-- 15.Write a Query to display Total revenue per payment method
SELECT payment_method, SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'COMPLETED'
GROUP BY payment_method;

-- 16.Write a Query to display Categories having more than 5 products
SELECT COUNT(*), category_id
FROM products
GROUP BY category_id
HAVING COUNT(*)>5;

-- 17.Write a Query to display Customers with more than 1 order
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

-- JOINS(INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN, SELF JOIN)
-- ----------------------------------------------------------------------------------
-- 18.Write a Query to Display all orders along with customer names
SELECT orders.order_id,orders.customer_id,customer.name,orders.order_date
FROM orders INNER JOIN customer
ON orders.customer_id = customer.customer_id;

-- 19.Write a Query to Find all customers and their orders (including customers with no orders)
SELECT customer.name,orders.customer_id,orders.order_id
FROM customer LEFT JOIN orders
ON orders.customer_id = customer.customer_id;

-- 20.Write a Query to display all orders and customer details (even if customer data is missing.)
SELECT customer.name,customer.email,customer.phone,customer.city,orders.customer_id,order_id,order_date
FROM customer RIGHT JOIN orders
ON orders.customer_id = customer.customer_id;

-- 21.Write a Query to display Get all customers and all orders (matched or unmatched)SELECT orders.customer_id, customer.name, orders.order_id, orders.order_date
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id

UNION

SELECT orders.customer_id, customer.name, orders.order_id, orders.order_date
FROM customer
RIGHT JOIN orders
ON customer.customer_id = orders.customer_id;

-- 22.Write a Query to Generate all possible combinations of products and categories
SELECT products.product_name,categories.category_name
FROM products CROSS JOIN categories;

-- 23.Write a Query to Find customers who share the same city
SELECT C1.customer_id, C1.name, C1.city
FROM customer C1
JOIN customer C2
ON C1.city = C2.city
AND C1.customer_id <> C2.customer_id;

-- ----------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------
-- SUBQUERIES
-- ------------------------------------
-- 24.Write a Query to Identify all products whose price is higher than the average price of all products.
SELECT products.product_id,products.product_name,products.price
FROM products
WHERE price>( SELECT AVG(price)
            FROM products);

-- 25.Write a Query to Find customers who have placed at least one order.
SELECT customer.name,customer_id
FROM customer
WHERE customer_id IN (SELECT DISTINCT customer_id
                     FROM orders);

COMMIT ;
-- ------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------



