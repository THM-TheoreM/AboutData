use Exercise
update 通话记录 set 通话时长=DATEDIFF(second,通话起始时间,通话结束时间)
--熟悉update语句和DATEDIFF函数