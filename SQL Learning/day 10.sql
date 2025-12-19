-- subquerry
-- querry within a querry
-- there are outer querry (inner querry)
-- sabse phle inner querry solve hoti hai and fir outer querry solve hoti hai

use sakila;
select * from payment;

-- get me the inforamtion where amount is greater then 0.99 jiksa amount paymentid 5 se jada ho

select * from payment where amount >(select amount from payment  where payment_id = 20);


select * from payment where month(payment_date) = (select month(payment_date) from payment where payment_id = 20); 



