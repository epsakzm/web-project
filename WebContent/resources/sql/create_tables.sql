create table if not exists board (
	boardID int not null,
	boardTitle varchar(30),
	userID varchar(30),
	createdDate datetime,
	boardContent varchar(4096),
	isAvailable int,
	views long,
	primary key(boardID)
) default charset=utf8;

create table if not exists user(
	userID varchar(20) not null,
	userPassword varchar(20),
	userName varchar(20),
	userGender varchar(20),
	userEmail varchar(20)
	address varchar(20)
) default charset=utf8;