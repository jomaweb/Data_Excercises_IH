-- Activity 2.08 3
-- Finished
use bank;

-- 3.1 Get a rank of districts ordered by the number of customers.
select district.A2 as district_name, count(*) as num_customers
from bank.client
inner join bank.district on client.district_id = district.A1
group by district.A2
order by num_customers desc;
-- The district with the most number of customers is Hl.M Praha - 663

-- 3.2 Get a rank of regions ordered by the number of customers.
select district.A3 as region_name, count(*) as num_customers
from bank.client inner join bank.district on client.district_id = district.A1
group by district.A3
order by num_customers desc;
-- The region with the most number of customers is South Moravia - 937


-- 3.3 Get the total amount borrowed by the district together with the average loan in that district.
select d.A2 , sum(l.amount), avg(l.amount)
from bank.account a 
inner join district d on a.`district_id` = d.A1
inner join loan l on l.account_id = a.account_id
group by d.A2;


-- 3.4 Get the number of accounts opened by district and year.

select d.A2 as district_name, date_format(convert(date, date),'%Y') as year, count(*) num_accounts
from bank.account a 
inner join bank.district d on a.district_id = d.A1
group by district_name, year
order by district_name, year;    



