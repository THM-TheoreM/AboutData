use Project

--��һ��Ƕ�ײ�ѯ
select * from student where dept=(select dept from student where sname='����')

--���������Ӳ�ѯ
--select b.* from student a,student b where a.sname='����' and a.dept=b.dept