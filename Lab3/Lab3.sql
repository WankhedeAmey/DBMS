drop database if exists db212lab3;
create database db212lab3;
use db212lab3;

drop table ORDERBOOK;
drop table BOOK;
drop table CUSTOMER;

create table BOOK (
	isbn varchar(12) primary key,
	title varchar(50) not null,
	author varchar(50) not null,
	qty_in_stock int(10) not null,
	price decimal(6,2) not null,
	pubyear int(4)
) engine = innodb;

INSERT INTO BOOK VALUES ("A1234", 
"Data Structures and Algorithms",
"Cormen",
5,
350.00,
2007);

INSERT INTO BOOK VALUES ("A1235", 
"Computer Networks",
"Stallings",
7,
500.00,
2003);

INSERT INTO BOOK VALUES ("A1236", 
"Operating Systems",
"Stallings",
3,
800.00,
2000);

INSERT INTO BOOK VALUES ("A1237", 
"C",
"Koffman",
10,
255.00,
2009);

INSERT INTO BOOK VALUES ("A1238", 
"Applied Mathematics",
"Chandler",
20,
300.00,
1995);

create table CUSTOMER (
	cid varchar(6) primary key,
	cname varchar(20) not null,
	address varchar(50),
	age int(2)
) engine = innodb;

INSERT INTO CUSTOMER VALUES (
"c1", 
"Amar",
"23 M.G. road Ahmadabad",
20
);

INSERT INTO CUSTOMER VALUES (
"c2", 
"Akbar",
"D-20, Sainivas, Mumbai",
19
);

INSERT INTO CUSTOMER VALUES (
"c3", 
"Pooja",
"sector no. 23, Vashi, Mumbai",
24
);

INSERT INTO CUSTOMER VALUES (
"c4", 
"Saloni",
"Hyderabad",
22
);

INSERT INTO CUSTOMER VALUES (
"c5", 
"John",
"Pune, Shivajinagar",
18
);

create table ORDERBOOK (
	oisbn varchar(12),
	ocid varchar(6),
	qty int(10) not null,
	order_date date,
	foreign key (oisbn) references BOOK(isbn) on delete cascade on update cascade,
	foreign key (ocid) references CUSTOMER(cid) on delete cascade on update cascade,
	unique (oisbn, order_date)
) engine = innodb;

-- use "show create table ORDERBOOK" to set constraint names

INSERT INTO ORDERBOOK VALUES (
"A1234", 
"c2",
2,
"2013-10-01"
);

INSERT INTO ORDERBOOK VALUES (
"A1234", 
"c1",
21
"2012-07-02"
);

INSERT INTO ORDERBOOK VALUES (
"A1236", 
"c3",
2,
"2013-12-12"
);

INSERT INTO ORDERBOOK VALUES (
"A1236", 
"c5",
4,
"2012-12-30"
);

INSERT INTO ORDERBOOK VALUES (
"A1236", 
"c1",
5,
"2012-05-14"
);

INSERT INTO ORDERBOOK VALUES (
"A1238", 
"c4",
10,
"2012-06-15"
);


-- Queries starts here

INSERT INTO ORDERBOOK VALUES (
"A1238", 
"c6",
10,
"2012-06-15"
);

insert into ORDERBOOK values('A1236','c5',6,'2012-04-30');

-- This will give error:
insert into ORDERBOOK values('A1234','c1',4,'2013-10-01');

delete from ORDERBOOK where ocid = 'c5';

delete from BOOK where isbn = 'A1234';

SHOW CREATE TABLE ORDERBOOK

UPDATE BOOK SET isbn='A1239' WHERE isbn='A1238';

alter table ORDERBOOK 
add constraint 
fk1 foreign key (oisbn) references BOOK(isbn) 
on delete cascade on update cascade;