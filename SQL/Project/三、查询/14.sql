use Project

--嵌套查询
select sname from student where sno in (select sno from cs where cno='C4')

--连接查询
--select sname from student,cs where student.sno=cs.sno and cno='C4'