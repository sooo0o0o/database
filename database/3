#날짜 : 2025/01/07
#이름 : 곽혜수
#내용 : 3장 테이블 제약조건


#실습 3-1 기본키 연습하기 (중복 X)
Create TABLE `User2` (
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(50)
    );
    
#실습 3-2 
insert into `user2` values ('A101','김유신','1990-02-03','김해');
insert into `user2` values ('A102','김춘추','1991-02-03','경주');
insert into `user2` values ('A102','장보고','1992-02-03','완도');

select*from `User2`;


#실습 3-3 고유키 실습하기 (NULL 값 허용)
    CREATE TABLE `User3` (
		`uid` VARCHAR(10) PRIMARY KEY,
        `name` VARCHAR(10),
        `birth` CHAR(10),
        `hp` CHAR(13) UNIQUE,
        `addr` VARCHAR(50)
        );
        
#실습 3-4 데이터 추가하기
INSERT INTO `USER3` VALUES ('A101', '김유신', '1990-01-01', '010-1001-1001', '김해');
INSERT INTO `USER3` VALUES ('A102', '김춘추', '1991-01-01', '010-1001-1002', '경주');
INSERT INTO `USER3` VALUES ('A103', '장보고', '1992-01-01', '010-1001-1003', '완도');
INSERT INTO `USER3` VALUES ('A104', '강감찬', '1993-01-01', null, '서울');
INSERT INTO `USER3` VALUES ('A105', '이순신', '1994-01-01', null, '부산');
SELECT*FROM `USER3`;


#실습 3-5외래키 실습하기 (중복 허용)
 CREATE TABLE `Parent` (
	`pid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(100)
    );
    
 CREATE TABLE `Child` (
	`cid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `hp` CHAR(13) UNIQUE,
    `parent` VARCHAR(10),
    FOREIGN KEY (`parent`) REFERENCES `parent` (`pid`)
    );
    
#실습 3-6 데이터 추가하기
INSERT INTO `Parent` VALUES ('P101','김유신','1968-05-09','경남 김해시');
INSERT INTO `Parent` VALUES ('P102','김춘추','1972-11-23','경남 경주시');
INSERT INTO `Parent` VALUES ('P103','장보고','1978-03-01','전남 완도시');
INSERT INTO `Parent` VALUES ('P104','강감찬','1979-08-16','서울시 관악구');
INSERT INTO `Parent` VALUES ('P105','이순신','1981-05-23','부산시 진구');

INSERT INTO `Child` VALUES ('C101','김철수','010-1234-1001','P101');
INSERT INTO `Child` VALUES ('C102','김영희','010-1234-1002','P101');
INSERT INTO `Child` VALUES ('C103','강철수','010-1234-1003','P103');
INSERT INTO `Child` VALUES ('C104','이철수','010-1234-1004','P105');

SELECT * FROM `Child`;	#참조값 외에 데이터가 포함되면 입력이 되지 X


#실습 3-7 DEFAULT 와 NOT NULL (옵션)
CREATE TABLE `User4`(
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1),
    `age` INT DEFAULT 1,
    `hp` CHAR(13) UNIQUE,
    `addr` VARCHAR(20)
    );

#실습 3-8 데이터 추가하기
INSERT INTO `User4` VALUES('A101','김유신','M',21,'010-1234-1001','김해');
INSERT INTO `User4` VALUES('A102','김춘추','M',20,'010-1234-1002','경주');
INSERT INTO `User4` VALUES('A103','장보고','M',31,'010-1234-1003','완도');
INSERT INTO `User4` SET 
					`uid` = 'A104',
                    `name` = '신사임당',
                    `gender` = 'F',
                    `addr` = '강릉';
					
SELECT * FROM `User4`;


#실습 3-9 CHECK 와 AUTO_INCREMENT
CREATE TABLE `User5`(
	`seq` INT PRIMARY KEY AUTO_INCREMENT,	#고유키를 설정하기 위해 제약? 기능?을 추가
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1) CHECK (`gender` IN ('M','F')),
    `age` INT DEFAULT 1 CHECK (`age` > 0 AND `age` <100),
    `addr` VARCHAR(20)
    );

#실습 3-10 데이터 추가하기
INSERT INTO `User5` (`name`,`gender`,`age`,`addr`) VALUES('김유신','M',25,'김해');
INSERT INTO `User5` (`name`,`gender`,`age`,`addr`) VALUES('김춘추','M',24,'경주');
INSERT INTO `User5` (`name`,`gender`,`age`,`addr`) VALUES('장보고','M',35,'완도');
INSERT INTO `User5` (`name`,`gender`,`age`,`addr`) VALUES('허난설현','F',21,'광주');
INSERT INTO `User5` (`name`,`gender`,`age`,`addr`) VALUES('신사임당','F',25,'강릉');

#INSERT INTO `User5` (`name`,`gender`,`age`,`addr`) VALUES('허난설현','F',-1,'김해'); 
# -> 나이가 범위밖이라 입력되지 X

#데이터 갯수와 컬럼 갯수가 맞지 않으면 대입이 되지 X

SELECT * FROM `User5`;