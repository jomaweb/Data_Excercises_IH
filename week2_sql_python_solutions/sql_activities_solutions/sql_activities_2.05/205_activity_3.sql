-- Activity 2.05 3
-- Finished

use bank;

-- 3.1 Get card_id and year_issued for all gold cards.
select card_id, issued from bank.card 
where type = "gold"
order by issued asc
limit 200;


-- 3.2 When was the first gold card issued? (Year)
select card_id, issued from bank.card 
where type = "gold"
order by issued asc
limit 2;
-- The first gold card was issued in  1995.


-- 3.3 Get issue date as:
--   date_issued: 'November 7th, 1993'
--   fecha_emision: '07 of November of 1993'
select date_format(convert(date,date), "%Y-%M-%D") from bank.loan;
