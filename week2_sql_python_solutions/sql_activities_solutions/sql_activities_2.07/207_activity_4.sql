-- Activity 2.07 4
-- Finished

use bank;

-- 4.1 Find the districts with more than 100 clients.

select district_id, count(*) from bank.client
group by district_id
having count(*) > 100
order by "district_id";
-- 6 districts have more than 100 clients

-- 4.2 Find the transactions (type, operation) with a mean amount greater than 10000.

select avg(amount) as Average, type, operation 
from bank.trans
group by type, operation
having Average > 10000;
-- 3 transactions have mean amount greater than 10000.
