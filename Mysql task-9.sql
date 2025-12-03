use practicedb;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    event_name VARCHAR(100),
    event_date DATE
);

INSERT INTO orders (product_name, quantity, price, event_name, event_date) VALUES
('Apple Watch', 3, 450.00, 'Launch Event', '2025-01-10'),
('Android Phone', 1, 900.00, 'Promo Sale', '2025-02-15'),
('Airpods', 5, 199.00, 'New Stock', '2025-03-01'),
('Laptop', 2, 1200.00, 'Mega Discount', '2025-03-25'),
('Adapter', 4, 150.00, 'Flash Sale', '2025-04-05');

SELECT * FROM orders;

-- 3. Select all orders where quantity > 2

SELECT * 
FROM orders
WHERE quantity > 2;

-- 4. Select orders where price is between 100 and 500

SELECT *
FROM orders
WHERE price BETWEEN 100 AND 500;

-- 5. Fetch orders where product_name starts with 'A'

SELECT *
FROM orders
WHERE product_name LIKE 'A%';

-- 6. Fetch orders sorted by quantity DESC

SELECT *
FROM orders
ORDER BY quantity DESC;

-- 7. Use CONCAT() to combine event_name + event_date

SELECT 
    order_id,
    product_name,
    CONCAT(event_name, ' - ', event_date) AS event_details
FROM orders;