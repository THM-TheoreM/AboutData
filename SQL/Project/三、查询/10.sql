use Project

--ע��0ѧ�ֵ�ͬѧҲҪ��ʵ0�����Ǻ��ԣ�union�÷�
select sno,SUM(course) as credits from cs,course where cs.cno=course.cno group by sno
union
select sno,0 as credits from student where sno not in (select sno from cs)