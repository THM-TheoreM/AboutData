use Exercise
select ID,NAME from A where exists (select * from B where A.ID=B.AID)
--���ؽ��Ϊ������1,A1���͡�2,A2��
/*
exists��ʾ����where֮ǰ�����ݣ��������exists����������������
���select����൱�����������жϣ�
��A�е�һ�����ݣ�select ID,NAME from A WHERE exists (select * from B where B.AID=1)
��A�еڶ������ݣ�select ID,NAME from A WHERE exists (select * from B where B.AID=2)
��A�е��������ݣ�select ID,NAME from A WHERE exists (select * from B where B.AID=3)
*/