#날짜 : 2025.02.17
#이름 : 곽혜수
#내용 : 게시판 프로젝트 테이블 설계

-- 데이터 베이스 생성
DROP DATABASE IF EXISTS `board`;
CREATE DATABASE `board`;
USE `board`;

-- 사용자 생성 및 권한 부여
DROP USER IF EXISTS `board`@`%`;
CREATE USER 'board'@'%' IDENTIFIED BY '823155';
GRANT ALL PRIVILEGES ON `board`.* TO 'board'@'%';

FLUSH PRIVILEGES;


-- User 테이블
CREATE TABLE `User`(
	`uid`			VARCHAR(20) PRIMARY KEY,
	`pass`		VARCHAR(100),
	`name`		VARCHAR(20),
	`nick`		VARCHAR(20) UNIQUE,
	`email`		VARCHAR(50) UNIQUE,
	`hp`			CHAR(13) UNIQUE,
	`role`		VARCHAR(20) DEFAULT 'USER',
	`zip`			CHAR(5),
	`addr1`		VARCHAR(100),
	`addr2`		VARCHAR(100),
	`regip`		VARCHAR(100),
	`regDate`	DATETIME,
	`leaveDate`	DATETIME
);

-- terms 테이블
CREATE TABLE `Terms`(
	`no`			INT PRIMARY KEY AUTO_INCREMENT,
	`terms`		TEXT,
	`privacy`	TEXT
);

-- article 테이블
CREATE TABLE `Article`(
	`no`		INT AUTO_INCREMENT PRIMARY KEY,
	`cate`	VARCHAR(20) DEFAULT 'free',
	`title`	VARCHAR(100) NOT NULL,
	`content`TEXT NOT NULL,
	`comment`INT DEFAULT 0,
	`file`	TINYINT DEFAULT 0,
	`hit`		INT DEFAULT 0,
	`writer`	VARCHAR(20) NOT NULL,
	`regip`	VARCHAR(100) NOT NULL,
	`wdate`	DATETIME,
	FOREIGN KEY (`writer`) REFERENCES `User` (`uid`)
);

-- comment 테이블
CREATE TABLE `Comment`(
	`cno`		INT AUTO_INCREMENT PRIMARY KEY,
	`parent`	INT NOT NULL,
	`content`TEXT NOT NULL,
	`writer`	VARCHAR(20) NOT NULL,
	`regip`	VARCHAR(100) NOT NULL,
	`wdate`	DATETIME,
	FOREIGN KEY (`writer`) REFERENCES `User` (`uid`),
	FOREIGN KEY (`parent`) REFERENCES `Article` (`no`)
);

-- file 테이블
CREATE TABLE `File`(
	`fno`		INT AUTO_INCREMENT PRIMARY KEY,
	`ano`		INT NOT NULL,
	`oName`	VARCHAR(100) NOT NULL,
	`sName`	VARCHAR(100) NOT NULL,
	`download`INT,
	`rdate`	DATETIME,
	FOREIGN KEY (`ano`) REFERENCES `Article` (`no`)
);

SELECT 
	a.*,
	u.`nick` 
from `article` AS a 
join `user` as u on a.writer = u.uid
ORDER BY `no` DESC
LIMIT 10;

SELECT COUNT(*) FROM `article`;

INSERT INTO `article` (`title`, `content`, `writer`, `regip`, `wdate`)
SELECT `title`, `content`, `writer`, `regip`, `wdate` FROM `article`;

SELECT * FROM `article` WHERE `no`='3'; #문자열로도 조회 가능

SELECT
	 a.*,
	 f.*,
	 u.nick
FROM `article` as a
LEFT JOIN `file` AS f ON a.no = f.ano
JOIN `user` AS u ON a.writer = u.uid
WHERE a.`no`='3';

UPDATE `file` SET `download` = `download` + 1 WHERE `fno`=4;