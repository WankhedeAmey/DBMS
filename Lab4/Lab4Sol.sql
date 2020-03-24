

 1.

 select oisbn from OrderBook group by oisbn having count(*) >2;

 2.

 select ocid, qty from OrderBook group by ocid having sum(qty) > 4;

 3.

 select ocid from OrderBook group by ocid having min(timestampdiff(year, orderdate, curdate())) < 7;


4.

select ocid from OrderBook where EXISTS 
	(select isbn from Book where 
		title = "Operating Systems" and 
			OrderBook.oisbn = Book.isbn );

5.

select cname from Customer where EXISTS
	(select ocid from OrderBook where EXISTS 
		(select isbn from Book where 
			title = "Operating Systems" and 
				OrderBook.oisbn = Book.isbn) and 
					OrderBook.ocid = Customer.cid)
	and EXISTS
	(select ocid from OrderBook where EXISTS 
		(select isbn from Book where 
			title = "Data Structures and Algorithms" and 
				OrderBook.oisbn = Book.isbn) and 
					OrderBook.ocid = Customer.cid);



6.



select ocid from OrderBook where Not EXISTS(

	select * from Customer where EXISTS
		(select ocid from OrderBook where EXISTS 
			(select isbn from Book where 
				title = "Operating Systems" and 
					OrderBook.oisbn = Book.isbn) and 
						OrderBook.ocid = Customer.cid)

		and EXISTS
		(select ocid from OrderBook where EXISTS 
			(select isbn from Book where 
				title = "Data Structures and Algorithms" and 
					OrderBook.oisbn = Book.isbn) and 
						OrderBook.ocid = Customer.cid)

		and OrderBook.ocid = Customer.cid);

7.


select distinct ocid from OrderBook where ocid not in
	(select ocid from OrderBook where oisbn not in
		(select isbn from Book where
			Book.title = "Operating Systems")
	and oisbn not in
		(select isbn from Book where 
			Book.title = "Data Structures and Algorithms"));





8.

select ocid from OrderBook where ocid in
	(select ocid from OrderBook where Not EXISTS(
		select * from Customer where EXISTS
			(select ocid from OrderBook where EXISTS 
				(select isbn from Book where 
					title = "Operating Systems" and 
						OrderBook.oisbn = Book.isbn) and 
							OrderBook.ocid = Customer.cid)
			and EXISTS
			(select ocid from OrderBook where EXISTS 
				(select isbn from Book where 
					title = "Data Structures and Algorithms" and 
						OrderBook.oisbn = Book.isbn) and 
							OrderBook.ocid = Customer.cid)
			and OrderBook.ocid = Customer.cid))
	and ocid in 
	(select distinct ocid from OrderBook where ocid not in
		(select ocid from OrderBook where oisbn not in
			(select isbn from Book where
				Book.title = "Operating Systems")
		and oisbn not in
			(select isbn from Book where 
				Book.title = "Data Structures and Algorithms")));

9.


select cname from Customer where cid in(
	select ocid from OrderBook group by ocid 
		having sum(qty) < 4);

10.


select isbn, qty_in_stock from Book where
	isbn in
		(select isbn from Book where 
			isbn not in (
				select isbn from Book where 
					qty_in_stock >= all(select qty_in_stock from Book)))
	and qty_in_stock >= all(
		select qty_in_stock from Book where 
			isbn not in (
				select isbn from Book where 
					qty_in_stock >= all(select qty_in_stock from Book)));

