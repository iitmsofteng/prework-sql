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

insert into bank_details values('paycard',3,330,8008,9009);
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

-- Alter prouduc var length
alter table bank_details modify product varchar(6); #this will error out as the data in the table is beyond 6.
alter table bank_details modify product varchar(9);
describe bank_details;

-- Cate a table named Bank_holidays
create table bank_holidays(
Holiday date,				# only date
Start_time datetime,		# hours and minutes
End_time timestamp			# hours, minutes and timezone
);
describe bank_holidays;

-- renmae columns to lower case
alter table bank_holidays rename column Holiday to holiday;
describe bank_holidays;
alter table bank_holidays rename column Start_time to start_time;
alter table bank_holidays rename column End_time to end_time;
describe bank_holidays;

-- insert data to bank_holidays
insert into bank_holidays values(
current_date(),
current_date,
current_date()
);
select * from bank_holidays;

-- postpone the holiday to one more day
update bank_holidays set holiday = date_add(holiday, Interval 1 day);
select * from bank_holidays;

-- set end_time to european time zone
update bank_holidays set end_time = utc_timestamp();
select * from bank_holidays;

-- display prodcut as new product
select product as new_product from bank_details;

-- display only one record
select * from bank_details limit 1;

-- display the first five characters of the Geo_location fiedl of Bank_details
update bank_details set geo_location = 'New York' where product = 'paycard';
update bank_details set geo_location = 'New Jercy' where product = 'paypoints';
select geo_location from bank_details;
select substr(geo_location,1,5) from bank_details;



# # PART 2 - Cricket dataset
-- Import cricket_1 and cricket_2 csv file to world database using "table data import wizard".
-- this represent test match 1 and 2.
-- the wizard will automatically creat the table if does not exist.

use world;
select * from cricket_1;
select * from cricket_2;

-- Q1: find all players who were present in the test match 1 as well as in match 2
select * from cricket_1
union
select * from cricket_2;

select Player_Name from cricket_1
union	# union will remove duplicates
select Player_Name from cricket_2;

-- Q2: find players from test match 1 having popularity higher than the average popularity
select * from cricket_1;
# average
select avg(Popularity) from cricket_1;
# manual way to find players above avg popularity
select Player_Name, Popularity from cricket_1 where Popularity > 9.8333;
# combining both together
select Player_Name, Popularity from cricket_1 where Popularity > (select avg(Popularity) from cricket_1);

-- Q3: find player_id and player name that are common in the test match 1 and test match 2
select c1.Player_Id, c1.Player_Name, c2.Player_Id, c2.Player_Name
from cricket_1 c1
INNER JOIN cricket_2 c2
ON c1.Player_Id = c2.Player_Id; 

# alternative is intersection
select player_id, player_name from cricket_1 where player_id in (
select player_id from cricket_2
);

-- Q4: Retrieve palyer_id, runs, and player_name from cricket_1 and cricket_2 and display the player_id of the players where runs more they averate runs
select * from cricket_2;

select avg(Runs) from cricket_1;
select avg(runs) from cricket_2;

select player_id, player_name, runs from cricket_1 where cricket_1.runs > (select avg(runs) from cricket_2)
union
select player_id, player_name, runs from cricket_2 where cricket_2.runs > (select avg(runs) from cricket_2);

-- Q5: players from cricket_1 for runs greater than 50
select player_id, player_name, runs from cricket_1 where runs > 50;

-- q6: find all in cricket_1 where player name start with 'y' and end with 'v'
select player_name from cricket_1 where player_name like 'y%v'; # % represents one or more characters

-- Q7: find all in cricket_1 where player name does not end with 't'
select player_name from cricket_1 where player_name not like '%t';

# # next port use dataset: new_cricket.csv
select * from new_cricket;

-- Q11: Extract the player_id and name where charima value i null
select * from new_cricket where charisma is null;
select player_id, player_name from new_cricket where charisma is null;

-- Q12: seperate all player id to single numeric data
select player_id, substr(player_id, 3) from new_cricket;

-- Q13: find players where charisma is greater than 25
select player_id, player_name, charisma from new_cricket where charisma > 25;



# # Part 3  Dataset = churn1.csv
-- Q16: count frequency of value in the "Agreement" column
select * from churn1;
select agreement, count(agreement) from churn1 group by agreement;

-- Q17: Rename table churn1 to churn_details
rename table churn1 to churn_details;

-- Q18: add new column new_Amount that contacins the sum of TotalAmount and MonthlyServiceCharges
alter table churn_details
add column new_amount float;
select * from churn_details;

update churn_details set new_amount = (totalamount + monthlyservicecharges);
select * from churn_details;

-- Q19: Rename column new_amoutn to Amount
alter table churn_details
rename column new_amount to amount;
select * from churn_details;

# alternative 
alter table churn_details change new_amount amount float;

-- Q20: drop the column "amount"
alter table churn_details drop column amount;
select * from churn_details;

-- Q21: get cusomterd, internet connection and gender from the churn_details where internetconnection has 'i'
select customerid, internetconnection, gender from churn_details;
describe churn_details;
select customerid, internetconnection, gender from churn_details where internetconnection like '_i%'; # second position is i. _ is for any character once.

# can we group by gender
select customerid, internetconnection, gender, count(customerid) from churn_details where internetconnection like '_i%' group by gender;

-- Q22: find the records where the tenure is 6x where x is any number
select * from churn_details where tenure like '6_';

select count(*) from churn_details;









