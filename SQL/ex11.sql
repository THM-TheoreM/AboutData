use Exercise

--Match_copy不存在
select * into Match_copy from Match

--CUSTOMERS_copy已经存在
--insert into Match_copy select * from Match

--这个程序强调select into只能创建新表，不能添加到已有表中去