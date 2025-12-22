-- subquerry
-- querry within a querry
-- there are outer querry (inner querry)
-- sabse phle inner querry solve hoti hai and fir outer querry solve hoti hai

use sakila;
select * from payment;

-- get me the inforamtion where amount is greater then 0.99 jiksa amount paymentid 5 se jada ho

select * from payment where amount >(select amount from payment  where payment_id = 20);


select * from payment where month(payment_date) = (select month(payment_date) from payment where payment_id = 20); 

select  payment_date, extract(year from payment_Date) from payment;
select time(payment_Date) as p_date from payment;


select * from city;
use world;
select * from city;

-- id , population
-- har ek row ko uniquely identify krne k liye  primary key use hoti hai

describe city;


select count(id), count(distinct id),count(population), 
count(distinct population) from city;

-- to make reltionship between the table we make primart key ,foreign key
-- conutry code => id(pk)
-- city =>id(pk) , country code
-- country =? code => pk, code

select * from country;


select * from city;

-- forign key used to make reltion betwenn the two table

select ct.name , ct.countrycode from city as ct;


select cnty.code , cnty.name from country as cnty;
 -- find out the city and their respective conutry name
 
select ct.name, ct.countrycode , cnty.code  from city as ct
join country  as cnty
where ct.countrycode = cnty.code;

select cnty.code , cnty.name  from country as cnty;

-- need to findt the country name , pop of city ,
-- city name aling with the gove form in that city 
-- with the pop from highest to lowest
select * from city;
select * from country;
select ct.name , ct.population, cnty.governmentform from city as ct
join country as cnty
where ct.countrycode = cnty.code order by ct.population desc;

-- country 
-- contry lang
select * from country;
describe country; -- code
select * from country;
describe countrylanguage;  -- country code
-- need to get the cnty name, pop, and all tha language spoken for each contry

select cnty.name , cnty.population , ln.language from country as cnty
join countrylanguage as ln
where cnty.code = ln.countrycode;


-- 
use sakila;

select * from actor;
select * from film_actor;

-- find out get the actor id and 
-- their first name along with its film id

select ac.first_name , ac.actor_id , fa.film_id from actor as ac
join film_actor as fa
where ac.actor_id = fa.actor_id;

-- use actor table, fil_Actor,film table 

-- what is actor name along with the movie he worked
select * from film_Actor;

select ac.first_name , fm.title from actor as ac
join film_Actor as fa on
 ac.actor_id = fa.actor_id
join film as fm on fm.film_id = fa.film_id;


-- left ,right and natural join



