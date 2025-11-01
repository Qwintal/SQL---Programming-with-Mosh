-- Selection Database
USE sql_store;
-- Select 
SELECT * 
FROM customers;

-- Where and order by
SELECT first_name
FROM customers
WHERE customer_id = 1
ORDER BY first_name;

-- How to change arithmetic operations orders
select 
	first_name, 
	last_name, 
    points, 
    (points * 100) + 10 AS discount
from customers;

-- How to get unique values
SELECT DISTINCT state
FROM customers;

-- Exercise
SELECT * FROM products;

SELECT 
	name,
	unit_price,
    (unit_price * 1.1) AS "New Price"
FROM products;

-- Where clause in detial 
-- Comparison operator
SELECT * 
FROM customers 
WHERE points > 3000;

-- Exercise
SELECT * 
FROM orders;

SELECT * 
FROM orders
WHERE order_date >= "2019-01-01";

-- Exercise
SELECT * 
FROM order_items
WHERE order_id = 6 AND (unit_price * quantity) > 30;

-- IN
SELECT *
FROM Customers
Where state IN ("VA","FL","GA");

-- NOT IN
SELECT *
FROM Customers
WHERE state NOT IN ("VA","FL","GA");

-- Exercise
SELECT * 
FROM products;

SELECT * 
FROM products
WHERE quantity_in_stock IN ("49","38","72");

-- Between
SELECT * 
FROM customers
WHERE birth_date BETWEEN "1990-01-01" AND "2000-01-01";

-- like
SELECT *
FROM customers
WHERE last_name LIKE '%y';
-- % any number of characters
-- _ single character 
-- NOT LIKE to get opposite values

-- Exericse
SELECT * 
FROM customers
WHERE address LIKE "%trail%" OR "%Avenue%";
-- WHERE phone LIKE "%9";

-- REGEXP
SELECT *
FROM customers
-- WHERE last_name REGEXP "field$|mac|rose";
-- WHERE last_name REGEXP "[gim]e";
WHERE last_name REGEXP "[a-g]e";
-- ^ beginning
-- $ end
-- | add multile entries
-- [abcd]
-- [a-d] range

-- Exercise
SELECT * 
FROM customers
-- Where first_name REGEXP "elka|ambur";
-- WHERE last_name REGEXP "ey$|ON$";
-- WHERE last_name REGEXP "^MY|SE";
WHERE last_name REGEXP "b[RU]";

-- NULL
SELECT *
FROM customers
WHERE phone IS NULL;

-- ORDER BY
Select * 
from customers
order by first_name;

select * 
from customers
order by first_name desc;

select *
from customers
order by state desc, first_name;

-- Exercise
select *, quantity * unit_price AS total_price
from order_items
where order_id = 2
order by total_price desc;

-- LIMIT clause
select * 
from customers
limit 3;

-- offset
select *
from customers
limit 6,3;
-- skip 6, show next 3 only

-- exercise
select *
from customers
order by points desc limit 3;


-- Inner joins
SELECT order_id, orders.customer_id, first_name, last_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

-- Exercise
SELECT *
FROM order_items
INNER JOIN products ON order_items.product_id = products.productid;

