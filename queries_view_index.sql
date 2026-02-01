
SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT SUM(amount) AS total_revenue FROM payments;

SELECT 
c.name,
o.order_id,
o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT
DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(p.amount) AS revenue
FROM orders o 
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

SELECT
pr.product_name,
SUM(od.quantity) AS total_sold
FROM products pr
JOIN order_details od ON pr.product_id = od.product_id
GROUP BY pr.product_name
ORDER BY total_sold DESC;

SELECT
c.name,
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name
HAVING total_spent > 1400;

SELECT
customer_id,
COUNT(order_id) AS orders_count
FROM orders
GROUP BY customer_id
HAVING orders_count > 1;

SELECT
c.name,
SUM(p.amount) AS total_spent,
CASE
WHEN SUM(p.amount) > 50000 THEN 'Premium'
WHEN SUM(p.amount) BETWEEN 50000 AND 50000 THEN 'Gold'
ELSE 'Regular'
END AS customer_type
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name;

SELECT name FROM customers
WHERE customer_id IN (
SELECT o.customer_id
FROM orders o 
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id
HAVING SUM(p.amount) > (SELECT AVG(amount) FROM payments)
);

CREATE VIEW customer_sales AS SELECT
c.name,
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name;

SELECT * FROM customer_sales;
SHOW INDEX FROM orders;

DROP INDEX idx_order_date ON orders;
DROP INDEX idx_customer_id ON orders;
SHOW INDEX FROM orders;

CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_customer_id ON orders(customer_id);

SELECT
c.name,
SUM(p.amount) AS total_spent,
CASE
WHEN SUM(p.amount) > 50000 THEN 'Premium'
WHEN SUM(p.amount) BETWEEN 50000 AND 50000 THEN 'Gold'
ELSE 'Regular'
END AS customer_type
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name;

SELECT name FROM customers
WHERE customer_id IN (
SELECT o.customer_id
FROM orders o 
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id
HAVING SUM(p.amount) > (SELECT AVG(amount) FROM payments)
);

CREATE VIEW customer_sales AS SELECT
c.name,
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name;
SELECT * FROM customer_sales;


SELECT  pr.product_name,
    SUM(od.quantity * pr.price) AS total_revenue
    FROM order_details od
    JOIN products pr 
	ON od.product_id = pr.product_id
    GROUP BY pr.product_id = pr.product_id
    GROUP BY pr.product_name
    ORDER BY total_revenue DESC;
    
SELECT
    pr.product_name,
    SUM(od.quantity * pr.price) AS total_revenue
    FROM order_details od
    JOIN products pr 
    ON od.product_id = pr.product_id
    GROUP BY pr.product_name
    ORDER BY total_revenue DESC
    LIMIT 3;
