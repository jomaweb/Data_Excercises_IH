-- Lab | SQL Queries 8
-- Finished 

use sakila;

-- 8.1 Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
select  title, length, rank() over (order by length desc) as "Rank" from sakila.film
where length is not null and length > 0
order by "Rank";
-- The longest film is 'CHICAGO NORTH', '185', '1'
 
 -- 8.2 Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
select  title, length, rating, rank() over (order by rating) as "Rank" from sakila.film
where length is not null and length > 0
order by rating asc;
-- The film ranked with the highest rating was 'ACE GOLDFINGER', '48', 'G', '1'


-- 8.3 How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query

select name as category_name, count(*) as num_films
from sakila.category as cats 
inner join sakila.film_category film_cats
on cats.category_id = film_cats.category_id
group by category_name
order by num_films desc;
-- The category with more films is Sports

-- to count without the category name 
select count(*), fc.category_id 
from sakila.film_category as fc
left join sakila.film as f
on fc.film_id = f.film_id
group by fc.category_id
order by fc.category_id;

-- 4 Which actor has appeared in the most films?
select actor.actor_id, actor.first_name, actor.last_name,
count(actor_id) as film_count
from sakila.actor join sakila.film_actor using (actor_id)
group by actor.actor_id
order by film_count desc
limit 1;
-- The  actor that appeared in the most films is Gina Degeneres

-- 5 Most active customer (the customer that has rented the most number of films)
select customer.*,
count(rental_id) as rental_count
from sakila.customer join sakila.rental using (customer_id)
group by customer_id
order by rental_count desc
limit 1;
-- The customer that has rented the most number of films is Eleanor Hunt

-- Bonus: Which is the most rented film? 
select film.title, count(rental_id) as rental_count
from sakila.film inner join sakila.inventory using (film_id)
inner join sakila.rental using (inventory_id)
group by film_id
order by rental_count desc
limit 1;
-- The most rented film is Bucket Brother.