-- List all customers who live in Texas? Use Joins
SELECT customer.last_name, customer.first_name, address.district
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE address.district = 'Texas';

-- Get all payments above 6.99 with customers full name
SELECT last_name, first_name, amount
FROM customer
JOIN payment
ON customer.customer_id > '6.99'
ORDER BY payment.amount ASC;

-- Show all customers names who have made payments over 175 - Use subqueries
SELECT last_name, first_name, customer_id
FROM customer
WHERE customer_id IN (
SELECT customer_id 
FROM payment
HAVING COUNT amount > '175');

-- List all customers that live in Nepal - use city_table
SELECT customer.last_name, customer.first_name, customer.email, country.country
FROM customer 
JOIN address AS ad
ON customer.address_id = as.address_id
JOIN city as ci
ON address.city_id = city.city_id
JOIN country 
ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

-- Which staff memeber had the most transactions?
SELECT *
FROM staff
WHERE staff_id IN (
	SELECT staff_id
	FROM payment
	GROUP BY staff_id
	ORDER BY COUNT(payment_id) ASC
);

-- How many movies for each rating are there?
SELECT COUNT(rating), rating
FROM film
ORDER BY rating;

-- Show all customers who have made a single payment above 6.99 - Subqueries
SELECT last_name, first_name, customer_id
FROM customer
WHERE customer_id IN (
SELECT customer_id
FROM payment
WHERE amount > 6.99
GROUP by customer_id
HAVING COUNT(customer_id) 1
);

-- How many free rentals did our stores give away?
SELECT COUNT(rental_id)
FROM payment
WHERE amount = 0;
