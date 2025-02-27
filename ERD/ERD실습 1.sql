#날짜 : 2025/02/24
#이름 : 곽혜수
#내용 : 6장 데이터 모델링

#실습 6-1 
#실습 6-2
INSERT INTO `customer` VALUES ('c101','김유신','010-1234-1001','경남 김해시','2023-01-01');
INSERT INTO `customer` VALUES ('c102','김춘추','010-1234-1002','경남 경주시','2023-01-02');
INSERT INTO `customer` VALUES ('c103','장보고','010-1234-1003','전남 완도군','2023-01-03');
INSERT INTO `customer` VALUES ('c104','강감찬','010-1234-1004','서울시 관악구','2023-01-04');
INSERT INTO `customer` VALUES ('c105','이순신','010-1234-1005','부산시 금정구','2023-01-05');

INSERT INTO `product` VALUES ('1','새우깡','5000','1500','농심');
INSERT INTO `product` VALUES ('2','초코파이','2500','2500','오리온');
INSERT INTO `product` VALUES ('3','포카칩','3600','1700','오리온');
INSERT INTO `product` VALUES ('4','양파링','1250','1800','농심');
INSERT INTO `product` (`prodNo`,`prodName`,`stock`,`company`) VALUES ('5','죠리퐁','2200','농심');

INSERT INTO `order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) VALUES ('c102','3','2','2023-01-01 13:15:10');
INSERT INTO `order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) VALUES ('c101','4','1','2023-01-01 13:15:12');
INSERT INTO `order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) VALUES ('c102','1','1','2023-01-01 13:15:14');
INSERT INTO `order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) VALUES ('c103','5','5','2023-01-01 13:15:16');
INSERT INTO `order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`) VALUES ('c105','2','1','2023-01-01 13:15:18');

#실습 6-3
#모든 주문의 주문번호, 주문한 고객명, 주문한 사웊ㅁ명, 주문수량, 주문일 조회하기
SELECT
	`orderNo`,
	`name`,
	`prodName`,
	`orderCount`,
	`orderDate`
FROM `order` AS o
JOIN `customer` AS c ON o.orderId = c.custId
JOIN `product` AS p ON o.orderProduct = p.prodNo;

#김유신이 주문한 상품의 주문번호, 상품번호, 상품명, 가격, 주문수량, 주문일을 조회하기
SELECT
	`orderNo`,
	`prodNo`,
	`prodName`,
	`price`,
	`orderCount`,
	`orderDate`
FROM `order` AS o
JOIN `product` AS p ON o.orderProduct = p.prodNo
WHERE `orderId` = 'c101';

select 	
    `orderNo`,
    `prodNo`,        
    `prodName`,
    `price`,
    `orderCount`,
    `orderDate`    
 from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where `name`='김유신';

#주문한 상품의 총 주문 금액을 조회하기
SELECT 
	SUM(`price` * `orderCount`)
FROM `Order` AS o
JOIN `Product` AS p ON o.orderProduct = p.prodNo;
#실습 6-4
#실습 6-5
INSERT INTO `bank_customer` VALUES ('730423-1000001','김유신',1,'010-1234-1001','경남 김해시');
INSERT INTO `bank_customer` VALUES ('730423-1000002','김춘추',1,'010-1234-1002','경남 경주시');
INSERT INTO `bank_customer` VALUES ('750423-1000003','장보고',1,'010-1234-1003','전남 완도군');
INSERT INTO `bank_customer` VALUES ('102-12-51094','(주)정보산업',2,'051-500-1004','부산시 부산진구');
INSERT INTO `bank_customer` VALUES ('930423-1000005','이순신',1,'010-1234-1005','서울 종로구');

INSERT INTO `bank_account` VALUES ('101-11-1001','S1','자유저축예금','730423-1000001',1550000,'2011-04-11');
INSERT INTO `bank_account` VALUES ('101-11-1002','S1','자유저축예금','930423-1000005',260000,'2011-05-12');
INSERT INTO `bank_account` VALUES ('101-11-1003','S1','자유저축예금','750423-1000003',75000,'2011-06-13');
INSERT INTO `bank_account` VALUES ('101-12-1001','S2','기업전용예금','102-12-51094',15000000,'2011-07-14');
INSERT INTO `bank_account` VALUES ('101-13-1001','S3','정기저축예금','730423-1000002',1200000,'2011-08-15');

INSERT INTO `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`) VALUES ('101-11-1001',1,50000,'2023-01-01 13:15:10');
INSERT INTO `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`) VALUES ('101-12-1001',2,1000000,'2023-01-02 13:15:12');
INSERT INTO `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`) VALUES ('101-11-1002',3,260000,'2023-01-03 13:15:14');
INSERT INTO `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`) VALUES ('101-11-1002',2,100000,'2023-01-04 13:15:16');
INSERT INTO `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`) VALUES ('101-11-1003',3,75000,'2023-01-05 13:15:18');
INSERT INTO `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`) VALUES ('101-11-1001',1,150000,'2023-01-05 13:15:18');

