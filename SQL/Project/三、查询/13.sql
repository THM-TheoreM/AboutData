use Project

--any��ʹ�ã�Ϊ���ų���Ϣϵ��ѧ�������ټ�һ��dept!='��Ϣϵ'�����������ϸ񲻵�ʽ�µ�all��ͬ
select sname,age from student where age>any(select age from student where dept='��Ϣϵ') and dept!='��Ϣϵ'