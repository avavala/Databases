-- selects for tables
SELECT * FROM category;
SELECT * FROM film_category;
SELECT * FROM film;
SELECT * FROM language;
SELECT * FROM film_actor WHERE film_id = 98;
SELECT * FROM actor WHERE actor_id = 111;
--INSERT INTO category VALUES (17, 'WSB Akademia', now());
--INSERT INTO category VALUES (18, 'WSB Akademia', now());
SELECT * FROM customer;
SELECT * FROM city;
---- ---- ---- ---- ---- 
SELECT * FROM category ORDER BY name DESC;
SELECT name, last_update FROM category ORDER BY name DESC;
SELECT DISTINCT last_update FROM category ORDER BY last_update DESC;
SELECT * FROM category WHERE name  LIKE '%me%';
SELECT * FROM category WHERE name IN ('Comedy', 'Sci-Fi');
SELECT * FROM category WHERE category_id BETWEEN 10 AND 15;
SELECT * FROM address WHERE address IS NULL;
SELECT * FROM category ORDER BY name DESC FETCH FIRST 5 ROWS ONLY;
SELECT name, count(name) FROM category GROUP BY name;
--- JOIN---
SELECT * FROM city;
SELECT * FROM country;

SELECT * FROM city c JOIN country t ON c.country_id = t.country_id;

SELECT f.title, f.language_id FROM film f;
SELECT l.language_id, l.name FROM language l;

UPDATE film SET language_id = 5 WHERE film_id BETWEEN 1 AND 10;

SELECT f.title, f.language_id , l.language_id, l.name
	FROM film f
	JOIN language l ON f.language_id = l.language_id
	WHERE l.name <> 'English'
	;

SELECT * FROM customer ;
SELECT * FROM address;

SELECT *
	FROM customer c
	RIGHT JOIN address a ON c.address_id = a.address_id;

---------------------------------TASKS---------------------------------

-- 1. Show the first 10 results for actor table
SELECT * FROM actor FETCH FIRST 10 ROWS ONLY;

-- 2. Show films with the letter 'z' in the title of the film
SELECT * FROM film WHERE title LIKE '%z%';

-- 3. Show the most expensive movie rental;
SELECT f.title, sum(p.amount) AS "Payment for the movie"
	FROM payment p
	JOIN rental r ON r.rental_id = p.rental_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON f.film_id = i.film_id
	GROUP BY f.title
	ORDER BY 2 DESC
	FETCH FIRST 1 ROWS ONLY;

-- 4. Show the longest movie
SELECT title, length 
FROM film WHERE length = 185 
ORDER BY length DESC;

-- 5. Show films which premiered after 2000
SELECT title, release_year FROM film
WHERE release_year > 2000;

-- 6. Show films released in 1995-2005
SELECT * FROM film
WHERE release_year BETWEEN 1995 AND 2005;

-- 7. Count the number of records for each table
SELECT COUNT(*) FROM actor;
SELECT COUNT(*) FROM address;
SELECT COUNT(*) FROM city;
SELECT COUNT(*) FROM country;
SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM film_actor;
SELECT COUNT(*) FROM film_category;
SELECT COUNT(*) FROM inventory;
SELECT COUNT(*) FROM payment;
SELECT COUNT(*) FROM rental;
SELECT COUNT(*) FROM staff;
SELECT COUNT(*) FROM store;

-- 8. Show the actor who has starred in the greatest number of films
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f_a.film_id) AS "Numeber of movie per actor"
FROM actor a
	JOIN film_actor f_a ON a.actor_id = f_a.actor_id
	GROUP BY a.actor_id
	ORDER BY 4 DESC
	FETCH FIRST 1 ROWS ONLY;

-- 9. Show the number of movies in each category and sort by the highest number
SELECT c.category_id, c.name, COUNT(f_c.film_id) AS "Numeber of movies per category"
FROM category c
	JOIN film_category f_c ON c.category_id = f_c.category_id
	GROUP BY c.category_id
	ORDER BY 3 DESC;
	
