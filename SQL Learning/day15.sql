use sakila;

select * from payment;

select * from payment where amount = (select amount from payment where payment_id = 5);


-- need to get the all the payment information where the staff surving for payment 8 be same

select * from payment where staff_id = (select staff_id from payment where payment_id = 7);



-- get the payment id amount and the payment date where the month should be same as of payment id 20

select payment_id,amount,payment_date    from payment where  
month(payment_date)    =(select month(payment_date) from payment where payment_id = 20);

-- get the amount and total number of payment done for each amount where the amoun should be less then the amount of rental id 1725 

select amount ,count(*) from payment where amount  <(select amount from  payment where rental_id = 1275)group by amount;


-- single row subquerry (subquerry will return 1 rows)


-- get the month and total amount spend  from the payment table where month is greater than
-- the month of customer id = 1 with the payment id = 3

select month(payment_date),sum(amount) from payment where month(payment_date) >  
 (select month(payment_date) from payment where customer_id = 1  and payment_id = 3) group by month(payment_date) ;
 
 
-- in the multi row subquerry ( we can not use  >,< ,= , != operator)
-- here we use ->   in, any, all 
select * from payment where amount in (select amount from payment where payment_id = 2 or payment_id = 3) 


-- 
