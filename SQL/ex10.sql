use Exercise
--�����ͳ�
--select a.name+'  vs  '+b.name from department a,department b where a.name!=b.name
--�������ͳ�
select a.name as 'Team A',b.name as 'Team B' from department a,department b where a.name<b.name
--��������õ����ַ�����"<"�Ƚ