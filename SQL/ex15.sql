use Exercise
select ID,NAME from A where exists (select * from B where A.ID=B.AID)
--返回结果为两条“1,A1”和“2,A2”
/*
exists表示遍历where之前的数据，如果满足exists条件则输出否则不输出
这个select语句相当于做了三个判断：
对A中第一条数据：select ID,NAME from A WHERE exists (select * from B where B.AID=1)
对A中第二条数据：select ID,NAME from A WHERE exists (select * from B where B.AID=2)
对A中第三条数据：select ID,NAME from A WHERE exists (select * from B where B.AID=3)
*/