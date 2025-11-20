CREATE DATABASE Employee_details;

USE Employee_details;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) DEFAULT 30000,
    email VARCHAR(150),
    CONSTRAINT unique_employee_email UNIQUE (email)
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    unit_price DECIMAL(10,2),
    stock INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(150)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO employees (name, salary, email) VALUES
('Asha', 45000.00, 'asha@example.com'),
('Baskar', 28000.00, 'baskar@example.com'),
('Chitra', 32000.00, 'chitra@example.com'),
('Deepak', 50000.00, 'deepak@example.com'),
('Elango', 30000.00, 'elango@example.com');

INSERT INTO products (id, name, unit_price, stock) VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Mobile Phone', 15000.00, 25),
(3, 'Headphones', 1200.00, 50),
(4, 'Keyboard', 800.00, 30),
(5, 'Smart Watch', 7000.00, 15);

INSERT INTO customers (customer_id, name, email) VALUES
(1, 'Arun', 'arun@example.com'),
(2, 'Bala', 'bala@example.com'),
(3, 'Chitra', 'chitra.c@example.com'),
(4, 'Deepak', 'deepak.d@example.com'),
(5, 'Elango', 'elango.e@example.com');

INSERT INTO orders (order_id, customer_id, product_id, quantity, price, order_date) VALUES
(1, 1, 1, 1, 55000.00, '2025-11-01'),
(2, 1, 4, 2, 1600.00,  '2025-11-02'),
(3, 2, 2, 1, 15000.00, '2025-11-03'),
(4, 4, 3, 3, 3600.00,  '2025-11-04'),
(5, 5, 5, 1, 7000.00,  '2025-11-05');


SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT *
FROM products
WHERE unit_price > (SELECT MIN(price) FROM orders);

SELECT *
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);

SELECT
  c.customer_id,
  c.name,
  (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;

SELECT
  CASE WHEN EXISTS (
    SELECT 1 FROM products p WHERE p.name = 'Laptop'
  ) THEN 'Exists' ELSE 'Not exists' END AS laptop_exists;