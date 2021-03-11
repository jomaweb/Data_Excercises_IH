-- Lab 2.06 solutions -- https://github.com/ironhack-edu/dataV3_Lesson_2.6_lab
-- Finished


use sakila;

-- 6.1 Get release years.
select distinct release_year from sakila.film;
-- 2006


-- 6.2 Get all films with ARMAGEDDON in the title.
select title from sakila.film
where title like '%ARMAGEDDON%';
-- There are 6 films with ARMAGEDDON in the title


-- 6.3 Get all films which title ends with APOLLO.
-- (option 1)
select title from sakila.film
where title like '%APOLLO';

-- select title from sakila.film
-- where title REGEXP 'APOLLO$';

-- There are 5 films with Apollo in the end of the title


-- 6.4 Get 10 the longest films. 
select title from sakila.film
order by length desc
limit 10;
-- 


-- 6.5 How many films include Behind the Scenes content?
select count(*) from sakila.film
where special_features like '%Behind the Scenes%';
-- 538


-- 6.6 Drop column picture from staff.
alter table skila.staff drop column picture;


-- 6.7 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly. (Shimanshu explanation!!)
 
-- to check if such an entry already exists
select * from sakila.customer
where first_name = 'TAMMY' and last_name = 'SANDERS';
insert into sakila.staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 640, 2, 'tammy');



-- 6.8 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store
-- (Shimanshu explanation amd approach!!)
-- get customer_id
select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- expected customer_id = 130
-- get film_id
select film_id from sakila.film where title = 'ACADEMY DINOSAUR';
-- expected film_id = 1
-- get inventory_id
select inventory_id from sakila.inventory where film_id = 1;
-- expected inventory_id = 1
-- get staff_id
select * from sakila.staff;
-- expected staff_id = 1
insert into sakila.rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), 1, 130, 1);
select curdate();


-- 6.9 Delete non-active users, but first, create a backup table deleted_users to store 
-- customer_id, email, and the date for the users that would be deleted.
-- (Shimanshu explanation amd approach!!)

-- check the current number of inactive users
select * from sakila.customer
where active = 0;

drop table if exists deleted_users;

CREATE TABLE deleted_users (
customer_id int UNIQUE NOT NULL,
email varchar(255) UNIQUE NOT NULL,
delete_date date
);
insert into deleted_users
select customer_id, email, curdate()
from sakila.customer
where active = 0;

select * from deleted_users;

delete from sakila.customer where active = 0;

-- check how many inactive users there are now
select * from sakila.customer
where active = 0;
-- There are 15 inactive users
