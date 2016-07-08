use Project

--exists有点类似于any，所以在判断“所有”这样的条件时要变换为not exists
select distinct sno from cs x where not exists
(select * from cs y where y.sno='10102' and not exists (select * from cs z where z.sno=x.sno and z.cno=y.cno))
