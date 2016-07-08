use Project

select cno,COUNT(*) as count into #Temp from cs group by cno
select course.cname,count from #Temp,course where #Temp.cno=course.cno

--不能用下面的sql语句，因为虽然cno是主键（所以值唯一）但聚合函数认识不到这一点，
--所以group by course.cno后虽然course.cname也只有唯一值但不能作为一个字段（为防止可能的cno=1,cname='a'又有cno=1,cname='b'）
--select course.cname,COUNT(*) from course,cs where course.cno=cs.cno group by course.cno 