use Project

--exists�е�������any���������жϡ����С�����������ʱҪ�任Ϊnot exists
select distinct sno from cs x where not exists
(select * from cs y where y.sno='10102' and not exists (select * from cs z where z.sno=x.sno and z.cno=y.cno))
