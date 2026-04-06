#11
/*Show order_number, order_date, delivery_date, and client_id for all orders whose delivery_date is
between October 15, 2025 and today's date (inclusive). Use CURDATE() for today.*/
SELECT order_number, order_date, delivery_date, client_id
FROM orders
WHERE delivery_date BETWEEN '2025-10-15' AND CURDATE();

#12
/*Show order_number, order_date, client_id, and status for all orders placed in the current month
(the month and year must match today's date). Use YEAR() and MONTH() together with
CURDATE().*/
SELECT order_number, order_date, status, client_id
FROM orders
WHERE YEAR(order_date) = YEAR(CURDATE()) AND MONTH(order_date) = MONTH(CURDATE());

#13
/*Show the product_code, product_name, unit_price, and the category_name for every product. Join
Products with Categories. Sort by category_name ascending.*/
SELECT P.product_code, P.product_name, P.unit_price, C.category_name
FROM products P
JOIN categories C ON P.category_code = C.category_code
ORDER BY C.category_name ASC;

#14
/*List all order details together with the product_name and unit_price from Products. Display
order_number, product_name, quantity, and unit_price. Join Order_Details with Products.*/
SELECT P.product_code, P.product_name, P.unit_price, C.category_name
FROM products P
JOIN categories C ON P.category_code = C.category_code
ORDER BY C.category_name ASC;

#15
/*Show the order_number, order_date, client_name, and status for all orders whose status is
'Delivered'. Join Orders with Clients.*/
SELECT O.order_number, O.order_date, C.client_name, O.status
FROM orders O
JOIN clients C ON O.client_id = C.client_id
WHERE status = 'Delivered';

#16
/*For each order, display the order_number, order_date, employee full name (from Employees), and
the client_name. Join Orders, Clients and Employees (using the EGN column). Show only orders
from the current year (with functions).*/
SELECT O.order_number, O.order_date, E.employee_name, C.client_name
FROM orders O
JOIN employees E ON O.EGN = E.EGN
JOIN clients C ON O.client_id = C.client_id
WHERE YEAR(order_date) = YEAR(CURDATE());

#17
/*List all employees who have NOT processed any order. Display employee_name and city. Use a
LEFT JOIN between Employees and Orders (on EGN) and filter for employees with no matching
order.*/
SELECT E.*, O.order_number
FROM employees E
LEFT JOIN orders O ON E.EGN = O.EGN
WHERE O.EGN IS NULL;

#18
/*List product_name and product_code of the products that have not been sold yet. (Use a LEFT or
RIGHT JOIN between Order_Details and Products). To do this, add a new product under table
Products – for example "Strawberries".*/
INSERT INTO products (product_name, product_code, unit_price)
VALUES ('Strawberries', 21, 9.99);

SELECT P.product_name, P.product_code
FROM products P
LEFT JOIN order_details O ON P.product_code = O.product_code
WHERE O.product_code IS NULL;