-- Lab | SQL Joins on multiple tables.

use sakila;


--  1  Write a query to display for each store its store ID, city, and country.
select * from sakila.store;
select * from sakila.staff;

select * from sakila.country as country
inner join sakila.city as city
on country.country_id = city.country_id
join sakila.address as address
on city.city_id = address.city_id
join sakila.store as store
on address.address_id = store.address_id;


-- There are two stores: Candada, Lethbridge, store_id: 1; 

-- second option creating temporary tables

create temporary table country_and_city
select country.country, country.country_id,
city.city, city.city_id
from sakila.country as country
inner join sakila.city as city 
on country.country_id = city.country_id;

select * from sakila.country_and_city;

create temporary table address_and_store
select address.address, address.address_id, address.district,
store.store_id 
from sakila.address as address
join sakila.store as store
on address.address_id = store.address_id;

select * from sakila.address_and_store;
-- select * from sakila.address_and_store;


-- 2   Write a query to display how much business, in dollars, each store brought in.

select sum(payment.amount), staff.store_id
from sakila.payment as payment
inner join sakila.staff as staff
on payment.staff_id = staff.staff_id
group by staff.store_id;
-- $ 33489.47, in store 1
-- $ 33927.04, in store 2



--  3  What is the average running time of films by category?
select avg(f.length) as avg_duration, ca.name
from sakila.film as f
join sakila.film_category as fc
on f.film_id = fc.film_id
join sakila.category as ca
on fc.category_id = ca.category_id
group by ca.name, f.title
order by avg_duration desc;



-- 4   Which film categories are longest?
select avg(f.length) as avg_duration, ca.name
from sakila.film as f
join sakila.film_category as fc
on f.film_id = fc.film_id
join sakila.category as ca
on fc.category_id = ca.category_id
group by ca.name
order by avg_duration desc;
-- sports has the longest avg_duration with 128..2027 min.


-- 5   Display the most frequently rented movies in descending order.

select sum(r.inventory_id) as rented_movies,
f.title from sakila.rental as r
inner join sakila.inventory as i
on r.inventory_id = i.inventory_id
inner join sakila.film as f
on i.film_id = f.film_id
group by f.title
order by rented_movies desc;
--  'ZORRO ARK' is the most rented film with '141905' times.



-- 6   List the top five genres in gross revenue in descending order.

select sum(p.amount) as revenue, ca.name, fc.category_id 
from sakila.payment  as p
inner join sakila.rental as r
on p.rental_id = r.rental_id
inner join sakila.inventory as i
on r.inventory_id = i.inventory_id
inner join sakila.film as f
on i.film_id = f.film_id
inner join sakila.film_category as fc
on f.film_id = fc.film_id
inner join sakila.category as ca
on fc.category_id = ca.category_id
group by ca.name, fc.category_id 
order by revenue desc
limit 5;
-- Sports, Sci-Fi, Animation, Drama, Comedy


-- 7   Is "Academy Dinosaur" available for rent from Store 1?


select f.title, r.rental_id, r.inventory_id, r.rental_date, r.return_date, s.store_id
from sakila.film  as f
inner join sakila.inventory as i
on f.film_id = i.film_id
inner join sakila.rental as r
on i.inventory_id = r.inventory_id
inner join sakila.store as s
on i.store_id = s.store_id
where f.title = "Academy Dinosaur" and s.store_id = 1;
-- Yes, 12 copies of "Academy Dinosaur" are available for rent in Store 1?