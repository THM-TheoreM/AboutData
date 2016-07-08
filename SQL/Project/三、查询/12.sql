use Project

--all：
select sname,age from student where age<all(select age from student where dept='信息系')

--聚合函数：
--select sname,age from student a where age<(select MIN(age) from student where dept='信息系')