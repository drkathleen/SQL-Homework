#Question 1 a
Use sakila;
SELECT first_name, last_name FROM actor;

#Question 1b
SELECT CONCAT(first_name,' ', last_name) AS 'Actor Name' From Actor

#Question 2a
USE sakila;
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = "Joe" 

#Question 2b
USE sakila;
SELECT last_name FROM actor 
WHERE last_name Like '%GEN%'

#Question 2c
USE sakila;
SELECT first_name, last_name From actor
WHERE last_name Like '%LI%'
ORDER BY last_name, first_name;

#Question 2D
USE sakila; 
SELECT country_id, country FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#Question 3a & b
USE sakila;
ALTER TABLE actor
ADD COLUMN description BLOB; 

ALTER TABLE actor
DROP COLUMN description;

#Question 4a
USE sakila;
SELECT last_name, COUNT(last_name) as "Last Name Count"
FROM ACTOR
GROUP BY last_name;

#Question 4b
USE sakila;
SELECT last_name, COUNT(last_name) as "Last Name Count"
FROM ACTOR
GROUP BY last_name
HAVING COUNT(last_name) >=2;

#Question 4c
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' and last_name = 'WILLIAMS';

#Question 4d
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO' and last_name = 'WILLIAMS';

#Question 5a
DESC address;
DROP TABLE IF EXISTS address;
CREATE TABLE address (
address_id SMALLINT(5) AUTO_INCREMENT NOT NULL,
address VARCHAR(50),
address2 VARCHAR(50) ,
district VARCHAR(20),
city_id SMALLINT(5),
postal_code VARCHAR(10),
phone VARCHAR(20),
location GEOMETRY,
last_update TIMESTAMP,
PRIMARY KEY(address_id)
);

#Question 6a
SELECT first_name, last_name, address
FROM staff s 
INNER JOIN address a
ON s.address_id = a.address_id;

#Question 6b
SELECT first_name, last_name, SUM(amount)
from staff s
INNER JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id
ORDER by last_name ASC;

#Question 6c
SELECT title, COUNT(actor_id) 
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

#Question 6d
SELECT title, COUNT(inventory_id)
FROM film f
INNER JOIN inventory i
on f.film_id = i.film_id
WHERE title = "Hunchback Impossible"

#Question 6e
SELECT last_name, first_name, SUM(amount)
FROM payment p
INNER JOIN customer c
on p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;

#Question 7a
USE Sakila;
SELECT title from film
WHERE language_id in
	(SELECT language_id
	FROM language
    WHERE name = "English")
AND (title LIKE "K%") OR (title LIKE "Q%");

#Question 7b
USE Sakila;
SELECT last_name, first_name
FROM actor
WHERE actor_id in	
	(SELECT actor_id FROM film_actor
	WHERE film_id in
		(SELECT film_id FROM film
        WHERE title = "Alone Trip"));


#Question 7c
USE Sakila;
SELECT country, last_name, first_name, email
FROM country c
LEFT JOIN customer ct
ON c.country_id  =ct.customer_id
WHERE country = 'Canada';

#Question 7d
USE Sakila;
SELECT title, category
FROM film_list
WHERE category = 'Family';

#Question 7e
USE Sakila;
SELECT title, rental_rate, SUM(rental_rate)
FROM film
GROUP BY title
ORDER BY rental_rate DESC;

#Question 7f
SELECT s.store_id, a.address, cy.city, co.country, SUM(p.amount) AS total_revenue
FROM store s
INNER JOIN address a
    ON s.address_id = a.address_id
INNER JOIN customer c
    ON s.store_id=c.store_id
INNER JOIN payment p
    ON p.customer_id = c.customer_id
INNER JOIN city cy
    ON cy.city_id = a.city_id
INNER JOIN country co
    ON co.country_id = cy.country_id
GROUP BY s.store_id;

#Question 7g
USE Sakila;
SELECT s.store_id, a.address, cy.city, co.country
FROM store AS s
INNER JOIN address AS a
    ON s.address_id = a.address_id
INNER JOIN city AS cy
    ON cy.city_id = a.city_id
INNER JOIN country AS co
    ON co.country_id = cy.country_id;

#Question 7h
USE Sakila;
SELECT c.name, SUM(p.amount) AS gross_revenue
FROM category AS c
INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
INNER JOIN inventory AS i
    ON fc.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p
    ON r.rental_id = p.rental_id
GROUP BY name
ORDER BY gross_revenue DESC
LIMIT 5;


#Question 8a
USE Sakila;
CREATE VIEW top_five_grossing_revenue_genres AS
SELECT c.name, SUM(p.amount) AS gross_revenue
FROM category AS c
INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
INNER JOIN inventory AS i
    ON fc.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p
    ON r.rental_id = p.rental_id
GROUP BY name
ORDER BY gross_revenue DESC
LIMIT 5;

#Question 8b
SELECT * FROM top_five_grossing_revenue_genres;

#Question 8c
DROP VIEW top_five_grossing_revenues_genres;



