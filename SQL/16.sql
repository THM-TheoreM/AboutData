use Exercise
select * from fruit a where not exists (select * from fruit where a.Id=Id and Date>a.Date)
--Date����ֱ�ӱȽϲ���DATEDIFF