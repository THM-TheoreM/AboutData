use Project

--Ƕ�ײ�ѯ
select sname from student where sno in (select sno from cs where cno='C4')

--���Ӳ�ѯ
--select sname from student,cs where student.sno=cs.sno and cno='C4'