create database db212BITSStream;
use db212BITSStream;

create table Albums(
	AlbumID int primary key,
	ArtistName varchar(30) not null,
	AlbumName varchar(30) not null,
	HoursStreamed int default 0,
	Label varchar(20),
	Genre varchar(20),
	ReleaseDate date not null);
create table Artists(
	ArtistID int primary key,
	Name varchar(30) not null,
	ActiveSince date not null,
	RetirementDate date,
	NumberOfFollowers int,
	Nationality varchar(20) not null);
create table Users(
	UserID int,
	UserName varchar(30),
	EmailID varchar(50) unique not null,
	MembershipCategory enum('P', 'F') default 'F',
	primary key (UserID, UserName));

desc Albums;
desc Artists;
desc Users;

alter table Users change MembershipCategory AccountType enum('P', 'F') default 'F';
alter table Artists drop column Nationality;
alter table Albums modify HoursStreamed decimal(6,2) default 0;

show create table Albums;

insert into Albums values(39391, 'Linkin Park', 'A Thousand Suns', 128, 'Warner Bros', 'Rock', '2016/06/17');
insert into Albums values(14573, 'Maroon 5', 'Overexposed', 452, 'A&M', 'Funk', '2016/11/11');	
insert into Albums values(24573, 'Maroon', 'Overexposed', 400, 'A&M', 'Funk', '2016/11/30'); 

insert into Artists values(100, 'Maroon 5', '2007/11/13', NULL, 16000123);
insert into Artists values(101, 'Linkin Park', '2000/02/14', '2017/07/20', 21174672);
insert into Artists values(102, 'Eminem', '2001/01/15', NULL, 14093412);
insert into Artists values(103, 'Coldplay', '2002/05/13', NULL, 18000992);

insert into Users values(10003, 'Anurag Dwivedi', 'adwivedi@gmail.com', 'F');
insert into Users values(10004, 'Sana Kothari', 'sana123@gmail.com', 'P');
insert into Users (UserID, UserName, EmailID) values(10005, 'Vishal Ghosh', 'vishy@gmail.com');

select distinct Label from Albums;

select * from Users where AccountType = 'P';

select * from Albums where ArtistName = 'Maroon 5' and Genre = 'Rock';

update Albums set HoursStreamed = HoursStreamed + 200 where Genre = 'Rock';
select * from Albums;

alter table Artists add column Duration int not null;

delete from Albums where HoursStreamed>400;

select HoursStreamed*1.2, AlbumName from Albums;

update Artists set NumberOfFollowers = NumberOfFollowers+200 where ArtistID = 100;

update Artists set Duration = curdate()-ActiveSince;

select sysdate() from dual;
select curdate() from dual;

-- mysqldump -u csf212 -p db212BITSStream > db212BITSStream.sql

select AlbumName from Albums where genre = 'Rock' or genre = 'Funk';