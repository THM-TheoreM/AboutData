use Project

--��һ�����ñ�student���ֶ�sno���������ʣ����ƣ���ѧ�������ȽϷ��㣬�������ܼ򵥽�sno��Ϊsname���õ����
select sno from student where sno in (select sno from cs)

--���������ñ�cs���ֶ�sno+cno����������
--select distinct sno from cs