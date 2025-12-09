select database();
use world;

show tables;

-- to see the structure of the table
describe city;

select * from city;

select name,  population from city;

select population,name, district from city;

-- we can update the and do artimetic opertion as i want to add 100 in each colume 

select population,name,district , population+100 from city;


select name ,population,countrycode, population, district, district from city;

-- query can be wirtten in multiple line



select name ,population,countrycode, population, 
district, district from city;

-- not case sensitive

select *,population,population+12-10+2-55 as population from country;
