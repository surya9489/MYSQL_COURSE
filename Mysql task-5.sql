CREATE SCHEMA Customer;

USE Customer;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'Surya prakash', 'Surya@gmail.com'),
(2, 'Sherif', 'Sherif@gmail.com'),
(3, 'Charlie', 'Charlie@mail.com'),
(4, 'Lewis', 'Lewis@mail.com'),
(5, 'Dheena', 'Dheena@gmail.com');



INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2025-01-10', 150.00),
(102, 2, '2025-01-12', 220.00),
(103, 3, '2025-01-15', 75.00),
(104, 1, '2025-01-18', 330.00),
(105, 4, '2025-01-20', 500.00);

update orders
set customer_id=5
where order_id=104;

SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount,
    orders.order_date
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id;


SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount,
    orders.order_date
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id;


SELECT * FROM Customer;
