USE sakila;

SHOW TABLES;

SELECT * FROM actor;

SELECT last_name FROM actor WHERE first_name = "John";

SELECT * FROM actor WHERE last_name = "Neeson";

SELECT * FROM actor WHERE actor_id % 10 = 0;

SELECT description FROM film WHERE film_id = 100;

SELECT * FROM film WHERE rating = "R";

SELECT * FROM film WHERE rating != "R";

SELECT title, length FROM film GROUP BY length ASC LIMIT 10;

SELECT MAX(length), title FROM film;

SHOW TABLES;

SELECT title FROM film WHERE special_features LIKE "Deleted Scenes";

SELECT * FROM actor;

SELECT DISTINCT last_name FROM actor GROUP BY last_name DESC;
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1;

SELECT first_name, last_name FROM actor;


