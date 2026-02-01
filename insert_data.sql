INSERT INTO customers (customer_id, name, email, city) VALUES
 (1, 'Arun', 'arun@gmail.com', 'Chennai'),
 (2, 'Priya', 'priya@gmail.com', 'Bangalore'),
 (3, 'Raghul', 'raghul@gmail.com', 'Mumbai');
 
 UPDATE customers
SET signup_date = '2024-01-10'
WHERE customer_id = 1;

UPDATE customers
SET signup_date = '2024-02-05'
WHERE customer_id = 2;

UPDATE customers
SET signup_date = '2024-03-15'
WHERE customer_id = 3;
SELECT * FROM customers;

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile','Electronics', 20000),
(103, 'Headphones', 'Accessories', 1500);
SELECT * FROM products;

INSERT INTO orders (customer_id, order_date, order_status) VALUES
(1, '2024-02-01', 'Delivered'),
(3, '2024-02-10', 'Shipped'),
(3, '2024-03-05', 'Pending');
SELECT * FROM orders;

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity) VALUES
(1, 1, 101, 1),
(2, 2, 102, 2),
(3, 3, 103, 3);
SELECT * FROM order_details;
SELECT * FROM payments;

INSERT INTO payments (order_id, payment_mode, payment_date, amount) VALUES
(1, 'UPI', '2024-01,10', 1500),
(2, 'Credit', '2024-01-12', 2500),
(3, 'Cash', '2024-01-15', 1200);
SHOW TABLES;
INSERT INTO customers VALUES(4, 'Keerthi', 'keerthi@gmail.com', 'Dubai', '2024-03-20');
INSERT INTO customers VALUES(5, 'Harshini', 'harshi@gmail.com', 'Hosur', '2024-07-25');

INSERT INTO products VALUES (104, 'Gadgets', 'Electronics', 2300);
INSERT INTO products VALUES (105, 'Projector', 'Electronics', 4300);
SELECT * FROM orders;

ALTER TABLE order_details
MODIFY order_detail_id INT AUTO_INCREMENT;

INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1,  101, 1),
(2,  102, 2),
(3,  103, 3);
SELECT * FROM order_details;

INSERT INTO payments (order_id, payment_mode, payment_date, amount) VALUES
(1, 'UPI', '2024-01-10', 1500),
(2, 'Credit', '2024-01-12', 2500),
(3, 'Cash', '2024-01-15', 1200);

SHOW TABLES;
DESC payments;
ALTER TABLE payments
MODIFY payment_id INT AUTO_INCREMENT;
INSERT INTO payments (order_id, payment_mode, payment_date, amount)
VALUES
(4, 'UPI', '2024-01-17', 1700),
(5, 'Cash', '2024-01-25', 2000);
SELECT * FROM payments;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT SUM(amount) AS total_revenue FROM payments;
