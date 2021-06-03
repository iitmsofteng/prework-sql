use dbsqllearn;
-- CREATE
create table employees(
emp_id int(10) not null,
first_name varchar(20),
last_name varchar(20),
salary int(10),
primary key(emp_id)
);

select * from employees;

-- ALTER
alter table employees ADD COLUMN contact int(10);

-- RENAME
alter table employees RENAME COLUMN contact to job_code;

-- TRUNCATE
truncate table employees;

-- DROP
drop table employees;

