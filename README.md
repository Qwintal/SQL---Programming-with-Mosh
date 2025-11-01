# SQL Tutorial Repository

This repository contains SQL practice exercises and queries covering fundamental concepts. All examples use the `sql_store` database and are designed for learning SQL basics.

## 📚 Topics Covered

- SELECT statements and data retrieval
- WHERE clauses with multiple conditions
- Filtering with IN, BETWEEN, and LIKE operators
- Regular expressions (REGEXP) for pattern matching
- Handling NULL values
- Sorting with ORDER BY
- Limiting and offsetting results
- INNER JOIN for combining tables
- Arithmetic operations and calculated columns

## 🗂️ Database Schema

This tutorial uses the **sql_store** database with tables including:
- `customers` - Customer information
- `orders` - Order records
- `order_items` - Individual items in orders
- `products` - Product details

## 📝 Query Examples

### Basic SELECT

```sql
SELECT * 
FROM customers;
```
*Retrieves all columns and rows from the customers table.*

---

### WHERE Clause with Conditions

```sql
SELECT * 
FROM customers 
WHERE points > 3000;
```
*Finds customers with more than 3000 points.*

```sql
SELECT * 
FROM orders
WHERE order_date >= "2019-01-01";
```
*Retrieves orders placed on or after January 1, 2019.*

---

### Multiple Conditions (AND/OR)

```sql
SELECT * 
FROM order_items
WHERE order_id = 6 AND (unit_price * quantity) > 30;
```
*Filters order items where the total price (quantity × unit_price) exceeds 30.*

---

### IN Operator

```sql
SELECT *
FROM customers
WHERE state IN ("VA","FL","GA");
```
*Gets customers from Virginia, Florida, or Georgia.*

```sql
SELECT *
FROM customers
WHERE state NOT IN ("VA","FL","GA");
```
*Gets customers NOT from those three states.*

---

### BETWEEN Operator

```sql
SELECT * 
FROM customers
WHERE birth_date BETWEEN "1990-01-01" AND "2000-01-01";
```
*Finds customers born between 1990 and 2000.*

---

### LIKE Operator (Pattern Matching)

```sql
SELECT *
FROM customers
WHERE last_name LIKE '%y';
```
*Finds customers whose last name ends with 'y'. Use % for multiple characters and _ for a single character.*

---

### REGEXP (Regular Expressions)

```sql
SELECT *
FROM customers
WHERE last_name REGEXP "[a-g]e";
```
*Finds last names containing letters a-g followed by 'e'.*

**Common REGEXP patterns:**
- `^` - Beginning of string
- `$` - End of string
- `|` - Multiple alternatives
- `[a-g]` - Character range
- `[abcd]` - Specific characters

---

### NULL Values

```sql
SELECT *
FROM customers
WHERE phone IS NULL;
```
*Retrieves customers with no phone number on record.*

---

### ORDER BY (Sorting)

```sql
SELECT * 
FROM customers
ORDER BY first_name;
```
*Sorts customers alphabetically by first name.*

```sql
SELECT *
FROM customers
ORDER BY state DESC, first_name;
```
*Sorts by state in descending order, then by first name in ascending order.*

---

### LIMIT and OFFSET

```sql
SELECT * 
FROM customers
LIMIT 3;
```
*Returns only the first 3 rows.*

```sql
SELECT *
FROM customers
LIMIT 6,3;
```
*Skips the first 6 rows and returns the next 3 (pagination).*

```sql
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;
```
*Gets the top 3 customers by points.*

---

### Calculated Columns

```sql
SELECT 
    first_name, 
    last_name, 
    points, 
    (points * 100) + 10 AS discount
FROM customers;
```
*Calculates a discount value and aliases it as 'discount'.*

```sql
SELECT 
    name,
    unit_price,
    (unit_price * 1.1) AS "New Price"
FROM products;
```
*Calculates a 10% price increase for all products.*

---

### DISTINCT Values

```sql
SELECT DISTINCT state
FROM customers;
```
*Returns unique states without duplicates.*

---

### INNER JOIN

```sql
SELECT order_id, orders.customer_id, first_name, last_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
```
*Combines order data with customer names based on the customer_id.*

```sql
SELECT *
FROM order_items
INNER JOIN products ON order_items.product_id = products.product_id;
```
*Joins order items with product information.*

---

## 🎯 Practice Exercises

The code includes several exercises that demonstrate practical applications:

1. Calculate new prices for products with a 10% markup
2. Find orders from specific dates
3. Filter items with calculated totals exceeding a threshold
4. Retrieve top customers by points
5. Join multiple tables to get comprehensive data

## 🔗 Resources

- [Programming with Mosh](https://www.youtube.com/watch?v=7S_tz1z_5bA&t=6216s)
