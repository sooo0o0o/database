use studydb;

#날짜 : 2025.01.08
#이름 : 곽혜수
#내용 : 4장 SQL 고급


#실습 4-1
CREATE TABLE `Member` (
		`uid`	VARCHAR(10) PRIMARY KEY,
        `name`	VARCHAR(10) NOT NULL,
        `hp`	VARCHAR(13) UNIQUE NOT NULL,
        `pos`	VARCHAR(10) DEFAULT '사원',
        `dep`	INT,
        `rdate`	DATETIME NOT NULL
        );

INSERT INTO `Member` VALUES ('a101','박혁거세','010-1234-1001','부장',101, NOW());
INSERT INTO `Member` VALUES ('a102','김유신','010-1234-1002','차장',101, NOW());
INSERT INTO `Member` VALUES ('a103','김춘추','010-1234-1003','사원',101, NOW());
INSERT INTO `Member` VALUES ('a104','장보고','010-1234-1004','대리',102, NOW());
INSERT INTO `Member` VALUES ('a105','강감찬','010-1234-1005','과장',102, NOW());
INSERT INTO `Member` VALUES ('a106','이성계','010-1234-1006','차장',103, NOW());
INSERT INTO `Member` VALUES ('a107','정철','010-1234-1007','차장',103, NOW());
INSERT INTO `Member` VALUES ('a108','이순신','010-1234-1008','부장',104, NOW());
INSERT INTO `Member` VALUES ('a109','허균','010-1234-1009','부장',104, NOW());
INSERT INTO `Member` VALUES ('a110','정약용','010-1234-1010','사원',105, NOW());
INSERT INTO `Member` VALUES ('a111','박지원','010-1234-1011','사원',105, NOW());
        

CREATE TABLE `Department` (
		`depNO`	INT PRIMARY KEY,
        `name`	VARCHAR(10) NOT NULL,
        `hp`	VARCHAR(12) NOT NULL
        );

INSERT INTO `Department` VALUES (101,'영업 1부','051-512-1001');
INSERT INTO `Department` VALUES (102,'영업 2부','051-512-1002');
INSERT INTO `Department` VALUES (103,'영업 3부','051-512-1003');
INSERT INTO `Department` VALUES (104,'영업 4부','051-512-1004');
INSERT INTO `Department` VALUES (105,'영업 5부','051-512-1005');
INSERT INTO `Department` VALUES (106,'영업 지원부','051-512-1006');
INSERT INTO `Department` VALUES (107,'인사부','051-512-1007');

CREATE TABLE `Sales` (
		`seq`	INT AUTO_INCREMENT PRIMARY KEY,
        `uid`	VARCHAR(10) NOT NULL,
        `year`	YEAR NOT NULL,
        `month`	INT NOT NULL,
        `sale`	INT
        );


#실습 4-2 데이터 입력하기
INSERT INTO `Sales` VALUES (1,'a101',2018,1,98100);
INSERT INTO `Sales` VALUES (2,'a102',2018,1,136000);
INSERT INTO `Sales` VALUES (3,'a103',2018,1,80100);
INSERT INTO `Sales` VALUES (4,'a104',2018,1,78000);
INSERT INTO `Sales` VALUES (5,'a105',2018,1,93000);

INSERT INTO `Sales` VALUES (6,'a101',2018,2,23500);
INSERT INTO `Sales` VALUES (7,'a102',2018,2,126000);
INSERT INTO `Sales` VALUES (8,'a103',2018,2,18500);
INSERT INTO `Sales` VALUES (9,'a105',2018,2,19000);
INSERT INTO `Sales` VALUES (10,'a106',2018,2,53000);

INSERT INTO `Sales` VALUES (11,'a101',2019,1,24000);
INSERT INTO `Sales` VALUES (12,'a102',2019,1,109000);
INSERT INTO `Sales` VALUES (13,'a103',2019,1,101000);
INSERT INTO `Sales` VALUES (14,'a104',2019,1,53500);
INSERT INTO `Sales` VALUES (15,'a107',2019,1,24000);

