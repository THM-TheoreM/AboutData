use Exercise
select a.year,SUM(b.Salary) as Salary from Salary a,Salary b where b.year<=a.year group by a.year
--���SQL���������Ǳ������Կ���һ����һ������ʵ�����Ӷ�ʵ���Լ����Լ����ѿ����˻�
/*
��һ��select����У���where�Ӿ䡢group by�־��having�Ӿ�ͬʱ������һ����ѯ��ʱ����ִ��˳�����£�
1.ִ��where�Ӿ�
2.��group by���з���
3.ִ�оۺϺ���
4.ִ��having�Ӿ�
*/
