use Exercise
select distinct ���� from �ɼ��� where ���� not in(select ���� from �ɼ��� where ����<=80)
--�������չʾ��not, in, ����select���÷�

--��һ�ַ���
/*
select ���� from �ɼ��� group by ���� having min(����)>80
*/
--�������ϰ��group by������Ϊhaving ����where