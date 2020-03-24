DROP DATABASE IF EXISTS db212lab4;
create database db212lab4;
use db212lab4; 

DROP TABLE IF EXISTS OrderBook;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Customer;


create table Book(isbn Varchar(12) Primary key, title Varchar(50) NOT NULL, author Varchar(50) NOT NULL, qty_in_stock integer(10) NOT NULL, price Decimal (6,2) NOT NULL, year_published Integer(4)) engine = innodb;
insert into Book values("A1234","Data Structures and Algorithms","Cormen",5,50.00, 2007);
insert into Book values("A1235","Computer Networks","Stallings",7,500.00,2003);
insert into Book values("A1236","Operating Systems","Stallings",3,800.00,2000);
insert into Book values("A1237","C","Koffman", 10, 255.00, 2009);
insert into Book values("A1238","Applied Mathematics","Chandler", 20, 300.00, 1995);
 
create table Customer(cid Varchar(6) Primary key, cname Varchar(20) NOT NULL , address Varchar(50), age Integer(2)) engine = innodb;
insert into Customer values("c1", "Amar"," 23, M.G. road, Ahmadabad", 20);
insert into Customer values("c2", "Akbar","D-20, Sainivas, Mumbai",19);
insert into Customer values("c3","Pooja","sector no. 23, Vashi, Mumbai",24);
insert into Customer values("c4","Saloni","Hyderabad",22);
insert into Customer values("c5","John","Pune, Shivajinagar",18);
 
create table OrderBook(oisbn Varchar(12), ocid Varchar(6) NOT NULL, qty Integer(10),orderdate date,
Foreign key(oisbn) references Book(isbn) on delete cascade on update cascade, Foreign key(ocid) references Customer(cid) on delete cascade on update cascade, primary key(oisbn, orderdate)) engine = innodb;
 
insert into OrderBook values("A1234","c2",2,'2013-10-01');
insert into OrderBook values("A1234","c1",1,'2012-07-02');
insert into OrderBook values("A1236","c3",2 ,'2013-12-12');
insert into OrderBook values("A1236","c5",4, '2012-12-30');
insert into OrderBook values("A1236","c1",5, '2012-05-14');
insert into OrderBook values("A1238","c4",10, '2012-06-15');

-- Q1
select oisbn from OrderBook group by oisbn having count(*) > 2;

-- Q2
select ocid from OrderBook group by ocid having sum(qty) > 4;

-- Q3
select ocid from OrderBook group by ocid having timestampdiff(year, max(orderdate), curdate()) < 7;
-- OR
select ocid from OrderBook group by ocid having datediff(curdate(), max(orderdate))/365.25 < 7;

-- Q4
select ocid from OrderBook where exists (select * from Book where oisbn = isbn and title = "Operating Systems");

-- Q5
select cname from Customer 
where exists (
	select * from OrderBook 
	where exists (
		select * from Book 
		where oisbn = isbn and title = "Operating Systems"
	) and ocid = cid
) and exists (
	select * from OrderBook 
	where exists (
		select * from Book 
		where oisbn = isbn and title = "Data Structures and Algorithms"
	) and ocid = cid
);

-- Q6
select cid from Customer C1
where not exists (
	select cid from Customer C2
	where exists (
		select ocid from OrderBook
		where exists (
			select * from Book 
			where isbn = oisbn and title = "Operating Systems"
		) and ocid = cid
	) and exists (
		select ocid from OrderBook
		where exists (
			select * from Book 
			where isbn = oisbn and title = "Data Structures and Algorithms"
		) and ocid = cid
	) and C1.cid = C2.cid
);
-- OR
select cid from Customer
where cid not in (
	select cid from Customer
	where exists (
		select ocid from OrderBook
		where exists (
			select * from Book 
			where isbn = oisbn and title = "Operating Systems"
		) and ocid = cid
	) and exists (
		select ocid from OrderBook
		where exists (
			select * from Book 
			where isbn = oisbn and title = "Data Structures and Algorithms"
		) and ocid = cid
	)
);

-- Q7
select distinct ocid from OrderBook
where ocid not in (
	select cid from Customer 
	where not exists (
		select * from OrderBook 
		where exists (
			select * from Book where oisbn = isbn and title = "Operating Systems"
		) and ocid = cid
	) and not exists (
		select * from OrderBook 
		where exists (
			select * from Book where oisbn = isbn and title = "Data Structures and Algorithms"
		) and ocid = cid
	)
);

-- Q8
select distinct ocid from OrderBook
where ocid not in (
	select cid from Customer 
	where exists (
		select * from OrderBook 
		where exists (
			select * from Book where oisbn = isbn and title = "Operating Systems"
		) and ocid = cid
	) and exists (
		select * from OrderBook 
		where exists (
			select * from Book where oisbn = isbn and title = "Data Structures and Algorithms"
		) and ocid = cid
	)
) and ocid not in (
	select cid from Customer 
	where not exists (
		select * from OrderBook 
		where exists (
			select * from Book where oisbn = isbn and title = "Operating Systems"
		) and ocid = cid
	) and not exists (
		select * from OrderBook 
		where exists (
			select * from Book where oisbn = isbn and title = "Data Structures and Algorithms"
		) and ocid = cid
	)
);

-- Q9
select cname from Customer where cid in (select ocid from OrderBook group by ocid having sum(qty) < 4);

-- Q10
select isbn, qty_in_stock from Book b3
where qty_in_stock >= all(
	select qty_in_stock from Book b2
	where not exists (
		select isbn from Book b1
		where qty_in_stock >= all(
			select qty_in_stock from Book
		) and b2.isbn = b1.isbn
	)
) and not exists (
	select isbn from Book b1
	where qty_in_stock >= all(
		select qty_in_stock from Book
	) and b3.isbn = b1.isbn
);