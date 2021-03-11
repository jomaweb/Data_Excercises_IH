-- Activity 2.07 3
-- Finished

use bank;
-- 3.1 Find out how many cards of each type have been issued.
select type, count(*) from bank.card
group by type;
-- 'classic', '659'
-- 'junior', '145'
-- 'gold', '88'

-- other query for the same answer
select type as card_type, count(*) as num_issued
from bank.card
group by type
order by num_issued desc;


-- 3.2 Find out how many customers there are by the district.
select district_id, count(*) num_customers
from bank.client
group by district_id
order by num_customers desc;

-- 3.3 Find out average transaction value by type.
select avg(amount) as Average, type from bank.trans
group by type;
-- '6776.979795258786', 'PRIJEM'
-- '4344.6648939445', 'VYDAJ'
-- '12525.828413284133', 'VYBER'

-- other query for the same answer
select type, round(avg(amount),2) as avg_amount
from bank.trans
group by type
order by avg_amount desc;


-- 3.4 As you might have seen in the query shown below, 
-- there are 19 rows returned by this query. 
-- But there a few places where the column k_symbol is an empty string. 
-- Your task it to use a filter to remove those rows of data. 
-- After the filter gets applied, you would see that the number of rows have reduced.

select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
group by type, operation, k_symbol
order by type, operation, k_symbol;

-- new query
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
where k_symbol <> "" and k_symbol <> " " 
group by type, operation, k_symbol
order by type, operation, k_symbol;
-- there are 9 rows without empty space

-- Q. can we use is not