#실습 6-6
#모든 고객의 고객번호, 이름, 연락처, 계좌번호, 계좌상품명, 현재잔액 조회하기
SELECT 
	`c_no`,
	`c_name`,
	`c_phone`,
	`a_no`,
	`a_item_name`,
	`a_balance`
FROM `bank_customer` AS c
JOIN `bank_account` AS a ON c.c_no = a.a_c_no;

#이순신 고객명으로 모든 거래내역 중 거래구분, 거래금액, 거래날짜를 조회하기
SELECT
	`t_dist`,
	`t_amount`,
	`t_datetime`
FROM `bank_account` AS a
join `bank_customer` AS c ON a.a_c_no = c.c_no
JOIN `bank_transaction` AS t ON a.a_no = t.t_a_no
WHERE `c_name` = '이순신';

#개인고객 중 현재 잔액이 가장 큰 고객의 주민번호, 고객명, 현재잔액, 계좌개설일을 조회하기
SELECT
	`c_no`,
	`c_name`,
	`a_balance`,
	`a_open_date`
FROM `bank_customer` AS c
JOIN `bank_account` AS a ON c.c_no = a.a_c_no
WHERE `c_dist` = 1
ORDER BY `a_balance` DESC
LIMIT 1;

#실습 6-7
#실습 6-8
INSERT INTO `Student` VALUES ('20201011','김유신','010-1234-1001',3,'경남 김해시');
INSERT INTO `Student` VALUES ('20201122','김춘추','010-1234-1002',3,'경남 경주시');
INSERT INTO `Student` VALUES ('20210213','장보고','010-1234-1003',2,'전남 완도군');
INSERT INTO `Student` VALUES ('20210324','강감찬','010-1234-1004',2,'서울 관악구');
INSERT INTO `Student` VALUES ('20220415','이순신','010-1234-1005',1,'서울 종로구');

INSERT INTO `Lecture` VALUES (101,'컴퓨터과학 개론',2,40,'본301');
INSERT INTO `Lecture` VALUES (102,'프로그래밍 언어',3,52,'본302');
INSERT INTO `Lecture` VALUES (103,'데이터베이스',3,56,'본303');
INSERT INTO `Lecture` VALUES (104,'자료구조',3,60,'본304');
INSERT INTO `Lecture` VALUES (105,'운영체제',3,52,'본305');

INSERT INTO `register` (`regStdNo`,`regLecNo`,`regMidScore`,`regFinalScore`) VALUES ('20220415',101,60,30);
INSERT INTO `register` (`regStdNo`,`regLecNo`,`regMidScore`,`regFinalScore`) VALUES ('20210324',103,54,36);
INSERT INTO `register` (`regStdNo`,`regLecNo`,`regMidScore`,`regFinalScore`) VALUES ('20201011',105,52,28);
INSERT INTO `register` (`regStdNo`,`regLecNo`,`regMidScore`,`regFinalScore`) VALUES ('20220415',102,38,40);
INSERT INTO `register` (`regStdNo`,`regLecNo`,`regMidScore`,`regFinalScore`) VALUES ('20210324',104,56,32);
INSERT INTO `register` (`regStdNo`,`regLecNo`,`regMidScore`,`regFinalScore`) VALUES ('20210213',103,48,40);

#실습 6-9
#이번 학기에 수강신청 하지 않은 학생의 학번, 이름, 연락처, 학년을 조회하기
SELECT
	`stdNo`,
	`stdName`,
	`stdHp`,
	`stdYear`
FROM `Student` AS s
LEFT JOIN `register` AS r ON s.stdNo = r.regStdNo
WHERE `regStdNo` IS NULL;

#중간고사 점수와 기말고사 점수의 총합을 구하고 등급을 구하기
SELECT
	#`regStdNo` , `regMidScore` -> 상식적으로, 성적 조회시 필요한 정보
	`regMidScore`,
	`regFinalScore`,
	`regMidScore`+ `regFinalScore` AS `총합`,
case
	when(`regMidScore` + `regFinalScore` >= 90) then 'A'
	when(`regMidScore` + `regFinalScore` >= 80) then 'B'
	when(`regMidScore` + `regFinalScore` >= 70) then 'C'
	when(`regMidScore` + `regFinalScore` >= 60) then 'D'
	ELSE 'F'
END #case .. end : case 구문 시작~ 끝
AS `등급`
FROM `Register`;
	
#2학년 학생의 학번, 이름, 학년, 수강강좌명, 중간점수,기말점수, 총합, 등급을 조회하기
SELECT
	`stdNo`,
	`stdName`,
	`stdYear`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS s
JOIN `Register` AS r ON s.stdNo = r.regStdNo
JOIN `Lecture` AS l ON r.regLecNo = l.lecNo
WHERE `stdYear` = 2;