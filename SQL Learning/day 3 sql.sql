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

select name, continent from country where name like '____';


select name, continent from country where name like '_u%a%';

-- get the name ,contitne, region from country where the continte is not same as europe
select name,continent region from country where continent <> ' europe ';



-- where the second letter of a region is a 

select name, continent from country where region like '_a%';



-- ehere in the contitnent is last 3 character is i

select name, continent from country where continent like '%i__';



-- where the contintet should be of minimum 5 character

select name, continent from country where continent like '_____%';



-- where in the continet second letter is c and second last character is  i 

select name, continent from country where continent like '_c%i_';




-- where two  a should be there sperated with the character

select name, continent from country where name like '%a_a%';


-- operator in sql and ,  or 
-- and -> both condition should be true
-- or -> any one of the true will give you true

select name,continent from country where continent  = 'Asia' and region = 'Middle East';

select name,continent from country where continent  = 'Asia' or continent = 'Africa';



-- select name,code ,concat(name, ' ' , code) from country;

 /*
 function
 set of statement
 function
 
 code reusable
 
there are two type of funtion

1: scalarr : will work row by row (result for each row)
2: multi-line function: multiple line pr apply and give 1 output

 scaler function can be apply: date,int,float, string
 
 */
 -- string releated function
-- 1: case conversion : it is a catergory to conver to lower to upper or upper to lower 
select name ,continent, concat(continent,'-','reges',' ',name) as combination from country;

 --  concat_ws -> concat with a seperator
select name,continent, concat_ws('--',name,code,'regex') as combination from country ;
 
-- substring : -> basicly used to extract character based on the position
-- substring ko postion k accouring  nikal do (first  we give the column name, which postion to start, or kitni lenght tak)
-- agar lemght string k akm but lenght jada de di to jitne hai vo print ho jayenge
select name, substr(name ,2,3) from country; 


-- to make read from the last character 
select name,substr(name,-4,2) from country;
select name,substr(name,-2) from country;

-- if the starting point from the size of word exceed it will print nothing


-- country -> continet k first name k barabar ho

select name,continent from country where substr(name,1,3) = 'alg'  ;

-- instr (it find / search the position of the character
select name,instr(name,'ar') from country;


-- to test a function 
select instr('yash','y');

-- to get total character use char_lenght
select char_length('  yash');


select name, char_length(name) from country;

-- trim : used to remove extra space or wide space it work from both side right and left both side
-- with the help of trime we can remove the last charcter from the string but not the middel of that
 --  isme data case senitive tarike se remove hota hai agar chota a remove krenge to vhi hatega na ki bda vala
-- rtrim - remove the right most charcter
-- ltrim - remove the left most character
select trim('       yash         ');
select rtrim('    yash      ');
select ltrim('       yash      ');

select trim(both 'g' from '      yaggshgggg');

select name,trim(both 'A' from name) from country;


-- lpad and rpad
select name,population,lpad(population,9,'0') from country;






 

 
 
 
 
 
 







 






