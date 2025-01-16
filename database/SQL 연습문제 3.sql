#실습 3-1
USE `COLLEGE`;


#실습 3-2
create table `Student` (
						`stdNo` 	CHAR(8) NOT NULL PRIMARY KEY,
						`stdName`	VARCHAR(20) NOT NULL,
                        `stdHp` 	CHAR(13) NOT NULL,
                        `stdYear` INT NOT NULL,
                        `stdAddress` VARCHAR(100) DEFAULT NULL
                        );
CREATE TABLE `Lecture` (
						`lecNo` INT NOT NULL PRIMARY KEY,
						`lecName` VARCHAR(20) NOT NULL,
						`lecCredit` INT NOT NULL,
						`lecTime` INT NOT NULL,
						`lecClass` VARCHAR(10) DEFAULT NULL
						);
create table `Register` (
						`regStdNo` 	CHAR(8) NOT NULL,
						`regLecNo`	INT NOT NULL,
                        `regMidScore` 	INT DEFAULT NULL,
                        `regFinalScore` INT DEFAULT NULL,
                        `regTotalScore` INT DEFAULT NULL,
                        `regGrade` CHAR(1) DEFAULT NULL
                        );

#실습 3-3
INSERT INTO `Student` VALUES ('20201016','김유신','010-1234-1001',3,'NULL');
INSERT INTO `Student` VALUES ('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326','강감찬','010-1234-1004',2,'서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416','이순신','010-1234-1005',1,'부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521','송상현','010-1234-1006',1,'부산시 동래구');

insert into `Lecture` values (159,'인지행동심리학',3,40,'본304');
insert into `Lecture` values (167,'운영체제론',3,25,'본805');
insert into `Lecture` values (234,'중급 영문법',3,20,'본201');
insert into `Lecture` values (239,'세법개론',3,40,'본204');
insert into `Lecture` values (248,'빅데이터 개론',3,20,'본801');
insert into `Lecture` values (253,'컴퓨팅사고와 코딩',2,10,'본802');
insert into `Lecture` values (349,'사회복지 마케팅',2,50,'본301');

drop table `Register`;

insert into `Register` set `regStdNo`='20201126', `regLecNo`='234';
insert into `Register` set `regStdNo`='20201016', `regLecNo`='248';
insert into `Register` set `regStdNo`='20201016', `regLecNo`='253';
insert into `Register` set `regStdNo`='20201126', `regLecNo`='239';
insert into `Register` set `regStdNo`='20210216', `regLecNo`='349';
insert into `Register` set `regStdNo`='20210326', `regLecNo`='349';
insert into `Register` set `regStdNo`='20201016', `regLecNo`='167';
insert into `Register` set `regStdNo`='20220416', `regLecNo`='349';


#실습 3-4
select * from `Lecture`;


#실습 3-5
select * from `Student`;


#실습 3-6
select * from `Register`;


#실습 3-7
select * from `Student` where `stdYear` = 3;


#실습 3-8
select * from `Lecture` where `lecCredit`=2;


#실습 3-9 중간고사, 기말고사 점수 입력 후 조회
update `Register` set `regMidScore` = 36, `regFinalScore` = 42 where `regStdNo`='20201126' and `regLecNo` = 234; 
update `Register` set `regMidScore` = 24, `regFinalScore` = 62 where `regStdNo`='20201016' and `regLecNo` = 248; 
update `Register` set `regMidScore` = 28, `regFinalScore` = 40 where `regStdNo`='20201016' and `regLecNo` = 253; 
update `Register` set `regMidScore` = 37, `regFinalScore` = 57 where `regStdNo`='20201126' and `regLecNo` = 239; 
update `Register` set `regMidScore` = 28, `regFinalScore` = 68 where `regStdNo`='20210216' and `regLecNo` = 349; 
update `Register` set `regMidScore` = 16, `regFinalScore` = 65 where `regStdNo`='20210326' and `regLecNo` = 349; 
update `Register` set `regMidScore` = 18, `regFinalScore` = 38 where `regStdNo`='20201016' and `regLecNo` = 167; 
update `Register` set `regMidScore` = 25, `regFinalScore` = 58 where `regStdNo`='20220416' and `regLecNo` = 349; 

