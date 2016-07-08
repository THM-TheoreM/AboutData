use Exercise
select subject,(case when score>=80 then '优秀' when score>=60 then '及格' else '不及格' end) as score from Score
--如果一定要横向输出，可用下面的语句，但不适合推广到有很多成绩的情况
/*select
(select (case when score>=80 then '优秀' when score>=60 then '及格' else '不及格' end) from Score where subject='语文') as 语文,
(select (case when score>=80 then '优秀' when score>=60 then '及格' else '不及格' end) from Score where subject='数学') as 数学,
(select (case when score>=80 then '优秀' when score>=60 then '及格' else '不及格' end) from Score where subject='英语') as 英语*/