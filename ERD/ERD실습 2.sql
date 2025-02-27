INSERT `Department` VALUES (10,'국어국문학과','051-510-1010');
INSERT `Department` VALUES (11,'영어영문학과','051-510-1011');
INSERT `Department` VALUES (20,'경영학과','051-510-1020');
INSERT `Department` VALUES (21,'경제학과','051-510-1021');
INSERT `Department` VALUES (22,'정치외교학과','051-510-1022');
INSERT `Department` VALUES (23,'사회복지학과','051-510-1023');
INSERT `Department` VALUES (30,'수학과','051-510-1030');
INSERT `Department` VALUES (31,'통계학과','051-510-1031');
INSERT `Department` VALUES (32,'생명과학과','051-510-1032');
INSERT `Department` VALUES (40,'기계공학과','051-510-1040');
INSERT `Department` VALUES (41,'전자공학과','051-510-1041');
INSERT `Department` VALUES (42,'컴퓨터공학과','051-510-1042');

INSERT `Professor` VALUES ('P10101',10,'김유신','750120-1234567','010-1101-1976','kimys@hg.ac.kr','서울');
INSERT `Professor` VALUES ('P10102',10,'계백','740610-1234567','010-1102-1975','gaeback@hg.ac.kr','서울');
INSERT `Professor` VALUES ('P11101',11,'김관창','880529-1234567','010-1103-1989','kwanch@hg.ac.kr','대전');
INSERT `Professor` VALUES ('P11103',11,'김춘추','780412-1234567','010-2101-1979','kimcc@hg.ac.kr','대전');
INSERT `Professor` VALUES ('P11104',11,'이사부','650911-1234567','010-2104-1966','leesabu@hg.ac.kr','대전');
INSERT `Professor` VALUES ('P22110',22,'장보고','780727-1234567','010-3101-1979','jangbg@hg.ac.kr','대구');
INSERT `Professor` VALUES ('P23102',23,'선덕여왕','830614-1234567','010-4101-1984','gueen@hg.ac.kr','대구');
INSERT `Professor` VALUES ('P31101',31,'강감찬','641020-1234567','010-5101-1965','kang@hg.ac.kr','대구');
INSERT `Professor` VALUES ('P31104',31,'신사임당','711127-1234567','010-6101-1972','sinsa@hg.ac.kr','부산');
INSERT `Professor` VALUES ('P40101',40,'이이','910906-1234567','010-7103-1992','leelee@hg.ac.kr','부산');
INSERT `Professor` VALUES ('P40102',40,'이황','881208-1234567','010-7104-1989','hwang@hg.ac.kr','광주');
INSERT `Professor` VALUES ('P40103',42,'송상현','760313-1234567','010-8101-1977','ssh@hg.ac.kr','광주');

INSERT `Lecture` VALUES ('101001','P10101','대학 글쓰기',2,10,'본102');
INSERT `Lecture` VALUES ('101002','P10102','한국어음운론',3,10,'본102');
INSERT `Lecture` VALUES ('101003','P10102','한국현대문학사',3,10,'본103');
INSERT `Lecture` VALUES ('111011','P11103','중세영문학',3,10,'본201');
INSERT `Lecture` VALUES ('111012','P11104','영미시',3,10,'본201');
INSERT `Lecture` VALUES ('231110','P23102','사회복지학개론',1,10,'별관103');
INSERT `Lecture` VALUES ('311002','P31101','통계학의 이해',2,10,'별관303');
INSERT `Lecture` VALUES ('311003','P31104','기초 통계학',3,10,'별관303');
INSERT `Lecture` VALUES ('401019','P40101','기계역학',3,10,'공학관102');
INSERT `Lecture` VALUES ('421012','P42103','데이터베이스',3,10,'공학관102');


