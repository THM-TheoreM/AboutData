use Project

--interset
/*
select student.* from student,cs where cs.sno=student.sno and cno='C1'
intersect
select student.* from student,cs where cs.sno=student.sno and cno='C2'
*/

--in
/*
select * from student where 
sno in(select sno from cs where cno='C1')
and 
sno in(select sno from cs where cno='C2')
*/

--exists支持跨表查询
/*
select * from student where exists 
(select * from cs where student.sno=cs.sno and cno='C1' and sno in(select sno from cs where cno='C2'))
*/