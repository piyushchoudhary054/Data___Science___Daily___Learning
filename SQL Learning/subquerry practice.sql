create database corredb;

use corredb;

CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    dept_id     INT,
    salary      INT,
    job_title   VARCHAR(50),
    hire_date   DATE,
    CONSTRAINT fk_dept
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Sales'),
(50, 'Marketing');


INSERT INTO employees (emp_id, emp_name, dept_id, salary, job_title, hire_date) VALUES
(101, 'Alice',   10, 40000, 'HR Executive',      '2018-03-12'),
(102, 'Bob',     20, 60000, 'Software Eng',      '2019-07-19'),
(103, 'Charlie', 20, 75000, 'Senior Dev',        '2017-01-10'),
(104, 'David',   30, 50000, 'Accountant',        '2020-11-01'),
(105, 'Eva',     30, 90000, 'Finance Manager',   '2016-06-23'),
(106, 'Frank',   40, 45000, 'Sales Rep',         '2019-02-15'),
(107, 'Grace',   40, 70000, 'Sales Manager',     '2015-09-30'),
(108, 'Hannah',  50, 48000, 'Marketing Exec',    '2021-04-18'),
(109, 'Ian',     50, 65000, 'Marketing Lead',    '2018-12-07'),
(110, 'Jack',    20, 55000, 'QA Engineer',       '2020-08-25'),
(111, 'Karen',   10, 42000, 'HR Analyst',        '2019-05-14'),
(112, 'Leo',     30, 52000, 'Auditor',            '2021-09-09'),
(113, 'Mona',    40, 48000, 'Sales Exec',        '2022-01-03'),
(114, 'Nina',    20, 80000, 'Tech Lead',         '2016-10-11'),
(115, 'Oscar',   50, 47000, 'Content Writer',    '2020-06-17'),
(116, 'Paul',    10, 39000, 'Recruiter',         '2022-07-20'),
(117, 'Queen',   30, 61000, 'Financial Analyst', '2018-02-28'),
(118, 'Rick',    40, 53000, 'Sales Analyst',     '2019-09-05'),
(119, 'Steve',   20, 67000, 'DevOps Eng',        '2017-04-14'),
(120, 'Tina',    50, 72000, 'Brand Manager',     '2016-12-01');


-- find employee who earn more than the avg salary of all employess

select * from employees where salary > (select avg(salary) from employees);

with av as (
select avg(salary) as a from employees)
select * from employees where salary > (select * from av);


-- find the employee who earn the maximum salary
select * from employees where salary = (select  max(salary) from employees);


-- Limit and offset use nhi krne 

select distinct salary from employees order by salary desc limit 1 offset 1;


select *, dense_rank() over(order by salary desc) as r from employees where r = 2;

select max(salary) from employees where salary < (select max(salary) from employees);

-- dept_id, dept_name 

select * from employees
where dept_id =any (select dept_id from departments where dept_name = 'It' or dept_name = 'finance');



select e.* from employees as e join departments as d on e.dept_id = d.dept_id where dept_name = 'It' or dept_name = 'finance' ;


-- find employees whose salary is greater than all employees in the hr department
select * from employees where salary >(select max(salary) from employees  where dept_id = (select dept_id  from departments where dept_name = 'hr'));


-- correleatesd
-- find employees who earn more than the avg salary of their own department

-- find employees who earn the same salary as of sales 

with cte as 
(select d.dept_id,salary from employees as e join departments as d
where e.dept_id = d.dept_id and d.dept_name = 'sales')

select * from employees where salary in (select salary from cte) and dept_id not in(select dept_id from cte);


-- find employees who earn more than the avg salary of their own department

select dept_id,avg(salary) from employees group by dept_id;

select * from employees where (dept_id,salary) ;
select * from employees as e where (salary) > (select  avg(salary) from employees where dept_id = e.dept_id );





with cte as 
(select dept_id , avg(salary) as salary from employees group by dept_id)
select * from employees as e join cte where e.dept_id  = ct.dept_id ;


-- find employees who have the highest salary in their department



select * from employees as e where (salary) = (select  Max(salary) from employees where dept_id = e.dept_id );



-- find deptarmets whose avg salary is greater than the overall avg salary of all employess

-- select o.dept_name from department as o join employees as e on o.dept_id = e.dept_id where salary > (select avg(salary) from employees as i join i.dept_id = o.dept_id  )-- 

select dept_id , avg(salary) from employees group by dept_id having avg(salary) >(select avg(salary) from employees);


-- find employees who earn more than the avg salary of the it department

-- find the department with the maximum total salary

select department_name,sum(Salary) from employees as e join departments as d on e.dept_id = d.dept_id group by dept_id  order by sum(salary) desc limit 1 ;


select dept_id,sum(salary) as total from employees group by dept_id having total >=all(select sum(salary) as total from employees group by dept_id);


-- find department whose minimum salary is greater than the minimum salary of sales department

SELECT  dept_id , min(salary) as mn from employees group by dept_id having mn >any (select salary from employees as e join departments as d where e.dept_id = d.dept_id and d.dept_name
 = 'sales');










