use Project
create table student
(
sno int primary key,
sname varchar(20) not null,
sex varchar(10) check(sex in ('男','女')),
dept varchar(20) check(dept in ('信息系','计算机科学系','数学系','管理系','中文系','外语系','法学系')),
birth date,
age smallint check(age between 0 and 100)
)
--数据有效性的对应SQL语句，in、between的使用