create database hr;
use hr;

# creat table
create table emp_training (
emp_name nvarchar(30),
mobile_no int,
city nvarchar(30)
);

insert into emp_training values('Ravi',547621,'Delhi');
insert into emp_training values('genis',74957,'Chennai');
insert into emp_training values('Donny',748545,'Mumbai');
insert into emp_training values('Shyam',6453485,'Mumbai');
insert into emp_training values('Kish',35468749,'Mumbai');

select * from emp_training;
truncate table emp_training;

drop table emp_training;

create table emp_new (
emp_name nvarchar(30),
mobile_no int primary key,
city nvarchar(30) not null,
sal int check (sal>10000),
dep int default 1
);

insert into emp_new
values
('yash', 123456789,'Bangalore',11000,2);

insert into emp_new
values
('john', 47586938,'Chennai',20000,2);

select * from emp_new;

alter table emp_new
rename column city to city_new;

update new_emp
set dep = 4
where dep = 2;

# delete new_emp where dep = 2;

select * from new_emp
where
sal = 11000;

select count(*) from emp_new;

# join
create table sales
(
prod_id int,
cost int);

create table products 
(
prod_id int,
prod_name varchar(30)
);

insert into sales values (1,10);
insert into sales values (2,45);
insert into sales values (3,63);

insert into products values (1, 'Milk');
insert into products values (2, 'Bread');
insert into products values (3, 'Butter');
insert into products values (1, 'Meat');

select * from sales;
select * from products;

select * from products
where prod_id not in (select prod_id from sales);

select * from products left join sales 
on products.prod_id =  sales.prod_id;





