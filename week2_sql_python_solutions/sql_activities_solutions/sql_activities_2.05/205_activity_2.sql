-- Activity 2.05 2
-- Finished

use bank;

-- 2.1 Get all junior cards issued last year. Hint: Use the numeric value (980000).
select * from bank.card
where issued > 980000 and type = "junior";

-- 2.2 Get the first 10 transactions for withdrawals that are not in cash. 
-- You will need the extended case study information to tell you which values
-- are required here, and you will need to refer to conditions on two columns.

select trans_id as "TransactinID", account_id as "AccountID", amount as "Amount"
from bank.trans
where type = "VYDAJ" 
order by type asc
limit 10;

-- 2.3 Refine your query from last activity on loans whose contract finished and not paid back 
-- filtered to loans where they were left with a debt bigger than 1000. Return the debt value
-- together with loan id and account id. Sort by the highest debt value to the lowest.

select abs(amount)-abs(payments) as "Debt",  loan_id as "LoanID", account_id as "AccountID", amount as "Amount", payments as "Payments"
from bank.loan
where abs(amount)-abs(payments) > 1000 and Status = "B" 
order by amount asc;
-- There are 31 loans with a debt bigger than 1000 and whose contract finished without paid back.


-- 2.4  Get the biggest and the smallest transaction with non-zero values in the database 
-- (use the trans table in the bank database).

select max(amount) from bank.trans
where k_symbol is not null and k_symbol = ' ';
-- The biggest transaction with non-zero values is 87400.

select min(amount) from bank.trans
where k_symbol is not null and k_symbol = ' ';
-- the smallest transaction with non-zero values is 1
 
 
-- 2.5 Get account information with an extra column year showing the opening year as 'YY'. 
select date_format(convert(date,date), "%Y") as "Date", account_id from bank.account;

