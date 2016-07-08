use Exercise
select distinct 姓名 from 成绩表 where 姓名 not in(select 姓名 from 成绩表 where 分数<=80)
--这个程序展示了not, in, 复合select的用法

--另一种方法
/*
select 姓名 from 成绩表 group by 姓名 having min(分数)>80
*/
--这个程序复习了group by的条件为having 而非where