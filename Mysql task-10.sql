use practicedb;

DROP TABLE IF EXISTS events;

CREATE TABLE events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100),
    event_date DATE
);

INSERT INTO events (event_name, event_date) VALUES
('Music Festival', '2025-01-15'),
('Tech Conference', '2025-03-20'),
('Sports Meet', '2025-05-10'),
('Food Carnival', '2025-07-05'),
('Art Exhibition', '2025-09-12');

SELECT * FROM events;

-- 3. Use NOW() to display current date & time

SELECT NOW() AS current_datetime;

-- 4. Format event_date using DATE_FORMAT()

SELECT 
    event_name,
    event_date,
    DATE_FORMAT(event_date, '%M %d, %Y') AS formatted_date
FROM events;

-- 5. Extract YEAR and MONTH from event_date

SELECT
    event_name,
    event_date,
    YEAR(event_date) AS event_year,
    MONTH(event_date) AS event_month
FROM events;

-- 6. Use CONCAT() to combine event_name and event_date

SELECT
    id,
    CONCAT(event_name, ' - ', event_date) AS event_details
FROM events;