INSERT INTO `Sales` VALUES (16,'a102',2019,2,160000);
INSERT INTO `Sales` VALUES (17,'a103',2019,2,101000);
INSERT INTO `Sales` VALUES (18,'a104',2019,2,43000);
INSERT INTO `Sales` VALUES (19,'a105',2019,2,24000);
INSERT INTO `Sales` VALUES (20,'a106',2019,2,109000);

INSERT INTO `Sales` VALUES (21,'a102',2020,1,201000);
INSERT INTO `Sales` VALUES (22,'a104',2020,1,63000);
INSERT INTO `Sales` VALUES (23,'a105',2020,1,74000);
INSERT INTO `Sales` VALUES (24,'a106',2020,1,122000);
INSERT INTO `Sales` VALUES (25,'a107',2020,1,111000);

INSERT INTO `Sales` VALUES (26,'a102',2020,2,120000);
INSERT INTO `Sales` VALUES (27,'a103',2020,2,93000);
INSERT INTO `Sales` VALUES (28,'a104',2020,2,84000);
INSERT INTO `Sales` VALUES (29,'a105',2020,2,180000);
INSERT INTO `Sales` VALUES (30,'a108',2020,2,76000);

#실습 4-3 데이터 조회 연산자
# * = 'all'
# <> = '!='
SELECT *FROM `Member` WHERE `name`='김유신';
SELECT *FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT *FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT *FROM `Member` WHERE `name`!='김춘추';
SELECT *FROM `Member` WHERE `name`<>'김춘추';
SELECT *FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT *FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT *FROM `Member` WHERE `dep` IN (101,102,103);
SELECT *FROM `Member` WHERE `name` LIKE '%신';
SELECT *FROM `Member` WHERE `name` LIKE '김%';
SELECT *FROM `Member` WHERE `name` LIKE '김__';
SELECT *FROM `Member` WHERE `name` LIKE '_성_';
SELECT *FROM `Member` WHERE `name` LIKE '정_';
SELECT *FROM `Sales` WHERE `sale`> 50000;
SELECT *FROM `Sales` WHERE `sale`>= 50000 AND `sale`<100000 AND `month`=1;
SELECT *FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT *FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT *FROM `Sales` WHERE `year` IN(2020);
SELECT *FROM `Sales` WHERE `month` IN(1,2);

