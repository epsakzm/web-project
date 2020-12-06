### 지능웹설계 텀프로젝트

0. clone
```
git clone https://github.com/epsakzm/web-project
```
1. db생성 테이블생성
```
//db 생성
create database board;
//user table
create table if not exists user(
	userID varchar(20) not null,
	userPassword varchar(20),
	userName varchar(20),
	userGender varchar(20),
	userEmail varchar(40)
	address varchar(40)
) default charset=utf8;
//board table
```
create table if not exists user(
	userID varchar(20) not null,
	userPassword varchar(20),
	userName varchar(20),
	userGender varchar(20),
	userEmail varchar(40)
	address varchar(40)
) default charset=utf8;
```
2. java src DAO에서 데이터베이스 연결루트 설정(계정, 비밀번호)
3. ide에서 서버실행(tomcat 9이상)
