-- aggregate function
-- to perform the calculation on set of rows -> this function comes in multi -line function  will give some output
-- 1. count:-> 
use world;
select * from country; 

-- * means everything will be count if null also 
select count(*), count(indepyear) from country;

select count(indepyear) from country;

-- applying distinct on bioth the columns 

select distinct continent, region from country;

select count(distinct(population)), sum(Population) as pop,avg(Population) from country;

-- total country in afrinca
select count(governmentform), count( distinct  governmentform) from country where Continent = 'Asia' ;

select sum(population) , count(name), count(distinct  IndepYear) from country where continent = 'Africa';

-- get the total countries the avg surface area the total population for the countries
-- which has got their indepyear from  year 1947 to 1998 they should be exclued

select count(name), avg(surfaceArea) ,sum(population) from country where IndepYear between 1948 and 1997;

select count(name), avg(surfaceArea) ,sum(population) from country where IndepYear > 1947 and IndepYear< 1997;


-- get the total no of countires and the no of unique contintes algon with
-- the avg population and the total no of capitals for the country starting with ->'A' or startding with 'd'
select  count(distinct(Continent)), count(name) , avg(population), sum(capital) from country where name like 'A%' or name like 'D%';


-- group by is used to collect d

select name from country group by name;
select continent , count(*) from country group by continent;

select indepyear,count(*) from country group by IndepYear;
select governmentform, count(*) from country group by GovernmentForm;

-- jab bhi hum group by krnge to or koi column ko select nhi kr sakte

select continent , count(name),sum(population), min(Population),max(Population) from country group by continent;

select * from city;
-- from the city table have to find the total citites , the total district , unique district, the total population from the city table
select CountryCode ,count(name) , count(distinct district)  , count(District) , sum(population) from city group by countrycode;

