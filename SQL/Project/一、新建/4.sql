use Project
create table cs
(
sno int references student(sno),
cno varchar(10) references course(cno),
cj smallint check(cj between 0 and 100),
primary key(sno,cno)
)
--����Ķ��壻���ֶ���Ϊ�������������ͨ������ơ����Ҽ�����ϵ�����㿪������й淶���ġ�+����ѯ