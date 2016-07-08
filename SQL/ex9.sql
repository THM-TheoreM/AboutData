use Exercise
--/*
delete from 学生表 where 自动编号 not in(select min(自动编号) from 学生表 group by 学号,姓名,课程编号,课程名称,分数)
select * from 学生表
--*/

--辅助插入信息，方便测试：
/*
delete from 学生表
insert into 学生表(学号,姓名,课程编号,课程名称,分数) values('2005001','张三','0001','数学',69)
insert into 学生表(学号,姓名,课程编号,课程名称,分数) values('2005002','李四','0001','数学',89)
insert into 学生表(学号,姓名,课程编号,课程名称,分数) values('2005001','张三','0001','数学',69)
select * from 学生表
*/

--这个程序帮助理解select ? from TABLENAME group by KEYNAME1,......中?不一定要在KEYNAME1,......中出现，只要是一个唯一值而不是多值即可