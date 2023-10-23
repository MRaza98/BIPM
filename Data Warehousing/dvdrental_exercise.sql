-- 1. All information about all actors
SELECT 
	* 
FROM actor a 


-- 2. The titles and descriptions of all films
SELECT 
	title
	, description 
FROM film f 


-- 3. Names of all categories
SELECT 
	name 
FROM category c 


-- 4. List of actors ordered by last name and first name 
SELECT 
	first_name
	, last_name 
FROM actor a 
ORDER BY last_name, first_name 


-- 5. Titles and length of all films with a length of more than 120 min ordered by length FROM highest to lowest
SELECT 
	title
	, length 
FROM film 
WHERE length > 120 
ORDER BY length desc 


-- 6. Titles of all films with a title starting with 'C'
SELECT 
	title 
FROM film 
WHERE title LIKE "C%"


-- 7. Titles of all films that have in the titles somewhere the phrase 'day'
SELECT 
	title 
FROM film 
WHERE title LIKE "%day%"


-- 8. All unique ratings that exist in films
SELECT 
	DISTINCT (rating) 
FROM film


-- rental duration in film table is the length of a rental period, in days 
-- rental rate in the film table is the cost to rent the film for the period specified in the rental_duration column (you have to pay the rental_rate for each rental_duraction)
-- 9. Film titles with their rental duration (the length of the rental period, in days) and the rental rate (the cost to rent the film for the period specified in the rental_duration column) 
SELECT 
	title
	, rental_duration
	, rental_rate 
FROM FILM


-- 10. Film titles and the rental rate per day sorted by this rental rate per day FROM highest to lowest
SELECT 
	title
	, rental_rate / rental_duration AS rental_per_day
FROM film 
ORDER BY 2 DESC

	
-- 11. Find all the addresses where the district is empty or null
SELECT 
	address 
FROM address 
WHERE 
	district = '' OR district IS NULL


-- 12. The total number of films 
SELECT 
	COUNT(DISTINCT film_id) AS num_movies
FROM film


-- 13. The shortest film length
SELECT 
	MIN(length) AS shortest_film_length
FROM film

	
-- 14. How many films have a difference between the film replacement cost and the rental rate greater than 17?
SELECT 
	COUNT(film_id) 
FROM film 
WHERE ABS(replacement_cost - rental_rate) > 17


-- 15. Titles of all Sci-Fi movies
SELECT 
	f.title
	, c.name AS category
FROM film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
WHERE c.name = "Sci-Fi"


-- 16. All films in which William Hackman have played
SELECT
	f.title
	, a.first_name
	, a.last_name 
FROM film f
LEFT JOIN film_actor fa USING (film_id)
LEFT JOIN actor a USING (actor_id)
WHERE first_name = 'WILLIAM' AND last_name = 'HACKMAN'
	

-- 17. Titles and lengths of films that have the longest length among all films
WITH longest AS (

	SELECT
		f.title
		, f.length
		, RANK () OVER (ORDER BY "length" DESC) AS rank
FROM film f) 

SELECT
	title
	, length
FROM longest
WHERE rank = 1

	
-- 18. Titles and length of all films that are shorter than the average length of all films sorted by lenght in ascending order 
WITH avg_length AS (

	SELECT
		title
		, length
		, AVG(length) OVER () AS avg_film_length
	FROM film f )
	
SELECT
	title
	, length
FROM avg_length
WHERE length < avg_film_length
	
-- 19. The number of films per rating
SELECT
	rating
	, COUNT(film_id) AS num_films
FROM film
GROUP BY 1

	
-- 20. The number of films per language
SELECT
	l.name
	, COUNT(film_id) AS num_films
FROM film f 
LEFT JOIN language l USING (language_id)
GROUP BY 1

-- 21. The number of films per category sorted FROM highest to lowest
SELECT
	c.name
	, COUNT(film_id) AS num_films
FROM film f 
LEFT JOIN film_category fc USING (film_id)
LEFT JOIN category c USING (category_id)
GROUP BY 1
ORDER BY 2 DESC


-- 22. Actor id, first name, and last name for all actors who have never appeared in a film rated ‘PG’.

SELECT DISTINCT
	actor_id
	, first_name 
	, last_name
FROM film_actor
JOIN actor USING (actor_id)
WHERE actor_id NOT IN (

	SELECT DISTINCT
		actor_id
	FROM film_actor fa
	JOIN film USING (film_id)
	WHERE rating = 'PG'
	
	)


-- 23. List of actors and the number of films he/she played in ordered by that number from highest to lowest
SELECT
	first_name 
	, last_name 
	, COUNT(film_id) AS num_films
FROM actor a
LEFT JOIN film_actor fa USING (actor_id)
GROUP BY 1, 2
ORDER BY 3 DESC


