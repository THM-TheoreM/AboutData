use Exercise

select
����ID,
sum(case �·� when 'һ�·�' then ҵ�� else null end) as 'һ�·�',
sum(case �·� when '���·�' then ҵ�� else null end) as '���·�',
sum(case �·� when '���·�' then ҵ�� else null end) as '���·�'
into #Temp
from ����ҵ���� group by ����ID

select ��������,һ�·�,���·�,���·� from #Temp,�������Ʊ� where #Temp.����ID=�������Ʊ�.����ID
--�������չʾ��Excel�е�����͸�ӱ���