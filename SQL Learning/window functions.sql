use regex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);



select * from students;
select * from enrollments;

select s.student_id,e.course_name from students as s join enrollments as e
on s.student_id = e.student_id;


select s.student_id, s.student_name , e.enrollment_id, e.course_name, e.student_id from students as s left join  enrollments as  e
on s.student_id = e.student_id;


-- students who enrolled in courses




select s.student_id, s.student_name , e.enrollment_id, e.course_name, e.student_id from students as s left join  enrollments as  e
on s.student_id = e.student_id where enrollment_id is null;




SELECT s.student_name, COUNT(e.enrollment_id) AS total_enrollments FROM students AS s INNER JOIN enrollments AS e
ON s.student_id = e.student_id
GROUP BY s.student_name;


-- need to findt the total credit each earcned by each student find those also who have not enrolled into any course


select s.student_id, sum(e.credits) from students as s left join  enrollments as  e
on s.student_id = e.student_id group by student_id;

select s.student_id,  count(enrollment_id) , student_name from students as s left join  enrollments as  e
on s.student_id = e.student_id group by student_id having count(enrollment_id) > 2;



/**
 if (condition , True, False)
	case 
    when population = 0  then 'very samll' 
    
    
    
**/

SELECT pop_cont, COUNT(*) AS country_count
FROM (
    SELECT 
        name,
        population,
        CASE  
            WHEN population > 100000 THEN 'large population'
            WHEN population >= 50000 THEN 'medium'
            WHEN population >= 8000  THEN 'less'
            ELSE 'very small'
        END AS pop_cont
    FROM world.country
) t
GROUP BY pop_cont;



-- data type in sql

/**
numeric -> int ,float,decimal
-- tinyint, medium, big int ,small int, int
-- 1byte, small ->2 byte, medium =>3, int=>4 byte, long 8 byte
-- 1 byte , small =>2byte, medium => 3, int =>4 byte, long 8  byte
-- 1 byte =>8 bit (2**8) =>256




**/


use regex;

create table test10(id tinyint); #tinyinit range (-127 to 127)
insert into test10 values(1), (-128),(127);
insert into test10 values(128); -- give error as it give out of range



# type cast can be of two type  explict and implict 

create table test11(id tinyint unsigned);
insert into test11 values(129),(255);

select * from test11;


create table test12(price float);
insert into test12 values(9182.25),(10.1216654);
select * from test12;

create table test13(price1 float ,price   double);


insert into test13 values(12312.123121, 156.95954874), (146.554,12.54888448584);
select * from test13;



drop table test12;



create table test14(prices double(5,2));-- here i am declaring the double where i am fixing the size of values 
										-- if give 5,2 means 2 decinal values are allowed and 5-2->3  values before decimal
								insert into test14 values(323.12);
                                insert into test14 values(1222,12); -- give error columns count doesnt match values count at row 1
                                        
/**
varchar  and char
-- varchar is datatype  => string / character values
-- char => character but of fix lenght of character
-- varchar => it is also of fix lenght but if we store the data less then the limit it will occupy that much memory only and the rest  memory will be used somewhere elese


char is much faster then varchar 
in char it trucncate the wide space from the last
varchar-> it trucate the wide space after the size or lenght of that varchar if the lenght 
exceed the widespace it will remove that wide space

**/

create table test99(name varchar(20),gender char(20));
insert into  test99 values('tushar', 'male'),('aman     ','akash       ');



create table test17(name char(10));-- 

insert into test17 values('adad'),('ajndjnd'),('aaaaaaaaaa');

insert into test17 values('aasdadasajdnaj'); -- the charchter lenght of the data is too long


select * from test17;


 
 # ddl data defination langunage
 
 --  create, drop ,truncate , alter
 
 -- create  a table using select (ctas) 
 create table actor_cp1 as
 select first_name as fname, last_name from sakila.actor;
 
 select * from actor_Cp;
 select * from actor_Cp1 ;
 
 
 drop table actor_cp;  -- drop  -> delete data and structure of the table
 


create table actor_cp as
select first_name as fname , last_name as lname from sakila.actor
where actor_id between 10 and 15;
select * from actor_cp;


-- alter
alter table actor_cp add column (salary int);

select * from actor_cp;

alter table actor_Cp add constraint new_key primary key(fname);
alter table  actor_cp drop column lname;

desc actor_cp;

alter table actor_cp rename column salary to newsalary;
 

 update actor_cp set newsalary = 9000;
 
 
 update actor_Cp set newsalary = 888 where fname = 'uma';
 select * from actor_Cp;
 
 
 
-- delete is a dml operation 
-- if we do not provde any information then all rows will be deleted , so with delete we will apply where cluase 
-- so that we can delete a specific thing
-- delete only deletes the data
delete from actor_cp;


-- truncate:-  truncate is ddl statement in truncate we do not provide any condition but in delete we give condition
-- truncate mai hr data ko revert(rollback) nhi kr sakte but in delete we can rollback
-- truncate is used to just delete the data but it don't make any change in the structure
-- in case if you have executed ddl statement we can't rollback again '

-- object is a structure that can be used to manage ,store and refere the data
-- view is also called as object  

-- create is used to create the object 
-- drop is used to delete a object


truncate  actor_cp1;


-- drop vs delete vs truncate difference


-- window function: 
-- the window function is used to perform the calculation on set of rows witht the reference to current row 
-- 
-- it majorly has three parts 
/*
1. over -> to apply the function over a window  
over is used to appply the calculation over set of rows again and again
2. partition By: -> partion is similar as group by which is used to apply logic into groups

*/
use world;

select * from country;

-- here we will take 2-3 rows to just perform the window function over


select code,name,continent, population , sum(population) over() as total_population from country;


select code,name,continent , population , sum(population) over(partition by continent) as sum_population from country;


-- find out the running sum or commulative sum 

-- we use order by 


select code,name ,continent , population, sum(population) over(order by population) as cummlative from country;