-- 24. List of all the customers with id, first and last name who have rented more than 3 horror movies
SELECT
	c.customer_id
	, c.first_name
	, c.last_name
	, COUNT(DISTINCT film_id) AS num_horror_movies_rented
FROM rental r
LEFT JOIN inventory i USING (inventory_id)
LEFT JOIN film_category fc USING (film_id)
LEFT JOIN category c2 USING (category_id)
LEFT JOIN customer c USINg (customer_id)
WHERE c2.name = 'Horror'
GROUP BY 1, 2, 3
HAVING COUNT(DISTINCT film_id) > 3


-- 25. How many actors have not acted in any film?
SELECT 
	COUNT(actor_id)
FROM actor a 
WHERE actor_id NOT IN (SELECT actor_id FROM film_actor fa)


-- 26. How many DVDs are out on rent?
SELECT
	COUNT(rental_id)
FROM rental r
WHERE return_date is null


-- 27. Number of rentals per store
SELECT
	store_id
	, COUNT(rental_id)
FROM rental r 
LEFT JOIN staff s USING (staff_id)
GROUP BY 1
	
	
-- 28. All city we have stores in
SELECT 
	city
	, store_id
FROM store s
LEFT JOIN address a USING (address_id)
LEFT JOIN city c USING (city_id)


-- 29. Names of all customers that live in the same country as one of our stores

with store_countries as (SELECT 
	s.store_id
	, s.address_id
	, a.city_id
	, c.country_id
	, co.country
FROM store s
LEFT JOIN address a on s.address_id = a.address_id
LEFT JOIN city c on a.address_id = c.city_id 
LEFT JOIN country co on c.country_id = co.country_id)


SELECT 
	cu.first_name
	, cu.address_id
	, a.city_id
	, c.country_id
	, co.country
FROM customer cu
LEFT JOIN address a on cu.address_id = a.address_id
LEFT JOIN city c on a.address_id = c.city_id 
LEFT JOIN country co on c.country_id = co.country_id
WHERE co.country in 
	(SELECT 
	 country
	FROM store_countries)


	
-- 30. List every actor and their total run time of sci-fi films they have been in.
SELECT 
	fa.actor_id
	, c.name
	, a.first_name || ' ' || a.last_name
	, SUM(f.length)
FROM film_actor fa 
LEFT JOIN film_category fc ON fa.film_id =fc.film_id 
LEFT JOIN category c ON fc.category_id = c.category_id 
LEFT JOIN actor a ON fa.actor_id = a.actor_id
LEFT JOIN film f on fa.film_id = f.film_id
WHERE c.name = "Sci-Fi"
GROUP BY 1, 2, 3


-- 31. What are the most common hours when people pay for a dvd rental? Order the payment hours by the number of payments. 

SELECT DISTINCT
	STRFTIME('%H', rental_date) AS hour
	, COUNT(rental_id) AS frequency
FROM rental r
GROUP BY 1
ORDER BY 2 DESC


-- 32. Longest film rental duration and the customer who rented that film with the title of the film (tipp: not the rental duration in the film table)
SELECT
	r.rental_id
	, r.inventory_id
	, i.film_id
	, f.title
	, c.first_name || ' '|| c.last_name as full_name
	, MAX(JULIANDAY(r.return_date) - JULIANDAY(r.rental_date)) as duration_in_days
FROM rental r
LEFT JOIN inventory i on r.inventory_id = i.inventory_id
LEFT JOIN film f on f.film_id = i.film_id
LEFT JOIN customer c on r.customer_id = c.customer_id

-- 33. All customers who have the same first name

WITH two_names AS (SELECT

	*
	, COUNT() OVER(PARTITION BY first_name) AS name_count
FROM customer c
ORDER BY 2 DESC)

SELECT 
	* 
FROM two_names
WHERE name_count > 1
ORDER BY first_name


-- 34. All films that are available only in one store
SELECT
	
	film_id
	
FROM inventory i 
GROUP BY 1
HAVING COUNT(DISTINCT store_id) = 1

-- 35. All stores with their total revenue
SELECT
	s.store_id
	, SUM(p.amount) as total_amount
FROM store s
LEFT JOIN payment p on s.manager_staff_id = p.staff_id 
GROUP BY 1


-- 36. Create an interesting query of your own that is not already in the assignment. Give, along with the query, the question that the query is answering (as a comment) 
	-- Find the film with highest inventory

WITH inventory_table as (SELECT 
	f.title
	, COUNT(i.inventory_id) AS inventory_count
	, RANK () OVER (ORDER BY count(i.inventory_id) DESC) AS rank_info
FROM film f
LEFT JOIN inventory i USING (film_id)
GROUP BY 1
ORDER BY inventory_count desc)

SELECT 
	title
	, max(inventory_count) as inventory_count
FROM inventory_table
WHERE rank_info = 1
GROUP BY 1
