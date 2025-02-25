`user`#제목 검색
SELECT * FROM `article` WHERE `title` LIKE '%파일%';

#내용 검색
SELECT * FROM `artocle` WHERE `content` LIKE '%파일%';

#글쓴이 검색
SELECT
	a.*,
	u.`nick`
FROM `article` AS a
JOIN `user` AS u ON a.writer = u.uid
WHERE `nick` LIKE '%파일%'
ORDER BY `no` DESC
LIMIT ?,10;

SELECT 
	COUNT(*) 
FROM `article` as a
JOIN `user` AS u ON a.writer = u.uid
WHERE `nick` LIKE '%ky%';