#실습 4-4 오름차순 ASC / 내림차순 DESC
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5 투플 개수 제한
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0,3;	#처음 입력한 번호(0) 다음자료 (1) 부터 두번째 번호(3) 만큼 출력
SELECT * FROM `Sales` LIMIT 1,2;
SELECT * FROM `Sales` LIMIT 5,3;
SELECT * FROM `Sales` ORDER BY `sale` DESC LIMIT 3, 5;	#ORDER BY 'sale' 한 후에 LIMIT 된 자료 출력
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year` DESC, `month`, `sale` DESC
LIMIT 5;							#year 로 정렬 후, month, sale 순으로 정렬하고 자료 LIMIT 갯수만큼 출력

#실습 4-6 SQL 내장함수
SELECT SUM(sale) AS `합계` FROM `Sales`;
SELECT AVG(sale) AS `평균` FROM `Sales`;
SELECT MAX(sale) AS `최대값` FROM `Sales`;
SELECT MIN(sale) AS `최소값` FROM `Sales`;

SELECT CEILING(1.2); 		#올림함수
SELECT CEILING(1.8);

SELECT FLOOR(1.2);			#내림함수
SELECT FLOOR(1.8);

SELECT ROUND(1.2);			#반올림
SELECT ROUND(1.8);

SELECT RAND();				#랜덤, 0~1 사이 실수
SELECT CEILING(RAND() * 10);

SELECT COUNT(sale) AS `갯수` FROM `Sales`;
SELECT COUNT(*) AS `갯수` FROM `Sales`;

SELECT LEFT('HelloWorld', 5); 	# 왼쪽부터 5글자
SELECT RIGHT('HelloWorld', 5);	# 오른쪽 부터 5글자
SELECT SUBSTRING('HelloWorld',6,5);		#6번째부터 5글자
SELECT CONCAT('Hello','World');			#글자 합치기
SELECT CONCAT(`uid`,`name`,`hp`) FROM `member` WHERE `uid`='a108';		#테이블값 합치기

SELECT CURDATE();		#current date
SELECT CURTIME();		#current time
SELECT NOW();			#current date + time
INSERT INTO `Member` VALUES ('a112','유관순','010-1234-1012','대리',107,NOW());

#실습 4-7 2018년 1월 매출의 총 합
SELECT SUM(sale) AS '2018 1월 매출' FROM `Sales` WHERE `month`=1 AND `year`=2018;

#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균
SELECT SUM(sale) AS '2019 2월 매출' FROM `Sales` WHERE `month`= 2 AND `year`= 2019 AND `sale`>=50000;
SELECT AVG(sale) AS '2월 매출 평균' FROM `Sales` WHERE `month`= 2 AND `year`= 2019 AND `sale`>=50000;

SELECT * FROM `Sales` WHERE `year`= 2019 AND `sale` >=50000 AND `month` = 2;

#실습 4-9 2020년 전체 매출 가운데 최저, 최고 매출
SELECT * FROM `Sales` WHERE `year`=2020;

SELECT MAX(sale) AS `2020 매출 최대값` FROM `Sales` WHERE `year`=2020;
SELECT MIN(sale) AS `2020 매출 최소값` FROM `Sales` WHERE `year`=2020;

#실습 4-10
#버전이 바뀌면서 전체 범위 그룹이 지원되지 않아서 row#188-189 추가

select @@sql_mode;
set session sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select * from `sales` Group by `uid`;	
select * from `sales` group by `year`;
select * from `sales` group by `uid`, `year`;

select `uid`, count(*) as `건수`  from `sales` group by `uid`;	#각 uid의 sales 건수
select `uid`, sum(sale) as `합계` from `sales` group by `uid`;
select `uid`, avg(sale) as `평균` from `sales` group by `uid`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`;	
select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`
order by `year` asc, `합계` desc;
select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale` >= 50000
group by `uid`, `year`
order by `합계` desc;

#실습 4-11
select `uid`, sum(sale) as `합계` from `sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale` >= 100000	
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;


#4-12 실습 UNION ( 테이블 합치기 )
create table `sales2` like `sales`;
insert into `sales2` select * from `sales`;
update `sales2` set `year` = `year`+ 3;

update `sales` set `year` = `year`- 3;

select * from `sales` union select * from `sales2`;
select * from `sales` where `sale` >= 100000 
union
select * from `sales2` where `sale` >=100000;

select `uid`, `year`, `sale` from `sales`
union
select `uid`, `year` , `sale` from `sales2`;


SELECT `uid`,`year`, SUM(sale) AS `합계`
FROM `Sales`
group by `uid`,`year`
UNION
SELECT `uid`,`year`, SUM(sale) AS `합계`
FROM `Sales2`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;

SELECT * FROM `Sales` INNER JOIN `Member` ON `Sales` .uid = `Member`.uid;
SELECT * from `member` inner join `department` on `member`.dep = `department` .depNo;

SELECT * FROM `SALES` AS A 
JOIN `MEMBER` AS B 
ON A.UID = B.UID;		# row# 249랑 동일하나, 별칭 A, B 를 붙여서 한것 
# row#254 는  USING ('UID')로 대체 가능

SELECT * FROM `MEMBER` AS A 
JOIN `DEPARTMENT` AS B 
ON A.DEP = B.DEPNO; 	# = row#250 , BUT AS 'A', 'B'

SELECT * FROM `SALES` AS A, 
`MEMBER` AS B 
WHERE A.UID = B.UID;		#JOIN 생략 가능?

SELECT * FROM `MEMBER` AS A, 
`DEPARTMENT` AS B 
WHERE A.DEP = B.DEPNO;

SELECT 
A.`SEQ`, A.`UID`, `SALE`, `NAME`, `POS` FROM `SALES` AS A 
JOIN `MEMBER` AS B 
ON A.`UID` = B.`UID`;

