use Exercise
--/*
delete from ѧ���� where �Զ���� not in(select min(�Զ����) from ѧ���� group by ѧ��,����,�γ̱��,�γ�����,����)
select * from ѧ����
--*/

--����������Ϣ��������ԣ�
/*
delete from ѧ����
insert into ѧ����(ѧ��,����,�γ̱��,�γ�����,����) values('2005001','����','0001','��ѧ',69)
insert into ѧ����(ѧ��,����,�γ̱��,�γ�����,����) values('2005002','����','0001','��ѧ',89)
insert into ѧ����(ѧ��,����,�γ̱��,�γ�����,����) values('2005001','����','0001','��ѧ',69)
select * from ѧ����
*/

--�������������select ? from TABLENAME group by KEYNAME1,......��?��һ��Ҫ��KEYNAME1,......�г��֣�ֻҪ��һ��Ψһֵ�����Ƕ�ֵ����