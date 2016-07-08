use Project

--方一：利用表student中字段sno的主键性质，优势：查学生姓名比较方便，方二不能简单将sno变为sname即得到结果
select sno from student where sno in (select sno from cs)

--方二：利用表cs中字段sno+cno的主键性质
--select distinct sno from cs