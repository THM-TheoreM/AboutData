use Exercise
select subject,(case when score>=80 then '����' when score>=60 then '����' else '������' end) as score from Score
--���һ��Ҫ��������������������䣬�����ʺ��ƹ㵽�кܶ�ɼ������
/*select
(select (case when score>=80 then '����' when score>=60 then '����' else '������' end) from Score where subject='����') as ����,
(select (case when score>=80 then '����' when score>=60 then '����' else '������' end) from Score where subject='��ѧ') as ��ѧ,
(select (case when score>=80 then '����' when score>=60 then '����' else '������' end) from Score where subject='Ӣ��') as Ӣ��*/