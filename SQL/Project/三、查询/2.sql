use Project

--方一：分为两个区间用or连接
select sname,dept,age from student where age<20 or age>23

--方二：灵活运用not
--select sname,dept,age from student where age not between 20 and 23