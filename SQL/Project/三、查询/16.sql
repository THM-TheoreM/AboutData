use Project

--Ƕ�׵�exists�������������Ч��
select sname from student where not exists
(select * from course where not exists (select * from cs where cs.sno=student.sno and cs.cno=course.cno))