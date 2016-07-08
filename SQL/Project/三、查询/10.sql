use Project

--注意0学分的同学也要现实0而不是忽略；union用法
select sno,SUM(course) as credits from cs,course where cs.cno=course.cno group by sno
union
select sno,0 as credits from student where sno not in (select sno from cs)