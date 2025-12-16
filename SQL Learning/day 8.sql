use world;
select * from country;
select region, count(name) , count(continent) from country group by region;
select region , avg(population )from country group by region;

select district, count(name) as total_City from city group by district;

-- where (sabse phele execute hoga => group by count 

select district, count(name) from city where population > 100000 group by district;


-- get the total countary which got independence after 1950 in each continent

-- where will only filter the data which exist in the table



select continent , count(name),sum(population) from country where indepyear > 1950  group by continent;

-- whhat is the diff betw  where and having
-- where clasue is used to filter the data from the table
-- but on the other hand the having is used to filter the data on aggregate column usi p he apply honge


select continent , count(name) from country where indepyear > 1950  group by continent having sum(population);



-- un contries ka total population chiye har continet mai have to find the
-- total population only those  countres which have life exepencty  35se

select * from country;
select contitnent ,sum(population)  from country where lifeExpectancy > 35 group by continent;

-- you need to find out the total country  for each gioverment form  where the total no of countries should be greater then 30
 
select  governmentForm ,count(name)  as np from country group by governmentForm having np > 30;

-- need to find the gov form and the total countries only for the countries having their capitla greater 30 and total population 3lac


select governmentForm , count(name) from country where capital >30   group by governmentForm having sum(population) > 300000;

select continent,region ,count(name) from country group by continent, region;




