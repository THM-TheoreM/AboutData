use Project

--方一：多重or连接
select sname,sex from student where dept='信息系' or dept='数学系' or dept='计算机科学系'

--方二：灵活运用in
--select sname,sex from student where dept in ('信息系','数学系','计算机科学系')

