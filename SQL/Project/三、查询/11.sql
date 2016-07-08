use Project

--方一：嵌套查询
select * from student where dept=(select dept from student where sname='张三')

--方二：连接查询
--select b.* from student a,student b where a.sname='张三' and a.dept=b.dept