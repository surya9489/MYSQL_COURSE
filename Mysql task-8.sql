CREATE DATABASE norm_demo;
USE norm_demo;

CREATE TABLE denorm_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    product1 VARCHAR(100), qty1 INT, price1 DECIMAL(10,2),
    product2 VARCHAR(100), qty2 INT, price2 DECIMAL(10,2),
    product3 VARCHAR(100), qty3 INT, price3 DECIMAL(10,2)
) ENGINE=InnoDB;

INSERT INTO denorm_orders VALUES
(1, 'Arun', '2025-11-01', 'Laptop', 1, 55000.00, 'Keyboard', 1, 800.00, NULL, NULL, NULL),
(2, 'Bala', '2025-11-02', 'Mobile Phone', 2, 15000.00, 'Headphones', 1, 1200.00, 'Keyboard', 1, 800.00);

SELECT * FROM denorm_orders;

-- 1.Normalize to 2NF

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) UNIQUE,
    unit_price DECIMAL(10,2)
) ENGINE=InnoDB;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE
) ENGINE=InnoDB;

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    line_price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

INSERT INTO products (product_name, unit_price) VALUES
('Laptop', 55000.00),
('Keyboard', 800.00),
('Mobile Phone', 15000.00),
('Headphones', 1200.00);

INSERT INTO orders (order_id, customer_name, order_date) VALUES
(1, 'Arun', '2025-11-01'),
(2, 'Bala', '2025-11-02');

INSERT INTO order_items (order_id, product_id, quantity, line_price) VALUES
(1, (SELECT product_id FROM products WHERE product_name='Laptop'), 1, 55000.00),
(1, (SELECT product_id FROM products WHERE product_name='Keyboard'), 1, 800.00);

INSERT INTO order_items (order_id, product_id, quantity, line_price) VALUES
(2, (SELECT product_id FROM products WHERE product_name='Mobile Phone'), 2, 30000.00),
(2, (SELECT product_id FROM products WHERE product_name='Headphones'), 1, 1200.00),
(2, (SELECT product_id FROM products WHERE product_name='Keyboard'), 1, 800.00);

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

-- 2.3NF Example 

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
) ENGINE=InnoDB;

INSERT INTO departments (dept_name) VALUES ('IT'), ('HR'), ('Finance');
INSERT INTO employees (emp_name, dept_id, salary) VALUES
('Asha', (SELECT dept_id FROM departments WHERE dept_name='IT'), 45000.00),
('Baskar', (SELECT dept_id FROM departments WHERE dept_name='HR'), 28000.00),
('Chitra', (SELECT dept_id FROM departments WHERE dept_name='IT'), 32000.00),
('Deepak', (SELECT dept_id FROM departments WHERE dept_name='Finance'), 50000.00);

SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employees e
JOIN departments d USING (dept_id);

-- 3) Find the AVG() order price.

SELECT AVG(order_total) AS avg_order_price
FROM (
  SELECT oi.order_id, SUM(oi.line_price) AS order_total
  FROM order_items oi
  GROUP BY oi.order_id
) AS order_totals;

-- 4.Group orders by product_name and show total sales.
SELECT
  p.product_name,
  SUM(oi.line_price) AS total_sales,
  SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;

SELECT
  o.order_id,
  o.customer_name,
  SUM(oi.line_price) AS order_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_name
ORDER BY o.order_id;