-- 10. Show the number of customers for each city and sort by the highest number;
SELECT city.city, COUNT(c.customer_id)
FROM city
	JOIN address a ON a.city_id = city.city_id
	JOIN store s ON s.address_id = a.address_id
	JOIN customer c ON c.store_id = s.store_id
	GROUP BY city.city
	
-- 11. Show how many movies there were in each year
SELECT release_year, COUNT(film_id) AS "Number of movies"
FROM film
GROUP BY release_year;

-- 12. Show the movie that earned the most in renting;
SELECT f.title, sum(p.amount) AS "earning for the movie"
	FROM film f
	JOIN inventory i ON i.film_id = f.film_id
	JOIN rental r ON r.inventory_id = i.inventory_id
	JOIN payment p ON p.rental_id = r.rental_id
	GROUP BY f.title
	ORDER BY 2 DESC
	FETCH FIRST 1 ROWS ONLY;
	
-- 13. Show the category that earned the most
SELECT c.name, sum(p.amount) AS "earning for category"
	FROM payment p
	JOIN rental r ON r.rental_id = p.rental_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film_category f_c ON f_c.film_id = i.film_id
	JOIN category c on c.category_id = f_c.category_id
	GROUP BY c.name
	ORDER BY 2 DESC
	FETCH FIRST 1 ROWS ONLY;

-- 14. Show the number of movies for each language
SELECT l.name, l.language_id, COUNT(f.film_id) AS "number of movies"
FROM film f
	JOIN language l ON l.language_id = f.language_id
	GROUP BY l.language_id

-- 15. Show the name and surname of the actors who starred in various film categories
SELECT a.first_name, a.last_name, COUNT(DISTINCT(f_c.category_id)) AS "Number of categories"
FROM actor a
	JOIN film_actor f_a ON f_a.actor_id = a.actor_id
	JOIN film_category f_c ON f_c.film_id = f_a.film_id
	GROUP BY a.first_name, a.last_name
	ORDER BY 3 DESC
	
--- 16. Show the name and surname of the actors who starred in the top 10 highest-grossing films
SELECT a.first_name, a.last_name, f.title, sum(p.amount) AS "gross"
FROM actor a
	JOIN film_actor f_a ON f_a.actor_id = a.actor_id
	JOIN inventory i ON i.film_id = f_a.film_id
	JOIN film f ON f.film_id = f_a.film_id
	JOIN rental r ON r.inventory_id = i.inventory_id
	JOIN payment p ON p.rental_id = r.rental_id
	GROUP BY a.first_name, a.last_name, f.title
	ORDER BY 4 DESC
	
--- 17. Show the clients who rented movies the most
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS "Number of rented movies"
FROM customer c
	JOIN rental r ON r.customer_id = c.customer_id
	GROUP BY c.first_name, c.last_name
	ORDER BY 3 DESC;

-- 18. Show the customers who spent the most on movie rentals;
SELECT c.first_name, c.last_name, sum(p.amount) AS "amount spent for renting"
FROM customer c
	JOIN rental r ON r.customer_id = c.customer_id
	JOIN payment p ON p.rental_id = r.rental_id
	GROUP BY c.first_name, c.last_name
	ORDER BY 3 DESC
	FETCH FIRST 10 ROWS ONLY;
	
--19. Show the cities where movies were most often rented
SELECT city.city, COUNT(r.rental_id) "number of rentals"
	FROM city
	JOIN address a ON a.city_id = city.city_id
	JOIN store s ON s.address_id = a.address_id
	JOIN staff  ON staff.store_id = s.store_id
	JOIN rental r ON r.staff_id = staff.staff_id
	GROUP BY city.city;

--20. Show the yearbooks with the highest amount for renting movies

UPDATE rental SET rental_date = DATE_TRUNC('year', rental_date) ---updating the table to get the year from rental date---

SELECT r.rental_date, SUM(p.amount) AS "amount for renting"
FROM rental r
	JOIN payment p ON p.rental_id = r.rental_id
	GROUP BY rental_date
	ORDER BY 2 DESC








