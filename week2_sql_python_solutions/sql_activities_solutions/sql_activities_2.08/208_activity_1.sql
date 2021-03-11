-- Activity 2.08 2
-- Finished


use bank;
-- 1.1 In this activity, we will be using the table district from the bank database and
-- according to the description for the different columns:

--    A4: no. of inhabitants
--    A9: no. of cities
--    A10: the ratio of urban inhabitants
--    A11: average salary
--    A12: the unemployment rate
-- Rank districts by different variables. Do the same but group by region.

select *, rank() over (order by A4 desc) as "Rank"
from bank.district;

select *, rank() over (order by A9 desc) as "Rank"
from bank.district;

select *, rank() over (order by A10 desc) as "Rank"
from bank.district;

-- 1.2 Do the same but group by region A3.

select *, rank() over (partition by A3 order by A4 desc) as "Rank"
from bank.district;

