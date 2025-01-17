USE sakila;
-- Use the sakila database to do the following tasks:
-- 1. Display all available tables in the Sakila database.
-- 2. Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * from film;
SELECT * from customer;

-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
SELECT title
FROM film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT title,name AS language
FROM film
LEFT JOIN sakila.language ON film.language_id = language.language_id;

-- 3.3 List of first names of all employees from the staff table
SELECT first_name
FROM staff;

-- 4. Retrieve unique release years.
SELECT DISTINCT release_year
FROM film;

-- 5. Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
SELECT count(distinct store_id)
FROM store;

-- 5.2 Determine the number of employees that the company has.
SELECT count(distinct staff_id)
FROM staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(distinct(inventory.inventory_id)) AS total_inventory,
       COUNT(DISTINCT rental.inventory_id) AS total_rented
FROM inventory
LEFT JOIN rental ON rental.inventory_id=inventory.inventory_id;

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT distinct(last_name)
FROM actor;

-- 6. Retrieve the 10 longest films.
select *
FROM film
ORDER BY length DESC
LIMIT 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT *
FROM actor
WHERE last_name = "SCARLETT";

-- BONUS:
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- Hint: use LIKE operator. More information here.
select *
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content
select count(*)
from film
where special_features like '%Behind the Scenes%';

