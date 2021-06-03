use dbsqllearn;
select * from employees;
-- add record
insert into employees
(emp_id,first_name,last_name,salary) values
(101, 'Steven', 'King', 1000);

insert into employees
(emp_id,first_name,last_name,salary) values
(102, 'Dean', 'Winchester', 30000);

insert into employees
(emp_id,first_name,last_name,salary) values
(103, 'Matt', 'Devon', 40000);

insert into employees
(emp_id,first_name,last_name,salary) values
(104, 'Julia', 'Aniston', 90000);

insert into employees
(emp_id,first_name,last_name,salary) values
(105, 'Anne', 'Hathaway', 60000);

select * from employees;

/* update command */
update employees set last_name = 'lucifer' where emp_id=102;
update employees set salary = 75000 where emp_id=104;
select * from employees;

/* delete command */
delete from employees where emp_id in (101,103);
select * from employees;

delete from employees where last_name='lucifer'; 
-- you have to remove safe more and relogin
select * from employees;

