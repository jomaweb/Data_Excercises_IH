-- Lab | SQL Queries - Lesson 2.5 -- https://github.com/ironhack-edu/dataV3_lesson_2.5_lab
-- Finished

use sakila;

-- 5.1 Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = "SCARLETT";
-- There are two actors with the name  "SCARLETT"

-- 5.2 How many films (movies) are available for rent and how many films have been rented?
select count(*) from sakila.film; -- 1000
select count(*) from sakila.rental; -- 1604


-- 5.3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(rental_duration) as max_duration, min(rental_duration) as min_duration
from sakila.film;
-- Shortest film: 3 minutes; largest film 7 minutes


-- 5.4 What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length) / 60) as hours, round(avg(length) % 60) as minutes
from sakila.film;
-- 1 hour, 55 minutes


-- 5.5 How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;
-- There are 121 actors with different last names

-- 5.6 Since how many days has the company been operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as active_days
from rental;
-- Since 266 days


-- 5.7 how rental info with additional columns month and weekday. Get 20 results.
select *, date_format(rental_date, "%M") as month , date_format(rental_date, "%W") as weekday
from rental
limit 20;



-- 5.8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, case when date_format(rental_date, "%W") in ("Saturday", "Sunday")
          then "weekend"
          else "workday" end as day_type
from rental;


-- 5.9 How many rentals were in the last month of activity?
select date(max(rental_date))
from rental;
select *, date_format("rental_date", "%M") as Month_,
date_format("rental_date", "%Y") as Year_
from rental
having Month_ = "October" and Year_ = 2020;
-- There were 0 rentals in the last month of activity