select * from `register`;
delete from `register` where `regMidscore` = 36;


#실습 3-10 총점과 등급을 입력 후 조회
update `Register` set 
					`regTotalScore` = `regMidScore`+`regFinalScore`,
                    `regGrade` = if(`regTotalScore` >= 90, 'A',
								if(`regTotalScore` >= 80, 'B',
                                if(`regTotalScore` >= 70, 'C',
                                if(`regTotalScore` >= 60, 'D', 'F'))));
select * from `register`;


#실습 3-11 점수가 큰 순서로 정렬
select * from `register` order by `regTotalScore` desc;


#실습 3-12 강좌번호가 349번이면서, 총점이 가장 큰 순서로 조회
select * from `register` where `regLecNo` = 349 order by `regtotalScore` desc;


#실습 3-13 30시간 이상인 강좌 조회
select * from `lecture` where `lecTime` >= 30;


#실습 3-14 강좌명과 강의실 조회
Select `lecName`, `lecClass` from `lecture`;


#실습 3-15 학번과 이름 조회
select `stdNo`, `stdName` from `Student`;


#실습 3-16 주소지 입력하지 않은 학생 조회
select * from `student` where `stdAddress` = 'Null';


#실습 3-17 부산에 거주하는 학생 조회
select * from `student` where `stdAddress` like '부산%';


#실습 3-18 학생과 수강 테이블 결합. 단, 점수 없이도 조회 O
select * from `student` as a 
left join `register` as b 
on a.stdNo = b.regStdNo;


#실습 3-19 
select
	`stdNo`,
    `stdName`,
    `regLecNo`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `student` as a, `register` as b where a.stdNo = b.regStdNo;


#실습 3-20 강좌번호 349를 수강신청한 학생의 이름과 학번 조회
select distinct `stdName` , `stdNo`, `regLecNo`
from `Student` as a
join `Register` as b
on a.stdNo = b.regStdNo
where `regLecNo` = 349;


#실습 3-21 학생별 수강신청 건수와 모든 수강과목의 전체 점수 합계, 평균 조회
select 
	`stdNo`,
    `stdName`,
    count(`stdNo`) as `수강신청 건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) as `평균`
from `Student` as a
join `Register` as b
on a.stdNo = b.regStdNo
group by `stdNo`;


#실습 3-22 수강 테이블과 강좌 테이블 결합
select * from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;


#실습 3-23 
select
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;


#실습 3-24 사회 복지 마케팅 강좌를 신청한 건수와 평균 조회
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `register` as a 
join `lecture` as b on a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';


#실습 3-25 A등급을 받은 학번과 강좌명을 조회
select
	`regStdNo`,
    `lecName`
from `register` as a
join `lecture` as b on a.regLecNo = b.lecNo
where `regGrade` = 'A';


#실습 3-26 학생 테이블과 수강테이블, 그리고 강좌 테이블 결합
select * from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo;


#실습 3-27
select
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
order by `regGrade` asc;


#실습 3-28 F 학점을 받은 학번과 이름, 수강과목명, 점수, 그리고 등급 조회
select
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade`='F';


#실습 3-29 학생별 이수 학점 조회. 단 F등급은 학점으로 인정되지 X
select
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as `이수학점`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` < 'F'
group by `stdNo`;


#실습 3-30 신청과목과 이수과목 조회. 단 F등급은 인정 X
select
	`stdNo`,
    `stdName`,
    group_concat(`lecName`)as`신청과목`,
    group_concat(if(`regTotalScore` >= 60, `lecName`, null)) as `이수과목`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` < 'F' group by `stdNo`;


