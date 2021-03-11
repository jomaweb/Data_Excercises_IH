-- Activity 2.05 1
-- Finished

use bank;

-- 1.1 Select districts and salaries (from the district table) 
-- where salary is greater than 10000. 
-- Return columns as district_name and average_salary.
select A2 as district_name, A11 as average_salary
from bank.district
where A11>10000;
-- There are 8 districts with an average salary greater than 10000


-- 1.2 Select those loans whose contract finished and were not paid.
select * from loan
where status = 'B';
-- There are 31 loans with no paid as status.


-- 1.3 Select cards of type junior. Return just first 10 in your query.
select * from bank.card
where type in ("junior")
limit 10;


-- 1.4 Select those loans whose contract finished and not paid back. 
-- Return the debt value from the status you identified in the last activity
-- together with loan id and account id.
select loan_id, account_id, amount from bank.loan
where status in ("B");
-- There are 31 loans whose contract finished and not paid back.

 
-- 1.5 Calculate the urban population for all districts. 
-- Look for the number of inhabitants and the % of urban inhabitants in each district. 
-- Return columns as district_name and urban_population.
select A2 as district_name, round(A4*A10/100) as urban_population
from bank.district;

-- On the previous query result 
-- rerun it but filtering out districts where the rural population is greater than 50%.
select A2 as district_name, round(A4*A10/100) as urban_population
from bank.district
where A10>50;

-- There are 63 districts where the rural population is greater than 50%
