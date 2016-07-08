use Project
create table cs
(
sno int references student(sno),
cno varchar(10) references course(cno),
cj smallint check(cj between 0 and 100),
primary key(sno,cno)
)
--外键的定义；多字段作为主键；外键可以通过“设计”→右键“关系”→点开“表和列规范”的“+”查询