#실습 2-1
create database `bank`;
create user 'bank'@'%' identified by '1234';
grant all privileges on bank.* to  'bank'@'%';
flush privileges;

#실습 2-2
create table `bank_customer`(`c_no` 	VARCHAR(14) PRIMARY KEY,
							`c_name`	VARCHAR(20) NOT NULL,
                            `c_dist`	INT NOT NULL,
                            `c_phone`	VARCHAR(20) NOT NULL,
                            `c_addr`	VARCHAR(100) DEFAULT NULL
                            );

#실습 2-3


#실습 2-4


#실습 2-5


#실습 2-6



#실습 2-7



#실습 2-8


#실습 2-9


#실습 2-10


#실습 2-11


#실습 2-12


#실습 2-14


#실습 2-15


#실습 2-16


#실습 2-17


#실습 2-18


#실습 2-19


#실습 2-20


#실습 2-21


#실습 2-22


#실습 2-23


#실습 2-24


#실습 2-25


#실습 2-26


#실습 2-27


#실습 2-28


#실습 2-29


#실습 2-30




