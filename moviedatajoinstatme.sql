SELECT *
FROM film;

SELECT *
FROM actor;

SELECT *
FROM film_actor;


SELECT title, release_year, actor.actor_id, first_name, last_name
FROM film
FULL JOIN film_actor
ON film.film_id = film_actor.film_id
FULL JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE first_name LIKE 'J__%';
