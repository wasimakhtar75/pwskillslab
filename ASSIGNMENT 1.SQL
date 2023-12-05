use Mavenmovies;

Ques-1  Identify the PRIMARY KEYS and FOREIGN KEYS in mavenmovies db. Discuss the diffrences.
--PRIMARY KEY - A PRIMARY KEY generally focuses on the uniquness of the table. It assures the value in the specific column is unique.
--The table allows only one primary key. It can hold unique and not null values.
--FOREIGN KEY - A FOREIGN KEY generally used to build a relationship between the two tables. Tables can allows more than one foreign key.
--It can continue null values also.
 
SHOW TABLES;
desc actor;
-- actor_id is primary key and last_name is foreign key

desc actor_award;
-- actor_award_id is primary key and Last_name is foreign key

desc address;
-- Address_id is primary key and city_id is foreign key

desc advisor;
-- advisor_id is primary key

desc category;
-- category_id is primary key

desc city;
-- city_id is primary key and country_id is foreign key

desc country;
-- country_id is primary key

desc customer;
-- customer_id is primary key and store_id, last_name, address_id are foreign keys

desc film;
-- film_id is primary key and title, language_id, original_language_id are foreign keys

desc film_actor;
-- actor_id and film_id are primary key

desc film_category;
-- film_id and category_id are primary key

desc film_text;
-- film_id is primary key and title is foreign key

desc inventory;
-- inventory_id is primary  key and film_id, store_id are foreign key

desc investor;
-- investor_id is primary key

desc language;
-- language_id is primary key

desc payment;
-- payment_id is primary key and customer_id, staff_id, rental_id are foreign key

desc rental;
-- rental_id is primary key and rental_date, inventory_id, customer_id, staff_id are foreign key

desc staff;
-- staff_id is primary key and address_id, store_id are foreign key

desc store;
-- store_id is primary key and address_id is foreign key and manager_staff_id is unique

-- Ques-2 List all details of actors
select * from actor;

-- Ques-3 List all customer information from DB.
select * from customer;

-- Ques-4 List different countries.
select distinct country from country;

-- Ques-5 Display all active customers.
select * from customer where active = 1;

-- Ques-6 List all rental IDs for customer with iD 1.
select customer_id, rental_id from rental where customer_id=1;

-- Ques-7 Display all the films whose rental duration is greater than 5.
select film_id, title, rental_duration from film where rental_duration > 5;

-- Ques-8 List the total no. of films whose replacement cost is greater than $15 and less than $20.
 select count(*)as total_no_films from film where replacement_cost between 15 and 20;

-- Ques-9 Find the number of films whose rental rate is less than $1.
select count(*) as No_of_films from film where rental_rate <1; 

-- Ques-10 Display the count of unique first names of actors.
select count(distinct first_name) as Unique_first_name from actor;

-- Ques-11 Display the first 10 records from the customer table. 
select * from customer limit 10 ;

-- Ques-12 Display the first 3 records from the customer table whose first name starts with "B".
select  first_name from customer where first_name like "B%" limit 3;

-- Ques-13 Display the names of the first 5 movies which are rated as 'G'.
select (title) as movies, rating from film where rating='g' limit 5;

-- Ques-14 Find all customers  whose first name starts with 'a'.
select First_name from customer where first_name like'a%';

-- Ques-15 Find all customers  whose first name ends with 'a'.
select First_name from customer where first_name like'%a';

-- Ques-16 Display the list of first 4 cities which start and end with 'a'.
select city from city where city like 'a%a' limit 4;

-- Ques-17 Find all customers whose first name have "NI" in any position.
select first_name from customer where first_name like '%NI%' ;

-- Ques-18 find all customers whose first name have "r" in the second position.
select first_name from customer where first_name like '_r%';

-- Ques-19 Find all customers whose first name starts with "a" and are at least 5 characters in a length.
select first_name from customer where first_name like "a%"and length(first_name)>=5;

-- Ques-20 Find all customers whose first name starts with "a" and ends with "o".
select first_name from customer where first_name like 'a%o';

-- Ques-21 Get the films with pg and pg-13 rating using IN operator.
select title, rating from film where rating in ('pg','pg-13');

-- Ques-22 Get the films with length between 50 to 100 using between operator.
select title, length from film where length between 50 and 100;

-- Ques-23 Get the top 50 actors using limit operator.
select * from actor limit 50;
select * from actor order by actor_id desc limit 50;

-- Ques-24 Get the distinct film ids from inventory table.
select distinct(film_id) from inventory;


