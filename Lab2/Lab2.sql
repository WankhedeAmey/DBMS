drop database if exists db212lab2;
create database db212lab2;
use db212lab2;

drop table mobile_number;
drop table Employees;

create table Employees(
	emp_id varchar(30) primary key,
	first_name varchar(30) not null,
	middle_name varchar(30),
	last_name varchar(30) not null,
	gender enum('M', 'F') not null,
	apartment_name varchar(30) not null,
	street_no int,
	street_name varchar(30) not null,
	city varchar(30) not null,
	state varchar(30) not null,
	zip_code int not null,
	designation varchar(30) not null,
	date_of_birth date not null,
	salary int not null,
	joining_date date not null,
	email_ID varchar(50) not null,
	age int
) engine = innodb;

create table mobile_number(
	contact_number bigint,
	emp_id varchar(30),
	foreign key (emp_id) 
	references Employees(emp_id)
	on delete cascade 
	on update cascade
) engine = innodb;

insert into Employees values('2019XYZ0030', 'Adarsh', null, 'Sharma', 'M', 'A/380', null, 'M.G road', 'Indore', 'M.P.', 452018, 'Team
Lead', '1990-12-19', 80000, '2005-07-01', 'sharma.adrash90@yymail.com', 
(datediff(curdate(), date_of_birth))/365.25);
insert into mobile_number values(7012500001, '2019XYZ0030');
insert into mobile_number values(7710000030, '2019XYZ0030');
insert into mobile_number values(8985232632, '2019XYZ0030');

insert into Employees values('2019XYZ0031', 'Mohit', null, 'Malviya', 'M', 'C/290', 54, 'Vijayanagar', 'Indore', 'M.P.', 452011, 'Developer',
 '1983-03-12', 50000, '2005-08-10', 'mohit_malviya1203@yymail.com', 
(datediff(curdate(), date_of_birth))/365.25);
insert into mobile_number values(8982646300, '2019XYZ0031');

insert into Employees values('2019XYZ0032', 'Amit', 'Kumer', 'Rai', 'M', 'A/181', null, 'Abhinandan Nagar', 'Indore', 'M.P.', 452010, 'HR',
 '1990-12-15', 90000, '2005-09-19', 'amit_rai1990@coolmail.com', 
(datediff(curdate(), date_of_birth))/365.25);
insert into mobile_number values(7012245201, '2019XYZ0032');
insert into mobile_number values(9424075236, '2019XYZ0032');

insert into Employees values('2019XYZ0033', 'Ayushi', null, 'Jain', 'F', 'E-320', null, 'Friganj', 'Ujjain', 'M.P.', 452016, 'Developer',
 '1992-07-01', 30000, '2007-02-05', 'jain_aysuhi1992@coolmail.com', 
(datediff(curdate(), date_of_birth))/365.25);
insert into mobile_number values(7012015121, '2019XYZ0033');
insert into mobile_number values(8985632520, '2019XYZ0033');

insert into Employees values('2019XYZ0034', 'Anand', null, 'Diwedi', 'M', 'A/661', 58, 'Bhavarkuwa', 'Indore', 'M.P.', 452020, 'Tester',
 '1994-10-02', 30000, '2006-04-15', 'anand007@coolmail.com', 
(datediff(curdate(), date_of_birth))/365.25);
insert into mobile_number values(8865263452, '2019XYZ0034');

insert into Employees values('2019XYZ0035', 'Khushboo', null, 'Rathi', 'F', 'C/230', 280, 'Shastri Nagar', 'Ujjain', 'M.P.', 452023, 'Tester',
 '1992-01-05', 30000, '2008-06-20', 'k_rathi12@coolmail.com', 
(datediff(curdate(), date_of_birth))/365.25);
insert into mobile_number values(8458512332, '2019XYZ0035');

select emp_id, concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name from Employees;

select concat(first_name, ' ', last_name) as name from Employees where gender = 'F';

select distinct salary from Employees;

select first_name, last_name from Employees where designation="HR";

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name from Employees where year(joining_date) > 2006;

select emp_id, 
concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name,
concat(apartment_name, coalesce(concat(', ', street_no), ''), ', ', street_name, ', ', city, ', ', state, '- ', zip_code) as address
from Employees
where email_ID like "%@coolmail.com";

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name from Employees where date_of_birth between "1992-01-01" and "1995-01-01";

select sum(salary) from Employees;

select count(*) from Employees where gender='M';

select sum(salary) from Employees;

select max(salary) from Employees;

select count(*) from Employees where designation = "Tester" or designation = "Developer";

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name 
from Employees 
where (datediff(curdate(), joining_date)/365.25) > 12;

select emp_id from Employees where first_name like "A%" and middle_name is null;

select last_name from Employees where last_name not like "C%";

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name
from Employees
where first_name like "___i%";

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name
from Employees
where name like "A%A";

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name
from Employees
order by salary desc limit 3;

insert into mobile_number values(7012501235, '2019XYZ0036');
insert into mobile_number values(7012502091, null);

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name
from Employees, mobile_number
group by contact_number;

select sum(0.01*salary*datediff(curdate(),joining_date)) as bonus
from Employees 
where (datediff(curdate(), joining_date)/365.25) > 12;

-- select emp_id from mobile_number
-- group by emp_id
-- having count(emp_id)>2;

select concat(first_name, coalesce(concat(' ', middle_name), ''), ' ', last_name) as name 
from Employees
where emp_id in (select emp_id from mobile_number
group by emp_id
having count(emp_id)>2);

select sum(0.01*salary*datediff(curdate(), joining_date)) as "Total Bonus"
from Employees
where timestampdiff(year, joining_date, curdate()) > 12;