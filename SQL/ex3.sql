use Exercise
select 
Date,
SUM(case when Result='ʤ' then 1 else 0 end) as ʤ,
SUM(case when Result='��' then 1 else 0 end) as �� 
from Match group by Date
--��Ҫ�õ�group by��case���÷