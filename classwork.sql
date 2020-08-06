-- List all customers who live in Texas? Use Joins
SELECT customer.last_name, customer.first_name
FROM customer
INNER JOIN address
ON address.district = 'Texas';

-- Get all payments above 6.99 with customers full name
SELECT customer.last_name, customer.first_name, payment.amount
FROM customer, payment
WHERE payment.amount > '6.99'
ORDER BY payment.amount ASC;

-- Show all customers names who have made payments over 175 - Use subqueries
SELECT customer.last_name, customer.first_name
FROM customer, payment 
WHERE payment.amount IN (
SELECT payment.amount 
FROM payment
WHERE payment.amount > '175');

-- List all customers that live in Nepal - use city_table

SELECT * 
from customer, city
WHERE city.city = 'Nepal';

-- Which staff memeber had the most transactions?
SELECT staff.last_name, MAX(amount)
FROM staff, payment
WHERE staff.staff_id=payment.staff_id 
AND payment.amount IS NOT NULL
GROUP BY  staff.last_name
ORDER BY staff.last_name;

-- How many movies for each rating are there?
SELECT COUNT(rating), rating, language_id
FROM film;

-- Show all customers who have made a single payment above 6.99 - Subqueries

-- How many free rentals did our stores give away?
