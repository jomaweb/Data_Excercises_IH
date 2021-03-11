-- Lab | SQL Intro -- https://github.com/ironhack-labs/lab-intro-sql

use sakila;

  -- 1  Review the tables in the database.
  -- 2 Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from sakila.actor;

select * from sakila.city;

select * from sakila.category;


-- etc..

  -- 3  Select one column from a table. Get film titles.
  select title from sakila.film;
   
  
  -- 4  Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select * from sakila.language;

select * from sakila.language;
select *, name as language 
from sakila.language
limit 100;

  -- 5  Using the select statements and reviewing how many records are returned,
 
select count(return_date) from sakila.rental;
-- 15861  records are returned.

  -- can you find out how many stores and staff does the company have? 
  
select count(store_id) from sakila.store; 
select count(staff_id) from sakila.staff;       
-- There are 2 stores and 8 staffs 
  
  -- Can you return a list of employee first names only?
select first_name from sakila.staff;    
  
  -- 6  Bonus: How many unique days did customers rent movies in this dataset?

 
  select * from sakila.rental;
  
  select count(return_date) as num_return_date from sakila.rental
group by return_date;

select distinct return_date, count(*) as num_return_date 
from sakila.rental
group by return_date;
