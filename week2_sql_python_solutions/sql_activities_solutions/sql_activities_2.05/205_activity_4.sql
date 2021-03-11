-- Activity 2.05 4
-- Finished

use bank;
-- For null values
-- select isnull(k_symbol) from bank.trans;

-- 4.1 Check for transactions with null or empty values for the column amount.
select amount, trans_id from bank.trans
where amount is null and amount = " ";
-- There are 0 values with null or empty values 

-- 4.2 Count how many transactions have empty and non-empty k_symbol (in one query).
select amount, trans_id, k_symbol from bank.trans
where k_symbol is null and k_symbol = " ";

-- There are 0 transactions that have empty and non-empty k_symbol

