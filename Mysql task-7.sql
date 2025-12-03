USE practicedb;
DROP TABLE IF EXISTS employees2;

CREATE TABLE employees2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees2 (name, department, salary) VALUES
('Arun', 'IT', 50000),
('Bala', 'HR', 35000),
('Chitra', 'IT', 45000),
('Deepak', 'Finance', 60000);

DROP VIEW IF EXISTS it_employees;
CREATE VIEW it_employees AS
SELECT name, salary
FROM employees2
WHERE department = 'IT';

SELECT * FROM it_employees;

UPDATE it_employees
SET salary = 48000
WHERE id = 3;

SELECT * FROM employees2;