use Project

--all��
select sname,age from student where age<all(select age from student where dept='��Ϣϵ')

--�ۺϺ�����
--select sname,age from student a where age<(select MIN(age) from student where dept='��Ϣϵ')