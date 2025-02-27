#날짜 : 2025.01.13
#이름 : 김철학
#내용 : SQL 연습문제 1

#실습 1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
delete from mysql.user where user = 'shop';
delete from mysql.db where user = 'shop';
flush privileges;

create user 'shop'@'%' identified by '1234';
grant all privileges on shop.*to 'shop'@'%';
flush privileges;

#실습 1-2
use `Shop`;
create table `customer` (
	`custId`VARCHAR(10) primary key,
    `name`	VARCHAR(10) not null,
    `hp` 	VARCHAR(13) , #default null,
    `addr` 	VARCHAR(100), #default null,
    `rdate`	DATE not null
    );
create table `product` (
	`prodNo` 	INT	primary key,
    `prodName`	VARCHAR(10) not null,
    `stock`		int not null default 0,
    `price`		int , #default null,
    `company`	varchar(20) not null
    );
create table `order` (
	`orderNo`	int primary key auto_increment,
    `orderId`	varchar(10) not null,
    `orderProduct`	int not null,
    `orderCount`	int not null default 1,
    `orderDate`		datetime not null
    );
#실습 1-3
insert into `customer` values ('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into `customer` values ('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `customer` values ('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
insert into `customer` values ('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `customer` set `custId`='c105', `name`='이성계', `rdate`='2022-01-05';
# insert into `customer` (``,``,``) values ('','','');
insert into `customer` values ('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `customer` set `custId`='c107', `name`='허준', `rdate`='2022-01-07';
# insert into `customer` values ('','','null','null','');
insert into `customer` values ('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into `customer` values ('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into `customer` values ('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into `product` values ('1','새우깡',5000,1500,'농심');
insert into `product` values (2,'초코파이',2500,2500,'오리온');
insert into `product` values (3,'포카칩',3600,1700,'오리온');
insert into `product` values (4,'양파링',1250,1800,'농심');
insert into `product` set `prodNo`=5, `prodName`='죠리퐁',`stock`=2200,`company`='크라운';
insert into `product` values (6,'마가렛트',3500,3500,'롯데');
insert into `product` values (7,'뿌셔뿌셔',1650,1200,'오뚜기');

insert into `order` values (1,'c102',3,2,'2022-07-01 13:15:10'); #now() 입력 가능
insert into `order` values (2,'c101',4,1,'2022-07-01 14:16:11');
insert into `order` values (3,'c108',1,1,'2022-07-01 17:23:18');
insert into `order` values (4,'c109',6,5,'2022-07-02 10:46:36');
insert into `order` values (5,'c102',2,1,'2022-07-03 09:15:37');
insert into `order` values (6,'c101',7,3,'2022-07-03 12:35:12');
insert into `order` values (7,'c110',1,2,'2022-07-03 16:55:36');
insert into `order` values (8,'c104',2,4,'2022-07-04 14:23:23');
insert into `order` values (9,'c102',1,3,'2022-07-04 21:54:34');
insert into `order` values (10,'c107',6,1,'2022-07-05 14:21:03');

#실습 1-4 고객 테이블에 존재하는 모든 속성 조회하기
select * from `customer`; 

#실습 1-5 고객 테이블에서 고객 아이디, 이름, 휴대폰 번호 조회하기
select `custId`,`name`,`hp` from `customer`;

#실습 1-6 제품 테이블에 존재하는 모든 속성 조회하기
select * from `product`;

#실습 1-7 제품 테이블에서 제조업체 조회하기
select `company` from `product`;

#실습 1-8 제품 테이블에서 제조업체를 중복 없이 조회하기
select distinct `company` from `product`;

#실습 1-9 제품 테이블에서 제품명과 단가 조회하기
select `prodName`,`price` from `product`;

#실습 1-10 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 '조정단가'로 출력하기 *sum 없이 바로 int 덧셈 가능*
select `prodName`, `price`+500 as '조정단가' from `product`;

#실습 1-11 제품 테이블에서 오리온이 제조한 제품의 제품명, 재고량, 단가 조회하기
select `prodName`,`stock`,`price` from `product` where `company` = '오리온';

#실습 1-12 주문 테이블에서 c102 고객이 주문한 주문 제품, 수량, 주문일자 조회하기
select `orderProduct`,`orderCount`,`orderDate` from `order` where `orderId` = 'c102';

#실습 1-13 주문 테이블에서 c102 고객이 2개이상 주문한 주문제품, 수량, 주문일자 조회하기
select `orderProduct`,`orderCount`,`orderDate` from `order` where `orderId` = 'c102' AND `orderCount`>=2;

#실습 1-14 제품 테이블에서 단가가 1000원 이상 2000원 이하인 제품을 조회하기
select * from `product` where `price` >= 1000 and `price`<= 2000;
select * from `product` where `price` between 1000 and 2000;

#실습 1-15 고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회하기
select `custId`,`name`,`hp`,`addr` from `customer` where `name` like '김%';

#실습 1-16 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회하기
select `custId`,`name`,`hp`,`addr` from `customer` where `name` like '__';

#실습 1-17 고객 테이블에서 휴대폰 번호가 입력되지 않은 고객 조회하기
select * from `customer` where `hp` is null;

#실습 1-18 고객 테이블에서 주소가 입력된 고객 조회하기
select * from `customer` where `addr` is not null;

#실습 1-19 고객 테이블에서 가입일을 내림차순으로 정렬하여 고객 조회
select * from `customer` order by `rdate` desc;

#실습 1-20 주문 테이블에서 수량이 3개 이상인 주문내용 조회
select * from `order` 
where `ordercount` >= 3 
order by `orderCount` desc , `orderNo` asc; 

#실습 1-21 제품 테이블에서 모든 제품의 단가 평균 조회
select avg(`price`) from product;

#실습 1-22 농심에서 제조한 제품의 재고량 합계 조회
select sum(`stock`) as `재고량합계` from `product` where `company` = '농심';

#실습 1-23 고객 테이블에 등록된 고객 수 조회
select count(*) as `고객수` from `customer`;

#실습 1-24 제품 테이블에서 제조업체의 수 조회
select count(distinct `company`) as `제조업체수` from `product`;

#실습 1-25 주문 테이블에서 주문 제품별 수량의 합계 조회
select `orderProduct` as `주문 상품번호` , sum(`orderCount`) as `총 주문수량` from `order` group by `orderProduct` order by `orderProduct` asc;

#실습 1-26 제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가 조회
select `company` as `제조업체`, 
count(*) as `제품수`, 
max(`price`) as `최고가` from `product` 
group by `company` 
order by `제조업체` asc;

#실습 1-27 제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 갯수와 제품중 가장 비싼 단가 조회
select `company` as `제조업체`, 
count(*) as `제품수`, 
max(`price`) as `최고가` from `product` 
group by `company` having `제품수` =2
order by `제조업체`;

#실습 1-28 주문 테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 조회하기
select `orderProduct` , 
	`orderId`, 
    sum(`orderCount`) as `총 주문수량` from `order` 
    group by `orderProduct`, `orderId`
    order by `orderProduct` asc;

#실습 1-29 c102 고객이 주문한 제품의 이름 조회하기
select a.orderId, b.prodName from `order` as a 
JOIN `product` as b
ON a.orderProduct = b.prodNo
WHERE `orderId` = 'c102';

select * from `order`;

#실습 1-30 주문 일자가 7월 3일인 고객의 아이디, 이름, 상품명, 그리고 주문 날짜시간 조회하기
select 
	`orderId` , 
    `name`, 
    `prodName`, 
	`orderDate` from `order` as a
join `customer` as b
on a.orderId = b.custId
join `product` as c
on a.orderproduct = c.prodNo
where substr(`orderDate`, 1,10) = '2022-07-03';
