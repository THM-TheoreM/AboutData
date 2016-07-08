use Project

--嵌套的exists可以做出连表的效果
select sname from student where not exists
(select * from course where not exists (select * from cs where cs.sno=student.sno and cs.cno=course.cno))