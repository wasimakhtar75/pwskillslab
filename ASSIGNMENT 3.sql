Use mavenmovies;

-- Q-1. **Join Practice:**
-- Write a query to display the customer's first name, last name, email, and city they live in.
select c.customer_id, c.first_name, c.last_name, c.email, city.city from customer c inner join address a 
on c.address_id = a.address_id
inner join city on city.city_id = a.city_id;


-- Q-2. **Subquery Practice (Single Row):**
-- Retrieve the film title, description, and release year for the film that has the longest duration.
select title, description, release_year,length from film where length = (select max(length) from film) ;


-- Q-3. **Join Practice (Multiple Joins):**
-- List the customer name, rental date, and film title for each rental made. Include customers
-- who have never rented a film.
select concat(c.first_name,'  ',c.last_name)as customer_names,r.rental_date,f.title  from customer c inner join
rental r on c.customer_id = r.customer_id
inner join inventory i on i.inventory_id = r.inventory_id
inner join film f on f.film_id = i.film_id;


-- Q-4. **Subquery Practice (Multiple Rows):**
-- Find the number of actors for each film. Display the film title and the number of actors for each films.
select f.title, count(actor_id) as actor_count from film f 
left join film_actor fa on f.film_id = fa.film_id
group by f.title;


-- Q-5. **Join Practice (Using Aliases):**
-- Display the first name, last name, and email of customers along with the rental date, film title,
-- and rental return date.
select concat(c.first_name,'  ',c.last_name) as customers_names, c.email, r.rental_date,f.title, r.return_date from customer c 
join rental r on c.customer_id = r.rental_id 
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id order by title;


-- Q-6. **Subquery Practice (Conditional):**
-- Retrieve the film titles that are rented by customers whose email domain ends with '.net'.
select * from film;
select * from customer;
select * from inventory;
select title from film where film_id in 
(select film_id from inventory where store_id in 
(select store_id from customer 
where email like '%.net'));


-- Q-7. **Join Practice (Aggregation):**
-- Show the total number of rentals made by each customer, along with their first and last names.
select * from customer;
select * from rental;
select c.first_name, c.last_name, count(r.rental_id) as total_rental from customer c join rental r
on c.customer_id = r.customer_id
group by c.customer_id
order by total_rental desc;


-- Q-8. **Subquery Practice (Aggregation):**
-- List the customers who have made more rentals than the average number of rentals made by all customers.
select concat(first_name,'  ', last_name) as customers from customer where customer_id in 
(select customer_id from rental 
group by customer_id having count(rental_id) > (select avg(rental_count) from 
(select count(rental_id) as rental_count from rental 
group by customer_id) as avg_rentals));


-- Q-9. **Join Practice (Self Join):**
-- Display the customer first name, last name, and email along with the names of other
-- customers living in the same city.
select * from customer;
select * from address;
select * from city;
SELECT c1.first_name, c1.last_name, c1.email, c2.first_name AS other_first_name,
c2.last_name AS other_last_name
FROM customer c1
JOIN address a1 ON c1.address_id = a1.address_id
JOIN address a2 ON a1.city = a2.city AND a1.address_id != a2.address_id
JOIN customer c2 ON a2.address_id = c2.address_id;


-- Q-10. **Subquery Practice (Correlated Subquery):**
-- Retrieve the film titles with a rental rate higher than the average rental rate of films in the
-- same category.
select title, rental_rate from film where
rental_rate > (select avg(rental_rate) from film f
join film_category fc
on f.film_id = fc.film_id);


-- Q-11. **Subquery Practice (Nested Subquery):**
-- Retrieve the film titles along with their descriptions and lengths that have a rental rate greater
-- than the average rental rate of films released in the same year.
select * from film;
select title, description, length, rental_rate from film where 
rental_rate > (select avg(rental_rate) from film f where release_year = f.release_year);


-- Q-12. **Subquery Practice (IN Operator):**
-- List the first name, last name, and email of customers who have rented at least one film in the
-- 'Documentary' category.
select * from customer;
select * from rental;
select * from inventory;
select * from category;

SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
SELECT DISTINCT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Documentary');


-- 13. **Subquery Practice (Scalar Subquery):**
-- Show the title, rental rate, and difference from the average rental rate for each film.
SELECT title, rental_rate,
rental_rate - (SELECT AVG(rental_rate) FROM film) AS rate_difference
FROM film;


-- 14. **Subquery Practice (Existence Check):**
-- Retrieve the titles of films that have never been rented.
SELECT title
FROM film
WHERE film_id NOT IN (
SELECT DISTINCT film_id
FROM inventory
WHERE film_id IS NOT NULL
);


-- 15. **Subquery Practice (Correlated Subquery - Multiple Conditions):**
-- List the titles of films whose rental rate is higher than the average rental rate of films released
-- in the same year and belong to the 'Sci-Fi' category.
SELECT title
FROM film f
WHERE rental_rate > (
SELECT AVG(rental_rate)
FROM film
WHERE release_year = f.release_year
)
AND film_id IN (
SELECT fc.film_id
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi'
);


-- 16. **Subquery Practice (Conditional Aggregation):**
-- Find the number of films rented by each customer, excluding customers who have rented
-- fewer than five films.
SELECT customer_id, COUNT(rental_id) AS film_count
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) >= 5;


 









