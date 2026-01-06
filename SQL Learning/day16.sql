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
-- here we use ->   in, any, all  when a nested querry return more than one querry then its
select * from payment where amount in (select amount from payment where payment_id = 2 or payment_id = 3) ;

-- not in will check it should be there
select * from payment where amount not in (select amount from payment where payment_id = 2 or payment_id = 3) ;

select * from payment where amount =any (select amount from payment where payment_id = 2 or payment_id = 3) ;

-- =any the amount can either be equal to value 1 ro value 2

-- >any -> it will return the greater values  from the subquerry
select * from payment where amount  >any (select amount from payment where payment_id = 2 or payment_id = 3) ;

select * from payment where amount <any (select amount from payment where payment_id = 2 or payment_id = 3) ;



select * from payment where amount >=any (select amount from payment where payment_id = 2 or payment_id = 3) ;

select * from payment where amount <=any (select amount from payment where payment_id = 2 or payment_id = 3); 

select * from payment where amount !=any (select amount from payment where payment_id = 2 or payment_id = 3);


--- ALL --- uses--

select * from payment where amount >all (select amount from payment where payment_id = 2 or payment_id = 3);
select * from payment where amount <all (select amount from payment where payment_id = 2 or payment_id = 3); 

select * from payment where amount <=all (select amount from payment where payment_id = 2 or payment_id = 3) ;

select * from payment where amount >=all (select amount from payment where payment_id = 2 or payment_id = 3);


-- what are co-related subquerry ,how does it work ,
/**
A correlated subquery is a subquery that references one or more columns from the outer query.
Because of this dependency, the subquery cannot be executed independently.
It is executed once for each row processed by the outer query.


Correlated subquery =
aisi subquery jo outer query ke column par depend karti hai
Matlab
➡️ inner query akeli nahi chal sakti
➡️ outer query ke har row ke liye dubara chalti hai
🔹 Daily life example (easy)
Socho:
Tum ek class me ho
Har student ka marks
Har subject ka average
👉 Question:
“Har subject me average se zyada marks wale students lao”
Yahan:
Student = outer query
Subject ka average = subquery
Average har subject ke hisaab se change hota hai
Isliye subquery ko outer query ki info chahiye



How does it work? (Execution Logic)
The outer query selects one row.
The subquery is executed using values from that outer query row.
The result of the subquery is compared with the outer query row.
Steps 1–3 repeat for every row of the outer query.
**/


-- what are constraint in sql:
--  it enforce rule at database means prevent bad data, maintain relationship, reduce application - level, imporve data quality
-- what can be constrints , not null, unique, primary key, foreign key, default are the some constrains 

