use Project
create table student
(
sno int primary key,
sname varchar(20) not null,
sex varchar(10) check(sex in ('��','Ů')),
dept varchar(20) check(dept in ('��Ϣϵ','�������ѧϵ','��ѧϵ','����ϵ','����ϵ','����ϵ','��ѧϵ')),
birth date,
age smallint check(age between 0 and 100)
)
--������Ч�ԵĶ�ӦSQL��䣬in��between��ʹ��