-- SQL operators
USE dbsqllearn;
select * from employees;

select * from employees where emp_id=104;

-- Logical operators
select * from employees where salary>=50000;

/* emp id divisible by 2 */
select * from employees where emp_id%2=0;
select * from employees where emp_id%2=0 or first_name='matt';

/* special operations */
select * from employees where salary between 20000 and 50000;
select * from employees where last_name like 'Devon';
-- % us the wirld card
select * from employees where last_name like 'De%';
select * from employees where last_name like 'a%' or first_name like 'a%';

select * from employees where salary in (40000,75000);
select distinct(first_name) from employees; 

/* Agreegation operations */
select avg(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select count(*) from employees;

/* GROUP BY clause */
-- add one more column
alter table employees add column dept varchar(20);
select * from employees;

update employees set dept='Support' where emp_id=103;
update employees set dept='Content' where emp_id in (102, 105);
update employees set dept='Tech' where emp_id=104;
select * from employees;

select avg(salary), dept from employees group by dept;
select avg(salary), sum(salary), dept from employees group by dept;
select count(salary), dept from employees group by dept;

-- HAVIG clause
select count(salary), dept from employees group by dept having count(dept) >= 2;

/*  ORDER BY */
select * from employees order by(salary) desc;

/* SQL UNION */
create table product1(category_id int(10), product_name varchar(20));
select * from product1;

insert into product1(category_id, product_name) values(1, 'nokia');
select * from product1;
insert into product1(category_id, product_name) values(2, 'Samsung');
insert into product1(category_id, product_name) values(3, 'hp');
insert into product1(category_id, product_name) values(6, 'nikon');
select * from product1;

create table product2(category_id int(10), product_name varchar(20));
select * from product2;

insert into product2(category_id, product_name) values(1, 'Samsung');
insert into product2(category_id, product_name) values(2, 'lg');
insert into product2(category_id, product_name) values(3, 'hp');
insert into product2(category_id, product_name) values(5, 'dell');
insert into product2(category_id, product_name) values(6, 'apple');
insert into product2(category_id, product_name) values(10, 'playstation');
select * from product2;

select product_name from product1
union
select product_name from product2;

select product_name from product1
union all
select product_name from product2;








