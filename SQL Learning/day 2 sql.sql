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


-- using the wehere clasue we willl filter the data


select * from city where district = 'Zuid-Holland';

select *  from city where countrycode = 'Arg';

select * from city where population > 600000;

select *  from city where countrycode != 'Arg';
select *  from city where countrycode <> 'Arg';

-- ! this alse not equals to and <> this also


select * from country;

select * from country where continent = 'north america' or continent = 'europe';


select * from country where continent  in ('north america' ,'europe');
-- in ooperator is used to fileter the data in the specific set of values

select name,continent from country where indepyear in (1960,1901);


select name, continent from country where indepyear between 1960 and 1901;

-- between is used to give the result between the specified range

select name,continent from country where indepyear not between 1901 and 1960;

select name, continent from country where indepyear not in (1901 ,1960);




-- get the name indepyear and population with a expected 10% increment of the population

-- get tall the columns of the countries where life excenetry is  38.3 or 66.4

-- get tthe name contitnet populationa and gnp columns   from the table where  population is not from 5000 - 200000

select name,continet ,population ,gnp from country where population not between 5000 and  200000;

select * from country where lifeExpectancy in (38.3,66.4);

select name , indepyear , population *0.1 + population as population from country ;
 --  get the code the country name and region where the reigion is not mideleast
select code,name,region from country where region <> 'middle east';


-- like operator

--  to search a pattern
-- to meet the pattern 
-- special charachter is called wildcard character

-- %[ we are finidn 0 or more characters]
-- asian asia%




select name,continent from country where name like '%a';  -- check for the last character
select name,continent from country where name like 'a%'; -- check for the start charancetr
select name,continent from country where name like '%a%'; -- check in the middle if any one string have 
select name,continent from country where name like '%ad%';  -- check for the same 


--  _ uniderscore means only one character   check only for obn  jese _D ki jo mera phela character kuch bhi ho sakta lekin jo secodn hai 
--   vo d he hoga

--  if i apply _ _ _ means the character should consist of only three


select name ,continent from country where name like 'Ir__';

select name, continent from country where name like '_i';





 






