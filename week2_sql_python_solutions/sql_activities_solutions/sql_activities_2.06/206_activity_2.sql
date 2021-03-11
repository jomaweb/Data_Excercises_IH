-- Activity 2.06 2
-- Finished

use bank;
-- 2.1 Can you use the following query:
select * from bank.district
where a3 like 'north%m%';
-- Yes, but it is redundant
-- Better use one of the following
select * from bank.district
where a3 like 'north_M%';

select * from bank.district
where a3 like '%M_a';

-- 2.2 Can you modify the query to print the rows only for those values in the A2 column that starts with 'CH'?
select * from bank.district
where a2 regexp 'ch[e-r]';

-- Yes, by adding a ^ into the parameter of regexp
select * from bank.district
where a2 regexp '^ch[e-r]';

-- 2.3 Use the table trans for this query. Use the column type to test: 
-- "By default, in an ascending sort, special characters appear first, 
-- followed by numbers, and then letters."

select * from bank.trans order by type;
limit 100;
-- Yes
-- 2.4 Again use the table trans for this query. Use the column k_symbol to test:
-- "Null values appear first if the order is ascending."
select * from trans order by k_symbol
limit 200;
-- Yes

-- 2.5 Pick any table and any column to test: "You can use any column from the table to sort the values 
-- even if that column is not used in the select statement." Check the difference by writing 
-- the query with and without that column (column used to sort the results) in the select statement.
select trans_id, type from bank.trans order by balance
limit 200;

select trans_id, type from bank.trans 
limit 200;
