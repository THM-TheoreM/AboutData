use Project

--group by条件用having而不是where，且条件中可以用聚合函数
--因为having条件顺序在group by后做
select sno,COUNT(cno) as 'number of courses' from cs group by sno having COUNT(cno)>3