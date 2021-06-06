/*  Create a database */
create database bank;
use bank;

/* Create table -- bank details -- */
create table bank_details(
product char(10),
quantity int,
price real,
purchase_cost decimal(6,2),
estimated_sale_price float
);

select * from bank_details;

/* data types of table */
describe bank_details;

/* Insert two records inot Bank_details */

insert into bank_details values('parycard',3,330,8008,9009);
insert into bank_details values('paypoints',4,200,8000,6800);

select * from bank_details;

/* Add a column: Geo_Location */
alter table bank_details add geo_location varchar(20);
select * from bank_details;

-- what is the value of the geo_locaiton for product: "Paycard"
select product, geo_location from bank_details where product='paycard';

-- how many characters does the prodcut: "paycard" haver in bank_details table
select char_length(product) from bank_details where product='paycard';

-- alter the product field from char to varchar in bank_details
alter table bank_details modify product varchar(10);
describe bank_details;








