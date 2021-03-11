-- Activity 2.07 1
-- Finished

use bank;

-- Excersice 1.
-- In the loan table (which is part of the bank database), there's column status A, B, C, and D.
-- Using the case statement we will create a new column with the values there with a brief description.
--    'A' : 'Good - Contract Finished'
--    'B' : 'Defaulter - Contract Finished'
--    'C' : 'Good - Contract Running'
--    'D' : 'In Debt - Contract Running'


select * from bank.loan; 

select loan_id, account_id,
case
when status = "A" then "Good - Contract Finished"
when status = "B" then "Defaulter - Contract Finished"
when status = "C" then "Good - Contract Running"
else "In Debt - Contract Running"
end as "Status_Description"
from bank.loan;