INSERT `Student` (`stdNo`,`depNo`,`proNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) VALUES ('20101001',10,'P10101','정우성','760121-1234567','010-1101-7601','서울');
INSERT `Student` (`stdNo`,`depNo`,`proNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) VALUES ('20101002',10,'P10101','이정재','750611-1234567','010-1102-7506','서울');
INSERT `Student` VALUES ('20111011',11,'P11103','전지현','890530-1234567','010-1103-8905','jjh@naver.com','대전');
INSERT `Student` VALUES ('20111013',11,'P11103','이나영','790413-1234567','010-2101-7904','lee@naver.com','대전');
INSERT `Student` VALUES ('20111014',11,'P11104','원빈','660912-1234567','010-2104-6609','one@daum.net','대전');
INSERT `Student` VALUES ('21221010',22,'P22110','장동건','790728-1234567','010-3101-7907','jang@naver.com','대구');
INSERT `Student` VALUES ('21231002',23,'P23102','고소영','840615-1234567','010-4101-8406','goso@daum.net','대구');
INSERT `Student` VALUES ('22311011',21,'P31104','김연아','651021-1234567','010-5101-6510','yuna@daum.net','대구');
INSERT `Student` (`stdNo`,`depNo`,`proNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) VALUES ('22311014',31,'P31104','유재석','721128-1234567','010-6101-7211','부산');
INSERT `Student` (`stdNo`,`depNo`,`proNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) VALUES ('22401001',40,'P40101','강호동','920907-1234567','010-7103-9209','부산');
INSERT `Student` VALUES ('22401002',40,'P40101','조인성','891209-1234567','010-7104-8912','join@gmail.com','광주');
INSERT `Student` VALUES ('22421003',42,'P42103','강동원','770314-1234567','010-8101-7703','dong@naver.com','광주');

INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('20101001','101001','P10101');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('20101001','101002','P10102');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('20111013','111011','P11103');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('21231002','231110','P23102');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('22401001','401019','P40101');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('22401001','421012','P42103');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('20101001','101003','P10102');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('22421003','311003','P31104');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('22421003','421012','P42103');
INSERT `Register` (`stdNo`,`lecNo`,`proNo`) VALUES ('20111013','111012','P11104');


#1.모든 학생의 학생번호, 이름,휴대폰, 학과번호, 학과명 조회하기
SELECT 
	s.`stdNo`,
	s.`stdNAme`,
	d.`depNo`,
	d.`depName`
FROM `student` AS s
JOIN `department` AS d ON s.depNo = d.depNo;

SELECT * FROM `student`;
SELECT * FROM `department`;
#2. 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명 조회하기
SELECT 
	p.`proNo`,
	p.`proName`,
	p.`proHp`,
	p.`depNo`,
	d.`depName`
FROM `professor` AS p
JOIN `department` AS d ON p.depNo = d.depNo;

SELECT * FROM `professor`;
#3. 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하기
SELECT
	l.`lecNo`,
	l.`lecName`,
	p.`proName`,
	p.`proHp`
FROM `lecture` AS l
JOIN `professor` AS p ON l.proNo = p.proNo;

SELECT * FROM `lecture`;
#4. 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명 조회하기
SELECT 
	l.`lecNo`,
	l.`lecName`,
	p.`proNo`,
	p.`proName`,
	p.`proHp`,
	d.`depNo`,
	d.`depName`
FROM `lecture` AS l
JOIN `professor` AS p ON p.proNo = l.proNo
JOIN `department` AS d ON d.depNo = p.depNo;

SELECT * FROM `professor`;

#5. 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명 조회하기
SELECT
	r.`stdNo`,
	s. `stdName`,
	r.`lecNo`,
	l.`lecName`,
	p.`proNo`,
	p.`proName`
FROM `register` AS r
JOIN `professor` AS p ON r.proNo = p.proNo
JOIN `student` AS s ON s.stdNo = r.stdNo
JOIN `lecture` AS l ON l.lecNo = r.lecNo;

SELECT * FROM `register`;
#6. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 임의로 입력하기 (1~100)
UPDATE `register` 
SET `regAttenScore`=FLOOR(RAND() *100) + 1, 
	`regMidScore`=FLOOR(RAND() *100) + 1, 
	`regFinalScore`=FLOOR(RAND() *100) + 1;

SELECT * FROM `register`;
#7. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 모두 더한 평균을 구해 총점에 입력하기
UPDATE `register`
SET `regTotal` = (`regAttenScore` + `regMidScore` + `regFinalScore`)/3;

SELECT * FROM `register`;
#8. 수강 테이블에 총점을 기준으로 A~F 등급을 입력하기
UPDATE `register`
SET `regGrade` =
	CASE
		WHEN `regTotal` >= 90 THEN 'A'
		WHEN `regTotal` >= 80 THEN 'B'
		WHEN `regTotal` >= 70 THEN 'C'
		WHEN `regTotal` >= 60 THEN 'D'
		ELSE 'F'
	END;

#9. 수강 테이블에서 총점이 가장 큰 점수 조회하기
SELECT 
	`regTotal`
FROM `register` 
ORDER BY `regTotal` DESC
LIMIT 1;

#10. 수강 테이블에서 정우성 학생의 총점의 평균을 조회하기
SELECT 
	AVG(`regTotal`) AS '평균'
FROM `register` AS r
JOIN `student` AS s ON r.stdNo = s.stdNo
WHERE `stdName` = '정우성';
