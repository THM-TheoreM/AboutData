use Exercise
select a.year,SUM(b.Salary) as Salary from Salary a,Salary b where b.year<=a.year group by a.year
--这个SQL语句告诉我们表名可以看做一个类一样进行实例化从而实现自己和自己做笛卡尔乘积
/*
在一个select语句中，当where子句、group by字句和having子句同时出现在一个查询中时，其执行顺序如下：
1.执行where子句
2.由group by进行分组
3.执行聚合函数
4.执行having子句
*/
