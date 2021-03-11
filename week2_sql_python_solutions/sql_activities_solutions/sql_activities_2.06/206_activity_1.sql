-- Activity 2.06 1
-- Finished

use bank;
select * from bank.loan;

-- 1.1 Get different card types.
select type from card
limit 200;
-- There are card types = junior, classic, gold 


-- 1.2 Get transactions in the first 15 days of 1993.
select date_format(convert(date,date), "%Y-%M-%D") from bank.loan
where date < "1993-January-15th"
limit 15;
-- There are 0 transactions in the first 15 days of 1993. First transaction of 1993 was in July-5th'

-- 1.3 Get all running loans.
select * from bank.loan
where status = 'B' and "D"
limit 200;
-- There are 0 running loans.

select status from bank.loan;
-- 1.4 Find the different values from the field A2 that start with the letter 'K'.
select * from bank.district
where a2 like "k%";
-- There are 7 values from the field A2 that start with the letter 'K'.


-- 1.5 Find the different values from the field A2 that end with the letter 'K'.
select * from bank.district
where a2 like "%k";
-- There are 7 values from the field A2 that start with the letter 'K'.




