-- Customer Table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);
-- Order Table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
-- Adding Presidents to our Customers
INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(1, 'George', 'Washington', 'gwash@use.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');
INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(2, 'John', 'Adams', 'jadams@usa.gov', '1200 Hancock', 'Quincy', 'MA', '02168');
INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(3, 'Thomas', 'Jefferson', 'tjeff@use.gov', '931 Thomas Jefferson Pkway', 'Charlottesville', 'VA', '02169');
INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(4, 'James', 'Madison', 'jmad@use.gov', '11350 Conway', 'Orange', 'VA', '02169');
INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES(5, 'James', 'Monroe', 'jmonroe@use.gov', '2050 James Monroe Parkway', 'Charlottesville', 'VA', '02169');
-- INSERT info INTO order_ table
INSERT INTO order_(order_id, amount, customer_id)
VALUES(1, 234.56, 1);
INSERT INTO order_(order_id, amount, customer_id)
VALUES(2, 78.50, 3);
INSERT INTO order_(order_id, amount, customer_id)
VALUES(3, 124.00, 2);
INSERT INTO order_(order_id, amount, customer_id)
VALUES(4, 65.50, 3);
INSERT INTO order_(order_id, amount, customer_id)
VALUES(5, 55.50, NULL);
SELECT *
FROM customer;
-- Orders from subquery
SELECT *
FROM order_
WHERE customer_id IN (
	SELECT customer_id
	FROM customer
	WHERE first_name LIKE 'J%'
);
-- ALL 4 Joins for SQL
-- INNER JOIN --
SELECT first_name, last_name, order_date, amount, order_.customer_id, customer.customer_id
FROM customer -- TABLE A
INNER JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id;
-- LEFT JOIN --
SELECT first_name, last_name, order_date, amount
FROM customer -- TABLE A
LEFT JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id;

-- RIGHT join
SELECT first_name, last_name, order_date, amount
FROM customer -- TABLE A
RIGHT JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id;

-- FULL OUTER join
SELECT first_name, last_name, order_date, amount
FROM customer -- TABLE A
FULL JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id;

-- FULL JOIN WHERE INFO is NULL
SELECT first_name, last_name, order_date, amount
FROM order_ --TABLE A
FULL JOIN customer -- TABLE B
ON customer.customer_id = order_.customer_id
WHERE order_date is NULL;


