-- Activity 2.08 2
-- Finished
use bank;

-- 2.1 Use the transactions table in the bank database to find the Top 20 account_ids based on the balances.
    
select *, rank() over (order by balance desc) as "Rank"
from bank.trans
limit 20;


-- 2.2 Illustrate the difference between Rank() and Dense_Rank().

-- Rank() 
select *, dense_rank() over (order by account_id desc) as "Rank"
from bank.trans;

-- Dense_Rank()
select *, rank() over (order by account_id desc) as "Rank"
from bank.trans;