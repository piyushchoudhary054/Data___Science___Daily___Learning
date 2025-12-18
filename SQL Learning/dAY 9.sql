use sakila;
select * from payment;

select customer_id, count(payment_id) from payment group by customer_id;

-- need to find out the no of transaction of each customer where the amount of transection should be greater then 3

select * from payment;


select staff_id, count(payment_id) from payment where amount >3 group by staff_id;


-- ned to find the total no of transaction for each amount in the month of may
select * from payment;

select  amount,count(*) from payment where month(payment_Date) = 5 group by amount;

-- ned to find out the max amount spend the avg amount spend and the total amount spedn for each staff
select  staff_id,max(amount),avg(amount),sum(amount) from payment group by staff_id;

-- only for customer id 1,3,7,11
select  customer_id,max(amount),avg(amount),sum(amount) from payment where customer_id = 1 or customer_id = 3 or customer_id = 5 or
 customer_id = 7 or customer_id = 11  group by customer_id;
 
 -- find the total amound spend and the number of customer who have done the payment in each month
 
 -- where amound spend should be greater than 1 dollar
 
 select month(payment_date),sum(amount),count(customer_id) from payment  where amount> 1  group by month(payment_date);
 
 
 select month(payment_date),sum(amount),count(customer_id) from payment  
 where amount> 1  group by month(payment_date) having count(customer_id) > 300;
 
 select year(payment_Date),month(payment_Date) from payment group by year(payment_date),month(payment_date);
 
 
 -- 
 
 
 
 