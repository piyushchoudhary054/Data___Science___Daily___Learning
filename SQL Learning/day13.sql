
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);



-- inner keyworkd if written write on  istedn of where

select c.customer_id, c.customer_name, o.customer_id, o.order_id, o.amount from customers  as c
join orders as o
where c.customer_id = o.customer_id;


select c.customer_id,c.customer_name, o.customer_id, o.order_id , o.amount from customers as c left join orders as o
on c.customer_id = o.customer_id;




select c.customer_id,c.customer_name, o.customer_id, o.order_id , o.amount from customers as c right join orders as o
on c.customer_id = o.customer_id;

-- full outer join will have the  complete data and the values from both the table 


alter table customers  rename column customer_id to cid;

select c.cid,c.customer_name, o.customer_id, o.order_id , o.amount from customers as c natural join orders as o;


-- if in natuaral join there if there is no columsn matching between the two table it will do cartesian with the columnss of second table 
-- it will work into table1 * table 2
--  will act as cross join

use regex;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);


select *  from employee;
-- emp.emp_id,emp.emp_name,emp.manager_id , mangr.emp_id,mangr.emp_name , mangr.salary

select mangr.emp_name, count(*)   from employee as emp
join  employee as mangr 
where  emp.manager_id = mangr.emp_id group by mangr.emp_name;

-- find out how many employees are there for each maanger