SELECT 
A.`SEQ`, A.`UID`, `SALE`, `NAME`, `POS` FROM `SALES` AS A
JOIN `MEMBER` AS B USING (`UID`);

SELECT
A.`SEQ`, A.`UID`,`SALE`, `NAME`, `POS` FROM `SALES` AS A
JOIN `MEMBER` AS B ON A.`UID` = B.`UID`
WHERE `SALE` >= 100000;

SELECT A.`SEQ`, A.`UID`,B.`NAME`,B.`POS`,`YEAR`,SUM(`SALE`) AS `합계` FROM `SALES` AS A
JOIN `MEMBER` AS B ON A.`UID`=B.`UID`
GROUP BY A.`UID`, A.`YEAR` HAVING `합계` >= 100000
ORDER BY A.`YEAR` ASC, `합계` DESC;

SELECT * FROM `SALES` AS A
JOIN `MEMBER` AS B ON A.`UID`=B.`UID`
JOIN `DEPARTMENT` AS C ON B.`DEP` = C.`DEPNO`;

SELECT A.`SEQ`, A.`UID`,A.`SALE`,
B.`NAME`,B.`POS`,
C.`NAME` FROM `SALES` AS A
JOIN `MEMBER` AS B ON A.`UID`=B.`UID`
JOIN `DEPARTMENT` AS C ON B.`DEP` = C.`DEPNO`;

SELECT A.`SEQ`, A.`UID`, A.`SALE`,
B.`NAME`, B.`POS`, 
C.`NAME` FROM `SALES` AS A
JOIN `MEMBER` AS B ON A.`UID` = B.`UID`
JOIN `DEPARTMENT` AS C ON B.`DEP` = C.`DEPNO`
WHERE `SALE` > 100000
ORDER BY `SALE` DESC;

#실습 4-14 외부조인
SELECT * FROM `SALES` AS A LEFT JOIN `MEMBER` AS B ON A.`UID` = B.`UID`;
SELECT * FROM `SALES` AS A RIGHT JOIN `MEMBER` AS B ON A.`UID` = B.`UID`;

SELECT A.`SEQ`, A.`UID`, `SALE`, `NAME`, `POS` FROM SALES AS A
LEFT JOIN MEMBER AS B USING(UID);
SELECT A.`SEQ`, A.`UID`, `SALE`, `NAME`, `POS` FROM SALES AS A
RIGHT JOIN MEMBER AS B USING(UID);


SELECT * FROM `SALES` AS A,
`MEMBER` AS B
WHERE A.`UID` = B.`UID`;			# WHERE 에서 JOIN  적용 


#실습 4-15 모든 직원의 아이디, 이름 ,직급, 부서명 조회
SELECT `UID`, A.`NAME`, `POS`, B.`NAME` 		# NAME 이 중복이기때문에 별칭을 활용해 구분
FROM `MEMBER` AS A
JOIN `DEPARTMENT` AS B
ON A.DEP = B.DEPNO;

#실습 4-16 김유신 직원의 2019년도 매출의 합 조회
SELECT 
SUM(`SALE`) AS `김유신 2019년 매출 합`
FROM `SALES` AS A
JOIN `MEMBER` AS B 
ON A.`UID`= B.`UID`
WHERE `NAME`='김유신' AND `YEAR`= 2019;

#실습 4-17 2019년 50000이상 매출에 대해 직원별 매출의 합이 100000 이상인 직원 이름, 부서명, 직급, 년도, 매출합 조회. (단, DESC)
SELECT 
	B.`NAME`,
	C.`NAME`,
	B.`POS`,
	A.`YEAR`,
	SUM(`SALE`) AS `매출합`
FROM `SALES` AS A
JOIN `MEMBER` AS B ON A.UID = B.UID
JOIN `DEPARTMENT` AS C ON B.DEP = C.DEPNO
WHERE `YEAR`=2019 AND `SALE` >= 50000
GROUP BY A.`UID`
HAVING `매출합` >= 100000
ORDER BY `매출합` DESC;