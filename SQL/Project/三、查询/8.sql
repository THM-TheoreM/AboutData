use Project

select cno,COUNT(*) as count into #Temp from cs group by cno
select course.cname,count from #Temp,course where #Temp.cno=course.cno

--�����������sql��䣬��Ϊ��Ȼcno������������ֵΨһ�����ۺϺ�����ʶ������һ�㣬
--����group by course.cno����Ȼcourse.cnameҲֻ��Ψһֵ��������Ϊһ���ֶΣ�Ϊ��ֹ���ܵ�cno=1,cname='a'����cno=1,cname='b'��
--select course.cname,COUNT(*) from course,cs where course.cno=cs.cno group by course.cno 