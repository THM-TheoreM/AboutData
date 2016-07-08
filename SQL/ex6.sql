use Exercise

select
部门ID,
sum(case 月份 when '一月份' then 业绩 else null end) as '一月份',
sum(case 月份 when '二月份' then 业绩 else null end) as '二月份',
sum(case 月份 when '三月份' then 业绩 else null end) as '三月份'
into #Temp
from 部门业绩表 group by 部门ID

select 部门名称,一月份,二月份,三月份 from #Temp,部门名称表 where #Temp.部门ID=部门名称表.部门ID
--这个程序展示了Excel中的数据透视表功能