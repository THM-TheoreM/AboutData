use Exercise
select 
Date,
SUM(case when Result='胜' then 1 else 0 end) as 胜,
SUM(case when Result='负' then 1 else 0 end) as 负 
from Match group by Date
--主要用到group by和case的用法