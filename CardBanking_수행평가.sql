#작업 2
INSERT INTO `Customer` (`cust_jumin`,`cust_name`,`cust_addr`,`cust_birth`,`cust_phnum`,`cust_job`) VALUES ('760121-1234567','정우성','서울','1976-01-21','010-1101-7601','배우');
INSERT INTO `Customer` (`cust_jumin`,`cust_name`,`cust_addr`,`cust_birth`,`cust_phnum`,`cust_job`) VALUES ('750611-1234567','이정재','서울','1975-06-11','010-1102-7506','배우');
INSERT INTO `Customer` VALUES ('890530-1234567','전지현','대전','1989-05-30','jjh@naver.com','010-1103-8905','자영업');
INSERT INTO `Customer` VALUES ('790413-1234567','이나영','대전','1979-04-13','lee@naver.com','010-2101-7904','회사원');
INSERT INTO `Customer` VALUES ('660912-1234567','원빈','대전','1966-09-12','one@naver.com','010-2104-6609','배우');

INSERT INTO `Card` VALUES ('2111-1001-1001','760121-1234567','1011-1001-1001','2020-01-21',1000000,'2020-02-10','check');
INSERT INTO `Card` VALUES ('2041-1001-1002','890530-1234567','1011-1001-1002','2020-06-11',3000000,'2020-06-15','check');
INSERT INTO `Card` VALUES ('2011-1001-1003','790413-1234567','1011-1001-1003','2020-05-30',5000000,'2020-06-25','check');
INSERT INTO `Card` (`card_no`,`cust_jumin`,`card_register_date`,`card_limit_money`,`card_approve_date`,`card_type`) VALUES ('2711-1001-1004','660912-1234567','2020-04-13',1000000,'2020-05-10','credit');
INSERT INTO `Card` VALUES ('2611-1001-1005','750611-1234567','1011-1002-1005','2020-09-12',1500000,'2020-10-10','check');

INSERT INTO `Account` VALUES ('1011-1001-1001','760121-1234567','자유입출금','4160000','Y','2020-01-21 13:00:02');
INSERT INTO `Account` VALUES ('1011-1001-1002','890530-1234567','자유입출금','376000','Y','2020-06-11 13:00:02');
INSERT INTO `Account` VALUES ('1011-1001-1003','790413-1234567','자유입출금','1200000','Y','2020-05-30 13:00:02');
INSERT INTO `Account` VALUES ('1011-2001-1004','660912-1234567','정기적금','1000000','N','2020-04-13 13:00:02');
INSERT INTO `Account` VALUES ('1011-1002-1005','750611-1234567','자유입출금','820000','Y','2020-09-12 13:00:02');

INSERT INTO `Transaction` (`trans_acc_id`,`trans_type`,`trans_message`,`trans_money`,`trans_date`) VALUES ('1011-1001-1001','입금','2월 정기급여',3500000,'2020-02-10 12:36:12');
INSERT INTO `Transaction` (`trans_acc_id`,`trans_type`,`trans_message`,`trans_money`,`trans_date`) VALUES ('1011-1001-1003','출금','ATM 출금',300000,'2020-02-10 12:37:12');
INSERT INTO `Transaction` (`trans_acc_id`,`trans_type`,`trans_message`,`trans_money`,`trans_date`) VALUES ('1011-1001-1002','입금','2월 급여',2800000,'2020-02-10 12:38:12');
INSERT INTO `Transaction` (`trans_acc_id`,`trans_type`,`trans_message`,`trans_money`,`trans_date`) VALUES ('1011-1001-1002','출금','2월 공과금',116200,'2020-02-10 12:39:12');
INSERT INTO `Transaction` (`trans_acc_id`,`trans_type`,`trans_message`,`trans_money`,`trans_date`) VALUES ('1011-1002-1005','출금','ATM 출금',50000,'2020-02-10 12:40:12');


#작업 3-1 고객 테이블을 조회하시오
SELECT * FROM `Customer`;

#작업 3-2 카드 테이블을 조회하시오
SELECT * FROM `Card`;

#작업 3-3 예금계좌 테이블을 조회하시오
SELECT * FROM `Account`;

#작업 3-4 예금 계좌 거래 내역 테이블을 조회하시오
SELECT * FROM `Transaction`;

#작업 3-5 예금잔고가 4000000원 이상 고객에 대한 고객명, 주민번호, 전화번호, 주소를 조회하시오
SELECT 
	C.cust_name,
	C.cust_jumin,
	C.cust_phnum,
	C.cust_addr 
FROM `Customer` AS C
JOIN `Account` AS A ON C.cust_jumin = A.cust_jumin
WHERE acc_balance >= 4000000;
