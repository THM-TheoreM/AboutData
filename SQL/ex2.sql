create trigger InsertTrigger on 教师表 for insert as
begin
insert into 教师表_副本(教师编号,教师职称,教师年龄,教师薪金) values ((select 教师编号 from inserted),(select 教师职称 from inserted),(select 教师年龄 from inserted),(select 教师薪金 from inserted))
end
--除了inserted外还有deleted这样的动态变量用于获取数据
--这个程序用到了触发器的功能