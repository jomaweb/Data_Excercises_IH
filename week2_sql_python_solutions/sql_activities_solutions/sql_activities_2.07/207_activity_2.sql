-- Activity 2.07 2
-- Finished

-- 1.  What could be possible anomalies in a table?
-- update anomalities, insertion anomalities and delete anomalities 

-- 2. You objective is to find the maximum and the minimum in each Status category from the Bank data file.

-- select avg(amount) as Average, status from bank.loan
-- group by Status
-- order by Average asc;

select max(amount) as max_status, min(amount) as min_status from bank.loan
where status = "a";
-- max_statu A = 323472
-- min_status A = 4980

select max(amount) as max_status, min(amount) as min_status from bank.loan
where status = "B";
-- max_statu B = 464520
-- min_status B = 29448

select max(amount) as max_status, min(amount) as min_status from bank.loan
where status = "c";
-- max_statu C = 590820
-- min_status C = 5148

select max(amount) as max_status, min(amount) as min_status from bank.loan
where status = "D";
-- max_statu D = 541200
-- min_status D = 36204


