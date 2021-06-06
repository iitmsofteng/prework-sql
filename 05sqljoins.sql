select * from employees;



-- create another table for joining
create table department(
dept_id int(10),
dept varchar(20),
dept_loc varchar(20)
);

select * from department;

insert into department(dept_id, dept, dept_loc) values(1, 'Content', 'chicago');
insert into department(dept_id, dept, dept_loc) values(2, 'Support', 'new jersey');
insert into department(dept_id, dept, dept_loc) values(3, 'sales', 'boston');
insert into department(dept_id, dept, dept_loc) values(4, 'hr', 'chicago');
insert into department(dept_id, dept, dept_loc) values(5, 'operations', 'new york');

/* inner join */
select e.first_name, e.last_name, d.dept, d.dept_loc
from employees e
inner join department d
on e.dept=d.dept;

/* outer join */
select e.first_name, e.salary, d.dept, d.dept_loc
from employees e
left join department d
on e.dept=d.dept;

/* Right join */
select e.first_name, e.salary, d.dept, d.dept_id
FROM employees e
Right join department d
on e.dept=d.dept;

/* full outer join */
select e.first_name, e.last_name, e.salary, d.dept, d.dept_loc, d.dept_id
FROM employees e
left join department d
on e.dept=d.dept
union
select e.first_name, e.last_name, e.salary, d.dept, d.dept_loc, d.dept_id
FROM employees e
right join department d
on e.dept=d.dept;

/* Cross join or cartesian product*/
select * from employees
cross join department;

